//
//  Constants.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//

import Foundation

struct Sizes{
  static let barButtonSizeAndPosition = CGRect(x: 0, y: 0, width: 50, height: 50)
  static var imageCornerRadius = 10
  static var imageBorderWidth = 2.5
}

enum PossibleErrors: String, Error {
  case noInternet = "No Intternet Connection"
  case serverResponse = "Wrong Server Response"
  case noMorePokemonsFromApi = "There are All Pokemons for Now"
  case apiProvidingFunctionalityErrors = "Undefined Error...Sorry"
}
