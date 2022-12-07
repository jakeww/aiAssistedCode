import SwiftUI
import QuartzCore

struct ContentView: View {
    // Create a binding for the current page number
    @State private var currentPage = 0

    // Create a state variable to store the rotation angle
    @State private var rotation: Double = 0

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
                Color.white
                
                Text(pages[currentPage])
                    .padding()
                    .font(.system(.title, design: .serif))
                    .foregroundColor(.black)
                    .transition(.opacity) // add a transition
                    .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0)) // apply the 3D rotation
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Calculate the angle of rotation based on the swipe gesture
                                let angle = Double(value.translation.width / 5)
                                
                                // Apply the rotation to the view
                                self.rotation = angle
                            }
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
                                
                                // Reset the rotation angle to 0 when the gesture ends
                                withAnimation(.easeInOut) {
                                    self.rotation = 0
                                }
                            }
                    )



            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
