//
//  UsersFeedTableViewController.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/10/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import UIKit

class UsersFeedTableViewController: UITableViewController {
    
    //TODO: Setup Xib
    
    var feedData: [String] = ["Run1", "Run 2", "Run3"]
    var data: FeedData!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: "UsersFeedTableViewCell", bundle: nil) //1
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        
        var cell:UsersFeedTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UsersFeedTableViewCell
        
        cell.distanceLabel.text = feedData[indexPath.row]
        cell.durationLabel.text = feedData[indexPath.row]
        cell.timeSinceLabel.text = feedData[indexPath.row]
        cell.dateOfRunLabel.text = feedData[indexPath.row]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
