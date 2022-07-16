//
//  SenderHomeView.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import SwiftUI

struct SenderHomeView: View {
    var body: some View {
        ZStack {
            Text("Sender Home View")
        }
        .onAppear {
            refreshTokenRequest(completion: {
                print(UserDefaults.standard.string(forKey: "accessToken")!)
            })
        }
    }
}


struct SenderHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SenderHomeView()
    }
}
