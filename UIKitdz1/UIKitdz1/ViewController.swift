//
//  ViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 21.09.2022.
//

import UIKit
/// firstVC главный экр
class ViewController: UIViewController {
    
    /// Привязываем наши mail и password.
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    let vc = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToSecond(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewControllerID")
                as? SecondViewController else { return }
        self.present(vc, animated: true)
    }
}
