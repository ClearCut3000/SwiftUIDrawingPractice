//
//  ContentView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
        VStack {
          NavigationLink {
            TrianglePath()
          } label: {
            Text("TrianglePath()")
              .padding(10)
          }

        }
        .navigationTitle("Shapes, Structs and Animation Samples")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
