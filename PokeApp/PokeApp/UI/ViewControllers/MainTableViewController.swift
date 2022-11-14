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
  
  lazy var mainTableView: MainTableView = AppDelegate.DIContainer.resolve(MainTableView.self)!

  
  // -MARK: - Dependencies -
  
  private let getFeedGroupsUseCase: GetFeedGroupsUseCase =
  AppDelegate.DIContainer.resolve(GetFeedGroupsUseCase.self)!
  private let markAsReadedUseCase: MarkAsReadedUseCase =
  AppDelegate.DIContainer.resolve(MarkAsReadedUseCase.self)!
  private let markAsReadedOldUseCase: MarkAsReadedOldUseCase =
  AppDelegate.DIContainer.resolve(MarkAsReadedOldUseCase.self)!
  
  
  // -MARK: - LifeCycle -
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  // MARK: - Navigation
}
