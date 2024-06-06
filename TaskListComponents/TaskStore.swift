//
//  File.swift
//  TaskListComponents
//
//  Created by Lu on 6/5/24.
//
import Foundation

public class TaskStore: ObservableObject {
    @Published public var tasks: [Task] = []
    @Published public var completed: Bool = false
    
    public init() {}

    public func addTask(_ task: Task) {
        tasks.append(task)
        updateCompletionStatus()
    }

    public func removeTask(at index: Int) {
        tasks.remove(at: index)
        updateCompletionStatus()
    }

    public func toggleCompletion(for task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            updateCompletionStatus()
        }
    }
    
    public func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            updateCompletionStatus()
        }
    }

    private func updateCompletionStatus() {
        completed = tasks.allSatisfy { $0.isCompleted }
    }
}

