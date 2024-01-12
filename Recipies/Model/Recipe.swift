//
//  Recipe.swift
//  Recipies
//
//  Created by Mike Cohen on 1/11/24.
//

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let measure: String
}

struct Recipe: Decodable, Identifiable {
    let id: String
    let name: String
    let thumbnail: String
    let category: String
    let area: String
    let instructions: String
    let youtube: String?
    let source: String?
    let ingredients: [Ingredient]
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case youtube = "strYoutube"
        case source = "strSource"
    }
    // did I mention the JSON is really ugly?
    enum AdditionalKeys: String, CodingKey {
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        thumbnail = try values.decode(String.self, forKey: .thumbnail)
        category = try values.decode(String.self, forKey: .category)
        area = try values.decode(String.self, forKey: .area)
        instructions = try values.decode(String.self, forKey: .instructions)
        youtube = try values.decodeIfPresent(String.self, forKey: .youtube)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        // We need to convert the ingredient/measure pairs into an array of ingredient structs
        // The JSON is very ugly, with 20 each ingredient & measure elements. I wanted to make
        // it into something nicer. I'm sure there must be a less ugly way to do this.
        let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
        var decodedIngredients = [Ingredient]()
        for i in 1...20 {
            if let ingredientKey = Recipe.AdditionalKeys(rawValue: "strIngredient\(i)"),
               let measureKey = Recipe.AdditionalKeys(rawValue: "strMeasure\(i)"),
               let ingredientValue = try? additionalValues.decode(String.self, forKey: ingredientKey),
               let measureValue = try? additionalValues.decode(String.self, forKey: measureKey),
               !ingredientValue.isEmpty {
                decodedIngredients.append(Ingredient(name: ingredientValue, measure: measureValue))
            }
        }
        ingredients = decodedIngredients
    }
}

struct RecipeResults: Decodable {
    let meals: [Recipe]
}
