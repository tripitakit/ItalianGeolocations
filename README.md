# ItalianGeolocations

ItalianGeolocations is an API server offering Italian cities' geolocations
  
  * It is made with Elixir, Phoenix and ETS as in-memory database
  * This project is in early alpha development stage
  * It's more a kind of playground to teach myself some Elixir (for great good!) than a real thing
  * Warning: some coordinates are clearly wrong! Will be fixed as soon as I get them all correct
  * The lookup in the ETS table is whole-word and case sensitive


## API

### GET /api/geolocate/city

Examples:

/api/geolocate/Milano
~~~
  {
    "success": true, 
    "data": {
      "comune": "Milano",
      "lat": "45.4654219",
      "lng": "9.1859243"
    }
  }
~~~

/api/geolocate/Tokyo
~~~
  { 
    "success": false,
    "error": "not found"
  }
~~~