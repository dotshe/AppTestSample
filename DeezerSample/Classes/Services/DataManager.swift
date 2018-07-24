//
//  DataManager.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class DataManager {
  
  /*******************************************************************************/
  // MARK: - Singleton
  
  static let shared: DataManager = DataManager()
  
  /*******************************************************************************/
  // MARK: - Properties
  
  private var playlistsByUserIdentifier: [Int: [PlaylistModel]] = [:]
  private var playlistByIdentifier: [Int: PlaylistModel] = [:]
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  private init() {}
  
  /*******************************************************************************/
  // MARK: - Playlists
  
  func setPlaylists(_ playlists: [PlaylistModel], forUserIdentifier userIdentifier: Int) {
    for playlist in playlists {
      setPlaylist(playlist)
    }
    self.playlistsByUserIdentifier[userIdentifier] = playlists
  }
  
  func playlists(forUserIdentifier userIdentifier: Int) -> [PlaylistModel]? {
    return self.playlistsByUserIdentifier[userIdentifier]
  }
  
  /*******************************************************************************/
  // MARK: - Playlist
  
  func setPlaylist(_ playlist: PlaylistModel) {
    self.playlistByIdentifier[playlist.identifier] = playlist
  }
  
  func playlist(forIdentifier identifier: Int) -> PlaylistModel? {
    return self.playlistByIdentifier[identifier]
  }
}

