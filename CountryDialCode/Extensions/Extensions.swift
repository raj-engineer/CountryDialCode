//
//  Extensions.swift
//  CountryDialCode
//
//  Created by Rajeshkumar on 19/05/18.
//  Copyright © 2018 Rajeshkumar. All rights reserved.
//

import Foundation
import UIKit
//MARK:- UITextField Extension
extension UITextField{
    
    // For Text Field Padding
    func setPadding(){
        let PaddingSpace :CGFloat = 5.0
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: PaddingSpace, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextFieldViewMode.always
    }
    
    // For text Field Bottom Border Line
    func setBottomBorderLine()
    {
        // To mimize code just set background Color = white  & Border Style = .none from Storyboard
        self.borderStyle = .none
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
