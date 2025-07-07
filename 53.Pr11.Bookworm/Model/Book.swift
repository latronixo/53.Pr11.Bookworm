//
//  Book.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 03.07.2025.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var dateAdding3: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int, dateAdding: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.dateAdding3 = dateAdding
    }
}
