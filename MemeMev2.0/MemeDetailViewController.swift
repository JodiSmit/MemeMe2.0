//
//  MemeDetailViewController.swift
//  MemeMev2.0
//
//  Created by Jodi Lovell on 2/6/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memeView: UIImageView!
    
    var meme: SavedMeme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memeView.image = meme.memedImage
        
    }
    
}
