//
//  PokemonRepository.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

protocol PokemonRepository {
  func getPokemons() -> [Pokemon]?
  func addPokemons() -> [Pokemon]?
}
