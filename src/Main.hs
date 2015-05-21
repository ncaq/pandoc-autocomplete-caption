import           Data.Maybe
import           Text.Pandoc
import           Text.Pandoc.JSON

main :: IO ()
main = toJSONFilter autocompleteCaption

autocompleteCaption :: Block -> Block
autocompleteCaption = bottomUp autocompleteInline . bottomUp autocompleteBlock

autocompleteInline :: Inline -> Inline
autocompleteInline (Image [] src) = Image [Str $ fst src] src
autocompleteInline x = x

autocompleteBlock :: Block -> Block
autocompleteBlock b@(CodeBlock (i, c, v) s) | i /= "" && isNothing (lookup "caption" v) = CodeBlock (i, c, ("caption", i) : v) s
                                            | otherwise = b
autocompleteBlock x = x
