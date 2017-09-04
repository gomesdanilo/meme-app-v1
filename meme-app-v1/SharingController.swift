//
//  SharingController.swift
//  meme-app-v1
//
//  Created by Danilo Gomes on 04/09/2017.
//  Copyright © 2017 Danilo Gomes. All rights reserved.
//

import UIKit

class SharingController: NSObject {
    var activityViewController : UIActivityViewController?
    func shareImage(image : UIImage, viewController : UIViewController, button : UIBarButtonItem) {
        
        switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                shareImageIphone(image : image, viewController:viewController, button:button)
            case .pad:
                shareImageIpad(image : image, viewController:viewController, button:button)
            default:
                // Ops
                break
        }
    }
    func shareImageIphone(image : UIImage, viewController : UIViewController, button : UIBarButtonItem) {
        activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        viewController.present(activityViewController!, animated: true, completion: nil)
    }
    
    func shareImageIpad(image : UIImage, viewController : UIViewController, button : UIBarButtonItem) {
        activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityViewController!.modalPresentationStyle = .popover
        
        viewController.present(activityViewController!, animated: true, completion: nil)
        
        activityViewController!.popoverPresentationController?.permittedArrowDirections = .any
        activityViewController!.popoverPresentationController?.barButtonItem = button
    }
}
