//
//  PlaylistHeaderCell.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 06/04/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Playlist Title"
    var subtitle: String = "Playlist Subtitle"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                ImageLoaderView(urlString: imageName)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                        .lineLimit(2)
                        .padding(4)
                    
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .padding(4)
                    
                    
                }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                    LinearGradient(
                        gradient: Gradient(colors: [shadowColor.opacity(0), shadowColor]),
                        startPoint: .top,
                        endPoint: .bottom)
                    )
                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
//            .frame(height: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
