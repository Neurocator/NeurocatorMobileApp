import SwiftUI

struct LiveAssistance: View {
    var body: some View {
        VStack {
            Spacer()
            Text("In Development")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white) // You can change the background color if needed
        .edgesIgnoringSafeArea(.all)
    }
}

struct LiveAssistance_Previews: PreviewProvider {
    static var previews: some View {
        LiveAssistance()
    }
}
