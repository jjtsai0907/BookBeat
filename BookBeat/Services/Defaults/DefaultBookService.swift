import Foundation

struct DefaultBookService: BookService {
    private let networkHelper: Networking

    init(networkHelper: Networking) {
        self.networkHelper = networkHelper
    }

    func fetchCategories() async throws -> [Category] {
        let categoriesResponse = try await networkHelper.request(urlString: Constants.categoriesEndpoint, as: CategoriesResponse.self)

        return categoriesResponse.embeddedCategories.categories
    }

    func fetchBooks(from urlString: String) async throws -> [Book] {
        let booksResponse = try await networkHelper.request(urlString: urlString, as: BooksResponse.self)

        return booksResponse.embedded.books
    }

    private enum Constants {
        static let categoriesEndpoint = "https://api.bookbeat.com/api/categories"
    }
}
