//
//  NetworkRequest.swift
//  SwiftNetworkLayer
//
//  Created by mengxiangjian on 2021/10/15.
//

import Foundation
import Alamofire
import CommonCrypto

public protocol NetworkRequest {
    var path: String {get}
    var parameters: [String: Any] {get}
}

struct Request: URLRequestConvertible {
    
    private let info: NetworkRequest
    private let httpMethod: HTTPMethod
    
    init(request: NetworkRequest,
         httpMethod: HTTPMethod = .get) {
        self.info = request
        self.httpMethod = httpMethod
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = NetworkConfig.baseURL.appendingPathComponent(info.path)
        var request = URLRequest(url: url)
        // http method
        request.httpMethod = self.httpMethod.rawValue
        
        // universal get params
        if let r = try? URLEncoding.queryString.encode(request, with: NetworkConfig.universalGETParams) {
            request = r
        }
        
        // params
        if info.parameters.count > 0 {
            if let r = try? URLEncoding.default.encode(request, with: info.parameters) {
                request = r
            }
        }
        
        // http headers
        var headers = NetworkConfig.universalHeaders
        headers.add(name: "SSOTK", value: NetworkConfig.ssotk)
        headers.add(name: "TK", value: lejianTK(request: request))
        request.headers = headers
        
        return request
    }
    
    func lejianTK(request: URLRequest) -> String {
        if let query = request.url?.query {
            let ts = NetworkConfig.timestamp
            let s = "zCezLmB8o76lk\(ts)\(query)"
            let tk = "\(s.md5).\(ts)"
            return tk
        }
        return ""
    }
}

extension String {
    var md5: String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}
