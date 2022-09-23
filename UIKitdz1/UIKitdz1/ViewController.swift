//
//  ViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 21.09.2022.
//

import UIKit
/// firstVC
class ViewController: UIViewController {
    private let resLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 180, y: 300, width: 60, height: 20))
        label.text = "result"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.resLabel)
    }
    /// 2Games
    @IBAction func start(_ sender: Any) {
        self.startAction(title: "Start", message: "", style: .alert)
    }
    
    func startAction(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { textfield in
            textfield.placeholder = "Введите слово"
    }
        let enter = UIAlertAction(title: "Ввести", style: .default) { [weak self] _ in
            self?.resLabel.text = "\(Model.model.convertToHello(alert.textFields?.first?.text ?? ""))"
        }
        alert.addAction(enter)
        present(alert, animated: true, completion: nil)
    }
    
}
/// View Controller
struct Model {
    public static let model = Model()
    
    func convertToHello(_ word: String) -> String {
        if word == "leohl" {
            return "Hello"
    } else {
        return "Неизвестное слово"
    }
    
  }

}
