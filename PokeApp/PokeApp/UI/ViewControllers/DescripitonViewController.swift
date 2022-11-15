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
  
  private let setAsUnlovelyUseCase: SetAsUnlovelyUseCase =
  AppDelegate.DIContainer.resolve(SetAsUnlovelyUseCase.self)!
  private let setAsLovelyUseCase: SetAsLovelyUseCase =
  AppDelegate.DIContainer.resolve(SetAsLovelyUseCase.self)!
  
  
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
      setAsUnlovelyUseCase.execute(withPokemonName: pokemon!.name)
      mainTableView!.adjustLovelyState(forPokemon: pokemon!)
      
      pokemon!.isLovely = false
      
      lovelyButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    else {
      setAsLovelyUseCase.execute(withPokemonName: pokemon!.name)
      mainTableView!.adjustLovelyState(forPokemon: pokemon!)

      pokemon!.isLovely = true
      
      lovelyButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
  }
  

}
