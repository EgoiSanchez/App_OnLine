//
//  UserModel.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct Product: Identifiable, Codable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
}
struct Rating : Codable{
    var rate: Double
    var count: Int
}
