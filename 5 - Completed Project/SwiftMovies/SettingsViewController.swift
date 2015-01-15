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
    // Private properties are only available to the instance of the object (can't be called from another object)
    // Its good practice for things you know will only be used internally
    private let webViewSegue = "showWebView"
    private var webViewProperties: (title: String?, urlString: String?)
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let path = (indexPath.section, indexPath.row)
        
        // We can use tuples and a switch to cover our row actions without a big if/else mess
        // We are also using a tuple to capture the title and url in one variable
        switch path {
        case (0, 0):
            self.webViewProperties = ("@themoviedb", "http://twitter.com/themoviedb")
        case (0, 1):
            self.webViewProperties = ("The Movie DB", "http://facebook.com/themoviedb")
        case (1, 0):
            self.webViewProperties = ("Terms of Service", "http://themoviedb.org/documentation/website/terms-of-use")
        case (1, 1):
            self.webViewProperties = ("Privacy Policy", "http://themoviedb.org/privacy-policy")
        default:
            // This should never happen, but lets get in the mindset of handling issues gracefully
            // Swift will actually give an error if we don't have this default case (must be exhaustive)
            // We can demonstrate this by commenting out one of our cell handlers then tapping that cell
            let alertTitle = "Sorry!"
            let alertMessage = "An unknown error occurred."
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            self.tableView.deselectRowAtIndexPath(indexPath, animated: false) // Deselect the cell so it does not "stick"
            
            // Return so we don't perform the segue
            return
        }
        
        // Since all the various rows are going to the same view controller, we can trigger the
        // segue manually instead of having to create 4 segues pointing to the same controller
        self.performSegueWithIdentifier(webViewSegue, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == webViewSegue {
            let webViewController = segue.destinationViewController as WebViewController
            webViewController.titleString = self.webViewProperties.title
            webViewController.urlString = self.webViewProperties.urlString
        }
    }
}
