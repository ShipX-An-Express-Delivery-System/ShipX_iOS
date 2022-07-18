//
//  URLs.swift
//  ShipX
//
//  Created by Fahim Rahman on 9/7/22.
//

import Foundation

extension String {

    // base URL request
    private static let baseURLString = "http://192.168.0.225:8000/api/v1/"
    
    // register url request
    static func registerURL() -> String {
        return baseURLString + "register"
    }
    
    // register OTP request
    static func registerOTPURL() -> String {
        return baseURLString + "sendRegisterOTP"
    }
    
    // login url request
    static func loginURL() -> String {
        return baseURLString + "login"
    }
    
    // switch role request
    static func switchRoleURL() -> String {
        return baseURLString + "switchRole"
    }
    
    // refresh token request
    static func refreshTokenURL() -> String {
        return baseURLString + "refreshToken"
    }
    
    // forgot password OTP request
    static func forgotPasswordOTPURL() -> String {
        return baseURLString + "sendForgotPassOTP"
    }
    
    // forgot password request
    static func forgotPasswordURL() -> String {
        return baseURLString + "forgotPass"
    }
    
    // division request
    static func divisionURL() -> String {
        return baseURLString + "divisions?divisionName="
    }
    
    // district request
    static func districtURL() -> String {
        return baseURLString + "districts?districtName="
    }
    
    // upazila request
    static func upazilaURL() -> String {
        return baseURLString + "upazilas?upazilaName="
    }
    
    // city corp request
    static func cityCorpURL() -> String {
        return baseURLString + "cityCorpAreas?area="
    }
    
    // traveller travel post request
    static func travellerShippingRequestURL() -> String {
        return baseURLString + "travellerShippingRequest"
    }
    
    // shipping process data request
    static func shippingProcessDataURL() -> String {
        return baseURLString + "shippingProcessData?email="
    }
    
    // accept request
    static func acceptRequestURL() -> String {
        return baseURLString + "acceptRequest"
    }
    
    // reject request
    static func rejectRequestURL() -> String {
        return baseURLString + "rejectRequest"
    }
    
    // user profile data request
    static func userProfileDataRequestURL() -> String {
        return baseURLString + "userProfileData?email="
    }
    
    // details shipping process data for traveller request
    static func shippingDetailsDataForTravellerURL() -> String {
        return baseURLString + "detailsShippingData?email="
    }
    
    // confirmation OTP request
    static func confirmationOTPRequestURL() -> String {
        return baseURLString + "sendConfirmationOTP"
    }
    
    // delivered request
    static func deliveredRequestURL() -> String {
        return baseURLString + "deliveredRequestByTraveller"
    }
}
