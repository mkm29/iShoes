//
//  ShoeTableViewCell.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/22/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import UIKit

class ShoeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(forShoe shoe: Shoe) {
        if let brand = shoe.brand, let model = shoe.model {
            brandLabel.text = brand
            print("Setting model labell to: ", model)
            modelLabel.text = model
        }
        activityIndicator.startAnimating()
        DispatchQueue.main.async {
            self.shoeImageView.image = UIImage(named: String(shoe.number) + ".JPG")
            self.activityIndicator.stopAnimating()
        }
    }

}
