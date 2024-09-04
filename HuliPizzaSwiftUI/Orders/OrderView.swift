//
//  OrderView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderView: View {
    @Binding var orders:[OrderItem]
    var body: some View {
        VStack {
            ZStack (alignment: .top) {
            
                ScrollView{
                    // ForEach(orders,id:\.id){ order in - need this if not conforming to identifiable in the OrderItem model
                    
                    //Orders is @binding so need the dollar sign
                    ForEach($orders ){ order in
                        //Text(order.item.name)
                        OrderRowView(order: order)
                            .padding(4)
                            .background(.regularMaterial, in:RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                    }
                    
                }
                .padding(.top, 70)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                        Spacer()
                    Label{
                        Text(59.99,format: .currency(code: "GBP"))
                    }
                    icon:{
                        Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")
                        
                  }
                }
                .padding()
                .background(.ultraThinMaterial)
                
            }
            .padding()
            Button("Delete Order") {
                if !orders.isEmpty {
                    orders.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
       
        
        }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: .constant(testOrders))
    }
}
