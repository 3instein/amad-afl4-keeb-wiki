//
//  Login.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 30/05/22.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showRegister: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Welcome back,")
            Text("KEEB WORSHIPPER")
                .font(.title)
                .bold()
            
            TextField("Username", text: $username)
                .padding()
                .frame(width: .infinity, height: 50)
                .background(Color.black.opacity(0.05))
                .border(.red, width: CGFloat(wrongUsername))
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: .infinity, height: 50)
                .background(Color.black.opacity(0.05))
                .border(.red, width: CGFloat(wrongPassword))
            Button("Login")
            {
                authenticateUser(username: username, password: password)
            }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0.044, green: 0.107, blue: 0.195))
                    .cornerRadius(10)
            
            Button("New To Keyboard? Join now"){
                
            }
        }
    }
    
    func authenticateUser(username: String, password: String) {
            if username.lowercased() == "admin" {
                wrongUsername = 0
                if password.lowercased() == "root" {
                    wrongPassword = 0
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
