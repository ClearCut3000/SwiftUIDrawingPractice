//
//  Constants.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 13.09.2022.
//

import Foundation
import UIKit

enum htmlHelper {
  static let htmlContentHead: String = """
                                  <!DOCTYPE html>
                                  <html lang="en-GB">
                                  <head>
                                  <link rel="stylesheet" type="text/css" href="prism.css" />
                                  <script src="prism.js"></script>
                                  </head>
                                  <body>
                                  <pre><code class="language-swift">
                                  """
  static let htmlContendTail: String = """
                                  </code></pre>
                                  </body>
                                  </html>
                                  """
}

enum UIHelper {
  static let backgroundDarkColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1.0)
}

enum codeHelper {
  static let triangleCode = """
Path { path in
  path.move(to: CGPoint(x: 200, y: 100))
  path.addLine(to: CGPoint(x: 100, y: 300))
  path.addLine(to: CGPoint(x: 300, y: 300))
  path.addLine(to: CGPoint(x: 200, y: 100))
  path.closeSubpath()
}
.stroke(.blue, style: StrokeStyle(lineWidth: 12,
                                  lineCap: .round,
                                  lineJoin: .round))
"""

  static let triangleShapeCode = """
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
// Used in view with modifiers
  TriangleShapeStruct()
    .stroke(.red, style: StrokeStyle(lineWidth: 10,
                                     lineCap: .round,
                                     lineJoin: .round))
    .frame(width: 300, height: 300)
"""

  static let arcShapeCode = """
struct Arc: Shape {
  let startAngle: Angle
  let endAngle: Angle
  let clockwise: Bool
  func path(in rect: CGRect) -> Path {
    let rotationAdjustment = Angle.degrees(90)
    let modifiedStart = startAngle - rotationAdjustment
    let modifiedEnd = endAngle - rotationAdjustment
    var path = Path()
    path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.width / 2,
                startAngle: modifiedStart,
                endAngle: modifiedEnd,
                clockwise: !clockwise)
    return path
  }
}
// In SwiftUI 0 degrees is not straight upwards,
// but instead directly to the right.
// Shapes measure their coordinates from
// the bottom-left corner rather than the top-left corner,
// which means SwiftUI goes the other way around from one
// angle to the other.
Arc(startAngle: .degrees(0),
    endAngle: .degrees(110),
    clockwise: true)
  .stroke(.blue, lineWidth: 10)
  .frame(width: 300, height: 300)
"""
}
