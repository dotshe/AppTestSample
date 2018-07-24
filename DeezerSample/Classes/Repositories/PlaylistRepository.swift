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
  
  typealias GetPlaylistsHandlerType = ((_ playlists: [PlaylistModel], _ error: Error?) -> ())
  typealias GetPlaylistHandlerType = ((_ playlist: PlaylistModel?, _ error: Error?) -> ())
  
  /*******************************************************************************/
  // MARK: - Properties
  
  private static let deezerAPI: DeezerAPI = DeezerAPI()
  
  /*******************************************************************************/
  // MARK: - CRUD
  
  func getPlaylists(forUserIdentifier userIdentifier: Int, completionHandler: @escaping GetPlaylistsHandlerType) {
    // Get playlists in 'cache' if possible
    if let playlists = DataManager.shared.playlists(forUserIdentifier: userIdentifier), playlists.count > 0 {
      completionHandler(playlists, nil)
      return
    }
    
    // Call Deezer's API
    PlaylistRepository.deezerAPI.getUserPlaylists(userIdentifier: userIdentifier) { (playlists, error) in
      // Store in 'cache'
      DataManager.shared.setPlaylists(playlists, forUserIdentifier: userIdentifier)
      completionHandler(playlists, error)
    }
  }
  
  /**
   *
   */
  func getPlaylist(forIdentifier idenfier: Int, completionHandler: @escaping GetPlaylistHandlerType) {
    // Get playlist in 'cache' if possible
    if let playlist = DataManager.shared.playlist(forIdentifier: idenfier) {
      completionHandler(playlist, nil)
      return
    }
    
    // Call Deezer's API
  }
}
