import SwiftUI
import UIKit


struct ContentView: View {
    
    // Create a binding for the current page number
    @State private var currentPage = 0
    
    //array of book pages
    let pages = [
        "Page 1: Lorem ipsum",
        "Page 2: Vestibulum ante",
        "Page 3: Pellentesque habitant",
        "Page 4: Suspendisse potenti"
    ]
    
    var body: some View {
        
        VStack {
            Spacer()
            ZStack {
                Text(pages[currentPage])
                    .padding()
                    .font(.system(.title, design: .serif))
                    .foregroundColor(.black)
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        // Perform the appropriate action based on the swipe direction
                        if value.translation.width < 0 {
                            // Go to the next page if not already at the last page
                            if self.currentPage < self.pages.count - 1 {
                                withAnimation(.easeInOut) {
                                    self.currentPage += 1
                                }
                            }
                        } else if value.translation.width > 0 {
                            // Go to the previous page if not already at the first page
                            if self.currentPage > 0 {
                                withAnimation(.easeInOut) {
                                    self.currentPage -= 1
                                }
                            }
                        }
                    }
            )
            
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
            
            //hstack
        }
        .padding(.horizontal, 100.0)
        .ignoresSafeArea(.all)
            .background(Color.white)
            
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
