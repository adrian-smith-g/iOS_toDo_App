//
//  EditActivityView.swift
//  toDo_App
//
//  Created by Adrian Smith on 2/23/23.
//

import SwiftUI

struct EditActivityView: View {
    var actityName: String
    
    var body: some View {
        Text("Hello, World! I'm " + actityName)
    }
}

struct EditActivityView_Previews: PreviewProvider {
    static var previews: some View {
        EditActivityView(actityName: "hola")
    }
}
