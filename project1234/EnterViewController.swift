//
//  EnterViewController.swift
//  project1234
//
//  Created by Лидия  on 07.07.2024.
//

import UIKit


class EnterViewController: UIViewController {
    
 
    @IBOutlet weak var userLogin: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar()
    }
    
    @IBAction func enterButtom(_ sender: Any) {
        User.shared.login = userLogin.text
        User.shared.password = userPassword.text


        if (User.shared.login != "0"){
            if (UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["password"] as? String ==       User.shared.password){
                let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                self.navigationController?.pushViewController(storyboard, animated: true)
            } else{
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
            self.navigationController?.pushViewController(storyboard, animated: true)            }
            
        }
        else{
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
        self.navigationController?.pushViewController(storyboard, animated: true)            }
    }
}
extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
