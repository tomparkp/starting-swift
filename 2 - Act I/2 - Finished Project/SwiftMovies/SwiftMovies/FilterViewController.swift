//
//  FiltersViewController.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/8/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import UIKit

// Final signifies there will be no subclasses of SettingsViewController (optimization)
final class FilterViewController: UIViewController {
    @IBAction func cancel(sender: AnyObject) {
        self.dismiss()
    }
    
    func dismiss() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}