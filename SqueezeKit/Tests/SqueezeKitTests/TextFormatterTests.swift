import Testing
@testable import SqueezeKit

@Suite("TextFormatter")
struct TextFormatterTests {
    @Test func trimsAndCollapsesSpaces() {
        #expect(TextFormatter.squeeze("  hello   world  ") == "hello world")
    }

    @Test func dropsBlankLinesByDefault() {
        #expect(TextFormatter.squeeze("one\n\n\n two \n") == "one\ntwo")
    }

    @Test func keepsBlankLinesWhenAsked() {
        #expect(TextFormatter.squeeze("one\n\n two", collapseBlankLines: false) == "one\n\ntwo")
    }

    @Test func uppercasesWhenAsked() {
        #expect(TextFormatter.squeeze("a b", uppercase: true) == "A B")
    }

    @Test func emptyInputStaysEmpty() {
        #expect(TextFormatter.squeeze("   \n\n  ") == "")
    }
}
