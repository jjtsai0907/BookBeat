import Foundation

@Observable
class DefaultCategoryListViewModel: CategoryListViewModel {
    var bookService: BookService

    var categories: [Category]
    
    var path: [Category]

    init(path: [Category] = [], categories: [Category] = Category.mocks, bookService: BookService) {
        self.path = path
        self.categories = categories
        self.bookService = bookService
    }

    func appendCategory(_ category: Category) {
        path.append(category)
    }
}
