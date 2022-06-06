//
//  Headline.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct Headline: View {
    var spacing: Float = 18.0
        let headline: String
        let subHeadline: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 4){
            Text(headline)
                .font(.system(.body))
            Text(subHeadline)
                .font(.system(.title))
                .fontWeight(.bold)
                .textCase(.uppercase)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: CGFloat(spacing), trailing: 0))
            }
        }
}

struct Headline_Previews: PreviewProvider {
    let headline: String
    let subHeadline: String
    
    static var previews: some View {
        Headline(headline: "Welcome back,", subHeadline: "KEEB WORSHIPPER")
    }
}
