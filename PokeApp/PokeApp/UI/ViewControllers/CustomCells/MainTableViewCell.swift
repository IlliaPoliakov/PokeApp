//
//  MainTableViewCell.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func bind(withPokemon pokemon: Pokemon) {
    nameLabel.text = pokemon.name
  }

}
