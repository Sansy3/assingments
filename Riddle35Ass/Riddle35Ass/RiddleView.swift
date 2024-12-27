import SwiftUI


struct RiddleView: View {
    @ObservedObject var viewModel: RiddleViewModel
    var theme: String

    var body: some View {
        switch theme {
        case "Movies":
            MovieRiddleView(viewModel: viewModel)
        case "Anime":
            AnimeRiddleView(viewModel: viewModel)
        case "Books":
            BookRiddleView(viewModel: viewModel)
        default:
            MovieRiddleView(viewModel: viewModel)
        }
    }
}
