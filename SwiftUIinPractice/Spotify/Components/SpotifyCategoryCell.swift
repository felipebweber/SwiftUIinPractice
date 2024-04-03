//
//  SpotifyCategoryCell.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 03/04/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundColor(isSelected ? .spotifyBlack : .spotifyWhite)
            .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Primeiro")
            SpotifyCategoryCell(title: "Segundo", isSelected: true)
            SpotifyCategoryCell(isSelected: true)
        }
    }
}
