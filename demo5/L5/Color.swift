//
//  Color.swift
//  L5
//
//  Created by Artesia Ko on 3/20/21.
//  Copyright © 2021 Kevin Chan. All rights reserved.
//

import UIKit

class Color {
    var color: UIColor
    var hex: String
    var selected: Bool

    init(color: UIColor, hex: String) {
        self.color = color
        self.hex = hex
        self.selected = false
    }
}
