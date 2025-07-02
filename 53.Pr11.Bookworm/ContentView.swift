//
//  ContentView.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 02.07.2025.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        PushButton(title: "Remeber Me", isOn: $rememberMe)
        Text(rememberMe ? "On" : "Off")
    }
}

#Preview {
    ContentView()
}
