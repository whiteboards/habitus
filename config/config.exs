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
  secret_key_base: "tnjJasXz9auY3MWQFbyn1BB5Vfyn4RtmzTNbHFlFMk0UDGlp+WoQZfhoZU7CJHRS",
  render_errors: [view: Habitus.ErrorView, accepts: ~w(json)],
  pubsub: [name: Habitus.PubSub,
           adapter: Phoenix.PubSub.PG2]
           
config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Habitus",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET") || "FOwrgCJjD++6ICY6Fy3vj5yGi1JIh2WRQdpj806t+jmtIi+2kU5A+KafedW0yuB3",
  serializer: Habitus.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
