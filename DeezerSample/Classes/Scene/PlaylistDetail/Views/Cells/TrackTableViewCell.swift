//
//  TrackTableViewCell.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class TrackTableViewCell: UITableViewCell, ViewReusable {
  
  /*******************************************************************************/
  // MARK: - Constant & Enums
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - UI
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var artistLabel: UILabel!
  @IBOutlet private var durationLabel: UILabel!
  
  // - Data
  var trackViewModel: TrackViewModel? {
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
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.titleLabel.text = nil
    self.artistLabel.text = nil
    self.durationLabel.text = nil
  }
  
  /*******************************************************************************/
  // MARK: - Update
  
  private func updateTitle() {
    self.titleLabel.text = self.trackViewModel?.titleFormatted()
  }
  
  private func updateArtist() {
    self.artistLabel.text = self.trackViewModel?.artistFormatted()
  }
  
  private func updateDuration() {
    self.durationLabel.text = self.trackViewModel?.durationFormatted()
  }
}

/*******************************************************************************/
// MARK: -

extension TrackTableViewCell {
  
  /**
   *
   */
  private func bindViewModel() {
    self.trackViewModel?.title
      .asObservable()
      .subscribe({ e in
        self.updateTitle()
      }).disposed(by: disposeBag)
    self.trackViewModel?.artist
      .asObservable()
      .subscribe({ e in
        self.updateArtist()
      }).disposed(by: disposeBag)
    self.trackViewModel?.duration
      .asObservable()
      .subscribe({ e in
        self.updateDuration()
      }).disposed(by: disposeBag)
  }
  
  /**
   *
   */
  private func unbindViewModel() {
    
  }
}
