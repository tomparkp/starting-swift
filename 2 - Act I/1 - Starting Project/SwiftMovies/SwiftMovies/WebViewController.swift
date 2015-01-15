//
//  WebViewController.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/8/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import UIKit

// Final signifies there will be no subclasses of WebViewController (optimization)
final class WebViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    
    var urlString = "http://twitter.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
        
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            self.webView.loadRequest(request)
        }
    }
}

extension WebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicator.stopAnimating()
    }
}
