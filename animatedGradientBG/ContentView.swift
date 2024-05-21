//
//  ContentView.swift
//  animatedGradientBG
//
//  Created by Sriram P H on 5/21/24.
//

import SwiftUI

struct MovingMeshGradientView: View {
    @State private var offset1 = CGSize.zero
    @State private var offset2 = CGSize.zero
    @State private var offset3 = CGSize.zero
    @State private var offset4 = CGSize.zero

    private let animationDuration: Double = 10

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 300, height: 300)
                .offset(offset1)
                .blur(radius: 100)
                .onAppear {
                    animateCircle(offset: $offset1, width: 300, height: 300)
                }

            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 300, height: 300)
                .offset(offset2)
                .blur(radius: 100)
                .onAppear {
                    animateCircle(offset: $offset2, width: 300, height: 300)
                }

            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 300, height: 300)
                .offset(offset3)
                .blur(radius: 100)
                .onAppear {
                    animateCircle(offset: $offset3, width: 300, height: 300)
                }

            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.pink, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 300, height: 300)
                .offset(offset4)
                .blur(radius: 100)
                .onAppear {
                    animateCircle(offset: $offset4, width: 300, height: 300)
                }
        }
    }

    private func animateCircle(offset: Binding<CGSize>, width: CGFloat, height: CGFloat) {
        let maxWidth = UIScreen.main.bounds.width
        let maxHeight = UIScreen.main.bounds.height

        withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: true)) {
            offset.wrappedValue = CGSize(width: CGFloat.random(in: -maxWidth/2...maxWidth/2), height: CGFloat.random(in: -maxHeight/2...maxHeight/2))
        }
    }
}

struct ContentView: View {
    var body: some View {
        MovingMeshGradientView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
