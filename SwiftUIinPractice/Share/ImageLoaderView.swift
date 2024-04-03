//
//  ImageLoaderView.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 03/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var imageUrl: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: imageUrl))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
        
//            .placeholder {
//                ProgressView()
//            }
//            .scaledToFit()
//            .frame(width: 100, height: 100)
    }
}

#Preview {
    ImageLoaderView()
//        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
