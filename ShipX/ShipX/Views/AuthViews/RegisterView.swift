//
//  RegisterView.swift
//  ShipX
//
//  Created by Fahim Rahman on 10/7/22.
//

import SwiftUI
import Alamofire

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
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    
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
                                postRegisterOTPRequest()
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
                        postRegisterRequest()
                    } label: {
                        Text("Register")
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
        } //: zstact
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    }
    
    // post register OTP request
    func postRegisterOTPRequest() {
        
        guard let registerOTPURL = URL(string: String.registerOTPURL()) else {
            print("Register OTP URL Invalid")
            return
        }
        
        let parameters = ["email": registerFromModel.email]
        
        let request = AF.request(registerOTPURL, method: .post, parameters: parameters, encoder: .json)
        
        request.responseDecodable(of: RegisterOTPResponseModel.self) { data in
            if data.value?.success == false {
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.error ?? data.value?.status ?? "Unknown Error"
                self.showingAlert = true
            }
            else {
                self.alertTitle = "Success!"
                self.responseMessage = data.value?.status ?? "OTP Sent Successfully."
                self.showingAlert = true
            }
        }
    }

    
    // post register data API request
    func postRegisterRequest() {
        
        guard let registerURL = URL(string: String.registerURL()) else {
            print("Register URL Invalid")
            return
        }
        
        let parameters = RegisterRequestModel(name: registerFromModel.userName, email: registerFromModel.email, phone: registerFromModel.phone, password: registerFromModel.password, confirmPassword: registerFromModel.confirmPassword, registerOTP: registerFromModel.registerOTP, govtIssuedID: GovtIssuedID(number: registerFromModel.BIDOrNID, isNID: registerFromModel.isNID))
        
        let request = AF.request(registerURL, method: .post, parameters: parameters, encoder: .json)
        
        request.responseDecodable(of: RegisterResponseModel.self) { data in
            if data.value?.success == false {
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.error ?? data.value?.status ?? "Unknown Error"
                self.showingAlert = true
            }
            else {
                self.alertTitle = "Success!"
                self.responseMessage = data.value?.status ?? "Account Created Successfully."
                self.showingAlert = true
            }
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
