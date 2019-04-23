//
//  DataService.swift
//  MVCStructPerson
//
//  Created by Boss on 4/24/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class DataService {
    static let conpho = DataService()
    var person = [
        Person(image: UIImage(named: "1")!, name: "Bình", phone: "0975399982", sex: "Nam"),
        Person(image: UIImage(named: "2")!, name: "Hoàng", phone: "0975820206", sex: "Nam"),
        Person(image: UIImage(named: "3")!, name: "Khánh", phone: "01696036311", sex: "Nam"),
        Person(image: UIImage(named: "4")!, name: "Linh", phone: "0975822455", sex: "Nữ")
    ]
    
    
    func add(image1: UIImage, name1: String, phone1: String, sex1: String){
        let newPerson = Person(image: image1, name: name1, phone: phone1, sex: sex1)
        person.append(newPerson)
    }
    func edit(indexPath: IndexPath,image1: UIImage, name1: String, phone1: String, sex1: String){
        person[indexPath.row] = Person(image: image1, name: name1, phone: phone1, sex: sex1)
    }
    func remove(indexPath: IndexPath){
        person.remove(at: indexPath.row)
    }
}


