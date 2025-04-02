//
//  EventModel.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct Event: Identifiable, Codable {
    var id: Int
    var title: String
    var price: String
    var description: String
}
