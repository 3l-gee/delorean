import { useEffect, useRef } from "react";
import mermaid from "mermaid";
import "./roadMapMermaid.css";

export function RoadMapMermaid() {
  const containerRef = useRef(null);

  const content = `
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
    commit id: "htmlwidget"
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
    commit id: "extended schema" type:REVERSE
    checkout db
    commit id: "edition & creation" type:REVERSE
    checkout codegen
    commit id: "digital notam" type:REVERSE
    checkout db
    commit id: "temp delta & perm delta" type:REVERSE
    checkout main
    commit "release"  type:REVERSE tag: "v1.0.0"
  `;

  useEffect(() => {
    if (!containerRef.current) return;

    // initialize only once
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

    const renderMermaid = async () => {
      try {
        const { svg } = await mermaid.render(
          `mermaid-${Date.now()}`, // unique ID
          content
        );
        containerRef.current.innerHTML = svg;
      } catch (error) {
        console.error("Mermaid rendering failed:", error);
      }
    };

    renderMermaid();
  }, [content]);

  return (
    <main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
      <div className="p-[80px]"></div>
      <div ref={containerRef} className="roadmap-mermaid mermaid" />
    </main>
  );
}
