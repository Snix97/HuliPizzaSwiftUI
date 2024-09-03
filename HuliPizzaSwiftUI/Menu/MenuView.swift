//
//  MenuView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView{
            ForEach(1...25,id:\.self){ item in
                MenuRowView(item: item)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
