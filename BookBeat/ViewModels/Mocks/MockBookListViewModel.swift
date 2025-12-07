import Foundation

struct MockBookListViewModel: BookListViewModel {
    let category: Category = .mock
    var books: [Book] = Book.mocks
    let loadingState: LoadingState

    func loadBooks(from urlString: String) async { }
}
