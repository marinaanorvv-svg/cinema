//
//  MovieDetailView.swift
//  cinema
//
//  Created by Марина Норвардян on 04.11.2026.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Theme.m) {
                ZStack(alignment: .bottomLeading) {
                    PosterView(movie: movie)
                    VStack(alignment: .leading, spacing: Theme.s) {
                        Text(movie.title).font(.title2.bold())
                        Text(movie.genre)
                            .font(.caption)
                            .foregroundStyle(Theme.accent)
                    }
                    .foregroundStyle(.white)
                    .padding(Theme.m)
                }
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.4), radius: 8, y: 4)
                
                Label("\(movie.duration) мин", systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Text(movie.description)
                    .font(.body)
                    .foregroundStyle(.white)
                
                NavigationLink {
                    SeatsView(movie: movie)
                } label: {
                    Text("Выбрать сеанс")
                        .font(.body.bold())
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(Theme.m)
                        .background(Theme.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding(Theme.m)
        }
        .background(Theme.background.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}
