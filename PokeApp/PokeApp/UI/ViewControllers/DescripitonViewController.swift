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
  @IBOutlet weak var nameLabel: UILabel!
  
  
  // -MARK: - Properties -
  
  var pokemon: Pokemon?
  
  
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
    imageView.layer.cornerRadius = 10
    imageView.backgroundColor = UIColor.lightGray
    imageView.layer.masksToBounds = true
    imageView.layer.borderWidth = 2.5
    imageView.layer.borderColor = UIColor(named: "mainColor")!.cgColor
    
    nameLabel.text = pokemon?.name
  }
  
  
  // -MARK: - IBOutlets -
  
  @IBAction func setAsLovelybutton(_ sender: UIButton) {
    if pokemon!.isLovely {
      setAsUnlovelyUseCase.execute(withPokemonName: pokemon!.name)
      sender.imageView!.image = UIImage(systemName: "heart")
    }
    else {
      setAsLovelyUseCase.execute(withPokemonName: pokemon!.name)
      sender.imageView!.image = UIImage(systemName: "heart.fill")
    }
  }
  

}
