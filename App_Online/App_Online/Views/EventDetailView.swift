//
//  EventView.swift
//  App_Online
//
//  Created by  on 2/4/25.
//

import SwiftUI

struct EventDetailView: View{
    
    @EnvironmentObject var carroVM: CartViewModel
    var productVistaEvent: Product
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center, spacing: 80) {
                Spacer()
                AsyncImage(url: URL(string: productVistaEvent.image)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                }placeholder: {
                    Color.gray
                }.frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing:10) {
                    Text(productVistaEvent.title)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    
                    Text("Tipo de evento: \(productVistaEvent.description)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        
                        // el id:\.self es un identificador para darle una clave unico a cada valor (Salio cunadso recorria el array de los botones en el ejercicio de la calculadora)
                       // ForEach(0..<Int(productVistaEvent.rating.rate), id: \.self) { _ in
                         //   Image(systemName: "star.fill")
                           //     .foregroundColor(.yellow)
                        //}
                        
                        StarsView(rating: productVistaEvent.rating.rate, maxRating: 5)
                    }
                    .frame(maxWidth: .infinity, alignment: .center) 
                    
                    Button(action: {
                        carroVM.anadirProducto(producto: productVistaEvent)
                        print(carroVM.ListaCarroProducts)
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

// referencia en stackoverflow, pero la segunda respuesta https://stackoverflow.com/questions/64379079/how-to-present-accurate-star-rating-using-swiftui

struct StarsView: View {
    let rating: CGFloat
    let maxRating: CGFloat
    
    private let size: CGFloat = 12
    var body: some View {
        let text = HStack(spacing: 0) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
        }

        ZStack {
            text
            HStack(content: {
                GeometryReader(content: { geometry in
                    HStack(spacing: 0, content: {
                        let width1 = self.valueForWidth(geometry.size.width, value: rating)
                        let width2 = self.valueForWidth(geometry.size.width, value: (maxRating - rating))
                        Rectangle()
                            .frame(width: width1, height: geometry.size.height, alignment: .center)
                            .foregroundColor(.yellow)
                        
                        Rectangle()
                            .frame(width: width2, height: geometry.size.height, alignment: .center)
                            .foregroundColor(.gray)
                    })
                })
                .frame(width: size * maxRating, height: size, alignment: .trailing)
            })
            .mask(
                text
            )
        }
        .frame(width: size * maxRating, height: size, alignment: .leading)
    }
    
    func valueForWidth(_ width: CGFloat, value: CGFloat) -> CGFloat {
        value * width / maxRating
    }
}

//#Preview{
// EventDetailView(event:
//  Event(id:2, title:: "Articulo",
//      event_detail: "Chupa de cuero",
// event_type_id: 1))
//}
