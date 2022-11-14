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
}
