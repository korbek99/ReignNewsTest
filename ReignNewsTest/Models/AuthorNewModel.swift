//
//  AuthorNewModel.swift
//  ReignNewsTest
//
//  Created by Jose David Bustos H on 10-03-23.
//

import Foundation

// MARK: - Welcome4
struct AuthorNewModel: Decodable {
    let hits: [Hit]
    let nbHits, page, nbPages, hitsPerPage: Int
    let exhaustiveNbHits, exhaustiveTypo: Bool
    let exhaustive: Exhaustive
    let query: String
    let params: String
    let processingTimeMS: Int
    let processingTimingsMS: ProcessingTimingsMS
    let serverTimeMS: Int
}

// MARK: - Exhaustive
struct Exhaustive: Decodable  {
    let nbHits, typo: Bool
}

// MARK: - Hit
struct Hit: Decodable  {
    let createdAt: String
    let title, url: String
    let author: String
    let points, storyText: String
    let commentText: String
    let numComments: String
    let storyID: Int
    let storyTitle: String
    let storyURL: String
    let parentID, createdAtI: Int
    let tags: [String]
    let objectID: String
    let highlightResult: HighlightResult
}

// MARK: - HighlightResult
struct HighlightResult: Decodable  {
    let author, commentText, storyTitle: Author
    let storyURL: Author?
}

// MARK: - Author
struct Author: Decodable  {
    let value: String
    let matchLevel: String
    let matchedWords: [String]
    let fullyHighlighted: Bool?
}

// MARK: - ProcessingTimingsMS
struct ProcessingTimingsMS: Decodable  {
    let afterFetch: AfterFetch
    let fetch: Fetch
    let request: Request
    let total: Int
}

// MARK: - AfterFetch
struct AfterFetch: Decodable  {
    let total: Int
}

// MARK: - Fetch
struct Fetch: Decodable  {
    let scanning, total: Int
}

// MARK: - Request
struct Request: Decodable  {
    let queue, roundTrip: Int
}
