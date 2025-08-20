import './pages.css'

export function MainPage() {

  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  {/* Hero Section */}
  <section className="space-y-6">
    <h1 className="text-4xl font-bold tracking-tight">Delorean</h1>
    <p>
      <strong>Delorean</strong> is an open-source tool written in Java and targeted at PostgreSQL, 
      allowing users to create, visualize, and work with AIXM datasets. It acts as a link 
      between <code>XML</code>, <code>PostgreSQL</code> and <code>QGIS</code>.
    </p>
  </section>

  {/* Supported Versions */}
  <section className="space-y-4">
    <h2 className="text-2xl font-semibold">Supported AIXM Versions</h2>
    <ul className="list-disc list-inside space-y-2">
      <li>5.2 (in dev)</li>
      <li>5.1.1 (in dev)</li>
      <li>5.1</li>
      <li>5.0</li>
      <li>4.5</li>
    </ul>
  </section>

  {/* Background / Context */}
  <section className="space-y-4">
    <h2 className="text-2xl font-semibold">Why Delorean?</h2>
    <p>
      The world of aeronautical data management is in transition from paper to digital products. 
      This transition is supported by the Aeronautical Information Exchange Model (AIXM). 
      While AIXM provides guidance on how data should be stored and exchanged, the actual 
      creation, manipulation, or visualization of such data remains a challenge.
    </p>
    <p>
      While a range of commercial products offer based on AIXM exists, Delorean aims to fill a gap - 
      providing an open source alternative to such tools. Delorean combines the roles of an aeronautical 
      database schema builder, QGIS project generator, and XML transformation engine. 
      It does all this through a simple, robust cli interface that handles your data safely and precisely.
    </p>
  </section>
</main>

  );
}
