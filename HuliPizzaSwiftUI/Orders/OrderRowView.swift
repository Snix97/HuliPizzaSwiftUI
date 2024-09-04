//
//  OrderRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var body: some View {
        VStack {
            HStack {
                Text(order.item.name)
                Spacer()
            }
            HStack(alignment:.firstTextBaseline) {
                Text(order.quantity, format: .number)
                Text(order.item.price, format: .currency(code: "GBP"))
                Spacer()
                Text(order.extPrice, format: .currency(code: "GBP"))
                    .fontWeight(.semibold)
            }
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: .constant(testOrderItem))
    }
}

