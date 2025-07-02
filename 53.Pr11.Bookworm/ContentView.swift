//
//  ContentView.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 02.07.2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter your text", text: $notes, axis: .horizontal)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
