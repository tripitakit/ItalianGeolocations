defmodule ItalianGeolocations.ComuniController do
  use ItalianGeolocations.Web, :controller

  alias ItalianGeolocations.EtsServer

  def show(conn, %{"comune" => comune}) do
    results = EtsServer.fetch(comune)
    render conn, "show.json", results: results
  end

  def invalid_param(conn, _params) do
    conn
    |> put_status(400)
    |> json( %{ success: false,
                error: "you didn't provide a city-name to geolocate" } )
  end

end
