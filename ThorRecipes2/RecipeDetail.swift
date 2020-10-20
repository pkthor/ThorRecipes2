//
//  RecipeDetail.swift
//  testMe
//
//  Created by P. Kurt Thorderson on 9/26/20.
//

import SwiftUI

struct RecipeDetail: View {
  @State var isHidden = false
  @State private var rating: Int?
  
  var recipe: Recipe //passed in from RecipeCell
  var body: some View {
    VStack(alignment: .leading) {
      
      Text(recipe.name!)//Recipe title
        .font(.largeTitle)
      
      HStack {
        Image("BOMicon")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 120, height: 120, alignment: .center)
        
        VStack { //next to image
          StarRatingView(rating: $rating, max: 5, forRecipe: recipe)
//          Text(String(recipe.rating))
//            .padding(4)
//            .foregroundColor(.yellow)
          Text(recipe.category!)
            .padding(4)
            .font(.title2)
          Text(String(recipe.difficulty))
            .padding(4)
            .foregroundColor(.red)
        }
        Spacer()
        Button(action: {print("Hello")}, label: {
          Image(systemName: "person.3")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40, alignment: .center)
            .foregroundColor(.purple)
        })
        Spacer()
      }//image and description stack
      .padding()
      
      HStack {
        Text("Prep \(recipe.prepTime) min  *  Cook \(recipe.cookTime) min  *  Servings \(recipe.servings)")
          .font(.headline)
          .foregroundColor(.green)
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
      } //green line
      .padding(.horizontal)
      .padding(.bottom)
      
      HStack {
        Spacer()
        Button(action: {
          isHidden.toggle()
          
        }, label: {
          Text("Ingredients")
            .font(.title3)
            .foregroundColor(isHidden ? .orange : .yellow)
        })
        .disabled(!isHidden)
        
        Spacer()
        Button(action: {isHidden.toggle()}, label: {
          Text("Directions")
            .font(.title3)
            
            .foregroundColor(isHidden ? .yellow : .orange)
        })
        .disabled(isHidden)
        Spacer()
        
      } //ingredients/directions line
      .padding(.bottom)
      
      if isHidden {
        ScrollView(.vertical, showsIndicators: false) {
          Text(recipe.directions!)
            .padding(.bottom, 60)
            .padding(.leading, 40)
            .lineLimit(nil)
            .multilineTextAlignment(.leading)
        }
        
        Text(recipe.recipeDescription!)
        Text(recipe.recipeNotes!)
        Text(recipe.sourceNotes!)
        //        Spacer()
        
      }else {
        ScrollView(.vertical, showsIndicators: false) {
          Text(recipe.ingredients!)
            .padding(.bottom, 60)
            .padding(.leading, 40)
            .lineLimit(nil)
            .multilineTextAlignment(.leading)
        }
        //        Spacer()
        Text(recipe.recipeDescription!)
        Text(recipe.recipeNotes!)
        Text(recipe.sourceNotes!)
        
      }
    }//outermost stack
    .padding(.horizontal,20)
    .padding(.bottom)
    Spacer()
  }
}
