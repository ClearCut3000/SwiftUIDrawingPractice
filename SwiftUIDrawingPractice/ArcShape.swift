//
//  ArcShape.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 14.09.2022.
//

import SwiftUI

struct ArcShape: View {
    var body: some View {
      Arc(startAngle: .degrees(0),
          endAngle: .degrees(110),
            clockwise: true)
        .stroke(.blue, lineWidth: 10)
        .frame(width: 300, height: 300)
    }
}

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

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        ArcShape()
    }
}
