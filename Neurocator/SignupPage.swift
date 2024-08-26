import SwiftUI

struct SignupPage: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        ZStack {
            Image("Signup Background") // Ensure this image is in your assets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 50) {
                // Top left-aligned title
                HStack {
                    Text("Create Account!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 45)
                        .padding(.top, 60)
                    Spacer()
                }

                Spacer() // Adds space between the title and the input fields

                // Input fields and buttons
                VStack(spacing: 20) {
                    // Email Field
                    CustomTextField(iconName: "envelope", placeholder: "Email", text: $email)

                    // Username Field
                    CustomTextField(iconName: "person", placeholder: "Create Username", text: $username)

                    // Password Field
                    CustomSecureField(iconName: "lock", placeholder: "Password", text: $password)

                    // Confirm Password Field
                    CustomSecureField(iconName: "lock", placeholder: "Confirm Password", text: $confirmPassword)

                    // Sign up button
                    Button(action: {
                        // Handle signup action
                    }) {
                        Text("Sign up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 200) // Adjusted max width for button
                            .background(Color(red: 160/255, green: 205/255, blue: 152/255)) // Green color
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

                    // Log in button
                    NavigationLink(destination: LoginPage().navigationBarHidden(true)) {
                        Text("Log in")
                            .font(.headline)
                            .foregroundColor(Color(red: 160/255, green: 205/255, blue: 152/255)) // Green color
                            .padding()
                            .frame(maxWidth: 200) // Adjusted max width for button
                            .background(Color.white)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(red: 160/255, green: 205/255, blue: 152/255), lineWidth: 2) // Green color
                            )
                    }
                    .padding(.bottom, 20)
                }
                .padding(.top, 20) // Adjusts spacing from title
                .padding()

                Spacer() // Adds space between the form and the bottom edge
            }
            .navigationBarHidden(true) // Hide the navigation bar to remove back button
        }
    }
}

// Custom text field with icon
struct CustomTextField: View {
    var iconName: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
        }
        .padding(10) // Padding inside the container
        .background(Color.white)
        .cornerRadius(8) // Rounded corners
        .shadow(radius: 5)
        .frame(maxWidth: .infinity) // Adjusted max width for fields
        .padding(.horizontal, 30)
    }
}

// Custom secure field with icon
struct CustomSecureField: View {
    var iconName: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            SecureField(placeholder, text: $text)
        }
        .padding(10) // Padding inside the container
        .background(Color.white)
        .cornerRadius(8) // Rounded corners
        .shadow(radius: 5)
        .frame(maxWidth: .infinity) // Adjusted max width for fields
        .padding(.horizontal, 30)
    }
}

// Preview for SignupPage
struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage()
    }
}
