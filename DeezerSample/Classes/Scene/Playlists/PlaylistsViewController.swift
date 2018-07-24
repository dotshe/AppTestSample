//
//  PlaylistsViewController.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import UIKit
import RxSwift

class PlaylistsViewController: UIViewController {
  
  /*******************************************************************************/
  // MARK: - Constant & Enums
  
  struct Constants {
    struct Layout {
      static let numberOfItemsByLine: Int = 3
    }
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - UI
  @IBOutlet private var collectionView: UICollectionView!
  @IBOutlet private var activityView: LoadingView!
  
  // - Data
  var playlistsViewModel: PlaylistsViewModel!
  let disposeBag = DisposeBag()
  
  /*******************************************************************************/
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareUI()
    prepareViewModel()
    activityView.startAnimating()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      let numberOfItemsByLine: Int = Constants.Layout.numberOfItemsByLine
      let sectionLength = flowLayout.sectionInset.left + flowLayout.sectionInset.right
      let itemWidth = (self.collectionView.frame.width - sectionLength - (CGFloat(numberOfItemsByLine) - 1)*flowLayout.minimumInteritemSpacing)/CGFloat(numberOfItemsByLine)
      flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
      flowLayout.invalidateLayout()
    }
  }
  
  /*******************************************************************************/
  // MARK: - Prepare
  
  private func prepareUI() {
    prepareCollectionView()
  }
  
  private func prepareViewModel() {
    bindViewModel()
    self.playlistsViewModel.fetchPlaylists()
  }
  
  private func prepareCollectionView() {
    let reuseIdentifier: String = PlaylistCollectionViewCell.reuseIdentifier
    let cellNib: UINib? = PlaylistCollectionViewCell.nib
    self.collectionView.register(cellNib, forCellWithReuseIdentifier: reuseIdentifier)
  }
}

/*******************************************************************************/
// MARK: - PlaylistsViewController - UICollectionViewDatasource

extension PlaylistsViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.playlistsViewModel.numberOfPlaylistViewModels()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let reuseIdentifier = PlaylistCollectionViewCell.reuseIdentifier
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
    if let cell = cell as? PlaylistCollectionViewCell {
      cell.playlistViewModel = self.playlistsViewModel.playlistViewModel(atIndex: indexPath.row)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if let cell = cell as? PlaylistCollectionViewCell {
      cell.playlistViewModel?.fetchPlaylist()
    }
  }
}

/*******************************************************************************/
// MARK: - PlaylistsViewController - UICollectionViewDelegate

extension PlaylistsViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    
    if let playlistIdentifier = self.playlistsViewModel.playlistIdentifier(atIndex: indexPath.row) {
      Router.presentPlaylistDetailViewController(forPlaylistIdentifier: playlistIdentifier)
    }
  }
}

/*******************************************************************************/
// MARK: -

extension PlaylistsViewController {
  
  /**
   *
   */
  private func bindViewModel() {
    self.playlistsViewModel.playlists
      .asObservable()
      .subscribe({ _ in
        self.collectionView.reloadData()
      }).disposed(by: disposeBag)
    self.playlistsViewModel.loading
      .asObservable()
      .subscribe({ event in
        guard let loading = event.element else { return }
        if loading {
          self.activityView.startAnimating()
        } else {
          self.activityView.stopAnimating()
        }
      }).disposed(by: disposeBag)
  }
  
  /**
   *
   */
  private func unbindViewModel() {
    
  }
}
