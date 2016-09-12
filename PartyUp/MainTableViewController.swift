//
//  MainTableViewController.swift
//  HParty
//
//  Created by WuGuihua on 5/5/16.
//  Copyright © 2016 HackaParty. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func closeAccountPage(segue: UIStoryboardSegue)
    {
        print("==============")
        print("unwind succeed")
        print("==============")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBarButton.target = self.revealViewController()
        menuBarButton.action = "revealToggle:"
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //searchBar.delegate = self
        
        
    }

    // MARK: - Table view data source

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        /*
         print(cell.contentView.subviews.count)
         print(cell.contentView.bounds.size.height)
         
         cell.contentView.sizeThatFits(CGSizeMake(cell.contentView.bounds.size.width, cell.contentView.bounds.size.height*5))
         print(cell.contentView.bounds.size)
         
         */
        
        /*
         
         let imageName = String(indexPath.row) + ".jpg"
         print(imageName)
         let image = UIImage(named: imageName)
         let imageView = UIImageView(image: image)
         //cell.contentView.addSubview(imageView)
         
         cell.backgroundView = imageView
         */
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
