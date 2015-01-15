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
    
    var urlString: String?
    var titleString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
        
        // Since our titleString and urlString are optionals we have to unwrap them
        if let title = titleString {
            self.navigationItem.title = titleString
        }
        
        if let urlString = self.urlString {
            // The NSURL init method returns an optional as well
            // Its common for Cocoa methods to return optionals (because of Obj-C)
            if let url = NSURL(string: urlString) {
                let request = NSURLRequest(URL: url)
                webView.loadRequest(request)
            }
        }
    }
}

// Class extensions make it easy to group functionality, like protocol methods
extension WebViewController: UIWebViewDelegate {
    // These methods are called automatically when we set the delegate
    // and adopt the protocol
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicator.stopAnimating()
    }
}
