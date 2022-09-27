//
//  SecondViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 26.09.2022.
//

import UIKit
/// secondviewcontroller
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gk(_ sender: Any) {
        let goToCheck = UIAlertController(title: "Далее?", message: nil, preferredStyle: .actionSheet)
        
        goToCheck.addAction(UIAlertAction(title: "Выйти?", style: .default))
        goToCheck.addAction(UIAlertAction(title: "Чек", style: .default) { _ in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "CheckViewControllerID")
                    as? CheckViewController else { return }
            self.present(vc, animated: true)
                     
    })
        self.present(goToCheck, animated: true)
    }
}
