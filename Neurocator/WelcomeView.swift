import SwiftUI

struct WelcomeView: View {
    @State private var animateText = false
    @State private var animateButton = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Welcome Page Background") // Ensure this image is in your assets
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                        .frame(minHeight: 10, idealHeight: 480, maxHeight: 600)
                        .fixedSize()

                    // Title and subtitle with animation
                    VStack(spacing: 10) {
                        Text("Neurocator")
                            .font(.system(size: 45, weight: .bold))
                            .foregroundColor(.black)
                            .scaleEffect(animateText ? 1 : 0.5)
                            .opacity(animateText ? 1 : 0)
                            .animation(.easeOut(duration: 1), value: animateText)
                        
                        Text("Enhance your learning experience!")
                            .font(.system(size: 22.5, weight: .bold))
                            .foregroundColor(.black)
                            .scaleEffect(animateText ? 1 : 0.5)
                            .opacity(animateText ? 1 : 0)
                            .animation(.easeOut(duration: 1).delay(0.5), value: animateText)
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()

                    // Action Button with animation
                    NavigationLink(destination: LoginPage()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(25)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.84, green: 0.65, blue: 0.77))
                            .cornerRadius(55) // Rounded button
                            .padding(.horizontal, 45)
                            .shadow(radius: 5)
                            .scaleEffect(animateButton ? 1 : 0.8)
                            .opacity(animateButton ? 1 : 0)
                            .animation(.easeOut(duration: 0.5).delay(1), value: animateButton)
                            .contentShape(Rectangle()) // Ensures the whole area is tappable
                    }
                    .padding(.bottom, 10)
                    
                    // Register Link with animation
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.black)
                        NavigationLink(destination: SignupPage()) {
                            Text("Register")
                                .underline()
                                .foregroundColor(Color(red: 0.55, green: 0.68, blue: 0.49))
                        }
                    }
                    .font(.footnote)
                    .scaleEffect(animateButton ? 1 : 0.8)
                    .opacity(animateButton ? 1 : 0)
                    .animation(.easeOut(duration: 0.5).delay(1.2), value: animateButton)
                    
                    Spacer(minLength: 50)
                }
                .padding(.bottom, 40) // Increase padding at the bottom
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure VStack fills the available space
            }
            .onAppear {
                animateText = true
                animateButton = true
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
