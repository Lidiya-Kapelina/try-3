//
//  FoodViewController.swift
//  project1234
//
//  Created by Лидия  on 07.07.2024.
//
import UIKit

class Food {
    var name: String
    var calories: String
    var include: String
    var photo: UIImage
    var url: String

    init(name: String, calories: String, include: String, photo: UIImage, url: String) {
        self.name = name
        self.calories = calories
        self.include = include
        self.photo = photo
        self.url = url
    }
    
}

import UIKit
class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { // Добавляем UITableViewDelegate
    @IBOutlet weak var tableView: UITableView!
    var data: [Food] = [
        Food(name: "Булгур с овощами и индейкой", calories: "110 ккал", include: "Состав: индейка, булгур, вода, овощи, масло сливочное", photo: UIImage(named: "bulgur")!, url: "https://menunedeli.ru/recipe/bulgur-s-ovoshhami-i-indejkoj/"),
        
        Food(name: "Жаркое", calories: "75 ккал", include: "Состав: филе куриное, шампиньоны, картофель, морковь, лук репчатый, масло растительное, вода, петрушка", photo: UIImage(named: "jarcoe")!, url: "https://menunedeli.ru/recipe/zharkoe-recept-v-duxovke/"),
        
        Food(name: "Банановый смузи с овсянкой", calories: "89 ккал", include: "Банан, кефир, хлопья овсяные, малина, чай зеленый", photo: UIImage(named: "banana")!, url: "https://menunedeli.ru/recipe/bananovyj-smuzi-s-ovsyankoj/"),
        
        Food(name: "Индейка с овощами на пару", calories: "87 ккал", include: "Состав: индейка, брокколи, фасоль стручковая, перец болгарский, чеснок, соус терияки", photo: UIImage(named: "indeika")!, url: "https://menunedeli.ru/recipe/indejka-s-ovoshhami-na-paru/"),
        Food(name: "Смузи-боул с персиками и ягодами", calories: "82 ккал", include: "Состав: банан, йогурт, персик, малина, черная смородина, гранола", photo: UIImage(named: "boul")!, url: "https://menunedeli.ru/recipe/smuzi-boul-s-persikami-i-yagodami/")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self // Устанавливаем делегата для таблицы
        let nib = UINib(nibName: "AdCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AdCell")
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    

    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
        let food = data[indexPath.row]
        cell.configure(icon: food.photo, text: "\(food.name)\n\(food.calories)\n\(food.include)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = data[indexPath.row]
        if let url = URL(string: food.url) {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0 // Высота строки в пикселях
    }
}


