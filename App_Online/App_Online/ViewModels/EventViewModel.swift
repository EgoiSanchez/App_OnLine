//
//  EventViewModel.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

class EventViewModel: ObservableObject {
    
    @Published var events: [Event] = []
    
    func fetchEvents () {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {return}
        print(url)
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let data = data {
                if let decodeResponse = try? JSONDecoder().decode([Event].self, from: data) {
                    DispatchQueue.main.async {
                        self.events = decodeResponse
                        print(self.events)
                    }
                }
            }
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response)
            }
        }.resume()
    }
}
