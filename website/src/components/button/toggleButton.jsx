import { useState } from "preact/hooks";
import "./button.css";

export function ToggleSwitch({
  leftLabel = "Off",
  rightLabel = "On",
  defaultOn = false,
  onToggle,
}) {
  const [enabled, setEnabled] = useState(defaultOn);

  const handleToggle = () => {
    const newValue = !enabled;
    setEnabled(newValue);
    onToggle?.(newValue); // callback to parent
  };

  return (
  <button
    onClick={handleToggle}
    className={`toggle-switch ${enabled ? "enabled" : "disabled"}`}
    aria-pressed={enabled}
  >
    <span className="label left">{leftLabel}</span>
    <span className="label right">{rightLabel}</span>
    <span className="toggle-ball" />
  </button>
  );
}
