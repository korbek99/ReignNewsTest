//
//  AuthorListViewModel.swift
//  ReignNewsTest
//
//  Created by Jose David Bustos H on 10-03-23.
//

import Foundation

struct AuthorListViewModel {
    let listAuthorNews: [Hit]
}

extension AuthorListViewModel {
    
    var numberOfSections: Int {
        return self.listAuthorNews.count
    }
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.listAuthorNews.count
    }
    func articleAtIndex(_ index: Int) -> AuthorListViewModel {
        let article = self.listAuthorNews[index]
        return AuthorListViewModel(listAuthorNews: listAuthorNews)
    }
    
}

struct AuthorViewModel {
    private let article: Hit
}

extension AuthorViewModel {
    init(_ article: Hit) {
        self.article = article
    }
}

extension AuthorViewModel {
    var author: String {
        return self.article.author
    }
    var commentText: String {
        return self.article.commentText
    }
    
    var storyURL: String {
        return self.article.storyURL
    }
    var title: String {
        return self.article.title
    }

}
