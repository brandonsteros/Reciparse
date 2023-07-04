//
//  RecipeViewController.swift
//  Reciparse
//
//  Created by Brandon Ballesteros on 7/3/23.
//
import Nuke
import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientMeasureLabel: UILabel!
    // A property to store the meal object.
    // We can set this property by passing along the meal object associated with the meal the user tapped in the table view.
    var mealID: String!
        
    var recipe: Recipe?
    
    var measurements: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID ?? "")")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)

        // Create a URLSession using a shared instance and call its dataTask method
        // The data task method attempts to retrieve the contents of a URL based on the specified URL.
        // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
            // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
            do {
                // Create a JSON Decoder
                let decoder = JSONDecoder()

                // Use the JSON decoder to try and map the data to our custom model.
                // RecipeResults.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(RecipeResults.self, from: data)
                
                // Access the array of meals from the `response` property
                let meals = response.meals
                // Execute UI updates on the main thread when calling from a background callback
                let measurements = self?.createIngredientMeasurementTuples(from: meals.first!)
                print(measurements!)
                print("✅ \(meals)")
                DispatchQueue.main.async {
                    self?.recipe = meals.first
                    self?.measurements = measurements
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //         Load the image located at the `strMealThumb` URL and set it on the image view.
        Nuke.loadImage(with: self.recipe!.strMealThumb, into: recipeImageView)
        
        // Set labels with the associated recipe values.
        recipeNameLabel.text = self.recipe?.strMeal
        instructionsLabel.text = self.recipe?.strInstructions
        ingredientMeasureLabel.text = measurements
        print(measurements)
        
    }
    
    func createIngredientMeasurementTuples(from recipe: Recipe) -> String {
        var tuples: [(String, String)] = []
        var resultString = ""

        let ingredients = [
            recipe.strIngredient1, recipe.strIngredient2, recipe.strIngredient3,
            recipe.strIngredient4, recipe.strIngredient5, recipe.strIngredient6,
            recipe.strIngredient7, recipe.strIngredient8, recipe.strIngredient9,
            recipe.strIngredient10, recipe.strIngredient11, recipe.strIngredient12,
            recipe.strIngredient13, recipe.strIngredient14, recipe.strIngredient15,
            recipe.strIngredient16, recipe.strIngredient17, recipe.strIngredient18,
            recipe.strIngredient19, recipe.strIngredient20
        ]
        
        let measurements = [
            recipe.strMeasure1, recipe.strMeasure2, recipe.strMeasure3,
            recipe.strMeasure4, recipe.strMeasure5, recipe.strMeasure6,
            recipe.strMeasure7, recipe.strMeasure8, recipe.strMeasure9,
            recipe.strMeasure10, recipe.strMeasure11, recipe.strMeasure12,
            recipe.strMeasure13, recipe.strMeasure14, recipe.strMeasure15,
            recipe.strMeasure16, recipe.strMeasure17, recipe.strMeasure18,
            recipe.strMeasure19, recipe.strMeasure20
        ]
        
        for (ingredient, measurement) in zip(ingredients, measurements) {
            if let ingredient = ingredient, !ingredient.isEmpty,
               let measurement = measurement, !measurement.isEmpty {
                tuples.append((ingredient, measurement))
            }
        }
        for tuple in tuples {
            let tupleString = "\(tuple.0.capitalized), (\(tuple.1))"
            resultString += tupleString + "\n"
        }
        return resultString

    }
    

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

