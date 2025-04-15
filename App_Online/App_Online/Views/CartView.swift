//
//  CartView.swift
//  App_Online
//
//  Created by  on 14/4/25.
//

import SwiftUI

struct CartView: View{
    
    
    var productCartView: Product
    @EnvironmentObject var carroVM: CartViewModel
    
    
    var body: some View {
        
        HStack{
            NavigationStack {
               List(carroVM.ListaCarroProducts){ product in
                   NavigationLink(destination: EventDetailView(productVistaEvent: product)) {
                       
                       HStack {
                           AsyncImage(url: URL(string: product.image)){ image in
                               image
                                   .resizable()
                                   .aspectRatio(contentMode: .fill)
                               
                           }placeholder: {
                               Color.gray
                           }.frame(width: 60, height: 80)
                           
                           
                           
                           VStack(alignment: .leading) {
                               Text(product.title)
                                   .font(.headline)
                                   .foregroundStyle(Color.black)
                                   .foregroundColor(.primary)
                               
                               Text(String("$\(product.price)"))
                                   .font(.subheadline)
                                   .foregroundColor(.secondary)
                               
                           }
                           
                           
                       }.background(Color(.white))
                       
                   }
               }
               Spacer()
               
               
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
