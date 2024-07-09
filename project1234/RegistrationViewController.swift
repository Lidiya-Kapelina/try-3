//
//  RegistrationViewController.swift
//  project1234
//
//  Created by Лидия  on 06.07.2024.
//

import UIKit
class RegistrationViewController:UIViewController{
    var label: UILabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
    }
    
    @IBOutlet weak var login: UITextField!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var contactData: UITextField!
    

    @IBAction func registration(_ sender: Any) {
        var dict: [String: Any] = ["login": login.text]
        dict["password"] = password.text
        dict["name"] = name.text
        dict["contactData"] = contactData.text
        dict["weight"] = weight.text
        dict["dateOfBirth"] = dateOfBirth.text
        dict["food"] = []
        dict["calories"] = 0
        dict["sumCalories"] = 0
        UserDefaults.standard.set(dict, forKey: login.text ?? "0")
    }
    
}
