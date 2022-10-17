//
//  AddSetUpViewModel.swift
//  Ebike_setting
//
//  Created by user on 2022/10/13.
//
import SwiftUI

final class AddSetUpViewModel: ObservableObject{
    
    @Published var allSetups:[Setupparam] = []
    @Published var isNavigationLinkActive = false
    
    @Published var allPaymentObjects:[PaymentObject] = []
    
    @Published var expectedToFinishOn: String = ""
    
    @Published var selectedSetup: Setupparam? // to edit when tapped it
    
    @Published var name = ""  // default
    @Published var descriptionn = ""
    @Published var torque1: Int32 = 0
    @Published var torque2: Int32  = 0
    @Published var torque3: Int32  = 0
    @Published var torque4: Int32  = 0
    @Published var cadence1: Int32  = 0
    @Published var cadence2: Int32  = 0
    @Published var cadence3: Int32  = 0
    @Published var cadence4: Int32  = 0
    @Published var power1: Int32  = 0
    @Published var power2: Int32  = 0
    @Published var power3: Int32  = 0
    @Published var power4: Int32  = 0
    @Published var startpower1: Int32  = 0
    @Published var startpower2: Int32  = 0
    @Published var startpower3: Int32  = 0
    @Published var startpower4: Int32  = 0
    @Published var startDate = Date()
    @Published var dueDate = Date()
    
    var isAddLoanShowing: Binding<Bool>
    
    init(isAddLoanShowing: Binding<Bool>){
        self.isAddLoanShowing = isAddLoanShowing
    }
    
    func isValidForm() -> Bool {  // -> Bool is return type
//        return name.isEmpty || descriptionn.isEmpty
        return name.isEmpty
    }
    
    func saveLoan() {
        let newLoan = Setupparam(context: PersistenceController.shared.container.viewContext)
        // or
//        let newLoan = Loan(context: PersistenceController.shared.viewContext)
        
        newLoan.descriptionn = descriptionn
        newLoan.name = name
        newLoan.id = UUID().uuidString
//        newLoan.totalAmount = Double(amount) ?? 0.0
//        newLoan.startDate = startDate
        newLoan.torque1 = Int32(torque1 )
//        newLoan.torque1 = torque1
        newLoan.torque2 = Int32(torque2 )
        newLoan.torque3 = Int32(torque3 )
        newLoan.torque4 = Int32(torque4 )
        newLoan.cadence1 = Int32(cadence1)
        newLoan.cadence2 = Int32(cadence2)
        newLoan.cadence3 = Int32(cadence3)
        newLoan.cadence4 = Int32(cadence4)
        newLoan.powerassist1 = Int32(power1)
        newLoan.powerassist2 = Int32(power2)
        newLoan.powerassist3 = Int32(power3)
        newLoan.powerassist4 = Int32(power4)
        newLoan.startpower1 = Int32(startpower1)
        newLoan.startpower2 = Int32(startpower2)
        newLoan.startpower3 = Int32(startpower3)
        newLoan.startpower4 = Int32(startpower4)
        newLoan.date = Date()
        print("save", newLoan.torque1)
        print(torque1)
        
        
        PersistenceController.shared.save()
        print("saved")
    }
}
