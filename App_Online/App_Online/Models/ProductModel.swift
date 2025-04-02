//
//  UserModel.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct ProductModel: Identifiable, Codable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var role_id: Int
}
