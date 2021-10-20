//
//  NetworkConfig.swift
//  SwiftNetworkLayer
//
//  Created by mengxiangjian on 2021/10/20.
//

import Foundation
import Alamofire

/// const value define
struct NetworkConfig {
    static var isTestAPI = true
    
    static var baseURL: URL {
        if isTestAPI {
            return URL(string: "http://lej-api-dev.le.com")!
        }
        return URL(string: "https://api.leseee.com")!
    }
    
    static var universalGETParams: [String: String] {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return ["version": version, "pcode": "210210000"]
        }
        return [
            "pcode": "210210000"
        ]
    }
    
    static var universalHeaders: HTTPHeaders {
        return [
            .accept("application/json")
        ]
    }
    
    static var timestamp: Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    static var ssotk = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzY1MTA3MjcsInVpZCI6MTc3NzUzLCJzc291aWQiOiIzMTk5NzU1MDYiLCJzc290ayI6IjEwMlhYWHVzQmlucW01bTNoNWYxdVRueFdtMkxiVzRaZm5BMm0zODdsQ09CTW0zY0YwUW01ODJVUk1qUmM5TXVHOUtPcmdIcVRMOTFVbFk1T3ZqQlN4ZjZ0TDcwdE1pd1dTeWlZRXJaNTNuYXY4THZtM0RPbTV6bkFtNCJ9._Nrm6cugbHnM9ntjcRHDkblZwCrioQvi81xCqeDp-b8"
}
