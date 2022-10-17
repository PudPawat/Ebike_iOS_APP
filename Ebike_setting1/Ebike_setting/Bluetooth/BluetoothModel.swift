//
//  BluetoothModel.swift
//  Ebike_setting
//
//  Created by user on 2022/10/17.
//

import SwiftUI
import CoreBluetooth

class BluetoothModel: NSObject, ObservableObject, CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, error: Error?) {
//        <#code#>
//    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? "Unknown device")
        }
    }
    
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    @Published var peripheralNames: [String] = []
    
    override init(){
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
}
