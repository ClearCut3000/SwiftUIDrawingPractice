//
//  TriangleShape.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 14.09.2022.
//

import SwiftUI

struct TriangleShape: View {
  @State private var webViewHeight: CGFloat = .zero

  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor)
        .ignoresSafeArea()
      VStack {
        TriangleShapeStruct()
          .stroke(.red, style: StrokeStyle(lineWidth: 10,
                                           lineCap: .round,
                                           lineJoin: .round))
          .frame(width: 250, height: 250)

        CodeView(dynamicHeight: $webViewHeight, htmlContentBody: codeHelper.triangleShapeCode)
          .frame(height: webViewHeight)
      }
      .padding(10)
      .background(Color(UIHelper.backgroundDarkColor))
    }
  }
}

struct TriangleShapeStruct: Shape {
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
