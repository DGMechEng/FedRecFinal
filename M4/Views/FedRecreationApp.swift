//
// Assignment3App.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FedRecreationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
           // UserInputView()
            NavigationView {
              AuthenticatedView {
                Image(systemName: "number.circle.fill")
                  .resizable()
                  .frame(width: 100 , height: 100)
                  .foregroundColor(Color(.systemPink))
                  .aspectRatio(contentMode: .fit)
                  .clipShape(Circle())
                  .clipped()
                  .padding(4)
                  .overlay(Circle().stroke(Color.black, lineWidth: 2))
                Text("Welcome to FedRecApp!")
                  .font(.title)
                Text("You need to be logged in to use this app.")
              } content: {
                UserInputView()
                Spacer()
              }
            }
        }
    }
}
