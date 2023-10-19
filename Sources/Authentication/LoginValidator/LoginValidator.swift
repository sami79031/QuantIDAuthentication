//
//  LoginValidator.swift
//  QuantIDMain
//
//  Created by Sami Ali on 19.10.23.
//

import Foundation

protocol LoginValidation {
    func validate(email: String) -> Bool
    func validate(password: String) -> Bool
}

class LoginValidationImpl: LoginValidation {
    //8characters, 1 number, i capital, 1 symbol
    func validate(email: String) -> Bool {
        if email.isEmpty {
            return false
        }
        
        if !email.contains("@") {
            return false
        }
        
        return true
    }
    
    func validate(password: String) -> Bool {
        return false
    }
}
