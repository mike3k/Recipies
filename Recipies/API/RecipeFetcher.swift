//
//  RecipeFetcher.swift
//  Recipies
//
//  Created by Mike Cohen on 1/11/24.
//

import Foundation

class RecipeFetcher: Endpoint, ObservableObject {
    @Published var recipe: Recipe?

    init() {
        super.init(baseUrl: "https://themealdb.com/api/json/v1/1/")
    }

    @MainActor
    func fetchRecipe(recipeID: String) async throws {
        let data = try await fetch(method: "lookup.php?i=\(recipeID)")
        let result = try JSONDecoder().decode(RecipeResults.self, from: data)
        self.recipe = result.meals[0]
    }
}
