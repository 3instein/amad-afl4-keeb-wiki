//
//  DetailView.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var modelData: ModelData
    var keyboard: Keyboard
    
    var keyboardIndex: Int {
        modelData.keyboards.firstIndex(where: { $0.id == keyboard.id })!
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                VStack {
                    HStack {
                        Text(keyboard.name)
                        FavoriteButton(isSet: $modelData.keyboards[keyboardIndex].is_favorite)
                    }
                    Image(keyboard.image)
                }
                VStack(alignment: .leading) {
                    Text("Specification")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.top)
                    Text("Designer \(keyboard.designer)")
                        .font(.caption)
                        .padding(.top)
                    Text("Layout: \(keyboard.layout)")
                        .font(.caption)
                    Text("Mounting system: \(keyboard.mounting_system)")
                        .font(.caption)
                    Text("Weight: \(keyboard.weight)")
                        .font(.caption)
                    Text("Typing angle: \(keyboard.typing_angle)")
                        .font(.caption)
                    Text("Front height: \(keyboard.front_height)")
                        .font(.caption)
                }
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
        
    static var previews: some View {
        DetailView(keyboard: ModelData().keyboards[0])
            .environmentObject(modelData)
    }
}
