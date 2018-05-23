//
//  Shoe.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/16/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import Foundation
import UIKit


struct ShoeStruct {
    
    var shoeNumber: Int? = 0
    var brand: String = ""
    var model: String = ""
    var colorway: String = ""
    var size: Int = 0
    var price: Double = -1
    var stockxPrice: Double = -1
    var updatedAtString: String = ""
    
    
    var updatedAt: Date? {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yy" //"5/16/18"
            return dateFormatter.date(from: self.updatedAtString)
        }
    }
    var stockxUrlString: String? = ""
    var imageUrlString: String? = ""
    
    var imageUrl: URL? {
        get {
            if self.imageUrlString != nil {
                return URL(string: self.imageUrlString!)
            } else {
                return nil
            }
        }
    }
 
    var stockxUrl: URL? {
        get {
            if self.stockxUrlString != nil {
                return URL(string: self.stockxUrlString!)
            } else {
                return nil
            }
            
        }
    }
    
    init(fromDict dict: [String:Any]) {
        
        if let shoeNumber = dict["shoe_number"] as? Int {
            self.shoeNumber = shoeNumber
        }
        if let brand = dict["brand"] as? String {
            self.brand = brand
        }
        if let model = dict["model"] as? String {
            self.model = model
        }
        if let colorway = dict["colorway"] as? String {
            // until I figure out how to save a [String] in Core Data, just use the string
            self.colorway = colorway
            // split string into components
            //self.colorway = colorway.components(separatedBy: "/")
        }
        if let size = dict["size"] as? Int {
            self.size = size
        }
        if let price = dict["price"] as? Double {
            self.price = price
        }
        if let stockxPrice = dict["stockx_price"] as? Double {
            self.stockxPrice = stockxPrice
        }
        if let updatedAtString = dict["updated_at"] as? String {
            self.updatedAtString = updatedAtString
        }
        if let stockxUrlString = dict["stockx_url"] as? String {
            self.stockxUrlString = stockxUrlString
        }
        if let imageUrlString = dict["image_url"] as? String {
            self.imageUrlString = imageUrlString
        }
    }
    
    
}
