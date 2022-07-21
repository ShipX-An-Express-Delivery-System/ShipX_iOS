//
//  SenderHomeTabView.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import SwiftUI

struct SenderHomeTabView: View {
    
    @State private var selectedTab = 1
    
    var body: some View {
        
        // navigation view
        NavigationView {
            // tab view
            TabView(selection: $selectedTab) {
                ScrollView(showsIndicators: false) {
                    FindTravellersView()
                }
                .clipped()
                .tabItem {
                    Label("Find Travellers", systemImage: "bus")
                }
                .tag(1)
                ShippingDetailsView()
                    .tabItem {
                        Label("Shipping Details", systemImage: "note.text")
                    }
                    .tag(2)
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(3)
            } // tab view
            .accentColor(.customRed)
        } //: navigation view
    }
}


struct SenderHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SenderHomeTabView()
    }
}
