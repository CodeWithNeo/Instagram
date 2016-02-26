//
//  PhotoViewController.swift
//  Instagram
//
//  Created by Tarang khanna on 2/24/16.
//  Copyright © 2016 Tarang khanna. All rights reserved.
//

import UIKit
import Parse

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var photoData : [PFObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        retrieve()
    }
    
    func retrieve() {
        print("here")
        let query = PFQuery(className: "UserMedia")
        query.findObjectsInBackgroundWithBlock { (object:[PFObject]?, error:NSError?) -> Void in
            if nil != object && object?.count != 0{
                self.photoData.appendContentsOf(object!)
                print(object)
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoTableViewCell") as? PhotoTableViewCell
        let userMedia = self.photoData[indexPath.row]
        let media = userMedia.objectForKey("media") as! PFFile
        let updatedAt = userMedia.updatedAt
        cell!.insta_photo.image = UIImage(named: "icon")
        media.getDataInBackgroundWithBlock({ (data:NSData?, error:NSError?) -> Void in
            if data != nil {
                cell!.insta_photo.image = UIImage(data: data!)
            }
        })
        return cell!
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photoData.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
