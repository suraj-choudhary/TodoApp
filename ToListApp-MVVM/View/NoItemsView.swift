//
//  NoItemsView.swift
//  ToListApp-MVVM
//
//  Created by suraj kumar on 23/02/24.
//

import SwiftUI
struct NoItemsView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                Text("There is no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you Productive person? I think you should click the add button and add the bunch of items to your to-do-list")
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                    
                }
                .padding(.horizontal, animate ? 30 : 10)
                .shadow(
                    color: animate ? Color.accentColor : Color.accentColor.opacity(0.7),
                    radius: animate ? 10 : 30,
                    x: animate ? 1 : 1.1,
                    y: animate ? -7 : 0
                    )
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear() {
                addAnimation()
            }
        }
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity)
    }

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation
                .easeInOut(duration: 2.0)
                .repeatForever()) {
                    animate.toggle()
            }
        })
    }
}

#Preview {
    NavigationView {
        NoItemsView()
    }
}
