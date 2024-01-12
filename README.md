This is a simple demo app written in SwiftUI which uses [The MealDB API](https://themealdb.com/api.php) to fetch a list of deserts and allow you to see the full recipe & details.

The trickiest part was decoding the JSON returned for recipes, since it uses a series of 20 keys for each ingredient & measure, when a nested array would have been much nicer. When I decode the JSON, that's exactly what I do with it.
