//
//  TravellerHomeTabView.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import SwiftUI

struct TravellerHomeTabView: View {
    
    @State private var selectedTab = 1
    
    // view
    var body: some View {
        // navigation view
        NavigationView {
            // tab view
            TabView(selection: $selectedTab) {
                ScrollView(showsIndicators: false) {
                    TravellerTravelView()
                }
                .clipped()
                .tabItem {
                    Label("Travel", systemImage: "bus")
                }
                .tag(1)
                TravellerRequestsView()
                    .tabItem {
                        Label("Requests", systemImage: "person.crop.rectangle.stack")
                    }
                    .tag(2)
                TravellerDetailsView()
                    .tabItem {
                        Label("Details", systemImage: "newspaper")
                    }
                    .tag(3)
                ScrollView(showsIndicators: false) {
                    ProfileView()
                }
                .clipped()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(4)
            } // tab view
            .accentColor(.customRed)
        } //: navigation view
    } //: view
}


struct TravellerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TravellerHomeTabView()
    }
}
