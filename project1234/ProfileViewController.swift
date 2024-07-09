//
//  ProfileViewController.swift
//  project1234
//
//  Created by Лидия  on 06.07.2024.
//
import UIKit

class ProfileViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var contactData: UITextField!
    var label: UILabel = UILabel()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(label)
        deligate()
        updateTextFields()
    }
    
    func updateTextFields() {
        name.text = UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["name"] as? String
        dateOfBirth.text = UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["dateOfBirth"] as? String
        weight.text = UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["weight"] as? String
        contactData.text = UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["contactData"] as? String
    }
    
    // Обработчик нажатия на кнопку "Изменить"
    @IBAction func changeButton(_ sender: Any) {
        // Сохраняем изменения в UserDefaults
        var dict = UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0") ?? [:]
        dict["contactData"] = contactData.text
        dict["name"] = name.text
        dict["weight"] = weight.text
        dict["dateOfBirth"] = dateOfBirth.text
        UserDefaults.standard.setValue(dict, forKey: User.shared.login ?? "0")
        
        // Обновляем текст в text fields
        updateTextFields()
    }
    
    func deligate() {
        name.delegate = self
        dateOfBirth.delegate = self
        weight.delegate = self
        contactData.delegate = self
    }
}
