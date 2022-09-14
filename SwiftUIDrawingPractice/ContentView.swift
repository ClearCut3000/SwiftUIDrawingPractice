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
      ZStack {
        Color(UIHelper.backgroundDarkColor).edgesIgnoringSafeArea(.all)
        VStack(spacing: 20) {
          NavigationLink {
            TrianglePath()
          } label: {
            Link(title: "TrianglePath()")
          }
          NavigationLink {
            TriangleShape()
          } label: {
            Link(title: "TriangleShape()")
          }
          NavigationLink {
            ArcShape()
          } label: {
            Link(title: "ArcShape()")
          }
        }
      }
    }
  }
}

struct Link: View {
  var title: String
  var body: some View {
    Text(title)
      .fontWeight(.bold)
              .font(.title)
              .foregroundColor(.orange)
              .padding()
              .overlay(
                  RoundedRectangle(cornerRadius: 20)
                      .stroke(Color.orange, lineWidth: 3)
              )
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
