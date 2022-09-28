//
//  ThirdViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 27.09.2022.
//

import UIKit
    /// Третий экран
class ThirdViewController: UIViewController {
    
    /// Наша кнопка отмена в углу экрана
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.setTitleColor(.tintColor, for: .normal)
        button.addTarget(self, action: #selector(closeFriend), for: .touchUpInside)
        return button
    }()
    
    /// Наша кнопка добавить
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.frame = CGRect(x: 285, y: 0, width: 100, height: 50)
        button.setTitleColor(.tintColor, for: .normal)
        button.addTarget(self, action: #selector(closeFriend), for: .touchUpInside)
        return button
    }()
    
        /// Наш Аватар
    private let avatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.frame = CGRect(x: 125, y: 50, width: 150, height: 150)
        imageView.tintColor = .systemGray3
        return imageView
    }()
    
    /// Подпись изменить фото
    private let updatePhoto: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить фото", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.frame = CGRect(x: 125, y: 185, width: 150, height: 50)
        return button
    }()
    
    /// Наше имя
    private let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Имя"
            label.textColor = .tintColor
            label.frame = CGRect(x: 40, y: 225, width: 200, height: 50)
            return label
        }()
       
       /// Наша дата
        private let dateLabel: UILabel = {
            let label = UILabel()
            label.text = "Дата"
            label.textColor = .tintColor
            label.frame = CGRect(x: 40, y: 325, width: 200, height: 50)
            return label
        }()

       /// Наш возраст
        private let ageLabel: UILabel = {
            let label = UILabel()
            label.text = "Возраст"
            label.textColor = .tintColor
            label.frame = CGRect(x: 40, y: 425, width: 200, height: 50)
            return label
        }()
    
    /// Наш пол
        private let sexLabel: UILabel = {
            let label = UILabel()
            label.text = "Пол"
            label.textColor = .tintColor
            label.frame = CGRect(x: 40, y: 525, width: 200, height: 50)
            return label
        }()
        
        ///  Поле инстаграм
        private let instagramLabel: UILabel = {
            let label = UILabel()
            label.text = "Instagram"
            label.textColor = .tintColor
            label.frame = CGRect(x: 40, y: 625, width: 200, height: 50)
            return label
        }()
      /// Здесь будем вводить имя
        private let nameTextfield: UITextField = {
           let textfield = UITextField()
           textfield.placeholder = "Введите имя"
           textfield.frame = CGRect(x: 40, y: 260, width: 300, height: 50)
           textfield.borderStyle = .none
           return textfield
       }()
    /// Делаем выборку дат
       private let datePickerdate = UIDatePicker()

       private lazy var datePicker: UITextField = {
           let datePicker = UITextField()
           datePicker.placeholder = "Введите дату"
           datePicker.frame = CGRect(x: 40, y: 360, width: 300, height: 50)
           datePicker.borderStyle = .none
           datePickerdate.preferredDatePickerStyle = .wheels
           let dateToolBar = UIToolbar()
           dateToolBar.sizeToFit()
           let dateDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateAction))
           dateToolBar.setItems([dateDoneButton], animated: true)
           datePicker.inputAccessoryView = dateToolBar
           datePicker.inputView = datePickerdate
           return datePicker
       }()
        /// Поле с возрастом

    private let ageTextfield: UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "Добавить"
            textfield.frame = CGRect(x: 40, y: 460, width: 300, height: 50)
            textfield.borderStyle = .none
            return textfield
        }()
    
          /// Поле с полом
        private let sexTextfield: UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "Добавить"
            textfield.frame = CGRect(x: 40, y: 560, width: 300, height: 50)
            textfield.borderStyle = .none
            return textfield
        }()
    /// Поле с инстаграмом
       
    private lazy var instagramTextfield: UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "Добавить"
            textfield.frame = CGRect(x: 40, y: 660, width: 300, height: 50)
            textfield.borderStyle = .none
            textfield.addTarget(self, action: #selector(instaAction), for: .editingDidBegin)
            return textfield
        }()
        /// Линия имя
        private let nameSplitter: UIView = {
            let splitterView = UIView()
            splitterView.backgroundColor = .systemGray3
            splitterView.frame = CGRect(x: 40, y: 312, width: 300, height: 2)
            return splitterView
        }()
    /// Линия дата
    private let dateLine: UIView = {
          let lineView = UIView()
          lineView.backgroundColor = .systemGray3
          lineView.frame = CGRect(x: 40, y: 412, width: 300, height: 2)
          return lineView
      }()
     /// Линия возраст
      private let ageLine: UIView = {
          let lineView = UIView()
          lineView.backgroundColor = .systemGray3
          lineView.frame = CGRect(x: 40, y: 512, width: 300, height: 2)
          return lineView
      }()
      /// Линия пол
      private let sexLine: UIView = {
          let lineView = UIView()
          lineView.backgroundColor = .systemGray3
          lineView.frame = CGRect(x: 40, y: 612, width: 300, height: 2)
          return lineView
      }()
     /// Линия инстаграмм
      private let instagramLine: UIView = {
          let lineView = UIView()
          lineView.backgroundColor = .systemGray3
          lineView.frame = CGRect(x: 40, y: 712, width: 300, height: 2)
          return lineView
      }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    
    private func setupView() {
            view.backgroundColor = .white

            view.addSubview(exitButton)
            view.addSubview(addButton)
            view.addSubview(avatarView)
            view.addSubview(updatePhoto)
            view.addSubview(nameLabel)
            view.addSubview(dateLabel)
            view.addSubview(ageLabel)
            view.addSubview(sexLabel)
            view.addSubview(instagramLabel)
            view.addSubview(nameTextfield)
            view.addSubview(datePicker)
            view.addSubview(ageTextfield)
            view.addSubview(sexTextfield)
            view.addSubview(instagramTextfield)
            view.addSubview(nameSplitter)
            view.addSubview(dateLine)
            view.addSubview(ageLine)
            view.addSubview(sexLine)
            view.addSubview(instagramLine)

   }
    /// format даты
     @objc private func dateAction() {
          let formatter = DateFormatter()
          formatter.dateStyle = .medium
          formatter.timeStyle = .short
          datePicker.text = "\(formatter.string(from: datePickerdate.date))"
          view.endEditing(true)
      }
    
    @objc private func instaAction() {
           let alert = UIAlertController(title: "Введите username Instagram", message: nil, preferredStyle: .alert)
           alert.addTextField { $0.placeholder = "Например Durov1" }
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
               self.instagramTextfield.text = alert.textFields?.first?.text ?? ""
           }))
           present(alert, animated: true)
       }
   
    @objc private func closeFriend() {
            dismiss(animated: true)
        }
    }
