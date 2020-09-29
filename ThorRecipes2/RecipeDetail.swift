//
//  RecipeDetail.swift
//  testMe
//
//  Created by P. Kurt Thorderson on 9/26/20.
//

import SwiftUI

struct RecipeDetail: View {
  @State var isHidden = false
  
  var recipe: Recipe
  var body: some View {
    VStack(alignment: .leading) {
      
      Text(recipe.name!)
        .font(.largeTitle)
      
      HStack {
        Image("BOMicon")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 120, height: 120, alignment: .center)
        
        VStack {
          
          Text(String(recipe.rating))
            .padding(4)
            .foregroundColor(.yellow)
          Text(recipe.category!)
            .padding(4)
            .font(.title2)
          Text(String(recipe.difficulty))
            .padding(4)
            .foregroundColor(.red)
        }
        Spacer()
      }
      .padding()
      
      HStack {
        Text("Prep \(recipe.prepTime) mins  *  Cook \(recipe.cookTime) mins  *  Servings \(recipe.servings)")
          .font(.headline)
        //        VStack {
        //          Text(recipe.name!)
        //          Text(String(recipe.rating))
        //          Text("Submitted by:\(recipe.submittedBy!)")
        //        }
        //        .padding(.horizontal)
        
        //        Text(recipe.familyInfo!)
        //          .multilineTextAlignment(.trailing)
        //          .lineLimit(nil)
        //          .padding(10)
        //        //            .font(
        //        Spacer()
      }
      .padding(.horizontal)
      .padding(.bottom)
      
      HStack {
        Spacer()
        Button(action: {showIngredients()}, label: {
          Text("Ingredients")
            .font(.title3)
            .foregroundColor(isHidden ? .white : .yellow)
        })
        Spacer()
        Button(action: {showDirections()}, label: {
          Text("Directions")
            .font(.title3)
          
            .foregroundColor(isHidden ? .yellow : .white)
        })
        Spacer()
        
      }
      .padding(.bottom)
      
      if isHidden {
        Text(recipe.directions!)
          .padding(.bottom, 60)
          .padding(.horizontal, 40)
          .lineLimit(nil)
          .multilineTextAlignment(.leading)
        Text(recipe.recipeDescription!)
        Text(recipe.recipeNotes!)
        Text(recipe.sourceNotes!)
        
      }else {
        Text(recipe.ingredients!)
          .padding(.bottom, 60)
          .padding(.horizontal, 40)
          .lineLimit(nil)
          .multilineTextAlignment(.leading)
        Text(recipe.recipeDescription!)
        Text(recipe.recipeNotes!)
        Text(recipe.sourceNotes!)
        
      }
    }
    .padding(.horizontal)
    Spacer()
  }
  private func showIngredients() {
    isHidden = false
  }
  private func showDirections() {
    isHidden = true
  }
}
