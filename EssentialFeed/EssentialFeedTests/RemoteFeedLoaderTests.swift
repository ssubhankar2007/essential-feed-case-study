//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar Ghosh on 29/07/22.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestsDataFromURL() {
        //given
        let url = URL(string: "https://a-given-url.com")
        let (sut, client) = makeSUT(url: url!)
        
        //when
        sut.load()
        
        //then
        XCTAssertEqual(client.requestURL, url)
    }
    
    func test_load_twice_requestsDataFromURLTwice() {
        //given
        let url = URL(string: "https://a-given-url.com")
        let (sut, client) = makeSUT(url: url!)
        
        //when
        sut.load()
        sut.load()
        
        //then
        XCTAssertEqual(client.requestURLs, [url, url])
    }
    
    //MARK: - Helpers
    private func makeSUT(url: URL = URL(string: "https://a-given-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy){
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HttpClient {
        var requestURL: URL?
        var requestURLs = [URL]()
        
        func get(from url: URL?) {
            requestURL = url
            requestURLs.append(url!)
        }
    }
}
