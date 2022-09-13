//
//  Triangle.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 12.09.2022.
//

import SwiftUI

struct Triangle: View {

  @State private var webViewHeight: CGFloat = .zero

  var body: some View {
    VStack {
      Path { path in
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.closeSubpath()
      }
      .stroke(.blue, style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
      CodeView(dynamicHeight: $webViewHeight, htmlContentBody: codeHelper.triangleCode)
        .frame(height: webViewHeight)
    }
    .padding(10)
    .background(.black)
  }
}

struct Triangle_Previews: PreviewProvider {
  static var previews: some View {
    Triangle()
  }
}
