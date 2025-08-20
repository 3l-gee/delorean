import { render } from "preact";
import { useState } from "preact/hooks";
import "./index.css";
import { Navbar } from "./components/navbar";
import { Content } from "./content.jsx";
import { Footer } from "./components/footer.jsx";
import { Background } from "./components/background.jsx";

function App() {
  const [page, setPage] = useState("main");

  return (
    <>
      <Navbar onNavigate={setPage} />
      <Content page={page} />
      <Background />
      <Footer />
    </>
  );
}

render(<App />, document.getElementById("app"));
