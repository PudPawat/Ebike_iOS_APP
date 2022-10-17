//
//  ContentView.swift
//  Ebike_setting
//
//  Created by user on 2022/10/13.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Setupparam.date, ascending: true)],
        animation: .default)
    private var setups: FetchedResults<Setupparam>
    
    @State var isAddLoanShowing = false
    @State var goBluetooth = false
    
//    print(setups)
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(setups) { setup in
                    NavigationLink(destination: ParametersView(viewModel: ParametersViewModel(setupparam:setup))){
                        
                        SetUpCellView(name: setup.name ?? "Name", descriptionn: setup.descriptionn ?? "Description" )
                        //                    }
                    }
//
                    
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("All Setups")
            .navigationBarItems(trailing:
                Button{
                isAddLoanShowing = true
//                addItem()
            }
                label:{
                Image(systemName: "plus.circle").font(.title)
                }
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        goBluetooth = true
                    }label:{
                        Image(systemName: "wifi").font(.title)
                    }
                }
//                ToolbarItem {
//                    Button(action: addItem) {
//
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
            }
            
            Text("Select an item")
        }
        .sheet(isPresented: $isAddLoanShowing) {
            AddSetUpView(viewModel: AddSetUpViewModel(isAddLoanShowing: $isAddLoanShowing))
            }
        .sheet(isPresented: $goBluetooth) {
            BluetoothView()
            }
    }

    private func addItem() {
        withAnimation {
            let newItem = Setupparam(context: viewContext)
            newItem.date = Date()
//            isAddLoanShowing = true  // to go in to add param

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { setups[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
