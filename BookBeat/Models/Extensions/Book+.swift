import Foundation

extension Book {
    static let mock = Book(
        id: 1,
        title: "Mock Book 1",
        description: "This is a mock book description.",
        image: "https://prod-bb-images.akamaized.net/book-covers/coverimage-9789180323260-bokfabriken-2025-10-22t12-28.jpg?w=400",
        ebook: true,
        audio: false
    )
    static let mocks = [
        Book(
        id: 2,
        title: "Mock Book 2",
        description: "This is another mock book description.",
        image: "https://prod-bb-images.akamaized.net/book-covers/erimage-9789180980883-wordaudiopublishing-2025-09-02t11-29.jpeg?w=400",
        ebook: true,
        audio: false
        ),
        Book(
            id: 3,
            title: "Mock Book 3",
            description: "This is yet another mock book description.",
            image: "https://prod-bb-images.akamaized.net/book-covers/coverimage-9789180325295-bokfabriken-2025-11-19t10-01.jpg?w=400",
            ebook: true,
            audio: false
        ),
        Book(
            id: 4,
            title: "Mock Book 4",
            description: "This is a fourth mock book description.",
            image: "https://prod-bb-images.akamaized.net/book-covers/coverimage-9789137164618-bokinfo-2025-09-07t13-01.jpg?w=400",
            ebook: true,
            audio: false
        )
    ]
}
