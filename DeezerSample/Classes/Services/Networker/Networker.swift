//
//  Networker.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import Alamofire

class Networker {
  
  /*******************************************************************************/
  // MARK: - Types
  
  typealias NetworkerHandler = ((_ response: Any?, _ errror: Error?) -> ())
  
  /*******************************************************************************/
  // MARK: - Singleton
  
  public static var instance = Networker()
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  private init() { }
  
  /*******************************************************************************/
  // MARK: - Actions
  
  /**
   * Executes a request
   */
  public static func execute(request: NetworkerRequest, completionHandler: @escaping NetworkerHandler) {
    // Construct and validate the URL
    guard let url: URL = self.constructUrl(request: request) else { return }
    
    // Execute the request
    Alamofire.request(url,
                      method: request.method.alamofire,
                      parameters: request.parameters,
                      encoding: request.encoding.alamofire)
      .validate(statusCode: 200..<300)
      .responseJSON { response in
        // Manage result
        switch(response.result) {
        case .success:
          if let value = response.value {
            completionHandler(value, nil)
          }
        case .failure(let error):
          completionHandler(nil, error)
        }
    }
  }
  
  /**
   *
   */
  private static func constructUrl(request: NetworkerRequest) -> URL? {
    return URL(string: "\(request.scheme)://\(request.host)/\(request.path)")
  }
}
