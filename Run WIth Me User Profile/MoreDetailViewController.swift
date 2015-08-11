//
//  MoreDetailViewController.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/10/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import UIKit

class MoreDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Recieving CurrentUsers Username being sent from segue
    var userName = String()
    var usersBio: UsersBio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = self.userName
        
        //Configuring tableViewCells
        moreDetailTableView.estimatedRowHeight = 36.0
        moreDetailTableView.rowHeight = UITableViewAutomaticDimension
        
        self.moreDetailTableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        self.moreDetailTableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        self.moreDetailTableView.tableFooterView = UIView(frame: CGRectZero)

    }
    
    //MARK: -TableView DataSource & Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UserDetailTableViewCell
        
        
        //configure the cell
        cell.backgroundColor = UIColor.clearColor()
        
        //Creating extra switches just incase we decide to add in more fields
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Total Number of Runs"
            cell.valueLabel.text = "\(usersBio.totalNumberOfRuns)"
        case 1:
            cell.fieldLabel.text = "Total Distance"
            cell.valueLabel.text = "\(usersBio.totalDistance)"
        case 3:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        case 4:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
    }

    //MARK: -Actions & Outlets
    @IBOutlet weak var moreDetailTableView: UITableView!
}
