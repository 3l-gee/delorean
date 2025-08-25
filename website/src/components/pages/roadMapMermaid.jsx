import { useEffect, useRef } from "react";
import mermaid from "mermaid";
import "./roadMapMermaid.css";

export function RoadMapMermaid() {
  const containerRef = useRef(null);

  const content = `
gitGraph TB:
    commit id: "Delorean"
    commit id: "jaxb code generation script"
    commit id: "xml marshalling"
    commit id: "xml unmarshalling"
    commit id: "db schema generation"
    commit id: "xml adapters"
    commit id: "db persistence"
    commit id: "db extraction" tag: "v0.1.0"
    branch explo
    commit id: "extended aimx models"
    checkout main
    commit id: "db persisting"
    commit id: "geometry rendering script"
    checkout explo
    commit id: "edit aixm feature"
    checkout main
    commit id: "db view generation script"
    commit id: "qgis project generation"
    commit id: "datasets mergers"
    branch dev
    branch future
  `;

  useEffect(() => {
    if (!containerRef.current) return;

    // initialize only once
    mermaid.initialize({
      startOnLoad: false,
      theme: "dark",
      securityLevel: "loose",
      themeVariables: {
        gitNoteBkg: "#ccc",
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
