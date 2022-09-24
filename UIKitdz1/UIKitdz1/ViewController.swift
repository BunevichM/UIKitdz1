//
//  ViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 21.09.2022.
//

import UIKit
/// firstVC
class ViewController: UIViewController {
    
    let sumLable = UILabel()
    let welLable = UILabel()
    let guessLable = UILabel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        welcomeAlert()
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Цвет нашей вью
        view.backgroundColor = UIColor.blue
        
        /// Наш приветствующий лейбл
        welLable.text = "Hi, "
        welLable.frame = CGRect.init(x: 0, y: 100, width: 140, height: 60)
        welLable.center.x = self.view.center.x
        view.addSubview(welLable)
        
        /// Наш лейбл с суммой
        view.addSubview(sumLable)
        sumLable.backgroundColor = .darkGray
        sumLable.textAlignment = NSTextAlignment.center
        sumLable.frame = CGRect.init(x: 40, y: 380, width: 140, height: 60)
        sumLable.text = ""
        
        /// Кнопка сумма
        let sumButton = UIButton()
        view.addSubview(sumButton)
        sumButton.backgroundColor = .red
        sumButton.setTitle("Multiply", for: .normal)
        sumButton.frame = CGRect(x: 40, y: 300, width: 140, height: 60)
        sumButton.addTarget(self, action: #selector(sumAlert), for: .touchUpInside)
        
        /// Кнопка guess
        view.addSubview(guessLable)
        guessLable.textAlignment = NSTextAlignment.center
        guessLable.backgroundColor = .white
        guessLable.frame = CGRect.init(x: 220, y: 380, width: 140, height: 60)
        guessLable.text = ""
        
        /// button guess
        let guessButton = UIButton()
        view.addSubview(guessButton)
        guessButton.frame = CGRect(x: 220, y: 300, width: 140, height: 60)
        guessButton.setTitle("Guess", for: .normal)
        guessButton.backgroundColor = .yellow
        guessButton.addTarget(self, action: #selector(guessAlert), for: .touchUpInside)
        
    }

// Alert welcome
    func welcomeAlert() {
        let welcomeAlert = UIAlertController(title: "Hello", message: "Введите свое имя", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okay", style: .default) { _ in
            let textName = welcomeAlert.textFields?.first?.text ?? "nil"
            self.welLable.text = "Hi, \(textName)"
        }
        
        welcomeAlert.addTextField()
        welcomeAlert.addAction(alertAction)
        present(welcomeAlert, animated: true)
        
    }
    
    /// Alert sum
    @objc  func sumAlert(sender: UIButton) {
            let sumAlert = UIAlertController(title: "Внимание", message: "Введите число", preferredStyle: .alert)
            
           let actionButton = UIAlertAction(title: "Посчитай", style: .default) { _ in
               let firstField = sumAlert.textFields?.first?.text ?? "nil"
               let secondField = sumAlert.textFields?.last?.text ?? "nil"
                
               let firstFieldInt = Int(firstField) ?? 0
               let secondFieldInt = Int(secondField) ?? 0
               let sumFirstAndSecond = firstFieldInt + secondFieldInt
               self.sumLable.text = "Сумма равна: \(sumFirstAndSecond)"
               print(sumFirstAndSecond)
            }
        sumAlert.addTextField()
        sumAlert.addTextField()

        sumAlert.addAction(actionButton)
    
       present(sumAlert, animated: true)
        }

    /// Alert for guess
    var massageAlert = "2 + 4 * 2"
    let rightAnswer = 10
    
    @objc private func guessAlert() {
        let guessAlert = UIAlertController(title: "Ошибка", message:
                                            "Result of \(massageAlert)",
                                           preferredStyle: .alert)
        
        guessAlert.addTextField { field in
            field.placeholder = ""
        }
        
        guessAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
            let fieldAnswer = guessAlert.textFields?.first
            
            if fieldAnswer?.text == String(Int(10)) {
                self.guessLable.text = String(Int(10))
            } else {
                self.guessLable.text = "Неверный ответ"
            }
    }))
        present(guessAlert, animated: true, completion: nil)
    }

}
