//
//  PowerItemView.swift
//  MVVMAndFreeformInput
//
//  Created by xinyu zhang on 2025-02-22.
//

import SwiftUI
 
struct PowerItemView: View {
    
    // MARK: Stored properties
    let power: Power
    
    // MARK: Computed properties
    var body: some View {
        
        HStack {
            // Show the provided base, exponent, and result
            // in an arrangement that looks the same as how
            // we write a power on paper in math class
            HStack(alignment: .center) {
                HStack(alignment: .top) {
                    
                    Text("\(power.base.formatted())")
                        .font(.largeTitle)
                    
                    Text("\(power.exponent)")
                        .font(.title2)
                }
                HStack {
 
                    Text("=")
                        .font(.largeTitle)
 
                    Text("\(power.result.formatted())")
                        .font(.largeTitle)
                }
            }
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            
            Spacer()
        }
        
    }
}
 
#Preview {
    List {
        PowerItemView(power: Power(base: 3, exponent: 2))
        PowerItemView(power: Power(base: 4, exponent: 5))
        PowerItemView(power: Power(base: 6, exponent: 3))
    }
    .listStyle(.plain)
}
