//
//  ReceiverHomeTabView.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import SwiftUI

struct ReceiverHomeTabView: View {
    
    @State private var selectedTab = 1
    
    var body: some View {
        // navigation view
        NavigationView {
            // tab view
            TabView(selection: $selectedTab) {
                ShippingDetailsView()
                    .tabItem {
                        Label("Shipping Details", systemImage: "note.text")
                    }
                    .tag(1)
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(2)
            } // tab view
            .accentColor(.customRed)
        } //: navigation view
    }
}


struct ReceiverHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiverHomeTabView()
    }
}
