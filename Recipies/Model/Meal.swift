//
//  Meal.swift
//  Recipies
//
//  Created by Mike Cohen on 1/11/24.
//

import Foundation

struct Meal: Decodable, Identifiable {
    let id: String
    let name: String
    let thumbnail: String
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

struct MealResults: Decodable {
    let meals: [Meal]
}
