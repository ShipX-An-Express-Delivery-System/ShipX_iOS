//
//  URLs.swift
//  ShipX
//
//  Created by Fahim Rahman on 9/7/22.
//

import Foundation

extension String {

    // base URL
    private static let baseURLString = "http://192.168.0.225:8000/api/v1/"
    
    // register url
    static func registerURL() -> String {
        return baseURLString + "register"
    }
    
    // register OTP
    static func registerOTPURL() -> String {
        return baseURLString + "sendRegisterOTP"
    }
    
    // login url
    static func loginURL() -> String {
        return baseURLString + "login"
    }
    
    // switch role
    static func switchRoleURL() -> String {
        return baseURLString + "switchRole"
    }
    
    // refresh token
    static func refreshTokenURL() -> String {
        return baseURLString + "refreshToken"
    }
    
    // forgot password OTP
    static func forgotPasswordOTPURL() -> String {
        return baseURLString + "sendForgotPassOTP"
    }
    
    // forgot password
    static func forgotPasswordURL() -> String {
        return baseURLString + "forgotPass"
    }
    
    // division
    static func divisionURL() -> String {
        return baseURLString + "divisions?divisionName="
    }
    
    // district
    static func districtURL() -> String {
        return baseURLString + "districts?districtName="
    }
    
    // upazila
    static func upazilaURL() -> String {
        return baseURLString + "upazilas?upazilaName="
    }
    
    // city corp
    static func cityCorpURL() -> String {
        return baseURLString + "cityCorpAreas?area="
    }
}
