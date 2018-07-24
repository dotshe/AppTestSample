//
//  TracksViewModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class TracksViewModel {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - Observable
  private(set) var tracks: Variable<[TrackModel]?>  = Variable(nil)
  private(set) var loading: Variable<Bool>          = Variable(false)
  private(set) var error: Variable<Error?>          = Variable(nil)
  private(set) var nextLoading: Variable<Bool>      = Variable(false)
  
  // - Data
  let playlistIdentifier: Int
  private var page: Int = 0
  private var pagination: PaginationModel? = nil
  private var tracksViewModels: [TrackViewModel] = []
  private let trackRepository: TrackRepository
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(withPlaylistIdentifier playlistIdentifier: Int,
       trackRepository: TrackRepository = TrackRepository()) {
    self.playlistIdentifier = playlistIdentifier
    self.trackRepository = trackRepository
  }
  
  /*******************************************************************************/
  // MARK: - Data
  
  /**
   * Fetches the playlist's tracks
   */
  func fetchTracks() {
    guard tracks.value == nil else {
      return
    }
    
    self.page = 0
    self.pagination = nil
    
    self.loading.value = true
    self.trackRepository.getTracks(playlistIdentifier: playlistIdentifier, at: page) { (tracks, pagination, error) in
      self.loading.value = false
      
      if let tracks = tracks {
        self.tracksViewModels = tracks.map({ track -> TrackViewModel in
          return TrackViewModel(withTrack: track)
        })
        self.tracks.value = tracks
        self.error.value = nil
        if let _ = pagination?.nextUrl {
          self.page += 1
        }
        self.pagination = pagination
      } else {
        self.error.value = error
        self.tracks.value?.removeAll()
        self.tracksViewModels.removeAll()
        self.page = 0
        self.pagination = nil
      }
    }
  }
  
  /**
   * Fetches the next playlist's tracks
   */
  func fetchNextTracks() {
    self.nextLoading.value = true
    
    self.trackRepository.getTracks(playlistIdentifier: playlistIdentifier, at: page) { (tracks, pagination, error) in
      self.nextLoading.value = false
      
      if let tracks = tracks {
        let nextTracksViewModels = tracks.map({ track -> TrackViewModel in
          return TrackViewModel(withTrack: track)
        })
        self.tracksViewModels.append(contentsOf: nextTracksViewModels)
        self.tracks.value?.append(contentsOf: tracks)
        self.error.value = nil
        if let _ = pagination?.nextUrl {
          self.page += 1
        }
        self.pagination = pagination
      } else {
        self.error.value = error
        self.tracks.value?.removeAll()
        self.tracksViewModels.removeAll()
        self.page = 0
        self.pagination = nil
      }
    }
  }
  
  /**
   * Gets the number of track view models
   *
   * - return: The number of track view models
   */
  func numberOfTracksViewModels() -> Int {
    return self.tracksViewModels.count
  }
  
  /**
   * Gets the track view model for the specified index
   *
   * - parameters index: The index of the view model
   *
   * - return: The track view model for the specified index
   */
  func trackViewModel(atIndex index: Int) -> TrackViewModel? {
    guard index < numberOfTracksViewModels() else { return nil }
    return self.tracksViewModels[index]
  }
  
  func canLoadMoreTracks() -> Bool {
    guard self.nextLoading.value == false else { return false }
    guard let pagination = self.pagination else { return false }
    guard let _ = pagination.nextUrl else { return false }
    return true
  }
  
  func isLoadingNextTracks() -> Bool {
    return self.nextLoading.value
  }
}
