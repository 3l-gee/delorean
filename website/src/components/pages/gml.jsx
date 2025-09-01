import './pages.css'
import { useState, useEffect, useRef } from "preact/hooks";
import Helmet from "preact-helmet";
import hljs from "highlight.js";
import "highlight.js/styles/github-dark.css"; 

import AirspaceImg from "../../images/airspace.jpg";
import { Figure } from '../util/Figure';

import QgisIcon from "../../assets/qgis.svg";
import OsgiIcon from "../../assets/osgi.svg";
import AixmIcon from "../../assets/aixm.svg";
import PostgresqlIcon from "../../assets/postgresql.svg";
import { LinkIcon } from "../util/Linkicon";

export function GML ({ onNavigate }) {
  useEffect(() => {
    hljs.highlightAll(); 
  }, []);
  
  return (
<main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-16 leading-relaxed text-lg">
  <Helmet
    defaultTitle="Delorean AIXM"
    titleTemplate="%s - GML Rendering"
  >
    <title>GML Rendering</title>
    <meta 
      name="description" 
      content="Learn about GML (Geography Markup Language) support in Delorean AIXM. Understand how digital aeronautical data is structured, exchanged, and integrated with AIM and SWIM standards for aviation systems."
    />
    <meta 
      name="keywords" 
      content="Delorean, AIXM, GML, Geography Markup Language, Digital aeronautical data, AIM, SWIM, Open source, Aviation data"
    />
    <meta property="og:title" content="Delorean AIXM - GML" />
    <meta property="og:description" content="Explore how Delorean AIXM handles GML (Geography Markup Language) for digital aeronautical data, integrating with AIM and SWIM standards for modern aviation systems." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://delorean-aixm.io/features/gml" />
  </Helmet>
  <section className="space-y-4">
    <h1 className="text-4xl font-bold tracking-tight">GML Rendering</h1>
    <p>
      Delorean supports parsing and rendering all geometry types permitted by AIXM in accordance with GML. This example shows a polygon constructed from multiple segment types and includes references to other features.
    </p>
    <div className="flex flex-col lg:flex-row gap-8">
      <div className="flex-1 flex flex-col space-y-4 text-base leading-relaxed">
        <h2 className="text-4xl font-bold tracking-tight">Combined Exemple</h2>
        <Figure
          src={AirspaceImg}
          alt="Polygon representation of an airspace in AIXM"
          caption="Figure 1 — Airspace polygon composed of mixed geometry segments"
        />
      </div>
      <div className="flex-1 lg:basis-1/2 space-y-6">
        <pre className='code-block verflow-x-auto'>
            <code className="language-xml">
              {`<aixm:horizontalProjection>
  <!-- Airspace surface geometry definition, with CRS (WGS84 lon/lat) -->
  <aixm:Surface srsName="urn:ogc:def:crs:OGC:1.3:CRS84" gml:id="gmlID40599659">
    <gml:patches>
      <!-- Polygon surface patch -->
      <gml:PolygonPatch>
        <gml:exterior>
          <!-- Exterior boundary ring of the polygon -->
          <gml:Ring>

            <!-- First curve: explicit geodesic arc sequence -->
            <gml:curveMember>
              <gml:Curve gml:id="gmlID40599660">
                <gml:segments>
                  <gml:GeodesicString>
                    <!-- Series of lat/lon points forming the geodesic segment -->
                    <gml:pos>9.2316666667 46.8713888889</gml:pos>
                    <gml:pos>9.9141666667 46.8727777778</gml:pos>
                    <gml:pos>10.2544444444 46.7747222222</gml:pos>
                    <gml:pos>10.2791666667 46.7455555556</gml:pos>
                    <gml:pos>10.3069444444 46.7133333333</gml:pos>
                    <gml:pos>10.3686111111 46.6419444444</gml:pos>
                    <gml:pos>10.3475 46.5805555556</gml:pos>
                    <gml:pos>10.3111111111 46.5466666667</gml:pos>
                  </gml:GeodesicString>
                </gml:segments>
              </gml:Curve>
            </gml:curveMember>

            <!-- Reused curve geometry referenced by UUID -->
            <gml:curveMember xmlns:xlink="http://www.w3.org/1999/xlink" 
              xlink:href="urn:uuid:d163a00d-609f-4b15-9584-165f12599442"/>

            <!-- Second curve: shorter geodesic arc sequence -->
            <gml:curveMember>
              <gml:Curve gml:id="gmlID40599662">
                <gml:segments>
                  <gml:GeodesicString>
                    <gml:pos>10.1408333333 46.4283333333</gml:pos>
                    <gml:pos>10.0666666667 46.4105555556</gml:pos>
                    <gml:pos>9.4591666667 46.4141666667</gml:pos>
                  </gml:GeodesicString>
                </gml:segments>
              </gml:Curve>
            </gml:curveMember>

            <!-- Same referenced curve reused again -->
            <gml:curveMember xmlns:xlink="http://www.w3.org/1999/xlink" 
              xlink:href="urn:uuid:d163a00d-609f-4b15-9584-165f12599442"/>

            <!-- Third curve: mix of geodesic and straight line segments -->
            <gml:curveMember>
              <gml:Curve gml:id="gmlID40599663">
                <gml:segments>
                  <!-- Geodesic arc -->
                  <gml:GeodesicString>
                    <gml:pos>9.2775 46.4147222222</gml:pos>
                    <gml:pos>9.1727777778 46.4152777778</gml:pos>
                  </gml:GeodesicString>

                  <!-- Straight line segment -->
                  <gml:LineStringSegment>
                    <gml:pos>9.1727777778 46.4152777778</gml:pos>
                    <gml:pos>9.1411111111 46.4152777778</gml:pos>
                    <gml:pos>9.1175 46.4152777778</gml:pos>
                  </gml:LineStringSegment>

                  <!-- Closing geodesic arc back to the start point -->
                  <gml:GeodesicString>
                    <gml:pos>9.1175 46.4152777778</gml:pos>
                    <gml:pos>9.0719444444 46.4269444444</gml:pos>
                    <gml:pos>9.0338888889 46.4486111111</gml:pos>
                    <gml:pos>9.0088888889 46.4788888889</gml:pos>
                    <gml:pos>9.0061111111 46.4927777778</gml:pos>
                    <gml:pos>9.0013888889 46.5252777778</gml:pos>
                    <gml:pos>8.9794444444 46.6811111111</gml:pos>
                    <gml:pos>8.9702777778 46.7488888889</gml:pos>
                    <gml:pos>8.9655555556 46.7836111111</gml:pos>
                    <gml:pos>8.9791666667 46.8186111111</gml:pos>
                    <gml:pos>9.0125 46.8491666667</gml:pos>
                    <gml:pos>9.0688888889 46.8702777778</gml:pos>
                    <gml:pos>9.13 46.8705555556</gml:pos>
                    <gml:pos>9.2316666667 46.8713888889</gml:pos>
                  </gml:GeodesicString>
                </gml:segments>
              </gml:Curve>
            </gml:curveMember>

          </gml:Ring>
        </gml:exterior>
      </gml:PolygonPatch>
    </gml:patches>

    <!-- Horizontal accuracy is undefined (nil with reason) -->
    <aixm:horizontalAccuracy xsi:nil="true" nilReason="unknown"/>
  </aixm:Surface>
</aixm:horizontalProjection>
`}
          </code>
        </pre>
      </div>

    </div>
  </section>
</main>
  );
}