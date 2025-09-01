import './pages.css'
import { useEffect, useRef } from "preact/hooks";
import Helmet from "preact-helmet";
import { LinkIcon } from "../util/Linkicon";
export function FAQ() {

  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  <Helmet
    defaultTitle="Delorean AIXM"
    titleTemplate="%s - FAQ"
  >
    <meta 
      name="description" 
      content="Frequently Asked Questions about Delorean AIXM, the open-source tool for managing AIXM and digital aeronautical data. Get answers on features, installation, tutorials, and integration with AIM and SWIM."
    />
    <meta 
      name="keywords" 
      content="Delorean, AIXM, FAQ, Questions, Answers, Open source, AIM, SWIM, Aeronautical data, Tutorial"
    />
    <meta property="og:title" content="Delorean AIXM - FAQ" />
    <meta property="og:description" content="Find answers to common questions about Delorean AIXM, including features, tutorials, installation, and integration with aeronautical data management standards like AIM and SWIM." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://delorean-aixm.io/faq" />
  </Helmet>
  <section className="space-y-4">
    <h1 className="text-4xl font-bold tracking-tight">FAQ</h1>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h3 className="text-4xl font-bold tracking-tight">My aixm file uses extension what will hapen to them ?</h3>
        <div className="p-6 bg-gray-100 rounded-xl border-l-4 border-blue-500 shadow-sm">
            <p className="pl-[10px] italic text-gray-700">
              The current (v0.2.0) version of delorean does not support extension and will simply ignore them. 
              Common extension are planned for future release of delorean.
            </p>
        </div>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <ul className="learnmore-list">
        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h3 className="text-4xl font-bold tracking-tight">Loading data in a remote databae is really slow why is that ?</h3>
        <div className="p-6 bg-gray-100 rounded-xl border-l-4 border-blue-500 shadow-sm">
            <p className="pl-[10px] italic text-gray-700">
              Dolorean relies on stated transactions to ensure data consistency during loading,
              extraction, and schema generation. Over a remote connection, each transaction
              involves multiple round-trips, which can make the process noticeably slower
              when latency is high. Performance can be improved by reducing network latency,
              or using a connection pooler like pgBouncer to manage
              multiple connections efficiently.
            </p>
        </div>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <ul className="learnmore-list">
        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h3 className="text-4xl font-bold tracking-tight">I get an error when I export AIXM layers from QGIS into a different format (gpkg).</h3>
        <div className="p-6 bg-gray-100 rounded-xl border-l-4 border-blue-500 shadow-sm">
            <p className="pl-[10px] italic text-gray-700">
              AIXM is unique as feature contain multiple types of geometry. This is something only postgresql / postgis handel correctly. 
              When exporting geometrique layers make sure to unselect fields of type geometry (or change their types before hand).
            </p>
        </div>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <ul className="learnmore-list">
        </ul>
      </div>
    </div>
  </section>


</main>
  );
}
