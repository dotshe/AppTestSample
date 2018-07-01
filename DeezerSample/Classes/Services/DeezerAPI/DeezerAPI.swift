//
//  DeezerAPI.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class DeezerAPI {
  
  /*******************************************************************************/
  // MARK: - Constants & Enums
  
  enum Paths {
    case user(userIdentifier: String)
    case userPlaylists(userIdentifier: String)
    
    var value: String {
      switch(self) {
      case .user(let userIdentifier):
        return "user/\(userIdentifier)"
      case .userPlaylists(let userIdentifier):
        return Paths.user(userIdentifier: userIdentifier).value + "/playlists?limit=100"
      }
    }
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  let scheme: String = "https"
  let host: String = "api.deezer.com"
  
  /*******************************************************************************/
  // MARK: - Utils
  
  func constructRequest(method: NetworkerRequest.Method, path: String) -> NetworkerRequest {
    return NetworkerRequest(
      method: .get,
      scheme: self.scheme,
      host: self.host,
      path: path
    )
  }
}
