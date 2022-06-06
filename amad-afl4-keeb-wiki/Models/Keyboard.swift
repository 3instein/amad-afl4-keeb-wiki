//
//  Keyboard.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import Foundation

struct Keyboard: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var designer: String
    var layout: String
    var mounting_system: String
    var weight: String
    var typing_angle: String
    var front_height: String
    var image: String
    var is_favorite: Bool
}
