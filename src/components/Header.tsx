import { Link } from '@tanstack/react-router'

export default function Header() {
  return (
    <header className="p-4 flex gap-2 bg-white text-black justify-between shadow-sm">
      <div className="font-bold text-xl">Star Infinity</div>
      <nav className="flex flex-row gap-6">
        <div className="font-medium">
          <Link to="/">Home</Link>
        </div>
      </nav>
    </header>
  )
}
