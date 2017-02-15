# ItalianGeolocations

ItalianGeolocations is an API server offering Italian cities' geolocations
  
  * It is made with Elixir, Phoenix and ETS as in-memory database
  * This project is in early alpha development stage
  * It's more a kind of playgorund to teach myself some Elixir (for great good!) than a real thing
  * Warning: some coordinates are clearly wrong! Will be fixed as soon as I get them all correct


## API

GET /api/geolocate/<city_name>

Success response:
  {
    success: true, 
    data: {
      comune: "Milano",
      lat: 45.4654219,
      lng: 9.1859243
    }
  }


Error response:
  { 
    success: false,
    error: "not found"
  }
