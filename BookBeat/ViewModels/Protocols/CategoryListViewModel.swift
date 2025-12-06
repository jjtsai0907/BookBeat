@MainActor
protocol CategoryListViewModel {
    var path: [Category] { get set }
    var categories: [Category] { get }
    var loadingState: LoadingState { get }

    func appendCategory(_ category: Category)
    func loadCategories() async
}
