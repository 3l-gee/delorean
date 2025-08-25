import { useEffect, useState } from "preact/hooks";
import "./background.css";

export function Background({ page, clean}) {
  const [positions, setPositions] = useState([]);
  const randomOffset = (spread) => (Math.random() * 2 - 1) * spread;
  const randomRadius = () => `${15 + Math.random() * 20}vmin`;

  const moveShapesOut = () => {
    const shapes = document.querySelectorAll(".shape");
    const vw = window.innerWidth;
    const vh = window.innerHeight;
    const cx = vw / 2;
    const cy = vh / 2;
    shapes.forEach((el) => {
      const angle = Math.random() * 2 * Math.PI; // random direction
      const distance = 200 + Math.random() * 200; // random distance from center

      const x = Math.cos(angle) * distance;
      const y = Math.sin(angle) * distance;

      el.style.setProperty("--radius-x", `${x}vh`);
      el.style.setProperty("--radius-y", `${y}vh`);
    });
  };

  const bringShapesBack = () => {
    const shapes = document.querySelectorAll(".shape");
    shapes.forEach((el) => {
      el.style.setProperty("--radius-x", `0vh`);
      el.style.setProperty("--radius-y", `0vh`);
    });
  };

  const triggerSpeedUp = () => {
    document.querySelectorAll(".orbit-container", ".rotation-container").forEach((el) => {
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
    const randomPositions = Array.from({ length: 7 }, () => ({
      top: 40 + randomOffset(25) + "vh",
      left: 40 + randomOffset(40) + "vw",
      width: Math.random() * 100 + 100 + "px",
      height: Math.random() * 100 + 100 + "px",
      duration: Math.random() * 90 + 45 + "s",
      radius: randomRadius(),
    }));
    setPositions(randomPositions);

    setTimeout(() => {
      const shapes = document.querySelectorAll(".shape");
      shapes.forEach((el) => {
        const angle = Math.random() * 2 * Math.PI;
        const distance = 200 + Math.random() * 200;
        const x = Math.cos(angle) * distance;
        const y = Math.sin(angle) * distance;
        el.style.setProperty("--radius-x", `${x}vh`);
        el.style.setProperty("--radius-y", `${y}vh`);
      });
    }, 0);

    // Bring shapes back after 1 second
    setTimeout(() => {
      triggerSpeedUp();
      bringShapesBack();
    }, 0);

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
        <div className={`orbit-container`}
          style={{
              top: pos.top,
              left: pos.left,
              "--duration": pos.duration,
              "--radius": pos.radius,
            }}
          >
          <div className={`rotation-container`}
              style={{
                  "--duration": pos.duration
              }}
            >
            <div
              key={i}
              className={`shape shape${i + 1}`}
              style={{
                width: pos.width,
                height: pos.height,
              }}
            ></div>
          </div>
        </div>
      )}
    </div>
  );
}
