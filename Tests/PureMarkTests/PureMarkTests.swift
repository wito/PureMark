import XCTest
@testable import PureMark

class PureMarkTests: XCTestCase {

    func testImageRender() {
        let md = "![Deployment Target Dropdown in Xcode](http://i.stack.imgur.com/HSiIL.png)"
        let html = "<img alt=\"Deployment Target Dropdown in Xcode\" src=\"http://i.stack.imgur.com/HSiIL.png\" />"
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testSimpleLinkRender() {
        let md = "[Stack Overflow](https://stackoverflow.com/)"
        let html = "<p><a href=\"https://stackoverflow.com/\">Stack Overflow</a></p>"
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testStyledLinkRender() {
        let md = "[What does `code` do in an *italic* link and not **bold**?](https://stackoverflow.com/)"
        let html = "<p><a href=\"https://stackoverflow.com/\">What does <code>code</code> do in an <em>italic</em> link and not <strong>bold</strong>?</a></p>"
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testParagraph() {
        var md = "If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the General Settings and under Deployment set your Deployment Target:"
        var html = "<p>If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the General Settings and under Deployment set your Deployment Target:</p>"
        XCTAssertEqual(html, md.markdownToHTML!)

        md = """
        Xcode 7.0.1 and iOS 9.1 are incompatible. You will need to update your version of Xcode via the Mac app store.

        If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the General Settings and under Deployment set your Deployment Target:
        """

        html = "<p>Xcode 7.0.1 and iOS 9.1 are incompatible. You will need to update your version of Xcode via the Mac app store.</p><br /><p>If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the General Settings and under Deployment set your Deployment Target:</p>"
        XCTAssertEqual(html, md.markdownToHTML!)

        md = """
        Xcode `7.0.1` and iOS `9.1` are *incompatible*. You will need to **update your version of Xcode** via the Mac app store.

        If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the **General Settings** and under Deployment set your *Deployment Target*:
        """

        html = "<p>Xcode <code>7.0.1</code> and iOS <code>9.1</code> are <em>incompatible</em>. You will need to <strong>update your version of Xcode</strong> via the Mac app store.</p><br /><p>If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the <strong>General Settings</strong> and under Deployment set your <em>Deployment Target</em>:</p>"
        XCTAssertEqual(html, md.markdownToHTML!)

        md = """
        Xcode 7.0.1 and iOS 9.1 are incompatible. You will need to update your version of Xcode via the Mac app store.
        If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the General Settings and under Deployment set your Deployment Target:
        """

        html = "<p>Xcode 7.0.1 and iOS 9.1 are incompatible. You will need to update your version of Xcode via the Mac app store.</p><p>If your iOS version is lower then the Xcode version on the other hand, you can change the deployment target for a lower version of iOS by going to the General Settings and under Deployment set your Deployment Target:</p>"
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testCodeBlock() {
        var md = """
        ```
        class Person {
            let name: String

            init(name: String) {
                self.name = name
            }
        }
        ```
        """

        var html =
        "<pre><code>\n" +
        """
        class Person {
            let name: String

            init(name: String) {
                self.name = name
            }
        }
        """ + "\n</code></pre>"
        XCTAssertEqual(html, md.markdownToHTML!)

        md = """
        ```
        Hello *World*!
        Great day **isn't* it?
        ```
        """

        html =
        "<pre><code>\n" +
        """
        Hello *World*!
        Great day **isn't* it?
        """ + "\n</code></pre>"
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testHeaders() {
        let md = """
        # Header 1
        Plain text goes here
        #### header 4

        HEader2
        -----

        More plain text here
        Another line under it

        Header with a **bold *italic***
        =======

        ### Header 3
        ##### Header 5
        ###### Header 6

        # Header 1
        """

        let html = "<h1>Header 1</h1><p>Plain text goes here</p><h4>header 4</h4><br /><h2>HEader2</h2><br /><p>More plain text here</p><p>Another line under it</p><br /><h1>Header with a <strong>bold <em>italic</em></strong></h1><br /><h3>Header 3</h3><h5>Header 5</h5><h6>Header 6</h6><br /><h1>Header 1</h1>"

        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testSimpleBlockquote() {
        let md = """
        This a a pragraph
        > This is a blockquote.
        > With multiple lines.
        > And a third for good measure
        Paragraph here again
        """

        let html = """
        <p>This a a pragraph</p><blockquote><p>This is a blockquote.</p><p>With multiple lines.</p><p>And a third for good measure</p></blockquote><p>Paragraph here again</p>
        """
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testStyledBlockquote() {
        let md = """
        This a a `pragraph`
        > This *is a* blockquote.
        > `With multiple` lines.
        > And a third **for good measure**
        Paragraph here again
        """

        let html = """
        <p>This a a <code>pragraph</code></p><blockquote><p>This <em>is a</em> blockquote.</p><p><code>With multiple</code> lines.</p><p>And a third <strong>for good measure</strong></p></blockquote><p>Paragraph here again</p>
        """
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testList() {
        let md = """
        Opening paragraph here

        - First item
        - Second *item here*. Next:
        - Another `one`
        - __Bold__ items make a run for it.

        Ordered list blow:

        1. Item number *one*.
        3. Item **number two**
        3. `Last` item in the list.

        * Try another!
        + Does this work?
        """

        let html = "<p>Opening paragraph here</p><br /><ul><li>First item</li><li>Second <em>item here</em>. Next:</li><li>Another <code>one</code></li><li><strong>Bold</strong> items make a run for it.</li></ul><br /><p>Ordered list blow:</p><br /><ol><li>Item number <em>one</em>.</li><li>Item <strong>number two</strong></li><li><code>Last</code> item in the list.</li></ol><br /><ul><li>Try another!</li><li>Does this work?</li></ul>"

        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testHorizontalRule() {
        let md = """
        Paragraph here to start

        ---

        More text
        """

        let html = "<p>Paragraph here to start</p><br /><hr /><br /><p>More text</p>"
        XCTAssertEqual(html, md.markdownToHTML!)
    }

    func testEscape() {
        let md = """
        \\![Stack Overflow](https://stackoverflow.com/)
        \\## H1
        """
        let html = "<p>!<a href=\"https://stackoverflow.com/\">Stack Overflow</a></p><p>#</p><h1>H1</h1>"

        XCTAssertEqual(html, md.markdownToHTML!)
    }
}
