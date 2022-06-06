//
//  ItemCard.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct ItemCard: View {
    private let padd: CGFloat = 32
    var keyboard: Keyboard
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .trailing) {
                if keyboard.is_favorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            
            Text(keyboard.name)
                .font(.title3)
                .fontWeight(.medium)
                .textCase(.uppercase)
                .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
            Divider()
                .background(.black)
                .padding(EdgeInsets(top: 0, leading: padd, bottom: 0, trailing: padd))
            Text(keyboard.designer)
            Image(keyboard.image)
                .resizable()
                .frame(width: 256, height: 128, alignment: .center)
        }
    }
}

struct ItemCard_Previews: PreviewProvider {
    static var keyboards = ModelData().keyboards
    
    static var previews: some View {
        Group {
            ItemCard(keyboard: keyboards[0])
            ItemCard(keyboard: keyboards[1])
        }
    }
}
