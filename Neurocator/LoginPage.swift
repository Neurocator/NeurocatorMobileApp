import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var animateText = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Login Background") // Ensure this image is in your assets
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    // Top left-aligned title
                    HStack {
                        Text("Welcome To Neurocator!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 45)
                            .padding(.top, 60)
                            .offset(y: animateText ? 0 : -5) // Undulating animation
                            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateText)
                        Spacer()
                    }
                    
                    Spacer() // Adds space between the title and the input fields
                    
                    // Input fields and buttons
                    VStack(spacing: 20) { // Reduced spacing
                        // Email Field
                        CustomTextField(iconName: "envelope", placeholder: "Email", text: $email)

                        // Username Field
                        CustomTextField(iconName: "person", placeholder: "Username", text: $username)

                        // Password Field
                        CustomSecureField(iconName: "lock", placeholder: "Password", text: $password)

                        // Forgot password
                        HStack {
                            Spacer()
                            Button(action: {
                                // Add action for forgot password
                            }) {
                                Text("Forgot password?")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 40) // Adjust padding for alignment
                        }

                        // Log in button wrapped with NavigationLink
                        NavigationLink(destination: HomePage()) {
                            Text("Log in")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 200) // Adjusted max width for button
                                .background(Color(red: 211/255, green: 179/255, blue: 204/255))
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }

                        // Separator
                        HStack {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.5))
                            Text("or")
                                .foregroundColor(.gray)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        .padding(.horizontal, 40)
                        
                        // Sign up button
                        NavigationLink(destination: SignupPage()) {
                            Text("Sign up")
                                .font(.headline)
                                .foregroundColor(Color(red: 211/255, green: 179/255, blue: 204/255))
                                .padding()
                                .frame(maxWidth: 200) // Adjusted max width for button
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(red: 211/255, green: 179/255, blue: 204/255), lineWidth: 2)
                                )
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.top, 40) // Adjusts spacing from title
                    .padding()
                    
                    Spacer() // Adds space between the form and the bottom edge
                }
            }
            .navigationBarHidden(true) // Hides the navigation bar
            .onAppear {
                // Delay the animation start
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    animateText = true
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
