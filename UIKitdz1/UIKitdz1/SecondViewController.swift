//
//  SecondViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 27.09.2022.
//

import UIKit
/// SecondViewController
class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    /// Делаем Шампу Birthday
    private func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .systemGray6
        navigationController?.title = "Birthday"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(friendAdd))
        friendLine(name: "Jeremy", dateLabel: "10 марта, в среду исполнится 25 лет",
                   dateCount: "18 дней",
                   coordinatLine: 125)
        friendLine(name: "Maria Lui", dateLabel: "30 марта, в четверг исполнится 20 лет",
                   dateCount: "28 дней",
                   coordinatLine: 225)
        friendLine(name: "Jony Stark", dateLabel: "20 апреля, в субботу исполнится 25 лет",
                   dateCount: "53 дня",
                   coordinatLine: 325)
        
    }
    
    @objc private func friendAdd(_ sender: UIBarButtonItem) {
        let secondVC = ThirdViewController()
        navigationController?.present(secondVC, animated: true)
    }
    /// Добавляем  наших друзей
    private func friendLine(name: String, dateLabel: String, dateCount: String, coordinatLine: Int) {
        let labelName = UILabel()
        labelName.text = name
        labelName.font = .boldSystemFont(ofSize: 18)
        labelName.frame = CGRect(x: 85, y: coordinatLine, width: 100, height: 50)
        view.addSubview(labelName)
        
    /// Надпись когда день рождение и сколько исполнится лет
        let labelData = UILabel()
        labelData.text = dateLabel
        labelData.textColor = .systemGray
        labelData.frame = CGRect(x: 85, y: coordinatLine + 20, width: 300, height: 50)
        labelData.font = .systemFont(ofSize: 14)
        view.addSubview(labelData)
        
        /// Числа
        let labelCount = UILabel()
        labelCount.text = dateCount
        labelCount.textColor = .systemGray
        labelCount.frame = CGRect(x: 300, y: coordinatLine, width: 100, height: 50)
        view.addSubview(labelCount)
        
            /// Наши аватары
        let avatarView = UIImageView()
        avatarView.image = UIImage(systemName: "person.circle.fill")
        avatarView.tintColor = .systemGray
        avatarView.frame = CGRect(x: 10, y: coordinatLine, width: 75, height: 75)
        view.addSubview(avatarView)
        
        /// Линии под низом
        let lineView = UIView()
        lineView.backgroundColor = .systemGray3
        lineView.frame = CGRect(x: 20, y: avatarView.frame.maxY + 10, width: view.frame.width - 20, height: 2)
        view.addSubview(lineView)
    }
    
}
