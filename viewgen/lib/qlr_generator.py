import random
import string
from lxml import etree
import re
import uuid
import copy
from lib.generic_helper_function import GenericHeleperFunction

class QLRGenerator:
        
    def __init__(self, input_path):

        self.input_path = input_path

        # Template
        self.geom_map_layer_template = GenericHeleperFunction.load_xml(self.input_path, "xml/geom-maplayer.xml")
        self.table_map_layer_template = GenericHeleperFunction.load_xml(self.input_path, "xml/table-maplayer.xml")
        self.layer_tree_layer_template = GenericHeleperFunction.load_xml(self.input_path, "xml/layer-tree-layer.xml")

        # Fragment
        self.label_style_template = GenericHeleperFunction.load_xml(self.input_path, "xml/labelStyle.xml")
        self.attribute_editor_container_template = GenericHeleperFunction.load_xml(self.input_path, "xml/attributeEditorContainer.xml")
        self.attribut_editor_field_template = GenericHeleperFunction.load_xml(self.input_path, "xml/attributeEditorField.xml")
        self.attribut_editor_html_element_template = GenericHeleperFunction.load_xml(self.input_path, "xml/attributeEditorHtmlElement.xml")
        self.alias_template = GenericHeleperFunction.load_xml(self.input_path, "xml/alias.xml")

    def genrate_publish_qlr(self, layer):
        output = []

        # Make sure the template loaded correctly
        if self.geom_map_layer_template is None:
            print("[ERROR] Layer template not loaded")
            return
        
        geometries = layer.publish.get("geometry", [])

        # If empty, default to [None]
        if geometries :
            for geom in geometries:
                 output.append(self._generate_publish_geom_layer(layer, geom))
        else :
            output.append(self._genrate_publish_table_layer(layer))

        return output

    def _genrate_publish_table_layer(self, layer):
        table_layer = copy.deepcopy(self.table_map_layer_template)
        layer_tree_layer = copy.deepcopy(self.layer_tree_layer_template)
        
        name = layer.name
        schema = layer.get_schema()
        layer_type = layer.get_layer_type()

        # Format name 
        layer_tree_layer.set("name", name)

        # Format id
        id = self._qlr_gen_id(name)
        table_layer.find(".//id").text = id
        layer_tree_layer.set("id", id)

        # Format layername
        table_layer.find(".//layername").text = f"{name}"
        
        # Format datasource
        datasource = self._qlr_gen_datasource(schema, name, layer_type)
        table_layer.find(".//datasource").text = datasource
        layer_tree_layer.set("source", datasource.replace('"',"&quot"))

        # Format qgis form
        attribute_edit_form = table_layer.find(".//attributeEditorForm")
        table_layer.remove(attribute_edit_form)
        table_layer.append(self._generate_form(layer, attribute_edit_form))

        # aliases = table_layer.find(".//aliases")
        # table_layer.remove(aliases)
        # table_layer.append(self.generate_aliases(aliases))

        return ({
            "id" : id,
            "datasource" : datasource,
            "layer" : table_layer,
            "layertree" : layer_tree_layer,
            })

    def _generate_publish_geom_layer(self, layer,  geom):
        map_layer = copy.deepcopy(self.geom_map_layer_template)
        layer_tree_layer = copy.deepcopy(self.layer_tree_layer_template)

        name = layer.get_name
        schema = layer.get_schema()
        layer_type = layer.get_layer_type()

        id = self._qlr_gen_id(name)
        role = geom.get("role")
        goemtry_type = geom.get("geometrytype")

        # Format maplayer
        map_layer.set("geometry", goemtry_type)
        map_layer.set("wkbType", goemtry_type)

        # Format name 
        layer_tree_layer.set("name", name)

        # Format id
        map_layer.find(".//id").text = id
        layer_tree_layer.set("id", id)

        # Format layername
        map_layer.find(".//layername").text = f"{name} ({role})"
        
        # Format datasource
        datasource = self._qlr_gen_datasource(schema, name, layer_type, role)
        map_layer.find(".//datasource").text = datasource
        layer_tree_layer.set("source", datasource.replace('"',"&quot"))

        # Format qgis form
        attribute_edit_form = map_layer.find(".//attributeEditorForm")
        map_layer.remove(attribute_edit_form)
        map_layer.append(self._generate_form(layer, attribute_edit_form))

        return ({
            "id" : id,
            "datasource" : datasource,
            "layer" : map_layer,
            "layertree" : layer_tree_layer,
            })
    
    def _generate_form(self, layer, attribut_edit_form):
        copy_label_style = copy.deepcopy(self.label_style_template)
        attribut_edit_form.append(copy_label_style)

        feature_attribute_editor_container = copy.deepcopy(self.attribute_editor_container_template)
        feature_attribute_editor_container.set("name", "feature")
        feature_attribute_editor_container.append(copy_label_style)

        tab_list = []

        index = 0

        for role, fields in layer.publish["form"].items():
            if role in ["generic", "attributes"] or role in ["annotation"]:
                group_attribute_editor_container = copy.deepcopy(self.attribute_editor_container_template)
                group_attribute_editor_container.set("name", role)
                group_attribute_editor_container.set("groupBox", "1")
                group_attribute_editor_container.append(copy_label_style)


                for field in fields:
                    group_attribute_editor_container.append(self._genrate_field_generic(index, field))
                    index+=1

                feature_attribute_editor_container.append(group_attribute_editor_container)
            
            else :
                attribute_editor_container = copy.deepcopy(self.attribute_editor_container_template)
                attribute_editor_container.set("name", role)
                attribute_editor_container.append(copy_label_style)

                for field in fields : 
                    attribute_editor_container.append(self._genrate_field_generic(index, field))
                    index+=1

                tab_list.append(attribute_editor_container)
            
        attribut_edit_form.append(feature_attribute_editor_container)
        attribut_edit_form.extend(tab_list)
        return attribut_edit_form
        
    
    def _genrate_field_generic(self, index, field):
        copy_label_style = copy.deepcopy(self.label_style_template)

        if field.get("html") :
            html_node = copy.deepcopy(self.attribut_editor_html_element_template)
            html_node.set("name", field.get("field"))
            html_node.append(copy_label_style)

            # Load raw HTML file as string
            raw_html = GenericHeleperFunction.load_html(self.input_path, "html/annotation.html")

            raw_html = re.sub(r'to_json\(\s*annotation\s*\)', f"to_json({field.get('field')})", raw_html)

            wrapped = f"<#noparse>\n{raw_html}\n</#noparse>"

            if html_node[-1].tail is None:
                html_node[-1].tail = etree.CDATA(wrapped)
            else:
                html_node[-1].tail = etree.CDATA(wrapped)

            return html_node

        else :
            attribut_editor_field= copy.deepcopy(self.attribut_editor_field_template)
            attribut_editor_field.set("name", field.get("field"))
            attribut_editor_field.set("index", str(index))
            attribut_editor_field.append(copy_label_style)
            return attribut_editor_field
            
    def _qlr_gen_id(self, name):
        generated_uuid = str(uuid.uuid4())
        full_id = f"{name}_{generated_uuid}"
        return full_id

    def _qlr_gen_datasource(self, schema, name, layer_type, geom=None):
        res = ""
        res += "dbname='${ProjectConfig.dbname}' "
        res += "host=${ProjectConfig.host} "
        res += "port=${ProjectConfig.port} "
        res += "sslmode=disable "
        # Feature needs a row as primary key as we display the versions and thus id is not unique
        if layer_type == "feature" : 
            res += "key='row' "

        if layer_type == "property" : 
            res += "key='id' "

        res += "checkPrimaryKeyUnicity='1' "
        res += f'table="{schema}"."{name}_view" '
        if geom is None:
            return res
        else:
            res += f'({geom}_geom)'
        return res