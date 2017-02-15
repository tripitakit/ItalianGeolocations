defmodule ItalianGeolocations.Router do
  use ItalianGeolocations.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ItalianGeolocations do
    pipe_through :api
    get "/geolocate/:comune", ComuniController, :show
  end
end
