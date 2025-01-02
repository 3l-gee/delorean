import re
from collections import Counter

def syllabify(word):
    """Split word into syllables using basic rules."""
    word = re.sub(r'[^a-zA-Z]', '', word)
    word = word.lower()
    vowels = "aeiou"
    syllables = []
    syllable = ""
    
    for char in word:
        syllable += char
        if char in vowels:
            if len(syllable) > 1 and syllable[-2] not in vowels:
                syllables.append(syllable)
                syllable = ""
    
    if syllable:
        syllables.append(syllable)
    
    return syllables

def create_acronym(word):
    word_clean = word.strip().lower()  # Clean the word and lowercase

    if len(word_clean) < 4:
        return word

    
    syllables = syllabify(word_clean)

    if len(syllables) == 1:
        return word
    
    acronym = ""
    
    acronym += syllables[0][0].upper()
    
    for syllable in syllables[1:]:
        if len(acronym) < 3:
            acronym += syllable[0]
    
    while len(acronym) < 3 and syllables:
        for syllable in syllables:
            if len(acronym) < 3:
                acronym += syllable[1] if len(syllable) > 1 else syllable[0]
    
    return acronym[:3]

def count_word_frequency(file_paths):
    """
    Reads one or more documents and outputs how often each word is used.

    :param file_paths: List of paths to the documents to be analyzed.
    """
    overall_word_count = Counter()

    for file_path in file_paths:
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                text = file.read()

            words = re.findall(r'name="([A-Z][a-zA-Z0-9]*)"', text)
            res = []

            for word in words:
                split_words = re.split(r'([A-Z][a-z0-9]*)', word)
                split_words = [w for w in split_words if len(w) >= 3]
                res += split_words
            
            overall_word_count.update(res)

        except FileNotFoundError:
            print(f"Error: The file at {file_path} was not found.")
        except Exception as e:
            print(f"An error occurred while processing {file_path}: {e}")

    print("Overall Word Frequencies:")
    # for word, count in overall_word_count.most_common():
    #     print(f"{word}: {create_acronym(word)}")

# Example usage
if __name__ == "__main__":
    file_paths = [
        "schema/aixm5_1_1/aixm/AIXM_Features.xsd",
        "schema/aixm5_1_1/aixm/AIXM_DataTypes.xsd",
        "schema/aixm5_1_1/aixm/AIXM_AbstractGML_ObjectTypes.xsd",
        "schema/aixm5_1_1/aixm/message/AIXM_BasicMessage.xsd",
        ]
    count_word_frequency(file_paths)
