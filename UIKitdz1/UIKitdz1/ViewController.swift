//
//  ViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 21.09.2022.
//

import UIKit

/// firstVC
class ViewController: UIViewController {

    /// Наша Кнопка - Войти. layer - слой, позволяет закруглять кнопки
        lazy var loginButton: UIButton = {
            let button = UIButton()
            button.setTitle("Войти", for: .normal)
            button.layer.cornerRadius = 15
            button.backgroundColor = .tintColor
            button.frame = CGRect(x: 50, y: 600, width: 300, height: 60)
            button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            return button
        }()
      /// Наша запись Вход по Face ID(Label)
        private var faceIdLabel: UILabel = {
            let label = UILabel()
            label.text = "Вход по Face ID"
            label.frame = CGRect(x: 150, y: 525, width: 200, height: 40)
            return label
        }()
       /// Наш переключатель напротив Face ID. isOn - логическое выражение, которое определяет в каком положении изначально будет находиться наш Switch
        private var faceIdSwitch: UISwitch = {
            let switcher = UISwitch()
            switcher.isOn = true
            switcher.frame = CGRect(x: 285, y: 530, width: 100, height: 50)
            return switcher
        }()
       /// Наша запись Password. Font - стиль текста.
        private var passwordLabel: UILabel = {
            let label = UILabel()
            label.text = "Password"
            label.frame = CGRect(x: 50, y: 400, width: 200, height: 50)
            label.textColor = .systemBlue
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
       /// Наша запись email
        private var emailLabel: UILabel = {
            let label = UILabel()
            label.text = "Email"
            label.frame = CGRect(x: 50, y: 300, width: 200, height: 50)
            label.textColor = .systemBlue
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        /// Наша ячейка куда вводим Email. borderStyle - определяет есть ли границы у textField или нет
        private var emailTextfield: UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "Введите Email"
            textfield.borderStyle = .none
            textfield.frame = CGRect(x: 50, y: 330, width: 300, height: 50)
            return textfield
        }()
       /// Полосочка под мейлом
        private var lineEmailView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemGray3
            view.frame = CGRect(x: 50, y: 380, width: 300, height: 2)
            return view
        }()
       /// Наша ячейка куда вводим наш пароль isSecureTextEntry скрывает пароль от др лиц
        private var passwordTextfield: UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "Введите password"
            textfield.borderStyle = .none
            textfield.frame = CGRect(x: 50, y: 430, width: 300, height: 50)
            textfield.isSecureTextEntry = true
            return textfield
        }()
        /// Наша полосочка под паролем
        private var linePasswordView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemGray3
            view.frame = CGRect(x: 50, y: 480, width: 300, height: 2)
            return view
        }()
        /// Наша запись Sign In
        private var signInLabel: UILabel = {
            let label = UILabel()
            label.text = "Sign In"
            label.font = .boldSystemFont(ofSize: 24)
            label.frame = CGRect(x: 50, y: 250, width: 200, height: 50)
            return label
        }()
       /// Наш логотип в шапке профиля, bordetWidth - толщина обводки, borderColor - цвет обводки. textAlingment - выставляет нашу надпись по центру
        private var logoLabel: UILabel = {
            let label = UILabel()
            label.text = "Birthday Reminder"
            label.textColor = .tintColor
            label.font = .boldSystemFont(ofSize: 24)
            label.frame = CGRect(x: 80, y: 150, width: 250, height: 75)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.black.cgColor
            label.textAlignment = .center
            return label
        }()
    /// Глазок, чтобы посмотреть пароль
    private lazy var passwordButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            button.tintColor = .systemGray3
            button.frame = CGRect(x: 320, y: 445, width: 35, height: 35)
            button.addTarget(self, action: #selector(passwordButtonTapped), for: .touchUpInside)
            return button
    }()

    override func viewDidLoad() {
            super.viewDidLoad()

            setupView()
        }
            override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
                navigationController?.navigationBar.backgroundColor = .white
        }
        /// Добавляем наши элементы на экран
        private func setupView() {
            view.backgroundColor = .white
            view.addSubview(loginButton)
            view.addSubview(faceIdLabel)
            view.addSubview(faceIdSwitch)
            view.addSubview(passwordLabel)
            view.addSubview(emailLabel)
            view.addSubview(emailTextfield)
            view.addSubview(lineEmailView)
            view.addSubview(passwordTextfield)
            view.addSubview(linePasswordView)
            view.addSubview(signInLabel)
            view.addSubview(logoLabel)
            view.addSubview(passwordButton)
        }
    
    @objc private func passwordButtonTapped(_ sender: UIButton) {
        passwordTextfield.isSecureTextEntry.toggle()
    }
         /// Переход на следующий экран
            @objc private func loginButtonTapped(_ sender: UIButton) {
                   let secondVC = SecondViewController()
                navigationController?.pushViewController(secondVC, animated: true)            }
        }
