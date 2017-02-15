# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :italian_geolocations, ItalianGeolocations.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XZJgCa+4dlL3rFAAcCTVJNNGGywC8Te4H8E8IYav1auRZURyFaR6gGrmQ7XHMpej",
  render_errors: [view: ItalianGeolocations.ErrorView, accepts: ~w(json)],
  pubsub: [name: ItalianGeolocations.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
