struct MockCategoryListViewModel: CategoryListViewModel {
    var bookService: BookService

    var categories: [Category] = Category.mocks
    var path: [Category] = []

    func appendCategory(_ category: Category) {}
}
