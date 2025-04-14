//
//  CartViewModel.swift
//  App_Online
//
//  Created by  on 14/4/25.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published var ListaCarroProducts: [Product] = []
    
    
    func anadirProducto(producto: Product) {
        
        self.ListaCarroProducts.append(producto)
        print("producto añadido: \(producto.title)")
        
    }
    
    
    
    

}
