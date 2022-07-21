//
//  LocationModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 16/7/22.
//

import Foundation

struct LocationModel: Codable, Identifiable {
    let id: Int?
    let divisionName, districtName, upazilaName, cityCorpAreaName: String?
}
