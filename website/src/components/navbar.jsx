import { DropDownButton } from "./button/dropDownButton";
import { ToggleSwitch } from "./button/toggleButton";
import { useState, useEffect } from "preact/hooks";
import GithubIcon from "../assets/github.svg";
import LinkedinIcon from "../assets/linkedin.svg";
import MastodonIcon from "../assets/mastodon.svg";

export function Navbar() {
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
        // scrolling down
        setShow(false);
      } else {
        // scrolling up
        setShow(true);
      }
      setLastScrollY(currentScrollY);
    };

    window.addEventListener("scroll", handleScroll);

    return () => window.removeEventListener("scroll", handleScroll);
  }, [lastScrollY]);

  return (
    <div
      className={`fixed top-0 left-0 w-full grid grid-cols-3 gap-10 p-[20px] transition-transform duration-300 ease-in-out ${
        show ? "translate-y-0" : "-translate-y-full"
      } bg-[var(--color-bg)] z-50 custom-shadow`}
    >
      {/* Left: Logo */}
      <div className="flex justify-center font-mono text-[8px] sm:text-[10px] md:text-[14px] leading-tight">
        <pre className="m-0 p-0">
      {` ██████╗  ███████╗ ██╗       ██████╗  ██████╗  ███████╗  █████╗  ███╗   ██╗ 
 ██╔══██╗ ██╔════╝ ██║      ██╔═══██╗ ██╔══██╗ ██╔════╝ ██╔══██╗ ████╗  ██║ 
 ██║  ██║ █████╗   ██║      ██║   ██║ ██████╔╝ █████╗   ███████║ ██╔██╗ ██║ 
 ██║  ██║ ██╔══╝   ██║      ██║   ██║ ██╔══██╗ ██╔══╝   ██╔══██║ ██║╚██╗██║ 
 ██████╔╝ ███████╗ ███████╗ ╚██████╔╝ ██║  ██║ ███████╗ ██║  ██║ ██║ ╚████║ 
 ╚═════╝  ╚══════╝ ╚══════╝  ╚═════╝  ╚═╝  ╚═╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ `}
        </pre>
      </div>

      {/* Middle: Links */}
      <div className="flex justify-end gap-[20px] p-[10px] border-r border-gray-300 pr-[10px]">
          <DropDownButton
            label= "About"
            options={[
              { label: "Features", href: "#" },
              { label: "Changelogs", href: "#" },
              { label: "Road Map", href: "#" },
              { label: "Use Case", href: "#" }
            ]}/>
          <DropDownButton
            label= "Resources"
            options={[
              { label: "Documentation", href: "#" },
              { label: "Profile", href: "#" },
              { label: "Settings", href: "#" },
            ]}/>
          <DropDownButton
            label= "Community"
            options={[
              { label: "Get involved", href: "#" },
              { label: "Organisation", href: "#" },

            ]}/>
      </div>

      {/* Right: Icons */}
      <div className="flex items-center pl-[10px] gap-6">
        <a
          href="https://github.com/3l-gee/delorean"
          target="_blank"
          rel="noopener noreferrer"
          className="mr-[20px]"
        >
          <img src={GithubIcon} alt="GitHub" className="w-[30px] h-[30px]" />
        </a>

        <a
          href="https://www.linkedin.com/in/yourusername"
          target="_blank"
          rel="noopener noreferrer"
          className="mr-[20px]"
        >
          <img src={LinkedinIcon} alt="LinkedIn" className="w-[40px] h-[40px]" />
        </a>

        <a
          href="https://mastodon.social/@yourusername"
          target="_blank"
          rel="noopener noreferrer"
          className="mr-[20px]"
        >
          <img src={MastodonIcon} alt="Mastodon" className="w-[26px] h-[26px]" />
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
