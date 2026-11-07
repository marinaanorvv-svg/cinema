//
//  cinemaApp.swift
//  cinema
//
//  Created by Марина Норвардян on 04.11.2026.
//

import SwiftUI

@main
struct CinemaApp: App {
    var body: some Scene {
        WindowGroup {
            CatalogView()
                .preferredColorScheme(.dark)
        }
    }
}
