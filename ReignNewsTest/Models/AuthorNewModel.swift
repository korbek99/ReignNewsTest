//
//  AuthorNewModel.swift
//  ReignNewsTest
//
//  Created by Jose David Bustos H on 10-03-23.
//

import Foundation

// MARK: - Welcome4
struct AuthorNewModel {
    let hits: [Hit]
    let nbHits, page, nbPages, hitsPerPage: Int
    let exhaustiveNbHits, exhaustiveTypo: Bool
    let exhaustive: Exhaustive
    let query: Query
    let params: String
    let processingTimeMS: Int
    let processingTimingsMS: ProcessingTimingsMS
    let serverTimeMS: Int
}

// MARK: - Exhaustive
struct Exhaustive {
    let nbHits, typo: Bool
}

// MARK: - Hit
struct Hit {
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
struct HighlightResult {
    let author, commentText, storyTitle: Author
    let storyURL: Author?
}

// MARK: - Author
struct Author {
    let value: String
    let matchLevel: MatchLevel
    let matchedWords: [Query]
    let fullyHighlighted: Bool?
}

enum MatchLevel {
    case full
    case none
}

enum Query {
    case ios
}

// MARK: - ProcessingTimingsMS
struct ProcessingTimingsMS {
    let afterFetch: AfterFetch
    let fetch: Fetch
    let request: Request
    let total: Int
}

// MARK: - AfterFetch
struct AfterFetch {
    let total: Int
}

// MARK: - Fetch
struct Fetch {
    let scanning, total: Int
}

// MARK: - Request
struct Request {
    let queue, roundTrip: Int
}
