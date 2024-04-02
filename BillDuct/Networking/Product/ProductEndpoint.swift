//
//  ProductEndpoint.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

enum ProductEndpoint: Endpoint {
    case getProducts
    case addProduct(data: MultiformData)

    var baseURL: URL {
        return URL(string: "https://app.getswipe.in/api/public/")!
    }

    var path: String {
        switch self {
        case .getProducts:
            return "get"
        case .addProduct(_):
            return "add"
        }
    }

    var headers: [String : String]? {
        switch self {
        case .addProduct(let data):
            return data.header
        default:
            return nil
        }
    }

    var method: HTTPRequestMethod {
        switch self {
        case .getProducts:
            return .get
        case .addProduct(_):
            return .post
        }
    }

    var body: Data? {
        switch self {
        case .addProduct(let data):
            return data.body
        default:
            return nil
        }
    }

    var queryItems: [URLQueryItem]? {
        return nil
    }
}
