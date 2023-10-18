//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Subhankar Ghosh on 28/07/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

