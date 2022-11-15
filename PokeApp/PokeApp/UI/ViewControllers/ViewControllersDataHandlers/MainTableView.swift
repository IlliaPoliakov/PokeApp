//
//  File.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation
import UIKit

enum Section {
  case mainSection
}

enum SortState {
  case alphabetical
  case notAlphabetical
  case lovely
  case non
}

class MainTableView: NSObject, UITableViewDelegate {
  
  // -MARK: - Properties -
  
  var tableView: UITableView?
  var pokemons: [Pokemon]?
  var lovelyPokemons: [Pokemon]? {
    get {
      return pokemons?.filter { $0.isLovely == true }
    }
  }
  var sortState: SortState = .non
  
  lazy var dataSource: UITableViewDiffableDataSource<Section, Pokemon> =  UITableViewDiffableDataSource<Section, Pokemon> (tableView: tableView!) {
    tableView, indexPath, itemIdentifier in
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCellId") as? MainTableViewCell
    else {
      fatalError("Can't deque custom cell in MainVC.")
    }
    
    let pokemon: Pokemon
    
    switch self.sortState {
    case .lovely:
      pokemon = self.lovelyPokemons![indexPath.row]
    default:
      pokemon = self.pokemons![indexPath.row]
    }
    
    cell.bind(withPokemon: pokemon)
    
    return cell
  }
  
  
  // -MARK: - Functions -
  
  func configureSnapshot(){
    var snapshot = NSDiffableDataSourceSnapshot<Section, Pokemon>()
    
    snapshot.appendSections([.mainSection])
    
    guard pokemons != nil
    else {
      dataSource.apply(snapshot, animatingDifferences: true)
      return
    }
    
    switch sortState {
    case .lovely:
      snapshot.appendItems(lovelyPokemons!, toSection: .mainSection)
    default:
      snapshot.appendItems(pokemons!, toSection: .mainSection)
    }
   
    dataSource.apply(snapshot, animatingDifferences: true)
  }
  
  func updateSnapshot(withNewPokemons pokemons: [Pokemon]?) {
    guard pokemons != nil
    else {
      return
    }
    
    if self.pokemons != nil {
      pokemons!.forEach { pokemon in
        self.pokemons!.append(pokemon)
      }
    }
    else {
      self.pokemons = pokemons!
    }
    
    self.updatePresentation()
  }
  
  func updatePresentation() {
    guard pokemons != nil
    else {
      return
    }
    
    switch sortState {
    case .alphabetical:
      self.pokemons = pokemons!.sorted {
        $0.name < $1.name
      }
 
    case .notAlphabetical:
      self.pokemons = pokemons!.sorted {
        $0.name > $1.name
      }
    
    default:
      break
    }
    
    configureSnapshot()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
