//
//  RegisterRequestModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 12/7/22.
//

import Foundation

// MARK: - RegisterRequestModel
struct RegisterRequestModel: Codable {
    let name, email, phone, password: String?
    let confirmPassword, registerOTP: String?
    let govtIssuedID: GovtIssuedID?
}

// MARK: - GovtIssuedID
struct GovtIssuedID: Codable {
    let number: String?
    let isNID: Bool?
}
