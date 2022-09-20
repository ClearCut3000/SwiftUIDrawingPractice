//
//  EffectsView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 20.09.2022.
//

import SwiftUI

struct EffectsView: View {

  @State private var amount = 0.0
  @State private var show = false

  var body: some View {
    ZStack {
      VStack {
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

        Slider(value: $amount)
          .padding()

        Image("Example")
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 200)
          .saturation(amount)
          .blur(radius: (1-amount) * 20)

        Button {
          show.toggle()
        } label: {
          Link(title: "Show Code")
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color(UIHelper.backgroundDarkColor))
      .ignoresSafeArea()
      PopupCodeSample(show: $show, message: CodeLibrary.effectsView)
    }
  }
}

struct EffectsView_Previews: PreviewProvider {
  static var previews: some View {
    EffectsView()
  }
}
