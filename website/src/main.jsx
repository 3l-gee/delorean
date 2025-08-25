import { render } from "preact";
import { useState } from "preact/hooks";
import "./index.css";
import { Navbar } from "./components/navbar";
import { Content } from "./content.jsx";
import { Footer } from "./components/footer.jsx";
import { Background } from "./components/background.jsx";

function App() {
  const [page, setPage] = useState("main");
  const [cleanBackground, setCleanBackground] = useState(false);

  return (
    <>
      <Navbar onNavigate={setPage} onCleanBackground={setCleanBackground} />
      <Content page={page} />
      <Background page={page} clean={cleanBackground}/>
      <Footer />
    </>
  );
}

render(<App />, document.getElementById("app"));
