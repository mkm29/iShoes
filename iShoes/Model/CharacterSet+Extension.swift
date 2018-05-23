//
//  CharacterSet+Extension.swift
//  iShoes
//
//  Created by Mitchell Murphy on 5/21/18.
//  Copyright © 2018 Mitchell Murphy. All rights reserved.
//

import Foundation


extension CharacterSet {
    static var rfc3986Unreserved: CharacterSet {
        return CharacterSet(charactersIn: "-_.~").union(.alphanumerics)
    }
}
