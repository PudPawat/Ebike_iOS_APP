//
//  ParameterView.swift
//  Ebike_setting
//
//  Created by user on 2022/10/14.
//

import SwiftUI

struct ParametersView: View {
    
    @ObservedObject var viewModel: ParametersViewModel// cannot init here we have to init in LoanView
//    @State var loanName: String = $viewmodel.loan.name
    
//    viewModel.fetchAllPayments()
    
    var body: some View {
        VStack{
            Form{
                Group{
                    Text("Torque").font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                    CustomSlider(cel: $viewModel.setupparam.torque1, labelset: "torque1")
                    CustomSlider(cel: $viewModel.setupparam.torque2, labelset: "torque2")
                    CustomSlider(cel: $viewModel.setupparam.torque3, labelset: "torque3")
                    CustomSlider(cel: $viewModel.setupparam.torque4, labelset: "torque4")
                }
                Group{
                    Text("Cadence").font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                    CustomSlider(cel: $viewModel.setupparam.cadence1, labelset: "cadence1")
                    CustomSlider(cel: $viewModel.setupparam.cadence2, labelset: "cadence2")
                    CustomSlider(cel: $viewModel.setupparam.cadence3, labelset: "cadence3")
                    CustomSlider(cel: $viewModel.setupparam.cadence4, labelset: "cadence4")
                }
                Group{
                    Text("Power").font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                    CustomSlider(cel: $viewModel.setupparam.powerassist1, labelset: "powerassist1")
                    CustomSlider(cel: $viewModel.setupparam.powerassist2, labelset: "powerassist2")
                    CustomSlider(cel: $viewModel.setupparam.powerassist3, labelset: "powerassist3")
                    CustomSlider(cel: $viewModel.setupparam.powerassist4, labelset: "powerassist4")
                }
                Group{
                    Text("Start power").font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                    CustomSlider(cel: $viewModel.setupparam.startpower1,  labelset: "startpower1")
                    CustomSlider(cel: $viewModel.setupparam.startpower2, labelset: "startpower2")
                    CustomSlider(cel: $viewModel.setupparam.startpower3, labelset: "startpower3")
                    CustomSlider(cel: $viewModel.setupparam.startpower4, labelset: "startpower4")
                }
                
            }.navigationTitle("Setting Parameters")
        }.navigationBarItems(trailing:
                                Button{
                                // upload check connection bluetooth
                            }
                                label:{
//                                    Text("Upload")
                                    Image(systemName: "wifi")
                                })
        .toolbar{
            Button{
                                 // upload to the bike
                             }
                                 label:{
                                     Image(systemName: "arrow.up")
                                 }
        }
        .onAppear(){
            viewModel.selectedPayment = nil
            viewModel.fetchAllPayments()
//            viewModel.calculateDays()
//            viewModel.separateByYear()
        }
    }
}

//struct ParameterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParametersView()
//    }
//}
