//
//  File.swift
//  
//
//  Created by MOBILE on 01/07/24.
//

import Foundation
import UIKit

class FullScreenView: UIView {
    
    private let crossButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("✖️", for: .normal)
        button.tintColor = .black
        return button
    }()
    
    
    private let centerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "yourImageName") // Replace with your image
        return imageView
    }()
    
    private let centerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.addTarget(FullScreenView.self, action: #selector(centerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Bottom Label"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .gray
        
        // Add subviews
        addSubview(crossButton)
        addSubview(centerImageView)
        addSubview(centerButton)
        addSubview(bottomLabel)
        
        // Enable Auto Layout
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        centerImageView.translatesAutoresizingMaskIntoConstraints = false
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints
        NSLayoutConstraint.activate([
            // Cross button constraints
            crossButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            // Center image view constraints
            centerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            centerImageView.widthAnchor.constraint(equalToConstant: 100),  // Replace with desired width
            centerImageView.heightAnchor.constraint(equalToConstant: 100), // Replace with desired height
            
            // Center button constraints
            centerButton.topAnchor.constraint(equalTo: centerImageView.bottomAnchor, constant: 20),
            centerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: 100),    // Replace with desired width
            centerButton.heightAnchor.constraint(equalToConstant: 50),    // Replace with desired height
            
            // Bottom label constraints
            bottomLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    @objc private func centerButtonTapped() {
        self.removeFromSuperview()
    }
}
