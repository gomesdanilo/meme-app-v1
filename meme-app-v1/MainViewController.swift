//
//  MainViewController.swift
//  meme-app-v1
//
//  Created by Danilo Gomes on 04/09/2017.
//  Copyright © 2017 Danilo Gomes. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var exportButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var galleryButton: UIBarButtonItem!
    @IBOutlet weak var topTextfield: UITextField!
    @IBOutlet weak var bottomTextfield: UITextField!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var canvas: UIView!
    
    var mediaController = MediaController()
    var sharingController = SharingController()
    
    var model = Meme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyFontStyles()
        mediaController.delegate = self
        cameraButton.isEnabled = mediaController.canOpenCamera()
        galleryButton.isEnabled = mediaController.canOpenGallery()
        
        resetModel()
        updateScreenFromModel()
    }
    
    func applyFontStyles(){
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let memeTextAttributes:[String:Any] = [
            NSStrokeColorAttributeName: UIColor.black,
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName: -3,
            NSParagraphStyleAttributeName: paragraphStyle]
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
    }

    @IBAction func didTapOnCancel(_ sender: Any) {
        print("didTapOnCancel");
        resetModel()
        updateScreenFromModel()
    }
    
    @IBAction func didTapOnExport(_ sender: Any) {
        print("didTapOnExport");
        model.memeImage = generateMemedImage()
        
        if let img = model.memeImage {
            sharingController.shareImage(image: img, viewController: self)
        }
    }
    
    @IBAction func didTapOnCamera(_ sender: Any) {
        print("didTapOnCamera");
        mediaController.openCamera(viewController: self)
    }
    
    @IBAction func didTapOnGallery(_ sender: Any) {
        print("didTapOnGallery");
        mediaController.openGallery(viewController: self)
    }
    
    func resetModel() {
        model.originalImage = nil
        model.memeImage = nil
        model.topText = "TOP"
        model.bottomText = "BOTTOM"
    }
    
    func updateScreenFromModel(){
        imageView.image = model.originalImage
        topTextField.text = model.topText
        bottomTextField.text = model.bottomText
    }
    
    
    func generateMemedImage() -> UIImage {
        
        // Render view to an image, just canvas part. no toolbars.
        UIGraphicsBeginImageContext(self.canvas.frame.size)
        self.canvas.drawHierarchy(in: self.canvas.bounds, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return memedImage
    }
}


extension MainViewController : MediaControllerDelegate {
    
    func didReadPicture(picture: UIImage) {
        model.originalImage = picture
        model.memeImage = nil
        updateScreenFromModel()
    }

}
