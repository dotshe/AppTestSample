//
//  PlaylistRepository.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class PlaylistRepository {
  
  /*******************************************************************************/
  // MARK: - Types
  
  typealias GetUserPlaylistsHandlerType = ((_ playlists: [PlaylistModel], _ error: Error?) -> ())
  
  /*******************************************************************************/
  // MARK: - Properties
  
  private static let deezerAPI: DeezerAPI = DeezerAPI()
  
  /*******************************************************************************/
  // MARK: - CRUD
  
  func getUserPlaylists(userIdentifier: String, completionHandler: @escaping GetUserPlaylistsHandlerType) {
    PlaylistRepository.deezerAPI.getUserPlaylists(userIdentifier: userIdentifier) { (playlists, error) in
      completionHandler(playlists, error)
    }
  }
}
