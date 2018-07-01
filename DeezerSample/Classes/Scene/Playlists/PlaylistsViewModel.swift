//
//  PlaylistsViewModel.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class PlaylistsViewModel {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // Observable
  private(set) var playlists: Variable<[PlaylistModel]?> = Variable([])
  
  // - Data
  private var playlistViewModels: [PlaylistViewModel] = []
  var error: Error?
  private let userIdentifier: String = "5"
  private let playlistsRepository: PlaylistRepository
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(withPlaylistsRepository playlistsRepository: PlaylistRepository) {
    self.playlistsRepository = playlistsRepository
  }
  
  /*******************************************************************************/
  // MARK: - Data
  
  /**
   * Fetches playlists
   */
  func fetchPlaylists() {
    playlistsRepository.getUserPlaylists(userIdentifier: userIdentifier) { (playlists, error) in
      if let error = error {
        self.error = error
        self.playlists.value?.removeAll()
        self.playlistViewModels.removeAll()
      } else {
        self.error = nil
        self.playlistViewModels = playlists.map({ playlist -> PlaylistViewModel in
          return PlaylistViewModel(withPlaylist: playlist)
        })
        self.playlists.value = playlists
      }
    }
  }
  
  /**
   * Gets the number of playlist view models
   *
   * - return: The number of playlist view models
   */
  func numberOfPlaylistViewModels() -> Int {
    return self.playlistViewModels.count
  }
  
  /**
   * Gets the playlist view model for the specified index
   *
   * - parameters index: The index of the view model
   *
   * - return: The playlist view model for the specified index
   */
  func playlistViewModel(atIndex index: Int) -> PlaylistViewModel? {
    guard index < numberOfPlaylistViewModels() else { return nil }
    return self.playlistViewModels[index]
  }
}
