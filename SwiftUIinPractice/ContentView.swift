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
    
    @Environment(\.router) var router
    
    var body: some View {
        
        List {
            Button("Open Spotify Home") {
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                }
            }
        }
        .padding()
        
    }
    
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
