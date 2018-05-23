//
//  ShoeCollectionViewCell.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/22/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    func configureCell(forShoe shoe: Shoe) {
        activityIndicator.startAnimating()
        DispatchQueue.main.async {
            self.shoeImageView.image = UIImage(named: String(shoe.number) + ".JPG")
            self.activityIndicator.stopAnimating()
        }
    }
    
}
