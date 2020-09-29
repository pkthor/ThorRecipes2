//
//  ContentView.swift
//  ThorRecipes2
//
//  Created by P. Kurt Thorderson on 9/29/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.name, ascending: true)],
    animation: .default)
  private var recipes: FetchedResults<Recipe>
  
  var body: some View {
    NavigationView {
      
      List {
        ForEach(recipes) { recipe in
          RecipeCell(recipe: recipe)
        }
        .onDelete(perform: deleteRecipes)
        HStack {
          Spacer()
          Text("\(recipes.count) recipes")
            .foregroundColor(.secondary)
          Spacer()
        }
      }
      .navigationTitle("Recipes")
      .toolbar{
        ToolbarItem(placement: .automatic) {
          Button(action: makeRecipe) {
            Label("Add Recipe", systemImage: "plus")
          }
        }
        #if os(iOS)
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton()
        }
        #endif
      }
    }
  }
  
  
  private func makeRecipe() {
    withAnimation {
      let newRecipe = Recipe(context: viewContext)
      newRecipe.category = "Dessert"
      newRecipe.cookTime = 30
      newRecipe.difficulty = 3
      newRecipe.directions = """
        Just add water
        Stir
        """
      newRecipe.familyInfo = "It's a family favorite"
      newRecipe.ingredients = "Powdered milk"
      newRecipe.isMyFavorite = false
      newRecipe.lovedBy = "All"
      newRecipe.name = "Red nectar"
      newRecipe.prepTime = 0
      newRecipe.rating = 2
      newRecipe.recipeDescription = "Place in big tupperware container, and stir"
      newRecipe.recipeNotes = "Best if done the night before"
      newRecipe.servings = 8
      newRecipe.sourceNotes = "A favorite chore after you finished washing the dishes"
      newRecipe.submittedBy = "Kurt"
      newRecipe.totalTime = 4


      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
  //  func moveRecipes(from: IndexSet, to: Int) {
  //    withAnimation {
  //      recipes.move(fromOffsets: from, toOffset: to)
  //    }
  //  }
  
  private func deleteRecipes(offsets: IndexSet) {
    withAnimation {
      offsets.map { recipes[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
