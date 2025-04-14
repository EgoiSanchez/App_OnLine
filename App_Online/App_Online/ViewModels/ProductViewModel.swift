//
//  EventViewModel.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    func fetchProducts () {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {return}
        print(url)
        
        let request = URLRequest(url: url)
        
        
       
        
        
        
        
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let decodeResponse = try? JSONDecoder().decode([Product].self, from: data) {
                    DispatchQueue.main.async {
                        self.products = decodeResponse
                        print(self.products)
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
