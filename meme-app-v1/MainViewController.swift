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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapOnCancel(_ sender: Any) {
        print("didTapOnCancel");
        resetScreen()
    }
    
    @IBAction func didTapOnExport(_ sender: Any) {
        print("didTapOnExport");
    }
    
    @IBAction func didTapOnCamera(_ sender: Any) {
        print("didTapOnCamera");
//        cameraButton.isEnabled
    }
    
    @IBAction func didTapOnGallery(_ sender: Any) {
        print("didTapOnGallery");
    }
    
    
    
    func resetScreen() {
        imageView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
    }
    
    
    
}
