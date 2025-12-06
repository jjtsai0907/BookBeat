protocol BookService {
    /// Fetches all categories.
    func fetchCategories() async throws -> [Category]
    /// Fetches books for a given endpoint URL.
    func fetchBooks(from urlString: String) async throws -> [Book]
}
