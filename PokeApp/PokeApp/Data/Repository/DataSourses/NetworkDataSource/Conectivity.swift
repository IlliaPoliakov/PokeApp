//
//  Conectivity.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation
import Alamofire

class Connectivity {
  class func isConnectedToInternet() -> Bool {
    return NetworkReachabilityManager()?.isReachable ?? false
  }
}
