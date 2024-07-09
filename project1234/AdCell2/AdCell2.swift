//
//  AdCell2.swift
//  project1234
//
//  Created by Лидия  on 08.07.2024.
//

import UIKit
class AdCell2: UITableViewCell{
    
    @IBOutlet weak var infoLabel: UILabel!
    func configure(text:String){
        infoLabel.text = text
    }
}
