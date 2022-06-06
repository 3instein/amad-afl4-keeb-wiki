//
//  ItemCard.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct ItemCard: View {
    @EnvironmentObject var modelData: ModelData
    var keyboard: Keyboard
    
    var keyboardIndex: Int {
        modelData.keyboards.firstIndex(where: { $0.id == keyboard.id })!
    }
    
    private let pad: CGFloat = 32
    
    var body: some View {
        VStack(alignment: .center) {
            
            HStack {
                Text(keyboard.name)
                    .font(.title3)
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                if keyboard.is_favorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                }
            }
            Divider()
                .background(.black)
                .padding(EdgeInsets(top: 0, leading: pad, bottom: 0, trailing: pad))
            Text(keyboard.designer)
            Image(keyboard.image)
                .resizable()
                .frame(width: 256, height: 128, alignment: .center)
        }.padding()
    }
}

struct ItemCard_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var keyboards = ModelData().keyboards
    
    static var previews: some View {
        Group {
            ItemCard(keyboard: keyboards[0])
                .environmentObject(modelData)
            ItemCard(keyboard: keyboards[1])
                .environmentObject(modelData)
        }
    }
}
