//
//  Register.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 30/05/22.
//

import SwiftUI

struct Register: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Start your journey as")
            Text("KEEB WORSHIPPER")
                .font(.title)
                .bold()
            
            TextField("Email", text: $email)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongUsername))
            
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongUsername))
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongPassword))
            
            Button("Register")
            {
                authenticateUser(username: username, password: password)
            }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0.007, green: 0.466, blue: 0.714))
                    .cornerRadius(10)
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


struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
