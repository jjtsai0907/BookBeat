import Foundation

extension Category {
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
