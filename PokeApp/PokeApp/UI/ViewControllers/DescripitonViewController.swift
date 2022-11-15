//
//  DescripitonViewController.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation
import UIKit
import PINRemoteImage

class DescriptionViewController: UIViewController {
  
  // -MARK: - Dependencies -
  
  private let adjustLovelyStateUseCase: AdjustLovelyStateUseCase =
  AppDelegate.DIContainer.resolve(AdjustLovelyStateUseCase.self)!
  
  
  // -MARK: - IBOutlets -
  
  @IBOutlet weak var typesLabel: UILabel!
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var lovelyButton: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  
  
  // -MARK: - Properties -
  
  var pokemon: Pokemon?
  var mainTableView: MainTableView?
  
  
  // -MARK: - Lifecycle -
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var types: String = ""
    if pokemon?.types != nil {
      pokemon!.types!.forEach { type in
        types += type
        types += " "
      }
    }
    typesLabel.text = types
    
    heightLabel.text = String(pokemon?.height ?? 0)
    weightLabel.text = String(pokemon?.weight ?? 0)
    
    if pokemon?.imageUrl != nil {
      imageView.pin_setImage(from: pokemon?.imageUrl)
    }
    imageView.layer.cornerRadius = CGFloat( Sizes.imageCornerRadius)
    imageView.backgroundColor = UIColor.lightGray
    imageView.layer.masksToBounds = true
    imageView.layer.borderWidth = Sizes.imageBorderWidth
    imageView.layer.borderColor = UIColor(named: "mainColor")!.cgColor
    
    if pokemon!.isLovely {
      lovelyButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    nameLabel.text = pokemon?.name
  }
  
  
  // -MARK: - IBOutlets -
  
  @IBAction func setAsLovelybutton(_ sender: UIButton) {
    if pokemon!.isLovely {
      pokemon!.isLovely = false
      lovelyButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    else {
      pokemon!.isLovely = true
      lovelyButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    mainTableView!.adjustLovelyState(forPokemon: pokemon!)
    adjustLovelyStateUseCase.execute(withPokemonName: pokemon!.name)
  }
  

}
