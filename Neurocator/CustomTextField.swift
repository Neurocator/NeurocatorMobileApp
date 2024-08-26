import SwiftUI

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
