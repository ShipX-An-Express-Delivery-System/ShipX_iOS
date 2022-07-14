//
//  ShipXApp.swift
//  ShipX
//
//  Created by Fahim Rahman on 9/7/22.
//

import SwiftUI

@main
struct ShipXApp: App {
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if !isLoggedIn {
                LoginRegisterSelectionView()
            }
            else {
                if UserDefaults.standard.string(forKey: "role") == "sender" {
                    SenderHomeView()
                }
                if UserDefaults.standard.string(forKey: "role") == "receiver" {
                    ReceiverHomeView()
                }
                if UserDefaults.standard.string(forKey: "role") == "traveller" {
                    TravellerHomeView()
                }
            }
        }
    }
}
