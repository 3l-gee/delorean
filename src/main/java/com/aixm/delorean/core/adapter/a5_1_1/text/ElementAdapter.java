package com.aixm.delorean.core.adapter.a5_1_1.text;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.StringReader;
import java.io.StringWriter;
import javax.xml.parsers.DocumentBuilder;
import org.xml.sax.InputSource;

public class ElementAdapter extends XmlAdapter<String, Element> {

    @Override
    public Element unmarshal(String v) throws Exception {
        if (v == null || v.isEmpty()) {
            return null;
        }
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        DocumentBuilder builder = factory.newDocumentBuilder();
        return builder.parse(new InputSource(new StringReader(v))).getDocumentElement();
    }

    @Override
    public String marshal(Element v) throws Exception {
        if (v == null) {
            return null;
        }
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        transformer.setOutputProperty(OutputKeys.INDENT, "no");
        StringWriter writer = new StringWriter();
        transformer.transform(new DOMSource(v), new StreamResult(writer));
        return writer.toString();
    }
}
