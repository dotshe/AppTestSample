//
//  PlaylistCollectionViewCell.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class PlaylistCollectionViewCell: UICollectionViewCell, ViewReusable {
  
  /*******************************************************************************/
  // MARK: - Constant & Enums
  
  struct Constants {
    struct Layout {
      static let cornerRadius: CGFloat = 8.0
    }
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - UI
  @IBOutlet private var coverImageView: UIImageView!
  @IBOutlet private var titleLabel: UILabel!
  
  // - Data
  var playlistViewModel: PlaylistViewModel? {
    willSet { unbindViewModel() }
    didSet { bindViewModel() }
  }
  let disposeBag = DisposeBag()
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  override func awakeFromNib() {
    super.awakeFromNib()
    prepageLayout()
  }
  
  /*******************************************************************************/
  // MARK: - Prepare
  
  private func prepageLayout() {
    self.contentView.layer.cornerRadius = Constants.Layout.cornerRadius
    self.contentView.layer.masksToBounds = true
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    cleanView()
  }
  
  /*******************************************************************************/
  // MARK: - Update
  
  private func updateView() {
    updateTitle()
    updateCover()
  }
  
  private func updateTitle() {
    self.titleLabel.text = self.playlistViewModel?.titleFormatted()
  }
  
  private func updateCover() {
    let url: URL? = self.playlistViewModel?.mediumCoverUrl()
    let placeholder: UIImage? = nil
    self.coverImageView.setImage(url: url, placeholder: placeholder)
  }
  
  private func cleanView() {
    self.coverImageView.image = nil
    self.titleLabel.text = nil
  }
}

/*******************************************************************************/
// MARK: -

extension PlaylistCollectionViewCell {
  
  /**
   *
   */
  private func bindViewModel() {
    self.playlistViewModel?.playlist
      .asObservable()
      .subscribe({ event in
        self.updateView()
      }).disposed(by: disposeBag)
  }
  
  /**
   *
   */
  private func unbindViewModel() {
    self.cleanView()
  }
}

