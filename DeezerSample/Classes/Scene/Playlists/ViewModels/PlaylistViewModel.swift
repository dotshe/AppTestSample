//
//  PlaylistViewModel.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class PlaylistViewModel {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - Observable
  private(set) var playlist: Variable<PlaylistModel?> = Variable(nil)
  private(set) var loading: Variable<Bool>    = Variable(false)
  private(set) var error: Variable<Error?>    = Variable(nil)
  
  // - Data
  let playlistIdentifier: Int
  private let playlistRepository: PlaylistRepository
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(withPlaylistIdentifier playlistIdentifier: Int, playlistRepository: PlaylistRepository = PlaylistRepository()) {
    self.playlistIdentifier = playlistIdentifier
    self.playlistRepository = playlistRepository
  }
  
  /*******************************************************************************/
  // MARK: - Data
  
  /**
   * Fetches the playlist
   */
  func fetchPlaylist() {
    guard playlist.value == nil else {
      return
    }
    
    self.loading.value = true
    self.playlistRepository.getPlaylist(forIdentifier: playlistIdentifier) { (playlist, error) in
      self.loading.value = false
      
      if let playlist = playlist {
        self.playlist.value = playlist
        self.error = Variable(nil)
      } else {
        self.playlist.value = nil
        self.error = Variable(error)
      }
    }
  }
  
  /**
   * Gets the title formatted for the playlist.
   * If the title doesn't exist, an empty text is returned.
   *
   * - return: The title formatted for the playlist
   */
  func titleFormatted() -> String {
    guard let title = self.playlist.value?.title else {
      return "PLAYLIST_DETAIL_SCENE_TITLE_PLACEHOLDER".localized
    }
    return title
  }
  
  /**
   * Gets the medium cover's url for the playlist.
   * If the url doesn't exist, a 'nil' value is returned.
   *
   * - return: The cover's url for the playlist
   */
  func mediumCoverUrl() -> URL? {
    guard let coverUrl = self.playlist.value?.pictureMediumUrl else {
      return nil
    }
    return coverUrl
  }
  
  /**
   * Gets the duration formatted for the playlist.
   * If the duration doesn't exist, a placeholder text is returned.
   *
   * - return: The duration formatted for the playlist
   */
  func durationFormatted() -> String {
    guard let duration = self.playlist.value?.duration else {
      return "PLAYLIST_DETAIL_SCENE_DURATION_PLACEHOLDER".localized
    }
    return FormattersHelper.formatPlaylistDuration(duration)
  }
}
