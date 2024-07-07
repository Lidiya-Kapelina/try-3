//
//  FoodViewController.swift
//  project1234
//
//  Created by Лидия  on 07.07.2024.
//
import UIKit
class FoodViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var images: [UIImage] = []  
    let texts = ["Булгур с овощами и индейкой\n110 ккал \nСостав: индейка, булгур, вода, овощи, масло сливочное","Жаркое \n75 ккал \nСостав: филе куриное, шампиньоны, картофель, морковь, лук репчатый, масло растительное, вода, петрушка", "Индейка с овощами на пару \n87 ккал \nСостав: индейка, брокколи, фасоль стручковая, перец болгарский, чеснок, соус терияки"]
    override func viewDidLoad() {
    displayImage(imageName: "bulgur")
    displayImage(imageName: "jarcoe")
    displayImage(imageName: "indeika")

         super.viewDidLoad()
         tableView.dataSource = self
         let nib = UINib(nibName: "AdCell", bundle: nil)
         tableView.register(nib, forCellReuseIdentifier: "AdCell")
     }
    func displayImage(imageName: String) {
          let image = UIImage(named: imageName)
          
          if let image = image {
              images.append(image)
              let imageView = UIImageView(image: image)
              // ...
          }
      }

 }

 extension FoodViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return images.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
         
       
         let icon = images[indexPath.row]
         let text = texts[indexPath.row]

         cell.configure(icon: icon, text: text)
         return cell
     }
 }

