//
//  TriangleShape.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 14.09.2022.
//

import SwiftUI

struct TriangleShape: View {
  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor)
        .ignoresSafeArea()
      VStack(spacing: 30) {
        Triangle()
          .stroke(.red, style: StrokeStyle(lineWidth: 10,
                                           lineCap: .round,
                                           lineJoin: .round))
          .frame(width: 250, height: 250)
        SampleCodeView(htmlContentBody: CodeLibrary.triangleShapeCode)
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.orange, lineWidth: 3)
          )
      }
      .padding(10)
    }
  }
}

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    return path
  }
}

struct TriangleShape_Previews: PreviewProvider {
  static var previews: some View {
    TriangleShape()
  }
}
