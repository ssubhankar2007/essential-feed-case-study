//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar Ghosh on 29/07/22.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HttpClient.shared.get(from: URL(string: "https://a-url.com"))
        
    }
}

class HttpClient {
    static var shared = HttpClient()
    func get(from url: URL?) {}
}

class HTTPClientSpy: HttpClient {
    var requestURL: URL?
    
    override func get(from url: URL?) {
        requestURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HttpClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL() {
        //given
        let client = HTTPClientSpy()
        HttpClient.shared = client
        let sut = RemoteFeedLoader()
        
        //when
        sut.load()
        
        //then
        XCTAssertNotNil(client.requestURL)
    }
}
