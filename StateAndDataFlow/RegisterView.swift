//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                ColorValueTextView(value: name.count, color: name.count > 2
                                   ? Color.green
                                   : Color.red)
            }

            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .opacity(name.count > 2 ? 1 : 0.2)
                    Text("Ok")
                        .opacity(name.count > 2 ? 1 : 0.2)
                    
                }
            }
        }
    }
}

extension RegisterView {
    private func registerUser() {
        user.name = name
        if name.count > 2 {
            user.isRegister.toggle()
            let user = User(name: name)
            StorageManager.shared.save(user: user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
