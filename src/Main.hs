import           Data.Maybe
import           Text.Pandoc
import           Text.Pandoc.Walk

main :: IO ()
main = interact (writeMarkdown def . walk autocompleteCaption . readMarkdown def)

autocompleteCaption :: Block -> Block
autocompleteCaption = bottomUp autocompleteInline . bottomUp autocompleteBlock

autocompleteInline :: Inline -> Inline
autocompleteInline (Image [] src) = Image [Str $ fst src] src
autocompleteInline x = x

autocompleteBlock :: Block -> Block
autocompleteBlock b@(CodeBlock (i, c, v) s) | isNothing $ lookup "caption" v = CodeBlock (i, c, [("caption", i)]) s
                                            | otherwise = b
autocompleteBlock x = x
