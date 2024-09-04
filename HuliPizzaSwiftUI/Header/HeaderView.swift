//
//  HeaderView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var orders: OrderModel
    
    var body: some View {
        VStack {
            ZStack(alignment:.bottomTrailing) {
                Image("surfBanner")
                    .resizable() //Needs to be first
                    .scaledToFit()
                    .ignoresSafeArea()
                Text("Huli Pizza Company")
                    .font(.custom("Georgia", size: 34, relativeTo: .title))
                   // .foregroundColor(Color("Sky"))
                    .foregroundStyle(.regularMaterial)
                    .fontWeight(.semibold)
            }
            Label{
                Text(orders.orderTotal, format: .currency(code: "GBP"))
            } icon:{
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
                
          }
            
        }
        .background(.ultraThinMaterial)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().environmentObject(OrderModel()) //Modifier on the end of HeaderView
    }
}
