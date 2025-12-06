import SwiftUI

struct BookListView: View {
    @State var viewModel: BookListViewModel
    var body: some View {
        VStack {
            Text(viewModel.category.title)
                .font(.title2)

            switch viewModel.loadingState {
            case .loading:
                ProgressView()
            case .loaded:

                if viewModel.books.isEmpty {
                    Text("No books available in this category.")

                } else {
                    List {
                        ForEach(viewModel.books, id: \.id) { book in
                            BookCellView(book: book)
                        }
                    }
                    .listStyle(.plain)
                }
            case .failed:
                Text("Failed to load books. Please try again later.")
            }
        }
        .task {
            await viewModel.loadBooks(from: viewModel.category.links.books.booksEndpoint)
        }
    }
}

#Preview {
    BookListView(viewModel: MockBookListViewModel())
}
