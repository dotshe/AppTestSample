//
//  LoadingView.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingView: UIView {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // - UI
  private var activityIndicatorView: NVActivityIndicatorView!
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.prepareUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.prepareUI()
  }
  
  /*******************************************************************************/
  // MARK: - Prepare
  
  private func prepareUI() {
    self.backgroundColor = UIColor.clear
    self.prepareActivityIndicatorView()
  }
  
  private func prepareActivityIndicatorView() {
    let activityIndicatorView = NVActivityIndicatorView(frame: frame)
    activityIndicatorView.type = .lineScalePulseOut
    activityIndicatorView.color = UIColor.white
    self.addSubview(activityIndicatorView)
    self.activityIndicatorView = activityIndicatorView
    self.applyLayout()
  }
  
  /*******************************************************************************/
  // MARK: - Actions
  
  func startAnimating() {
    self.activityIndicatorView?.startAnimating()
  }
  
  func stopAnimating() {
    self.activityIndicatorView?.stopAnimating()
  }
  
  /*******************************************************************************/
  // MARK: - Layout
  
  private func applyLayout() {
    self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.activityIndicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      self.activityIndicatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      self.activityIndicatorView.topAnchor.constraint(equalTo: self.topAnchor),
      self.activityIndicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
  }
}
