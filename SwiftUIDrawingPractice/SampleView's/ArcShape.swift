//
//  ArcShape.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 14.09.2022.
//

import SwiftUI

struct ArcShape: View {
  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor)
        .ignoresSafeArea()
      VStack {
        Arc(startAngle: .degrees(-90),
            endAngle: .degrees(90),
            clockwise: true)
          .strokeBorder(.green, lineWidth: 40)
          .frame(width: 300, height: 300)

        SampleCodeView(htmlContentBody: CodeLibrary.arcShapeCode)
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.orange, lineWidth: 3)
          )
      }
      .padding(10)
    }
  }
}

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

struct ArcShape_Previews: PreviewProvider {
  static var previews: some View {
    ArcShape()
  }
}
