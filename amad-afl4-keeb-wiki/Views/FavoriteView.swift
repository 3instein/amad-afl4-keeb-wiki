//
//  FavoriteView.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct FavoriteView: View {
    private var container: CGFloat = 24.0
        @EnvironmentObject var modelData: ModelData
        @State private var showFavoriteOnly = true
        
        var filteredKeyboards: [Keyboard] {
            modelData.keyboards.filter { keyboard in
                (!showFavoriteOnly || keyboard.is_favorite)
            }
        }
        
        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                SearchBar()
                    .padding(EdgeInsets(top: 0, leading: container, bottom: 0, trailing: container))
                
                NavigationView {
                    ZStack {
                        List {
                            ForEach(filteredKeyboards) { keyboard in
                                NavigationLink {
                                    DetailView(keyboard: keyboard)
                                } label: {
                                    ItemCard(keyboard: keyboard)
                                }
                            }
                        }
                    }
                    .navigationTitle("Favorites")
                }
            }
        }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(ModelData())
    }
}
