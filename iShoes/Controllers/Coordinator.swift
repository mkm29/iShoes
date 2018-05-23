//
//  Coordinator.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/21/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Coordinator {
    
    static let shared = Coordinator()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var shoes: [Shoe] = [Shoe]()
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    init() {
        if let shoes = getShoes() {
            self.shoes = shoes
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    

    // MARK: - Core Data related methods
    
    func getShoes() -> [Shoe]? {
        // setup request
        let request: NSFetchRequest<Shoe> = Shoe.fetchRequest()
        //request.returnsObjectsAsFaults = false
        
        do {
            let result = try appDelegate.persistentContainer.viewContext.fetch(request)
            print("Got \(result.count) shoes")
            return result
            
        } catch {
            print(error.localizedDescription as Any)
        }
        
        return nil
    }
    
    func getShoe(byNumber number: Int) -> Shoe? {
        let request: NSFetchRequest<Shoe> = Shoe.fetchRequest()
        request.predicate = NSPredicate(format: "number == %@", number)
        
        do {
            return try appDelegate.persistentContainer.viewContext.fetch(request).first
        } catch {
            print(error.localizedDescription as Any)
        }
        
        return nil
    }
   
    // MARK: - Shoe image related methods
    
    func getImage(forShoe shoe: Shoe, completion: @escaping (Error?, Data?) -> Void ) {
        if let shoeURL = shoe.imageUrl {
            print("Has image URL string")
            if let url = URL(string: shoeURL) {
                print("Has image URL")
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data, error == nil else {
                        return
                    }
                    print(response?.suggestedFilename ?? url.lastPathComponent)
                    print("Download Finished")
                    completion(nil, data)
                }.resume()
            }
        }
    }
    
    private func loadImage(forShoe shoe: Shoe) {
        // let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        if let path = Bundle.main.path(forResource: String(shoe.number), ofType: "JPG"),
            let imageData = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let image = UIImage(data: imageData),
            let jpgImage = UIImageJPEGRepresentation(image, 0.75)  {
            
            let fileURL = getDocumentsDirectory().appendingPathComponent("\(String(shoe.number)).JPG")
            
            do {
                try jpgImage.write(to: fileURL, options: .atomic)
                shoe.imagePath = fileURL.absoluteString
                appDelegate.saveContext()
            } catch {
                print(error.localizedDescription as Any)
            }
        }
        
    }
    
    
    func storeImage(_ imageName: String, fileExtension: String = "jpg") {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // not sure about file format...looks like Google Drive exports them as JPEG
        let documentPath = documentsURL.path
        print("🔥documentPath: ", documentPath)
        print(FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first)
        // create a filePath URL by appending final path component (name of image)
        // create complete filename
        let filePath = documentsURL.appendingPathComponent("\(String(imageName)).\(fileExtension)")
        print("🔥filePath: \(filePath)")
    }
    
}
