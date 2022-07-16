//
//  ForgotPasswordView.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import SwiftUI
import Alamofire

class ForgotPasswordFormViewModel: ObservableObject {
    @Published var email = String()
    @Published var newPassword = String()
    @Published var newConfirmPassword = String()
    @Published var forgotPasswordOTP = String()
}

struct ForgotPasswordView: View {
    
    @ObservedObject private var forgotPasswordFromModel = ForgotPasswordFormViewModel()
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    
    var body: some View {
        // zstack
        ZStack {
            Color.customBackground.ignoresSafeArea()
            
            // vstack
            VStack {
                
                Image("shipxlogo")
                    .padding()
                
                TextField("Email", text: $forgotPasswordFromModel.email)
                    .padding(.all, 10)
                
                Divider()
                
                SecureField("New Password", text: $forgotPasswordFromModel.newPassword)
                    .padding(.all, 10)
                
                Divider()
                
                SecureField("New Confirm Password", text: $forgotPasswordFromModel.newConfirmPassword)
                    .padding(.all, 10)
                
                Divider()
                
                // hstack
                HStack {
                    TextField("OTP", text: $forgotPasswordFromModel.forgotPasswordOTP)
                        .padding(.all, 10)
                    // button
                    Button {
                        // action
                        print("Get OTP Button Pressed")
                        postForgotPasswordOTPRequest()
                    } label: {
                        Text("Get OTP")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.screenWidth / 4, height: 40, alignment: .center)
                            .background(Color.customRed)
                            .cornerRadius(10)
                    } //: button
                    .padding(.horizontal)
                } //: hstack
                
                Spacer()
                
                // button
                Button {
                    // action
                    print("Update Password Button Pressed")
                    postForgotPasswordRequest()
                } label: {
                    Text("Update Password")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                        .background(Color.customRed)
                        .cornerRadius(10)
                } //: button
                .padding()
            } //: vstack
        } //: zstack
        .navigationTitle("Forgot Password")
        .navigationBarTitleDisplayMode(.inline)
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    }
    
    
    // post forgot password OTP request
    func postForgotPasswordOTPRequest() {
        
        guard let forgotPasswordOTPURL = URL(string: String.forgotPasswordOTPURL()) else {
            print("Forgot Password OTP URL Invalid")
            return
        }
        
        let parameters = ["email": self.forgotPasswordFromModel.email]
        
        let request = AF.request(forgotPasswordOTPURL, method: .post, parameters: parameters, encoder: .json)
        
        request.responseDecodable(of: ForgotPasswordOTPResponseModel.self) { data in
            if data.value?.success == false {
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.status ?? "Unknown Error"
                self.showingAlert = true
            }
            else {
                self.alertTitle = "Success!"
                self.responseMessage = data.value?.status ?? "OTP Sent Successfully."
                self.showingAlert = true
            }
        }
    }
    
    // post forgot password request
    func postForgotPasswordRequest() {
        
        guard let forgotPasswordURL = URL(string: String.forgotPasswordURL()) else {
            print("Forgot Password URL Invalid")
            return
        }
        
        let parameters = ForgotPasswordRequestModel(email: forgotPasswordFromModel.email, newPassword: forgotPasswordFromModel.newPassword, newConfirmPassword: forgotPasswordFromModel.newConfirmPassword, forgotPassOTP: forgotPasswordFromModel.forgotPasswordOTP)
        
        let request = AF.request(forgotPasswordURL, method: .post, parameters: parameters, encoder: .json)
        
        request.responseDecodable(of: ForgotPasswordOTPResponseModel.self) { data in
            if data.value?.success == false {
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.status ?? "Unknown Error"
                self.showingAlert = true
            }
            else {
                self.alertTitle = "Success!"
                self.responseMessage = data.value?.status ?? "Password Updated Successfully."
                self.showingAlert = true
            }
        }
    }
}


struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
