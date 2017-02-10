//
//  SentMemesCollectionViewController.swift
//  MemeMev2.0
//
//  Created by Jodi Lovell on 2/7/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [SavedMeme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    //MARK: Bring saved meme detail to Collection View
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let meme = memes[(indexPath).item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionCell", for: indexPath) as! MemeCollectionCell
        
        cell.memeImage.image = meme.memedImage
        
        return cell
        
    }
    
    //MARK: Dismiss ViewController
    func dismissMemeEditViewController() {
        dismiss(animated: true) {
            self.collectionView?.reloadData()
        }
    }
    
    //MARK: Segue to Meme Detail VC
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        collectionView?.reloadData()
        
    }
        
    //MARK: Configure layout of collection view. UPDATE LATER IF NECESSARY!!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
    }
}
