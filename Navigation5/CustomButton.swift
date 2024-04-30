//
//  CustomButton.swift
//  Navigation5
//
//  Created by Айгерим on 30.04.2024.
//

import UIKit

final class CustomButton: UIButton {
    
    private let cornerRadius: CGFloat = 12
    private var action: (() -> Void)?

    init(title: String, titleColor: UIColor, action: (() -> Void)?) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.action = action
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        let backgroundImage = UIImage(named: "blue")
        let titleColor = UIColor.white
        autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        translatesAutoresizingMaskIntoConstraints = false
        setBackgroundImage(backgroundImage, for: .normal)
        setTitleColor(titleColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        action?()
    }
}
