//
//  HTMLTextView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 12.09.2022.
// <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=YES\">
//

import WebKit
import SwiftUI

struct CodeView: UIViewRepresentable {

  //MARK: - Properties
  @Binding var dynamicHeight: CGFloat
  var htmlContentBody: String
  var webView: WKWebView = WKWebView()

  //MARK: - Coordinator
  class Coordinator: NSObject, WKNavigationDelegate {
    var parent: CodeView

    init(_ parent: CodeView) {
      self.parent = parent
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      webView.evaluateJavaScript("document.readyState", completionHandler: { (complete, error) in
        if complete != nil {
          webView.evaluateJavaScript("document.documentElement.getBoundingClientRect().height", completionHandler: { (height, error) in
            self.parent.dynamicHeight = height as! CGFloat
          })
        }
      })
    }
  }

  //MARK: - Methods
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  func makeUIView(context: Context) -> WKWebView {
    webView.navigationDelegate = context.coordinator
    webView.scrollView.bounces = false
    webView.isOpaque = false
    webView.backgroundColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1.0)
    let htmlContent = htmlHelper.htmlContentHead + htmlContentBody + htmlHelper.htmlContendTail
    webView.loadHTMLString(htmlContent, baseURL: Bundle.main.resourceURL)
    return webView
  }

  func updateUIView(_ uiView: WKWebView, context: Context) { }
}
