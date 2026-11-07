import SwiftUI

struct SeatsView: View {
    let movie: Movie

    @State private var sessionIndex = 0
    @State private var selected: Set<Int> = []
    @State private var showTicket = false

    var occupied: Set<Int> {
        Set((0..<30).filter { ($0 * 37 + movie.id * 11 + sessionIndex * 17) % 7 < 2 })
    }

    let columns = Array(repeating: GridItem(.flexible(), spacing: Theme.s), count: 6)

    var total: Int { selected.count * movie.price }

    var body: some View {
        ScrollView {
            VStack(spacing: Theme.l) {
                sessionPicker

                Capsule()
                    .fill(Theme.accent.opacity(0.6))
                    .frame(height: 6)
                    .padding(.horizontal, Theme.l)

                HStack(spacing: Theme.s) {
                    VStack(spacing: Theme.s) {
                        ForEach(1...5, id: \.self) { row in
                            Text("\(row)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .frame(width: 16, height: 40) // высота как у кресла
                        }
                    }
                    LazyVGrid(columns: columns, spacing: Theme.s) {
                        ForEach(0..<30, id: \.self) { index in
                            seat(index)
                        }
                    }
                }

                legend
            }
            .padding(Theme.m)
        }
        .background(Theme.background.ignoresSafeArea())
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) { bottomBar }
        .navigationDestination(isPresented: $showTicket) {
            TicketView(movie: movie,
                       session: movie.sessions[sessionIndex],
                       seats: selected.sorted(),
                       total: total)
        }
        .onChange(of: sessionIndex) { selected = [] }
        .sensoryFeedback(.selection, trigger: selected)
    }

    var legend: some View {
        HStack(spacing: Theme.m) {
            legendItem(color: Theme.card, text: "Свободно")
            legendItem(color: Theme.accent, text: "Выбрано")
            legendItem(color: Color.gray.opacity(0.3), text: "Занято")
        }
    }

    func legendItem(color: Color, text: String) -> some View {
        HStack(spacing: Theme.s) {
            RoundedRectangle(cornerRadius: 4)
                .fill(color)
                .frame(width: 16, height: 16)
            Text(text)
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }

    var sessionPicker: some View {
        HStack(spacing: Theme.s) {
            ForEach(movie.sessions.indices, id: \.self) { i in
                Button {
                    sessionIndex = i
                } label: {
                    Text(movie.sessions[i])
                        .font(.body)
                        .foregroundStyle(i == sessionIndex ? .black : .white)
                        .frame(maxWidth: .infinity)
                        .padding(Theme.s)
                        .background(i == sessionIndex ? Theme.accent : Theme.card)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }

    func seat(_ index: Int) -> some View {
        let isTaken = occupied.contains(index)
        let isSelected = selected.contains(index)

        return Button {
            if isSelected { selected.remove(index) } else { selected.insert(index) }
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .fill(isTaken ? Color.gray.opacity(0.3)
                      : isSelected ? Theme.accent : Theme.card)
                .frame(height: 40)
        }
        .disabled(isTaken)
        .scaleEffect(isSelected ? 1.15 : 1)
        .animation(.spring(duration: 0.25), value: isSelected)
    }

    var bottomBar: some View {
        HStack {
            Text("\(total) ₽")
                .font(.title2.bold())
                .foregroundStyle(.white)
            Spacer()
            Button {
                showTicket = true
            } label: {
                Text("Купить")
                    .font(.body.bold())
                    .foregroundStyle(.black)
                    .padding(.horizontal, Theme.l)
                    .padding(.vertical, Theme.s)
                    .background(selected.isEmpty ? Color.gray : Theme.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(selected.isEmpty)
        }
        .padding(Theme.m)
        .background(Theme.card)
    }
}
