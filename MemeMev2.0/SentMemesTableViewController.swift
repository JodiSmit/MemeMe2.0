//
//  SentMemesTableViewController.swift
//  MemeMev2.0
//
//  Created by Jodi Lovell on 2/1/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

class SentMemesTableViewController: UITableViewController{
    
    var memes: [SavedMeme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        tableView.reloadData()
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    //MARK: Bring saved meme detail to tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let meme = memes[indexPath.row] as SavedMeme!
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableCell") as! MemeTableCell
        cell.memeImage.image = meme?.memedImage
        cell.memeLabel.text = (meme?.savedTop)! + "..." + (meme?.savedBottom)!
        return cell
            
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}
