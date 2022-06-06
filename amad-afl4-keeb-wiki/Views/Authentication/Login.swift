//
//  Login.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 30/05/22.
//

import SwiftUI

struct Login: View {
    private let container: Float = 24.0
    private let radius: Float = 4.0
    private let spacing: Float = 18.0
    @State private var showRegister: Bool = false
    @State private var login: Bool = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if showRegister {
            Register()
        } else if login {
            BotNav()
        } else {
            VStack {
                VStack(alignment: .leading, spacing: 6) {
                    Headline(headline: "Welcome back,", subHeadline: "KEEB WORSHIPPER")
                    TextField("Username", text: $username)
                        .padding(.horizontal, CGFloat(spacing))
                        .padding(.vertical, 12)
                        .background(Color("Gray"))
                        .cornerRadius(CGFloat(radius))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: CGFloat(spacing), trailing: 0))
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding(.horizontal, CGFloat(spacing))
                        .padding(.vertical, 12)
                        .background(Color("Gray"))
                        .cornerRadius(CGFloat(radius))
                        .border(.red, width: CGFloat(wrongPassword))
                    Button(action: { authenticateUser(username: username, password: password) }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(Color.white)
                    .background(Color("BaseBlue"))
                    .cornerRadius(CGFloat(radius))
                    .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                    Button(action: { showRegister = true }) {
                        Text("New to keyboard? Join now.")
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
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "admin" {
            wrongUsername = 0
            if password.lowercased() == "root" {
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
