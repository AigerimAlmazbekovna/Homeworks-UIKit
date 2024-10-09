//
//  UIColorExtention.swift
//  Navigation5
//
//  Created by Айгерим on 08.10.2024.
//

import Foundation
import UIKit
extension UIColor {
    static func createColor(dark: UIColor, any: UIColor) -> UIColor {
        UIColor { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return dark
            } else {
                return any
            }
        }
    }
}
