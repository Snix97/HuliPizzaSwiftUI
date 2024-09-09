//
//  StatusBarView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 09/09/2024.
//

import SwiftUI

struct StatusBarView: View {
    
    @Binding var showOrders: Bool
    @EnvironmentObject var orders: OrderModel
    
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) Orders")
            Spacer()
            Button{
                showOrders.toggle()
            } label:{
                Image(systemName: showOrders ? "cart" : "menucard")
                    .font(.title2)
            }
            Spacer()
            Label{
                Text(orders.orderTotal, format: .currency(code: "GBP"))
            } icon:{
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
                
          }
        }
        .foregroundStyle(.white)
        .font(.title2)
    }
}

#Preview {
    StatusBarView(showOrders: .constant(false)).environmentObject(OrderModel())
        .previewLayout(.sizeThatFits)
}
