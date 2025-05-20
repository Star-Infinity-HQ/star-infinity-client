import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/')({
  component: HomePage,
})

function HomePage() {
  return (
    <div className="container mx-auto p-8">
      <h1 className="text-3xl font-bold mb-6">Star Infinity</h1>
      <p className="text-lg mb-4">
        Welcome to the Star Infinity application.
      </p>
    </div>
  )
}
