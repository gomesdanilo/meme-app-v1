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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapOnCancel(_ sender: Any) {
        print("didTapOnCancel");
    }
    
    @IBAction func didTapOnExport(_ sender: Any) {
        print("didTapOnExport");
    }
    
    @IBAction func didTapOnCamera(_ sender: Any) {
        print("didTapOnCamera");
    }
    
    @IBAction func didTapOnGallery(_ sender: Any) {
        print("didTapOnGallery");
    }
    
    
    
    
}
