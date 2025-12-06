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
            .navigationDestination(for: Category.self, destination: { value in
                BookListView(viewModel: DefaultBookListViewModel(category: value))
            })
            .navigationTitle("Books")
        }
        .task {
            await viewModel.loadCategories()
        }
    }
}

#Preview {
    let vm = MockCategoryListViewModel(bookManager: MockBookManager())
    CategoryListView(viewModel: vm)
}

