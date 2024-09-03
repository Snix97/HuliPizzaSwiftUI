//
//  MenuItemView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct MenuItemView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Margherita Huli Pizza")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                     //Frame dominates - use sparingly as can break things on orientation
                    //.frame(minWidth: 150, maxWidth: 1000,  maxHeight: 300)
          
                if let image = UIImage(named: "0_lg"){
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
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam fermentum porta est, non maximus libero varius in. Nullam quis risus sed lectus elementum elementum. Nullam sit amet mi vel odio sollicitudin commodo. Mauris fermentum nibh magna, ut blandit velit malesuada quis. Mauris scelerisque dictum mi nec molestie. Vivamus in semper.")
                        .font(.custom("Georgia",size: 18,relativeTo: .body)) //relativeTo helps support dynamic type
                }
                
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView()
    }
}
