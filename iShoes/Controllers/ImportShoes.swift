//
//  ImportShoes.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/16/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import Foundation
import UIKit


class ImportShoes {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getShoesFromJSON() -> [ShoeStruct] {
        var shoes = [ShoeStruct]()
        // 1. Get the Shoes JSON string from shoes.json
        if let path = Bundle.main.path(forResource: "shoes", ofType: "json"), let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
            
            do {
                let json =  try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                // JSONObjectWithData returns AnyObject so the first thing to do is to downcast to dictionary type
                print("Got the JSON!")
                
                if let shoesDict = json as? [[String:Any]] {
                    print("Converted to [[String:String]]")
                    for shoeDict in shoesDict {
                        let shoe = ShoeStruct.init(fromDict: shoeDict)
                        shoes.append(shoe)
                    }
                    
                } else {
                    print("Could not conver to dictionary :(")
                }
            } catch {
                print(error.localizedDescription as Any)
            }
        }
        return shoes
    }
    
    func shoeFromStruct(_ shoe: ShoeStruct) {
        let newShoe = Shoe(context: self.appDelegate.persistentContainer.viewContext)
        newShoe.brand = shoe.brand
        newShoe.colorway = shoe.colorway
        newShoe.imageUrl = shoe.imageUrlString
        newShoe.model = shoe.model
        if let number = shoe.shoeNumber {
            newShoe.number = Int16(number)
        }
        newShoe.price = shoe.price
        newShoe.stockxPrice = shoe.stockxPrice
        newShoe.size = Double(shoe.size)
        newShoe.stockxUrl = shoe.stockxUrlString
        newShoe.updatedAt = shoe.updatedAtString
        newShoe.imagePath = newShoe.makeFilename()
        
        self.appDelegate.saveContext()
    }
}
