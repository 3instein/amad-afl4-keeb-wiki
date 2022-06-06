//
//  amad_afl4_keeb_wikiApp.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 24/05/22.
//

import SwiftUI

@main
struct amad_afl4_keeb_wikiApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
