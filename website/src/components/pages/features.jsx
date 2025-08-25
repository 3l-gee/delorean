import './pages.css'
import { useEffect, useRef } from "preact/hooks";
import QgisIcon from "../../assets/qgis.svg";
import OsgiIcon from "../../assets/osgi.svg";
import AixmIcon from "../../assets/aixm.svg";
import PostgresqlIcon from "../../assets/postgresql.svg";
import { LinkIcon } from "../util/linkicon";
export function Features() {

  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  {/* Features */}

  {/* Management */}
  <section className="space-y-4">
    <h1 className="text-4xl font-bold tracking-tight">Features</h1>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">OSGi-Compliant & Extensible</h2>
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
          Under the hood, Delorean leverages official <code>XSD</code> schema definitions to generate
          Java XML bindings enriched with persistence annotations. This approach enables automatic
          creation of the database schema while maintaining strict alignment with the AIXM specification.
        </p>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold">Learn More</h3>
        <ul className="learnmore-list">
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
        </ul>
      </div>
    </div>
  </section>


  {/* Visualize */}
  <section className="space-y-4">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
      <h2 className="text-4xl font-bold tracking-tight">QGIS Integration</h2>
      <p>
        Leveraging the robust QGIS and PostgreSQL ecosystem, Delorean
        creates views that combine temporal and geographic data, and automatically generates a QGIS
        project to display it. This project mirrors the AIXM structure as closely as possible, preserving
        feature groups and including all features and objects defined in the dataset. To simplify
        navigation, related features can be connected through QGIS actions, allowing users to move
        seamlessly through the AIXM tree directly within the map.
      </p>

      <p>
        Once inside QGIS, this representation of AIXM data becomes fully interactive. Users can take
        advantage of QGIS's wide range of tools to process, analyze, 
        transform, and publish aeronautical data into different formats
        or services. This turns static XML into actionable geospatial layers that fit naturally into
        existing GIS workflows.
      </p>

      <p>
        To achieve this, Delorean preprocesses the extended GML geometries found in AIXM
        before loading them into QGIS. AIXM relies on GML to express complex spatial constructs—
        including multi-geometries, polygons with holes, and temporally bounded shapes—that cannot be
        consumed directly by most GIS tools. Delorean translates these into 
        PostGIS-compatible geometries, ensuring that QGIS can render and manipulate them
        accurately while preserving both spatial precision and temporal context.
      </p>
    </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold">Learn More</h3>
        <ul className="learnmore-list">
          <LinkIcon 
            label = "qgis.org"
            url = "https://qgis.org/"
            icon = {QgisIcon}
          />
          <LinkIcon 
            label = "postgresql.org"
            url = "https://www.postgresql.org/"
            icon = {PostgresqlIcon}
          />
        </ul>
      </div>
    </div>
  </section>

  {/* Merge */}
  <section className="space-y-4">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
      <h2 className="text-4xl font-bold tracking-tight">Merges and Filter</h2>

      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold">Learn More</h3>
        <ul className="learnmore-list">
        </ul>
      </div>
    </div>
  </section>

   {/* Create */}
  <section className="space-y-4">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
      <h2 className="text-4xl font-bold tracking-tight">Create and Edit</h2>

      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold">Learn More</h3>
        <ul className="learnmore-list">
        </ul>
      </div>
    </div>
  </section>

  {/* Validate */}
  <section className="space-y-4">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
      <h2 className="text-4xl font-bold tracking-tight">Validate and Control</h2>

      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold">Learn More</h3>
        <ul className="learnmore-list">
        </ul>
      </div>
    </div>
  </section>


</main>
  );
}
