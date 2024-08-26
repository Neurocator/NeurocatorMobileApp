import SwiftUI
import Combine

// Task Model
struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var completed: Bool
}

// ViewModel
class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskTitle: String = ""

    // Initializing with sample tasks
    init() {
        loadTasks()
    }

    func loadTasks() {
        // Here you can load tasks from persistent storage
        tasks = [
            Task(title: "Sample Task 1", completed: false),
            Task(title: "Sample Task 2", completed: true)
        ]
    }

    func addTask() {
        let newTask = Task(title: newTaskTitle, completed: false)
        tasks.append(newTask)
        newTaskTitle = ""
        saveTasks()
    }

    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].completed.toggle()
            saveTasks()
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }

    func saveTasks() {
        // Implement saving to persistent storage
        // You could use UserDefaults, CoreData, etc.
    }
}
