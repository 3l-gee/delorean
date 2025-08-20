export function Footer() {
  return (
    <footer className="w-full bg-white dark:bg-gray-900 text-gray-700 dark:text-gray-300 py-6 text-center shadow-inner">
      <p className="text-sm">
        &copy; {new Date().getFullYear()} Delorean. All rights reserved.
      </p>
      <div className="flex justify-center gap-4 mt-2">
        <a href="https://github.com/3l-gee/delorean" target="_blank" rel="noopener noreferrer">
          GitHub
        </a>
        <a href="#about">About</a>
        <a href="#contact">Contact</a>
      </div>
    </footer>
  );
}
