import Foundation

struct Book: Decodable, Equatable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let ebook: Bool
    let audio: Bool
}

struct BooksResponse: Decodable {
    let title: String
    let description: String
    let embedded: EmbeddedBooks

    enum CodingKeys: String, CodingKey {
        case title, description
        case embedded = "_embedded"
    }
}

struct EmbeddedBooks: Decodable {
    let books: [Book]
}
