//
//  TrapezoidView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 04.10.2022.
//

import SwiftUI

struct Trapezoid: Shape {
  var animatableData: Double {
    get { insetAmount }
    set {insetAmount = newValue }
  }

  var insetAmount: Double

  func path(in rect: CGRect) -> Path {
    var path = Path()

    path.move(to: CGPoint(x: 0, y: rect.maxY))
    path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: 0, y: rect.maxY))
    return path
  }
}

struct TrapezoidView: View {

  //MARK: - View Properties
  @State private var insetAmount = 50.0

  //MARK: - View Body
  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor)
        .ignoresSafeArea()
      VStack {
        Trapezoid(insetAmount: insetAmount)
          .frame(width: 250, height: 150)
          .onTapGesture {
            withAnimation {
              insetAmount = Double.random(in: 10...90)
            }
          }
          .padding()
        Spacer()
        SampleCodeView(htmlContentBody: CodeLibrary.trapeziodView)
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.orange, lineWidth: 3)
          )
          .padding()
          .frame(maxHeight: 400)
        Spacer()
      }
    }
  }
}

struct TrapezoidView_Previews: PreviewProvider {
  static var previews: some View {
    TrapezoidView()
  }
}
