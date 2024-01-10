//
//  GroupCollectionViewCell.swift
//  Dogs List
//
//  Created by Tracey Dolby on 11/15/23.
//

import UIKit
import SDWebImage

class GroupCollectionViewCell: UICollectionViewCell {

  static let identifier = "GroupCollectionViewCell"
  private let groupImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  override init(frame: CGRect){
    super.init(frame: frame)
    contentView.addSubview(groupImageView)
  }

  required init?(coder: NSCoder){
    fatalError()
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    groupImageView.frame = contentView.bounds
  }
}
