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
        // comprobar si se metian articulos en el carro
        print("producto añadido: \(producto.title)")
        guardarCarro()
        
    }
    
    // para sumar mas facil el precio los articulos
    func totalCarrito() -> Double {
        var total = 0.0
        for producto in ListaCarroProducts {
            total += producto.price
        }
        return total
    }
    
    //guardar carro JSON sin AUTH??
    func guardarCarro() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ListaCarroProducts) {
            UserDefaults.standard.set(encoded, forKey: "carro")
        }
    }
    
    // cargo datos carro si los hay
    func cargarCArro () {
        if let carroGuardado = UserDefaults.standard.data(forKey: "carrito") {
            let decoder = JSONDecoder()
            if let productosCarro = try? decoder.decode([Product].self, from: carroGuardado) {
                ListaCarroProducts = productosCarro
            }
        }
        
    }
    

    
}
