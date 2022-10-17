//
//  CustomSlider.swift
//  Ebike_setting
//
//  Created by user on 2022/10/13.
//

import SwiftUI
// make your observable double for the slider value:
//class SliderValue: ObservableObject {
//    @Published var position: Double = 11.0
//}
//
//
//struct HandySlider: View {
//
//    // don't forget to PASS IN a state object when you make a HandySlider
//    @ObservedObject var sliderValue: SliderValue
//
//    var body: some View {
//        HStack {
//            Text("0")
//            Slider(value: $sliderValue.position, in: 0...20)
//            Text("20")
//        }
//    }
//}


public struct CustomSlider: View {
//    @State private var celsius: Double = 0
    
//    @ObservedObject var viewModel : AddSetUpViewModel
    var cel: Binding<Int32>
    @State var value: Int32 = 0
    var labelset: String = "label"
    var minvalue: Double = 0.0
    var maxvalue: Double = 150.0
    

    
    public var body: some View {
        VStack{
            Text(labelset).font(.caption2).foregroundColor(.gray)
            
            HStack {
                Slider(value: IntDoubleBinding(cel).doubleValue, in: minvalue...maxvalue, step: 1.0)
//                updatevalue()
//                cel = $value
                Text("\(Int32(cel.wrappedValue) ) ")
//                Text("\(Binding<Int32>(projectedValue: value))")
            }
        }
        
        
    }
    
}

struct IntDoubleBinding {
    let intValue : Binding<Int32>
    
    let doubleValue : Binding<Double>
    
    init(_ intValue : Binding<Int32>) {
        self.intValue = intValue
        
        self.doubleValue = Binding<Double>(get: {
            return Double(intValue.wrappedValue)
        }, set: {
            intValue.wrappedValue = Int32($0)
        })
    }
}


