//
//  NetworkerRequest+Alamofire.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import Alamofire

extension NetworkerRequest.Method {
  var alamofire: Alamofire.HTTPMethod {
    switch(self) {
    case .get: return Alamofire.HTTPMethod.get
    case .post: return Alamofire.HTTPMethod.post
    case .put: return Alamofire.HTTPMethod.put
    case .delete: return Alamofire.HTTPMethod.delete
    }
  }
}

extension NetworkerRequest.ParameterEncoding {
  var alamofire: Alamofire.ParameterEncoding {
    switch(self) {
    case .json: return JSONEncoding.default
    }
  }
}
