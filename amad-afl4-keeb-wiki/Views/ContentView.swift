//
//  ContentView.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Login()
    }   
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
