//
//  RemoteFeedLoaderTests.swift
//  FeedTests
//
//

import Foundation
import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.getURL(url: URL(string: "www.apple.com")!)
    }
}

protocol HTTPClient {
    func getURL(url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
    func getURL(url: URL) {
        self.requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func testRequestDataFromURL() {
        let httpClient = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: httpClient)
        sut.load()
        XCTAssertNotNil(httpClient.requestedURL)
    }
    
    func testDoesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requestedURL)
    }
    
}
