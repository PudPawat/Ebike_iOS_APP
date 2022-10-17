//
//  LoanCellView.swift
//  LoanTracker
//
//  Created by user on 2022/9/22.
//

import SwiftUI

struct SetUpCellView: View {
    
    let name:String
//    let amount: Double
//    let date: Date
    let descriptionn: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
            }
            Spacer()
            Text(descriptionn)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        
    }
}

struct SetUpCellView_Previews: PreviewProvider {
    static var previews: some View {
        SetUpCellView(name: "test", descriptionn : "test description")
    }
}
