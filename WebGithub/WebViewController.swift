//
//  WebViewController.swift
//  WebGithub
//
//  Created by Kisacka on 16/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    var passedValue = ""
    
    override func loadView() {
       // self.title = "WebView" // this doesn't appear, so Arcady deleted it
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: passedValue)
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true

        // Do any additional setup after loading the view.
    }
    



}
