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
                        .onAppear {
                            refreshTokenRequest(completion: {
                                print(UserDefaults.standard.string(forKey: "accessToken")!)
                            })
                        }
                }
                if UserDefaults.standard.string(forKey: "role") == "receiver" {
                    ReceiverHomeView()
                        .onAppear {
                            refreshTokenRequest(completion: {
                                print(UserDefaults.standard.string(forKey: "accessToken")!)
                            })
                        }
                }
                if UserDefaults.standard.string(forKey: "role") == "traveller" {
                    TravellerHomeTabView()
                        .onAppear {
                            refreshTokenRequest(completion: {
                                print(UserDefaults.standard.string(forKey: "accessToken")!)
                            })
                        }
                }
            }
        }
    }
}
