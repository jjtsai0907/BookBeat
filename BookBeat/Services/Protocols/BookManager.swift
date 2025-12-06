protocol BookManager {
    func fetchCategories() async throws -> [Category]
    func fetchBooks(from urlString: String) async throws -> [Book]
}
