//
//  SettingsController.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/7/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import UIKit

// Final signifies there will be no subclasses of SettingsViewController (optimization)
final class SettingsViewController: UITableViewController {
    var urlString: String = ""
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let path = (indexPath.section, indexPath.row)
        switch path {
        case(0, 0):
            self.urlString = "http://twitter.com"
        case(0, 1):
            self.urlString = "http://facebook.com"
        case(1, 0):
            self.urlString = "http://google.com"
        case(1, 1):
            self.urlString = "http://apple.com"
        default:
            return
        }
        
        
        self.performSegueWithIdentifier("showWebView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWebView" {
            let webViewController = segue.destinationViewController as WebViewController
            webViewController.urlString = self.urlString
        }
    }
}
