# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :habitus,
  ecto_repos: [Habitus.Repo]

# Configures the endpoint
config :habitus, Habitus.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4vudqUjzxlCYhmCjFynqZUjWxlT8rgbXUw+IOwMHzMQFGdSal778Mx88sr/2ldLU",
  render_errors: [view: Habitus.ErrorView, accepts: ~w(json)],
  pubsub: [name: Habitus.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :plug, :mimes, %{  
    "application/vnd.api+json" => ["json-api"]
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
