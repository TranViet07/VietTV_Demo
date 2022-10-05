//
//  ViewController.swift
//  Demo
//
//  Created by TRANVIET on 04/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let reuseIdentifier = "cell"
    
    let itemImage = ["facebook", "instagram", "youtube", "shopee", "bank", "bookmark", "interrogation", "more"]
    let itemLabel = ["Facebook", "Instagram", "Youtube", "Shopee", "Bank", "Bookmark", "Interrogation", "More"]
    
    var navigateApp: String = ""


    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var feedLabel: UILabel!
    
    
    @IBOutlet weak var feedTableView: UITableView!
    
    let timer = ["morning", "afternoon", "night"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuCollectionView.backgroundColor = .none
        
        menuLabel.text = "Good \(timer[1])!"
        feedTableView.estimatedRowHeight = 229
        feedTableView.rowHeight = UITableView.automaticDimension
        
    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    // CollectionView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return itemImage.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MenuCollectionViewCell
        cell.itemImage.image = UIImage(named: itemImage[indexPath.row])
        cell.itemLabel.text = itemLabel[indexPath.row]
        
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        navigateApp = itemLabel[indexPath.row]
        
        UIApplication.shared.open(URL(string: "http://\(navigateApp).com/")!)
        
        
    }
    
    
        
    // TableView
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedCard.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! FeedTableViewCell
        cell.feedImage.image = UIImage(named: feedCard[indexPath.row].feedName)
        cell.feedLabel?.text = feedCard[indexPath.row].feedLabel
        
        return cell
    }
    
    

}




