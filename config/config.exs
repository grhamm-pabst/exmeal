# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exmeal,
  ecto_repos: [Exmeal.Repo]

# Configures the endpoint
config :exmeal, ExmealWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GCKtj/ubMFjDsR9ceG0dnvOIWMqd7u22oU72IDw+JlfmV8aCWns7GguWxcK/7LRV",
  render_errors: [view: ExmealWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Exmeal.PubSub,
  live_view: [signing_salt: "QZzmuY/8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
