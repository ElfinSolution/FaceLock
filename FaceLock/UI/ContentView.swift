//
//  ContentView.swift
//  FaceLock
//
//  Created by Harjot Bharti on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var authenticator: Authenticator

    @State var isSuccessDialogHidden: Bool = false

    var body: some View {
        VStack {
            if authenticator.isAuthenticated {
                VStack(spacing: 20) {
                    Text("Login Success")
                        .font(.title)
                        .foregroundStyle(Color.green)
                        .opacity(isSuccessDialogHidden ? 0 : 1)
                        .onAppear {
                            Task{
                                await Task.sleep(seconds: 2)
                                isSuccessDialogHidden = true
                            }
                        }

                    Text("Hey DK Good to see you!")

                    Button("Log Out") {
                        authenticator.logOut()
                    }

                    Button("Reset") {
                        authenticator.onResetPin()
                    }
                }
            }
            else{
                PasscodeView(viewModel: LockScreenViewModel(authenticator: authenticator))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(authenticator: .init())
}
