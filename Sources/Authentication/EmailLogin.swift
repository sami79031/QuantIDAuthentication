//
//  EmailLogin.swift
//  QuantIDMain
//
//  Created by Sami Ali on 19.10.23.
//

import Foundation

protocol Login {
    func login(email: String, password: String) -> Bool
}


class EmailLogin: Login {
    let validator: LoginValidation
    
    init(validator: LoginValidation = LoginValidationImpl()) {
        self.validator = validator
    }
    
    func login(email: String, password: String) -> Bool {
        if !validator.validate(email: email) {
            return false
        }
        
        return true
        //1.validation
    }
    
    static func build() -> EmailLogin {
        let validator = LoginValidationImpl()
        return EmailLogin(validator: validator)
    }
}
