# ItalianGeolocations

ItalianGeolocations API serves Italian cities' geolocations

  * Developed with Elixir/Phoenix and ETS as in-memory database
  * This project is in early alpha stage
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