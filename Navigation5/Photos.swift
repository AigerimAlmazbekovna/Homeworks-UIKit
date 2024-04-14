//
//  Photos.swift
//  Navigation5
//
//  Created by Айгерим on 05.04.2024.
//

import Foundation
import UIKit

final class Photos {
    
    static let shared = Photos()
    
    let examples: [UIImage]
    
    private init() {
        var photos = [UIImage]()
        for i in 1...20 { photos.append((UIImage(named: "\(i)") ?? UIImage())) }
        examples = photos.shuffled()
    }
}
