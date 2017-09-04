//
//  MediaController.swift
//  meme-app-v1
//
//  Created by Danilo Gomes on 04/09/2017.
//  Copyright © 2017 Danilo Gomes. All rights reserved.
//

import UIKit

protocol MediaControllerDelegate {
    func didReadPicture(picture : UIImage)
}

class MediaController: NSObject {
    var delegate : MediaControllerDelegate?
    var imagePicker : UIImagePickerController?
    
    func canOpenCamera() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func canOpenGallery() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
    }
    
    func openCamera(viewController: UIViewController){
        imagePicker = UIImagePickerController()
        if let picker = imagePicker {
            picker.sourceType = .camera
            picker.delegate = self
            viewController.present(picker, animated: true, completion: nil)
        }
    }
    
    func openGallery(viewController: UIViewController){
        
        switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                openGalleryForIPhone(viewController: viewController)
            case .pad:
                openGalleryForIPad(viewController: viewController)
            default:
                // Ops
                break
        }
    }
    
    func openGalleryForIPad(viewController: UIViewController){
        // TODO: Implement this.
    }
    
    func openGalleryForIPhone(viewController: UIViewController){
        imagePicker = UIImagePickerController()
        if let picker = imagePicker {
            picker.sourceType = .photoLibrary
            picker.delegate = self
            viewController.present(picker, animated: true, completion: nil)
        }
    }
    
    
}

extension MediaController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if let del = self.delegate, let img = image {
            del.didReadPicture(picture: img)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }

}