//
//  PlaylistDetailHeaderViewModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class PlaylistDetailHeaderViewModel {
  
  /*******************************************************************************/
  // MARK: - Constants
  
  private struct Constants {
    struct Texts {
      static let titlePlaceholder: String = "PLAYLIST_DETAIL_SCENE_TITLE_PLACEHOLDER".localized
      static let durationPlaceholder: String = "PLAYLIST_DETAIL_SCENE_DURATION_PLACEHOLDER".localized
    }
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - Observable
  private(set) var coverURL: Variable<URL?> = Variable(nil)
  private(set) var title: Variable<String> = Variable(Constants.Texts.titlePlaceholder)
  private(set) var duration: Variable<String> = Variable(Constants.Texts.durationPlaceholder)
  
  // - Data
  private let playlistIdentifier: Int
  private var playlist: PlaylistModel? = nil {
    didSet {
      self.coverURL.value = playlist?.pictureBigUrl
      self.title.value = playlist?.title ?? Constants.Texts.titlePlaceholder
      if let duration = playlist?.duration {
        self.duration.value = FormattersHelper.formatPlaylistDuration(duration)
      } else {
        self.duration.value = Constants.Texts.durationPlaceholder
      }
    }
  }
  private let playlistsRepository: PlaylistRepository
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(withPlaylistIdentifier playlistIdentifier: Int, playlistsRepository: PlaylistRepository = PlaylistRepository()) {
    self.playlistIdentifier = playlistIdentifier
    self.playlistsRepository = playlistsRepository
  }
  
  /*******************************************************************************/
  // MARK: - Data
  
  /**
   * Fetches the playlist details
   */
  func fetchPlaylistDetails() {
    playlistsRepository.getPlaylist(forIdentifier: self.playlistIdentifier) { (playlist, error) in
      if let playlist = playlist {
        self.playlist = playlist
      } else {
        self.playlist = nil
        // TODO(CPO): Manage the error or missing playlist
      }
    }
  }
}
