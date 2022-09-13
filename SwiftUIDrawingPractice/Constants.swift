//
//  Constants.swift
//  SwiftUIDrawingPractice
//
//  Created by Николай Никитин on 13.09.2022.
//

import Foundation

enum htmlHelper {
  static let htmlContentHead: String = """
                                  <!DOCTYPE html>
                                  <html lang="en-GB">
                                  <head>
                                  <meta charset="utf-8">
                                  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
                                  <link rel="stylesheet" type="text/css" href="prism.css" />
                                  <script src="prism.js"></script>
                                  </head>
                                  <body>
                                  <pre><code class="language-swift">
                                  """
  static let htmlContendTail: String = """
                                  </code></pre>
                                  </body>
                                  </html>
                                  """
}

enum codeHelper {
  static let triangleCode = """
Path { path in
  path.move(to: CGPoint(x: 200, y: 100))
  path.addLine(to: CGPoint(x: 100, y: 300))
  path.addLine(to: CGPoint(x: 300, y: 300))
  path.addLine(to: CGPoint(x: 200, y: 100))
  path.closeSubpath()
}
.stroke(.blue, style: StrokeStyle(lineWidth: 12,
                                  lineCap: .round,
                                  lineJoin: .round))
"""
}
