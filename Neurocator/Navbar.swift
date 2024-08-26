import SwiftUI

struct Navbar: View {
    var body: some View {
        HStack {
            VStack {
                Image("NavbarAccountIcon")
                    .resizable()
                    .frame(width: 32, height: 32) // Adjust the size of the icon
                Text("Account")
                    .font(.caption)
                    .foregroundColor(.black) // Ensure text color is visible
            }
            Spacer()
            
            VStack {
                Image("NavbarFAQIcon")
                    .resizable()
                    .frame(width: 32, height: 32) // Adjust the size of the icon
                Text("FAQ")
                    .font(.caption)
                    .foregroundColor(.black) // Ensure text color is visible
            }
            Spacer()
            
            VStack {
                Image("NavbarHomepageIcon")
                    .resizable()
                    .frame(width: 32, height: 32) // Adjust the size of the icon
                Text("Home")
                    .font(.caption)
                    .foregroundColor(.black) // Ensure text color is visible
            }
            Spacer()
            
            VStack {
                Image("NavbarSearchIcon")
                    .resizable()
                    .frame(width: 32, height: 32) // Adjust the size of the icon
                Text("Search")
                    .font(.caption)
                    .foregroundColor(.black) // Ensure text color is visible
            }
            Spacer()
            
            VStack {
                Image("NavbarMoreIcon")
                    .resizable()
                    .frame(width: 32, height: 32) // Adjust the size of the icon
                Text("More")
                    .font(.caption)
                    .foregroundColor(.black) // Ensure text color is visible
            }
        }
        .padding(.horizontal, 30) // Margin on the sides of the tabs
        .padding(.bottom, 20)
        .background(Color.white)
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar()
            .previewLayout(.sizeThatFits) // Preview size
    }
}
