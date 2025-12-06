struct MockBookManager: BookManager {
    let result: Result<[Book], Error>

    func fetchCategories() async throws -> [Category] {
        Category.mocks
    }
    
    func fetchBooks(from urlString: String) async throws -> [Book] {
        try result.get()
    }
}
