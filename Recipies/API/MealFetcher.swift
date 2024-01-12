//
//  MealFetcher.swift
//  Recipies
//
//  Created by Mike Cohen on 1/11/24.
//

import Foundation

class MealFetcher: Endpoint, ObservableObject {
    @Published var meals: [Meal]?

    init() {
        super.init(baseUrl: "https://themealdb.com/api/json/v1/1/")
    }

    @MainActor
    func fetchMeals() async throws {
        let data = try await fetch(method: "filter.php?c=Dessert")
        let mealResults = try JSONDecoder().decode(MealResults.self, from: data)
        self.meals = mealResults.meals.sorted(by: { $0.name < $1.name })
    }
}
