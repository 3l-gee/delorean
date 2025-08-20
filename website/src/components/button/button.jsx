// Button.jsx
import './Button.css';

export function Button({ label, onClick, href, target = "_self" }) {
  if (href) {
    return (
      <a href={href} target={target} className="button">
        {label}
      </a>
    );
  }

  return (
    <button onClick={onClick} className="button">
      {label}
    </button>
  );
}
