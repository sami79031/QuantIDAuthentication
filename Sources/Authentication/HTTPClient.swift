//
//  File.swift
//  
//
//  Created by Sami Ali on 19.10.23.
//

import Foundation

protocol HTTPCllient {
    func perform(request: URLRequest) async -> Result<Data, Error>
}
