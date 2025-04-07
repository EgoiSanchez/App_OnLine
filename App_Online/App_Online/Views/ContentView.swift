//
//  ContentView.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var productVM = ProductViewModel()
    
    
    var body: some View {
        
      
        
        
        NavigationStack {
            List(productVM.products){ product in
                NavigationLink(destination: EventDetailView(product: product)) {
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
            }.onAppear(){ productVM.fetchProducts()}
            
        }
        
        TabView {
                OrderView()
                    .tabItem {
                        Image(systemName: "cart")
                    }
                    // this also automatically hides the badge when 0
                   // .badge(order.product.count)
            }
        
        
    }

}




#Preview {
    ContentView()
}
