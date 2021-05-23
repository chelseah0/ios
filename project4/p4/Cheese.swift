//
//  Cheese.swift
//  p4
//
//  Created by Lucas Ho on 09/05/2021.
//

import Foundation

enum CheeseRating {
    case disgusting
    case meh
    case alright
    case decent
    case nice
}

class Cheese {
    var name: String
    var isFavourite: Bool
    var rating: CheeseRating
    
    init(name: String, isFavourite: Bool, rating: CheeseRating) {
        self.name = name
        self.isFavourite = isFavourite
        self.rating = rating
    }
    
    func getRatingString() -> String {
        switch rating {
        case .disgusting:
            return "Disgustang"
        case .meh:
            return "meh"
        case .alright:
            return "alright"
        case .decent:
            return "decent"
        case .nice:
            return "nice"
        }
    }
}
