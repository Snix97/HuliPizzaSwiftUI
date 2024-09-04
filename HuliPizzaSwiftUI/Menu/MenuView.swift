//
//  MenuView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct MenuView: View {
    
    var menu: [MenuItem]
    
    var body: some View {
        ScrollView{
            //The id: \.self part is required so that SwiftUI can identify array elements uniquely
            ForEach(menu){ item in
                MenuRowView(item: item)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menu: MenuModel().menu)
    }
}
