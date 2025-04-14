//
//  ContentView.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var productVM = ProductViewModel()
    @StateObject private var carroVM = CartViewModel()
    
    var body: some View{
        
        TabView {
            HomeView(productVM: productVM)
                .environmentObject(carroVM)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            accountView()
                .tabItem{
                    Label("Account", systemImage: "star")
                }
            OrderView()
                .environmentObject(carroVM)
                .tabItem{
                    Label("Order", systemImage: "cart")
                }
        }
    }
}

struct HomeView: View {
    @ObservedObject var productVM : ProductViewModel
    @EnvironmentObject var carroVM: CartViewModel

    var body: some View {
        VStack{
            Text("Products")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
            
             NavigationStack {
                List(productVM.products){ product in
                    NavigationLink(destination: EventDetailView(productVistaEvent: product).environmentObject(carroVM))  {
                        
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
                Spacer()
                
                
            }
        }
    }
}

struct accountView: View {
    
    
    var body: some View {
        
        
    }
}





struct OrderView: View {
    
    @EnvironmentObject var carroVM: CartViewModel
    
    var body: some View {
        VStack {
            
    
            Text("Shopping cart")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
            
            VStack{
              
                NavigationStack {
                   List(carroVM.ListaCarroProducts){ product in
                       NavigationLink(destination: CartView(productCartView: product).environmentObject(carroVM)) {
                           
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
                   }.onAppear(){
                       //carroVM.fetchProducts()
                       print("Productos cargados: \(carroVM.ListaCarroProducts.count)")}
                   Spacer()
                   
                   
               }
            }
        }
    }
}





#Preview {
    ContentView()
}
