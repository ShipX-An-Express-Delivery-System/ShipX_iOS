//
//  ReceiverHomeView.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import SwiftUI

struct ReceiverHomeView: View {
    var body: some View {
        ZStack {
            Text("Receiver Home View")
        }
        .onAppear {
            refreshTokenRequest(completion: {
                print(UserDefaults.standard.string(forKey: "accessToken")!)
            })
        }
    }
}


struct ReceiverHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiverHomeView()
    }
}
