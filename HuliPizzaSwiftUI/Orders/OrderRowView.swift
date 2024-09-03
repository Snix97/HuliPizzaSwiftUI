//
//  OrderRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderRowView: View {
    var order:Int
    var body: some View {
        HStack(alignment:.firstTextBaseline){
            Text("Your Order item \(order)")
            Spacer()
            Text(19.90, format: .currency(code: "GBP"))
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: 1)
    }
}

