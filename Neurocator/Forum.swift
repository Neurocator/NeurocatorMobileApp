import SwiftUI

struct Forum: View {
    @State private var topics: [ForumTopic] = [
        ForumTopic(title: "Welcome to the Forum", description: "Introduce yourself and meet other members.", replies: 42, views: 1289),
        ForumTopic(title: "General Discussion", description: "Talk about anything related to teaching and learning.", replies: 76, views: 2075),
        ForumTopic(title: "Neurodiversity Resources", description: "Share and find resources related to neurodiversity.", replies: 34, views: 1430),
        ForumTopic(title: "Teaching Strategies", description: "Discuss effective teaching strategies.", replies: 56, views: 1967)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Forum Background") // Ensure this image is in your assets
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Page Title
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Forum")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.black)
                            
                            Text("Engage with the community and share your insights.")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 50)
                        .padding(.horizontal, 24) // Consistent padding for side borders
                        
                        // Forum Topics List
                        VStack(spacing: 20) {
                            ForEach(topics) { topic in
                                ForumTopicView(topic: topic)
                                    .padding(.horizontal, 16) // Consistent padding for side borders
                            }
                        }
                    }
                    .padding(.bottom, 20) // Add padding at the bottom to avoid cutting off the last topic
                }
                .padding(.horizontal, 24) // Ensure the content stays within screen boundaries
                
                // Tab Bar Section
                VStack {
                    Spacer()
                    Navbar() // Use the custom navbar here
                        .padding(.horizontal, 24) // Adjusting navbar padding to match content padding
                }
            }
            .navigationBarHidden(true) // Hides the navigation bar to remove back button
        }
    }
}

// Forum Topic Model
struct ForumTopic: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let replies: Int
    let views: Int
}

// Forum Topic View
struct ForumTopicView: View {
    var topic: ForumTopic
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.98, green: 0.89, blue: 0.91))
            .frame(height: 120)
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Text(topic.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(topic.description)
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("\(topic.replies) replies")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("\(topic.views) views")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            )
            .padding(.horizontal, 8) // Ensures that each topic has a consistent margin
    }
}

struct ForumPage_Previews: PreviewProvider {
    static var previews: some View {
        Forum()
    }
}
