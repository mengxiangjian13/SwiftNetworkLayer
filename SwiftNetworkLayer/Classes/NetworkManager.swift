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
                           response: @escaping (NetworkResponse<Any>) -> Void) {
        self.request(request, response: response)
    }
    
    public static func post(request: NetworkRequest,
                            response: @escaping (NetworkResponse<Any>) -> Void) {
        self.request(request,
                     method: .post,
                     response: response)
    }
    
    public static func get<T: Decodable>(of: T.Type = T.self,
                                         request: NetworkRequest,
                                         response: @escaping (NetworkResponse<T>) -> Void) {
        self.request(request, response: response)
    }
    
    public static func post<T: Decodable>(of: T.Type = T.self,
                                         request: NetworkRequest,
                                         response: @escaping (NetworkResponse<T>) -> Void) {
        self.request(request,
                     method: .post,
                     response: response)
    }
    
    
    // MARK: - Private static method
    
    private static func request(_ request: NetworkRequest,
                                method: HTTPMethod = .get,
                                response: @escaping (NetworkResponse<Any>) -> Void) {
        let r = Request(request: request,
                        httpMethod: method)
        AF.request(r)
            .validate()
            .responseJSON {
                switch $0.result {
                case .success(let object):
                    if let json = object as? [String: Any] {
                        if let code = json["code"] as? Int,
                           let message = json["message"] as? String,
                           let data = json["data"] {
                            if code == 0 {
                                response(.success(data: data))
                            } else {
                                response(.failure(NSError(domain: "com.network.layer.error",
                                                        code: code,
                                                        userInfo: [NSLocalizedDescriptionKey: message])))
                            }
                            return
                        }
                    }
                    response(.failure(nil))
                case .failure(let error):
                    response(.failure(error))
                }
            }
    }
    
    private static func request<T: Decodable>(_ request: NetworkRequest,
                                   method: HTTPMethod = .get,
                                   response: @escaping (NetworkResponse<T>) -> Void) {
        self.request(request) {
            switch $0 {
            case .success(data: let data):
                if let d = try? JSONSerialization.data(withJSONObject: data, options: .fragmentsAllowed),
                   let o = try? JSONDecoder().decode(T.self, from: d){
                    response(.success(data: o))
                    return
                }
                response(.failure(NSError(domain: "com.network.layer.error",
                                          code: 999999,
                                          userInfo: [NSLocalizedDescriptionKey: "json serialization decode error"])))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
}
