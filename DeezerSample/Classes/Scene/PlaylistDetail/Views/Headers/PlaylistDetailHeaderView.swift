//
//  PlaylistDetailHeaderView.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class PlaylistDetailHeaderView: UIView {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - UI
  @IBOutlet private var coverImageView: UIImageView!
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var durationLabel: UILabel!
  @IBOutlet private var moreButton: UIButton!
  
  // - Data
  var viewModel: PlaylistDetailHeaderViewModel? {
    willSet { unbindViewModel() }
    didSet { bindViewModel() }
  }
  let disposeBag = DisposeBag()
}

/*******************************************************************************/
// MARK: -

extension PlaylistDetailHeaderView {
  
  /**
   *
   */
  private func bindViewModel() {
    bindCoverURL()
    bindTitle()
    bindDuration()
  }
  
  /**
   *
   */
  private func unbindViewModel() {
    
  }
  
  /**
   *
   */
  private func bindCoverURL() {
    self.viewModel?.coverURL
      .asObservable()
      .subscribe({ event in
        self.coverImageView.setImage(url: event.element!)
      })
      .disposed(by: disposeBag)
  }
  
  /**
   *
   */
  private func bindTitle() {
    self.viewModel?.title
      .asObservable()
      .subscribe({ event in
        self.titleLabel.text = event.element!
      })
      .disposed(by: disposeBag)
  }
  
  /**
   *
   */
  private func bindDuration() {
    self.viewModel?.duration
      .asObservable()
      .subscribe({ event in
        self.durationLabel.text = event.element!
      })
      .disposed(by: disposeBag)
  }
}
