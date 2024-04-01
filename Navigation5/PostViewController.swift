//
//  PostViewController.swift
//  Navigation5
//
//  Created by Айгерим on 27.03.2024.
//

import UIKit
import StorageService

final class PostViewController: UIViewController {
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemPink
        
        // add a button in the navigtion bar
        let barButton = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(tapInfoButton))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func tapInfoButton() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
