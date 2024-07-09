//
//  ErrorViewController.swift
//  project
//
//  Created by Лидия  on 05.07.2024.
//

import UIKit
class ErrorViewController:UIViewController{
    private let label: UILabel = {
           let label = UILabel()
           label.text = "Некорректный ввод. Проверьте данные."
           label.textAlignment = .center
           label.font = UIFont.boldSystemFont(ofSize: 18)
           return label
       }()

       private let button: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("OK", for: .normal)
           button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
           return button
       }()

       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white

           view.addSubview(label)
           view.addSubview(button)

           label.translatesAutoresizingMaskIntoConstraints = false
           button.translatesAutoresizingMaskIntoConstraints = false

           NSLayoutConstraint.activate([
               label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
               button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
           ])
       }

       @objc func dismissViewController() {
           dismiss(animated: true, completion: nil)
       }
   }

