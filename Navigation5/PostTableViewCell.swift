//
//  PostTableViewCell.swift
//  Navigation5
//
//  Created by Айгерим on 04.04.2024.
//

import Foundation
import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    private var viewCounter = 0

    // MARK: Visual objects
    
    var postAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()

    var postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()

    var postDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    var postLikes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()


    var postViews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    // MARK: - Init section
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(postAuthor)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
        setupConstraints()
        self.selectionStyle = .default
        
      
    }

    required init?(coder: NSCoder) {
        fatalError("lol")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor, multiplier: 0.56),
            postImage.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 16),

            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),

            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    // MARK: - Run loop
    
    func configPostArray(post: Post) {
        postAuthor.text = post.author
        postDescription.text = post.description
        postImage.image = UIImage(named: post.image)
        postLikes.text = "Likes: \(post.likes)"
        viewCounter = post.views
        postViews.text = "Views: \(viewCounter)"
       
    }
    
    public func processImage(
            sourceImage: UIImage,
            filter: ColorFilter,
            completion: (UIImage?) -> Void
        ) {
            applyFilter(
                filter: filter,
                image: sourceImage,
                handler: completion)
        }
    private func applyFilter(
            filter: ColorFilter,
            image: UIImage,
            handler: (UIImage?) -> Void
        ) {
            let context = CIContext()
            guard let source = CIImage(image: image) else { fatalError("Error creating source image") }
            var params = filter.parameters
            params[ColorFilter.imageKey] = source
            guard let filter = CIFilter(
                name: filter.filterName,
                parameters: params
            ) else { fatalError("Error creating filter") }
            
            guard let filteredImage = filter.outputImage else { fatalError("Error filtering image") }
            
            guard let outputImage = context.createCGImage(
                filteredImage,
                from: filteredImage.extent
            ) else { fatalError("Error creating output image") }
            handler(UIImage(cgImage: outputImage))
        }
        
    func incrementPostViewsCounter() {
        viewCounter += 1
        postViews.text = "Views: \(viewCounter)"
    }
}
