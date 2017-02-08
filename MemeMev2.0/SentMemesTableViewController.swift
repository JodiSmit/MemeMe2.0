//
//  SentMemesTableViewController.swift
//  MemeMev2.0
//
//  Created by Jodi Lovell on 2/1/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

class SentMemesTableViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var memeTableView: UITableView!
    
    var memes: [SavedMeme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        memeTableView.reloadData()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    //MARK: Bring saved meme detail to tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let meme = memes[indexPath.row]
        let cell = memeTableView.dequeueReusableCell(withIdentifier: "MemeTableCell") as! MemeTableCell
            
        cell.memeLabel.text = "\(meme.savedTop) ... \(meme.savedBottom)"
        cell.memeImage.image = meme.memedImage
        
        return cell
            
    }
    
    //MARK: Dismiss VC
    func dismissMemeEditViewController() {
        dismiss(animated: true) {
            self.memeTableView.reloadData()
        }
    }
    
    /*//MARK: Segue
    let SegueToMemeEdit = "segueToMemeEdit"
    let SegueToMemeDetail = "segueToMemeDetail"
    
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == SegueToMemeEdit {
            if let destination = segue.destination as? UINavigationController, let MemeEditorViewController = destination.topViewController as? MemeEditorViewController {
                MemeEditorViewController.delegate = self
            }
        } else if segue.identifier == SegueToMemeDetail {
            if let destination = segue.destination as? MemeDetailViewController, let indexPath = memeTableView.indexPathForSelectedRow {
                let selectedCell = memes[indexPath.row]
                destination.meme = selectedCell
            }
        }
    }*/
}
