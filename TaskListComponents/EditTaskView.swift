//
//  File.swift
//  TaskListComponents
//
//  Created by Lu on 6/5/24.
//
import SwiftUI

public struct EditTaskView: View {
    @EnvironmentObject var taskStore: TaskStore
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    var task: Task
    
    public init(task: Task) {
        self.task = task
    }
    
    public var body: some View {
        Form {
            // Your form content
            Button(action: {
                // Handle action, such as saving updates to the task
                taskStore.updateTask(task)
            }) {
                Text("Update Task")
            }
        }
        .onAppear {
            if let taskImage = task.image {
                self.selectedImage = taskImage
                self.image = Image(uiImage: taskImage)
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: Task(title: "Sample Task", userId: "User1", isCompleted: false))
            .environmentObject(TaskStore())
    }
}

