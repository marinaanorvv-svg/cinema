//
//  PosterView.swift
//  cinema
//
//  Created by Марина Норвардян on 04.11.2026.
//

import SwiftUI

struct PosterView: View {
    let movie: Movie
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: movie.colors,
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            Image(systemName: movie.icon)
                .font(.system(size: 64))
                .foregroundStyle(.white.opacity(0.3))
            LinearGradient(colors: [.clear, .black.opacity(0.85)],
                           startPoint: .top, endPoint: .bottom)
        }
    }
}


