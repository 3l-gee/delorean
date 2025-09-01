import './pages.css'
import { Button } from "../button/button.jsx";
import { Figure } from '../util/Figure.jsx';
import MainImg from "../../images/main.jpg";

export function MainPage() {

  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  {/* Hero Section */}
  <div className="p-[80px]"></div>
  <section className="space-y-8 hero-page">
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <div className=''> 
          <h1 className="text-4xl font-bold tracking-tight">AIXM, Made Simple</h1>
          <h2 className="text-4xl font-bold tracking-tight">Collection, verification, dissemination and transformation of digital aeronautical information accessible to everyone.</h2>
        </div>
        <div className="p-[40px]"></div>
        <div className="grid grid-cols-2 items-center">
          <Button
            label="Download Delorean"
            href="https://github.com/3l-gee/delorean/releases"
            className='main-page-button'
          />
          <span className="text-gray-500">
            Available on Windows, Mac, Linux
          </span>
        </div>
      </div>
      <div className="pace-y-6 flex-1">
      </div>
    </div>
  </section>

  {/* Background / Context */}
  <section className="space-y-4">
    <h2 className="text-2xl font-semibold">Why Delorean?</h2>
    <p>
      The world of aeronautical data management is in transition from paper to digital products. 
      This transition is supported by the Aeronautical Information Exchange Model (AIXM). 
      While AIXM provides guidance on how data should be stored and exchanged, the actual 
      creation, manipulation, or visualization of such data remains a challenge.
    </p>
    <p>
      While a range of commercial products offer based on AIXM exists, Delorean aims to fill a gap - 
      providing an open source alternative to such tools. Delorean combines the roles of an aeronautical 
      database schema builder, QGIS project generator, and XML transformation engine. 
      It does all this through a simple, robust cli interface that handles your data safely and precisely.
    </p>
  </section>

  <section className="space-y-4">
    <Figure
      src={MainImg}
      alt="AIXM in QGIS with Delorean"
      caption="Figure 1 — AIXM in QGIS with Delorean"
      className="w-[90%] max-w-[90%]"
    />
  </section>


</main>

  );
}
