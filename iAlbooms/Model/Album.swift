//
//  Albums.swift
//  iAlbooms
//
//  Created by Muhammad Fakhryan on 01/06/23.
//

import Foundation

struct Album: Identifiable, Codable {
    var id: Int
    var albumName: String
    var albumCover: String
    var artistName: String
    var songs: Song?
    var isFavorite: Bool = false
}
