//
//  PopupCodeSample.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 15.09.2022.
//

import SwiftUI

struct PopupCodeSample: View {

  @Binding var show: Bool
  var message: String

    var body: some View {
      ZStack {
        if show {
          Color(UIHelper.backgroundDarkColor).opacity(show ? 0.6 : 0).edgesIgnoringSafeArea(.all)
          VStack {
            SampleCodeView(htmlContentBody: message)
            Button {
              withAnimation(.linear(duration: 0.3)) {
                show.toggle()
              }
            } label: {
              Link(title: "Hide")
                .frame(height: 50)
            }
          }
          .padding()
          .frame(maxWidth: 300, maxHeight: 300)
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.orange, lineWidth: 3)
          )
          .background(Color(UIHelper.backgroundDarkColor))
        }
      }
    }
}

struct PopupCodeSample_Previews: PreviewProvider {
    static var previews: some View {
      PopupCodeSample(show: .constant(true), message: CodeLibrary.flowerShape)
    }
}
