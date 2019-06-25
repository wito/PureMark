import XCTest
import PureMark

class CommonMarkTests: XCTestCase {

  func testMarkdownFeature0() {
    let markdown = "\tfoo\tbaz\t\tbim\n"
    let html = "<pre><code>foo\tbaz\t\tbim\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature1() {
    let markdown = "  \tfoo\tbaz\t\tbim\n"
    let html = "<pre><code>foo\tbaz\t\tbim\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature2() {
    let markdown = "    a\ta\n    ὐ\ta\n"
    let html = "<pre><code>a\ta\nὐ\ta\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature3() {
    let markdown = "  - foo\n\n\tbar\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature4() {
    let markdown = "- foo\n\n\t\tbar\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<pre><code>  bar\n</code></pre>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature5() {
    let markdown = ">\t\tfoo\n"
    let html = "<blockquote>\n<pre><code>  foo\n</code></pre>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature6() {
    let markdown = "-\t\tfoo\n"
    let html = "<ul>\n<li>\n<pre><code>  foo\n</code></pre>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature7() {
    let markdown = "    foo\n\tbar\n"
    let html = "<pre><code>foo\nbar\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature8() {
    let markdown = " - foo\n   - bar\n\t - baz\n"
    let html = "<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>baz</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature9() {
    let markdown = "#\tFoo\n"
    let html = "<h1>Foo</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature10() {
    let markdown = "*\t*\t*\t\n"
    let html = "<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Tabs
  }

  func testMarkdownFeature11() {
    let markdown = "- `one\n- two`\n"
    let html = "<ul>\n<li>`one</li>\n<li>two`</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Precedence
  }

  func testMarkdownFeature12() {
    let markdown = "***\n---\n___\n"
    let html = "<hr />\n<hr />\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature13() {
    let markdown = "+++\n"
    let html = "<p>+++</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature14() {
    let markdown = "===\n"
    let html = "<p>===</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature15() {
    let markdown = "--\n**\n__\n"
    let html = "<p>--\n**\n__</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature16() {
    let markdown = " ***\n  ***\n   ***\n"
    let html = "<hr />\n<hr />\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature17() {
    let markdown = "    ***\n"
    let html = "<pre><code>***\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature18() {
    let markdown = "Foo\n    ***\n"
    let html = "<p>Foo\n***</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature19() {
    let markdown = "_____________________________________\n"
    let html = "<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature20() {
    let markdown = " - - -\n"
    let html = "<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature21() {
    let markdown = " **  * ** * ** * **\n"
    let html = "<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature22() {
    let markdown = "-     -      -      -\n"
    let html = "<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature23() {
    let markdown = "- - - -    \n"
    let html = "<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature24() {
    let markdown = "_ _ _ _ a\n\na------\n\n---a---\n"
    let html = "<p>_ _ _ _ a</p>\n<p>a------</p>\n<p>---a---</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature25() {
    let markdown = " *-*\n"
    let html = "<p><em>-</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature26() {
    let markdown = "- foo\n***\n- bar\n"
    let html = "<ul>\n<li>foo</li>\n</ul>\n<hr />\n<ul>\n<li>bar</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature27() {
    let markdown = "Foo\n***\nbar\n"
    let html = "<p>Foo</p>\n<hr />\n<p>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature28() {
    let markdown = "Foo\n---\nbar\n"
    let html = "<h2>Foo</h2>\n<p>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature29() {
    let markdown = "* Foo\n* * *\n* Bar\n"
    let html = "<ul>\n<li>Foo</li>\n</ul>\n<hr />\n<ul>\n<li>Bar</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature30() {
    let markdown = "- Foo\n- * * *\n"
    let html = "<ul>\n<li>Foo</li>\n<li>\n<hr />\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Thematic breaks
  }

  func testMarkdownFeature31() {
    let markdown = "# foo\n## foo\n### foo\n#### foo\n##### foo\n###### foo\n"
    let html = "<h1>foo</h1>\n<h2>foo</h2>\n<h3>foo</h3>\n<h4>foo</h4>\n<h5>foo</h5>\n<h6>foo</h6>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature32() {
    let markdown = "####### foo\n"
    let html = "<p>####### foo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature33() {
    let markdown = "#5 bolt\n\n#hashtag\n"
    let html = "<p>#5 bolt</p>\n<p>#hashtag</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature34() {
    let markdown = "\\## foo\n"
    let html = "<p>## foo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature35() {
    let markdown = "# foo *bar* \\*baz\\*\n"
    let html = "<h1>foo <em>bar</em> *baz*</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature36() {
    let markdown = "#                  foo                     \n"
    let html = "<h1>foo</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature37() {
    let markdown = " ### foo\n  ## foo\n   # foo\n"
    let html = "<h3>foo</h3>\n<h2>foo</h2>\n<h1>foo</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature38() {
    let markdown = "    # foo\n"
    let html = "<pre><code># foo\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature39() {
    let markdown = "foo\n    # bar\n"
    let html = "<p>foo\n# bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature40() {
    let markdown = "## foo ##\n  ###   bar    ###\n"
    let html = "<h2>foo</h2>\n<h3>bar</h3>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature41() {
    let markdown = "# foo ##################################\n##### foo ##\n"
    let html = "<h1>foo</h1>\n<h5>foo</h5>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature42() {
    let markdown = "### foo ###     \n"
    let html = "<h3>foo</h3>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature43() {
    let markdown = "### foo ### b\n"
    let html = "<h3>foo ### b</h3>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature44() {
    let markdown = "# foo#\n"
    let html = "<h1>foo#</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature45() {
    let markdown = "### foo \\###\n## foo #\\##\n# foo \\#\n"
    let html = "<h3>foo ###</h3>\n<h2>foo ###</h2>\n<h1>foo #</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature46() {
    let markdown = "****\n## foo\n****\n"
    let html = "<hr />\n<h2>foo</h2>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature47() {
    let markdown = "Foo bar\n# baz\nBar foo\n"
    let html = "<p>Foo bar</p>\n<h1>baz</h1>\n<p>Bar foo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature48() {
    let markdown = "## \n#\n### ###\n"
    let html = "<h2></h2>\n<h1></h1>\n<h3></h3>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// ATX headings
  }

  func testMarkdownFeature49() {
    let markdown = "Foo *bar*\n=========\n\nFoo *bar*\n---------\n"
    let html = "<h1>Foo <em>bar</em></h1>\n<h2>Foo <em>bar</em></h2>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature50() {
    let markdown = "Foo *bar\nbaz*\n====\n"
    let html = "<h1>Foo <em>bar\nbaz</em></h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature51() {
    let markdown = "  Foo *bar\nbaz*\t\n====\n"
    let html = "<h1>Foo <em>bar\nbaz</em></h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature52() {
    let markdown = "Foo\n-------------------------\n\nFoo\n=\n"
    let html = "<h2>Foo</h2>\n<h1>Foo</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature53() {
    let markdown = "   Foo\n---\n\n  Foo\n-----\n\n  Foo\n  ===\n"
    let html = "<h2>Foo</h2>\n<h2>Foo</h2>\n<h1>Foo</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature54() {
    let markdown = "    Foo\n    ---\n\n    Foo\n---\n"
    let html = "<pre><code>Foo\n---\n\nFoo\n</code></pre>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature55() {
    let markdown = "Foo\n   ----      \n"
    let html = "<h2>Foo</h2>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature56() {
    let markdown = "Foo\n    ---\n"
    let html = "<p>Foo\n---</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature57() {
    let markdown = "Foo\n= =\n\nFoo\n--- -\n"
    let html = "<p>Foo\n= =</p>\n<p>Foo</p>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature58() {
    let markdown = "Foo  \n-----\n"
    let html = "<h2>Foo</h2>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature59() {
    let markdown = "Foo\\\n----\n"
    let html = "<h2>Foo\\</h2>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature60() {
    let markdown = "`Foo\n----\n`\n\n<a title=\"a lot\n---\nof dashes\"/>\n"
    let html = "<h2>`Foo</h2>\n<p>`</p>\n<h2>&lt;a title=&quot;a lot</h2>\n<p>of dashes&quot;/&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature61() {
    let markdown = "> Foo\n---\n"
    let html = "<blockquote>\n<p>Foo</p>\n</blockquote>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature62() {
    let markdown = "> foo\nbar\n===\n"
    let html = "<blockquote>\n<p>foo\nbar\n===</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature63() {
    let markdown = "- Foo\n---\n"
    let html = "<ul>\n<li>Foo</li>\n</ul>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature64() {
    let markdown = "Foo\nBar\n---\n"
    let html = "<h2>Foo\nBar</h2>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature65() {
    let markdown = "---\nFoo\n---\nBar\n---\nBaz\n"
    let html = "<hr />\n<h2>Foo</h2>\n<h2>Bar</h2>\n<p>Baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature66() {
    let markdown = "\n====\n"
    let html = "<p>====</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature67() {
    let markdown = "---\n---\n"
    let html = "<hr />\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature68() {
    let markdown = "- foo\n-----\n"
    let html = "<ul>\n<li>foo</li>\n</ul>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature69() {
    let markdown = "    foo\n---\n"
    let html = "<pre><code>foo\n</code></pre>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature70() {
    let markdown = "> foo\n-----\n"
    let html = "<blockquote>\n<p>foo</p>\n</blockquote>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature71() {
    let markdown = "\\> foo\n------\n"
    let html = "<h2>&gt; foo</h2>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature72() {
    let markdown = "Foo\n\nbar\n---\nbaz\n"
    let html = "<p>Foo</p>\n<h2>bar</h2>\n<p>baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature73() {
    let markdown = "Foo\nbar\n\n---\n\nbaz\n"
    let html = "<p>Foo\nbar</p>\n<hr />\n<p>baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature74() {
    let markdown = "Foo\nbar\n* * *\nbaz\n"
    let html = "<p>Foo\nbar</p>\n<hr />\n<p>baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature75() {
    let markdown = "Foo\nbar\n\\---\nbaz\n"
    let html = "<p>Foo\nbar\n---\nbaz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Setext headings
  }

  func testMarkdownFeature76() {
    let markdown = "    a simple\n      indented code block\n"
    let html = "<pre><code>a simple\n  indented code block\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature77() {
    let markdown = "  - foo\n\n    bar\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature78() {
    let markdown = "1.  foo\n\n    - bar\n"
    let html = "<ol>\n<li>\n<p>foo</p>\n<ul>\n<li>bar</li>\n</ul>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature79() {
    let markdown = "    <a/>\n    *hi*\n\n    - one\n"
    let html = "<pre><code>&lt;a/&gt;\n*hi*\n\n- one\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature80() {
    let markdown = "    chunk1\n\n    chunk2\n  \n \n \n    chunk3\n"
    let html = "<pre><code>chunk1\n\nchunk2\n\n\n\nchunk3\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature81() {
    let markdown = "    chunk1\n      \n      chunk2\n"
    let html = "<pre><code>chunk1\n  \n  chunk2\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature82() {
    let markdown = "Foo\n    bar\n\n"
    let html = "<p>Foo\nbar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature83() {
    let markdown = "    foo\nbar\n"
    let html = "<pre><code>foo\n</code></pre>\n<p>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature84() {
    let markdown = "# Heading\n    foo\nHeading\n------\n    foo\n----\n"
    let html = "<h1>Heading</h1>\n<pre><code>foo\n</code></pre>\n<h2>Heading</h2>\n<pre><code>foo\n</code></pre>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature85() {
    let markdown = "        foo\n    bar\n"
    let html = "<pre><code>    foo\nbar\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature86() {
    let markdown = "\n    \n    foo\n    \n\n"
    let html = "<pre><code>foo\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature87() {
    let markdown = "    foo  \n"
    let html = "<pre><code>foo  \n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Indented code blocks
  }

