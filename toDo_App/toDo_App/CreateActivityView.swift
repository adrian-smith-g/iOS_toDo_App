//
//  CreateActivityView.swift
//  toDo_App
//
//  Created by Adrian Smith on 2/22/23.
//

import SwiftUI

let dateFormatter = DateFormatter()

struct CreateActivityView: View {
    @State private var activityName = ""
    @State private var activityDescription = ""
    @State private var activityDate = ""
    //@State private var time = Date.now
    
    @EnvironmentObject var appInfo: AppInformation
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        //Text(dateFormatter.string(from: time))
        NavigationView{
            ZStack{
                VStack{
                    Text("TO-DO APP")
                        .font(.custom("AmericanTypewriter", fixedSize: 26)
                    ).frame(alignment: .top)
                    
                    TextField(
                        "Activity Name",
                        text: $activityName
                    )
                    
                    TextField(
                        "Activity Dexcription",
                        text: $activityDescription
                    )
                    
                    TextField(
                        "Activity Date",
                        text: $activityDate
                    )
                    
                    Button("Create"){
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct CreateActivityView_Previews: PreviewProvider {
    static var previews: some View {
        CreateActivityView()
    }
}
