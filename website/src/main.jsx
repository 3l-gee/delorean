import { render } from "preact";
import { useState } from "preact/hooks";
import "./index.css";
import { Navbar } from "./components/navbar";
import { Content } from "./content.jsx";
import { Footer } from "./components/footer.jsx";
import { Background } from "./components/background.jsx";
import { useEffect } from "preact/hooks";
import hljs from "highlight.js";
import "highlight.js/styles/github-dark.css"; 

function App() {
  const [page, setPage] = useState("main");
  const [cleanBackground, setCleanBackground] = useState(false);

  useEffect(() => {
    hljs.highlightAll(); 
  }, []);

  return (
    <>
      <Navbar onNavigate={setPage} onCleanBackground={setCleanBackground} />
      <Content onNavigate={setPage} page={page} />
      <Background page={page} clean={cleanBackground}/>
      <Footer />
    </>
  );
}

render(<App />, document.getElementById("app"));
