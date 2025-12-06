import Foundation

@Observable
class DefaultCategoryListViewModel: CategoryListViewModel {
    var path: [String]

    init(path: [String] = []) {
        self.path = path
    }
}
