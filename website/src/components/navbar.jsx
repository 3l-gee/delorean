export function Navbar() {
  const links = [
    {id: "about", label: "About"},
    {id: "resources", label: "Resources"},
    {id: "community", label: "Community"}
  ];

  return (
<div className="fixed top-0 left-0 w-full bg-white shadow z-50 flex justify-between py-4 px-6">
    {/* Left 1/3: Logo / Name */}
    <div className="w-1/3 flex items-center">
        <p className="font-bold text-lg">Delorean</p>
    </div>

    {/* Middle 1/3: Links */}
    <div className="w-1/3 flex justify-center gap-8">
        {links.map(link => (
        <a
            key={link.id}
            href={`#${link.id}`}
            className="hover:text-blue-600 transition-colors"
        >
            {link.label}
        </a>
        ))}
    </div>

    {/* Right 1/3: Icons */}
    <div className="w-1/3 flex justify-end gap-4">
        {/* Example placeholder icons */}
        <a href="https://github.com/3l-gee/delorean" target="_blank" rel="noopener noreferrer">
        <span>🐙</span>
        </a>
        <a href="#aixm">
        <span>📡</span>
        </a>
        <a href="#icao">
        <span>🌍</span>
        </a>
    </div>
</div>
  );
}
