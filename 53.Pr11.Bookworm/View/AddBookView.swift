//
//  AddBookView.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 03.07.2025.
//

import SwiftUI

struct AddBookView: View {
    //переменная, которая содержит все данные для добавления новой книги
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    //локальные переменные, необходимые для добавления новой книги (для инициализации модели Book)
    @State private var title = "default title"
    @State private var author = "default author"
    @State private var rating = 3
    @State private var genre = "noname genre"
    @State private var review = "default review"
    
    private var readyToSave: Bool {
        //Проверяем, не являются ли строки пустыми или состоящими только из пробелов
        let title = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let author = author.trimmingCharacters(in: .whitespacesAndNewlines)
        let review = review.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return title.isEmpty && author.isEmpty && review.isEmpty
    }
    
    let genres = ["noname genre", "Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Write a review")) {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(readyToSave)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}

