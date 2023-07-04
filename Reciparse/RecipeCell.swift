//
//  RecipeCell.swift
//  Reciparse
//
//  Created by Brandon Ballesteros on 7/3/23.
//
import Nuke
import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Configures the cell's UI for the given meal
    func configure(with recipe: Meal) {
        recipeNameLabel.text = recipe.strMeal.capitalized

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: recipe.strMealThumb, into: recipeImageView)
    }

}
