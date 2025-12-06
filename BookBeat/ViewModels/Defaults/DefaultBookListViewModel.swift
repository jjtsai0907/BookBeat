import Foundation

@Observable
final class DefaultBookListViewModel: BookListViewModel {
    private(set) var books: [Book]
    private(set) var category: Category
    private(set) var loadingState: LoadingState

    private let bookManager: BookManager

    init(
        bookManager: BookManager,
        books: [Book] = [],
        category: Category,
        loadingState: LoadingState = .loading
    ) {
        self.bookManager = bookManager
        self.books = books
        self.category = category
        self.loadingState = loadingState
    }

    func loadBooks(from urlString: String) async {
        do {
            books = try await bookManager.fetchBooks(from: urlString)
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }
    }
}
