# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bible,
  ecto_repos: [Bible.Repo]

# Configures the endpoint
config :bible, BibleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2N0Oh9/ldqhW9DvBkfmU4yqaYuiFssPqIawFRaXv6y7+gUMhPrAlITaOt/cjsrn/",
  render_errors: [view: BibleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bible.PubSub,
  live_view: [signing_salt: "C/HGY4j2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
