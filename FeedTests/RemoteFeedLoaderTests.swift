//
//  RemoteFeedLoaderTests.swift
//  FeedTests
//
//

import Foundation
import XCTest
import Feed

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
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
