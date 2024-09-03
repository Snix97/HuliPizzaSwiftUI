//
//  ContentView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderListScreen: View {
    
    @State private var orders: [OrderItem] = testOrders
    
    //State shouldn't be changed externally hence add private
    @State private var showOrders: Bool = false
    
    var body: some View {
        
        VStack {
            HeaderView()
                .shadow(radius: 5)
            HStack {
                Text("\(orders.count) Orders")
                Spacer()
                Button{
                    showOrders.toggle()
                } label:{
                    Image(systemName: showOrders ? "cart" : "menucard")
                        .font(.title2)
                }
            }
            .foregroundStyle(.white).font(.title2)
            
            if showOrders {
                //$ sign means var is binding
                OrderView(orders: $orders)
            } else {
                MenuItemView()
                    .padding(5)
                    .background(.thinMaterial, in:RoundedRectangle(cornerRadius: 12))
                MenuView()
            }

            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListScreen()
    }
}
