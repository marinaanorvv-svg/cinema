
import SwiftUI

struct CatalogView: View {
    @State private var searchText = ""
    @State private var selectedGenre = "Все"
    @State private var onlyFavorites = false
    @State private var favorites: Set<Int> = []

    var genres: [String] {
        ["Все"] + Array(Set(allMovies.map(\.genre))).sorted()
    }

    var filtered: [Movie] {
        allMovies.filter { movie in
            (selectedGenre == "Все" || movie.genre == selectedGenre)
            && (searchText.isEmpty || movie.title.localizedCaseInsensitiveContains(searchText))
            && (!onlyFavorites || favorites.contains(movie.id))
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Theme.m) {
                    filters

                    if filtered.isEmpty {
                        Text("Ничего не найдено")
                            .font(.body)
                            .foregroundStyle(.gray)
                            .padding(Theme.l)
                    }

                    LazyVStack(spacing: Theme.m) {
                        ForEach(filtered) { movie in
                            ZStack(alignment: .topTrailing) {
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    card(for: movie)
                                }
                                heart(for: movie)
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .animation(.easeInOut(duration: 0.25), value: filtered.map(\.id))
                }
                .padding(Theme.m)
            }
            .background(Theme.background.ignoresSafeArea())
            .navigationTitle("Кинотеатр")
            .searchable(text: $searchText, prompt: "Поиск фильма")
            .sensoryFeedback(.selection, trigger: favorites)
        }
    }

    var filters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Theme.s) {
                chip(title: "Избранное", isOn: onlyFavorites) {
                    onlyFavorites.toggle()
                }
                ForEach(genres, id: \.self) { genre in
                    chip(title: genre, isOn: selectedGenre == genre) {
                        selectedGenre = genre
                    }
                }
            }
        }
    }
    
    func chip(title: String, isOn: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .foregroundStyle(isOn ? .black : .white)
                .padding(.horizontal, Theme.m)
                .padding(.vertical, Theme.s)
                .background(isOn ? Theme.accent : Theme.card)
                .clipShape(Capsule())
        }
    }

    func heart(for movie: Movie) -> some View {
        let isFav = favorites.contains(movie.id)
        return Button {
            if isFav { favorites.remove(movie.id) } else { favorites.insert(movie.id) }
        } label: {
            Image(systemName: isFav ? "heart.fill" : "heart")
                .foregroundStyle(isFav ? Theme.accent : .white)
                .padding(Theme.s)
                .background(.black.opacity(0.4))
                .clipShape(Circle())
        }
        .padding(Theme.s)
    }
    
    func card(for movie: Movie) -> some View {
        ZStack(alignment: .bottomLeading) {
            PosterView(movie: movie)
            VStack(alignment: .leading, spacing: Theme.s) {
                Text(movie.title)
                    .font(.title2.bold())
                Text(movie.genre)
                    .font(.caption)
                    .foregroundStyle(Theme.accent)
            }
            .foregroundStyle(.white)
            .padding(Theme.m)
        }
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.4), radius: 8, y: 4)
    }
}
