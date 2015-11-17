//
//  ViewController.swift
//  MyHood
//
//  Created by Abdurrahman on 11/14/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // TableView Outlet Connection
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code goes here
        
        // DataSource And Delgate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        DataService.instance.loadPosts()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("onPostsLoaded:"), name: "postsLoaded", object: nil)
        
    }

    // TableView Required Functions
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }

    // Notification Function
    func onPostsLoaded(notif: AnyObject) {
        
        tableView.reloadData()
        
    }
    
    // Light status bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }



}

