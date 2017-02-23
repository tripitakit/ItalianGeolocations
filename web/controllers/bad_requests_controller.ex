defmodule ItalianGeolocations.BadRequestsController do
  use ItalianGeolocations.Web, :controller

  def invalid_api_request(conn, %{"something" => something}) do
    error = {"/api/#{something}", "You requested a non-existent API"}
    respond_invalid_request_with(conn, error)
  end

  def invalid_sub_api_request(conn, %{"something" => something, "someother" => someother}) do
    error = {"/api/#{something}/#{someother}", "You requested a non-existent API"}
    respond_invalid_request_with(conn, error)
  end


  def invalid_route_request(conn, %{"something" => something}) do
    error = {"/#{something}", "You requested a non-existent route"}
    respond_invalid_request_with(conn, error)
  end

  def invalid_sub_route_request(conn, %{"something" => something, "someother" => someother}) do
    error = {"/#{something}/#{someother}", "You requested a non-existent route"}
    respond_invalid_request_with(conn, error)
  end

  def invalid_root_request(conn, _) do
    error = {"/", "You requested a non-existent route"}
    respond_invalid_request_with(conn, error)
  end


  defp respond_invalid_request_with(conn, error) do
    {source, details} = error
    conn
    |> put_status(404)
    |> json(%{
                success: false,
                status: 404,
                errors: %{
                  source: source,
                  title: "Invalid Request",
                  details: details
                }
            })
  end


  def null_param(conn, _params) do
    conn
    |> put_status(400)
    |> json( %{
                success: false,
                status: 400,
                errors: %{
                  source: "/api/geolocate",
                  title: "Invalid Request",
                  details: "You didn't provide a city-name to geolocate"
                }
              }
            )
  end
end