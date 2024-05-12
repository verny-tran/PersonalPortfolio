import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct PersonalPortfolio: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://verny.com")!
    var name = "Trần T. Dũng"
    var description = "Verny's personal porfolio."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try PersonalPortfolio()
    .publish(using: [
        .addMarkdownFiles(),
        .copyResources(),
        .generateHTML(withTheme: .foundation),
        .generateRSSFeed(including: [.posts]),
        .generateSiteMap(),
        
        // Deployment step
        .unwrap(
            .gitHub(
                "verny-tran/verny-tran.github.io",
                branch: "main",
                useSSH: true
            ), PublishingStep.deploy
        )
    ])
