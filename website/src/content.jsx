import { useEffect } from "preact/hooks";
// import "./content.css";
import { MainPage } from "./components/pages/mainPage.jsx";
import { Features } from "./components/pages/features.jsx";
import { RoadMapMermaid } from "./components/pages/roadMapMermaid.jsx";
import { FAQ } from "./components/pages/faq.jsx";
import { Tutorial } from "./components/pages/tutorial.jsx";
import { GML } from "./components/pages/gml.jsx";

// Smooth scroll behavior
export function Content({ onNavigate, page }) {
  useEffect(() => {
    document.documentElement.style.scrollBehavior = "smooth";
  }, []);

  return (
    <div id="page" className="font-sans pt-[88px]">
      {page === "main" && <MainPage />}
      {page === "features" && <Features onNavigate={onNavigate} />}
      {page === "roadmap" && <RoadMapMermaid onNavigate={onNavigate}/>}
      {page === "faq" && <FAQ />}
      {page === "tutorial" && <Tutorial />  }
      {page === "gml" && <GML />  }
    </div>
  );
}
