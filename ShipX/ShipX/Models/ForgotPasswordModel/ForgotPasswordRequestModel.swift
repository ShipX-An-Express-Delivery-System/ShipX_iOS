//
//  ForgotPasswordRequestModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import Foundation

// MARK: - ForgotPasswordRequestModel
struct ForgotPasswordRequestModel: Codable {
    let email, newPassword, newConfirmPassword, forgotPassOTP: String?
}
