//
//  SpotifyHomeView.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 03/04/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                LazyVStack(spacing: 1,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        
                        VStack(spacing: 16) {
                            recentsSection
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.spotifyWhite)
                                .frame(height: 200)
                                .cornerRadius(16)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                        }
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
            
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            print(error)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("Image tapped")
                        }
                }
            }.frame(width: 35, height: 35)
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id:\.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }.scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(imageName: product.firstImage, title: product.title)
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: {
                print("Add to playlist")
            },
            onPlayPressed: {
                print("Play")
            }
        )
    }
}

#Preview {
    SpotifyHomeView()
}
