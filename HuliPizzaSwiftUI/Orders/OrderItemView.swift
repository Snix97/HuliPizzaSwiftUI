//
//  OrderItemView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 09/09/2024.
//

import SwiftUI

struct OrderItemView: View {
    
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngredient: Bool = false
    @State private var pizzaCrust: PizzaCrust
    @State private var name: String = ""
    @State private var comments: String = ""
    
    //Views don't usually have init but used here to get pizzacrust data out of the Binding orderItem data we already have.  We want to initialise a value from within the struct and pizzaCrust is a State value
    init(orderItem: Binding<OrderItem>) {
        
        // Need to use _ here to asign to a Binding
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue // The underlying value referenced by the state object
    }
    
    var body: some View {
        //User interactions toggle, stepper and picker
        VStack {
            TextField("Name", text:$name)
                .textFieldStyle(.roundedBorder)
            
            Toggle(isOn: $doubleIngredient) {
                Text("Double Ingredients" + (doubleIngredient ? " Yes" : " No"))}
            Stepper(value:$quantity, in:1...10){
                Text("\(quantity) " + (quantity == 1 ? "pizza" : "pizzas"))
            }
                Picker(selection: $pizzaCrust) {
                    ForEach(PizzaCrust.allCases, id:\.self) { crust in
                        Text(crust.rawValue).tag(crust)
                    }
                } label: {
                    Text("Pizza Crust")
                }
                // Use modifiers here to style out the picker like wheel, segControll, menu etc
                
                // All pizzas have a default crust in MenuItem so want the picker to initially show this OrderItem has a preferred crust - what user chooses
                .pickerStyle(MenuPickerStyle())

                VStack {
                    Text("Comments")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    TextEditor(text: $comments)
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                // Add shadow to help give border to TextEditor
                .shadow(radius: 1)
                Spacer()
                .padding()
            }
        }
        
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
