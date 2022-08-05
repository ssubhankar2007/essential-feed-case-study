//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar Ghosh on 29/07/22.
//

import XCTest

class RemoteFeedLoader {
    let client: HttpClient
    let url: URL
    
    init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
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
        let url = URL(string: "https://a-given-url.com")
        _ = RemoteFeedLoader(url: url!, client: client)
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL() {
        //given
        let url = URL(string: "https://a-given-url.com")
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url!, client: client)
        
        //when
        sut.load()
        
        //then
        XCTAssertEqual(client.requestURL, url)
    }
}
