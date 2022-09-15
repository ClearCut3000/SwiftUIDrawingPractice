//
//  FlowerShape.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 15.09.2022.
//

import SwiftUI

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

struct FlowerShape: View {
  @State private var petalOffset = -20.0
  @State private var petalWidth = 100.0
  @State private var color = Color.red
  @State private var isShowingCode = false

  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor).ignoresSafeArea()
      VStack {
        Flower(petalOffset: petalOffset, petalWidth: petalWidth)
          .fill(color, style: FillStyle(eoFill: true))
          .frame(width: 250, height: 250)
        ColorPicker("Pick a color", selection: $color, supportsOpacity: false)
          .padding()

        Text("Offset")
        Slider(value: $petalOffset, in: -40...40)
          .padding([.horizontal, .bottom])

        Text("Width")
        Slider(value: $petalWidth, in: 0...100)
          .padding([.horizontal, .bottom])

        Button {
          isShowingCode.toggle()
        } label: {
          Link(title: "Show Code")
        }
      }
      PopupCodeSample(show: $isShowingCode, message: CodeLibrary.flowerShape)
    }
  }
}

struct Flower_Previews: PreviewProvider {
  static var previews: some View {
    FlowerShape()
  }
}
