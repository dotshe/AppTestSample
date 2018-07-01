//
//  DeezerAPI+User.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

extension DeezerAPI {
  
  /*******************************************************************************/
  // MARK: - Types
  
  typealias GetPlaylistsHandlerType = ((_ playlists: [DeezerPlaylistModel], _ error: Error?) -> ())
  
  /*******************************************************************************/
  // MARK: - Actions
  
  /**
   * Gets playlists for a user with the specified identifier.
   *
   * - parameter identifier         : The user's identifier
   * - parameter completionHandler  : The closure called when the request is completed
   */
  func getUserPlaylists(userIdentifier: String, completionHandler: @escaping GetPlaylistsHandlerType) {
    let path: String = Paths.userPlaylists(userIdentifier: userIdentifier).value
    let request: NetworkerRequest = constructRequest(method: .get, path: path)
    Networker.execute(request: request) { response, error in
      // Manage 'error'
      guard error == nil else {
        completionHandler([], error)
        return
      }
      // Manage 'response'
      guard let json = response as? [String: Any] else {
        completionHandler([], error)
        return
      }
      
      // Parsing
      let playlists: [DeezerPlaylistModel] = self.parseDeezerPlaylists(fromJson: json)
      completionHandler(playlists, nil)
    }
  }
  
  /**
   * Parses a deezer playlists from JSON.
   *
   * - parameter json: An object that represents playlists in JSON.
   *
   * - return: An array of 'DeezerPlaylistModel'
   */
  private func parseDeezerPlaylists(fromJson json: [String: Any]) -> [DeezerPlaylistModel] {
    var playlists: [DeezerPlaylistModel] = []
    
    if let jsonPlaylists = json["data"] as? [[String: Any]] {
      for jsonPlaylist in jsonPlaylists {
        if let playlist = DeezerPlaylistModel(json: jsonPlaylist) {
          playlists.append(playlist)
        }
      }
    }
    
    return playlists
  }
}
