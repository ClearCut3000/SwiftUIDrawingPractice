//
//  ChackerboardView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 04.10.2022.
//

import SwiftUI

struct Checkerboard: Shape {

  var rows: Int
  var columns: Int

  var animatableData: AnimatablePair<Double, Double> {
    get {
      AnimatablePair(Double(rows), Double(columns))
    }
    set {
      rows = Int(newValue.first)
      columns = Int(newValue.second)
    }
  }

  func path(in rect: CGRect) -> Path {
    var path = Path()

    let rowSize = rect.height / Double(rows)
    let columnSize = rect.width / Double(columns)

    for row in 0..<rows {
      for column in 0..<columns {
        if (row + column).isMultiple(of: 2) {
          let startX = columnSize * Double(column)
          let startY = rowSize * Double(row)

          let rect = CGRect(x: startX,
                            y: startY,
                            width: columnSize,
                            height: rowSize)
          path.addRect(rect)
        }
      }
    }
    return path
  }
}

struct CheckerboardView: View {

  //MARK: - View Properties
  @State private var rows = 4
  @State private var columns = 4
  @State private var isReducing = false
  @State private var show = false

  //MARK: - View Body
  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor)
        .ignoresSafeArea()
      VStack {
        Checkerboard(rows: rows, columns: columns)
          .onTapGesture {
            withAnimation(.linear(duration: 3)) {
              if rows > 100 || columns > 100 { isReducing = true }
              if isReducing {
                rows /= 2
                columns /= 2
                if rows < 4 || columns < 4 {
                  isReducing = false
                }
              } else {
                rows *= 2
                columns *= 2
              }
            }
          }
          .frame(width: 300, height: 300)
          .background(.white)
          .padding()
        Button {
          show.toggle()
        } label: {
          Link(title: "Show Code")
            .padding()
        }
      }
      PopupCodeSample(show: $show, message: CodeLibrary.checkerboardView)
    }
  }
}

struct ChackerboardView_Previews: PreviewProvider {
  static var previews: some View {
    CheckerboardView()
  }
}
