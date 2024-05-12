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
    var name = "Trần T. Dũng!"
    var description = "Presently works as an iOS Engineer at CELEBe Korea Co., Ltd. and as a Research Associate at the School of Computer Science & Engineering, International University (VNU-HCMC). I have over 10 years of both practicing and actual experience developing for iOS and macOS. Since I was in sixth grade and iOS still adhered to the skeuomorphic design language, I have been the award recipient of numerous awards from city to national-level events for competitive sport programming, software and hardware development. I also conduct research in the fields of computer vision, computer graphics, augmented reality, applied artificial intelligence and on-device machine learning utilizing mobile applications and other Apple-oriented platforms. Beside the coding work, I am also a proactive graphic, branding, and motion designer."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try PersonalPortfolio()
    .publish(using: [
        .addMarkdownFiles(),
        .copyResources(),
        .generateHTML(withTheme: .theme),
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
