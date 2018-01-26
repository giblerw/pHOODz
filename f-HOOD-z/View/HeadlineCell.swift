//
//  PlaceTableViewCell.swift
//  Restaurants
//
//  Created by Nicholas Gresham on 15/12/17.
//  Copyright © 2017 Nicholas Gresham. All rights reserved.
//

import UIKit
import Kingfisher

// should this be a protocol instead?
typealias HeadlineCellData = (
  imageURL: String,
  title: String,
  subtitle: String,
  body: String
)

final class HeadlineCell: UITableViewCell {

  static let cellReuseIdentifier = "HeadlineCell"

  @IBOutlet weak var cellImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!

  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

  func configureWith(_ data: HeadlineCellData) {
    let imageURL = URL(string: data.imageURL)
    let placeHolderImage = #imageLiteral(resourceName: "icon-thumbnail-placeholder")
    cellImage.kf.setImage(with: imageURL,
                          placeholder: placeHolderImage,
                          options: [.transition(.fade(0.3))])

    titleLabel.text = data.title
    subtitleLabel.text = data.subtitle
    bodyLabel.text = data.body
  }

}
