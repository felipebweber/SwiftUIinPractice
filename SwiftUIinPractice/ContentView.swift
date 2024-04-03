//
//  ContentView.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 03/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var products: [Product] = []
    @State private var users: [User] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { product in
                    Text(product.title)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
            print(products)
            
            users = try await DatabaseHelper().getUsers()
            print(users)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
