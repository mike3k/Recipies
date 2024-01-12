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

        ScrollView {
            if let recipe = recipeFetcher.recipe {
                Text(recipe.name).bold()
                VStack(alignment: .leading) {
                    ForEach(recipe.ingredients) { ingredient in
                        Text("\(ingredient.measure) \(ingredient.name)")
                    }
                }
                .padding()
                Text(recipe.instructions)
                .padding()
                AsyncImage(url: URL(string: recipe.thumbnail), scale: 1.0, content: { image in
                    image.resizable().aspectRatio(contentMode: .fit).frame(height: 200)
                }) { Image(systemName: "photo") }


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
