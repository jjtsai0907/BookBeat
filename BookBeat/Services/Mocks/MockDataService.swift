struct MockDataService: BookService {
    func fetchCategories() async throws -> [Category] {
        Category.mocks
    }

    func fetchBooks(from urlString: String) async throws -> [Book] {
        Book.mocks
    }
}
