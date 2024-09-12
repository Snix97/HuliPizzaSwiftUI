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
            NavigationStack {
                //Orders is @binding so need the dollar sign
                List{ 
                    ForEach($orders.orderItems ){ $order in
                    NavigationLink(value: order) {
                        OrderRowView(order: $order)
                            .padding(4)
                            .background(.regularMaterial, in:RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                    }.navigationDestination(for: OrderItem.self) { order in
                        OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                    }.navigationTitle("Your order")
                }
                    
                    // Lists don’t take modifiers but ForEach does so include it under List to enable move and delete
                    .onDelete(perform: { indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                    })
                    
                    .onMove{ source, destination in
                        orders.orderItems.move(fromOffsets: source, toOffset: destination)
                    }
                    
                }
                
            }
//            .padding(.top, 70)
//            Button("Delete Order") {
//                if !orders.orderItems.isEmpty {
//                    orders.removeLast()
//                }
//            }
//            .padding(5)
//            .background(.regularMaterial, in: Capsule())
//            .padding(7)
        }
        .background(.regularMaterial)
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Dont need to use constant when using ObservedObject
        //OrderView(orders: .constant(testOrders))
        
        OrderView(orders: OrderModel())
            .previewLayout(.sizeThatFits)
    }
}
