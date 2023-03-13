//
//  RemoteFeedLoaderTests.swift
//  FeedTests
//
//

import Foundation
import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.getURL(url: url)
    }
}

protocol HTTPClient {
    func getURL(url: URL)
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func testDoesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func testRequestDataFromURL() {
        let url = URL(string: "www.goggle.co")!
        let (make, client) = makeSUT(url: url)
        make.load()
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: Helpers
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        
        var requestedURL: URL?
        
        func getURL(url: URL) {
            self.requestedURL = url
        }
    }
}
