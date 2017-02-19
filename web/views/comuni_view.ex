defmodule ItalianGeolocations.ComuniView do
  use ItalianGeolocations.Web, :view

  def render("show.json", %{results: results}) do
    case results do
      {:ok, data} ->
        %{
          success: true,
          data: %{
            name: data.name,
            lat: data.lat,
            lng: data.lng
          }
        }

      {:error, :not_found} ->
        %{
          success: false,
          error: :not_found
        }
    end
  end

end
