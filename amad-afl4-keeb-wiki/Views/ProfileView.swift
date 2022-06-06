//
//  ProfileView.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image("NotLikeThis")
                .frame(width: 400, height: 400)
                .cornerRadius(48)
            Text("Reynaldi Kindarto")
                .fontWeight(.bold)
                .font(.title2)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
