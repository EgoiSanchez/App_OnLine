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
    //detecta el modo que tiene el telefono
    @Environment(\.colorScheme) var colorModo
    // recuoerar el modo dentroi de kos user defauts
    @State private var modoOscuro: Bool = UserDefaults.standard.bool(forKey: "modoOscuro")
    
    var body: some View{
        
        // toogle devuelve true o false y guardo en userdefauts.standar
        Button(action: {
            modoOscuro.toggle()
            UserDefaults.standard.set(modoOscuro, forKey: "modoOscuro")
        }) {
            Text("Cambiar de modo oscuro/claro")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }

        
        
        
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
                .badge(carroVM.ListaCarroProducts.count)
        }
        
        // if/else en una sola linea
        .preferredColorScheme(modoOscuro ? .dark : .light)
    }
}

struct HomeView: View {
    @ObservedObject var productVM : ProductViewModel
    //enviroment para que no cree una nueva sino que instancia la que meto los articulos en la lista, sino crea una nueva
    @EnvironmentObject var carroVM: CartViewModel
    @Environment(\.colorScheme) var colorModo
    
    var body: some View {
        VStack{
            Text("Products")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(colorModo == .dark ? Color.gray.opacity(0.5) : Color.purple)
            
       
            
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
                }.onAppear(){ productVM.fetchProducts()
                    carroVM.cargarCArro() }
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
    @Environment(\.colorScheme) var colorModo
    var body: some View {
        VStack {
            
            
            Text("Shopping cart")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(colorModo == .dark ? Color.gray.opacity(0.5) : Color.purple)
            
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
                Button(action: {
                    print("Total de la compra: $\(carroVM.totalCarrito())")
                }) {
                    Text("$\(String(format: "%.2f", carroVM.totalCarrito())) - Checkout")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            
            
        }
    }
    
    
    
    
    
}





#Preview {
    ContentView()
}
