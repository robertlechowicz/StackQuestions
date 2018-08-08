//
//  BaseNetworking.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import Foundation

struct Endpoints {
    static let api = "https://api.stackexchange.com/2.2/"
    static let search = "search"
    static let answers = "answers/"
}

typealias QueryResultCallback = (QueryResult<Data>) -> Void

enum QueryResult<T> {
    case success(T)
    case error(Error)
}

class BaseNetworking {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?

    func performRequest(url: URL, completion: @escaping QueryResultCallback) {
        dataTask?.cancel()
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in

            if let error = error {
                completion(.error(error))
            }

            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                completion(.success(data))
            }
        })
        dataTask?.resume()
    }

    func makeUrl(with path: String, params: [String: String]) -> URL? {
        guard var urlComponents = URLComponents(string: Endpoints.api + path) else {
            return nil
        }

        urlComponents.queryItems = [URLQueryItem(name: "site", value: "stackoverflow")]

        for param in params {
            let item = URLQueryItem(name: param.key, value: param.value)
            urlComponents.queryItems?.append(item)
        }

        return urlComponents.url
    }

}
