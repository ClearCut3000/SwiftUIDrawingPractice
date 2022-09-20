//
//  Constants.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 13.09.2022.
//

import Foundation
import UIKit

enum HTMLHelper {
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

enum CodeLibrary {
  static let flowerShape = """
  struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0

    func path(in rect: CGRect) -> Path {
      var path = Path()
      for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
        let rotation = CGAffineTransform(rotationAngle: number)
        let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2,
                                                                y: rect.height / 2))
        let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
        let rotatedPetal = originalPetal.applying(position)
        path.addPath(rotatedPetal)
      }
      return path
    }
  }
  """

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
// Arc shape with insets and corforming InsettableShape Protocol
struct Arc: InsettableShape {
  let startAngle: Angle
  let endAngle: Angle
  let clockwise: Bool
  var insetAmount = 0.0

  func path(in rect: CGRect) -> Path {
    let rotationAdjustment = Angle.degrees(90)
    let modifiedStart = startAngle - rotationAdjustment
    let modifiedEnd = endAngle - rotationAdjustment
    var path = Path()
    path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.width / 2 - insetAmount,
                startAngle: modifiedStart,
                endAngle: modifiedEnd,
                clockwise: !clockwise)
    return path
  }

  func inset(by amount: CGFloat) -> some InsettableShape {
    var arc = self
    arc.insetAmount += amount
    return arc
  }
}
/* In SwiftUI 0 degrees is not straight upwards,
   but instead directly to the right.
   Shapes measure their coordinates from
   the bottom-left corner rather than the top-left corner,
   which means SwiftUI goes the other way around from one
   angle to the other.
*/
Arc(startAngle: .degrees(0),
    endAngle: .degrees(110),
    clockwise: true)
  .strokeBorder(.green, lineWidth: 40)
  .frame(width: 300, height: 300)
"""

  static let imagePaintSample = """
Capsule()
  .strokeBorder(
    ImagePaint(image: Image("Example"),
              sourceRect: CGRect(x: overlayXValue,
                                  y: overlayYValue,
                                  width: imageWidth,
                                  height: imageHeight),
              scale: 0.5),
    lineWidth: 30)
  .frame(width: 300, height: 200)
"""

  static let drawingGroupSample = """
struct ColorCyclingView: View {

  //MARK: - View Properties
  var amount = 0.0
  var steps = 100

  //MARK: - View Body
  var body: some View {
    ZStack {
      ForEach(0..<steps) { value in
        Circle()
          .inset(by: Double(value))
          .strokeBorder(
            LinearGradient(gradient: Gradient(colors: [
              color(for: value, brightness: 1),
              color(for: value, brightness: 0.5)
            ]),
                           startPoint: .top,
                           endPoint: .bottom),
            lineWidth: 2)
      }
    }
    .drawingGroup()
  }

  //MARK: - View Methods
  func color(for value: Int, brightness: Double) -> Color {
    var targetHue = Double(value) / Double(steps) + amount
    if targetHue > 1 {
      targetHue -= 1
    }
    return Color(hue: targetHue, saturation: 1, brightness: brightness)
  }
}
"""

  static let effectsView = """
// MARK: - Triple RGD Circles
ZStack {
  Circle()
    .fill(Color(red: 1, green: 0, blue: 0))
    .frame(width: 200 * amount)
    .offset(x: -50, y: -80)
    .blendMode(.screen)
  Circle()
    .fill(Color(red: 0, green: 1, blue: 0))
    .frame(width: 200 * amount)
    .offset(x: 50, y: -80)
    .blendMode(.screen)
  Circle()
    .fill(Color(red: 0, green: 0, blue: 1))
    .frame(width: 200 * amount)
    .blendMode(.screen)
}
.frame(width: 300, height: 300)

//MARK: - Image 
Image("Example")
  .resizable()
  .scaledToFit()
  .frame(width: 200, height: 200)
  .saturation(amount)
  .blur(radius: (1-amount) * 20)
"""
}
