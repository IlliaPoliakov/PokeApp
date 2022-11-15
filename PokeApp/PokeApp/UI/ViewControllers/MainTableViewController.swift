//
//  MainTableViewController.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation
import UIKit

class MainTableViewController: UITableViewController {
  
  // MARK: - IBOutlets -

  @IBOutlet weak var updateButtton: UIBarButtonItem!

  
  // -MARK: - Properties -
  
  lazy var mainTableView: MainTableView = MainTableView()

  
  // -MARK: - Dependencies -
  
  private let getPokemonsUseCase: GetPokemonsUseCase =
  AppDelegate.DIContainer.resolve(GetPokemonsUseCase.self)!
  private let addPokemonsUseCase: AddPokemonsUseCase =
  AppDelegate.DIContainer.resolve(AddPokemonsUseCase.self)!
  
  
  // -MARK: - LifeCycle -
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setTableView()
  }
  
  
  // MARK: - Navigation -
  
  
  // MARK: - Funcitons -
  
  func setTableView() {
    mainTableView.tableView = tableView
    
    tableView.dataSource = mainTableView.dataSource
    tableView.delegate = mainTableView
  }
  
  func setSortButton() {
    let button: UIButton = UIButton()
    button.setImage(UIImage(systemName: "arrow.up.and.down.text.horizontal"), for: .normal)
    button.frame = CGRectMake(0, 0, 40, 40)
    button.tintColor = UIColor(named: "mainColor")
    let interaction = UIContextMenuInteraction(delegate: self)
    button.addInteraction(interaction)
    let barButtonItem: UIBarButtonItem = UIBarButtonItem()
    barButtonItem.customView = button
    
    self.navigationItem.leftBarButtonItems!.insert(barButtonItem, at: 0)
  }
}

extension MainTableViewController: UIContextMenuInteractionDelegate {
  func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                              configurationForMenuAtLocation location: CGPoint)
  -> UIContextMenuConfiguration? {
    
    return UIContextMenuConfiguration(
      identifier: nil,
      previewProvider: nil,
      actionProvider: { _ in
        let alpha = self.makeAlphabeticalAction()
        let notAlpha = self.makeNotAlphabeticalAction()
        let lovely = self.makeLovelyAction()
        let children: [UIMenuElement] = [alpha, notAlpha, lovely]
        return UIMenu(title: "Sort presentation:", children: children)
      })
  }
  
  func makeAlphabeticalAction() -> UIAction {
    let alphaAttributes = UIMenuElement.Attributes()
    let alphaImage = UIImage(systemName: "arrow.up.square")!
      .withTintColor(UIColor(named: "mainColor")!, renderingMode: .alwaysOriginal)
    
    return UIAction(
      title: "Alphabetical",
      image: alphaImage,
      identifier: nil,
      attributes: alphaAttributes) { _ in
        guard self.mainTableView.sortState != .alphabetical
        else {
          return
        }
        
        self.mainTableView.sortState = .alphabetical
        self.mainTableView.updatePresentation()
        
        self.title = "Alphabetical Flow"
      }
  }
  
  func makeNotAlphabeticalAction() -> UIAction {
    let alphaAttributes = UIMenuElement.Attributes()
    let alphaImage = UIImage(systemName: "arrow.down.square")!
      .withTintColor(UIColor(named: "mainColor")!, renderingMode: .alwaysOriginal)
    
    return UIAction(
      title: "Oppsite Alphabetical",
      image: alphaImage,
      identifier: nil,
      attributes: alphaAttributes) { _ in
        guard self.mainTableView.sortState != .notAlphabetical
        else {
          return
        }
        
        self.mainTableView.sortState = .notAlphabetical
        self.mainTableView.updatePresentation()
        
        self.title = "Opposite to Flow"
      }
  }
  
  func makeLovelyAction() -> UIAction {
    let alphaAttributes = UIMenuElement.Attributes()
    let alphaImage = UIImage(systemName: "heart.square")!
      .withTintColor(UIColor(named: "mainColor")!, renderingMode: .alwaysOriginal)
    
    return UIAction(
      title: "Oppsite Alphabetical",
      image: alphaImage,
      identifier: nil,
      attributes: alphaAttributes) { _ in
        guard self.mainTableView.sortState != .lovely
        else {
          return
        }
        
        self.mainTableView.sortState = .lovely
        self.mainTableView.updatePresentation()
        
        self.title = "Lovely"
      }
  }
  
}

