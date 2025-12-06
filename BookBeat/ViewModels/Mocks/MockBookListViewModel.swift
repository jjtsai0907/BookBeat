import Foundation

struct MockBookListViewModel: BookListViewModel {
    let category: Category = .mock
    var books: [Book] = Book.mocks
    var loadingState: LoadingState = .loaded

    func loadBooks(from urlString: String) async { }
}
