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
    @IBOutlet var tableView: UITableView!
    var delegate: FilterViewDelegate?
    
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismiss()
    }
    
    func dismiss() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TMDB.MovieList.allLists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("filterCell") as UITableViewCell
        let movieList: TMDB.MovieList = TMDB.MovieList.allLists[indexPath.row]
        
        cell.textLabel?.text = movieList.listName
        
        if movieList == delegate?.activeList {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false) // Fix sticky cells
        let movieList: TMDB.MovieList = TMDB.MovieList.allLists[indexPath.row]
        self.delegate?.filterDidChange(movieList)
        self.dismiss()
    }
}

protocol FilterViewDelegate {
    var activeList: TMDB.MovieList { get }
    func filterDidChange(list: TMDB.MovieList)
}