//
//  TermsAndConditionInSwiftUIWebView.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 23/04/2023.
//

import Foundation
import SwiftUI
import WebKit

struct TermsAndConditionInSwiftUIWebView: UIViewRepresentable {
    
    let urlString = "https://www.apple.com/legal/internet-services/itunes/"
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webview: WKWebView, context: Context) {
        guard let url = URL(string: urlString)else {return}
        let urlRequest = URLRequest(url: url)
        webview.load(urlRequest)
    }
}
