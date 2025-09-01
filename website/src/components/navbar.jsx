import { DropDownButton } from "./button/dropDownButton";
import { ToggleSwitch } from "./button/toggleButton";
import { useState, useEffect } from "preact/hooks";
import { Link } from "preact-router/match";

import "./navbar.css";
import GithubIcon from "../assets/github.svg";
import LinkedinIcon from "../assets/linkedin.svg";
import MastodonIcon from "../assets/mastodon.svg";
import AtIcon from "../assets/at.svg"


export function Navbar({ onNavigate , onCleanBackground}) {
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
      <Link
        href="/"
        className="navbar-logo no-underline text-inherit cursor-pointer bg-transparent border-none p-0 m-0 text-left"
        onClick={() => onCleanBackground(false)}
      >
        <pre className="m-0 p-0 text-secondary">
{` ██████╗  ███████╗ ██╗       ██████╗  ██████╗  ███████╗  █████╗  ███╗   ██╗ 
 ██╔══██╗ ██╔════╝ ██║      ██╔═══██╗ ██╔══██╗ ██╔════╝ ██╔══██╗ ████╗  ██║ 
 ██║  ██║ █████╗   ██║      ██║   ██║ ██████╔╝ █████╗   ███████║ ██╔██╗ ██║ 
 ██║  ██║ ██╔══╝   ██║      ██║   ██║ ██╔══██╗ ██╔══╝   ██╔══██║ ██║╚██╗██║ 
 ██████╔╝ ███████╗ ███████╗ ╚██████╔╝ ██║  ██║ ███████╗ ██║  ██║ ██║ ╚████║ 
 ╚═════╝  ╚══════╝ ╚══════╝  ╚═════╝  ╚═╝  ╚═╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ `}
        </pre>
      </Link>

      {/* Middle: Links */}
      <div className="navbar-links">
        <DropDownButton
          label="About"
          options={[
            { label: "Features", href: "/features" },
            { label: "Road Map", href: "/roadmap" },
          ]}
        />
        <DropDownButton
          label="Resources"
          options={[
            { label: "Tutorial", href: "/tutorial" },
            { label: "FAQ", href: "/faq" },
          ]}
        />
        <DropDownButton
          label="Get involve"
          options={[
            { label: "Ask a question", href: "https://github.com/3l-gee/delorean/discussions" },
            { label: "Open a ticket", href: "https://github.com/3l-gee/delorean/issues" }
          ]}
        />
      </div>

      {/* Right: Icons */}
      <div className="icons navbar-icons">
        <a
          href="https://github.com/3l-gee/delorean"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={GithubIcon} alt="GitHub" className="w-[30px] h-[30px]" />
        </a>

        <a
          href="https://www.linkedin.com/in/raphaelgerth/"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={LinkedinIcon} alt="LinkedIn" className="w-[40px] h-[40px]" />
        </a>

        <a
          href="https://mastodon.social/@3l_gee"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={MastodonIcon} alt="Mastodon" className="w-[32px] h-[32px]" />
        </a>

        <a
          href="mailto:delorean.aixm@gmail.com"
        >
          <img src={AtIcon} alt="At" className="w-[32px] h-[32px]" />
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
