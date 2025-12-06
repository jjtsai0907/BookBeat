@MainActor
protocol CategoryListViewModel {
    var path: [Category] { get set }
    var categories: [Category] { get set }
    var bookManager: BookManager { get }

    func appendCategory(_ category: Category)
    func loadCategories() async
}
