# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_ueberauth_guardian,
  ecto_repos: [PhoenixUeberauthGuardian.Repo]

# Configures the endpoint
config :phoenix_ueberauth_guardian, PhoenixUeberauthGuardian.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xJPCRpLvXaPnJIb+C+ZBkOt5TD7xwKPLth7J9yE4cGmjlqnf66sP58dNNYdMCvgh",
  render_errors: [view: PhoenixUeberauthGuardian.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixUeberauthGuardian.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
