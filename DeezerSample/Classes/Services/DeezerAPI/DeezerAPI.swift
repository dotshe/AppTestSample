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
    case user(userIdentifier: Int)
    case userPlaylists(userIdentifier: Int)
    case playlistInfo(playlistIdentifier: Int)
    case playlistTracks(playlistIdentifier: Int)
    
    var value: String {
      switch(self) {
      case .user(let userIdentifier):
        return "user/\(userIdentifier)"
      case .userPlaylists(let userIdentifier):
        return Paths.user(userIdentifier: userIdentifier).value + "/playlists?limit=100"
      case .playlistInfo(let playlistIdentifier):
        return "playlist/\(playlistIdentifier)"
      case .playlistTracks(let playlistIdentifier):
        return Paths.playlistInfo(playlistIdentifier: playlistIdentifier).value + "/tracks"
      }
    }
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  let scheme: String = "https"
  let host: String = "api.deezer.com"
  
  /*******************************************************************************/
  // MARK: - Utils
  
  /**
   * Constructs a request according parameters.
   *
   * - parameter method     : HTTP's method
   * - parameter path       : Request's path
   * - parameter parameters : Request's parameters
   * - parameter encoding   : Request's parameters encoding
   *
   * - return: An object that represents a request.
   */
  func constructRequest(method: NetworkerRequest.Method, path: String, parameters: [String: Any] = [:], encoding: NetworkerRequest.ParameterEncoding? = nil) -> NetworkerRequest {
    
    // Manage parameters encoding
    let parametersEncoding: NetworkerRequest.ParameterEncoding
    if let encoding = encoding {
      parametersEncoding = encoding
    } else {
      switch(method) {
      case .get:
        parametersEncoding = .urlEncoded
      default:
        parametersEncoding = .json
      }
    }
    
    // Create the request
    return NetworkerRequest(
      method: method,
      scheme: self.scheme,
      host: self.host,
      path: path,
      parameters: parameters,
      encoding: parametersEncoding
    )
  }
}
