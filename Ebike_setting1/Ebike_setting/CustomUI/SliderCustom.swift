//
//  Slider1.swift
//  Ebike_setting
//
//  Created by user on 2022/10/13.
//

import SwiftUI

struct SliderCustom: View {
//    @State private var celsius: Double = 0
    
//    @ObservedObject var viewModel : AddSetUpViewModel
    var cel: Binding<Double>
    var labelset: String = "label"
    var minvalue: Double = 0.0
    var maxvalue: Double = 150.0

    var body: some View {
        VStack{
            Text(labelset).font(.caption2).foregroundColor(.gray)
            
            HStack {
                Slider(value: cel, in: minvalue...maxvalue)
//                Text("\(cel, specifier: "%.1f") ")
            }
            
        }
        
        
    }
    
}
