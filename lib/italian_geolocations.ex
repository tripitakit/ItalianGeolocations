defmodule ItalianGeolocations do
  @moduledoc """
    A Phoenix application which serves an API responding to italian cities
    geolocation queries by city name.
    It is nothing more than a toy project to teach myself some Elixir/Phoenix and ETS.
    The only API provided by the application is /api/geolocate/<city name>.
    It also attempts to gently handle bad requests with json error responses.
  """
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(ItalianGeolocations.Endpoint, []),
      # Start your own worker by calling: ItalianGeolocations.Worker.start_link(arg1, arg2, arg3)
      worker(ItalianGeolocations.EtsServer, [[name: ItalianGeolocations.EtsServer]]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ItalianGeolocations.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ItalianGeolocations.Endpoint.config_change(changed, removed)
    :ok
  end
end
