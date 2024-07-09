//
//  MainViewController.swift
//  project
//
//  Created by Лидия  on 05.07.2024.
//

import UIKit
class MainViewController:UIViewController, UITextFieldDelegate{
    @IBOutlet weak var rightButtom: UIButton!
    @IBOutlet weak var leftButtom: UIButton!
    var label: UILabel = UILabel()
    var cal: Int = 0
    var col: Int = 0
    @IBOutlet weak var tableView: UITableView!
    var texts:[String] = (UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["food"] as? [ String] ?? [])
    @IBOutlet weak var kolCalories: UILabel!
    @IBOutlet weak var kol: UITextField!
    @IBOutlet weak var calories: UITextField!
    @IBOutlet weak var addDishTextField: UITextField!
    @IBOutlet weak var addButton: UIButton! // Кнопка "Добавить"
    @IBAction func deleteButton(_ sender: Any) {
          var dict = UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0") ?? [:]
          dict["sumCalories"] = 0
          dict["food"] = []
        kolCalories.text = "0"
        texts = []
          UserDefaults.standard.setValue(dict, forKey: User.shared.login ?? "0")
        tableView.reloadData()
      }

      override func viewDidLoad() {
          kolCalories.text = String((UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["sumCalories"] as? Int ?? 0))
          super.viewDidLoad()
          view.addSubview(label)
          tableView.dataSource = self
          let nib = UINib(nibName: "AdCell2", bundle: nil)
          tableView.register(nib, forCellReuseIdentifier: "AdCell2")
          delegate()
          addButton.addTarget(self, action: #selector(addDish), for: .touchUpInside)
          addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
      }
    func delegate(){
        addDishTextField.delegate = self
        calories.delegate = self
        kol.delegate = self    }

    @objc func addDish() {
        if let newDish = addDishTextField.text, !newDish.isEmpty && !(newDish == "Добавить блюдо") {
            if let newKol = kol.text, !newKol.isEmpty, let kolInt = Int(newKol) {
                if let newCalories = calories.text, !newCalories.isEmpty, let caloriesInt = Int(newCalories) {
                    texts.append(newDish)
                    addDishTextField.text = "Добавить блюдо"
                    tableView.reloadData()
                    cal = caloriesInt
                    calories.text = "Калорийность на 100г"
                    col = kolInt
                    kol.text = "Вес"                }
                else {
                    showError()
                }       
            }else {
                showError()
            }
        }else {
            showError()
        }
    }


  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      addDish()
      textField.resignFirstResponder()
      return true
  }

  @IBAction func add(_ sender: Any) {
      let call = (UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0")?["sumCalories"] as? Int ?? 0) + Int(Double(cal * col) * 0.01)
      kolCalories.text = String(call)
      var dict = UserDefaults.standard.dictionary(forKey: User.shared.login ?? "0") ?? [:]
      dict["sumCalories"] = call
      dict["food"] = texts
      UserDefaults.standard.setValue(dict, forKey: User.shared.login ?? "0")
      col = 0
      cal = 0
  }


    private func showError() {
        /*   let countErrorViewController = CountErrorViewController()
         present(countErrorViewController, animated: true, completion: nil)
         */
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "CountErrorViewController") as! CountErrorViewController
        self.navigationController?.pushViewController(storyboard, animated: true)    }
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return texts.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell2", for: indexPath) as! AdCell2
      let text = texts[indexPath.row]
      cell.configure(text: text)
      return cell
  }
}
