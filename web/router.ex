defmodule ItalianGeolocations.Router do
  use ItalianGeolocations.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end



  scope "/api", ItalianGeolocations do
    pipe_through :api
    get "/geolocate/:comune", ComuniController, :show
    get "/geolocate", ComuniController, :null_param
    get "/:something", BadRequestsController, :invalid_api_request
  end

  scope "/", ItalianGeolocations do
    pipe_through :api
    get "/:something", BadRequestsController, :invalid_root_request
  end
  
end
