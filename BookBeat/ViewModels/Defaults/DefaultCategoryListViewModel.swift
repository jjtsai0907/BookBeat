import Foundation

@Observable
class DefaultCategoryListViewModel: CategoryListViewModel {
    var bookManager: BookManager
    var categories: [Category]
    var path: [Category]

    private(set) var loadingState: LoadingState

    init(path: [Category] = [], categories: [Category] = Category.mocks, bookManager: BookManager, loadingState: LoadingState = .loading) {
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
}
