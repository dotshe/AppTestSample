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
  // MARK: - Properties
  
  // - UI
  @IBOutlet private weak var contentView: UIView!
  @IBOutlet private weak var tableView: UITableView!
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
  
  /*******************************************************************************/
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepare()
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
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let reuseIdentifier = "Nothing"
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
  }
}

extension PlaylistDetailViewController: UITableViewDelegate {
  
}

