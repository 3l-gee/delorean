import { useState } from 'preact/hooks'
import preactLogo from './assets/preact.svg'
import viteLogo from '/vite.svg'
import './app.css'
import { useEffect } from "preact/hooks"
import { Navbar } from "./components/navbar"

// Smooth scroll behavior
export function App() {
  useEffect(() => {
    document.documentElement.style.scrollBehavior = "smooth";
  }, []);

  return (
    <div className="font-sans">
      {/* Navbar */}
      <Navbar />

      {/* Page Sections */}
      <main className="pt-20">
        {/* Home */}
        <section id="home" className="h-screen flex flex-col items-center justify-center bg-gray-100">
          <h1 className="text-4xl font-bold mb-4">🚀 Delorean</h1>
          <p className="text-lg mb-6">Time-travel debugging for modern developers.</p>
          <a href="https://github.com/3l-gee/delorean" target="_blank">
            <button className="px-4 py-2 bg-blue-600 text-white rounded-lg">Get Started</button>
          </a>
        </section>

        {/* Docs */}
        <section id="docs" className="h-screen flex flex-col items-center justify-center bg-white">
          <h2 className="text-3xl font-bold mb-4">📘 Documentation</h2>
          <p className="mb-6 max-w-lg text-center">Learn how to install and use Delorean with detailed API descriptions and examples.</p>
          <a href="/docs">
            <button className="px-4 py-2 bg-blue-600 text-white rounded-lg">Read Docs</button>
          </a>
        </section>

        {/* Examples */}
        <section id="examples" className="h-screen flex flex-col items-center justify-center bg-gray-100">
          <h2 className="text-3xl font-bold mb-4">💡 Examples</h2>
          <p className="mb-6 max-w-lg text-center">See real-world use cases and code snippets that showcase Delorean’s power.</p>
          <a href="/examples">
            <button className="px-4 py-2 bg-blue-600 text-white rounded-lg">View Examples</button>
          </a>
        </section>

        {/* Blog */}
        <section id="blog" className="h-screen flex flex-col items-center justify-center bg-white">
          <h2 className="text-3xl font-bold mb-4">📰 Blog</h2>
          <p className="mb-6 max-w-lg text-center">Stay updated with the latest news, releases, and tutorials about Delorean.</p>
          <a href="/blog">
            <button className="px-4 py-2 bg-blue-600 text-white rounded-lg">Visit Blog</button>
          </a>
        </section>

        {/* About */}
        <section id="about" className="h-screen flex flex-col items-center justify-center bg-gray-100">
          <h2 className="text-3xl font-bold mb-4">ℹ️ About</h2>
          <p className="mb-6 max-w-lg text-center">Delorean is built for developers who need to debug smarter. Learn why it was created and how to contribute.</p>
          <a href="/about">
            <button className="px-4 py-2 bg-blue-600 text-white rounded-lg">Learn More</button>
          </a>
        </section>
      </main>
    </div>
  );
}


// export function App() {
//   const [count, setCount] = useState(0)

//   return (
//     <>
//       <div>
//         <a href="https://vite.dev" target="_blank">
//           <img src={viteLogo} class="logo" alt="Vite logo" />
//         </a>
//         <a href="https://preactjs.com" target="_blank">
//           <img src={preactLogo} class="logo preact" alt="Preact logo" />
//         </a>
//       </div>
//       <h1>Vite + Preact</h1>
//       <div class="card">
//         <button onClick={() => setCount((count) => count + 1)}>
//           count is {count}
//         </button>
//         <p>
//           Edit <code>src/app.jsx</code> and save to test HMR
//         </p>
//       </div>
//       <p>
//         Check out{' '}
//         <a
//           href="https://preactjs.com/guide/v10/getting-started#create-a-vite-powered-preact-app"
//           target="_blank"
//         >
//           create-preact
//         </a>
//         , the official Preact + Vite starter
//       </p>
//       <p class="read-the-docs">
//         Click on the Vite and Preact logos to learn more
//       </p>
//     </>
//   )
// }
