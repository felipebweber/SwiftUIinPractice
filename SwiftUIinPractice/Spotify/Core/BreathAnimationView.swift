//
//  SwiftUIView.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 06/04/24.
//

import SwiftUI

struct BreathAnimationView: View {
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    @State private var animationSpeed = 2.0 // Velocidade da animação

    var body: some View {
        VStack {
            Text("Inspire e Expire")
                .font(.title)

            Spacer()

            Circle()
                .fill(Color.blue)
                .scaleEffect(scale)
                .opacity(opacity)
                .frame(width: 100, height: 100, alignment: .center)
                .animation(Animation.easeInOut(duration: animationSpeed).repeatForever(autoreverses: true), value: scale)

            Spacer()

            Slider(value: $animationSpeed, in: 0.9...2.0, step: 0.5)
                .padding()
                .onChange(of: animationSpeed) { newValue in
                    // Atualizar a velocidade da animação
                    self.scale = 1.0 // Resetar a escala para o valor inicial
                    self.opacity = 1.0 // Resetar a opacidade para o valor inicial
                }

            Text("Velocidade: \(String(format: "%.1f", animationSpeed))s")
        }
        .padding()
        .onAppear {
            self.scale = 2.5 // Valor máximo de escala para simular a inspiração
            self.opacity = 0.5 // Valor mínimo de opacidade para simular a expiração
        }
    }
}

struct BreathAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BreathAnimationView()
    }
}
