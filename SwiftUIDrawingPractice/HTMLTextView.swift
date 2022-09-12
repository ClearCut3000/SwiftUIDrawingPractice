//
//  HTMLTextView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 12.09.2022.
//

import WebKit
import SwiftUI

struct HTMLTextView: UIViewRepresentable {

  let htmlContent: String = """
<code class="language-swift"> let str = "Andrew, Ben, John, Paul, Peter, Laura" let array = str.components(separatedBy: ", ") </code>
"""

  func makeUIView(context: Context) -> WKWebView {
         return WKWebView()
     }

  func updateUIView(_ uiView: WKWebView, context: Context) {
          uiView.loadHTMLString(htmlContent, baseURL: nil)
      }
}

struct HTMLTextView_Previews: PreviewProvider {
    static var previews: some View {
        HTMLTextView()
    }
}
