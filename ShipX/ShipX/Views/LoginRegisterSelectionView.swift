//
//  LoginRegisterSelectionView.swift
//  ShipX
//
//  Created by Fahim Rahman on 9/7/22.
//

import SwiftUI

struct LoginRegisterSelectionView: View {
    
    // states
    @State private var loginButtonPressed: Bool = false
    @State private var registerButtonPressed: Bool = false
    
    // view
    var body: some View {
        // navigation view
        NavigationView {
            // zstack
            ZStack {
                Color.customBackground.edgesIgnoringSafeArea(.all)
                
                // vstack
                VStack {
                    // logo
                    Image("shipxlogo")
                    
                    Spacer()
                    
                    // navigation link login
                    NavigationLink(destination: LoginView(), isActive: $loginButtonPressed) {
                        // login button
                        Button {
                            // action
                            self.loginButtonPressed = true
                        } label: {
                            Text("LOGIN")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.black)
                                .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                                .background(.white)
                                .cornerRadius(10)
                        }
                        .padding(.vertical, 5)
                        .shadow(color: .gray, radius: 0.1)
                    } //: navigation link login

                    
                    // navigation link register
                    NavigationLink(destination: RegisterView(), isActive: $registerButtonPressed) {
                        // register button
                        Button {
                            // action
                            self.registerButtonPressed = true
                        } label: {
                            Text("REGISTER")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                                .background(Color.customRed)
                                .cornerRadius(10)
                        }
                        .padding(.vertical, 5)
                    } //: navigation link register
                    Spacer()
                } //: vstack
            } //: zstack
        } //: navigation
    } //: view
}


struct LoginRegisterSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterSelectionView()
    }
}
