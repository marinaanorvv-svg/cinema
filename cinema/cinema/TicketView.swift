import SwiftUI

struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct TicketView: View {
    let movie: Movie
    let session: String
    let seats: [Int]
    let total: Int

    var body: some View {
        VStack(spacing: Theme.l) {
            VStack(spacing: 0) {
                topPart
                tearLine
                bottomPart
            }
            .background(Theme.card)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.4), radius: 8, y: 4)

            Spacer()
        }
        .padding(Theme.m)
        .background(Theme.background.ignoresSafeArea())
        .navigationTitle("Ваш билет")
        .navigationBarTitleDisplayMode(.inline)
    }

    var topPart: some View {
        ZStack(alignment: .bottomLeading) {
            PosterView(movie: movie)
            VStack(alignment: .leading, spacing: Theme.s) {
                Text(movie.title)
                    .font(.title2.bold())
                Text("Сеанс в \(session)")
                    .font(.body)
                    .foregroundStyle(Theme.accent)
            }
            .foregroundStyle(.white)
            .padding(Theme.m)
        }
        .frame(height: 140)
    }

    var tearLine: some View {
        ZStack {
            DashedLine()
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                .foregroundStyle(.gray.opacity(0.5))
                .frame(height: 2)
                .padding(.horizontal, Theme.l)

            HStack {
                Circle().fill(Theme.background)
                    .frame(width: 24, height: 24)
                    .offset(x: -12)
                Spacer()
                Circle().fill(Theme.background)
                    .frame(width: 24, height: 24)
                    .offset(x: 12)
            }
        }
        .frame(height: 24)
    }

    var bottomPart: some View {
        VStack(spacing: Theme.m) {
            ForEach(seats, id: \.self) { s in
                Text("Ряд \(s / 6 + 1), место \(s % 6 + 1)")
                    .font(.body)
            }

            Image(systemName: "qrcode")
                .font(.system(size: 100))

            Text("Итого: \(total) ₽")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .padding(Theme.l)
    }
}
