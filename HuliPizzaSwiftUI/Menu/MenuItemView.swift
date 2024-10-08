//
//  MenuItemView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct MenuItemView: View {
    
    @State private var addedIem: Bool = false
    @Binding var item: MenuItem
    @State var presentAlert: Bool = false
    @ObservedObject var orders: OrderModel
    @State private var newOrder: Bool = true
    @State private var order = noOrderItem
    
    var body: some View {
        VStack {
            HStack {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                     //Frame dominates - use sparingly as can break things on orientation
                    //.frame(minWidth: 150, maxWidth: 1000,  maxHeight: 300)
          
                if let image = UIImage(named: "\(item.id)_lg"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([ .top, .bottom], 5)
                    //These 2 produce the same effect but clipshape gives you more properties
                    //  .clipShape(RoundedRectangle(cornerRadius:10))
                        .cornerRadius(15)
                    
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180
                                                ))
                }
            }
            .background(.linearGradient(colors: [Color("Surf"),  Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing), in:Capsule())
            // Use shadows after cornerRadius and clipShape
                .shadow(color:.teal, radius: 5, x:10, y:10)
            VStack(alignment: .leading) {
                
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia",size: 18,relativeTo: .body)) //relativeTo helps support dynamic type
                }
                
            }
            Button {
                //Here we dont care about the id
                order = OrderItem(id: -999, item: item)
                presentAlert = true
            } label: { //Label here acts like a HStack
                Spacer()
                Text(item.price, format: .currency(code: "GBP")).bold()
                Image(systemName: addedIem ? "cart.fill.badge.plus" : "cart.badge.plus")
                Spacer()
            }
            .disabled(item.id < 0) //To restrict button action if nothing selected
            .padding()
            .background(.red, in:Capsule())
            .foregroundStyle(.white)
            .padding(5)
            
            //if an alert has an empty closure {} you get a default ok button to dismiss
//            .alert("Buy a \(item.name)", isPresented: $presentAlert) {
//                Button("No", role: .cancel) {}
//                
//                //Alert to buy 1 or 2 pizzas
//                Button("Yes") {
//                    addedIem = true
//                    orders.addOrder(item, quantity: 1)
//                }
//                Button("Make it a double!") {
//                    addedIem = true
//                    orders.addOrder(item, quantity: 2)
//                }
//            }
            
            //Show a fancy sheet to create order, gives more details than just the alert
            .sheet(isPresented: $presentAlert) {
                addedIem = true
            } content: {
                OrderDetailView(orderItem: $order, presentSheet: $presentAlert, newOrder: $newOrder)
            }
            
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
    }
}
