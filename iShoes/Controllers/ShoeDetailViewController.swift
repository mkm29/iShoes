//
//  ShoeDetailViewController.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/22/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import UIKit

class ShoeDetailViewController: UIViewController {
    
    var currentShoe: Shoe?
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureDetail()
    }
    
    func configureDetail() {
        if let shoe = self.currentShoe {
            print("Has shoe #", currentShoe?.number)
            activityIndicator.startAnimating()
            DispatchQueue.main.async {
                self.shoeImageView.image = UIImage(named: String(shoe.number) + ".JPG")
                self.activityIndicator.stopAnimating()
            }
        } else {
            print("Does not have shoe :(")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
