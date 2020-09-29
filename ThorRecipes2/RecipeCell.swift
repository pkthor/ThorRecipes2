//
//  RecipeCell.swift
//  testMe
//
//  Created by P. Kurt Thorderson on 9/27/20.
//

import SwiftUI


struct RecipeCell: View {
  var recipe: Recipe
  var body: some View {
    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
      Image(systemName: "photo")
        .cornerRadius(8)
      
      VStack(alignment: .leading) {
        Text(recipe.name!)
          .font(.headline)
        HStack{
          Spacer()
          Text(String(recipe.rating) + " stars")
            .font(.subheadline)
            .foregroundColor(Color.blue)
          Spacer()
        }
        Text(recipe.submittedBy!)
          .font(.body)
          .foregroundColor(Color.red)
          .padding(.leading,10)
      }
    }
  }
}
