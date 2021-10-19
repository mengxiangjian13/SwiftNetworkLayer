//
//  NetworkResponse.swift
//  SwiftNetworkLayer
//
//  Created by mengxiangjian on 2021/10/15.
//

import Foundation
import Alamofire

public enum NetworkResponse<T> {
    case success(data: T)
    case failure(Error?)
}
