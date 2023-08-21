//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Subhankar Ghosh on 28/07/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
