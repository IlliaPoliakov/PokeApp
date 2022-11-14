//
//  Pokemon.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//

import Foundation

struct Pokemon {
  var name: String
  var imageUrl: URL
  var weight: Int32
  var height: Int32
  var types: [String]
  
  init(name: String, imageUrl: URL, weight: Int32, height: Int32, types: [String]) {
    self.name = name
    self.imageUrl = imageUrl
    self.weight = weight
    self.height = height
    self.types = types
  }
}
