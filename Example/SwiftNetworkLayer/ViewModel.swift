//
//  ViewModel.swift
//  SwiftNetworkLayer_Example
//
//  Created by mengxiangjian on 2021/10/18.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SwiftNetworkLayer

struct DecodedObject: Codable {
    var yesterdayOre: Int
}

enum ViewRequest: NetworkRequest {
    case home
    
    var path: String {
        switch self {
        case .home:
            return "v1/wz/zxzq/baseinfo"
        default:
            return ""
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .home:
            return [:]
        default:
            return [:]
        }
    }
    
    
}

class ViewModel: NSObject {
    func request(block: @escaping (Bool) -> Void) {
//        NetworkManager.get(request: ViewRequest.home) {
//            debugPrint($0)
//        }
        
        NetworkManager.get(of: DecodedObject.self,
                           request: ViewRequest.home) {
            switch $0 {
            case .success(data: let object):
                debugPrint(object)
                block(true)
            case .failure(let error):
                debugPrint(error ?? "no error")
                block(false)
            }
        }
    }
}
