import Foundation

struct Category: Hashable, Decodable {
    let id: Int
    let image: String
    let title: String
    let links: CategoryLink

    enum CodingKeys: String, CodingKey {
        case id, image, title
        case links = "_links"
    }
}

struct CategoryLink: Hashable, Decodable {
    let books: BooksEndpoint

    static let mock = CategoryLink(books: BooksEndpoint(booksEndpoint: "https://api.bookbeat.com/api/categories/12/books?offset=0&limit=50"))
}

struct BooksEndpoint: Hashable, Decodable {
    let booksEndpoint: String

    enum CodingKeys: String, CodingKey {
        case booksEndpoint = "href"
    }
}

struct CategoriesResponse: Decodable {
    let embeddedCategories: EmbeddedCategories

    enum CodingKeys: String, CodingKey {
        case embeddedCategories = "_embedded"
    }
}

struct EmbeddedCategories: Decodable {
    let categories: [Category]
}
