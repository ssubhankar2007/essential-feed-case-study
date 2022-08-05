//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar Ghosh on 29/07/22.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HttpClient.shared.requestURL = URL(string: "https://a-url.com")
    }
}

class HttpClient {
    static let shared = HttpClient()
    private init() {}
    
    var requestURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HttpClient.shared
         _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestURL)
    }

    func test_load_requestDataFromURL() {
        //given
        let client = HttpClient.shared
        let sut = RemoteFeedLoader()
        
        //when
        sut.load()
        
        //then
        XCTAssertNotNil(client.requestURL)
    }
}
