import SwiftUI

struct CategoryListView: View {
    @State var viewModel: CategoryListViewModel

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            Button("Go to Book List") {
                viewModel.path.append("Book List View")
            }
            .navigationDestination(for: String.self, destination: { _ in
                BookListView()
            })
            .navigationTitle("Books")
        }
    }
}

#Preview {
    let vm = MockCategoryListViewModel()
    CategoryListView(viewModel: vm)
}

