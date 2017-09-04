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
    func shareImage(image : UIImage, viewController : UIViewController) {
        activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        viewController.present(activityViewController!, animated: true, completion: nil)
    }
}