  func testMarkdownFeature88() {
    let markdown = "```\n<\n >\n```\n"
    let html = "<pre><code>&lt;\n &gt;\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature89() {
    let markdown = "~~~\n<\n >\n~~~\n"
    let html = "<pre><code>&lt;\n &gt;\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature90() {
    let markdown = "``\nfoo\n``\n"
    let html = "<p><code>foo</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature91() {
    let markdown = "```\naaa\n~~~\n```\n"
    let html = "<pre><code>aaa\n~~~\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature92() {
    let markdown = "~~~\naaa\n```\n~~~\n"
    let html = "<pre><code>aaa\n```\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature93() {
    let markdown = "````\naaa\n```\n``````\n"
    let html = "<pre><code>aaa\n```\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature94() {
    let markdown = "~~~~\naaa\n~~~\n~~~~\n"
    let html = "<pre><code>aaa\n~~~\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature95() {
    let markdown = "```\n"
    let html = "<pre><code></code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature96() {
    let markdown = "`````\n\n```\naaa\n"
    let html = "<pre><code>\n```\naaa\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature97() {
    let markdown = "> ```\n> aaa\n\nbbb\n"
    let html = "<blockquote>\n<pre><code>aaa\n</code></pre>\n</blockquote>\n<p>bbb</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature98() {
    let markdown = "```\n\n  \n```\n"
    let html = "<pre><code>\n  \n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature99() {
    let markdown = "```\n```\n"
    let html = "<pre><code></code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature100() {
    let markdown = " ```\n aaa\naaa\n```\n"
    let html = "<pre><code>aaa\naaa\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature101() {
    let markdown = "  ```\naaa\n  aaa\naaa\n  ```\n"
    let html = "<pre><code>aaa\naaa\naaa\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature102() {
    let markdown = "   ```\n   aaa\n    aaa\n  aaa\n   ```\n"
    let html = "<pre><code>aaa\n aaa\naaa\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature103() {
    let markdown = "    ```\n    aaa\n    ```\n"
    let html = "<pre><code>```\naaa\n```\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature104() {
    let markdown = "```\naaa\n  ```\n"
    let html = "<pre><code>aaa\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature105() {
    let markdown = "   ```\naaa\n  ```\n"
    let html = "<pre><code>aaa\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature106() {
    let markdown = "```\naaa\n    ```\n"
    let html = "<pre><code>aaa\n    ```\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature107() {
    let markdown = "``` ```\naaa\n"
    let html = "<p><code> </code>\naaa</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature108() {
    let markdown = "~~~~~~\naaa\n~~~ ~~\n"
    let html = "<pre><code>aaa\n~~~ ~~\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature109() {
    let markdown = "foo\n```\nbar\n```\nbaz\n"
    let html = "<p>foo</p>\n<pre><code>bar\n</code></pre>\n<p>baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature110() {
    let markdown = "foo\n---\n~~~\nbar\n~~~\n# baz\n"
    let html = "<h2>foo</h2>\n<pre><code>bar\n</code></pre>\n<h1>baz</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature111() {
    let markdown = "```ruby\ndef foo(x)\n  return 3\nend\n```\n"
    let html = "<pre><code class=\"language-ruby\">def foo(x)\n  return 3\nend\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature112() {
    let markdown = "~~~~    ruby startline=3 $%@#$\ndef foo(x)\n  return 3\nend\n~~~~~~~\n"
    let html = "<pre><code class=\"language-ruby\">def foo(x)\n  return 3\nend\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature113() {
    let markdown = "````;\n````\n"
    let html = "<pre><code class=\"language-;\"></code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature114() {
    let markdown = "``` aa ```\nfoo\n"
    let html = "<p><code>aa</code>\nfoo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature115() {
    let markdown = "~~~ aa ``` ~~~\nfoo\n~~~\n"
    let html = "<pre><code class=\"language-aa\">foo\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature116() {
    let markdown = "```\n``` aaa\n```\n"
    let html = "<pre><code>``` aaa\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Fenced code blocks
  }

  func testMarkdownFeature117() {
    let markdown = "<table><tr><td>\n<pre>\n**Hello**,\n\n_world_.\n</pre>\n</td></tr></table>\n"
    let html = "<table><tr><td>\n<pre>\n**Hello**,\n<p><em>world</em>.\n</pre></p>\n</td></tr></table>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature118() {
    let markdown = "<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n\nokay.\n"
    let html = "<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n<p>okay.</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature119() {
    let markdown = " <div>\n  *hello*\n         <foo><a>\n"
    let html = " <div>\n  *hello*\n         <foo><a>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature120() {
    let markdown = "</div>\n*foo*\n"
    let html = "</div>\n*foo*\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature121() {
    let markdown = "<DIV CLASS=\"foo\">\n\n*Markdown*\n\n</DIV>\n"
    let html = "<DIV CLASS=\"foo\">\n<p><em>Markdown</em></p>\n</DIV>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature122() {
    let markdown = "<div id=\"foo\"\n  class=\"bar\">\n</div>\n"
    let html = "<div id=\"foo\"\n  class=\"bar\">\n</div>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature123() {
    let markdown = "<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n"
    let html = "<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature124() {
    let markdown = "<div>\n*foo*\n\n*bar*\n"
    let html = "<div>\n*foo*\n<p><em>bar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature125() {
    let markdown = "<div id=\"foo\"\n*hi*\n"
    let html = "<div id=\"foo\"\n*hi*\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature126() {
    let markdown = "<div class\nfoo\n"
    let html = "<div class\nfoo\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature127() {
    let markdown = "<div *???-&&&-<---\n*foo*\n"
    let html = "<div *???-&&&-<---\n*foo*\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature128() {
    let markdown = "<div><a href=\"bar\">*foo*</a></div>\n"
    let html = "<div><a href=\"bar\">*foo*</a></div>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature129() {
    let markdown = "<table><tr><td>\nfoo\n</td></tr></table>\n"
    let html = "<table><tr><td>\nfoo\n</td></tr></table>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature130() {
    let markdown = "<div></div>\n``` c\nint x = 33;\n```\n"
    let html = "<div></div>\n``` c\nint x = 33;\n```\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature131() {
    let markdown = "<a href=\"foo\">\n*bar*\n</a>\n"
    let html = "<a href=\"foo\">\n*bar*\n</a>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature132() {
    let markdown = "<Warning>\n*bar*\n</Warning>\n"
    let html = "<Warning>\n*bar*\n</Warning>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature133() {
    let markdown = "<i class=\"foo\">\n*bar*\n</i>\n"
    let html = "<i class=\"foo\">\n*bar*\n</i>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature134() {
    let markdown = "</ins>\n*bar*\n"
    let html = "</ins>\n*bar*\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature135() {
    let markdown = "<del>\n*foo*\n</del>\n"
    let html = "<del>\n*foo*\n</del>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature136() {
    let markdown = "<del>\n\n*foo*\n\n</del>\n"
    let html = "<del>\n<p><em>foo</em></p>\n</del>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature137() {
    let markdown = "<del>*foo*</del>\n"
    let html = "<p><del><em>foo</em></del></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature138() {
    let markdown = "<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\nokay\n"
    let html = "<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\n<p>okay</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature139() {
    let markdown = "<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\nokay\n"
    let html = "<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\n<p>okay</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature140() {
    let markdown = "<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\nokay\n"
    let html = "<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\n<p>okay</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature141() {
    let markdown = "<style\n  type=\"text/css\">\n\nfoo\n"
    let html = "<style\n  type=\"text/css\">\n\nfoo\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature142() {
    let markdown = "> <div>\n> foo\n\nbar\n"
    let html = "<blockquote>\n<div>\nfoo\n</blockquote>\n<p>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature143() {
    let markdown = "- <div>\n- foo\n"
    let html = "<ul>\n<li>\n<div>\n</li>\n<li>foo</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature144() {
    let markdown = "<style>p{color:red;}</style>\n*foo*\n"
    let html = "<style>p{color:red;}</style>\n<p><em>foo</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature145() {
    let markdown = "<!-- foo -->*bar*\n*baz*\n"
    let html = "<!-- foo -->*bar*\n<p><em>baz</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature146() {
    let markdown = "<script>\nfoo\n</script>1. *bar*\n"
    let html = "<script>\nfoo\n</script>1. *bar*\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature147() {
    let markdown = "<!-- Foo\n\nbar\n   baz -->\nokay\n"
    let html = "<!-- Foo\n\nbar\n   baz -->\n<p>okay</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature148() {
    let markdown = "<?php\n\n  echo '>';\n\n?>\nokay\n"
    let html = "<?php\n\n  echo '>';\n\n?>\n<p>okay</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature149() {
    let markdown = "<!DOCTYPE html>\n"
    let html = "<!DOCTYPE html>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature150() {
    let markdown = "<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\nokay\n"
    let html = "<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\n<p>okay</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature151() {
    let markdown = "  <!-- foo -->\n\n    <!-- foo -->\n"
    let html = "  <!-- foo -->\n<pre><code>&lt;!-- foo --&gt;\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature152() {
    let markdown = "  <div>\n\n    <div>\n"
    let html = "  <div>\n<pre><code>&lt;div&gt;\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature153() {
    let markdown = "Foo\n<div>\nbar\n</div>\n"
    let html = "<p>Foo</p>\n<div>\nbar\n</div>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature154() {
    let markdown = "<div>\nbar\n</div>\n*foo*\n"
    let html = "<div>\nbar\n</div>\n*foo*\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature155() {
    let markdown = "Foo\n<a href=\"bar\">\nbaz\n"
    let html = "<p>Foo\n<a href=\"bar\">\nbaz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature156() {
    let markdown = "<div>\n\n*Emphasized* text.\n\n</div>\n"
    let html = "<div>\n<p><em>Emphasized</em> text.</p>\n</div>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature157() {
    let markdown = "<div>\n*Emphasized* text.\n</div>\n"
    let html = "<div>\n*Emphasized* text.\n</div>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature158() {
    let markdown = "<table>\n\n<tr>\n\n<td>\nHi\n</td>\n\n</tr>\n\n</table>\n"
    let html = "<table>\n<tr>\n<td>\nHi\n</td>\n</tr>\n</table>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature159() {
    let markdown = "<table>\n\n  <tr>\n\n    <td>\n      Hi\n    </td>\n\n  </tr>\n\n</table>\n"
    let html = "<table>\n  <tr>\n<pre><code>&lt;td&gt;\n  Hi\n&lt;/td&gt;\n</code></pre>\n  </tr>\n</table>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// HTML blocks
  }

