# ItalianGeolocations

ItalianGeolocations API serves Italian cities' geolocations

  * Developed with Elixir/Phoenix and ETS as in-memory database
  * This project is in early alpha stage
  * The lookup in the ETS table is whole-word and case sensitive

## API

### GET /api/geolocate/{An Italian City Name}

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