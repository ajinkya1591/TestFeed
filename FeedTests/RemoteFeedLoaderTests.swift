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
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_loadTwice_requestsDataFromURL() {
        let url = URL(string: "www.goggle.co")!
        let (make, client) = makeSUT(url: url)
        make.load()
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    // MARK: Helpers
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        
        func getURL(url: URL) {
            self.requestedURLs.append(url)
        }
    }
}
