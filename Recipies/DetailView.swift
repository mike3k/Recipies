//
//  DetailView.swift
//  Recipies
//
//  Created by Mike Cohen on 1/11/24.
//

import SwiftUI

struct DetailView: View {
    let recipeID: String
    @ObservedObject var recipeFetcher = RecipeFetcher()
    var body: some View {

            VStack {
                if let recipe = recipeFetcher.recipe {
                    Text(recipe.name).bold()
                    List(recipe.ingredients) { ingredient in
                        Text("\(ingredient.measure) \(ingredient.name)")
                    }
                    ScrollView {
                        Text(recipe.instructions)
                    }
                    .padding()
                }
            }
        .padding()
        .onAppear() {
            Task {
                try? await recipeFetcher.fetchRecipe(recipeID:recipeID)
            }
        }
    }

}

#Preview {
    DetailView(recipeID: "53049")
}
