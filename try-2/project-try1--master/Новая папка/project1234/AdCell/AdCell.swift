//
//  AdCell.swift
//  project1234
//
//  Created by Лидия  on 07.07.2024.
import UIKit
class AdCell: UITableViewCell{
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    func configure(icon:UIImage?, text:String){
        infoLabel.text = text
        picture.image = icon
    }
}
