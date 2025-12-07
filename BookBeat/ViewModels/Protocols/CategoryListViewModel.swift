@MainActor
protocol CategoryListViewModel {
    var path: [Category] { get set }
    var categories: [Category] { get }
    var loadingState: LoadingState { get }

    func displayBooks(_ category: Category)
    func loadCategories() async
    func makeBookListViewModel(category: Category) -> BookListViewModel
}
