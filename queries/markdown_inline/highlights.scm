; extends


((backslash_escape) @string.escape
  (#eq? @string.escape "\\[")
  (#set! conceal "["))

((backslash_escape) @string.escape
  (#eq? @string.escape "\\]")
  (#set! conceal "]"))

((backslash_escape) @string.escape
  (#eq? @string.escape "\\(")
  (#set! conceal "("))

((backslash_escape) @string.escape
  (#eq? @string.escape "\\)")
  (#set! conceal ")"))

((backslash_escape) @string.escape
  (#eq? @string.escape "\\-")
  (#set! conceal "-"))

((backslash_escape) @string.escape
  (#eq? @string.escape "\\_")
  (#set! conceal "_"))

((backslash_escape) @string.escape
  (#eq? @string.escape "\\.")
  (#set! conceal "."))

((backslash_escape) @string.escape
  (#eq? @string.escape "\\*")
  (#set! conceal "*"))
