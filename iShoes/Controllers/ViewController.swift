//
//  ViewController.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/16/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    let coordinator = Coordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.async {
            self.imageView.image = UIImage(named: "1.JPG")
        }
    }


}

