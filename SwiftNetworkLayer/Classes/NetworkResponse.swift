//
//  NetworkResponse.swift
//  SwiftNetworkLayer
//
//  Created by mengxiangjian on 2021/10/15.
//

import Foundation
import Alamofire

public enum NetworkResponse {
    case success(data: Any)
    case failure(Error?)
    
    init(response: AFDataResponse<Any>) {
        switch response.result {
        case .success(let object):
            if let json = object as? [String: Any] {
                if let code = json["code"] as? Int,
                   let message = json["message"] as? String,
                   let data = json["data"] {
                    if code == 0 {
                        self = .success(data: data)
                    } else {
                        self = .failure(NSError(domain: "com.network.layer.error",
                                                code: code,
                                                userInfo: [NSLocalizedDescriptionKey: message]))
                    }
                    return
                }
            }
            self = .failure(nil)
        case .failure(let error):
            self = .failure(error)
        }
    }
}
