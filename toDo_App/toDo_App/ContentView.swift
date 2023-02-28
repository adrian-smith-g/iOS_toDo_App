//
//  ContentView.swift
//  toDo_App
//
//  Created by Adrian Smith on 2/21/23.
//

import SwiftUI

struct ActivityItem: Identifiable{
    var id = UUID()
    let name: String
    let description: String
    let expirationDate: String
}

var activityList = [
    ActivityItem(name: "CHURCH", description: "SUPER AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
                 expirationDate: "02/03/2023"),
    ActivityItem(name: "B", description: "SUPER B",
                 expirationDate: "02/03/2023")
]

//Cell for each activity
struct activityCell: View{
    var activityItem: ActivityItem
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 3){
            Text(activityItem.name)
                .foregroundColor(.primary)
                .font(.headline)
            HStack(spacing: 3){
                Text(activityItem.description)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                
                Text(activityItem.expirationDate)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }.frame(maxHeight: .infinity)
    }
}

//Main View
struct ContentView: View {
    
    @EnvironmentObject var appInfo: AppInformation
    @State var addNewItemState = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "AmericanTypewriter", size: 26)!]
        
        addNewItemState = checkForNewItems(newItemsToAdd: addNewItemState)
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading){
                    
                    Text("TO-DO APP")
                        .font(.custom("AmericanTypewriter", fixedSize: 26)
                    ).frame(alignment: .top)
                    
                    List(activityList) {item in
                        NavigationLink(destination:
                            EditActivityView(actityName: item.name)){
                            activityCell(activityItem: item)}
                    }
                }
                
                NavigationLink(destination: CreateActivityView(), label: {Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)}
                ).frame(maxHeight: .infinity,
                        alignment: .bottom)
            }
        }
    }
}

class AppInformation: ObservableObject{
    @Published var newItemToAdd = true
}

func checkForNewItems(newItemsToAdd: Bool) -> Bool{
    if newItemsToAdd{
        activityList.append(ActivityItem(name: "a", description: "a", expirationDate: "a"))
    }
    return false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
