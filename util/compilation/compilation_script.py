import os
import re

adapters_config = []

rename_config = {
    "airportgroundservice_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "navaidequipment_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "propertieswithschedule_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "segmentpoint_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "service_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "navaidequipment_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "propertieswithschedule_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "marking_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "groundlightsystem_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "procedure_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "segmentleg_pg": f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "airportheliportprotectionarea_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "runwaydirection_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "runwaycentrelinepoint_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "runway_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "runwayvisualrange_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "rulesprocedures_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "arrestinggear_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
    "usagecondition_pg" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
}

class CompilationScript :

    def __init__(self, adapters_config, rename_config, directory) :
        self.adapters_config = adapters_config
        self.rename_config = rename_config
        self.directory = directory
        self.files = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]

    def run(self) :
        for file in self.files :
            data = self.open_file(self.directory + "/" + file)
            data = self.rename_columns(data)
            self.save_file(self.directory + "/" + file, data)


    def open_file(self, file_name) :
        data = []
        with open(file_name, 'r') as file :
            data = file.readlines()
        file.close()
        return data
    
    def save_file(self, file_name, data) :
        with open(file_name, 'w') as file :
            file.writelines(data)
        file.close()


    def rename_columns(self, data) :
        rename_dict = {}
        for line in data :
            for key, value in self.rename_config.items() :
                new = re.search(value, line)
                if new :
                    rename_dict[key] = new.group()
        
        new_data = []
        for line in data :
            for key, value in rename_dict.items() :
                if key in line:
                    line = line.replace(key, value)
            new_data.append(line)

        return new_data

compilationScript = CompilationScript(adapters_config, rename_config, "src/main/java/com/aixm/delorean/core/schema/a5_1/aixm")
compilationScript.run()

compilationScript = CompilationScript(adapters_config, rename_config, "src/main/java/com/aixm/delorean/core/schema/a5_1_1/aixm")
compilationScript.run()