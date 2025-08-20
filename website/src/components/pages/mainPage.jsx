import './mainPage.css'

export function MainPage() {
  const sections = [
    { id: 1, title: "First Section", text: "Some text here...", image: "📦" },
    { id: 2, title: "Second Section", text: "More text here...", image: "🚀" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
    { id: 3, title: "Third Section", text: "Even more text here...", image: "🌍" },
  ];

  return (
    <main className="relative z-10 max-w-6xl mx-auto px-6 py-24 space-y-32">
      {sections.map((section, idx) => (
        <section
          key={section.id}
          className="grid grid-cols-1 md:grid-cols-3 items-center gap-12"
        >
          {/* Left/Right alternating */}
          {idx % 2 === 0 ? (
            <>
              {/* Text 2/3 */}
              <div className="md:col-span-2 space-y-4">
                <h2 className="text-2xl font-bold">{section.title}</h2>
                <p className="text-gray-600">{section.text}</p>
              </div>
              {/* Image 1/3 */}
              <div className="md:col-span-1 flex justify-center">
                <div className="text-6xl">{section.image}</div>
              </div>
            </>
          ) : (
            <>
              {/* Image 1/3 */}
              <div className="md:col-span-1 flex justify-center">
                <div className="text-6xl">{section.image}</div>
              </div>
              {/* Text 2/3 */}
              <div className="md:col-span-2 space-y-4">
                <h2 className="text-2xl font-bold">{section.title}</h2>
                <p className="text-gray-600">{section.text}</p>
              </div>
            </>
          )}
        </section>
      ))}
    </main>
  );
}
