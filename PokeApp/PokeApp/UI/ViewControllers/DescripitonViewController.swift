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
    pokemon!.types.forEach { type in
      types += type
      types += " "
    }
    typesLabel.text = types
    
    heightLabel.text = String(pokemon!.height)
    weightLabel.text = String(pokemon!.weight)
    
    imageView.pin_setImage(from: pokemon!.imageUrl)
    imageView.layer.cornerRadius = 10
    imageView.backgroundColor = UIColor.lightGray
    imageView.layer.masksToBounds = true
    imageView.layer.borderWidth = 2.5
    imageView.layer.borderColor = UIColor(named: "mainColor")!.cgColor
    
    nameLabel.text = pokemon!.name
  }
  

}
