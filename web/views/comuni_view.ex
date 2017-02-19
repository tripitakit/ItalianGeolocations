defmodule ItalianGeolocations.ComuniView do
  use ItalianGeolocations.Web, :view

  def render("show.json", %{results: results}) do
    case results do
      {:ok, data} ->
        %{
          success: true,
          status: 200,
          data: %{
            name: data.name,
            lat: data.lat,
            lng: data.lng
          }
        }

      {:error, :not_found, name} ->
        %{
          success: false,
          status: 200,
          errors: %{
            source: "/api/geolocate/#{name}",
            title: "City not found",
            details: "Sorry, we could not find the city-name you asked for"
          }
        }
    end
  end

end



