
//
//  ViewController.swift
//  lightcalculator
//
//  Created by Priyanka Nahar on 2/5/16.
//  Copyright © 2016 priyankanahar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    @IBAction func uploadButton(sender: AnyObject) {
        if(myImageView.image == nil) {
           return
        }
    }
    
    @IBAction func selectPhotoButton(sender: AnyObject) {
        let myPickerController = UIImagePickerController();
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    @IBAction func takePhotoButton(sender: AnyObject) {
        if(!UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
            return
        }
        let myPickerController = UIImagePickerController();
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera;
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]){
            myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage;
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

