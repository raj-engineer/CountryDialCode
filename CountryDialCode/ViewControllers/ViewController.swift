//
//  ViewController.swift
//  CountryDialCode
//
//  Created by Rajeshkumar on 19/05/18.
//  Copyright © 2018 Rajeshkumar. All rights reserved.
//

import UIKit

//MARK: - CountryPickerDelegate
extension ViewController : CountryPickerDelegate{
    func didSelectCountry(countryName: String, countryCode: String) {
        print("Item is : ",countryName , countryCode)
        textFieldCountryDialCode.text = countryCode
    }
}

//MARK: - UITextFieldDelegate
extension ViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case textFieldCountryDialCode:
            textField.resignFirstResponder()
            openCountryCodeDialController()
        default:
            print("Default")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class ViewController: UIViewController {

    //MARK: - IBOutlet Properties
  
    @IBOutlet weak var textFieldCountryDialCode: UITextField!
   
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        setUpView()
      
    }
    
    //MARK: - Custom Action
    func setUpView(){
 
        textFieldCountryDialCode.setBottomBorderLine()
        textFieldCountryDialCode.delegate = self
       
    }
    
   
    func openCountryCodeDialController(){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CountryDialCodeVC") as! CountryDialCodeVC
         controller.countryDelegate = self
        self.present(controller, animated: true, completion: nil)
        
    }

}

