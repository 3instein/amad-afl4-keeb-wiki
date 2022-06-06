//
//  HomeView.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct HomeView: View {
    private var container: CGFloat = 24.0
    @EnvironmentObject var modelData: ModelData
    @State private var query: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            SearchBar()
                .padding(EdgeInsets(top: 0, leading: container, bottom: 0, trailing: container))
            
            NavigationView {
                ZStack {
                    List(modelData.keyboards) { keyboard in
                        NavigationLink {
                            DetailView(keyboard: keyboard)
                        } label: {
                            ItemCard(keyboard: keyboard)
                        }
                    }
                }
                .navigationTitle("Discover Keyboards")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        HomeView()
            .environmentObject(modelData)
    }
}
