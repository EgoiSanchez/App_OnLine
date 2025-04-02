//
//  ContentView.swift
//  App_Online
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var eventVM = EventViewModel()
    
    
    var body: some View {
        NavigationStack {
            List(eventVM.events){ event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    HStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundStyle(.red)
                            .opacity(0.5)
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(10)
                            .padding(.bottom, 8)
                        
                        VStack(alignment: .leading) {
                            Text(event.title)
                                .font(.headline)
                                .foregroundStyle(Color("PrimaryColor"))
                                .foregroundColor(.primary)
                            
                            Text(event.price)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text("Tipo: \(event.description)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Text(Date().formatted())
                                .font(.footnote)
                                .foregroundColor(.accentColor)
                            
                        }
                        
                        
                    }.background(Color("PrimaryColor"))
                    
                    
                    
                }
            }
            
        }
    }
}


#Preview {
    ContentView()
}
