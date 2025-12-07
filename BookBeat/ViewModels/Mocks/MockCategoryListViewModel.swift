class MockCategoryListViewModel: CategoryListViewModel {
    var categories: [Category] = Category.mocks
    var path: [Category] = []
    let loadingState: LoadingState

    func displayBooks(_ category: Category) {}
    func loadCategories() async {}
    func makeBookListViewModel(category: Category) -> BookListViewModel {
        MockBookListViewModel(loadingState: .loaded)
    }
}
