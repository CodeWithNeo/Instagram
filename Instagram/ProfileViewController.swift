//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Tarang khanna on 2/24/16.
//  Copyright © 2016 Tarang khanna. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func logOutClicked(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock { (error:NSError?) -> Void in
            if error != nil {
                print("error logging out")
            } else {
                print("success logging out")
//                self.tabBarController?.dismissViewControllerAnimated(true, completion: nil)
                self.performSegueWithIdentifier("logout", sender: nil)
            }
        }

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
