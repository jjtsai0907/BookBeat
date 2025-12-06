import SwiftUI

struct CategoryListView: View {
    @State var viewModel: CategoryListViewModel

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            content
            .navigationDestination(for: Category.self, destination: { value in
                BookListView(viewModel: DefaultBookListViewModel(category: value))
            })
            .navigationTitle("Books")
        }
        .task {
            await viewModel.loadCategories()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.loadingState {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .loaded:
            if viewModel.categories.isEmpty {
                Text("No categories found.")
            } else {
                List(viewModel.categories, id: \.id) { category in
                    CategoryCellView(category: category) {
                        viewModel.appendCategory(category)
                    }
                }
                .listStyle(.plain)
            }

        case .failed:
            VStack(spacing: 12) {
                Text("Failed to load categories. Please try again later.")
                    .multilineTextAlignment(.center)

                Button("Retry") {
                    Task {
                        await viewModel.loadCategories()
                    }
                }
                .disabled(viewModel.loadingState == .loading ? true : false)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview("Loading") {
    let vm = MockCategoryListViewModel(loadingState: .loading)
    CategoryListView(viewModel: vm)
}

#Preview("Loaded") {
    let vm = MockCategoryListViewModel(loadingState: .loaded)
    CategoryListView(viewModel: vm)
}

#Preview("Loaded Empty") {
    var vm = MockCategoryListViewModel(loadingState: .loaded)
    vm.categories = []
    return CategoryListView(viewModel: vm)
}

#Preview("Failed") {
    let vm = MockCategoryListViewModel(loadingState: .failed)
    CategoryListView(viewModel: vm)
}

