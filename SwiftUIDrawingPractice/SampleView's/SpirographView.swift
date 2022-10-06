//
//  SpirographView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 04.10.2022.
//

import SwiftUI

enum RouletteType: String, CaseIterable, Identifiable {
  /// The classic Spirograph toy traces out hypotrochoid and epitrochoid curves ))
  case hypotrochoid
  case hypocycloid
  case epitrochoid
  var id: RouletteType { self }
}

struct Spirograph: Shape {

  var innerRadius: Int
  var outerRadius: Int
  var distance: Int
  var amount: Double
  var type: RouletteType

  /// Euclid's algorithm
  func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
      let temp = b
      b = a % b
      a = temp
    }
    return a
  }

  func path(in rect: CGRect) -> Path {
    let divisor = greatestCommonDivisor(innerRadius, outerRadius)
    let outerRadius = Double(self.outerRadius)
    let innerRadius = Double(self.innerRadius)
    let distance = Double(self.distance)

    let difference = innerRadius - outerRadius
    let joint = innerRadius + outerRadius

    let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount


    var path = Path()

    for theta in stride(from: 0, through: endPoint, by: 0.01) {

      var x = 0.0
      var y = 0.0

      switch type {
      case .hypotrochoid:
        /// Hypotrochoid equations
        x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
        y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
      case .hypocycloid:
        /// Hypocycloid equations
        x = difference * cos(theta) + outerRadius * cos(difference / outerRadius * theta)
        y = difference * sin(theta) - outerRadius * sin(difference / outerRadius * theta)
      case .epitrochoid:
        /// Epitrochoid equations
        x = joint * cos(theta) - distance * cos(joint / outerRadius * theta)
        y = joint * sin(theta) - distance * sin(joint / outerRadius * theta)
      }

      x += rect.width / 2
      y += rect.height / 2

      if theta == 0 {
        path.move(to: CGPoint(x: x, y: y))
      } else {
        path.addLine(to: CGPoint(x: x, y: y))
      }
    }
    return path
  }
}

struct SpirographView: View {

  //MARK: - View Properties
  @State private var innerRadius = 125.0
  @State private var outerRadius = 75.0
  @State private var distance = 25.0
  @State private var amount = 1.0
  @State private var hue = 0.6
  @State private var selectedType = RouletteType.hypocycloid

  //MARK: - View Body
  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor)
        .ignoresSafeArea()
      VStack(spacing: 0) {
        Spacer()
        Spirograph(innerRadius: Int(innerRadius),
                   outerRadius: Int(outerRadius),
                   distance: Int(distance),
                   amount: amount,
                   type: selectedType)
          .stroke(Color(hue: hue,
                        saturation: 1,
                        brightness: 1), lineWidth: 1)
          .frame(width: 300, height: 300)

        Picker("Select roulette type", selection: $selectedType) {
          ForEach(RouletteType.allCases) { type in
            Text(type.rawValue.capitalized)
          }
        }
        .pickerStyle(.segmented)
        .padding()

        Group {

          Text("Inner Radius: \(Int(innerRadius))")
          Slider(value: $innerRadius, in: 10...150, step: 1)
            .padding([.horizontal, .bottom])

          Text("Outer Radius: \(Int(outerRadius))")
          Slider(value: $outerRadius, in: 10...150, step: 1)
            .padding([.horizontal, .bottom])

          if selectedType != .hypocycloid {
            Text("Distance: \(Int(distance))")
            Slider(value: $distance, in: 1...150, step: 1)
              .padding([.horizontal, .bottom])
          }

          Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
          Slider(value: $amount)
            .padding([.horizontal, .bottom])

          Text("Color")
          Slider(value: $hue)
            .padding(.horizontal)
        }
      }
    }
  }
}

struct SpirographView_Previews: PreviewProvider {
  static var previews: some View {
    SpirographView()
  }
}
