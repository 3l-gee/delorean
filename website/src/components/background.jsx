import { useEffect, useState } from "preact/hooks";
import "./background.css";

export function Background({ theme }) {
  const [positions, setPositions] = useState([]);

  useEffect(() => {
    // Generate random positions for 4 shapes
    const randomPositions = Array.from({ length: 6 }, () => ({
      top: Math.random() * 80 + 10 + "vh",
      left: Math.random() * 80 + 10 + "vw",
      width: Math.random() * 300 + 300 + "px",
      height: Math.random() * 300 + 100 + "px",
      duration: Math.random() * 90 + 90 + "s", // base duration
    }));
    setPositions(randomPositions);

    let lastScrollY = window.scrollY;

    const handleScroll = () => {
      const currentScrollY = window.scrollY;
      const scrollDown = currentScrollY > lastScrollY;
      lastScrollY = currentScrollY;

      if (scrollDown) {
        document.querySelectorAll(".shape").forEach((el) => {
          const anim = el.getAnimations()[0];
          if (!anim) return;

          const stages = [2, 10, 20, 10, 2, 1]; // last one is reset
          let delay = 0;

          stages.forEach((rate) => {
            setTimeout(() => anim.updatePlaybackRate(rate), delay);
            delay += 250; // 1/4 sec per stage
          });
        });
      }
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  return (
    <div className={`background ${theme}`}>
      {positions.map((pos, i) => (
        <div
          key={i}
          className={`shape shape${i + 1}`}
          style={{
            top: pos.top,
            left: pos.left,
            width: pos.width,
            height: pos.height,
            animationDuration: pos.duration, // still needed for initial speed
          }}
        ></div>
      ))}
    </div>
  );
}
