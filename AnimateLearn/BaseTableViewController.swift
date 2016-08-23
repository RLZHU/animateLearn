//
//  BaseTableViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/4/28.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var animateTypes  = ["basicAnimations", "keyframeAnimations", "groupAnimations", "transitionAnimations", "practise", "writingAnimation", "facebook shimmer", "dribbleAnimation"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.registerClass(object_getClass(UITableViewCell()), forCellReuseIdentifier: "UITableViewCell");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animateTypes.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")

        cell?.textLabel?.text = animateTypes[indexPath.row]
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.presentViewController(BasicAnimationViewController(), animated: true, completion: nil)
        case 1:
            self.presentViewController(KeyFrameAnimationViewController(), animated: true, completion: nil)
        case 2:
            self.presentViewController(GroupAnimationViewController(), animated: true, completion: nil)
        case 3:
            self.presentViewController(TransitionViewController(), animated: true, completion: nil)
        case 4:
            self.presentViewController(DivergentViewController(), animated: true, completion: nil)
        case 5:
            self.presentViewController(WritingAnimViewController(), animated: true, completion: nil)
        case 6:
            self.presentViewController(ShimmerViewController(), animated: true, completion: nil)
        case 7:
            self.presentViewController(DribbleViewController(), animated: true, completion: nil)
        default:
            return;
        }
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