  func testMarkdownFeature160() {
    let markdown = "[foo]: /url \"title\"\n\n[foo]\n"
    let html = "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature161() {
    let markdown = "   [foo]: \n      /url  \n           'the title'  \n\n[foo]\n"
    let html = "<p><a href=\"/url\" title=\"the title\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature162() {
    let markdown = "[Foo*bar\\]]:my_(url) 'title (with parens)'\n\n[Foo*bar\\]]\n"
    let html = "<p><a href=\"my_(url)\" title=\"title (with parens)\">Foo*bar]</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature163() {
    let markdown = "[Foo bar]:\n<my url>\n'title'\n\n[Foo bar]\n"
    let html = "<p><a href=\"my%20url\" title=\"title\">Foo bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature164() {
    let markdown = "[foo]: /url '\ntitle\nline1\nline2\n'\n\n[foo]\n"
    let html = "<p><a href=\"/url\" title=\"\ntitle\nline1\nline2\n\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature165() {
    let markdown = "[foo]: /url 'title\n\nwith blank line'\n\n[foo]\n"
    let html = "<p>[foo]: /url 'title</p>\n<p>with blank line'</p>\n<p>[foo]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature166() {
    let markdown = "[foo]:\n/url\n\n[foo]\n"
    let html = "<p><a href=\"/url\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature167() {
    let markdown = "[foo]:\n\n[foo]\n"
    let html = "<p>[foo]:</p>\n<p>[foo]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature168() {
    let markdown = "[foo]: <>\n\n[foo]\n"
    let html = "<p><a href=\"\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature169() {
    let markdown = "[foo]: <bar>(baz)\n\n[foo]\n"
    let html = "<p>[foo]: <bar>(baz)</p>\n<p>[foo]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature170() {
    let markdown = "[foo]: /url\\bar\\*baz \"foo\\\"bar\\baz\"\n\n[foo]\n"
    let html = "<p><a href=\"/url%5Cbar*baz\" title=\"foo&quot;bar\\baz\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature171() {
    let markdown = "[foo]\n\n[foo]: url\n"
    let html = "<p><a href=\"url\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature172() {
    let markdown = "[foo]\n\n[foo]: first\n[foo]: second\n"
    let html = "<p><a href=\"first\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature173() {
    let markdown = "[FOO]: /url\n\n[Foo]\n"
    let html = "<p><a href=\"/url\">Foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature174() {
    let markdown = "[ΑΓΩ]: /φου\n\n[αγω]\n"
    let html = "<p><a href=\"/%CF%86%CE%BF%CF%85\">αγω</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature175() {
    let markdown = "[foo]: /url\n"
    let html = ""
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature176() {
    let markdown = "[\nfoo\n]: /url\nbar\n"
    let html = "<p>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature177() {
    let markdown = "[foo]: /url \"title\" ok\n"
    let html = "<p>[foo]: /url &quot;title&quot; ok</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature178() {
    let markdown = "[foo]: /url\n\"title\" ok\n"
    let html = "<p>&quot;title&quot; ok</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature179() {
    let markdown = "    [foo]: /url \"title\"\n\n[foo]\n"
    let html = "<pre><code>[foo]: /url &quot;title&quot;\n</code></pre>\n<p>[foo]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature180() {
    let markdown = "```\n[foo]: /url\n```\n\n[foo]\n"
    let html = "<pre><code>[foo]: /url\n</code></pre>\n<p>[foo]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature181() {
    let markdown = "Foo\n[bar]: /baz\n\n[bar]\n"
    let html = "<p>Foo\n[bar]: /baz</p>\n<p>[bar]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature182() {
    let markdown = "# [Foo]\n[foo]: /url\n> bar\n"
    let html = "<h1><a href=\"/url\">Foo</a></h1>\n<blockquote>\n<p>bar</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature183() {
    let markdown = "[foo]: /url\nbar\n===\n[foo]\n"
    let html = "<h1>bar</h1>\n<p><a href=\"/url\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature184() {
    let markdown = "[foo]: /url\n===\n[foo]\n"
    let html = "<p>===\n<a href=\"/url\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature185() {
    let markdown = "[foo]: /foo-url \"foo\"\n[bar]: /bar-url\n  \"bar\"\n[baz]: /baz-url\n\n[foo],\n[bar],\n[baz]\n"
    let html = "<p><a href=\"/foo-url\" title=\"foo\">foo</a>,\n<a href=\"/bar-url\" title=\"bar\">bar</a>,\n<a href=\"/baz-url\">baz</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature186() {
    let markdown = "[foo]\n\n> [foo]: /url\n"
    let html = "<p><a href=\"/url\">foo</a></p>\n<blockquote>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature187() {
    let markdown = "[foo]: /url\n"
    let html = ""
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Link reference definitions
  }

  func testMarkdownFeature188() {
    let markdown = "aaa\n\nbbb\n"
    let html = "<p>aaa</p>\n<p>bbb</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature189() {
    let markdown = "aaa\nbbb\n\nccc\nddd\n"
    let html = "<p>aaa\nbbb</p>\n<p>ccc\nddd</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature190() {
    let markdown = "aaa\n\n\nbbb\n"
    let html = "<p>aaa</p>\n<p>bbb</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature191() {
    let markdown = "  aaa\n bbb\n"
    let html = "<p>aaa\nbbb</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature192() {
    let markdown = "aaa\n             bbb\n                                       ccc\n"
    let html = "<p>aaa\nbbb\nccc</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature193() {
    let markdown = "   aaa\nbbb\n"
    let html = "<p>aaa\nbbb</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature194() {
    let markdown = "    aaa\nbbb\n"
    let html = "<pre><code>aaa\n</code></pre>\n<p>bbb</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature195() {
    let markdown = "aaa     \nbbb     \n"
    let html = "<p>aaa<br />\nbbb</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Paragraphs
  }

  func testMarkdownFeature196() {
    let markdown = "  \n\naaa\n  \n\n# aaa\n\n  \n"
    let html = "<p>aaa</p>\n<h1>aaa</h1>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Blank lines
  }

  func testMarkdownFeature197() {
    let markdown = "> # Foo\n> bar\n> baz\n"
    let html = "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature198() {
    let markdown = "># Foo\n>bar\n> baz\n"
    let html = "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature199() {
    let markdown = "   > # Foo\n   > bar\n > baz\n"
    let html = "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature200() {
    let markdown = "    > # Foo\n    > bar\n    > baz\n"
    let html = "<pre><code>&gt; # Foo\n&gt; bar\n&gt; baz\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature201() {
    let markdown = "> # Foo\n> bar\nbaz\n"
    let html = "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature202() {
    let markdown = "> bar\nbaz\n> foo\n"
    let html = "<blockquote>\n<p>bar\nbaz\nfoo</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature203() {
    let markdown = "> foo\n---\n"
    let html = "<blockquote>\n<p>foo</p>\n</blockquote>\n<hr />\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature204() {
    let markdown = "> - foo\n- bar\n"
    let html = "<blockquote>\n<ul>\n<li>foo</li>\n</ul>\n</blockquote>\n<ul>\n<li>bar</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature205() {
    let markdown = ">     foo\n    bar\n"
    let html = "<blockquote>\n<pre><code>foo\n</code></pre>\n</blockquote>\n<pre><code>bar\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature206() {
    let markdown = "> ```\nfoo\n```\n"
    let html = "<blockquote>\n<pre><code></code></pre>\n</blockquote>\n<p>foo</p>\n<pre><code></code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature207() {
    let markdown = "> foo\n    - bar\n"
    let html = "<blockquote>\n<p>foo\n- bar</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature208() {
    let markdown = ">\n"
    let html = "<blockquote>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature209() {
    let markdown = ">\n>  \n> \n"
    let html = "<blockquote>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature210() {
    let markdown = ">\n> foo\n>  \n"
    let html = "<blockquote>\n<p>foo</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature211() {
    let markdown = "> foo\n\n> bar\n"
    let html = "<blockquote>\n<p>foo</p>\n</blockquote>\n<blockquote>\n<p>bar</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature212() {
    let markdown = "> foo\n> bar\n"
    let html = "<blockquote>\n<p>foo\nbar</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature213() {
    let markdown = "> foo\n>\n> bar\n"
    let html = "<blockquote>\n<p>foo</p>\n<p>bar</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature214() {
    let markdown = "foo\n> bar\n"
    let html = "<p>foo</p>\n<blockquote>\n<p>bar</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature215() {
    let markdown = "> aaa\n***\n> bbb\n"
    let html = "<blockquote>\n<p>aaa</p>\n</blockquote>\n<hr />\n<blockquote>\n<p>bbb</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature216() {
    let markdown = "> bar\nbaz\n"
    let html = "<blockquote>\n<p>bar\nbaz</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature217() {
    let markdown = "> bar\n\nbaz\n"
    let html = "<blockquote>\n<p>bar</p>\n</blockquote>\n<p>baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature218() {
    let markdown = "> bar\n>\nbaz\n"
    let html = "<blockquote>\n<p>bar</p>\n</blockquote>\n<p>baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature219() {
    let markdown = "> > > foo\nbar\n"
    let html = "<blockquote>\n<blockquote>\n<blockquote>\n<p>foo\nbar</p>\n</blockquote>\n</blockquote>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature220() {
    let markdown = ">>> foo\n> bar\n>>baz\n"
    let html = "<blockquote>\n<blockquote>\n<blockquote>\n<p>foo\nbar\nbaz</p>\n</blockquote>\n</blockquote>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature221() {
    let markdown = ">     code\n\n>    not code\n"
    let html = "<blockquote>\n<pre><code>code\n</code></pre>\n</blockquote>\n<blockquote>\n<p>not code</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Block quotes
  }

  func testMarkdownFeature222() {
    let markdown = "A paragraph\nwith two lines.\n\n    indented code\n\n> A block quote.\n"
    let html = "<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature223() {
    let markdown = "1.  A paragraph\n    with two lines.\n\n        indented code\n\n    > A block quote.\n"
    let html = "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature224() {
    let markdown = "- one\n\n two\n"
    let html = "<ul>\n<li>one</li>\n</ul>\n<p>two</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature225() {
    let markdown = "- one\n\n  two\n"
    let html = "<ul>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature226() {
    let markdown = " -    one\n\n     two\n"
    let html = "<ul>\n<li>one</li>\n</ul>\n<pre><code> two\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature227() {
    let markdown = " -    one\n\n      two\n"
    let html = "<ul>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature228() {
    let markdown = "   > > 1.  one\n>>\n>>     two\n"
    let html = "<blockquote>\n<blockquote>\n<ol>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ol>\n</blockquote>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature229() {
    let markdown = ">>- one\n>>\n  >  > two\n"
    let html = "<blockquote>\n<blockquote>\n<ul>\n<li>one</li>\n</ul>\n<p>two</p>\n</blockquote>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature230() {
    let markdown = "-one\n\n2.two\n"
    let html = "<p>-one</p>\n<p>2.two</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature231() {
    let markdown = "- foo\n\n\n  bar\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature232() {
    let markdown = "1.  foo\n\n    ```\n    bar\n    ```\n\n    baz\n\n    > bam\n"
    let html = "<ol>\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n<p>baz</p>\n<blockquote>\n<p>bam</p>\n</blockquote>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature233() {
    let markdown = "- Foo\n\n      bar\n\n\n      baz\n"
    let html = "<ul>\n<li>\n<p>Foo</p>\n<pre><code>bar\n\n\nbaz\n</code></pre>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature234() {
    let markdown = "123456789. ok\n"
    let html = "<ol start=\"123456789\">\n<li>ok</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature235() {
    let markdown = "1234567890. not ok\n"
    let html = "<p>1234567890. not ok</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature236() {
    let markdown = "0. ok\n"
    let html = "<ol start=\"0\">\n<li>ok</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature237() {
    let markdown = "003. ok\n"
    let html = "<ol start=\"3\">\n<li>ok</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature238() {
    let markdown = "-1. not ok\n"
    let html = "<p>-1. not ok</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature239() {
    let markdown = "- foo\n\n      bar\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature240() {
    let markdown = "  10.  foo\n\n           bar\n"
    let html = "<ol start=\"10\">\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature241() {
    let markdown = "    indented code\n\nparagraph\n\n    more code\n"
    let html = "<pre><code>indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature242() {
    let markdown = "1.     indented code\n\n   paragraph\n\n       more code\n"
    let html = "<ol>\n<li>\n<pre><code>indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature243() {
    let markdown = "1.      indented code\n\n   paragraph\n\n       more code\n"
    let html = "<ol>\n<li>\n<pre><code> indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature244() {
    let markdown = "   foo\n\nbar\n"
    let html = "<p>foo</p>\n<p>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature245() {
    let markdown = "-    foo\n\n  bar\n"
    let html = "<ul>\n<li>foo</li>\n</ul>\n<p>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature246() {
    let markdown = "-  foo\n\n   bar\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature247() {
    let markdown = "-\n  foo\n-\n  ```\n  bar\n  ```\n-\n      baz\n"
    let html = "<ul>\n<li>foo</li>\n<li>\n<pre><code>bar\n</code></pre>\n</li>\n<li>\n<pre><code>baz\n</code></pre>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature248() {
    let markdown = "-   \n  foo\n"
    let html = "<ul>\n<li>foo</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature249() {
    let markdown = "-\n\n  foo\n"
    let html = "<ul>\n<li></li>\n</ul>\n<p>foo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature250() {
    let markdown = "- foo\n-\n- bar\n"
    let html = "<ul>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature251() {
    let markdown = "- foo\n-   \n- bar\n"
    let html = "<ul>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature252() {
    let markdown = "1. foo\n2.\n3. bar\n"
    let html = "<ol>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature253() {
    let markdown = "*\n"
    let html = "<ul>\n<li></li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature254() {
    let markdown = "foo\n*\n\nfoo\n1.\n"
    let html = "<p>foo\n*</p>\n<p>foo\n1.</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature255() {
    let markdown = " 1.  A paragraph\n     with two lines.\n\n         indented code\n\n     > A block quote.\n"
    let html = "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature256() {
    let markdown = "  1.  A paragraph\n      with two lines.\n\n          indented code\n\n      > A block quote.\n"
    let html = "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature257() {
    let markdown = "   1.  A paragraph\n       with two lines.\n\n           indented code\n\n       > A block quote.\n"
    let html = "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature258() {
    let markdown = "    1.  A paragraph\n        with two lines.\n\n            indented code\n\n        > A block quote.\n"
    let html = "<pre><code>1.  A paragraph\n    with two lines.\n\n        indented code\n\n    &gt; A block quote.\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature259() {
    let markdown = "  1.  A paragraph\nwith two lines.\n\n          indented code\n\n      > A block quote.\n"
    let html = "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature260() {
    let markdown = "  1.  A paragraph\n    with two lines.\n"
    let html = "<ol>\n<li>A paragraph\nwith two lines.</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature261() {
    let markdown = "> 1. > Blockquote\ncontinued here.\n"
    let html = "<blockquote>\n<ol>\n<li>\n<blockquote>\n<p>Blockquote\ncontinued here.</p>\n</blockquote>\n</li>\n</ol>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature262() {
    let markdown = "> 1. > Blockquote\n> continued here.\n"
    let html = "<blockquote>\n<ol>\n<li>\n<blockquote>\n<p>Blockquote\ncontinued here.</p>\n</blockquote>\n</li>\n</ol>\n</blockquote>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature263() {
    let markdown = "- foo\n  - bar\n    - baz\n      - boo\n"
    let html = "<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>baz\n<ul>\n<li>boo</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature264() {
    let markdown = "- foo\n - bar\n  - baz\n   - boo\n"
    let html = "<ul>\n<li>foo</li>\n<li>bar</li>\n<li>baz</li>\n<li>boo</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature265() {
    let markdown = "10) foo\n    - bar\n"
    let html = "<ol start=\"10\">\n<li>foo\n<ul>\n<li>bar</li>\n</ul>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature266() {
    let markdown = "10) foo\n   - bar\n"
    let html = "<ol start=\"10\">\n<li>foo</li>\n</ol>\n<ul>\n<li>bar</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature267() {
    let markdown = "- - foo\n"
    let html = "<ul>\n<li>\n<ul>\n<li>foo</li>\n</ul>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature268() {
    let markdown = "1. - 2. foo\n"
    let html = "<ol>\n<li>\n<ul>\n<li>\n<ol start=\"2\">\n<li>foo</li>\n</ol>\n</li>\n</ul>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature269() {
    let markdown = "- # Foo\n- Bar\n  ---\n  baz\n"
    let html = "<ul>\n<li>\n<h1>Foo</h1>\n</li>\n<li>\n<h2>Bar</h2>\nbaz</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// List items
  }

  func testMarkdownFeature270() {
    let markdown = "- foo\n- bar\n+ baz\n"
    let html = "<ul>\n<li>foo</li>\n<li>bar</li>\n</ul>\n<ul>\n<li>baz</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature271() {
    let markdown = "1. foo\n2. bar\n3) baz\n"
    let html = "<ol>\n<li>foo</li>\n<li>bar</li>\n</ol>\n<ol start=\"3\">\n<li>baz</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature272() {
    let markdown = "Foo\n- bar\n- baz\n"
    let html = "<p>Foo</p>\n<ul>\n<li>bar</li>\n<li>baz</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature273() {
    let markdown = "The number of windows in my house is\n14.  The number of doors is 6.\n"
    let html = "<p>The number of windows in my house is\n14.  The number of doors is 6.</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature274() {
    let markdown = "The number of windows in my house is\n1.  The number of doors is 6.\n"
    let html = "<p>The number of windows in my house is</p>\n<ol>\n<li>The number of doors is 6.</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature275() {
    let markdown = "- foo\n\n- bar\n\n\n- baz\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n</li>\n<li>\n<p>bar</p>\n</li>\n<li>\n<p>baz</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature276() {
    let markdown = "- foo\n  - bar\n    - baz\n\n\n      bim\n"
    let html = "<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>\n<p>baz</p>\n<p>bim</p>\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature277() {
    let markdown = "- foo\n- bar\n\n<!-- -->\n\n- baz\n- bim\n"
    let html = "<ul>\n<li>foo</li>\n<li>bar</li>\n</ul>\n<!-- -->\n<ul>\n<li>baz</li>\n<li>bim</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature278() {
    let markdown = "-   foo\n\n    notcode\n\n-   foo\n\n<!-- -->\n\n    code\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<p>notcode</p>\n</li>\n<li>\n<p>foo</p>\n</li>\n</ul>\n<!-- -->\n<pre><code>code\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature279() {
    let markdown = "- a\n - b\n  - c\n   - d\n  - e\n - f\n- g\n"
    let html = "<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n<li>d</li>\n<li>e</li>\n<li>f</li>\n<li>g</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature280() {
    let markdown = "1. a\n\n  2. b\n\n   3. c\n"
    let html = "<ol>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>c</p>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature281() {
    let markdown = "- a\n - b\n  - c\n   - d\n    - e\n"
    let html = "<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n<li>d\n- e</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature282() {
    let markdown = "1. a\n\n  2. b\n\n    3. c\n"
    let html = "<ol>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n</ol>\n<pre><code>3. c\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature283() {
    let markdown = "- a\n- b\n\n- c\n"
    let html = "<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>c</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature284() {
    let markdown = "* a\n*\n\n* c\n"
    let html = "<ul>\n<li>\n<p>a</p>\n</li>\n<li></li>\n<li>\n<p>c</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature285() {
    let markdown = "- a\n- b\n\n  c\n- d\n"
    let html = "<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n<p>c</p>\n</li>\n<li>\n<p>d</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature286() {
    let markdown = "- a\n- b\n\n  [ref]: /url\n- d\n"
    let html = "<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>d</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature287() {
    let markdown = "- a\n- ```\n  b\n\n\n  ```\n- c\n"
    let html = "<ul>\n<li>a</li>\n<li>\n<pre><code>b\n\n\n</code></pre>\n</li>\n<li>c</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature288() {
    let markdown = "- a\n  - b\n\n    c\n- d\n"
    let html = "<ul>\n<li>a\n<ul>\n<li>\n<p>b</p>\n<p>c</p>\n</li>\n</ul>\n</li>\n<li>d</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature289() {
    let markdown = "* a\n  > b\n  >\n* c\n"
    let html = "<ul>\n<li>a\n<blockquote>\n<p>b</p>\n</blockquote>\n</li>\n<li>c</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature290() {
    let markdown = "- a\n  > b\n  ```\n  c\n  ```\n- d\n"
    let html = "<ul>\n<li>a\n<blockquote>\n<p>b</p>\n</blockquote>\n<pre><code>c\n</code></pre>\n</li>\n<li>d</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature291() {
    let markdown = "- a\n"
    let html = "<ul>\n<li>a</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature292() {
    let markdown = "- a\n  - b\n"
    let html = "<ul>\n<li>a\n<ul>\n<li>b</li>\n</ul>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature293() {
    let markdown = "1. ```\n   foo\n   ```\n\n   bar\n"
    let html = "<ol>\n<li>\n<pre><code>foo\n</code></pre>\n<p>bar</p>\n</li>\n</ol>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature294() {
    let markdown = "* foo\n  * bar\n\n  baz\n"
    let html = "<ul>\n<li>\n<p>foo</p>\n<ul>\n<li>bar</li>\n</ul>\n<p>baz</p>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature295() {
    let markdown = "- a\n  - b\n  - c\n\n- d\n  - e\n  - f\n"
    let html = "<ul>\n<li>\n<p>a</p>\n<ul>\n<li>b</li>\n<li>c</li>\n</ul>\n</li>\n<li>\n<p>d</p>\n<ul>\n<li>e</li>\n<li>f</li>\n</ul>\n</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Lists
  }

  func testMarkdownFeature296() {
    let markdown = "`hi`lo`\n"
    let html = "<p><code>hi</code>lo`</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Inlines
  }

  func testMarkdownFeature297() {
    let markdown = "\\!\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~\n"
    let html = "<p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature298() {
    let markdown = "\\\t\\A\\a\\ \\3\\φ\\«\n"
    let html = "<p>\\\t\\A\\a\\ \\3\\φ\\«</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature299() {
    let markdown = "\\*not emphasized*\n\\<br/> not a tag\n\\[not a link](/foo)\n\\`not code`\n1\\. not a list\n\\* not a list\n\\# not a heading\n\\[foo]: /url \"not a reference\"\n\\&ouml; not a character entity\n"
    let html = "<p>*not emphasized*\n&lt;br/&gt; not a tag\n[not a link](/foo)\n`not code`\n1. not a list\n* not a list\n# not a heading\n[foo]: /url &quot;not a reference&quot;\n&amp;ouml; not a character entity</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature300() {
    let markdown = "\\\\*emphasis*\n"
    let html = "<p>\\<em>emphasis</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature301() {
    let markdown = "foo\\\nbar\n"
    let html = "<p>foo<br />\nbar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature302() {
    let markdown = "`` \\[\\` ``\n"
    let html = "<p><code>\\[\\`</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature303() {
    let markdown = "    \\[\\]\n"
    let html = "<pre><code>\\[\\]\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature304() {
    let markdown = "~~~\n\\[\\]\n~~~\n"
    let html = "<pre><code>\\[\\]\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature305() {
    let markdown = "<http://example.com?find=\\*>\n"
    let html = "<p><a href=\"http://example.com?find=%5C*\">http://example.com?find=\\*</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature306() {
    let markdown = "<a href=\"/bar\\/)\">\n"
    let html = "<a href=\"/bar\\/)\">\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature307() {
    let markdown = "[foo](/bar\\* \"ti\\*tle\")\n"
    let html = "<p><a href=\"/bar*\" title=\"ti*tle\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature308() {
    let markdown = "[foo]\n\n[foo]: /bar\\* \"ti\\*tle\"\n"
    let html = "<p><a href=\"/bar*\" title=\"ti*tle\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature309() {
    let markdown = "``` foo\\+bar\nfoo\n```\n"
    let html = "<pre><code class=\"language-foo+bar\">foo\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Backslash escapes
  }

  func testMarkdownFeature310() {
    let markdown = "&nbsp; &amp; &copy; &AElig; &Dcaron;\n&frac34; &HilbertSpace; &DifferentialD;\n&ClockwiseContourIntegral; &ngE;\n"
    let html = "<p>  &amp; © Æ Ď\n¾ ℋ ⅆ\n∲ ≧̸</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature311() {
    let markdown = "&#35; &#1234; &#992; &#0;\n"
    let html = "<p># Ӓ Ϡ �</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature312() {
    let markdown = "&#X22; &#XD06; &#xcab;\n"
    let html = "<p>&quot; ആ ಫ</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature313() {
    let markdown = "&nbsp &x; &#; &#x;\n&#987654321;\n&#abcdef0;\n&ThisIsNotDefined; &hi?;\n"
    let html = "<p>&amp;nbsp &amp;x; &amp;#; &amp;#x;\n&amp;#987654321;\n&amp;#abcdef0;\n&amp;ThisIsNotDefined; &amp;hi?;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature314() {
    let markdown = "&copy\n"
    let html = "<p>&amp;copy</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature315() {
    let markdown = "&MadeUpEntity;\n"
    let html = "<p>&amp;MadeUpEntity;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature316() {
    let markdown = "<a href=\"&ouml;&ouml;.html\">\n"
    let html = "<a href=\"&ouml;&ouml;.html\">\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature317() {
    let markdown = "[foo](/f&ouml;&ouml; \"f&ouml;&ouml;\")\n"
    let html = "<p><a href=\"/f%C3%B6%C3%B6\" title=\"föö\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature318() {
    let markdown = "[foo]\n\n[foo]: /f&ouml;&ouml; \"f&ouml;&ouml;\"\n"
    let html = "<p><a href=\"/f%C3%B6%C3%B6\" title=\"föö\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature319() {
    let markdown = "``` f&ouml;&ouml;\nfoo\n```\n"
    let html = "<pre><code class=\"language-föö\">foo\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature320() {
    let markdown = "`f&ouml;&ouml;`\n"
    let html = "<p><code>f&amp;ouml;&amp;ouml;</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature321() {
    let markdown = "    f&ouml;f&ouml;\n"
    let html = "<pre><code>f&amp;ouml;f&amp;ouml;\n</code></pre>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature322() {
    let markdown = "&#42;foo&#42;\n*foo*\n"
    let html = "<p>*foo*\n<em>foo</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature323() {
    let markdown = "&#42; foo\n\n* foo\n"
    let html = "<p>* foo</p>\n<ul>\n<li>foo</li>\n</ul>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature324() {
    let markdown = "foo&#10;&#10;bar\n"
    let html = "<p>foo\n\nbar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature325() {
    let markdown = "&#9;foo\n"
    let html = "<p>\tfoo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature326() {
    let markdown = "[a](url &quot;tit&quot;)\n"
    let html = "<p>[a](url &quot;tit&quot;)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Entity and numeric character references
  }

  func testMarkdownFeature327() {
    let markdown = "`foo`\n"
    let html = "<p><code>foo</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature328() {
    let markdown = "`` foo ` bar ``\n"
    let html = "<p><code>foo ` bar</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature329() {
    let markdown = "` `` `\n"
    let html = "<p><code>``</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature330() {
    let markdown = "`  ``  `\n"
    let html = "<p><code> `` </code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature331() {
    let markdown = "` a`\n"
    let html = "<p><code> a</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature332() {
    let markdown = "` b `\n"
    let html = "<p><code> b </code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature333() {
    let markdown = "` `\n`  `\n"
    let html = "<p><code> </code>\n<code>  </code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature334() {
    let markdown = "``\nfoo\nbar  \nbaz\n``\n"
    let html = "<p><code>foo bar   baz</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature335() {
    let markdown = "``\nfoo \n``\n"
    let html = "<p><code>foo </code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature336() {
    let markdown = "`foo   bar \nbaz`\n"
    let html = "<p><code>foo   bar  baz</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature337() {
    let markdown = "`foo\\`bar`\n"
    let html = "<p><code>foo\\</code>bar`</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature338() {
    let markdown = "``foo`bar``\n"
    let html = "<p><code>foo`bar</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature339() {
    let markdown = "` foo `` bar `\n"
    let html = "<p><code>foo `` bar</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature340() {
    let markdown = "*foo`*`\n"
    let html = "<p>*foo<code>*</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature341() {
    let markdown = "[not a `link](/foo`)\n"
    let html = "<p>[not a <code>link](/foo</code>)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature342() {
    let markdown = "`<a href=\"`\">`\n"
    let html = "<p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature343() {
    let markdown = "<a href=\"`\">`\n"
    let html = "<p><a href=\"`\">`</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature344() {
    let markdown = "`<http://foo.bar.`baz>`\n"
    let html = "<p><code>&lt;http://foo.bar.</code>baz&gt;`</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature345() {
    let markdown = "<http://foo.bar.`baz>`\n"
    let html = "<p><a href=\"http://foo.bar.%60baz\">http://foo.bar.`baz</a>`</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature346() {
    let markdown = "```foo``\n"
    let html = "<p>```foo``</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature347() {
    let markdown = "`foo\n"
    let html = "<p>`foo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature348() {
    let markdown = "`foo``bar``\n"
    let html = "<p>`foo<code>bar</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Code spans
  }

  func testMarkdownFeature349() {
    let markdown = "*foo bar*\n"
    let html = "<p><em>foo bar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature350() {
    let markdown = "a * foo bar*\n"
    let html = "<p>a * foo bar*</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature351() {
    let markdown = "a*\"foo\"*\n"
    let html = "<p>a*&quot;foo&quot;*</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature352() {
    let markdown = "* a *\n"
    let html = "<p>* a *</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature353() {
    let markdown = "foo*bar*\n"
    let html = "<p>foo<em>bar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature354() {
    let markdown = "5*6*78\n"
    let html = "<p>5<em>6</em>78</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature355() {
    let markdown = "_foo bar_\n"
    let html = "<p><em>foo bar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature356() {
    let markdown = "_ foo bar_\n"
    let html = "<p>_ foo bar_</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature357() {
    let markdown = "a_\"foo\"_\n"
    let html = "<p>a_&quot;foo&quot;_</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature358() {
    let markdown = "foo_bar_\n"
    let html = "<p>foo_bar_</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature359() {
    let markdown = "5_6_78\n"
    let html = "<p>5_6_78</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature360() {
    let markdown = "пристаням_стремятся_\n"
    let html = "<p>пристаням_стремятся_</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature361() {
    let markdown = "aa_\"bb\"_cc\n"
    let html = "<p>aa_&quot;bb&quot;_cc</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature362() {
    let markdown = "foo-_(bar)_\n"
    let html = "<p>foo-<em>(bar)</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature363() {
    let markdown = "_foo*\n"
    let html = "<p>_foo*</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature364() {
    let markdown = "*foo bar *\n"
    let html = "<p>*foo bar *</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature365() {
    let markdown = "*foo bar\n*\n"
    let html = "<p>*foo bar\n*</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature366() {
    let markdown = "*(*foo)\n"
    let html = "<p>*(*foo)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature367() {
    let markdown = "*(*foo*)*\n"
    let html = "<p><em>(<em>foo</em>)</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature368() {
    let markdown = "*foo*bar\n"
    let html = "<p><em>foo</em>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature369() {
    let markdown = "_foo bar _\n"
    let html = "<p>_foo bar _</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature370() {
    let markdown = "_(_foo)\n"
    let html = "<p>_(_foo)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature371() {
    let markdown = "_(_foo_)_\n"
    let html = "<p><em>(<em>foo</em>)</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature372() {
    let markdown = "_foo_bar\n"
    let html = "<p>_foo_bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature373() {
    let markdown = "_пристаням_стремятся\n"
    let html = "<p>_пристаням_стремятся</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature374() {
    let markdown = "_foo_bar_baz_\n"
    let html = "<p><em>foo_bar_baz</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature375() {
    let markdown = "_(bar)_.\n"
    let html = "<p><em>(bar)</em>.</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature376() {
    let markdown = "**foo bar**\n"
    let html = "<p><strong>foo bar</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature377() {
    let markdown = "** foo bar**\n"
    let html = "<p>** foo bar**</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature378() {
    let markdown = "a**\"foo\"**\n"
    let html = "<p>a**&quot;foo&quot;**</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature379() {
    let markdown = "foo**bar**\n"
    let html = "<p>foo<strong>bar</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature380() {
    let markdown = "__foo bar__\n"
    let html = "<p><strong>foo bar</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature381() {
    let markdown = "__ foo bar__\n"
    let html = "<p>__ foo bar__</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature382() {
    let markdown = "__\nfoo bar__\n"
    let html = "<p>__\nfoo bar__</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature383() {
    let markdown = "a__\"foo\"__\n"
    let html = "<p>a__&quot;foo&quot;__</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature384() {
    let markdown = "foo__bar__\n"
    let html = "<p>foo__bar__</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature385() {
    let markdown = "5__6__78\n"
    let html = "<p>5__6__78</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature386() {
    let markdown = "пристаням__стремятся__\n"
    let html = "<p>пристаням__стремятся__</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature387() {
    let markdown = "__foo, __bar__, baz__\n"
    let html = "<p><strong>foo, <strong>bar</strong>, baz</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature388() {
    let markdown = "foo-__(bar)__\n"
    let html = "<p>foo-<strong>(bar)</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature389() {
    let markdown = "**foo bar **\n"
    let html = "<p>**foo bar **</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature390() {
    let markdown = "**(**foo)\n"
    let html = "<p>**(**foo)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature391() {
    let markdown = "*(**foo**)*\n"
    let html = "<p><em>(<strong>foo</strong>)</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature392() {
    let markdown = "**Gomphocarpus (*Gomphocarpus physocarpus*, syn.\n*Asclepias physocarpa*)**\n"
    let html = "<p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.\n<em>Asclepias physocarpa</em>)</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature393() {
    let markdown = "**foo \"*bar*\" foo**\n"
    let html = "<p><strong>foo &quot;<em>bar</em>&quot; foo</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature394() {
    let markdown = "**foo**bar\n"
    let html = "<p><strong>foo</strong>bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature395() {
    let markdown = "__foo bar __\n"
    let html = "<p>__foo bar __</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature396() {
    let markdown = "__(__foo)\n"
    let html = "<p>__(__foo)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature397() {
    let markdown = "_(__foo__)_\n"
    let html = "<p><em>(<strong>foo</strong>)</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature398() {
    let markdown = "__foo__bar\n"
    let html = "<p>__foo__bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature399() {
    let markdown = "__пристаням__стремятся\n"
    let html = "<p>__пристаням__стремятся</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature400() {
    let markdown = "__foo__bar__baz__\n"
    let html = "<p><strong>foo__bar__baz</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature401() {
    let markdown = "__(bar)__.\n"
    let html = "<p><strong>(bar)</strong>.</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature402() {
    let markdown = "*foo [bar](/url)*\n"
    let html = "<p><em>foo <a href=\"/url\">bar</a></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature403() {
    let markdown = "*foo\nbar*\n"
    let html = "<p><em>foo\nbar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature404() {
    let markdown = "_foo __bar__ baz_\n"
    let html = "<p><em>foo <strong>bar</strong> baz</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature405() {
    let markdown = "_foo _bar_ baz_\n"
    let html = "<p><em>foo <em>bar</em> baz</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature406() {
    let markdown = "__foo_ bar_\n"
    let html = "<p><em><em>foo</em> bar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature407() {
    let markdown = "*foo *bar**\n"
    let html = "<p><em>foo <em>bar</em></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature408() {
    let markdown = "*foo **bar** baz*\n"
    let html = "<p><em>foo <strong>bar</strong> baz</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature409() {
    let markdown = "*foo**bar**baz*\n"
    let html = "<p><em>foo<strong>bar</strong>baz</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature410() {
    let markdown = "*foo**bar*\n"
    let html = "<p><em>foo**bar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature411() {
    let markdown = "***foo** bar*\n"
    let html = "<p><em><strong>foo</strong> bar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature412() {
    let markdown = "*foo **bar***\n"
    let html = "<p><em>foo <strong>bar</strong></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature413() {
    let markdown = "*foo**bar***\n"
    let html = "<p><em>foo<strong>bar</strong></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature414() {
    let markdown = "foo***bar***baz\n"
    let html = "<p>foo<em><strong>bar</strong></em>baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature415() {
    let markdown = "foo******bar*********baz\n"
    let html = "<p>foo<strong><strong><strong>bar</strong></strong></strong>***baz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature416() {
    let markdown = "*foo **bar *baz* bim** bop*\n"
    let html = "<p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature417() {
    let markdown = "*foo [*bar*](/url)*\n"
    let html = "<p><em>foo <a href=\"/url\"><em>bar</em></a></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature418() {
    let markdown = "** is not an empty emphasis\n"
    let html = "<p>** is not an empty emphasis</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature419() {
    let markdown = "**** is not an empty strong emphasis\n"
    let html = "<p>**** is not an empty strong emphasis</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature420() {
    let markdown = "**foo [bar](/url)**\n"
    let html = "<p><strong>foo <a href=\"/url\">bar</a></strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature421() {
    let markdown = "**foo\nbar**\n"
    let html = "<p><strong>foo\nbar</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature422() {
    let markdown = "__foo _bar_ baz__\n"
    let html = "<p><strong>foo <em>bar</em> baz</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature423() {
    let markdown = "__foo __bar__ baz__\n"
    let html = "<p><strong>foo <strong>bar</strong> baz</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature424() {
    let markdown = "____foo__ bar__\n"
    let html = "<p><strong><strong>foo</strong> bar</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature425() {
    let markdown = "**foo **bar****\n"
    let html = "<p><strong>foo <strong>bar</strong></strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature426() {
    let markdown = "**foo *bar* baz**\n"
    let html = "<p><strong>foo <em>bar</em> baz</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature427() {
    let markdown = "**foo*bar*baz**\n"
    let html = "<p><strong>foo<em>bar</em>baz</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature428() {
    let markdown = "***foo* bar**\n"
    let html = "<p><strong><em>foo</em> bar</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature429() {
    let markdown = "**foo *bar***\n"
    let html = "<p><strong>foo <em>bar</em></strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature430() {
    let markdown = "**foo *bar **baz**\nbim* bop**\n"
    let html = "<p><strong>foo <em>bar <strong>baz</strong>\nbim</em> bop</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature431() {
    let markdown = "**foo [*bar*](/url)**\n"
    let html = "<p><strong>foo <a href=\"/url\"><em>bar</em></a></strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature432() {
    let markdown = "__ is not an empty emphasis\n"
    let html = "<p>__ is not an empty emphasis</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature433() {
    let markdown = "____ is not an empty strong emphasis\n"
    let html = "<p>____ is not an empty strong emphasis</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature434() {
    let markdown = "foo ***\n"
    let html = "<p>foo ***</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature435() {
    let markdown = "foo *\\**\n"
    let html = "<p>foo <em>*</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature436() {
    let markdown = "foo *_*\n"
    let html = "<p>foo <em>_</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature437() {
    let markdown = "foo *****\n"
    let html = "<p>foo *****</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature438() {
    let markdown = "foo **\\***\n"
    let html = "<p>foo <strong>*</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature439() {
    let markdown = "foo **_**\n"
    let html = "<p>foo <strong>_</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature440() {
    let markdown = "**foo*\n"
    let html = "<p>*<em>foo</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature441() {
    let markdown = "*foo**\n"
    let html = "<p><em>foo</em>*</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature442() {
    let markdown = "***foo**\n"
    let html = "<p>*<strong>foo</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature443() {
    let markdown = "****foo*\n"
    let html = "<p>***<em>foo</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature444() {
    let markdown = "**foo***\n"
    let html = "<p><strong>foo</strong>*</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature445() {
    let markdown = "*foo****\n"
    let html = "<p><em>foo</em>***</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature446() {
    let markdown = "foo ___\n"
    let html = "<p>foo ___</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature447() {
    let markdown = "foo _\\__\n"
    let html = "<p>foo <em>_</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature448() {
    let markdown = "foo _*_\n"
    let html = "<p>foo <em>*</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature449() {
    let markdown = "foo _____\n"
    let html = "<p>foo _____</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature450() {
    let markdown = "foo __\\___\n"
    let html = "<p>foo <strong>_</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature451() {
    let markdown = "foo __*__\n"
    let html = "<p>foo <strong>*</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature452() {
    let markdown = "__foo_\n"
    let html = "<p>_<em>foo</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature453() {
    let markdown = "_foo__\n"
    let html = "<p><em>foo</em>_</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature454() {
    let markdown = "___foo__\n"
    let html = "<p>_<strong>foo</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature455() {
    let markdown = "____foo_\n"
    let html = "<p>___<em>foo</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature456() {
    let markdown = "__foo___\n"
    let html = "<p><strong>foo</strong>_</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature457() {
    let markdown = "_foo____\n"
    let html = "<p><em>foo</em>___</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature458() {
    let markdown = "**foo**\n"
    let html = "<p><strong>foo</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature459() {
    let markdown = "*_foo_*\n"
    let html = "<p><em><em>foo</em></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature460() {
    let markdown = "__foo__\n"
    let html = "<p><strong>foo</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature461() {
    let markdown = "_*foo*_\n"
    let html = "<p><em><em>foo</em></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature462() {
    let markdown = "****foo****\n"
    let html = "<p><strong><strong>foo</strong></strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature463() {
    let markdown = "____foo____\n"
    let html = "<p><strong><strong>foo</strong></strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature464() {
    let markdown = "******foo******\n"
    let html = "<p><strong><strong><strong>foo</strong></strong></strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature465() {
    let markdown = "***foo***\n"
    let html = "<p><em><strong>foo</strong></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature466() {
    let markdown = "_____foo_____\n"
    let html = "<p><em><strong><strong>foo</strong></strong></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature467() {
    let markdown = "*foo _bar* baz_\n"
    let html = "<p><em>foo _bar</em> baz_</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature468() {
    let markdown = "*foo __bar *baz bim__ bam*\n"
    let html = "<p><em>foo <strong>bar *baz bim</strong> bam</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature469() {
    let markdown = "**foo **bar baz**\n"
    let html = "<p>**foo <strong>bar baz</strong></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature470() {
    let markdown = "*foo *bar baz*\n"
    let html = "<p>*foo <em>bar baz</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature471() {
    let markdown = "*[bar*](/url)\n"
    let html = "<p>*<a href=\"/url\">bar*</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature472() {
    let markdown = "_foo [bar_](/url)\n"
    let html = "<p>_foo <a href=\"/url\">bar_</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature473() {
    let markdown = "*<img src=\"foo\" title=\"*\"/>\n"
    let html = "<p>*<img src=\"foo\" title=\"*\"/></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature474() {
    let markdown = "**<a href=\"**\">\n"
    let html = "<p>**<a href=\"**\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature475() {
    let markdown = "__<a href=\"__\">\n"
    let html = "<p>__<a href=\"__\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature476() {
    let markdown = "*a `*`*\n"
    let html = "<p><em>a <code>*</code></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature477() {
    let markdown = "_a `_`_\n"
    let html = "<p><em>a <code>_</code></em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature478() {
    let markdown = "**a<http://foo.bar/?q=**>\n"
    let html = "<p>**a<a href=\"http://foo.bar/?q=**\">http://foo.bar/?q=**</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature479() {
    let markdown = "__a<http://foo.bar/?q=__>\n"
    let html = "<p>__a<a href=\"http://foo.bar/?q=__\">http://foo.bar/?q=__</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Emphasis and strong emphasis
  }

  func testMarkdownFeature480() {
    let markdown = "[link](/uri \"title\")\n"
    let html = "<p><a href=\"/uri\" title=\"title\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature481() {
    let markdown = "[link](/uri)\n"
    let html = "<p><a href=\"/uri\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature482() {
    let markdown = "[link]()\n"
    let html = "<p><a href=\"\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature483() {
    let markdown = "[link](<>)\n"
    let html = "<p><a href=\"\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature484() {
    let markdown = "[link](/my uri)\n"
    let html = "<p>[link](/my uri)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature485() {
    let markdown = "[link](</my uri>)\n"
    let html = "<p><a href=\"/my%20uri\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature486() {
    let markdown = "[link](foo\nbar)\n"
    let html = "<p>[link](foo\nbar)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature487() {
    let markdown = "[link](<foo\nbar>)\n"
    let html = "<p>[link](<foo\nbar>)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature488() {
    let markdown = "[a](<b)c>)\n"
    let html = "<p><a href=\"b)c\">a</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature489() {
    let markdown = "[link](<foo\\>)\n"
    let html = "<p>[link](&lt;foo&gt;)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature490() {
    let markdown = "[a](<b)c\n[a](<b)c>\n[a](<b>c)\n"
    let html = "<p>[a](&lt;b)c\n[a](&lt;b)c&gt;\n[a](<b>c)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature491() {
    let markdown = "[link](\\(foo\\))\n"
    let html = "<p><a href=\"(foo)\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature492() {
    let markdown = "[link](foo(and(bar)))\n"
    let html = "<p><a href=\"foo(and(bar))\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature493() {
    let markdown = "[link](foo\\(and\\(bar\\))\n"
    let html = "<p><a href=\"foo(and(bar)\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature494() {
    let markdown = "[link](<foo(and(bar)>)\n"
    let html = "<p><a href=\"foo(and(bar)\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature495() {
    let markdown = "[link](foo\\)\\:)\n"
    let html = "<p><a href=\"foo):\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature496() {
    let markdown = "[link](#fragment)\n\n[link](http://example.com#fragment)\n\n[link](http://example.com?foo=3#frag)\n"
    let html = "<p><a href=\"#fragment\">link</a></p>\n<p><a href=\"http://example.com#fragment\">link</a></p>\n<p><a href=\"http://example.com?foo=3#frag\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature497() {
    let markdown = "[link](foo\\bar)\n"
    let html = "<p><a href=\"foo%5Cbar\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature498() {
    let markdown = "[link](foo%20b&auml;)\n"
    let html = "<p><a href=\"foo%20b%C3%A4\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature499() {
    let markdown = "[link](\"title\")\n"
    let html = "<p><a href=\"%22title%22\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature500() {
    let markdown = "[link](/url \"title\")\n[link](/url 'title')\n[link](/url (title))\n"
    let html = "<p><a href=\"/url\" title=\"title\">link</a>\n<a href=\"/url\" title=\"title\">link</a>\n<a href=\"/url\" title=\"title\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature501() {
    let markdown = "[link](/url \"title \\\"&quot;\")\n"
    let html = "<p><a href=\"/url\" title=\"title &quot;&quot;\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature502() {
    let markdown = "[link](/url \"title\")\n"
    let html = "<p><a href=\"/url%C2%A0%22title%22\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature503() {
    let markdown = "[link](/url \"title \"and\" title\")\n"
    let html = "<p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature504() {
    let markdown = "[link](/url 'title \"and\" title')\n"
    let html = "<p><a href=\"/url\" title=\"title &quot;and&quot; title\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature505() {
    let markdown = "[link](   /uri\n  \"title\"  )\n"
    let html = "<p><a href=\"/uri\" title=\"title\">link</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature506() {
    let markdown = "[link] (/uri)\n"
    let html = "<p>[link] (/uri)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature507() {
    let markdown = "[link [foo [bar]]](/uri)\n"
    let html = "<p><a href=\"/uri\">link [foo [bar]]</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature508() {
    let markdown = "[link] bar](/uri)\n"
    let html = "<p>[link] bar](/uri)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature509() {
    let markdown = "[link [bar](/uri)\n"
    let html = "<p>[link <a href=\"/uri\">bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature510() {
    let markdown = "[link \\[bar](/uri)\n"
    let html = "<p><a href=\"/uri\">link [bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature511() {
    let markdown = "[link *foo **bar** `#`*](/uri)\n"
    let html = "<p><a href=\"/uri\">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature512() {
    let markdown = "[![moon](moon.jpg)](/uri)\n"
    let html = "<p><a href=\"/uri\"><img src=\"moon.jpg\" alt=\"moon\" /></a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature513() {
    let markdown = "[foo [bar](/uri)](/uri)\n"
    let html = "<p>[foo <a href=\"/uri\">bar</a>](/uri)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature514() {
    let markdown = "[foo *[bar [baz](/uri)](/uri)*](/uri)\n"
    let html = "<p>[foo <em>[bar <a href=\"/uri\">baz</a>](/uri)</em>](/uri)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature515() {
    let markdown = "![[[foo](uri1)](uri2)](uri3)\n"
    let html = "<p><img src=\"uri3\" alt=\"[foo](uri2)\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature516() {
    let markdown = "*[foo*](/uri)\n"
    let html = "<p>*<a href=\"/uri\">foo*</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature517() {
    let markdown = "[foo *bar](baz*)\n"
    let html = "<p><a href=\"baz*\">foo *bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature518() {
    let markdown = "*foo [bar* baz]\n"
    let html = "<p><em>foo [bar</em> baz]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature519() {
    let markdown = "[foo <bar attr=\"](baz)\">\n"
    let html = "<p>[foo <bar attr=\"](baz)\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature520() {
    let markdown = "[foo`](/uri)`\n"
    let html = "<p>[foo<code>](/uri)</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature521() {
    let markdown = "[foo<http://example.com/?search=](uri)>\n"
    let html = "<p>[foo<a href=\"http://example.com/?search=%5D(uri)\">http://example.com/?search=](uri)</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature522() {
    let markdown = "[foo][bar]\n\n[bar]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature523() {
    let markdown = "[link [foo [bar]]][ref]\n\n[ref]: /uri\n"
    let html = "<p><a href=\"/uri\">link [foo [bar]]</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature524() {
    let markdown = "[link \\[bar][ref]\n\n[ref]: /uri\n"
    let html = "<p><a href=\"/uri\">link [bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature525() {
    let markdown = "[link *foo **bar** `#`*][ref]\n\n[ref]: /uri\n"
    let html = "<p><a href=\"/uri\">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature526() {
    let markdown = "[![moon](moon.jpg)][ref]\n\n[ref]: /uri\n"
    let html = "<p><a href=\"/uri\"><img src=\"moon.jpg\" alt=\"moon\" /></a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature527() {
    let markdown = "[foo [bar](/uri)][ref]\n\n[ref]: /uri\n"
    let html = "<p>[foo <a href=\"/uri\">bar</a>]<a href=\"/uri\">ref</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature528() {
    let markdown = "[foo *bar [baz][ref]*][ref]\n\n[ref]: /uri\n"
    let html = "<p>[foo <em>bar <a href=\"/uri\">baz</a></em>]<a href=\"/uri\">ref</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature529() {
    let markdown = "*[foo*][ref]\n\n[ref]: /uri\n"
    let html = "<p>*<a href=\"/uri\">foo*</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature530() {
    let markdown = "[foo *bar][ref]\n\n[ref]: /uri\n"
    let html = "<p><a href=\"/uri\">foo *bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature531() {
    let markdown = "[foo <bar attr=\"][ref]\">\n\n[ref]: /uri\n"
    let html = "<p>[foo <bar attr=\"][ref]\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature532() {
    let markdown = "[foo`][ref]`\n\n[ref]: /uri\n"
    let html = "<p>[foo<code>][ref]</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature533() {
    let markdown = "[foo<http://example.com/?search=][ref]>\n\n[ref]: /uri\n"
    let html = "<p>[foo<a href=\"http://example.com/?search=%5D%5Bref%5D\">http://example.com/?search=][ref]</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature534() {
    let markdown = "[foo][BaR]\n\n[bar]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature535() {
    let markdown = "[Толпой][Толпой] is a Russian word.\n\n[ТОЛПОЙ]: /url\n"
    let html = "<p><a href=\"/url\">Толпой</a> is a Russian word.</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature536() {
    let markdown = "[Foo\n  bar]: /url\n\n[Baz][Foo bar]\n"
    let html = "<p><a href=\"/url\">Baz</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature537() {
    let markdown = "[foo] [bar]\n\n[bar]: /url \"title\"\n"
    let html = "<p>[foo] <a href=\"/url\" title=\"title\">bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature538() {
    let markdown = "[foo]\n[bar]\n\n[bar]: /url \"title\"\n"
    let html = "<p>[foo]\n<a href=\"/url\" title=\"title\">bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature539() {
    let markdown = "[foo]: /url1\n\n[foo]: /url2\n\n[bar][foo]\n"
    let html = "<p><a href=\"/url1\">bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature540() {
    let markdown = "[bar][foo\\!]\n\n[foo!]: /url\n"
    let html = "<p>[bar][foo!]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature541() {
    let markdown = "[foo][ref[]\n\n[ref[]: /uri\n"
    let html = "<p>[foo][ref[]</p>\n<p>[ref[]: /uri</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature542() {
    let markdown = "[foo][ref[bar]]\n\n[ref[bar]]: /uri\n"
    let html = "<p>[foo][ref[bar]]</p>\n<p>[ref[bar]]: /uri</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature543() {
    let markdown = "[[[foo]]]\n\n[[[foo]]]: /url\n"
    let html = "<p>[[[foo]]]</p>\n<p>[[[foo]]]: /url</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature544() {
    let markdown = "[foo][ref\\[]\n\n[ref\\[]: /uri\n"
    let html = "<p><a href=\"/uri\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature545() {
    let markdown = "[bar\\\\]: /uri\n\n[bar\\\\]\n"
    let html = "<p><a href=\"/uri\">bar\\</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature546() {
    let markdown = "[]\n\n[]: /uri\n"
    let html = "<p>[]</p>\n<p>[]: /uri</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature547() {
    let markdown = "[\n ]\n\n[\n ]: /uri\n"
    let html = "<p>[\n]</p>\n<p>[\n]: /uri</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature548() {
    let markdown = "[foo][]\n\n[foo]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature549() {
    let markdown = "[*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\"><em>foo</em> bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature550() {
    let markdown = "[Foo][]\n\n[foo]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\">Foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature551() {
    let markdown = "[foo] \n[]\n\n[foo]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\">foo</a>\n[]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature552() {
    let markdown = "[foo]\n\n[foo]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature553() {
    let markdown = "[*foo* bar]\n\n[*foo* bar]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\"><em>foo</em> bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature554() {
    let markdown = "[[*foo* bar]]\n\n[*foo* bar]: /url \"title\"\n"
    let html = "<p>[<a href=\"/url\" title=\"title\"><em>foo</em> bar</a>]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature555() {
    let markdown = "[[bar [foo]\n\n[foo]: /url\n"
    let html = "<p>[[bar <a href=\"/url\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature556() {
    let markdown = "[Foo]\n\n[foo]: /url \"title\"\n"
    let html = "<p><a href=\"/url\" title=\"title\">Foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature557() {
    let markdown = "[foo] bar\n\n[foo]: /url\n"
    let html = "<p><a href=\"/url\">foo</a> bar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature558() {
    let markdown = "\\[foo]\n\n[foo]: /url \"title\"\n"
    let html = "<p>[foo]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature559() {
    let markdown = "[foo*]: /url\n\n*[foo*]\n"
    let html = "<p>*<a href=\"/url\">foo*</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature560() {
    let markdown = "[foo][bar]\n\n[foo]: /url1\n[bar]: /url2\n"
    let html = "<p><a href=\"/url2\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature561() {
    let markdown = "[foo][]\n\n[foo]: /url1\n"
    let html = "<p><a href=\"/url1\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature562() {
    let markdown = "[foo]()\n\n[foo]: /url1\n"
    let html = "<p><a href=\"\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature563() {
    let markdown = "[foo](not a link)\n\n[foo]: /url1\n"
    let html = "<p><a href=\"/url1\">foo</a>(not a link)</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature564() {
    let markdown = "[foo][bar][baz]\n\n[baz]: /url\n"
    let html = "<p>[foo]<a href=\"/url\">bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature565() {
    let markdown = "[foo][bar][baz]\n\n[baz]: /url1\n[bar]: /url2\n"
    let html = "<p><a href=\"/url2\">foo</a><a href=\"/url1\">baz</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature566() {
    let markdown = "[foo][bar][baz]\n\n[baz]: /url1\n[foo]: /url2\n"
    let html = "<p>[foo]<a href=\"/url1\">bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Links
  }

  func testMarkdownFeature567() {
    let markdown = "![foo](/url \"title\")\n"
    let html = "<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature568() {
    let markdown = "![foo *bar*]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n"
    let html = "<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature569() {
    let markdown = "![foo ![bar](/url)](/url2)\n"
    let html = "<p><img src=\"/url2\" alt=\"foo bar\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature570() {
    let markdown = "![foo [bar](/url)](/url2)\n"
    let html = "<p><img src=\"/url2\" alt=\"foo bar\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature571() {
    let markdown = "![foo *bar*][]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n"
    let html = "<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature572() {
    let markdown = "![foo *bar*][foobar]\n\n[FOOBAR]: train.jpg \"train & tracks\"\n"
    let html = "<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature573() {
    let markdown = "![foo](train.jpg)\n"
    let html = "<p><img src=\"train.jpg\" alt=\"foo\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature574() {
    let markdown = "My ![foo bar](/path/to/train.jpg  \"title\"   )\n"
    let html = "<p>My <img src=\"/path/to/train.jpg\" alt=\"foo bar\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature575() {
    let markdown = "![foo](<url>)\n"
    let html = "<p><img src=\"url\" alt=\"foo\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature576() {
    let markdown = "![](/url)\n"
    let html = "<p><img src=\"/url\" alt=\"\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature577() {
    let markdown = "![foo][bar]\n\n[bar]: /url\n"
    let html = "<p><img src=\"/url\" alt=\"foo\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature578() {
    let markdown = "![foo][bar]\n\n[BAR]: /url\n"
    let html = "<p><img src=\"/url\" alt=\"foo\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature579() {
    let markdown = "![foo][]\n\n[foo]: /url \"title\"\n"
    let html = "<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature580() {
    let markdown = "![*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n"
    let html = "<p><img src=\"/url\" alt=\"foo bar\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature581() {
    let markdown = "![Foo][]\n\n[foo]: /url \"title\"\n"
    let html = "<p><img src=\"/url\" alt=\"Foo\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature582() {
    let markdown = "![foo] \n[]\n\n[foo]: /url \"title\"\n"
    let html = "<p><img src=\"/url\" alt=\"foo\" title=\"title\" />\n[]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature583() {
    let markdown = "![foo]\n\n[foo]: /url \"title\"\n"
    let html = "<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature584() {
    let markdown = "![*foo* bar]\n\n[*foo* bar]: /url \"title\"\n"
    let html = "<p><img src=\"/url\" alt=\"foo bar\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature585() {
    let markdown = "![[foo]]\n\n[[foo]]: /url \"title\"\n"
    let html = "<p>![[foo]]</p>\n<p>[[foo]]: /url &quot;title&quot;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature586() {
    let markdown = "![Foo]\n\n[foo]: /url \"title\"\n"
    let html = "<p><img src=\"/url\" alt=\"Foo\" title=\"title\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature587() {
    let markdown = "!\\[foo]\n\n[foo]: /url \"title\"\n"
    let html = "<p>![foo]</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature588() {
    let markdown = "\\![foo]\n\n[foo]: /url \"title\"\n"
    let html = "<p>!<a href=\"/url\" title=\"title\">foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Images
  }

  func testMarkdownFeature589() {
    let markdown = "<http://foo.bar.baz>\n"
    let html = "<p><a href=\"http://foo.bar.baz\">http://foo.bar.baz</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature590() {
    let markdown = "<http://foo.bar.baz/test?q=hello&id=22&boolean>\n"
    let html = "<p><a href=\"http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean\">http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature591() {
    let markdown = "<irc://foo.bar:2233/baz>\n"
    let html = "<p><a href=\"irc://foo.bar:2233/baz\">irc://foo.bar:2233/baz</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature592() {
    let markdown = "<MAILTO:FOO@BAR.BAZ>\n"
    let html = "<p><a href=\"MAILTO:FOO@BAR.BAZ\">MAILTO:FOO@BAR.BAZ</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature593() {
    let markdown = "<a+b+c:d>\n"
    let html = "<p><a href=\"a+b+c:d\">a+b+c:d</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature594() {
    let markdown = "<made-up-scheme://foo,bar>\n"
    let html = "<p><a href=\"made-up-scheme://foo,bar\">made-up-scheme://foo,bar</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature595() {
    let markdown = "<http://../>\n"
    let html = "<p><a href=\"http://../\">http://../</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature596() {
    let markdown = "<localhost:5001/foo>\n"
    let html = "<p><a href=\"localhost:5001/foo\">localhost:5001/foo</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature597() {
    let markdown = "<http://foo.bar/baz bim>\n"
    let html = "<p>&lt;http://foo.bar/baz bim&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature598() {
    let markdown = "<http://example.com/\\[\\>\n"
    let html = "<p><a href=\"http://example.com/%5C%5B%5C\">http://example.com/\\[\\</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature599() {
    let markdown = "<foo@bar.example.com>\n"
    let html = "<p><a href=\"mailto:foo@bar.example.com\">foo@bar.example.com</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature600() {
    let markdown = "<foo+special@Bar.baz-bar0.com>\n"
    let html = "<p><a href=\"mailto:foo+special@Bar.baz-bar0.com\">foo+special@Bar.baz-bar0.com</a></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature601() {
    let markdown = "<foo\\+@bar.example.com>\n"
    let html = "<p>&lt;foo+@bar.example.com&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature602() {
    let markdown = "<>\n"
    let html = "<p>&lt;&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature603() {
    let markdown = "< http://foo.bar >\n"
    let html = "<p>&lt; http://foo.bar &gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature604() {
    let markdown = "<m:abc>\n"
    let html = "<p>&lt;m:abc&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature605() {
    let markdown = "<foo.bar.baz>\n"
    let html = "<p>&lt;foo.bar.baz&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature606() {
    let markdown = "http://example.com\n"
    let html = "<p>http://example.com</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature607() {
    let markdown = "foo@bar.example.com\n"
    let html = "<p>foo@bar.example.com</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Autolinks
  }

  func testMarkdownFeature608() {
    let markdown = "<a><bab><c2c>\n"
    let html = "<p><a><bab><c2c></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature609() {
    let markdown = "<a/><b2/>\n"
    let html = "<p><a/><b2/></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature610() {
    let markdown = "<a  /><b2\ndata=\"foo\" >\n"
    let html = "<p><a  /><b2\ndata=\"foo\" ></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature611() {
    let markdown = "<a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 />\n"
    let html = "<p><a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature612() {
    let markdown = "Foo <responsive-image src=\"foo.jpg\" />\n"
    let html = "<p>Foo <responsive-image src=\"foo.jpg\" /></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature613() {
    let markdown = "<33> <__>\n"
    let html = "<p>&lt;33&gt; &lt;__&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature614() {
    let markdown = "<a h*#ref=\"hi\">\n"
    let html = "<p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature615() {
    let markdown = "<a href=\"hi'> <a href=hi'>\n"
    let html = "<p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature616() {
    let markdown = "< a><\nfoo><bar/ >\n<foo bar=baz\nbim!bop />\n"
    let html = "<p>&lt; a&gt;&lt;\nfoo&gt;&lt;bar/ &gt;\n&lt;foo bar=baz\nbim!bop /&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature617() {
    let markdown = "<a href='bar'title=title>\n"
    let html = "<p>&lt;a href='bar'title=title&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature618() {
    let markdown = "</a></foo >\n"
    let html = "<p></a></foo ></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature619() {
    let markdown = "</a href=\"foo\">\n"
    let html = "<p>&lt;/a href=&quot;foo&quot;&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature620() {
    let markdown = "foo <!-- this is a\ncomment - with hyphen -->\n"
    let html = "<p>foo <!-- this is a\ncomment - with hyphen --></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature621() {
    let markdown = "foo <!-- not a comment -- two hyphens -->\n"
    let html = "<p>foo &lt;!-- not a comment -- two hyphens --&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature622() {
    let markdown = "foo <!--> foo -->\n\nfoo <!-- foo--->\n"
    let html = "<p>foo &lt;!--&gt; foo --&gt;</p>\n<p>foo &lt;!-- foo---&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature623() {
    let markdown = "foo <?php echo $a; ?>\n"
    let html = "<p>foo <?php echo $a; ?></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature624() {
    let markdown = "foo <!ELEMENT br EMPTY>\n"
    let html = "<p>foo <!ELEMENT br EMPTY></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature625() {
    let markdown = "foo <![CDATA[>&<]]>\n"
    let html = "<p>foo <![CDATA[>&<]]></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature626() {
    let markdown = "foo <a href=\"&ouml;\">\n"
    let html = "<p>foo <a href=\"&ouml;\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature627() {
    let markdown = "foo <a href=\"\\*\">\n"
    let html = "<p>foo <a href=\"\\*\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature628() {
    let markdown = "<a href=\"\\\"\">\n"
    let html = "<p>&lt;a href=&quot;&quot;&quot;&gt;</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Raw HTML
  }

  func testMarkdownFeature629() {
    let markdown = "foo  \nbaz\n"
    let html = "<p>foo<br />\nbaz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature630() {
    let markdown = "foo\\\nbaz\n"
    let html = "<p>foo<br />\nbaz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature631() {
    let markdown = "foo       \nbaz\n"
    let html = "<p>foo<br />\nbaz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature632() {
    let markdown = "foo  \n     bar\n"
    let html = "<p>foo<br />\nbar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature633() {
    let markdown = "foo\\\n     bar\n"
    let html = "<p>foo<br />\nbar</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature634() {
    let markdown = "*foo  \nbar*\n"
    let html = "<p><em>foo<br />\nbar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature635() {
    let markdown = "*foo\\\nbar*\n"
    let html = "<p><em>foo<br />\nbar</em></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature636() {
    let markdown = "`code \nspan`\n"
    let html = "<p><code>code  span</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature637() {
    let markdown = "`code\\\nspan`\n"
    let html = "<p><code>code\\ span</code></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature638() {
    let markdown = "<a href=\"foo  \nbar\">\n"
    let html = "<p><a href=\"foo  \nbar\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature639() {
    let markdown = "<a href=\"foo\\\nbar\">\n"
    let html = "<p><a href=\"foo\\\nbar\"></p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature640() {
    let markdown = "foo\\\n"
    let html = "<p>foo\\</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature641() {
    let markdown = "foo  \n"
    let html = "<p>foo</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature642() {
    let markdown = "### foo\\\n"
    let html = "<h3>foo\\</h3>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature643() {
    let markdown = "### foo  \n"
    let html = "<h3>foo</h3>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Hard line breaks
  }

  func testMarkdownFeature644() {
    let markdown = "foo\nbaz\n"
    let html = "<p>foo\nbaz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Soft line breaks
  }

  func testMarkdownFeature645() {
    let markdown = "foo \n baz\n"
    let html = "<p>foo\nbaz</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Soft line breaks
  }

  func testMarkdownFeature646() {
    let markdown = "hello $.;'there\n"
    let html = "<p>hello $.;'there</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Textual content
  }

  func testMarkdownFeature647() {
    let markdown = "Foo χρῆν\n"
    let html = "<p>Foo χρῆν</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Textual content
  }

  func testMarkdownFeature648() {
    let markdown = "Multiple     spaces\n"
    let html = "<p>Multiple     spaces</p>\n"
    XCTAssertEqual(html, markdown.markdownToHTML!)


    /// Textual content
  }

}
