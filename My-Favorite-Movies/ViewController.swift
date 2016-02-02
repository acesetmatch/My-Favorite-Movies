//
//  ViewController.swift
//  My-Favorite-Movies
//
//  Created by Shawn on 1/10/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movies]()
    
    var indexPathsForSelectedRows: NSIndexPath!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context  = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movies]
        } catch let err as NSError {
            print(err.debugDescription)
            
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
        
            let movie = movies[indexPath.row]
            let row = indexPath.row
            cell.configureCell(movie)
            
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let row = indexPath.row
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    let indexPath = NSIndexPath()
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MoreInfo" {
            if let cellIndex = self.tableView.indexPathForSelectedRow{
                if let DetailVC = segue.destinationViewController as? DetailVCViewController {
                    if let selectedCell = tableView.cellForRowAtIndexPath(cellIndex) as? MovieCell {
                        
                            let movie = movies[cellIndex.row]
                            DetailVC.transferDesc = movie.desc!
                            DetailVC.transferTitle = movie.title!
                            DetailVC.transferURL = movie.link!
                            DetailVC.transferPlot = movie.plot!
                            DetailVC.transferImg = movie.getMovieImg()
                    }
                }
        
            }
        }

    }
}
    
