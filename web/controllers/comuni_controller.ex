defmodule ItalianGeolocations.ComuniController do
  use ItalianGeolocations.Web, :controller
  alias ItalianGeolocations.EtsServer

  def show(conn, %{"comune" => comune}) do
    results = EtsServer.fetch(comune)
    render conn, "show.json", results: results
  end
  
end


