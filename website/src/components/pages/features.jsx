import './pages.css'
import { useEffect, useRef } from "preact/hooks";
import { Mermaid } from '../util/mermaid';

export function Features() {
  const mindmap = `
mindmap
  root((Delorean))
    xml
        load
        export
        validate
    postgres
        load
        export
        render
        control
    filter
        feature
        time
        geometry
    qgis
        view
        publish
        edit
        transform
    merge
        feature
        time
        geometry
`;

  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  {/* Definition */}
  <section className="space-y-6">
    <h1 className="text-4xl font-bold tracking-tight">The Bases</h1>
    <p>
      <strong>Delorean</strong> is an open-source tool written in Java and targeted at PostgreSQL, 
      allowing users to create, visualize, and work with AIXM datasets. It acts as a link 
      between <code>XML</code>, <code>PostgreSQL</code> and <code>QGIS</code>.
    </p>
    <Mermaid chart={mindmap} />
  </section>

  {/* XML */}
  <section className="space-y-4">

  </section>

   {/* SQL */}
  <section className="space-y-4">

  </section>

  {/* QGIS */}
  <section className="space-y-4">

  </section>
</main>
  );
}
