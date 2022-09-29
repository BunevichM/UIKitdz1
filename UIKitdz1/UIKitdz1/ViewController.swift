//
//  ViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 21.09.2022.
//

import UIKit
/// Первый экран с треками
class ViewController: UIViewController {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func firstTrackAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let firstTrackView = storyboard.instantiateViewController(withIdentifier:
                                                                        "NewTrackViewControllerID") as?
            NewTrackViewController {
            firstTrackView.nameTrackLabel.text = firstLabel.text
            show(firstTrackView, sender: nil)
        }
    }
    
    @IBAction func secondTrackView(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondTrackView = storyboard.instantiateViewController(withIdentifier:
                                                                        "SecondTrackViewControllerID") as?
            SecondTrackViewController {
            
            secondTrackView.nameTrackLabel.text = secondLabel.text
            show(secondTrackView, sender: nil)
        }
    }
    
    private func createImage() {
        
        title = "Playlist"
        
        firstImage.layer.cornerRadius = 10
        secondImage.layer.cornerRadius = 10
    }
}
