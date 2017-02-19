# ItalianGeolocations

ItalianGeolocations API serves Italian cities' geolocations

  * Developed with Elixir/Phoenix and ETS as in-memory database
  * This project is in early alpha stage
  * City names queries are case-insensitive but whole-word (no partial names)

## API

### GET /api/geolocate/{An Italian city name}

Examples:

/api/geolocate/Milano

Status 200
~~~
  {
    "success": true,
    "data": {
      "name": "Milano",
      "lat": "45.4654219",
      "lng": "9.1859243"
    }
  }
~~~

/api/geolocate/Tokyo

Status 200
~~~
  {
    "success": false,
    "error": "not found"
  }
~~~