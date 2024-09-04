//
//  OrderView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderView: View {
    //@Binding var orders:[OrderItem]
    
    @ObservedObject var orders:OrderModel
    
    var body: some View {
        VStack {
            ZStack (alignment: .top) {
            
                ScrollView{
                    // ForEach(orders,id:\.id){ order in - need this if not conforming to identifiable in the OrderItem model
                    
                    //Orders is @binding so need the dollar sign
                    ForEach($orders.orderItems ){ order in
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
                }
                .padding()
                .background(.ultraThinMaterial)
                
            }
            .padding()
            Button("Delete Order") {
                if !orders.orderItems.isEmpty {
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
        
        // Dont need to use constant when using ObservedObject
        //OrderView(orders: .constant(testOrders))
        
        OrderView(orders: OrderModel())
    }
}
