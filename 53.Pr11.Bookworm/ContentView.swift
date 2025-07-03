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
    @Query var books: [Book]  //переменная, которая будет инициализирована из БД, хранящейся на диске
    
    @State private var showingAddScreen = false

    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
//            List(students) { student in
//                Text(student.name)
//            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        showingAddScreen.toggle()
                    }
                
//                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
//                    
//                    let chosenFirstName = firstNames.randomElement()!
//                    let chosenLastName = lastNames.randomElement()!
//                    
//                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    //сохраняем в оперативной памяти
                    //modelContext.insert(student)
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
