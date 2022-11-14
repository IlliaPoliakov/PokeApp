//
//  MainTableViewCell.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func bind(withFeedItem item: FeedItem) {
    self.titleLabel =
  }

}
