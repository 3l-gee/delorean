import { useEffect, useState } from "preact/hooks";
import "./background.css";

export function Background({ theme, page }) {
  const [positions, setPositions] = useState([]);
  const randomOffset = (spread) => (Math.random() * 2 - 1) * spread;

  const triggerSpeedUp = () => {
    document.querySelectorAll(".shape").forEach((el) => {
      const anim = el.getAnimations()[0];
      if (!anim) return;

      const stages = [30, 40, 20, 10, 5, 1]; // last one is reset
      let delay = 0;

      stages.forEach((rate) => {
        setTimeout(() => anim.updatePlaybackRate(rate), delay);
        delay += 300; // 1/4 sec per stage
      });
    });
  };

  useEffect(() => {
    const randomPositions = Array.from({ length: 6 }, () => ({
      top: 50 + randomOffset(50) + "vh",
      left: 50 + randomOffset(40) + "vw",
      width: Math.random() * 300 + 100 + "px",
      height: Math.random() * 300 + 100 + "px",
      duration: Math.random() * 90 + 45 + "s", // base duration
    }));
    setPositions(randomPositions);

    let lastScrollY = window.scrollY;

    const handleScroll = () => {
      const currentScrollY = window.scrollY;
      const scrollDown = currentScrollY > lastScrollY;
      lastScrollY = currentScrollY;

      if (scrollDown) {
        triggerSpeedUp();
      }
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  useEffect(() => {
    if (page) {
      triggerSpeedUp();
    }
  }, [page]);


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
            animationDuration: pos.duration,
          }}
        ></div>
      ))}
    </div>
  );
}
