//
//  ViewController.swift
//  landMarkBook
//
//  Created by MacBookAir on 17.07.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var landmarkImage = [UIImage]()
    var landmarkName = [String]()
    var selectedLandmarkImage = UIImage()
    var selectedLandmarkName = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // ---- * DATA * ----
        
        landmarkName.append("Istanbul")
        landmarkName.append("London")
        landmarkName.append("Los Angles")
        landmarkName.append("San Francisco")
        landmarkName.append("Stockholm")
        
        landmarkImage.append(UIImage(named: "istanbul.jpeg")!)
        landmarkImage.append(UIImage(named: "london.jpeg")!)
        landmarkImage.append(UIImage(named: "losAngles.jpeg")!)
        landmarkImage.append(UIImage(named: "sanFrancisco.jpeg")!)
        landmarkImage.append(UIImage(named: "stockholm.jpeg")!)

        navigationItem.title = "Landmark Book"
        
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkName.remove(at: indexPath.row)
            landmarkImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkName[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLandmarkImage = landmarkImage[indexPath.row]
        selectedLandmarkName = landmarkName[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.transferLandmarkImage = selectedLandmarkImage
            destinationVC.transferLandmarkName = selectedLandmarkName
        }
    }
    
    

}

