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
            
 
            name.delegate = self
            dateOfBirth.delegate = self
            weight.delegate = self
            contactData.delegate = self

        
            updateTextFields()
        }

        func updateTextFields() {
            name.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["name"] as? String
            dateOfBirth.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["dateOfBirth"] as? String
            weight.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["weight"] as? String
            contactData.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["contactData"] as? String
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
         
            var dict = UserDefaults.standard.dictionary(forKey: globalLogin) ?? [:]

      
            dict["contactData"] = contactData.text
            dict["name"] = name.text
            dict["weight"] = weight.text
            dict["dateOfBirth"] = dateOfBirth.text

  
            UserDefaults.standard.setValue(dict, forKey: globalLogin)

            updateTextFields()
        }
    }
