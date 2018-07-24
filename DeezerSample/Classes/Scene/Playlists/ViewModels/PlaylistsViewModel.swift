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
  
  // - Observable
  private(set) var playlists: Variable<[PlaylistModel]?> = Variable([])
  private(set) var loading: Variable<Bool> = Variable(false)
  private(set) var error: Variable<Error?> = Variable(nil)
  
  // - Data
  private var playlistViewModels: [PlaylistViewModel] = []
  private let userIdentifier: Int
  private let playlistsRepository: PlaylistRepository
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(withUserIdentifier userIdentifier: Int, playlistsRepository: PlaylistRepository = PlaylistRepository()) {
    self.userIdentifier = userIdentifier
    self.playlistsRepository = playlistsRepository
  }
  
  /*******************************************************************************/
  // MARK: - Data
  
  /**
   * Fetches playlists
   */
  func fetchPlaylists() {
    self.loading.value = true
    playlistsRepository.getPlaylists(forUserIdentifier: userIdentifier) { (playlists, error) in
      self.loading.value = false
      if let error = error {
        self.error.value = error
        self.playlistViewModels.removeAll()
        self.playlists.value?.removeAll()
      } else {
        self.error.value = nil
        self.playlistViewModels = playlists.map({ playlist -> PlaylistViewModel in
          return PlaylistViewModel(withPlaylistIdentifier: playlist.identifier)
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
  
  /**
   * Gets the playlist identifier for the specified index
   *
   * - parameters index: The index of the view model
   *
   * - return: The playlist identifier for the specified index
   */
  func playlistIdentifier(atIndex index: Int) -> Int? {
    guard index < numberOfPlaylistViewModels() else { return nil }
    return self.playlistViewModels[index].playlistIdentifier
  }
}
