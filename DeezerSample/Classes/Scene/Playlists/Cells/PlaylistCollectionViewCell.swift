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
    didSet {
      bindViewModel()
    }
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
    self.coverImageView.image = nil
    self.titleLabel.text = nil
  }
  
  /*******************************************************************************/
  // MARK: - Update
  
  private func updateCoverUrl(coverUrl: URL?) {
    let placeholder: UIImage? = nil
    self.coverImageView.setImage(url: coverUrl, placeholder: placeholder)
  }
  
  private func updateTitle(title: String?) {
    self.titleLabel.text = title
  }
}

/*******************************************************************************/
// MARK: -

extension PlaylistCollectionViewCell {
  
  /**
   *
   */
  private func bindViewModel() {
    self.playlistViewModel?.coverUrl
      .asObservable()
      .subscribe({ e in
        guard let coverUrl = e.element else { return }
        self.updateCoverUrl(coverUrl: coverUrl)
      }).disposed(by: disposeBag)
    self.playlistViewModel?.title
      .asObservable()
      .subscribe({ e in
        guard let title = e.element else { return }
        self.updateTitle(title: title)
      }).disposed(by: disposeBag)
  }
  
  /**
   *
   */
  private func unbindViewModel() {
    
  }
}
