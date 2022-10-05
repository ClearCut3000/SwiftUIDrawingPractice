//
//  InitialView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 12.09.2022.
//

import SwiftUI

struct InitialView: View {
  var body: some View {
    NavigationView {
      ZStack {
        Color(UIHelper.backgroundDarkColor).edgesIgnoringSafeArea(.all)
        VStack(spacing: 20) {
          HStack(spacing: 20) {
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
          }
          HStack(spacing: 20) {
            NavigationLink {
              ArcShape()
            } label: {
              Link(title: "ArcShape()")
            }
            NavigationLink {
              FlowerShape()
            } label: {
              Link(title: "FlowerShape()")
            }
          }
          NavigationLink {
            ImagePaintView()
          } label: {
            Link(title: "ImagePaintView()")
          }
          NavigationLink {
            MetalDrawingGroupView()
          } label: {
            Link(title: "MetalDrawingGroupView()")
          }
          HStack(alignment: .firstTextBaseline, spacing: 20) {
            NavigationLink {
              EffectsView()
            } label: {
              Link(title: "EffectsView()")
            }
            NavigationLink {
              TrapezoidView()
            } label: {
              Link(title: "TrapezoidView()")
            }
          }
          NavigationLink {
            CheckerboardView()
          } label: {
            Link(title: "CheckerboardView()")
          }
          NavigationLink {
            SpirographView()
          } label: {
            Link(title: "SpirographView()")
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
      .font(.title3)
      .foregroundColor(.orange)
      .padding(8)
      .overlay(
        RoundedRectangle(cornerRadius: 20)
          .stroke(Color.orange, lineWidth: 3)
      )
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
