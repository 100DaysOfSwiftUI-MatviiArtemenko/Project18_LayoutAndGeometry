//
//  ContentView.swift
//  Project18_LayoutAndGeometry
//
//  Created by admin on 10/03/2023.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0 ..< 50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)

                            // MARK: Challenge #3

                            .background(Color(hue: (geo.frame(in: .global).minY / 2.6) / fullView.size.height / 1.6, saturation: 0.5, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 3, axis: (x: 0, y: 1, z: 0))

                            // MARK: Challenge #1

                            .opacity((geo.frame(in: .global).minY - 100) / 100.0)

                            // MARK: Challenge #2

                            .scaleEffect((geo.frame(in: .global).minY / 100) * 0.2)
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
