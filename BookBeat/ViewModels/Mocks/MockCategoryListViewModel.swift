struct MockCategoryListViewModel: CategoryListViewModel {
    var bookManager: BookManager = MockBookManager()
    var categories: [Category] = Category.mocks
    var path: [Category] = []
    var loadingState: LoadingState

    func appendCategory(_ category: Category) {}
    func loadCategories() async {}
}
