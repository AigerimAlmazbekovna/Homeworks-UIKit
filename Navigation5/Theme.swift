//
//  Theme.swift
//  Navigation5
//
//  Created by Айгерим on 28.03.2024.
//

import Foundation
import UIKit
protocol ThemeProtokol {
    var backroundColor: UIColor { get }
}
class Theme {
    static var currentColor: ThemeProtokol = ColorSetForButton()
}
