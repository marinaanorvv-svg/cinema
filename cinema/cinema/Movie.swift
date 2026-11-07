//
//  Movie.swift
//  cinema
//
//  Created by Марина Норвардян on 04.11.2026.
//

import SwiftUI

struct Movie: Identifiable {
    let id: Int
    let title: String
    let genre: String
    let description: String
    let duration: Int
    let icon: String
    let colors: [Color]
    let sessions: [String]
    let price: Int
}

let allMovies: [Movie] = [
    Movie(id: 1, title: "Интерстеллар", genre: "Фантастика", description: "Команда исследователей отправляется сквозь червоточину, чтобы найти новый дом для человечества", duration: 169, icon: "moon.stars.fill", colors: [.indigo, .purple], sessions: ["12:30", "16:00", "20:15"], price: 450),
    Movie(id: 2, title: "Начало", genre: "Триллер", description: "Профессиональный вор проникает в сны и крадёт секреты, но получает задание внедрить идею в чужой разум.", duration: 148, icon: "lighthouse.fill", colors: [.teal, .blue], sessions: ["13:00", "18:30", "21:45"], price: 400),
    Movie(id: 3, title: "Джентльмены", genre: "Комедия", description: "Американский экспат в Лондоне строит наркоимперию, а вокруг него плетут интриги все, кому не лень.", duration: 113, icon: "pawprint.fill", colors: [.orange, .red], sessions: ["11:00", "14:30", "17:00"], price: 350),
    Movie(id: 4, title: "Оно", genre: "Ужасы", description: "Семеро детей сталкиваются с древним злом, которое принимает облик их худших страхов.", duration: 135, icon: "house.fill", colors: [.green, .black], sessions: ["19:00", "21:30", "23:45"], price: 420),
    Movie(id: 5, title: "Зелёная книга", genre: "Драма", description: "Вышибала становится водителем чернокожего пианиста в поездке по югу Америки 1960-х.", duration: 130, icon: "envelope.fill", colors: [.pink, .purple], sessions: ["12:00", "15:30", "19:30"], price: 380)
]
