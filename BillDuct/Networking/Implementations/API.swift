//
//  API.swift
//  TriviaBuddy
//
//  Created by Raj Raval on 30/01/24.
//

import Foundation
import UIKit.UIImage

enum LoadingState {
    case idle
    case loading
    case error(type: APIError)
}

protocol API {
    func requestImage(from url: URL) async throws -> UIImage?
    func request<T: Codable>(_ endpoint: Endpoint) async throws -> T
}

extension API {
    func request<T: Codable>(_ endpoint: Endpoint) async throws -> T {
        let pathURL = endpoint.baseURL.appendingPathComponent(endpoint.path)

        guard var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: false) else {
            throw APIError.invalidURLError
        }

        if let queryItems = endpoint.queryItems, !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
        }

        guard let url = urlComponents.url else {
            throw APIError.invalidURLError
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        if endpoint.method == .post {
            request.httpBody = endpoint.body
        }

        logRequest(for: url, endpoint: endpoint)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.networkingError(error: NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil))
            }

            logResponse(for: httpResponse, data: data)
            
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch let error as URLError where error.code == .notConnectedToInternet || error.code == .networkConnectionLost {
            throw APIError.internetError
        } catch let error as URLError where error.code == .cannotDecodeRawData {
            throw APIError.decodingError(error: error)
        } catch let error {
            throw APIError.unknownError(error: error)
        }
    }

    func requestImage(from url: URL) async throws -> UIImage? {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.networkingError(error: NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil))
            }
            return UIImage(data: data)
        } catch let error as URLError where error.code == .notConnectedToInternet || error.code == .networkConnectionLost {
            throw APIError.internetError
        } catch let error as URLError where error.code == .cannotDecodeRawData {
            throw APIError.decodingError(error: error)
        } catch let error {
            throw APIError.unknownError(error: error)
        }
    }

    private func logRequest(for url: URL, endpoint: Endpoint) {
        Log.info("------------------------------------------")
        Log.info("⬆️ API REQUEST")
        Log.info("REQUEST URL: \(url)")
        Log.info("REQUEST METHOD: \(endpoint.method.rawValue)")
        if let headers = endpoint.headers {
            Log.info("REQUEST HEADERS: [\(headers)]")
        }
        if let body = endpoint.body {
            Log.info("REQUEST BODY: [\(body.prettyPrintToJSON)]")
        }
        if let parameters = endpoint.queryItems {
            Log.info("REQUEST QUERY PARAMETERS: [\(parameters)]")
        }
        Log.info("------------------------------------------")
    }

    private func logResponse(for httpResponse: HTTPURLResponse, data: Data, error: Error? = nil) {
        Log.info("------------------------------------------")
        Log.info("⬇️ API RESPONSE")
        Log.info("RESPONSE: \(httpResponse)")
        Log.info("RESPONSE CODE: \(httpResponse.statusCode)")
        Log.info("RESPONSE HEADERS: \(httpResponse.allHeaderFields)")
        Log.info("RESPONSE BODY: \(data.prettyPrintToJSON)")
        if let error {
            Log.error(error)
        }
        Log.info("------------------------------------------")
    }

}
