//
//  ImagePaintView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 20.09.2022.
//

import SwiftUI

struct ImagePaintView: View {

  @State private var imageWidth = 0.5
  @State private var imageHeight = 0.5
  @State private var overlayXValue = 0.5
  @State private var overlayYValue = 0.5
  @State private var isShowingCode = false

  var body: some View {
    ZStack {
      Color(UIHelper.backgroundDarkColor).ignoresSafeArea()
      VStack {
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

        VStack {
          Text("Image overlay")
            .padding(.top, 10)
          HStack {
            Text("X")
            Slider(value: $overlayXValue, in: 0...1)
            Text("Y")
            Slider(value: $overlayYValue, in: 0...1)
          }
          .padding()

          Text("Image Frame")
          HStack {
            Text("W")
            Slider(value: $imageWidth, in: 0...1.0)
            Text("H")
            Slider(value: $imageHeight, in: 0...1.0)
          }
          .padding()

          Button {
            isShowingCode.toggle()
          } label: {
            Link(title: "Show Code")
          }
        }
      }
      PopupCodeSample(show: $isShowingCode, message: CodeLibrary.imagePaintSample)
    }
  }
}

struct ImagePaintView_Previews: PreviewProvider {
  static var previews: some View {
    ImagePaintView()
  }
}
