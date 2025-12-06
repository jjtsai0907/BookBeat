import Foundation

@Observable
class DefaultCategoryListViewModel: CategoryListViewModel {
    var categories: [Category]
    
    var path: [Category]

    init(path: [Category] = [], categories: [Category] = Category.mocks) {
        self.path = path
        self.categories = categories
    }

    func appendCategory(_ category: Category) {
        path.append(category)
    }
}
