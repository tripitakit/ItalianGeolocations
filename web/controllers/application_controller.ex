defmodule ItalianGeolocations.ApplicationController do
  use ItalianGeolocations.Web, :controller

  def invalid_request(conn, %{"something" => something}) do
    conn
    |> put_status(404)
    |> json( %{
                success: false,
                status: 404,
                errors: %{
                  source: "/api/#{something}",
                  title: "Invalid Request",
                  details: "You requested a non-existent API"
                }
              }
            )
  end
end