//
//  EventView.swift
//  App_Online
//
//  Created by  on 2/4/25.
//

import SwiftUI

struct EventDetailView: View{
    
    
    var event: Event
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                    .foregroundStyle(.red)
                    .opacity(0.5)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing:10) {
                    Text(event.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    Text("descripcion \(event.price)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text("Tipo de evento: \(event.description)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        print("Boton pulsado")
                    }) {
                        Text("Add to cart")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 3)
                    
                    Spacer()
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
