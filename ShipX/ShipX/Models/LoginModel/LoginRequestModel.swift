//
//  LoginRequestModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import Foundation

// MARK: - LoginRequestModel
struct LoginRequestModel: Codable {
    let email, password: String?
}
