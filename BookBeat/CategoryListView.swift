import SwiftUI

struct CategoryListView: View {
    @State var viewModel: CategoryListViewModel

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List(viewModel.categories, id: \.id) { category in
                CategoryCell(category: category) {
                    viewModel.appendCategory(category)
                }
            }
            .listStyle(.plain)
            .navigationDestination(for: Category.self, destination: { _ in
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

