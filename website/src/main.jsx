import { render } from "preact";
import { useEffect, useState } from "preact/hooks";
import Router from "preact-router";
import hljs from "highlight.js";
import "highlight.js/styles/github-dark.css"; 

import "./index.css";
import { Navbar } from "./components/navbar";
import { MainPage } from "./components/pages/mainPage.jsx";
import { Features } from "./components/pages/features.jsx";
import { RoadMapMermaid } from "./components/pages/roadMapMermaid.jsx";
import { FAQ } from "./components/pages/faq.jsx";
import { Tutorial } from "./components/pages/tutorial.jsx";
import { GML } from "./components/pages/gml.jsx";
import { Footer } from "./components/footer.jsx";
import { Background } from "./components/background.jsx";

function App() {
  const [cleanBackground, setCleanBackground] = useState(false);

  useEffect(() => {
    hljs.highlightAll(); 
  }, []);

  return (
    <>
      <Navbar onCleanBackground={setCleanBackground} />
      
      <div id="page">
        <Router>
          <MainPage path="/" />
          <Features path="/features" />
          <RoadMapMermaid path="/roadmap" />
          <FAQ path="/faq" />
          <Tutorial path="/tutorial" />
          <GML path="/features/gml" />
        </Router>
      </div>

      <Background clean={cleanBackground}/>
      <Footer />
    </>
  );
}

render(<App />, document.getElementById("app"));
