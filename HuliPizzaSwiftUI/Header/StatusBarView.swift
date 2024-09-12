//
//  StatusBarView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 09/09/2024.
//

import SwiftUI

struct StatusBarView: View {
    
    @Binding var showOrders: Bool
    @Binding var presentGrid: Bool
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
            if !showOrders {
                Button{
                    presentGrid.toggle()
                } label:{
                    Image(systemName: presentGrid ? "square.grid.3x2" : "list.bullet")
                        .font(.title2)
                }
                .padding(.leading, 10)
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
    StatusBarView(showOrders: .constant(false), presentGrid: .constant(true)).environmentObject(OrderModel())
    
    //Added this background to the preview so the StatusBar can be seen
        .background(.black)
}
