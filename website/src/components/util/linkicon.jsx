// src/components/learnmore/linkicon.jsx
import "./linkicon.css";

export function LinkIcon({ label, url, icon, onAction = null}) {
  const handleClick = (e) => {
    if (onAction) {
      e.preventDefault(); // stop default link behavior
      onAction(url);      // pass url (or whatever you need)
    }
  };

  return (
    <li className="learnmore-item">
      {/* First column: right-aligned label */}
      <a
        href={url}
        onClick={handleClick}
        className="learnmore-label"
        target={!onAction ? "_blank" : undefined}
        rel={!onAction ? "noopener noreferrer" : undefined}
      >
        {label}
      </a>

      {/* Second column: left-aligned icon */}
      <div className="learnmore-icon-wrapper">
        <a
          href={url}
          onClick={handleClick}
          className="icons learnmore-icon"
          target={!onAction ? "_blank" : undefined}
          rel={!onAction ? "noopener noreferrer" : undefined}
        >
          <img src={icon} alt={label} className="learnmore-img navbar-icons" />
        </a>
      </div>
    </li>
  );
}
