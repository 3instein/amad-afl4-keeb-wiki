//
//  Register.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 30/05/22.
//

import SwiftUI

struct Register: View {
        private let container: Float = 24.0
        private let radius: Float = 4.0
        private let spacing: Float = 18.0
        @State private var login: Bool = false
        @State private var email: String = ""
        @State private var username: String = ""
        @State private var password: String = ""
        @State private var wrongEmail: Float = 0
        @State private var wrongUsername: Float = 0
        @State private var wrongPassword: Float  = 0
        @State private var isActive = false
        @State private var size = 0.8
        @State private var opacity = 0.5
        
        var body: some View {
            if login {
                Login()
            } else {
                VStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Headline(headline: "Start your journey as", subHeadline: "KEEB WORSHIPPER")
                        TextField("Email", text: $email)
                            .padding(.horizontal, CGFloat(spacing))
                            .padding(.vertical, 12)
                            .background(Color("Gray"))
                            .cornerRadius(CGFloat(radius))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: CGFloat(spacing), trailing: 0))
                            .border(.red, width: CGFloat(wrongEmail))
                        TextField("Username", text: $username)
                            .padding(.horizontal, CGFloat(spacing))
                            .padding(.vertical, 12)
                            .background(Color("Gray"))
                            .cornerRadius(CGFloat(radius))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: CGFloat(spacing), trailing: 0))
                            .border(.red, width: CGFloat(wrongUsername))
                        TextField("Password", text: $password)
                            .padding(.horizontal, CGFloat(spacing))
                            .padding(.vertical, 12)
                            .background(Color("Gray"))
                            .cornerRadius(CGFloat(radius))
                            .border(.red, width: CGFloat(wrongPassword))
                        Button(action: { registerUser(email: email, username: username, password: password) }) {
                            Text("Register")
                                .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .foregroundColor(Color.white)
                        .background(Color("BaseBlue"))
                        .cornerRadius(CGFloat(radius))
                        .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                        Button(action: { login = true }) {
                            Text("Already have an account?")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                                .padding(EdgeInsets(top: CGFloat(spacing), leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: CGFloat(container), bottom: 0, trailing: CGFloat(container)))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    func registerUser(email: String, username: String, password: String) {
        if(email.lowercased() != ""){
            if username.lowercased() != "" {
                wrongUsername = 0
                if password.lowercased() != "" {
                    wrongPassword = 0
                    login = true
                } else {
                    wrongPassword = 2
                }
            } else {
                wrongUsername = 2
            }
        } else {
            wrongEmail = 2
            if username.lowercased() != "" {
                wrongUsername = 0
                if password.lowercased() != "" {
                    wrongPassword = 0
                    login = true
                } else {
                    wrongPassword = 2
                }
            } else {
                wrongUsername = 2
            }
        }
    }
}
struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
