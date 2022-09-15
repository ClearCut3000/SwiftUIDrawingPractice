//
//  CodeSampleView.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 15.09.2022.
//

import SwiftUI
import WebKit

struct SampleCodeView: UIViewRepresentable {
  
  var htmlContentBody: String

  func makeUIView(context: Context) -> some UIView {
    let webView = WKWebView()
    webView.scrollView.bounces = false
    webView.isOpaque = false
    webView.backgroundColor = UIHelper.backgroundDarkColor
    let htmlContent = HTMLHelper.htmlContentHead + htmlContentBody.trimmingCharacters(in: .newlines) + HTMLHelper.htmlContendTail
    webView.loadHTMLString(htmlContent, baseURL: Bundle.main.resourceURL)
    return webView
  }

  func updateUIView(_ uiView: UIViewType, context: Context) { }
}
