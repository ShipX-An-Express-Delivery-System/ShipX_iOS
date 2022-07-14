//
//  URLs.swift
//  ShipX
//
//  Created by Fahim Rahman on 9/7/22.
//

import Foundation

extension String {

    // base URL
    private static let baseURLString = "http://192.168.0.225:8000/"
    
    // register url
    static func registerURL() -> String {
        return baseURLString + "api/v1/register"
    }
    
    // register OTP
    static func registerOTPURL() -> String {
        return baseURLString + "api/v1/sendRegisterOTP"
    }
    
    // login url
    static func loginURL() -> String {
        return baseURLString + "api/v1/login"
    }
    
    // switch role
    static func switchRoleURL() -> String {
        return baseURLString + "api/v1/switchRole"
    }
    
    // refresh token
    static func refreshTokenURL() -> String {
        return baseURLString + "api/v1/refreshToken"
    }
    
    // forgot password OTP
    static func forgotPasswordOTPURL() -> String {
        return baseURLString + "api/v1/sendForgotPassOTP"
    }
    
    // forgot password
    static func forgotPasswordURL() -> String {
        return baseURLString + "api/v1/forgotPass"
    }
}
