//
//  MenuRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct MenuRowView: View {
    var item:Int
    var body: some View {
        HStack(alignment:.top,spacing:15) {
            if let image = UIImage(named: "\(item)_sm"){
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
                    .padding(.leading,-15)
            } else {
                Image("surfboard_sm")
            }
            VStack(alignment:.leading) {
                Text("Margherita")
                
            }
            Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(item: 2)
    }
}
