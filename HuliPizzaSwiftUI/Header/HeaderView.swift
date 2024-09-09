//
//  HeaderView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var orders: OrderModel
    
    //Use system environment values when dealing with screens sizes
    @Environment(\.verticalSizeClass) var vSizeClass:UserInterfaceSizeClass?
    
    var body: some View {
        VStack {
            if(vSizeClass ?? .regular ) != .compact {
                ZStack(alignment:.bottomTrailing) {
                    Image("surfBanner")
                        .resizable() //Needs to be first
                        .scaledToFit()
                        .ignoresSafeArea()
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 34, relativeTo: .title))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                }
            } else { //Alternative layout in Landscape/compact
                HStack(alignment: .bottom) {
                    //Spacer()
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                   // Spacer()
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 34, relativeTo: .title))
                    .foregroundColor(Color("Surf"))
                    .fontWeight(.heavy)
                   
                }
            
            }
            
            Label{
                Text(orders.orderTotal, format: .currency(code: "GBP"))
            } icon:{
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
                
          }
            Spacer()
        }
        .background(.ultraThinMaterial)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().environmentObject(OrderModel()) //Modifier on the end of HeaderView
            .previewLayout(.sizeThatFits)
    }
}
