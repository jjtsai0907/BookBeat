import Foundation

struct DefaultBookService: BookService {
    private let networkHelper: Networking

    init(networkHelper: Networking = DefaultNetworkHelper(session: .shared, decoder: .init())) {
        self.networkHelper = networkHelper
    }

    func fetchCategories() async throws -> [Category] {
        let categoryResponse = try await networkHelper.request(urlString: Constants.categoriesEndpoint, as: CategoriesResponse.self)

        return categoryResponse.embeddedCategories.categories
    }

    func fetchBooks(from urlString: String) async throws -> [Book] {
        let bookResponse = try await networkHelper.request(urlString: urlString, as: BookResponse.self)

        return bookResponse.embedded.books
    }

    private enum Constants {
        static let categoriesEndpoint = "https://api.bookbeat.com/api/categories"
    }
}
