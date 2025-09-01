import './pages.css'
import { useState, useEffect, useRef } from "preact/hooks";
import Helmet from "preact-helmet";
import QgisIcon from "../../assets/qgis.svg";
import OsgiIcon from "../../assets/osgi.svg";
import AixmIcon from "../../assets/aixm.svg";
import PostgresqlIcon from "../../assets/postgresql.svg";
import { LinkIcon } from "../util/Linkicon";
import { Button } from '../button/button';

export function Features({ onNavigate }) {

  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  <Helmet
    defaultTitle="Delorean AIXM"
    titleTemplate="%s - Features"
  >
    <meta 
      name="description" 
      content="Explore the features and capabilities of Delorean AIXM, the open-source tool for managing AIXM and digital aeronautical data. Learn about its data modeling, AIM integration, SWIM compatibility, and developer tools."
    />
    <meta 
      name="keywords" 
      content="Delorean, AIXM, Features, Capabilities, Open source, AIM, Aeronautical data, SWIM, Aviation software"
    />
    <meta property="og:title" content="Delorean AIXM - Features" />
    <meta property="og:description" content="Discover Delorean AIXM features, from aeronautical data modeling to SWIM integration, for developers and aviation professionals." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://delorean-aixm.io/features" />
  </Helmet>
  <section className="space-y-4">
    <h1 className="text-4xl font-bold tracking-tight">Features</h1>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
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


  {/* Visualize */}
  <section className="space-y-4">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
      <h2 className="text-4xl font-bold tracking-tight">GML rendering & QGIS</h2>
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
      <div className="flex space-x-8">
        <Button 
          label="GML Rendering" 
          href="/features/gml" 
        />
        <Button 
          label="QGIS Interaction" 
          href="/features/qgis" 
        />
      </div>
    </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">
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
      <h2 className="text-4xl font-bold tracking-tight">Merges & Filter</h2>
        <p>
          At this time (v0.2.0), merges can only be performed between AIXM datasets, and the entire dataset is either merged or not. 
          Once merged, the datasets cannot be distinguished from each other.
        </p>

        <p>
          Currently (v0.2.0), there are no options to filter out data.
        </p>

        <p className="border-l-4 pl-[10px] italic text-gray-700">
          Planned improvements will include fine-grained options for merging, filtering, deleting, and migrating data. 
          This will allow users to divide the dataset into smaller, more manageable chunks based on feature type, temporality, 
          or geographic extent. In the AIXM context, such operations must also respect temporal consistency (sequence and correction numbers), 
          maintain feature identity across datasets, and preserve cross-feature relationships.
        </p>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">
        </ul>
      </div>
    </div>
  </section>

   {/* Create */}
  <section className="space-y-4">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
      <h2 className="text-4xl font-bold tracking-tight">Create & Edit</h2>
        <p>
          Currently (v0.2.0), there are no options to create or modify the loaded aixm data. 
        </p>


        <p className="border-l-4 pl-[10px] italic text-gray-700">
          Planned improvements include an editor integrated into the QGIS project, allowing users to create and 
          modify AIXM features while respecting validation rules, temporality, and feature-object relationships.
          This will likely be implemented through machine-generated trigger functions in PostgreSQL, which will 
          automatically copy, update, and increment the derived AIXM attributes and objects.
        </p>

      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">
          <LinkIcon 
            label = "aixm-temporality-1.0"
            url = "https://aixm.aero/sites/default/files/imce/AIXM51/aixm_temporality_1.0.pdf"
            icon = {AixmIcon}
          />
          <LinkIcon 
            label = "aixm-temporality-1.1"
            url = "https://aixm.aero/sites/default/files/imce/AIXM511/aixm_temporality_1.1.pdf"
            icon = {AixmIcon}
          />
        </ul>
      </div>
    </div>
  </section>

  {/* Validate */}
  <section className="space-y-4">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
      <h2 className="text-4xl font-bold tracking-tight">Validate & Control</h2>
        <p>
          Currently (v0.2.0), validation of AIXM data is limited to basic schema checks and database integrity constraints. 
          More advanced business rules, such as temporality or feature-object consistency, are not yet enforced.
        </p>

        <p className="border-l-4 pl-[10px] italic text-gray-700">
          Planned improvements include a multi-layered validation workflow implemented entirely in PostgreSQL. 
          Standard database constraints will enforce structural rules such as unique identifiers, mandatory attributes, 
          and valid geometries. Machine-generated trigger functions will extend this by maintaining temporal integrity: 
          updating sequence and correction numbers, closing validity intervals, and preventing overlaps or gaps between 
          time slices. Additional triggers and stored procedures will handle higher-level business rules such as ensuring 
          that every feature timeline begins with a baseline, that events remain consistent with their baselines, and that 
          cross-feature relationships (e.g. between airspaces and volumes) remain valid. All validation feedback will be 
          enforced directly in the database and surfaced immediately to users editing in QGIS.
        </p>

      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">
        </ul>
      </div>
    </div>
  </section>


</main>
  );
}
