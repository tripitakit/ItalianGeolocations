use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :italian_geolocations, ItalianGeolocations.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []


# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20


config :logger, format: "$time [$level] $message\n",
  backends: [{LoggerFileBackend, :development_log}, :console]

config :logger, :development_log,
  path: "log/development.log",
  level: :info