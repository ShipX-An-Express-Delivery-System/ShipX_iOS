//
//  ProfileDataResponseModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 18/7/22.
//

import Foundation

// MARK: - ProfileDataResponseModel
struct ProfileDataResponseModel: Codable {
    let status: String?
    let success: Bool?
    let profileData: ProfileData?
}

// MARK: - ProfileData
struct ProfileData: Codable {
    let photo: Photo?
    let name, email, phone, role: String?
}

// MARK: - Photo
struct Photo: Codable {
    let url: String?
}
