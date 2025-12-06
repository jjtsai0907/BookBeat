import Foundation

@Observable
final class DefaultCategoryListViewModel: CategoryListViewModel {
    var path: [Category]

    private(set) var loadingState: LoadingState
    private(set) var categories: [Category]

    private let bookManager: BookManager

    init(
        path: [Category] = [],
        categories: [Category] = [],
        bookManager: BookManager,
        loadingState: LoadingState = .loading
    ) {
        self.path = path
        self.categories = categories
        self.bookManager = bookManager
        self.loadingState = loadingState
    }

    func appendCategory(_ category: Category) {
        path.append(category)
    }

    func loadCategories() async {
        loadingState = .loading

        do {
            categories = try await bookManager.fetchCategories()
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }
    }

    func makeBookListViewModel(category: Category) -> BookListViewModel {
        DefaultBookListViewModel(bookManager: bookManager, category: category)
    }
}
