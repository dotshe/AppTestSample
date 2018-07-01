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
  
  // Observable
  private(set) var coverUrl: Variable<URL?>
  private(set) var title: Variable<String?>
  
  // - Data
  private let playlist: PlaylistModel
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(withPlaylist playlist: PlaylistModel) {
    self.playlist = playlist
    self.coverUrl = Variable(playlist.pictureMediumUrl)
    self.title = Variable(playlist.title)
  }
}
