//
//  RemoteFeedLoader.swift
//  Feed
//
//  Created by Ajinkya More on 13/3/23.
//

import Foundation

public protocol HTTPClient {
    func getURL(url: URL)
}


public final class RemoteFeedLoader {

    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load() {
        client.getURL(url: url)
    }
}
