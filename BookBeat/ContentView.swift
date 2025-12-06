import SwiftUI

struct ContentView: View {
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            Button("Go to Book List") {
                path.append("Book List View")
            }
            .navigationDestination(for: String.self, destination: { value in
                BookListView()
            })
            .navigationTitle("Books")
        }
    }
}

#Preview {
    ContentView()
}
