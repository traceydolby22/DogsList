//
//  DetailViewController.swift
//  Dogs List
//
//  Created by Tracey Dolby on 11/29/23.
//

import UIKit

class DetailViewController: UIViewController {
  init (imageUrl: URL, name: String, temperament: String) {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .white
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    Task{
      @MainActor in 
      if let data = try? Data(contentsOf: imageUrl) {
        image.image = UIImage(data: data)
      }
    }
    // this handles the way the modal view looks. 
    let nameLabel = UILabel()
    nameLabel.text = "name: \(name)"
    nameLabel.lineBreakMode = .byWordWrapping
    nameLabel.numberOfLines = 0
    nameLabel.frame = CGRect(x: 100, y: 100, width: 80, height: 60)
    let temperamentLabel = UILabel()
    temperamentLabel.text = "temperament: \(temperament)"
    temperamentLabel.lineBreakMode = .byWordWrapping
    temperamentLabel.numberOfLines = 0
    temperamentLabel.frame = CGRect(x: 100, y: 100, width: 80, height: 60)
    let stack = UIStackView(arrangedSubviews: [image, nameLabel, temperamentLabel])
    stack.spacing = 20
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    view.addSubview(stack) // adds view we created onto the screen
    NSLayoutConstraint.activate([ 
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      image.widthAnchor.constraint(equalToConstant: 200),
      image.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
