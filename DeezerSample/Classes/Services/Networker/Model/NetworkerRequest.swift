//
//  NetworkerRequest.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

struct NetworkerRequest {
  
  /*******************************************************************************/
  // MARK: - Constants & Enums
  
  enum Method {
    case get
    case post
    case put
    case delete
  }
  
  enum ParameterEncoding {
    case json
    case urlEncoded
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  let method: NetworkerRequest.Method
  let scheme: String
  let host: String
  let path: String
  let parameters: [String: Any]
  let encoding: ParameterEncoding
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(method: NetworkerRequest.Method = NetworkerRequest.Method.get,
       scheme: String,
       host: String,
       path: String,
       parameters: [String: Any] = [:],
       encoding: ParameterEncoding = ParameterEncoding.json) {
    self.method = method
    self.scheme = scheme
    self.host = host
    self.path = path
    self.parameters = parameters
    self.encoding = encoding
  }
}
