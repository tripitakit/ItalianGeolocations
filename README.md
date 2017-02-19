# ItalianGeolocations

ItalianGeolocations API serves Italian cities' geolocations

  * Developed with Elixir/Phoenix and ETS as in-memory database
  * City names queries are case-insensitive and whole-word (so -atm- no partial names, sorry)
  * It gently handles request errors (see the examples below)
  * Deployed in development at http://www.codestep.it:4000

## API

### GET /api/v1/geolocate/{An Italian city name}

Examples:

### http://www.codestep.it:4000/api/geolocate/milano

Status 200 OK
~~~
  {
    "success": true,
    "status": 200,
    "data": {
      "name": "Milano",
      "lat": "45.4654219",
      "lng": "9.1859243"
    }
  }
~~~

### http://www.codestep.it:4000/api/geolocate/tokyo

Status 200 OK
~~~
  {
    "success": false,
    "status": 200,
    "errors": {
      "title": "City not found",
      "source": "/api/geolocate/tokyo",
      "details": "Sorry, we could not find the city-name you asked for"
    }
  }
~~~

### http://www.codestep.it:4000/api/geolocate

Status 400 BAD REQUEST
~~~
  {
    "success": false,
    "status": 400,
    "errors": {
      "title": "Invalid Request",
      "source": "/api/geolocate",
      "details": "You didn't provide a city-name to geolocate"
    }
  }
~~~

### http://www.codestep.it:4000/api/foo

Status 404 NOT FOUND
~~~
  {
    "success": false,
    "status": 404,
    "errors": {
      "title": "Invalid Request",
      "source": "/api/foo",
      "details": "You requested a non-existent API"
    }
  }
~~~

### http://www.codestep.it:4000/bar

Status 404 NOT FOUND
~~~
{
	"success": false,
	"status": 404,
	"errors": {
		"title": "Invalid Request",
		"source": "/bar",
		"details": "You requested a non-existent route"
	}
}
~~~