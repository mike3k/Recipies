//
//  ContentView.swift
//  Recipies
//
//  Created by Mike Cohen on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mealFetcher = MealFetcher()
    var body: some View {
        NavigationView {
            List(mealFetcher.meals ?? []) { meal in
                NavigationLink(destination: DetailView(recipeID: meal.id)) {
                    HStack {
                        AsyncImage(url: URL(string: meal.thumbnail), scale: 1.0, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(height: 60)
                        }) { Image(systemName: "photo") }
                        Text(meal.name)
                    }
                }
            }
        }
        .onAppear() {
            Task {
                try? await mealFetcher.fetchMeals()
            }
        }
    }
}
