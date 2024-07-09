//
//  FoodViewController.swift
//  project1234
//
//  Created by Лидия  on 07.07.2024.
//
class Food {
    var name: String
    var calories: String
    var include: String
    var photo: UIImage

    init(name: String, calories: String, include: String, photo: UIImage) {
        self.name = name
        self.calories = calories
        self.include = include
        self.photo = photo
    }
    
}

import UIKit
class FoodViewController: UIViewController, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    var data: [Food] = [
        Food(name: "Булгур с овощами и индейкой", calories: "110 ккал", include: "Состав: индейка, булгур, вода, овощи, масло сливочное", photo: UIImage(named: "bulgur")!),
        
        Food(name: "Жаркое", calories: "75 ккал", include: "Состав: филе куриное, шампиньоны, картофель, морковь, лук репчатый, масло растительное, вода, петрушка", photo: UIImage(named: "jarcoe")!),
        
        Food(name: "Банановый смузи с овсянкой", calories: "89 ккал", include: "Банан, кефир, хлопья овсяные, малина, чай зеленый", photo: UIImage(named: "banana")!),
        
        Food(name: "Индейка с овощами на пару", calories: "87 ккал", include: "Состав: индейка, брокколи, фасоль стручковая, перец болгарский, чеснок, соус терияки", photo: UIImage(named: "indeika")!),
        Food(name: "Смузи-боул с персиками и ягодами", calories: "82 ккал", include: "Состав: банан, йогурт, персик, малина, черная смородина, гранола", photo: UIImage(named: "boul")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
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
}


