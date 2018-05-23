//
//  Shoe+CoreDataProperties.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/21/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//
//

import Foundation
import CoreData


extension Shoe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shoe> {
        return NSFetchRequest<Shoe>(entityName: "Shoe")
    }

    @NSManaged public var brand: String?
    @NSManaged public var colorway: String?
    @NSManaged public var imagePath: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var model: String?
    @NSManaged public var number: Int16
    @NSManaged public var price: Double
    @NSManaged public var size: Double
    @NSManaged public var stockxPrice: Double
    @NSManaged public var stockxUrl: String?
    @NSManaged public var updatedAt: String?

    
    func makeFilename() -> String {
        guard let brand = self.brand, let model = self.model else {
            return String(self.number)
        }
        // replace all spaces
        let brandSanitized = brand.replacingOccurrences(of: " ", with: "_")
        let modelSanitized = model.replacingOccurrences(of: " ", with: "_")
        let fname = String(self.number) + "_\(brandSanitized)_\(modelSanitized)".lowercased() + ".JPG"
        
        let charactersToRemove = CharacterSet(charactersIn: "._").union(.alphanumerics).inverted
        return fname.components(separatedBy: charactersToRemove).joined()
    }
    
}
