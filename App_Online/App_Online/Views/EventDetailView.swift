//
//  EventView.swift
//  App_Online
//
//  Created by  on 2/4/25.
//

import SwiftUI

struct EventDetailView: View{
    
    
    var product: Product
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center, spacing: 80) {
                Spacer()
                AsyncImage(url: URL(string: product.image)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                }placeholder: {
                    Color.gray
                }.frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing:10) {
                    Text(product.title)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    
                    Text("Tipo de evento: \(product.description)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        print("Boton pulsado")
                    }) {
                        Text("Add to cart")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            
                            .cornerRadius(10)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                            .background(Color.purple)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(radius: 3)
                   
                }
                .padding()
            }
            
        }
        
    }
}

//#Preview{
   // EventDetailView(event:
                      //  Event(id:2, title:: "Articulo",
                        //      event_detail: "Chupa de cuero",
                             // event_type_id: 1))
//}
