// Button.jsx
import './button.css';

export function Button({ label, onClick, href, target = "_self", className = "" }) {
  const combinedClass = `button ${className}`.trim();

  if (href) {
    return (
      <a href={href} target={target} className={combinedClass}>
        {label}
      </a>
    );
  }

  return (
    <button onClick={onClick} className={combinedClass}>
      {label}
    </button>
  );
}
