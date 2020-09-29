//
//  RecipeDetail.swift
//  testMe
//
//  Created by P. Kurt Thorderson on 9/26/20.
//

import SwiftUI

struct RecipeDetail: View {
  var recipe: Recipe
    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Spacer()
          Image(systemName:"photo")
          VStack {
            Text(recipe.name!)
            Text(String(recipe.rating))
            Text(recipe.submittedBy!)
          }
          .padding(.horizontal)
          
          Text(recipe.familyInfo!)
            .multilineTextAlignment(.trailing)
            .lineLimit(nil)
            .padding(10)
//            .font(
          Spacer()
        }
        .padding(.bottom)
        HStack {
          Spacer()
          Text("Prep time: \(recipe.prepTime)")
          Spacer()
          Text("Cook time: \(recipe.cookTime)")
          Spacer()
          Text("Serves: \(recipe.servings)")
          Spacer()
        }
        .padding(.bottom, 24.0)
        Text(recipe.recipeDescription!)
          .padding(.bottom)
        Text(recipe.ingredients!)
          .padding(.bottom)
        Text(recipe.directions!)
          .padding(.bottom)
        Text(recipe.recipeNotes!)
          .padding(.bottom)
        Text(recipe.sourceNotes!)
          .padding(.bottom)
      }
      .padding(.horizontal)
      
      
    }
}

//struct RecipeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetail(recipe: testData[1])
//    }
//}
