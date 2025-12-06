import SwiftUI

struct BookCellView: View {
    let book: Book

    private var imageURL: URL? {
        URL(string: book.image)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(book.title.isEmpty ? "No Title" : book.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)

            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .success(let image):
                    imageView(image)
                case .failure:
                    placeholderImage
                case .empty:
                    loadingView
                @unknown default:
                    placeholderImage
                }
            }
            .frame(height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .clipped()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }

    private func imageView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFit()
    }

    private var placeholderImage: some View {
        Image("bookBeatLogo")
            .resizable()
            .scaledToFit()
    }

    private var loadingView: some View {
        ZStack {
            Color(.secondarySystemBackground)
            ProgressView()
        }
    }
}

#Preview {
    BookCellView(book: .mock)
}
