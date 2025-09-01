import { Link } from "preact-router/match";
import "./button.css";

export function Button({ label, onClick, href, target = "_self", className = "", type = "button" }) {
  const combinedClass = `button ${className}`.trim();

  if (href) {
    if (href.startsWith("http")) {
      // external link
      return (
        <a
          href={href}
          target={target}
          className={combinedClass}
          rel={target === "_blank" ? "noopener noreferrer" : undefined}
          onClick={onClick}
        >
          {label}
        </a>
      );
    } else {
      // internal SPA link
      return (
        <Link href={href} className={combinedClass} onClick={onClick}>
          {label}
        </Link>
      );
    }
  }

  // normal button
  return (
    <button onClick={onClick} className={combinedClass} type={type}>
      {label}
    </button>
  );
}
