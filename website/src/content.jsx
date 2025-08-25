import { useEffect } from "preact/hooks";
import "./content.css";
import { MainPage } from "./components/pages/mainPage.jsx";
import { Features } from "./components/pages/features.jsx";

// Smooth scroll behavior
export function Content({ page }) {
  useEffect(() => {
    document.documentElement.style.scrollBehavior = "smooth";
  }, []);

  return (
    <div id="page" className="font-sans pt-[88px]">
      {page === "main" && <MainPage />}
      {page === "features" && <Features />}
    </div>
  );
}
