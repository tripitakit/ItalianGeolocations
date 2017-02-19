defmodule ItalianGeolocations.Router do
  use ItalianGeolocations.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ItalianGeolocations do
    pipe_through :api
    get "/geolocate/:comune", ComuniController, :show
    get "/geolocate", ComuniController, :null_param
    get "/:something", ApplicationController, :invalid_request
  end
end
