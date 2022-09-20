//
//  MetalDrawingGroupView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 20.09.2022.
//

import SwiftUI

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

struct MetalDrawingGroupView: View {

  //MARK: - View Properties
  @State private var colorCycle = 0.0
  @State private var show = false

  //MARK: - View Body
  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor).ignoresSafeArea()
      VStack {
        ColorCyclingView(amount: colorCycle)
          .frame(width: 300, height: 300)

        Slider(value: $colorCycle)
          .padding()

        Button {
          show.toggle()
        } label: {
          Link(title: "Show Code")
        }
        .padding(.top, 100)
      }
      PopupCodeSample(show: $show, message: CodeLibrary.drawingGroupSample)
    }
  }
}

struct MetalDrawingGroupView_Previews: PreviewProvider {
  static var previews: some View {
    MetalDrawingGroupView()
  }
}
