import SwiftUI

struct BookCellView: View {
    let book: Book

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            bookTitle
            bookImage
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }

    private var bookTitle: some View {
        Text(book.title.isEmpty ? "No Title" : book.title)
            .font(.headline)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }

    private var bookImage: some View {
        StandardImageView(imageString: book.image)
            .frame(height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .clipped()
    }
}

#Preview {
    BookCellView(book: .mock)
}
