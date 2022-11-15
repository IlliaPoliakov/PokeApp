//
//  NetworkDataSource.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

class NetworkDataSource {
  
  // -MARK: - Properties -
  
  var dataTask: URLSessionDataTask?
  
  private lazy var session: URLSession = {
    let configuration = URLSessionConfiguration.default
    configuration.waitsForConnectivity = true
    return URLSession(configuration: configuration,
                      delegate: nil, delegateQueue: nil)
  }()
  
  
  // -MARK: - Functions -
  
  func downloadData(withUrl url: URL, _ completion: @escaping (Data?, String?) -> Void) {
    
    let request = URLRequest(url: url)
    
    self.dataTask = session.dataTask(with: request) { data, response, error in
      guard let data = data, error == nil,
            (200..<300).contains((response as? HTTPURLResponse)!.statusCode)
      else {
        DispatchQueue.main.async {
          completion(nil, error?.localizedDescription)
        }
        return
      }
      
      completion(data, nil)
    }
    
    dataTask?.resume()
  }
  
}
