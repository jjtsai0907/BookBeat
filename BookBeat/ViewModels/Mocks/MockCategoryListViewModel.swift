struct MockCategoryListViewModel: CategoryListViewModel {
    var bookManager: BookManager

    var categories: [Category] = Category.mocks
    var path: [Category] = []

    func appendCategory(_ category: Category) {}
    func loadCategories() async {}
}
