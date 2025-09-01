import './pages.css'
import { useState, useEffect, useRef } from "preact/hooks";
import Helmet from "preact-helmet";
import QgisIcon from "../../assets/qgis.svg";
import OsgiIcon from "../../assets/osgi.svg";
import AixmIcon from "../../assets/aixm.svg";
import PostgresqlIcon from "../../assets/postgresql.svg";
import { LinkIcon } from "../util/linkicon";

export function GML ({ onNavigate }) {
  
  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  <Helmet
    defaultTitle="Delorean AIXM"
    titleTemplate="%s - GML"
  >
    <title>GML</title>
    <meta 
      name="description" 
      content="Learn about GML (Geography Markup Language) support in Delorean AIXM. Understand how digital aeronautical data is structured, exchanged, and integrated with AIM and SWIM standards for aviation systems."
    />
    <meta 
      name="keywords" 
      content="Delorean, AIXM, GML, Geography Markup Language, Digital aeronautical data, AIM, SWIM, Open source, Aviation data"
    />
    <meta property="og:title" content="Delorean AIXM - GML" />
    <meta property="og:description" content="Explore how Delorean AIXM handles GML (Geography Markup Language) for digital aeronautical data, integrating with AIM and SWIM standards for modern aviation systems." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://delorean-aixm.io/features/gml" />
  </Helmet>
  <section className="space-y-4">
    <h1 className="text-4xl font-bold tracking-tight">Features</h1>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-1">
        <h2 className="text-4xl font-bold tracking-tight">AIXM-Compliant & Extensions</h2>
        <p>
          Delorean is fully OSGi-compliant, enabling seamless integration into modular 
          environments. It guarantees strict adherence to the official AIXM XML schemas while 
          simultaneously generating a consistent PostgreSQL data model. This dual compliance ensures 
          that aeronautical information can be loaded, queried, and extracted reliably across both 
          the XML layer and the database backend.
        </p>

        <p>
          The platform is designed for extensibility: common AIXM extensions are supported
          natively, and additional extensions can be integrated without friction, making Delorean
          future-proof and adaptable to evolving standards.
        </p>

        <p>
          Under the hood, Delorean leverages official XSD schema definitions to generate
          Java XML bindings enriched with persistence annotations. This approach enables automatic
          creation of the database schema while maintaining strict alignment with the AIXM specification.
        </p>

        <p className="border-l-4 pl-[10px] italic text-gray-700">
          Planned improvements will include support for aixm 5.1.1, 5.2 (wich is probably a few tweaks to codegen and viewgen away). 
          Furthermore, public extensions (event, asrn, ADR) and common private extensions will be suported.
        </p>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">
          <LinkIcon 
            label = "osgi.org"
            url = "https://www.osgi.org/"
            icon = {OsgiIcon}
          />
          <LinkIcon 
            label = "aixm.aero"
            url = "https://aixm.aero/"
            icon = {AixmIcon}
          />
          <LinkIcon 
            label = "ext.eurocontrol.int"
            url = "https://ext.eurocontrol.int/aixm_confluence/display/EXT"
            icon = {AixmIcon}
          />
          <LinkIcon 
            label = "aixm.aero/schema"
            url = "https://aixm.aero/schema/index.html"
            icon = {AixmIcon}
          />
        </ul>
      </div>
    </div>
  </section>
</main>
  );
}