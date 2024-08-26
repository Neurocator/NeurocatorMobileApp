import SwiftUI

struct HomePage: View {
    @State private var currentQuote: String = ""
    private var quotesManager = QuotesManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Home Background") // Ensure this image is in your assets
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        // Header Section
                        VStack(alignment: .leading, spacing: 8) { // Align content to the left
                            Text("Neurocator")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.black)
                            
                            Text(currentQuote)
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading) // Align the quote text to the left
                                .fixedSize(horizontal: false, vertical: true)
                                .onAppear {
                                    currentQuote = quotesManager.getRandomQuote()
                                }
                        }
                        .padding(.top, 50)
                        .padding(.horizontal, 40) // Increased padding for larger side borders
                        
                        // Main Content with Rounded Rectangles
                        VStack(spacing: 20) {
                            NavigationLink(destination: ToDoList()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 0.98, green: 0.89, blue: 0.91))
                                    .frame(height: 100)
                                    .overlay(
                                        Text("To-Do List")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    )
                                    .padding(.horizontal, 40) // Increased padding for larger side borders
                            }
                            
                            NavigationLink(destination:  LiveAssistance()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 0.98, green: 0.89, blue: 0.91))
                                    .frame(height: 100)
                                    .overlay(
                                        Text("Live Assistance")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    )
                                    .padding(.horizontal, 40) // Increased padding for larger side borders
                            }
                            
                            NavigationLink(destination: Forum()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 0.98, green: 0.89, blue: 0.91))
                                    .frame(height: 100)
                                    .overlay(
                                        Text("Forum")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    )
                                    .padding(.horizontal, 40) // Increased padding for larger side borders
                            }
                            
                            NavigationLink(destination: Resources()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 0.98, green: 0.89, blue: 0.91))
                                    .frame(height: 100)
                                    .overlay(
                                        Text("Resources")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    )
                                    .padding(.horizontal, 40) // Increased padding for larger side borders
                            }

                            // Additional Boxes
                            NavigationLink(destination: Whiteboard()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 0.98, green: 0.89, blue: 0.91))
                                    .frame(height: 100)
                                    .overlay(
                                        Text("Whiteboard")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    )
                                    .padding(.horizontal, 40) // Increased padding for larger side borders
                            }
                            
                            NavigationLink(destination: FAQ()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 0.98, green: 0.89, blue: 0.91))
                                    .frame(height: 100)
                                    .overlay(
                                        Text("FAQ")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    )
                                    .padding(.horizontal, 40) // Increased padding for larger side borders
                            }
                        }
                        .frame(maxWidth: .infinity) // Center the content horizontally
                        .padding(.top, 20)
                    }
                }

                // Tab Bar Section
                VStack {
                    Spacer()
                    Navbar() // Use the custom navbar here
                }
            }
            .navigationBarHidden(true) // Hides the navigation bar to remove back button
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
