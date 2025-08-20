import { DropDownButton } from "./button/dropDownButton";
import { ToggleSwitch } from "./button/toggleButton";
import { useState, useEffect } from "preact/hooks";
import GithubIcon from "../assets/github.svg";
import LinkedinIcon from "../assets/linkedin.svg";
import MastodonIcon from "../assets/mastodon.svg";
import "./navbar.css";

export function Navbar({ onNavigate }) {
  const [dark, setDark] = useState(false);

  useEffect(() => {
    if (dark) {
      document.documentElement.setAttribute("data-theme", "dark");
    } else {
      document.documentElement.removeAttribute("data-theme");
    }
  }, [dark]);

  const [show, setShow] = useState(true);
  const [lastScrollY, setLastScrollY] = useState(0);

  useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;
      if (currentScrollY > lastScrollY && currentScrollY > 50) {
        setShow(false);
      } else {
        setShow(true);
      }
      setLastScrollY(currentScrollY);
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, [lastScrollY]);

  return (
    <div className={`navbar ${show ? "show" : "hide"}`}>
      {/* Left: Logo */}
      <button
        className="navbar-logo cursor-pointer bg-transparent border-none p-0 m-0 text-left"
      >
        <pre className="m-0 p-0" onClick={() => onNavigate("main")}>
{` ██████╗  ███████╗ ██╗       ██████╗  ██████╗  ███████╗  █████╗  ███╗   ██╗ 
 ██╔══██╗ ██╔════╝ ██║      ██╔═══██╗ ██╔══██╗ ██╔════╝ ██╔══██╗ ████╗  ██║ 
 ██║  ██║ █████╗   ██║      ██║   ██║ ██████╔╝ █████╗   ███████║ ██╔██╗ ██║ 
 ██║  ██║ ██╔══╝   ██║      ██║   ██║ ██╔══██╗ ██╔══╝   ██╔══██║ ██║╚██╗██║ 
 ██████╔╝ ███████╗ ███████╗ ╚██████╔╝ ██║  ██║ ███████╗ ██║  ██║ ██║ ╚████║ 
 ╚═════╝  ╚══════╝ ╚══════╝  ╚═════╝  ╚═╝  ╚═╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ `}
        </pre>
      </button>

      {/* Middle: Links */}
      <div className="navbar-links">
        <DropDownButton
          label="About"
          options={[
            { label: "Features", onClick: () => onNavigate("features") },
            { label: "Changelogs", href: "#" },
            { label: "Road Map", href: "#" },
            { label: "Use Case", href: "#" },
          ]}
        />
        <DropDownButton
          label="Resources"
          options={[
            { label: "Documentation", href: "#" },
            { label: "Profile", href: "#" },
            { label: "Settings", href: "#" },
          ]}
        />
        <DropDownButton
          label="Get involve"
          options={[
            { label: "Ask a question", href: "#" },
            { label: "Open a ticket", href: "#" },
            { label: "Organisation", href: "#" },
          ]}
        />
      </div>

      {/* Right: Icons */}
      <div className="navbar-icons">
        <a
          href="https://github.com/3l-gee/delorean"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={GithubIcon} alt="GitHub" className="w-[30px] h-[30px]" />
        </a>

        <a
          href="https://www.linkedin.com/in/yourusername"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={LinkedinIcon} alt="LinkedIn" className="w-[40px] h-[40px]" />
        </a>

        <a
          href="https://mastodon.social/@yourusername"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={MastodonIcon} alt="Mastodon" className="w-[32px] h-[32px]" />
        </a>

        <ToggleSwitch
          leftLabel="☀️"
          rightLabel="🌙"
          defaultOn={false}
          onToggle={(isDark) => setDark(isDark)}
        />
      </div>
    </div>
  );
}
