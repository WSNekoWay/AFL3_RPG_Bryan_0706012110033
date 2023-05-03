//
//  Toast.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 01/05/23.
//

import SwiftUI
//this is toast 
struct Toast<Content: View>: View {
    let content: Content
    let delay: TimeInterval
    @Binding var isPresented: Bool

    init(delay: TimeInterval = 4.0, isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.delay = delay
        self._isPresented = isPresented
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 12) {
                content
                    .font(.custom("PixelOperator-Bold", size: 20))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2))
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)

            }
            .padding(.horizontal, 32)
            .opacity(isPresented ? 1 : 0)
            .animation(
                .easeInOut(duration: 0.3)
                ,value: 1
            )
            .offset(y: isPresented ? 80 - UIScreen.main.bounds.height / 2 : UIScreen.main.bounds.height / 2 - 100)
           
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}




struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        Toast(isPresented: .constant(true)) {
            Text("This is a toast!")
        }
    }
}


