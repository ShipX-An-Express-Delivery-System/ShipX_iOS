//
//  RegisterView.swift
//  ShipX
//
//  Created by Fahim Rahman on 10/7/22.
//

import SwiftUI

class registerFormViewModel: ObservableObject {
    @Published var userName = String()
    @Published var phone = String()
    @Published var email = String()
    @Published var password = String()
    @Published var confirmPassword = String()
    @Published var isNID = false
    @Published var BIDOrNID = String()
    @Published var registerOTP = String()
}


struct RegisterView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    @ObservedObject private var registerFromModel = registerFormViewModel()
    
    var body: some View {
        
        // zstack
        ZStack {
            Color.customBackground.ignoresSafeArea()
            
            // vstack
            VStack {
                // form
                Form {
                    // section
                    Section {
                        TextField("Name", text: $registerFromModel.userName)
                    } //: section
                    // section
                    Section {
                        TextField("Phone", text: $registerFromModel.phone)
                        TextField("Email", text: $registerFromModel.email)
                    } //: section
                    // section
                    Section {
                        SecureField("Password", text: $registerFromModel.password)
                        SecureField("Confirm Password", text: $registerFromModel.confirmPassword)
                    } footer: {
                        Text("Your password must be at least 6 characters long and also alphanumeric")
                    } //: section
                    // section
                    Section {
                        Text("Select Document Type")
                            .foregroundColor(.customRed)
                        
                        Picker(selection: $registerFromModel.isNID, label: Text("Document Type:")) {
                            Text("Birth Registration").tag(false)
                            Text("National ID").tag(true)
                        }
                        .pickerStyle(.menu)
                        
                        TextField("NID or Birth Certificate ID", text: $registerFromModel.BIDOrNID)
                    } //: section
                    // section
                    Section {
                        // hstack
                        HStack {
                            TextField("Enter OTP", text: $registerFromModel.registerOTP)
                            // button
                            Button {
                                // action
                                print("Get OTP button pressed")
                            } label: {
                                Text("Get OTP")
                                    .font(.system(size: 16, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.screenWidth / 4, height: 40, alignment: .center)
                                    .background(Color.customRed)
                                    .cornerRadius(10)
                            } //: button
                        } //: hstack
                    } footer: {
                        Text("Press the Get OTP button and check your Email")
                    } //: section
                    // button
                    Button {
                        // action
                        print("Register button pressed")
                        print(registerFromModel.isNID)
                        print(registerFromModel.BIDOrNID)
                    } label: {
                        Text("REGISTER")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                            .background(Color.customRed)
                            .cornerRadius(10)
                    } // button
                    .padding(.all, 0)
                } //: form
                .background(Color.customBackground)
            } //: vstack
        }
        .navigationTitle("REGISTER")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
