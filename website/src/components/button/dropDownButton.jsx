import { useState, useRef, useEffect } from "react";
import "./button.css";

export function DropDownButton({ label, options }) {
  const [open, setOpen] = useState(false);
  const dropdownRef = useRef();

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target)) {
        setOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  return (
    <div className={`dropdown-container ${open ? "open" : ""}`} ref={dropdownRef}>
        <button className="button" onClick={() => setOpen(!open)}>
            <span className="button-label">{label}</span>
            <span className={`arrow ${open ? "open" : ""}`}>▼</span>
        </button>

      {open && (
        <ul className="dropdown-menu">
          {options.map((opt, idx) => (
            <li key={idx}>
              {opt.href ? (
                <a href={opt.href} target={opt.target || "_self"} className="dropdown-item">
                  {opt.label}
                </a>
              ) : (
                <button onClick={() => { opt.onClick?.(); setOpen(false); }} className="dropdown-item">
                  {opt.label}
                </button>
              )}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
