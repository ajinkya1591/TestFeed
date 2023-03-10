//
//  RemoteFeedLoaderTests.swift
//  FeedTests
//
//

import Foundation
import XCTest

class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.getURL(url: URL(string: "www.apple.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    func getURL(url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
//    private init(url: URL) {
//
//    }
    
    override func getURL(url: URL) {
        self.requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func testRequestDataFromURL() {
        let httpClient = HTTPClientSpy()
        HTTPClient.shared = httpClient
        let sut = RemoteFeedLoader()
        sut.load()
        XCTAssertNotNil(httpClient.requestedURL)
    }
    
    func testDoesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
}
