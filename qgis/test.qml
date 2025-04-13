<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.34.8-Prizren" styleCategories="Forms">
  <fieldConfiguration>
    <field name="row">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="channel">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ghostfrequency">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="displace">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="designator">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="emissionclass">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="mobile">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="magneticvariation">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="magneticvariationaccuracy">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="datemagneticvariation">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="flightchecked">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="interpretation">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sequence_number">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="correction_number">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="valid_time_begin">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="valid_time_end">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="feature_lifetime_begin">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="feature_lifetime_end">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="monitoring">
      <editWidget type="JsonEdit">
        <config>
          <Option type="Map">
            <Option type="int" value="0" name="DefaultView"/>
            <Option type="int" value="0" name="FormatJson"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="annotation">
      <editWidget type="JsonEdit">
        <config>
          <Option type="Map">
            <Option type="int" value="0" name="DefaultView"/>
            <Option type="int" value="0" name="FormatJson"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="authority">
      <editWidget type="JsonEdit">
        <config>
          <Option type="Map">
            <Option type="int" value="0" name="DefaultView"/>
            <Option type="int" value="0" name="FormatJson"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="availability">
      <editWidget type="JsonEdit">
        <config>
          <Option type="Map">
            <Option type="int" value="0" name="DefaultView"/>
            <Option type="int" value="0" name="FormatJson"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
    geom = feature.geometry()
    control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
      <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
    </labelStyle>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="0" name="row" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="1" name="type" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="2" name="channel" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="3" name="ghostfrequency" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="4" name="displace" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="5" name="designator" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="6" name="name" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="7" name="emissionclass" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="8" name="mobile" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="9" name="magneticvariation" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="10" name="magneticvariationaccuracy" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="11" name="datemagneticvariation" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="12" name="flightchecked" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="13" name="interpretation" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="14" name="sequence_number" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="15" name="correction_number" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="16" name="valid_time_begin" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="17" name="valid_time_end" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="18" name="feature_lifetime_begin" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="19" name="feature_lifetime_end" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="10" verticalStretch="10" index="20" name="monitoring" showLabel="1">
      <labelStyle labelColor="255,129,33,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="21" name="annotation" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="22" name="authority" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" verticalStretch="0" index="23" name="availability" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" style="" description="Segoe UI,8,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="annotation"/>
    <field editable="1" name="authority"/>
    <field editable="1" name="availability"/>
    <field editable="1" name="channel"/>
    <field editable="1" name="correction_number"/>
    <field editable="1" name="datemagneticvariation"/>
    <field editable="1" name="designator"/>
    <field editable="1" name="displace"/>
    <field editable="1" name="emissionclass"/>
    <field editable="1" name="feature_lifetime_begin"/>
    <field editable="1" name="feature_lifetime_end"/>
    <field editable="1" name="flightchecked"/>
    <field editable="1" name="ghostfrequency"/>
    <field editable="1" name="interpretation"/>
    <field editable="1" name="magneticvariation"/>
    <field editable="1" name="magneticvariationaccuracy"/>
    <field editable="1" name="mobile"/>
    <field editable="1" name="monitoring"/>
    <field editable="1" name="name"/>
    <field editable="1" name="row"/>
    <field editable="1" name="sequence_number"/>
    <field editable="1" name="type"/>
    <field editable="1" name="valid_time_begin"/>
    <field editable="1" name="valid_time_end"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="annotation"/>
    <field labelOnTop="0" name="authority"/>
    <field labelOnTop="0" name="availability"/>
    <field labelOnTop="0" name="channel"/>
    <field labelOnTop="0" name="correction_number"/>
    <field labelOnTop="0" name="datemagneticvariation"/>
    <field labelOnTop="0" name="designator"/>
    <field labelOnTop="0" name="displace"/>
    <field labelOnTop="0" name="emissionclass"/>
    <field labelOnTop="0" name="feature_lifetime_begin"/>
    <field labelOnTop="0" name="feature_lifetime_end"/>
    <field labelOnTop="0" name="flightchecked"/>
    <field labelOnTop="0" name="ghostfrequency"/>
    <field labelOnTop="0" name="interpretation"/>
    <field labelOnTop="0" name="magneticvariation"/>
    <field labelOnTop="0" name="magneticvariationaccuracy"/>
    <field labelOnTop="0" name="mobile"/>
    <field labelOnTop="0" name="monitoring"/>
    <field labelOnTop="0" name="name"/>
    <field labelOnTop="0" name="row"/>
    <field labelOnTop="0" name="sequence_number"/>
    <field labelOnTop="0" name="type"/>
    <field labelOnTop="0" name="valid_time_begin"/>
    <field labelOnTop="0" name="valid_time_end"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="annotation"/>
    <field reuseLastValue="0" name="authority"/>
    <field reuseLastValue="0" name="availability"/>
    <field reuseLastValue="0" name="channel"/>
    <field reuseLastValue="0" name="correction_number"/>
    <field reuseLastValue="0" name="datemagneticvariation"/>
    <field reuseLastValue="0" name="designator"/>
    <field reuseLastValue="0" name="displace"/>
    <field reuseLastValue="0" name="emissionclass"/>
    <field reuseLastValue="0" name="feature_lifetime_begin"/>
    <field reuseLastValue="0" name="feature_lifetime_end"/>
    <field reuseLastValue="0" name="flightchecked"/>
    <field reuseLastValue="0" name="ghostfrequency"/>
    <field reuseLastValue="0" name="interpretation"/>
    <field reuseLastValue="0" name="magneticvariation"/>
    <field reuseLastValue="0" name="magneticvariationaccuracy"/>
    <field reuseLastValue="0" name="mobile"/>
    <field reuseLastValue="0" name="monitoring"/>
    <field reuseLastValue="0" name="name"/>
    <field reuseLastValue="0" name="row"/>
    <field reuseLastValue="0" name="sequence_number"/>
    <field reuseLastValue="0" name="type"/>
    <field reuseLastValue="0" name="valid_time_begin"/>
    <field reuseLastValue="0" name="valid_time_end"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <layerGeometryType>0</layerGeometryType>
</qgis>
