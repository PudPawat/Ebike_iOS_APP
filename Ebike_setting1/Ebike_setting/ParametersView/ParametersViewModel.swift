//
//  ParametersViewModel.swift
//  Ebike_setting
//
//  Created by user on 2022/10/14.
//


import SwiftUI

final class ParametersViewModel: ObservableObject {
    @Published var allparams:[Setupparam] = []
    @Published var isNavigationLinkActive = false
    
    @Published var allPaymentObjects:[PaymentObject] = []
    
    @Published var expectedToFinishOn: String = ""
    
    @Published var selectedPayment: Setupparam? // to edit when tapped it
    
    var setupparam: Setupparam
    
    init(setupparam: Setupparam) {
        self.setupparam = setupparam
        self.fetchAllPayments()
        print(allparams)
        print("loan name", setupparam.name ?? "SETTING")
    }
    
    func fetchAllPayments(){
        allparams = PersistenceController.shared.fetchPayments(for: setupparam.id ?? "")
//        setupparam = PersistenceController.shared.fetchPayments(for: setupparam.id ?? "")
        
    }
    
    func delete(paymentObject: PaymentObject, index: IndexSet) {
        
        guard let indexRow = index.first else {return}
        
        let paymentToDelete = paymentObject.sectionObjects[indexRow] // edit name
        
        PersistenceController.shared.viewContext.delete(paymentToDelete) // edit name 
        PersistenceController.shared.save()
        
        fetchAllPayments() // to reupdate
//        calculateDays()
//        separateByYear()
        
    }
//
//    func totalPaid() -> Double {
////        var totalAmount: Double!
////        for payment in allPayments{
////            totalAmount +=payment.amount
////
////        }
////        return totalAmount
//
////        the code above equal to the line below
//
//        return allPayments.reduce(0) { $0 + $1.amount
//        }
//    }
    
//    func totalLeft() -> Double {
//        return self.loan.totalAmount - totalPaid()
//    }
//
//    func progressValue() -> Double {
//        return totalPaid()/self.loan.totalAmount
//    }
//
//    func calculateDays() {
//        // How much was paid until now
//        let totalPaid = totalPaid()
//
////        let totalDay = Calendar.current.dateComponents([.day], from: loan.startDate ?? Date(), to:loan.dueDate ?? Date()).day!
//
//        let passedDays = Calendar.current.dateComponents([.day], from: loan.startDate ?? Date(), to:Date() ?? Date()).day!
//
//        if passedDays == 0 || totalPaid == 0 {
//            expectedToFinishOn = ""
//            return
//        }
//
//        let didPayPerDay = totalPaid/Double(passedDays)
//
//        let daysLeftToFinish = (loan.totalAmount - totalPaid) / didPayPerDay
//
//        let newDate = Calendar.current.date(byAdding: .day, value: Int(daysLeftToFinish), to: Date())
//
//        guard let newDate = newDate else {
//            expectedToFinishOn = ""
//            return
//        }
//
//        expectedToFinishOn = "Expected to finish by \(newDate.longDate)"
//    }
    
//    func separateByYear() {
//        allPaymentObjects = []
//
//        let dict = Dictionary(grouping: allPayments, by: {$0.date?.dayNumberOfYear})
//
//        for (key, value)in dict{
//            var total = 0.0
//
//            for payment in value{
//                total += payment.amount
//            }
//
//            allPaymentObjects.append(PaymentObject(sectionName: "\(key)", sectionObjects: value, sectionTotal: total))
//        }
//        allPaymentObjects.sorted(by: {$0.sectionName > $1.sectionName})
//    }

}

struct PaymentObject: Equatable{
    var sectionName: String!
    var sectionObjects: [Setupparam]!
    var sectionTotal: Double!
    
    
    
    }
