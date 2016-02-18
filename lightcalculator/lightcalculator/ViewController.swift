
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
    
    @IBOutlet weak var hiddenLabel: UILabel!
    
    var grayScaleImage: UIImage = UIImage();
    
    @IBAction func uploadButton(sender: AnyObject) {
        if(myImageView.image == nil) {
            hiddenLabel.text = "No Picture Found"
        }
        myImageView.image = grayScaleImage;
    }
    
    @IBAction func selectPhotoButton(sender: AnyObject) {
        hiddenLabel.text = "";
        let myPickerController = UIImagePickerController();
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    @IBAction func takePhotoButton(sender: AnyObject) {
        if(!UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
            hiddenLabel.text = "No Camera Detected";
            return
        }
        hiddenLabel.text = "";
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
            grayScaleImage = convertToGrayScale((info[UIImagePickerControllerOriginalImage] as? UIImage)!);
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func convertToGrayScale(image: UIImage) -> UIImage {
        let imageRect:CGRect = CGRectMake(0, 0, image.size.width, image.size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = image.size.width
        let height = image.size.height
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.None.rawValue)
        let context = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, colorSpace, bitmapInfo.rawValue)
        
        CGContextDrawImage(context, imageRect, image.CGImage)
        let imageRef = CGBitmapContextCreateImage(context)
        let newImage = UIImage(CGImage: imageRef!)
        
        return newImage
    }
    
}

