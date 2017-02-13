//
//  MemeDetailViewController.swift
//  MemeMev2.0
//
//  Created by Jodi Lovell on 2/6/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController, UIApplicationDelegate {
    
    @IBOutlet weak var memeView: UIImageView!
    
    var meme: SavedMeme!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadInputViews()
        self.memeView!.image = meme.memedImage
        self.memeView!.contentMode = .scaleAspectFit
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
