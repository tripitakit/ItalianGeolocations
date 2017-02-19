# ItalianGeolocations

ItalianGeolocations API serves Italian cities' geolocations

  * Developed with Elixir/Phoenix and ETS as in-memory database
  * This project is in early alpha stage
  * City names queries are case-insensitive but whole-word (no partial names)

## API

### GET /api/geolocate/{An Italian city name}

Examples:

GET /api/geolocate/Milano

Status 200 OK
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

GET /api/geolocate/Tokyo

Status 200 OK
~~~
  {
    "success": false,
    "error": "not found"
  }
~~~

GET /api/geolocate

Status 400 BAD REQUEST
~~~
  {
    "success": false,
    "error": "you didn't provide a city-name to geolocate"
  }
~~~
