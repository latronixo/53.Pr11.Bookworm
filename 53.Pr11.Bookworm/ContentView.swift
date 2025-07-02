//
//  ContentView.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 02.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        Toggle("Remember Me", isOn: $rememberMe)
    }
}

#Preview {
    ContentView()
}
