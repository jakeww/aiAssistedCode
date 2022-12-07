import SwiftUI

struct ContentView: View {
    // Create a binding for the current page number
    @State private var currentPage = 0
    
    //array of book pages
    let pages = [
        "Page 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod tellus quis nibh ultricies, eu aliquet purus semper. Fusce ac diam eu ante volutpat posuere.",
        "Page 2: Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer in quam nec nunc placerat condimentum. Etiam vitae tortor fermentum, aliquam velit sit amet, malesuada mi.",
        "Page 3: Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed pulvinar tortor sem, eu laoreet neque lobortis at. Ut ullamcorper placerat luctus.",
        "Page 4: Suspendisse potenti. Morbi lobortis auctor felis, quis vehicula elit sod sodales a. Vivamus scelerisque ex at est laoreet, vitae hendrerit sem ullamcorper. Integer sit amet tellus finibus, semper metus eu, porta metus."
    ]
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Text(pages[currentPage])
                    .padding()
                    .font(.system(.title, design: .serif))
                    .foregroundColor(.black)
                    .background(Color.white)
            }
            
            Spacer() // Add a spacer to push the buttons to the bottom of the screen
            
            //buttons for navigating pages
            HStack {
                Button(action: {
                    // Go to the previous page if not already at the first page
                    if self.currentPage > 0 {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.currentPage -= 1
                        }
                    }
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                    .frame(width: 100)
                
                Button(action: {
                    // Go to the next page if not already at the last page
                    if self.currentPage < self.pages.count - 1 {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.currentPage += 1
                        }
                    }
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
