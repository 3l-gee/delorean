import { useEffect, useRef } from "preact/hooks";
import mermaid from "mermaid";

export function Mermaid({ chart }) {
  const ref = useRef(null);

  useEffect(() => {
    if (ref.current) {
      mermaid.initialize({ 
        startOnLoad: false, 
        theme: "neutral" 
    });
      mermaid.render("theGraph", chart).then(({ svg }) => {
        ref.current.innerHTML = svg;
      });
    }
  }, [chart]);

  return <div ref={ref} />;
}
