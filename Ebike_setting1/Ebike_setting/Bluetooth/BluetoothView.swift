//
//  BluetoothView.swift
//  Ebike_setting
//
//  Created by user on 2022/10/17.
//

import SwiftUI

struct BluetoothView: View {
    @ObservedObject private var bluetoothViewModel = BluetoothModel()
    
    var body: some View {
        NavigationView{
            List(bluetoothViewModel.peripheralNames, id:\.self) {
                peripheral in
                Text(peripheral)
            }
            .navigationTitle("Bluetooths")
        }
    }
}

struct BluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothView()
    }
}
