//
//  NetworkManager.swift
//  SwiftNetworkLayer
//
//  Created by mengxiangjian on 2021/10/15.
//

import Foundation
import Alamofire

public struct NetworkManager {
    public static func get(request: NetworkRequest,
                           response: @escaping (NetworkResponse) -> Void) {
        let r = Request(request: request)
        AF.request(r)
            .validate()
            .responseJSON {
                let r = NetworkResponse(response: $0)
                response(r)
            }
    }
}
