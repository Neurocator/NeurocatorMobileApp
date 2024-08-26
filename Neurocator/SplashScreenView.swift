import SwiftUI

struct SplashScreenView: View {
    @State private var showWelcomeView = false
    @State private var appleOffset: CGFloat = 0
    
    var body: some View {
        if showWelcomeView {
            WelcomeView() // Transition to WelcomeView
        } else {
            ZStack {
                Color(red: 240/255, green: 227/255, blue: 206/255) // Cream background
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image("NeurocatorAppIcon") // Ensure this image is in your assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .offset(y: appleOffset)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                appleOffset = -20
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation(.interpolatingSpring(stiffness: 70, damping: 5)) {
                                    appleOffset = 0
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    withAnimation {
                                        showWelcomeView = true
                                    }
                                }
                            }
                        }
                    
                    Text("Neurocator")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.top, 20)
                    
                    Spacer()
                }
            }
        }
    }
}
