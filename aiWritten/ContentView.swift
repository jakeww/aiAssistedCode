import SwiftUI


struct ContentView: View {
    // Create a binding for the current page number
    @State private var currentPage = 0
    
    // Create an array of strings for the book pages
    let pages = [
        "Page 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod tellus quis nibh ultricies, eu aliquet purus semper. Fusce ac diam eu ante volutpat posuere.",
        "Page 2: Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer in quam nec nunc placerat condimentum. Etiam vitae tortor fermentum, aliquam velit sit amet, malesuada mi.",
        "Page 3: Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed pulvinar tortor sem, eu laoreet neque lobortis at. Ut ullamcorper placerat luctus.",
        "Page 4: Suspendisse potenti. Morbi lobortis auctor felis, quis vehicula elit sodales a. Vivamus scelerisque ex at est laoreet, vitae hendrerit sem ullamcorper. Integer sit amet tellus finibus, semper metus eu, porta metus."
    ]
    
    var body: some View {
        VStack {
            // Wrap the current page in a ZStack and apply the transition to the entire ZStack
            ZStack {
                Text(pages[currentPage])
                    .padding()
            }
            
            // Create buttons for flipping through the pages
            HStack {
                Button(action: {
                    // Go to the previous page
                    self.currentPage = max(0, self.currentPage - 1)
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                
                Button(action: {
                    // Go to the next page
                    self.currentPage = min(self.pages.count - 1, self.currentPage + 1)
                }) {
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
