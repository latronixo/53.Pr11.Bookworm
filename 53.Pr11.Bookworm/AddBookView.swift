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
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
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
                    
                    Picker("Rating", selection: $rating) {
                        ForEach(1...5, id: \.self) {
                            Text(String($0))
                        }
                    }
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
