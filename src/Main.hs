import           Data.Maybe
-- import           Text.Pandoc
-- import           Text.Pandoc.Walk

-- autocompleteCaption :: (ToJSON a) => a -> IO a
-- autocompleteCaption (Image [] src) = Image [Str $ fst src] src
-- autocompleteCaption b@(CodeBlock (i, c, v) s) | isNothing $ lookup "caption" v = CodeBlock (i, c, [("caption", i)]) s
--                                               | otherwise = b
-- autocompleteCaption x = x

-- main :: IO ()
-- main = interact (writeMarkdown def . walk autocompleteCaption . readMarkdown def)

main = interact id
