@MainActor
protocol BookListViewModel {
    var category: Category { get }
    var books: [Book] { get }
    var loadingState: LoadingState { get }
    
    func loadBooks(from urlString: String) async
}
