//
//  AddSetUpView.swift
//  Ebike_setting
//
//  Created by user on 2022/10/13.
//

import SwiftUI

struct AddSetUpView: View {
    // due to the initialize of AddLoanView so we need to change to ObservedObject
    @ObservedObject var viewModel : AddSetUpViewModel
//    @ObservedObject var viewModle : AddLoanViewModel
    

    
//    @State var name = "Pawat"  // default
//    @State var amount = ""
//    @State var startDate = Date()
//    @State var dueDate = Date()
    var body: some View {
        
        VStack{
            HStack{
                Button{
                    viewModel.isAddLoanShowing.wrappedValue = false
                } label: {
                    Text("Cancel")
                        .font(.title3)
                        .frame(width:80, height: 30)
                }
                Spacer()
                Button{
                    viewModel.saveLoan()
                    viewModel.isAddLoanShowing.wrappedValue = false
                }label: {
                    Text("Done")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 70, height: 30)
                }
                .disabled(viewModel.isValidForm())
            }
            .padding()
            
            Form{
                Group{
                    TextField("Name", text: $viewModel.name)
                        .autocapitalization(.sentences)
                    TextField("Description", text: $viewModel.descriptionn)
                        .autocapitalization(.sentences)
//                    TextField("torque1", text: $viewModel.torque1)
//                        .keyboardType(.numberPad)
//                    TextField("torque2", text: $viewModel.torque2)
//                        .keyboardType(.numberPad)
//                    TextField("torque3", text: $viewModel.torque3)
//                        .keyboardType(.numberPad)
//                    TextField("torque4", text: $viewModel.torque4)
//                        .keyboardType(.numberPad)
//                    TextField("cadence1", text: $viewModel.cadence1)
//                        .keyboardType(.numberPad)
//                    TextField("cadence2", text: $viewModel.cadence2)
//                        .keyboardType(.numberPad)
//                    TextField("cadence3", text: $viewModel.cadence3)
//                        .keyboardType(.numberPad)
//                }
//                Group{
//                    TextField("cadence4", text: $viewModel.cadence4)
//                        .keyboardType(.numberPad)
//                    TextField("power1", text: $viewModel.power1)
//                        .keyboardType(.numberPad)
//                    TextField("power2", text: $viewModel.power2)
//                        .keyboardType(.numberPad)
//                    TextField("power3", text: $viewModel.power3)
//                        .keyboardType(.numberPad)
//                    TextField("power4", text: $viewModel.power4)
//                        .keyboardType(.numberPad)
//                    TextField("startpower1", text: $viewModel.startpower1)
//                        .keyboardType(.numberPad)
//                    TextField("startpower2", text: $viewModel.startpower2)
//                        .keyboardType(.numberPad)
//                    TextField("startpower3", text: $viewModel.startpower3)
//                        .keyboardType(.numberPad)
//                    TextField("startpower4", text: $viewModel.startpower4)
//                        .keyboardType(.numberPad)
                    
//                    Slider(
//                                    value: $celsius,
//                                    in: 100...150,
//                                    step: 1,
//                                    minimumValueLabel: Text("-"),
//                                    maximumValueLabel: Text("+")
//                                ) {}
//                                .buttonStyle(PlainButtonStyle())
//                                .background(Color.clear)
//                                .accentColor(.green)
                }
                Group{
                    Text("Torque Ratio").font(.subheadline)
                    CustomSlider(cel: $viewModel.torque1, labelset: "torque1" )
                    CustomSlider(cel: $viewModel.torque2, labelset: "torque2" )
                    CustomSlider(cel: $viewModel.torque3, labelset: "torque3" )
                    CustomSlider(cel: $viewModel.torque4, labelset: "torque4" )
                }
                Group{
                    Text("Cadence Ratio").font(.subheadline)
                    CustomSlider(cel: $viewModel.cadence1, labelset: "cadence1" )
                    CustomSlider(cel: $viewModel.cadence2, labelset: "cadence2" )
                    CustomSlider(cel: $viewModel.cadence3, labelset: "cadence3" )
                    CustomSlider(cel: $viewModel.cadence4, labelset: "cadence4" )
                }
                Group{
                    Text("Power Ratio").font(.subheadline)
                    CustomSlider(cel: $viewModel.power1, labelset: "power1" )
                    CustomSlider(cel: $viewModel.power2, labelset: "power2" )
                    CustomSlider(cel: $viewModel.power3, labelset: "power3" )
                    CustomSlider(cel: $viewModel.power4, labelset: "power4" )
                }
                Group{
                    Text("Power start").font(.subheadline)
                    CustomSlider(cel: $viewModel.startpower1, labelset: "startpower1" )
                    CustomSlider(cel: $viewModel.startpower2, labelset: "startpower2" )
                    CustomSlider(cel: $viewModel.startpower3, labelset: "startpower3" )
                    CustomSlider(cel: $viewModel.startpower4, labelset: "startpower4" )
                }
                
                
                
                
//                DatePicker("Start Date", selection:$viewModel.startDate, displayedComponents: .date)
//                DatePicker("Due Date", selection:$viewModel.dueDate, displayedComponents: .date)
            }
        }
//        .background(
//            NavigationLink(destination: AddSetUpView(viewModel:AddSetUpViewModel(paymentToEdit: viewModel.selectedPayment,loanId: $viewModel..id ?? "")),isActive: $viewModel.isNavigationLinkActive ){
//                EmptyView()
//            }
//                .hidden()
//        )
//        .onAppear(){
//            viewModel.selectedPayment = nil
//            viewModel.fetchAllPayments()
//            viewModel.calculateDays()
//            viewModel.separateByYear()
//        }
    }
}
//
//struct AddSetUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSetUpView(viewModel: AddSetUpViewModel)
//    }

