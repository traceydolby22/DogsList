//
//  CollectionViewTableViewCell.swift
//  Dogs List
//
//  Created by Tracey Dolby on 9/29/23.
//

import UIKit


class CollectionViewTableViewCell: UITableViewCell {

  static let identifier = "CollectionViewTableViewCell"

 // private var groups:[Groups] = []
  // array of images to store and grab what we need. swift allows you to run code after you set a property..
  var dogModels = [DogBreedsResponse](){
    didSet {
      Task{
        @MainActor in //?
        collectionView.reloadData()
      }
    }
  }
  weak var parentViewController: DogsList?

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 200, height: 200)
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    return collectionView

  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .systemBlue
    contentView.addSubview(collectionView)

    collectionView.delegate = self
    collectionView.dataSource = self
  }
  required init?(coder: NSCoder){
    fatalError()
  }
// overrides the .systemBlue... 
  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.frame = contentView.bounds
  }
}
// affecting the horizontal rows
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    var config = UIBackgroundConfiguration.clear()
    if let data = try? Data(contentsOf: dogModels[indexPath.item].url) {
      config.image = UIImage(data: data)
    }
    cell.backgroundConfiguration = config
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dogModels.count
  }
// called anytime one of the cells is tapped.
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let dogModel = dogModels[indexPath.item] // will grab dog model for item tapped.
    let viewController = DetailViewController(imageUrl: dogModel.url, name: dogModel.breeds[0].name, temperament: dogModel.breeds[0].temperament)
    parentViewController?.present(viewController, animated: true)
  }
}
