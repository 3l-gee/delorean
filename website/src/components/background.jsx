import { useEffect, useState } from "preact/hooks";
import "./background.css";

export function Background({ page, clean}) {
  const [positions, setPositions] = useState([]);
  const randomOffset = (spread) => (Math.random() * 2 - 1) * spread;
  const randomRadius = () => `${20 + Math.random() * 25}vmin`;

  const moveShapesOut = () => {
    const shapes = document.querySelectorAll(".shape");
    const vw = window.innerWidth;
    const vh = window.innerHeight;
    const cx = vw / 2;
    const cy = vh / 2;

      shapes.forEach((el) => {
        // el.classList.add("out");

        const rect = el.getBoundingClientRect();
        const style = window.getComputedStyle(el);
        const matrix = new DOMMatrix(style.transform);

        const visualLeft = rect.left + matrix.m41;
        const visualTop = rect.top + matrix.m42;

        el.style.transition = "transform 0.8s ease, opacity 0.8s ease";
        el.style.position = "absolute";
        el.style.left = visualLeft + "px";
        el.style.top = visualTop + "px";

        el.style.transform = "translate(0,0)";  

        const shapeX = visualLeft + rect.width/2;
        const shapeY = visualTop + rect.height/2;
        const dx = shapeX - cx;
        const dy = shapeY - cy;
        const distance = Math.sqrt(dx*dx + dy*dy);
        const factor = Math.max(vw, vh);

        const moveX = (dx / distance) * factor;
        const moveY = (dy / distance) * factor;

      // el.style.transform = `translate(${moveX}px, ${moveY}px) scale(0.5)`;
    });
  };

  const bringShapesBack = () => {
    const shapes = document.querySelectorAll(".shape");
    shapes.forEach((el) => {
      el.classList.remove("out");
      el.style.transform = "translate(0,0) scale(1)";
      el.style.opacity = "1";
    });
  };

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
      top: 40 + randomOffset(40) + "vh",
      left: 50 + randomOffset(30) + "vw",
      width: Math.random() * 150 + 150 + "px",
      height: Math.random() * 150 + 150 + "px",
      duration: Math.random() * 90 + 45 + "s",
      radius: randomRadius(),
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

  useEffect(() => {
    if (clean) {
      moveShapesOut();  
    } else  {
      bringShapesBack();
      triggerSpeedUp();

    }
  }, [clean]);


  return (
    <div className={`background`}>
      {positions.map((pos, i) => 
        <div className={`box-shape`}>
          <div
            key={i}
            className={`shape shape${i + 1}`}
            style={{
              top: pos.top,
              left: pos.left,
              width: pos.width,
              height: pos.height,
              "--duration": pos.duration,
              "--radius": pos.radius,
            }}
          ></div>
        </div>
      )}
    </div>
  );
}
