//
//  PlaylistViewController.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import UIKit
import RxSwift

class PlaylistDetailViewController: UIViewController {
  
  /*******************************************************************************/
  // MARK: - Constants
  
  private struct Constants {
    struct Layout {
      static let cellHeight: CGFloat = 68.0
    }
    struct Values {
      static let loadNextDataCellCountLimit: Int = 5
    }
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - UI
  @IBOutlet private weak var contentView: UIView!
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private var nextFooterTableView: UIView!
  @IBOutlet private weak var nextLoadingView: LoadingView!
  private var fullHeaderView: PlaylistDetailFullHeaderView = PlaylistDetailFullHeaderView.loadFromNib()!
  private var collapsedHeaderView: PlaylistDetailCollapsedHeaderView = PlaylistDetailCollapsedHeaderView.loadFromNib()!
  
  // - Data
  var tracksViewModel: TracksViewModel! {
    didSet {
      let playlistIdentifier = tracksViewModel.playlistIdentifier
      let viewModel: PlaylistDetailHeaderViewModel = PlaylistDetailHeaderViewModel(withPlaylistIdentifier: playlistIdentifier)
      self.fullHeaderView.viewModel = viewModel
      self.collapsedHeaderView.viewModel = viewModel
      viewModel.fetchPlaylistDetails()
    }
  }
  let disposeBag = DisposeBag()
  
  /*******************************************************************************/
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepare()
    bindViewModel()
    self.tracksViewModel.fetchTracks()
  }
  
  /*******************************************************************************/
  // MARK: - Prepare
  
  /**
   *
   */
  private func prepare() {
    prepareCollapsedHeader()
    prepareFullHeader()
    prepareTableView()
  }
  
  /**
   *
   */
  private func prepareCollapsedHeader() {
    self.contentView.addSubview(self.collapsedHeaderView)
    self.collapsedHeaderView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.collapsedHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
      self.collapsedHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      self.collapsedHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      ])
  }
  
  /**
   *
   */
  private func prepareFullHeader() {
    self.tableView.tableHeaderView = self.fullHeaderView
  }
  
  /**
   *
   */
  private func prepareTableView() {
    let reuseIdentifier: String = TrackTableViewCell.reuseIdentifier
    let cellNib: UINib? = TrackTableViewCell.nib
    self.tableView.register(cellNib, forCellReuseIdentifier: reuseIdentifier)
    self.tableView.rowHeight = Constants.Layout.cellHeight
  }
  
  /*******************************************************************************/
  // MARK: - Actions
  
  @IBAction func closeButtonIsClicked(_ sender: Any?) {
    dismiss(animated: true, completion: nil)
  }
}

/*******************************************************************************/
// MARK: -

extension PlaylistDetailViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tracksViewModel.numberOfTracksViewModels()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let reuseIdentifier = TrackTableViewCell.reuseIdentifier
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    
    if let cell = cell as? TrackTableViewCell {
      cell.trackViewModel = self.tracksViewModel.trackViewModel(atIndex: indexPath.row)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row > (tableView.numberOfRows(inSection: 0)-Constants.Values.loadNextDataCellCountLimit) {
      if self.tracksViewModel.canLoadMoreTracks() {
        self.tracksViewModel.fetchNextTracks()
      }
    }
  }
}

extension PlaylistDetailViewController: UITableViewDelegate {
  
}

extension PlaylistDetailViewController: UIScrollViewDelegate {
  
  private func updateHeader(animated: Bool = false) {
    let collapsed: Bool = self.tableView.contentOffset.y > (self.fullHeaderView.frame.height - self.collapsedHeaderView.frame.height)
    
    if animated {
      UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations: {
        self.collapsedHeaderView.alpha = !collapsed ? 0.0 : 1.0
      }, completion: nil)
    } else {
      self.collapsedHeaderView.alpha = !collapsed ? 0.0 : 1.0
    }
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeader(animated: true)
  }
  
  
}
/*******************************************************************************/
// MARK: -

extension PlaylistDetailViewController {
  
  /**
   *
   */
  private func bindViewModel() {
    self.tracksViewModel.tracks
      .asObservable()
      .subscribe({ _ in
        self.tableView.reloadData()
      }).disposed(by: disposeBag)
    self.tracksViewModel.nextLoading
      .asObservable()
      .subscribe({ _ in
        if self.tracksViewModel.isLoadingNextTracks() {
          self.tableView.tableFooterView = self.nextFooterTableView
          self.nextLoadingView.startAnimating()
        } else {
          self.tableView.tableFooterView = nil
          self.nextLoadingView.stopAnimating()
        }
      }).disposed(by: disposeBag)
  }
  
  /**
   *
   */
  private func unbindViewModel() {
    
  }
}
