import './pages.css'
import { useEffect, useRef } from "preact/hooks";
import Helmet from "preact-helmet";
import hljs from "highlight.js";
import "highlight.js/styles/github-dark.css"; 

import QgisIcon from "../../assets/qgis.svg";
import OsgiIcon from "../../assets/osgi.svg";
import JavaIcon from "../../assets/java.svg";
import PostgresqlIcon from "../../assets/postgresql.svg";
import GithubIcon from "../../assets/github.svg"
import { LinkIcon } from "../util/Linkicon";

export function Tutorial() {
    useEffect(() => {
        hljs.highlightAll(); 
    }, []);

  return (
  <section className="space-y-4">
    <Helmet
        defaultTitle="Delorean AIXM"
        titleTemplate="%s - Tutorial"
      >
        <meta 
          name="description" 
          content="Delorean AIXM tutorial page, with guides, explanations, and examples for managing AIXM data."
        />
        <meta 
          name="keywords" 
          content="Delorean, AIXM, Tutorial, Guide, Explanation, Aeronautical Data, Open Source"
        />
        <meta property="og:title" content="Delorean AIXM - Tutorial" />
        <meta property="og:description" content="Learn how to use Delorean AIXM with detailed tutorials, guides, and examples for managing digital aeronautical data." />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="https://delorean-aixm.io/tutorial" />
    </Helmet>
    <h1 className="text-4xl font-bold tracking-tight">Tutorial</h1>
    <div className="flex space-y-8">
    <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">System Requirements</h2>
        <p>Delorean is a Java-based application that integrates with PostgreSQL, PostGIS, and QGIS. The following minimum versions are required:</p>
        <ul className="list-disc list-inside space-y-2">
            <li>Java Runtime Environment (JRE) 17 or later</li>
            <li>PostgreSQL 15 or later</li>
            <li>PostGIS 3.2 or later</li>
            <li>QGIS 3.20 or later</li>
        </ul>
    </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">
            <LinkIcon 
                label = "oracle.com/download"
                url = "https://www.oracle.com/java/technologies/downloads/"
                icon = {JavaIcon}
            />
            <LinkIcon 
                label = "postgresql.org/download"
                url = "https://www.postgresql.org/download/"
                icon = {PostgresqlIcon}
            />
            <LinkIcon 
                label = "qgis.org/download"
                url = "https://qgis.org/download/"
                icon = {QgisIcon}
            />
        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">Installation</h2>
        <ol className="list-decimal list-inside space-y-2">
            <li>Download delorean</li>
            <li>Choose a directory and extract the distribution file</li>
        </ol>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">
            <LinkIcon 
                label = "github.com/delorean"
                url = "https://github.com/3l-gee/delorean/releases"
                icon = {GithubIcon}
            />
        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">First Step</h2>
        <ol className="ol-custom list-decimal list-inside space-y-2">
            <li>Start the application
                <pre className='code-block'>
                    <code className="language-bash">
                        {`java -jar delorean-0.2.0.jar`}
                    </code>
                </pre>
            </li>
            <li>Help with functions, options, attributes 
                <pre className='code-block'>
                    <code className="language-bash">
                        {`> help`}
                    </code>
                </pre>
            </li>
        </ol>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">

        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">Container</h2>
        <p>
            Delorean Works with containers, where each container functions like a folder with its own ID, schema, and dataset:
        </p>
        <ul className="list-disc list-inside space-y-2">
            <li>ID: A unique identifier used to reference the container</li>
            <li>Schema: Defines the data structure and validation rules.</li>
            <li>Dataset: The actual data, which is loaded separately using other functions.</li>
        </ul>
        <p>
            To reference a container you can either type its ID : 
            <pre className="code-block">
                <code className="language-bash">
                    {`35591d`}
                </code>
            </pre>
            or to reference the last container used :
            <pre className="code-block">
                <code className="language-bash">
                    {`-`}
                </code>
            </pre>
        </p>
        <div className="w-full border-t border-gray-300 my-6"></div>
        <ol className="ol-custom list-decimal list-inside space-y-2">
            <li>
                Open a AIXM container
                <pre className="code-block">
                    <code className="language-bash">
                        {`> new a5_1`}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                a5_1 is the abbreviation for AIXM 5.1
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] New container: 35591d`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                List existing containers
                <pre className="code-block">
                    <code className="language-bash">
                        {`> list`}
                    </code>
                </pre>
                <ol className="space-y-2">
                    <li>
                        Output message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[d28832, 083c94]`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
        </ol>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">

        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">XML</h2>
        <p>
            To marshall / unmarshall aixm in xml form we must first configure the delorean xml marshaller
        </p>
        <ul className="list-disc list-inside space-y-2">
        </ul>
        <div className="w-full border-t border-gray-300 my-6"></div>
        <ol className="ol-custom list-decimal list-inside space-y-2">
            <li>
                Configure XML marshaller
                <pre className="code-block">
                    <code className="language-bash">
                        {`> xml_config 35591d a5_1`}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                a5_1 is the abbreviation for AIXM 5.1
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] XML configuration set`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Load aixm xml data
                <pre className="code-block">
                    <code className="language-bash">
                        {`> xml 35591d load C:\\Users\\Downloads\\aixm.xml`}
                    </code>
                </pre>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] Successfully unmarshalled`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Export aixm xml data
                <pre className="code-block">
                    <code className="language-bash">
                        {`> xml 35591d export C:\\Users\\Downloads\\aixm.xml`}
                    </code>
                </pre>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] Successfully marshalled`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
        </ol>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">

        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">Database</h2>
        <p>
            To format / load / extract aixm in the Database we need to establish a connection
        </p>
        <ul className="list-disc list-inside space-y-2">
        </ul>
        <div className="w-full border-t border-gray-300 my-6"></div>
        <ol className="ol-custom list-decimal list-inside space-y-2">
            <li>
                Configure database connection
                <pre className="code-block">
                    <code className="language-bash">
                        {`> db_config 35591d a5_1`}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                a5_1 is the abbreviation for AIXM 5.1
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] XML configuration set`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Load aixm xml data
                <pre className="code-block">
                    <code className="language-bash">
                        {`> xml 35591d load C:\\Users\\Downloads\\aixm.xml`}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                a5_1 is the abbreviation for AIXM 5.1
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`Feb 27, 2025 11:14:59 PM org.hibernate.Version logVersion
INFO: HHH000412: Hibernate ORM core version [WORKING]`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Set url
                <pre className="code-block">
                    <code className="language-bash">
                        {`Enter URL, [url:port/database] : localhost:5432/delorean`}
                    </code>
                </pre>
            </li>
            <li>
                Set database admin username
                <pre className="code-block">
                    <code className="language-bash">
                        {`Enter username : postgres`}
                    </code>
                </pre>
            </li>
            <li>
                Set database admin password
                <pre className="code-block">
                    <code className="language-bash">
                        {`Enter password : postgres`}
                    </code>
                </pre>
            </li>
            <li>
                Set Hibernate Mapping to Data Definition Language (hbm2ddl)
                <pre className="code-block">
                    <code className="language-bash">
                        {`Enter hbm2ddl, [create, update, validate, none] : create`}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                The hbm2ddl tool is used to automatically create or update database schemas based on Hibernate entity mappings :
                <ul className="list-disc list-inside space-y-2">
                    <li>create - Drops existing tables and creates new ones</li>
                    <li>update - Updates existing schema without deleting data</li>
                    <li>validate - Verifies that the database schema matches the entity mappings</li>
                    <li>none - Disables automatic schema generation</li>
                </ul>
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] Database configuration set`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Open the database connection
                <pre className="code-block">
                    <code className="language-bash">
                        {`> db 35591d startup`}
                    </code>
                </pre>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] Successfully executed script: a5_1/postgres/schema.sql
# Hibernate logs...
[INFO] Successfully executed script: a5_1/postgres/post_init.sql
[INFO] Successfully initialized Hibernate session factory`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Load selected containers dataset in the connected database
                <pre className="code-block">
                    <code className="language-bash">
                        {`> db 35591d load`}
                    </code>
                </pre>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] AIXM and project successfully loaded`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Compute database views, render geometries
                <pre className="code-block">
                    <code className="language-bash">
                        {`> db 35591d compute `}
                    </code>
                </pre>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] Database views successfully created`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Export database content by aixm basic message id 
                <pre className="code-block">
                    <code className="language-bash">
                        {`> db 35591d export 1 `}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                    Currently broken in v0.2.0
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] AIXM Successfully exported`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Export database content by valid time cut off
                <pre className="code-block">
                    <code className="language-bash">
                        {`> db 35591d export 2011-01-01 `}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                    Currently broken in v0.2.0
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] AIXM Successfully exported`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
        </ol>
      </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">

        </ul>
      </div>
    </div>
    <div className="flex space-y-8">
      <div className="space-y-6 flex-2">
        <h2 className="text-4xl font-bold tracking-tight">QGIS Configuration</h2>
        <p>
            To visualize the aixm data in qgis we must create a qgis project. 
        </p>
        <ul className="list-disc list-inside space-y-2">
        </ul>
        <div className="w-full border-t border-gray-300 my-6"></div>
        <ol className="ol-custom list-decimal list-inside space-y-2">
            <li>
                Configure qgis project
                <pre className="code-block">
                    <code className="language-bash">
                        {`> qgis_config 35591d a5_1`}
                    </code>
                </pre>
                <p className="border-l-4 pl-[10px] italic text-gray-700">
                a5_1 is the abbreviation for AIXM 5.1
                </p>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] Qgis project configuration set`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
            <li>
                Configure qgis project
                <pre className="code-block">
                    <code className="language-bash">
                        {`> qgis 35591d init`}
                    </code>
                </pre>
                <ol className="space-y-2">
                    <li>
                        Confirmation message
                        <pre className="code-block">
                            <code className="language-bash">
                                {`[INFO] QGIS project successfully initialized.`}
                            </code>
                        </pre>
                    </li>
                </ol>
            </li>
        </ol>
        </div>
      <div className="flex flex-col flex-1 w-full h-full space-y-4 pl-6 text-base leading-relaxed justify-center items-center">
        <h3 className="text-2xl font-semibold"></h3>
        <ul className="link-list">

        </ul>
      </div>
    </div>
  </section>
    );
}