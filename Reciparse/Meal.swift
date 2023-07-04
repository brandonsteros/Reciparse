//
//  Recipe.swift
//  Reciparse
//
//  Created by Brandon Ballesteros on 7/2/23.
//

import Foundation

struct MealsResults: Decodable {
    let meals: [Meal]
}
struct RecipeResults: Decodable {
    let meals: [Recipe]
}


struct Meal: Decodable {
    let strMeal: String
    let strMealThumb : URL
    let idMeal: String
}
    //Detail Properties
struct Recipe: Decodable {
    let strMeal: String
    let strMealThumb : URL
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}


extension Meal {
    static var mockRecipies: [Meal] = [
        Meal(strMeal: "Apam balik",
             strMealThumb:URL(string:"https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")!,
             idMeal: "53049"),
        Meal(strMeal: "Apple & Blackberry Crumble",
             strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!,
             idMeal: "52893"),
        Meal(strMeal: "Apple Frangipan Tart",
             strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg")!,
             idMeal: "52768")
        
    ]
    
}
