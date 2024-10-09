//
//  Post.swift
//  Navigation5
//
//  Created by Айгерим on 27.03.2024.
//

import Foundation
import UIKit

public struct Post {
    
    
    public var author: String
    public var description: String
    public var image: String?
    public var likes: Int
    public var views: Int
    
    public init(

        author: String,
        description: String,
        image: String? = nil,
        likes: Int,
        views: Int
    ) {
    
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}

//MARK: - Post Title

public struct PostTitle {
    
   public var title: String
    
    public init(title: String) {
        self.title = title
    }
}
