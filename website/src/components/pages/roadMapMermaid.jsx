import { useEffect, useRef } from "react";
import Helmet from "preact-helmet";
import mermaid from "mermaid";
import "./roadMapMermaid.css";
import './pages.css'

export function RoadMapMermaid() {
  const containerRef1 = useRef(null);
  const containerRef2 = useRef(null);

  const graph1  = `
gitGraph TB:
    commit id: "Delorean init"
    branch codegen
    commit id: "JAXB generation"
    commit id: "XJB generation"
    branch xml
    commit id: "adapters"
    commit id: "marshalling"
    commit id: "unmarshalling"
    branch db
    commit id: "schema generation"
    commit id: "persistence"
    commit id: "extraction"
    branch testing
    commit id: "test data set"
    checkout main
    merge db type: HIGHLIGHT tag: "v0.1.0"
    checkout db
    commit id: "geometry rendering"
    commit id: "view generation"
    branch qgis
    commit id: "visualisation project generation"
    commit id: "action"
    commit id: "html widget"
    checkout main
    merge qgis type: HIGHLIGHT tag: "v0.2.0"
    checkout codegen
    merge main id: "5.1.1 / 5.2" type:REVERSE
    checkout db
    merge main id: "geo, temporal, source filter & merger" type:REVERSE
    checkout testing
    merge main id: "automated testing" type:REVERSE
    checkout qgis 
    merge main id: "edition project generation" type:REVERSE
    checkout codegen
    commit id: "validation & buisiness rules (java)" type:REVERSE
    checkout db
    commit id: "validation & buisiness rules (db)" type:REVERSE
    checkout codegen
    commit id: "extended schema" type:REVERSE
    checkout db
    commit id: "create & edit" type:REVERSE
    checkout codegen
    commit id: "digital notam" type:REVERSE
    checkout db
    commit id: "temp delta & perm delta" type:REVERSE
    checkout main
    commit id:" " "release"  type:REVERSE tag: "v1.0.0"
  `;

    const graph2 = `
gitGraph TB:
    commit id: "feature"
    branch Epic
    commit id: "feature part of epic"
    checkout main
    merge Epic 
    commit id: " " type: HIGHLIGHT tag: "release"
    commit id: "planned feature" type:REVERSE
`;

  useEffect(() => {
    mermaid.initialize({
      startOnLoad: false,
      theme: "dark",
      securityLevel: "loose",
      themeVariables: {
        commitLabelColor: 'var(--color-secondary)',
        commitLabelBackground: 'var(--color-bg)',
        gitNoteBkg: "#cccccc",
        gitBranchLabelColor: "#000",
        gitLabelColor: "#000",
      },
    });

    const renderMermaid = async (container, graph) => {
      if (!container) return;
      try {
        const { svg } = await mermaid.render(`mermaid-${Date.now()}`, graph);
        container.innerHTML = svg;
      } catch (error) {
        console.error("Mermaid rendering failed:", error);
      }
    };

    renderMermaid(containerRef1.current, graph1);
    renderMermaid(containerRef2.current, graph2);
  }, []);

  return (
    <main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
      <Helmet
        defaultTitle="Delorean AIXM"
        titleTemplate="%s - Roadmap"
      >
        <meta 
          name="description" 
          content="Explore the roadmap of the Delorean AIXM open-source project, including milestones, planned features, and development timeline for digital aeronautical data management."
        />
        <meta 
          name="keywords" 
          content="Delorean, AIXM, Roadmap, Milestones, Planning, Development, Open source"
        />
        <meta property="og:title" content="Delorean AIXM - Roadmap" />
        <meta property="og:description" content="Follow the Delorean AIXM roadmap with milestones, planned features, and development timeline for modern aeronautical data management." />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="https://delorean-aixm.io/roadmap" />
      </Helmet>
      <section className="space-y-4">
        <h1 className="text-4xl font-bold tracking-tight">Road Map</h1>
        <div className="flex space-y-8">
          <div className="space-y-6 flex-2">
            <p>
              This Git graph illustrates the milestones that have been achieved and are planned for the Delorean project.
              Each commit represents a feature or task that has been completed. When multiple related features belong to the same larger goal, they are grouped into an Epic branch. Once the Epic is ready, it is merged back into the main branch, showing its integration into the core project.
            </p>
            <p>
              Release tags highlight the points in time where a stable version of the project was published. These serve as checkpoints that capture the state of the system and make it easy to trace back to specific versions.
            </p>
            <p>
              Planned features are also shown in the graph with reversed commits, making it possible to visualize not just what has been done, but what is coming next. This way, the Git graph functions as both a historical log of progress and a forward-looking roadmap.
            </p>
          </div>
          <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
            <div className="link-list">
              <div ref={containerRef2} className="" />
            </div>
          </div>
        </div>
      </section>
      <div className="space-y-10"></div>
      <h2 className="text-4xl font-bold tracking-tight">Simplified Git graph</h2>
      <div ref={containerRef1} className="roadmap-mermaid mermaid" />
    </main>
  );
}
