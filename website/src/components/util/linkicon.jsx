// src/components/learnmore/linkicon.jsx
import "./linkicon.css";

export function LinkIcon({ label, url, icon }) {
  return (
    <li className="learnmore-item">
      {/* First column: right-aligned label */}
      <a
        href={url}
        target="_blank"
        rel="noopener noreferrer"
        className="learnmore-label"
      >
        {label}
      </a>

      {/* Second column: left-aligned icon */}
      <div className="learnmore-icon-wrapper">
        <a
          className="icons learnmore-icon"
          href={url}
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={icon} alt={label} className="learnmore-img navbar-icons" />
        </a>
      </div>
    </li>
  );
}
