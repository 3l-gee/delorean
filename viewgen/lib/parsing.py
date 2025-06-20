import re

class Parsing :
    def __init__(self, parsing_config):
        self.parsing = parsing_config
    
    def process_file(self, file_path):
        """Extract table, class, and column information from a Java file."""
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        table_match = re.search(self.parsing["table"]["method"], content)
        if not table_match:
            return  # Skip files that do not contain table annotations

        table_name, schema = table_match.groups()
        full_table_name = str(schema + "." + table_name)
        class_name = re.findall(self.parsing["class"]["method"], content) or [None]
        if class_name[0] in self.attributes["ignore"]:
            return  # Ignore specific classes
    
        self.views["table_name"][class_name[0]] = full_table_name

        feature_name = class_name[0]
        class_name = {
            "info": class_name[0],
            "table": full_table_name
        }
        parent_name = re.findall(self.parsing["extends"]["method"], content) or [None]
        
        if parent_name[0] in self.attributes["feature_parents"] :
            self.views["top_timeslice_selection"].append(full_table_name)


        columns = self.extract_columns(schema, table_name, content)
        parent_columns = self.extract_parent_columns(schema, table_name, parent_name)
        embedded_columns = self.extract_embedded_columns(schema, table_name, content)
        one_to_one = self.extract_one_to_one(schema, table_name, content)
        one_to_many = self.extract_one_to_many(schema, table_name, content)

        self.update_views(feature_name, class_name, parent_name, columns, parent_columns, embedded_columns, one_to_one, one_to_many)

        

    def extract_columns(self, schema, table, content):
        """Extract simple column definitions."""
        raw_columns = re.findall(self.parsing["column"]["method"], content)
        return [f"{schema}.{table}.{col}" for col in raw_columns]

    def extract_parent_columns(self, schema, table, parent_name):
        """Extract inherited columns from parent classes."""
        parent_columns = self.attributes["parents_attributes"].get(parent_name[0], [])
        return [f"{schema}.{table}.{col}" for col in parent_columns]

    def extract_embedded_columns(self, schema, table, content):
        """Extract embedded attributes (2 or 3 columns)."""
        embedded_columns = []
        raw_embedded_two = re.findall(self.parsing["embedded_two"]["method"], content)
        raw_embedded_three = re.findall(self.parsing["embedded_three"]["method"], content)

        for column in raw_embedded_two + raw_embedded_three:
            column_type = column[-1]
            for col_name in column[:-1]:  # Exclude the last element (which is the type)
                embedded_columns.append(f"{schema}.{table}.{col_name}")
        return embedded_columns

    def extract_one_to_one(self, schema, table, content):
        """Extract one-to-one relationships."""
        res = []
        raw_one_to_one = re.findall(self.parsing["one_to_one"]["method"], content)
        for col in raw_one_to_one:
            res.append({
                "source": f"{schema}.{table}",
                "alias": col[2],
                "join_condition": f"{schema}.{table}.{col[0]} = {col[2]}.{col[1]}"
            })
        return res

    def extract_one_to_many(self, schema, table, content):
        """Extract one-to-many relationships."""
        res = []
        raw_one_to_many = re.findall(self.parsing["one_to_many"]["method"], content)
        for col in raw_one_to_many:
            res.append({
                "source": f"{schema}.{table}",
                "alias": col[3],
                "join_table": f"{schema}.{col[0]}",
                "first_join": f"{schema}.{table}.id = {col[0]}.{col[1]}",
                "second_join" : f"{col[0]}.{col[2]} = {col[3]}.id"
            })
        return res