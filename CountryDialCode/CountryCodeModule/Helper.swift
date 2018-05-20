//
//  Helper.swift
//  CountryDialCode
//
//  Created by Rajeshkumar on 19/05/18.
//  Copyright © 2018 Rajeshkumar. All rights reserved.
//

import Foundation

//MARK: - struct - Country Item
struct Item {
    var name = String()
    var dialCode = String()
}

class Helper {
    //MARK: - Properties
    var bool = true
    static let shared  = Helper()
    private init(){  }
    var items : [Item] = [Item]()

    //MARK: - Custom Action
    func addItem(){
        if bool {
            loadNames()
            bool = false
        }
    }
    
    
    fileprivate func loadNames() {
        
        if let path = Bundle.main.path(forResource: "CountryCodes", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let dictionary = jsonResult as? [AnyObject] {
                    readJSONObject(dict: dictionary)
                }
                
            } catch {
                // handle error
            }
        }
    }
    
    // Read Json Object
    func readJSONObject(dict : [AnyObject]){
        for item in dict{
            let name = item["name"] as! String
             let dial_code = item["dial_code"] as! String
            let item  = Item(name: name, dialCode: dial_code)
            Helper.shared.items.append(item)
          }
    }
    
}
