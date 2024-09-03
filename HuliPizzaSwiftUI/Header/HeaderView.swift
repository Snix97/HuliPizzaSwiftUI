//
//  HeaderView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            Image("surfBanner")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            Text("Huli Pizza Company")
                .font(.custom("Georgia", size: 34, relativeTo: .title))
               // .foregroundColor(Color("Sky"))
                .foregroundStyle(.regularMaterial)
                .fontWeight(.semibold)
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
