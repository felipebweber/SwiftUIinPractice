//
//  SpotifyPlaylistView.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 06/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = false
//    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand,
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
//                        offset = frame.maxY
                        showHeader = frame.maxY < 150
                    } // the other way to resolve this is to use the geometry and overlay the header with the text
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(16)
                    
                    ForEach(products) { product in
                    SongRowCell(
                        imageSize: 50,
                        imageName: product.firstImage,
                        title: product.title,
                        subtitle: product.brand,
                        onCellPressed: {
                            goToPlaylistView(product: product)
                        },
                        onEllipsisPressed: {
                            
                        }
                        )
                    .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            
//            Text("\(offset)")
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(Color.black.opacity(0.5))
//                .foregroundStyle(.spotifyWhite)
//                .padding()
            
            header
//            .frame(height: 100)
            .frame(maxHeight: .infinity, alignment: .top)
            
            
            
        }
        
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
        
        
        
    }
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                
        }
        
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.3), value: showHeader)
    }
    
    private func goToPlaylistView(product: Product) {
        
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
    
    private func getData() async {
        do {
            
            products = try await DatabaseHelper().getProducts()
            
        } catch {
            print(error)
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}
