#Cinema: a learning iOS app

A learning app for booking movie tickets, built with **Swift** and **SwiftUI**.
All movies are fictional. Posters are drawn with gradients and SF Symbols icons.

#Features

- Movie catalog: cards with a poster, title, and genre
- Search by title and genre filter
- Favorites: a heart button on each card and an "only favorites" filter
- Movie details: large poster, description, duration
- Session and seat selection: 5×6 seat grid with three seat states (free, selected, taken)
- Taken seats are different for each session
- Row numbers, a legend, total price calculation, and an animation plus haptic feedback when picking a seat
- E-ticket with a tear-off line and a QR icon

#Screenshots

<!-- Add your screenshots here: drag and drop images into this field on GitHub -->

#Tech stack

- Swift, SwiftUI
- iOS 17+
- Xcode
- No third-party libraries and no API: all data lives in the code

#Project structure

```
cinema/
├── CinemaApp.swift        // app entry point, dark theme
├── Theme.swift            // colors and spacing (8, 16, 24)
├── Movie.swift            // Movie model and the list of movies
├── PosterView.swift       // poster: gradient + icon + dark overlay
├── CatalogView.swift      // catalog, search, filters, favorites
├── MovieDetailView.swift  // movie details screen
├── SeatsView.swift        // sessions and seat selection
└── TicketView.swift       // e-ticket
```

#How to run

1. Clone the repository or download it as a ZIP
2. Open the project in Xcode
3. Choose an iPhone simulator (iOS 17 or later)
4. Press **Cmd + R**

#What I learned from this project

- Building screens with `VStack`, `HStack`, `ZStack`, `ScrollView`, and `LazyVGrid`
- Managing state with `@State` and passing data between screens
- Navigation: `NavigationStack`, `NavigationLink`, `navigationDestination`
- Filtering lists and using computed properties
- Animations (`scaleEffect`, `transition`) and haptics (`sensoryFeedback`)
- A simple design system: colors and spacing kept in one `Theme` file

#Ideas for future improvements

- Date selection for sessions
- A "My tickets" tab
- A VIP row with a different price
- Saving favorites between app launches
