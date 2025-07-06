//
//  ContentView.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 02.07.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext   //переменная, хранящаяся в оперативной памяти
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author, order: .reverse)
    ]) var books: [Book]  //переменная, которая будет инициализирована из БД, хранящейся на диске
    
    @State private var showingAddScreen = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink (value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack (alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .font(.subheadline)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
}

#Preview {
    ContentView()
}
