struct MockCategoryListViewModel: CategoryListViewModel {
    var categories: [Category] = Category.mocks
    var path: [Category] = []

    func appendCategory(_ category: Category) {}
}
