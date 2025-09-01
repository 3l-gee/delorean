// components/Figure.jsx
import "./Figure.css";

export function Figure({ src, alt, caption, className }) {
  return (
    <figure className={`figure-with-caption ${className}`}>
      <img src={src} alt={alt} />
      {caption && <figcaption className="p-[10px] italic text-gray-700">{caption}</figcaption>}
    </figure>
  );
}
