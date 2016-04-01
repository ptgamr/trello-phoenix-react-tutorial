# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :trello, Trello.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "Ih4ujklpZhNY/MclWuUm2qREUzqEorlBlZ5jRJJURPZ8sQ7tP0R+eAq71jUVWdW0",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Trello.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  issuer: "Trello",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "my awesome secret",
  serializer: Trello.GuardianSerializer
