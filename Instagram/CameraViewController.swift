//
//  CameraViewController.swift
//  Instagram
//
//  Created by Tarang khanna on 2/23/16.
//  Copyright © 2016 Tarang khanna. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var toUploadImage: UIImageView!
    
    @IBOutlet weak var captionTextField: UITextField!
    
    @IBAction func clickAction(sender: AnyObject) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil ||  UIImagePickerController.availableCaptureModesForCameraDevice(.Front) != nil { // if has camera
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = UIImagePickerControllerSourceType.Camera
            
            self.presentViewController(vc, animated: true, completion: nil)
        } else {
            let alertVC = UIAlertController(
                title: "No Camera",
                message: "Sorry, this device has no camera",
                preferredStyle: .Alert)
            let okAction = UIAlertAction(
                title: "OK",
                style:.Default,
                handler: nil)
            alertVC.addAction(okAction)
            presentViewController(alertVC,
                animated: true,
                completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            
            
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            toUploadImage.image = editedImage
            dismissViewControllerAnimated(true, completion: nil)
            
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitClicked(sender: AnyObject) {
        print("here")
        
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
