import SwiftUI

struct ToDoList: View {
    @State private var tasks: [ToDoTask] = []
    @State private var newTaskTitle: String = ""
    @State private var showAddTaskView = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                GeometryReader { geometry in
                    Image("To Do Background") // Ensure this image is in your assets
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Task Count
                    Text("\(tasks.filter { !$0.completed }.count) tasks left")
                        .font(.system(size: 24, weight: .bold)) // Increased font size and made it bold
                        .foregroundColor(.black) // Changed text color to black
                        .padding(.top, 30)
                    
                    Spacer(minLength: 20) // Add some space below the tally
                    
                    // Task List
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(tasks) { task in
                            HStack {
                                Button(action: {
                                    toggleTaskCompletion(task)
                                }) {
                                    Image(systemName: task.completed ? "checkmark.square" : "square")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                }
                                Text(task.title)
                                    .font(.system(size: 24)) // Increased task text size
                                    .foregroundColor(.black)
                                    .strikethrough(task.completed)
                                    .padding(.leading, 10)
                            }
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.top, 20)
                    
                    Spacer() // Push the content upwards from the bottom

                    // Add Task Button
                    HStack {
                        Spacer()
                        Button(action: {
                            showAddTaskView.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80) // Increased the size of the plus sign
                                .foregroundColor(.black)
                                .overlay(
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 35, height: 35) // Adjusted the size of the inner plus
                                        .foregroundColor(.white) // Set the inside of the plus sign to white
                                )
                                .padding(.trailing, 40) // Moved the button 20 points to the left
                        }
                    }
                    .padding(.bottom, 20)
                    .sheet(isPresented: $showAddTaskView) {
                        AddTaskView(tasks: $tasks, showAddTaskView: $showAddTaskView)
                    }
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar to remove the back button
            .onAppear {
                loadTasks()
            }
        }
    }

    // Function to toggle task completion
    func toggleTaskCompletion(_ task: ToDoTask) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].completed.toggle()
            saveTasks()
        }
    }

    // Save tasks to UserDefaults
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }

    // Load tasks from UserDefaults
    func loadTasks() {
        if let savedTasks = UserDefaults.standard.data(forKey: "tasks") {
            if let decodedTasks = try? JSONDecoder().decode([ToDoTask].self, from: savedTasks) {
                tasks = decodedTasks
            }
        }
    }
}

// A separate view for adding a new task
struct AddTaskView: View {
    @Binding var tasks: [ToDoTask]
    @Binding var showAddTaskView: Bool
    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new task", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Add Task") {
                    if !newTaskTitle.isEmpty {
                        tasks.append(ToDoTask(title: newTaskTitle))
                        showAddTaskView = false
                        saveTasks()
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)

                Spacer()
            }
            .navigationBarItems(leading: Button("Cancel") {
                showAddTaskView = false
            })
        }
    }

    // Save tasks to UserDefaults when a new task is added
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
}

// Task model without view model
struct ToDoTask: Identifiable, Codable {
    var id = UUID() // Made mutable to avoid decoding issues
    var title: String
    var completed: Bool = false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
