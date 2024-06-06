//
//  File.swift
//  TaskListComponents
//
//  Created by Lu on 6/5/24.
//
import Combine
import SwiftUI
import FirebaseAuth

public class AuthViewModel: ObservableObject {
    @Published public var username: String = ""
    @Published public var password: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isAuthenticated: Bool = false
    @Published public var alertManager: AlertManager = AlertManager()
    
    public init() {}
    
    public func login() {
        self.isLoading = true
        Auth.auth().signIn(withEmail: self.username, password: self.password) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false
            if let error = error {
                self.isAuthenticated = false
                self.alertManager.alertItem = AlertItem(title: Text("Login Failed"), message: Text(error.localizedDescription))
            } else {
                self.isAuthenticated = true
            }
        }
    }
}

public struct AlertItem: Identifiable {
    public var id = UUID()
    public var title: Text
    public var message: Text
    
    public init(title: Text, message: Text) {
        self.title = title
        self.message = message
    }
}

public class AlertManager: ObservableObject {
    @Published public var alertItem: AlertItem?
    
    public init() {}
}

