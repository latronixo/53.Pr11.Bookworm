//
//  _3_Pr11_BookwormApp.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 02.07.2025.
//

import SwiftData
import SwiftUI

@main
struct _3_Pr11_BookwormApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    let container: ModelContainer
    
    init() {
        do {
            // создаем конфигурацию с указанием имени и миграции
            let config = ModelConfiguration("Bookworm2")
            
            // Создаем контейнер с указанием модели и конфигурации
            container = try ModelContainer(for: Book.self, configurations: config)
        } catch {
            fatalError("Failed to create model container: \(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
        }
    }
}
