import Testing
@testable import BookBeat

struct BookBeatTests {
    @Test
    func loadBooks_success_updatesBooksAndState() async throws {
        // Arrange
        let expectedBooks = Book.mocks
        let sut = await DefaultBookListViewModel(
            bookManager: MockBookManager(result: .success(expectedBooks)),
            category: Category.mock
        )

        // Act
        await loadBooks(for: sut)

        // Assert
        await #expect(sut.books == expectedBooks)
        await #expect(sut.loadingState == .loaded)
    }


    @Test
    func loadBooks_failed_updatesBooksAndState() async throws {
        // Arrange
        let expectedBooks: [Book] = []
        let sut = await DefaultBookListViewModel(
            bookManager: MockBookManager(result: .failure(DummyError.failure)),
            category: Category.mock
        )

        // Act
        await loadBooks(for: sut)

        // Assert
        await #expect(sut.books == expectedBooks)
        await #expect(sut.loadingState == .failed)
    }

    private func loadBooks(for sut: DefaultBookListViewModel) async {
        await sut.loadBooks(from: "https://example.com/books.json")
    }

    private enum DummyError: Error { case failure }
}
