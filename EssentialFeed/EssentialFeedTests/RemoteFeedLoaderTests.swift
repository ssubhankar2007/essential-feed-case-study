//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar Ghosh on 29/07/22.
//

import XCTest

class RemoteFeedLoader {
    let client: HttpClient
    
    init(client: HttpClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://a-url.com"))
    }
}

protocol HttpClient {
    func get(from url: URL?)
}

class HTTPClientSpy: HttpClient {
    var requestURL: URL?
    
    func get(from url: URL?) {
        requestURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL() {
        //given
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        //when
        sut.load()
        
        //then
        XCTAssertNotNil(client.requestURL)
    }
}
