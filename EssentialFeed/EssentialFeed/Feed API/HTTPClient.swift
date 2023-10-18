//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Subhankar Ghosh on 27/08/23.
//

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping(Result<(Data, HTTPURLResponse), Error>) -> Void)
}
