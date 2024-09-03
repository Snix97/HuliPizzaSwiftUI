//
//  OrderView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderView: View {
    var orders:[Int]
    var body: some View {
        VStack {
            Label{
                Text(59.99,format: .currency(code: "GBP"))
            }
            icon:{
                Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")
                
            }
            HStack {
                //If no spacer here text will be centered
                // Spacer() //Makes Leading text
                Text("Order Pizza")
                    .font(.title)
                Spacer()  //Makes trailing text
            }
            ScrollView{
                ForEach(orders,id:\.self){ order in                    OrderRowView(order: order)
                        .padding(.bottom, 5)
                        .padding([.leading, .trailing], 7)
                }
                
            }
            
        }
        .background(Color("Surf"))
        
        }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: [1, 2, 3, 4, 6])
    }
}
