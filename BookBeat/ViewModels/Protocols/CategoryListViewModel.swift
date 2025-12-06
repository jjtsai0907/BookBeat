protocol CategoryListViewModel {
    var path: [Category] { get set }
    var categories: [Category] { get set }
    var bookService: BookService { get }

    func appendCategory(_ category: Category)
}
