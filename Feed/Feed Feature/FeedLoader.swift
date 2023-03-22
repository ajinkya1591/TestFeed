//
//  FeedLoader.swift
//  Feed
//
//  Created by Ajinkya More on 19/12/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func loadItems(completion: @escaping (LoadFeedResult) -> Void )
}
