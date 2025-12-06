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

    static let mock = Category(
        id: 0,
        image: "https://prod-bb-images.akamaized.net/categories-covers/cat/img_category_12.png?format=png&quality=75&w=450",
        title: "Mock Category",
        links: .mock
    )
    
    static let mocks = [
        Category(
            id: 1,
            image: "https://prod-bb-images.akamaized.net/categories-covers/cat/img_category_12.png?format=png&quality=75&w=450",
            title: "Category 1",
            links: .mock
        ),
        Category(
            id: 2,
            image: "https://prod-bb-images.akamaized.net/categories-covers/cat/img_category_2.png?format=png&quality=75&w=450",
            title: "Category 2",
            links: .mock
        ),
        Category(
            id: 3,
            image: "https://prod-bb-images.akamaized.net/categories-covers/cat/img_category_12.png?format=png&quality=75&w=450",
            title: "Category 3",
            links: .mock
        ),
        Category(
            id: 4,
            image: "image4",
            title: "Category 4",
            links: .mock
        ),
        Category(
            id: 5,
            image: "https://prod-bb-images.akamaized.net/categories-covers/cat/img_category_12.png?format=png&quality=75&w=450",
            title: "Category 5",
            links: .mock
        )
    ]
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
