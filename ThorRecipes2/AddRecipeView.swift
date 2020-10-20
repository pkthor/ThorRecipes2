//
//  AddRecipeView.swift
//  ThorRecipes2
//
//  Created by P. Kurt Thorderson on 9/29/20.
//

import SwiftUI

struct AddRecipeView: View {
//  @State var name: String
  @State var category: String
  @State var cookTime: String
  @State var difficulty: String
  @State var directions: String
  @State var familyInfo: String
  @State var ingredients: String
  @State var isMyFavorite: String
  @State var lovedBy: String
  @State var name: String
  @State var prepTime: String
  @State var rating: String
  @State var recipeDescription: String
  @State var recipeNotes: String
  @State var servings: String
  @State var sourceNotes: String
  @State var submittedBy: String
  @State var totalTime: String
  
    var body: some View {
      VStack {
      TextField("category", text: $category)
      TextField("cookTime", text: $cookTime)
      TextField("difficulty", text: $difficulty)
      TextField("directions", text: $directions)
      TextField("familyInfo", text: $familyInfo)
      TextField("ingredients", text: $ingredients)
      TextField("isMyFavorite", text: $isMyFavorite)
      TextField("lovedBy", text: $lovedBy)
      TextField("name", text: $name)
      TextField("prepTime", text: $prepTime)
        
        
//      TextField("rating", text: $rating)
//      TextField("recipeDescription", text: $recipeDescription)
//      TextField("recipeNotes", text: $recipeNotes)
//      TextField("servings", text: $servings)
//      TextField("sourceNotes", text: $sourceNotes)
//      TextField("submittedBy", text: $submittedBy)
//      TextField("totalTime", text: $totalTime)
      }
    }
}

