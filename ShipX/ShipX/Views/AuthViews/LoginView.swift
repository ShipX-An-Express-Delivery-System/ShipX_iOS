//
//  LoginView.swift
//  ShipX
//
//  Created by Fahim Rahman on 10/7/22.
//

import SwiftUI
import Alamofire

class loginFormViewModel: ObservableObject {
    @Published var email = String()
    @Published var password = String()
    @Published var role = "sender"
}

struct LoginView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool?
    
    @ObservedObject private var loginFromModel = loginFormViewModel()
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    @State private var forgotPasswordButtonPressed: Bool = false
    
    // view
    var body: some View {
        // zstack
        ZStack {
            Color.customBackground.ignoresSafeArea()
            
            // vstack
            VStack {
                Spacer()
                Image("shipxlogo")
                Spacer()
                
                TextField("Email", text: $loginFromModel.email)
                    .padding()
                
                Divider()
                
                SecureField("Password", text: $loginFromModel.password)
                    .padding()
                
                // hstack
                HStack {
                    Text("Select Role: ")
                        .foregroundColor(.customRed)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                    
                    Picker(selection: $loginFromModel.role, label: Text("Role:")) {
                        Text("Sender").tag("sender")
                        Text("Receiver").tag("receiver")
                        Text("Traveller").tag("traveller")
                    }
                    .pickerStyle(.menu)
                    .padding()
                } //: hstack
                // nav link
                NavigationLink(destination: ForgotPasswordView(), isActive: $forgotPasswordButtonPressed) {
                    // button
                    Button {
                        // action
                        print("Forgot Password Button Pressed")
                        self.forgotPasswordButtonPressed = true
                    } label: {
                        Text("Forgot Password?")
                    } //: button
                    .padding()
                } //: nav link
                // button
                Button {
                    // action
                    print("Login Button Pressed")
                    postLoginRequest()
                } label: {
                    Text("Login")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                        .background(Color.customRed)
                        .cornerRadius(10)
                } //: button
                Spacer()
            } //: vstack
        } //: zstack
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    } //: view
    
    
    // post login data API request
    func postLoginRequest() {
        
        guard let loginURL = URL(string: String.loginURL()) else {
            print("Login URL Invalid")
            return
        }
        
        let parameters = LoginRequestModel(email: loginFromModel.email, password: loginFromModel.password)
        
        let request = AF.request(loginURL, method: .post, parameters: parameters, encoder: .json)
        
        request.responseDecodable(of: LoginResponseModel.self) { data in
            if data.value?.success == false {
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.error ?? data.value?.status ?? "Unknown Error"
                self.showingAlert = true
            }
            else {
                print("Logged In")
                
                // save role, access token and refresh token
                UserDefaults.standard.set(data.value?.accessToken, forKey: "accessToken")
                UserDefaults.standard.set(data.value?.refreshToken, forKey: "refreshToken")
                UserDefaults.standard.set(loginFromModel.role, forKey: "role")
                UserDefaults.standard.set(loginFromModel.email, forKey: "email")
                
                // switch role request
                postSwitchRoleRequest()
            }
        }
    }
    
    
    // post switch role API request
    func postSwitchRoleRequest() {
        
        guard let switchRoleURL = URL(string: String.switchRoleURL()) else {
            print("Switch Role URL Invalid")
            return
        }
        
        let parameters = SwitchRoleRequestModel(role: loginFromModel.role)
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")", "Content-Type": "application/json"]
        
        let request = AF.request(switchRoleURL, method: .post, parameters: parameters, encoder: .json, headers: headers)
        
        request.responseDecodable(of: SwitchRoleResponseModel.self) { data in
            if data.value?.success == true {
                print("Role Updated")
                // navigate to home screen according to role
                print("Navigated to home")
                self.isLoggedIn = true
            }
            else {
                print("Couldn't update the role")
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
