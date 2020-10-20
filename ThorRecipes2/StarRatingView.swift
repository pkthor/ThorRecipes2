//
//  StarRatingView.swift
//  ThorRecipes2
//
//  Created by P. Kurt Thorderson on 10/18/20.
//

import SwiftUI

struct StarRatingView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @Binding var rating: Int?
  var max: Int = 5
  var forRecipe:Recipe
  
  private func starType(index: Int, initialRating:Int) -> String {
    
    if let rating = self.rating {
      
      return index <= rating ? "star.fill" : "star"
    } else {

///////////This isn't quite right. Wrong number of filled stars.

      return index < initialRating ? "star.fill" : "star"
    }
    
  }
  
  var body: some View {
    HStack {
      ForEach(0..<(max), id: \.self) { index in
        
        Image(systemName: self.starType(index: index, initialRating: Int(forRecipe.rating)))
          .foregroundColor(Color.orange)
          .frame(width: 10)
          
          .onTapGesture {
            self.rating = index
            forRecipe.rating = Int16(index)
            
            do {
              try viewContext.save()
            } catch {
              let nsError = error as NSError
              fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
          }
      }
    }
  }
}
