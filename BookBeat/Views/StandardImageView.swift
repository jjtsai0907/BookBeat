import SwiftUI

struct StandardImageView: View {
    let imageString: String

    var body: some View {
        AsyncImage(url: URL(string: imageString)) { phase in
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
    Group {
        StandardImageView(imageString: Book.mock.image)
        StandardImageView(imageString: "https://invalid-url")
        StandardImageView(imageString: "http://10.255.255.1/image.jpg")
    }
}
