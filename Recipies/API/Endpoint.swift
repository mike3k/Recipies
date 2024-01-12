//
//  Endpoint.swift
//  Recipies
//
//  Created by Mike Cohen on 1/11/24.
//

import Foundation

class Endpoint: NSObject {
    private let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
        super.init()
    }

    func request(url: URL) -> URLRequest {
        return URLRequest(url: url)
    }

    func fetch(method: String) async throws -> Data {
        let urlString = "\(baseUrl)\(method)"
        let url = URL(string: urlString)!
        let (data,_) = try await URLSession.shared.data(for: request(url: url))
        return data
    }

}
