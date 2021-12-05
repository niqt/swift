//
//  BLEManager.swift
//  Blue
//
//  Created by nicola on 16/11/21.
//

import Foundation
import CoreBluetooth

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}


class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    var centralBE: CBCentralManager!
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    var peripheralsId = [UUID]()
    override init() {
            super.init()

        centralBE = CBCentralManager(delegate: self, queue: nil)
        centralBE.delegate = self
        }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
                isSwitchedOn = true
            }
            else {
                isSwitchedOn = false
            }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
        
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
            let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
            if !peripheralsId.contains(peripheral.identifier) {
                peripheralsId.append(peripheral.identifier)
                peripherals.append(newPeripheral)
            }
        }
        else {
            peripheralName = "Unknown"
        }
       
        //let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
        //print(newPeripheral)
        print(peripheralName)
        //peripherals.append(newPeripheral)
    }
    
    func startScanning() {
            print("startScanning")
            centralBE.scanForPeripherals(withServices: nil, options: nil)
        }
    func stopScanning() {
            print("stopScanning")
        centralBE.stopScan()
        }
}


