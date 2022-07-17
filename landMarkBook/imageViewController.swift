//
//  imageViewController.swift
//  landMarkBook
//
//  Created by MacBookAir on 17.07.2022.
//

import UIKit

class imageViewController: UIViewController {
    
    var transferLandmarkImage = UIImage()
    var transferLandmarkName = ""
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = transferLandmarkImage
        landmarkLabel.text = transferLandmarkName
        
        
    }
    

    
}
