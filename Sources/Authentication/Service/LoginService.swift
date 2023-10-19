//
//  LoginService.swift
//  QuantIDMain
//
//  Created by Sami Ali on 19.10.23.
//

import Foundation

protocol LoginService {
    func performLogin(email: String, password: String) async -> Result<String, Error>
}

class LoginServiceImpl: LoginService {
    let client: HTTPCllient
    
    init(client: HTTPCllient) {
        self.client = client
    }
    
    func performLogin(email: String, password: String) async -> Result<String, Error>  {
       
        let result = await client.perform(request: URLRequest(url: URL(string: "www.google.com")!))
        
        switch result {
            
        case .success(_):
            return .success("")
        case .failure(let error):
            return .failure(error)
        }
    }
}
