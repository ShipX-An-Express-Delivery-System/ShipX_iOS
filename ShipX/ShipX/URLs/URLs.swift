//
//  URLs.swift
//  ShipX
//
//  Created by Fahim Rahman on 9/7/22.
//

import Foundation

extension String {
    
    // base URL request local - Count 1
    //private static let baseURLString = "http://192.168.0.225:8000/api/v1/"
    
    // base URL request HEROKU - Count 1
    private static let baseURLString = "https://shipxbackend.herokuapp.com/api/v1/"
    
    // register url request - Count 2
    static func registerURL() -> String {
        return baseURLString + "register"
    }
    
    // register OTP request - Count 3
    static func registerOTPURL() -> String {
        return baseURLString + "sendRegisterOTP"
    }
    
    // login url request - Count 4
    static func loginURL() -> String {
        return baseURLString + "login"
    }
    
    // logout request - Count 5
    static func logoutRequestURL() -> String {
        return baseURLString + "logout"
    }
    
    // switch role request - Count 6
    static func switchRoleURL() -> String {
        return baseURLString + "switchRole"
    }
    
    // refresh token request - Count 7
    static func refreshTokenURL() -> String {
        return baseURLString + "refreshToken"
    }
    
    // forgot password OTP request - Count 8
    static func forgotPasswordOTPURL() -> String {
        return baseURLString + "sendForgotPassOTP"
    }
    
    // forgot password request - Count 9
    static func forgotPasswordURL() -> String {
        return baseURLString + "forgotPass"
    }
    
    // division request - Count 10
    static func divisionURL() -> String {
        return baseURLString + "divisions?divisionName="
    }
    
    // district request - Count 11
    static func districtURL() -> String {
        return baseURLString + "districts?districtName="
    }
    
    // upazila request - Count 12
    static func upazilaURL() -> String {
        return baseURLString + "upazilas?upazilaName="
    }
    
    // city corp request - Count 13
    static func cityCorpURL() -> String {
        return baseURLString + "cityCorpAreas?area="
    }
    
    // traveller travel post request - Count 14
    static func travellerShippingRequestURL() -> String {
        return baseURLString + "travellerShippingRequest"
    }
    
    // shipping process data request - Count 15
    static func shippingProcessDataURL() -> String {
        return baseURLString + "shippingProcessData?email="
    }
    
    // accept request - Count 16
    static func acceptRequestURL() -> String {
        return baseURLString + "acceptRequest"
    }
    
    // reject request - Count 17
    static func rejectRequestURL() -> String {
        return baseURLString + "rejectRequest"
    }
    
    // user profile data request - Count 18
    static func userProfileDataRequestURL() -> String {
        return baseURLString + "userProfileData?email="
    }
    
    // details shipping process data for traveller request - Count 19
    static func shippingDetailsDataForTravellerURL() -> String {
        return baseURLString + "detailsShippingData?email="
    }
    
    // confirmation OTP request - Count 20
    static func confirmationOTPRequestURL() -> String {
        return baseURLString + "sendConfirmationOTP"
    }
    
    // delivered request - Count 21
    static func deliveredRequestURL() -> String {
        return baseURLString + "deliveredRequestByTraveller"
    }
    
    // find travellers request - Count 22
    static func findTravellersURL(divisionFrom: String, districtFrom: String, upazilaFrom: String?, divisionTo: String, districtTo: String, upazilaTo: String?) -> String {
        return baseURLString + "availableTravellers?divisionFrom=\(divisionFrom)&districtFrom=\(districtFrom)" + (upazilaFrom ?? "") + "&divisionTo=\(divisionTo)&districtTo=\(districtTo)" + (upazilaTo ?? "")
    }
    
    // sender shipping request - Count 23
    static func senderShippingRequestURL() -> String {
        return baseURLString + "senderShippingRequest"
    }
    
    // get shipping cost - Count 24
    static func shippingCostURL() -> String {
        return baseURLString + "shippingCost"
    }
    
    // upload profile picture - Count 25
    static func uploadProfilePictureURL() -> String {
        return baseURLString + "profilePicture"
    }
}
