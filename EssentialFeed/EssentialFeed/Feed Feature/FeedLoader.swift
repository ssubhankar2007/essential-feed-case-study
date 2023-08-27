//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Subhankar Ghosh on 28/07/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

