protocol CategoryListViewModel {
    var path: [Category] { get set }
    var categories: [Category] { get set }

    func appendCategory(_ category: Category)
}
