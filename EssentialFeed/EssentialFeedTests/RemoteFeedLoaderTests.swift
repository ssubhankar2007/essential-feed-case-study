//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar Ghosh on 29/07/22.
//

import XCTest

class RemoteFeedLoader {
    
}

class HttpClient {
    var requestURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HttpClient()
         _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestURL)
    }

}
