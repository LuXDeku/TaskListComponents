//
//  File.swift
//  TaskListComponents
//
//  Created by Lu on 6/5/24.
//
import Foundation
import UIKit

public struct Task: Identifiable {
    public var id: String = UUID().uuidString
    public var title: String
    public var userId: String
    public var isCompleted: Bool
    public var image: UIImage?
    
    public init(title: String, userId: String, isCompleted: Bool, image: UIImage? = nil) {
        self.title = title
        self.userId = userId
        self.isCompleted = isCompleted
        self.image = image
    }
}

