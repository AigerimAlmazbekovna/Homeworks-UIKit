//
//  Photo.swift
//  Navigation5
//
//  Created by Айгерим on 30.04.2024.
//

import Foundation
import UIKit

struct Photo {
    var image: String
}

extension Photo {
    
    static func makeImages() -> [UIImage] {
        let photos = self.make()
        
        var images: [UIImage] =
        photos.compactMap { UIImage(named: $0.image) }
        
        return images
    }
    
    static func make() -> [Photo] {
        [
        Photo(image: "1"),
        Photo(image: "2"),
        Photo(image: "3"),
        Photo(image: "4"),
        Photo(image: "5"),
        Photo(image: "6"),
        Photo(image: "7"),
        Photo(image: "8"),
        Photo(image: "9"),
        Photo(image: "10"),
        Photo(image: "12"),
        Photo(image: "13"),
        Photo(image: "14"),
        Photo(image: "15"),
        Photo(image: "16"),
        Photo(image: "17"),
        Photo(image: "18"),
        Photo(image: "19"),
        Photo(image: "20")
        ]
    }
}

var photos: [Photo] = Photo.make()
