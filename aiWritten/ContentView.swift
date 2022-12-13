import SwiftUI
import QuartzCore

struct ContentView: View {
    
    var myClass = MyClass()
    
    // Create a binding for the current page number
    @State private var currentPage = 0

    // Create a state variable to store the rotation angle
    @State private var rotation: Double = 0
    class MyClass {
      // Define the maximum number of characters per page
      let maxCharactersPerPage = 500

      // Define the text to be broken up into pages
      let text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fermentum sed nunc at blandit. Vestibulum euismod elit ligula, vel tristique enim efficitur eu. Quisque pretium tellus id condimentum blandit. Vivamus imperdiet, mi ut sollicitudin varius, tellus justo consequat velit, et gravida ex mi ut nisl. Sed posuere, ante vel venenatis tempus, mauris tortor gravida orci, quis mollis lacus odio vel tellus. Nam placerat luctus dui vel gravida. Aliquam erat volutpat. Etiam sodales dui vitae nunc tempus, eu egestas massa sodales. Aliquam nunc erat, scelerisque vitae mollis eget, finibus non dolor. Etiam dapibus egestas risus vel ultrices. Maecenas libero erat, hendrerit eu arcu id, accumsan luctus dolor. Ut mauris nisl, iaculis sit amet nibh eget, dapibus luctus risus. Sed posuere risus non mauris suscipit euismod.

Nunc rhoncus euismod nisi. Aenean lobortis a erat quis convallis. Etiam suscipit suscipit semper. Morbi eget venenatis ipsum. Pellentesque accumsan ligula auctor sapien luctus, eu eleifend turpis iaculis. Praesent porttitor eu erat eu scelerisque. Cras a purus vel erat accumsan malesuada sed ut diam. Sed tincidunt, tellus at sollicitudin pulvinar, quam tellus hendrerit orci, non sodales neque nibh et nibh. Etiam pulvinar malesuada sagittis.

Etiam ipsum ligula, tincidunt vitae placerat id, luctus a dui. Etiam id efficitur leo, eget fermentum massa. Cras eget feugiat ante. Proin faucibus lacinia elit id porta. Curabitur vitae massa facilisis, pretium sem vel, eleifend sem. Maecenas eu neque et sapien efficitur viverra. Curabitur et lacus ut purus fringilla semper. Curabitur faucibus dui ac odio ultricies, ac lacinia est suscipit. Nam magna erat, faucibus sit amet dignissim in, ultricies sed elit. Mauris eget ornare arcu. Nunc accumsan, arcu gravida tincidunt ullamcorper, velit erat auctor eros, in mollis purus massa quis diam. Quisque non tempor purus, vel dapibus velit. Pellentesque malesuada, lacus vitae tristique lobortis, arcu orci ultricies magna, id imperdiet mi purus id justo. Proin molestie metus in quam feugiat, at vehicula velit finibus. Sed feugiat mauris ac diam tincidunt efficitur. Praesent sodales facilisis nibh, eget mollis nisi scelerisque nec.
"""

      // Define the 'pages' array
      var pages: [String]

      // Initialize the 'pages' array in the 'init()' method
      init() {
        // Split the text into words
        let words = text.components(separatedBy: " ")

        // Initialize the 'pages' array
        pages = [String]()

        // Initialize a temporary string to store the current page
        var page = ""

        // Loop through the words and add them to the current page
        for word in words {
          // If adding the current word to the page would exceed the maximum number of characters per page,
          // store the current page in the 'pages' array and start a new page
          if page.count + word.count + 1 > maxCharactersPerPage {
            pages.append(page)
            page = ""
          }

          // Add the current word to the current page, followed by a space
          page += "\(word) "
        }

        // Store the last page in the 'pages' array
        pages.append(page)
      }
    }

    var body: some View {
        
        VStack {
            Spacer()
            ZStack {
                Color.white
                Text(myClass.pages[currentPage])
                    .padding()
                    .font(.system(.body, design: .serif))
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
                                    if self.currentPage < self.myClass.pages.count - 1 {
                                        withAnimation(.easeInOut(duration: 0)) {
                                            self.currentPage += 1
                                        }
                                    }
                                } else if value.translation.width > 0 {
                                    // Go to the previous page if not already at the first page
                                    if self.currentPage > 0 {
                                        withAnimation(.easeInOut(duration: 0)) {
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
