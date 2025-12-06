import Foundation

struct DefaultBookManager: BookManager {
    private let service: BookService

    init(service: BookService) {
        self.service = service
    }

    func fetchCategories() async throws -> [Category] {
       try await service.fetchCategories()
    }

    func fetchBooks(from urlString: String) async throws -> [Book] {
        try await service.fetchBooks(from: urlString)
    }
}
