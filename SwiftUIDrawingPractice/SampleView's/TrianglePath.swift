//
//  Triangle.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 12.09.2022.
//

import SwiftUI

struct TrianglePath: View {
  var body: some View {
    VStack(spacing: 20) {
      Path { path in
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.closeSubpath()
      }
      .stroke(.blue, style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
      
      SampleCodeView(htmlContentBody: CodeLibrary.triangleCode)
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.orange, lineWidth: 3)
        )
    }
    .padding(10)
    .background(Color(UIHelper.backgroundDarkColor))
  }
}

struct Triangle_Previews: PreviewProvider {
  static var previews: some View {
    TrianglePath()
  }
}
