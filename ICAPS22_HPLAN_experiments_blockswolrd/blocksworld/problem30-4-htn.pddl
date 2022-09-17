( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b657 - block
    b480 - block
    b63 - block
    b587 - block
    b992 - block
    b870 - block
    b659 - block
    b645 - block
    b919 - block
    b342 - block
    b937 - block
    b678 - block
    b210 - block
    b361 - block
    b772 - block
    b683 - block
    b256 - block
    b441 - block
    b95 - block
    b745 - block
    b538 - block
    b878 - block
    b214 - block
    b943 - block
    b125 - block
    b791 - block
    b993 - block
    b185 - block
    b521 - block
    b263 - block
    b906 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b657 )
    ( on b480 b657 )
    ( on b63 b480 )
    ( on b587 b63 )
    ( on b992 b587 )
    ( on b870 b992 )
    ( on b659 b870 )
    ( on b645 b659 )
    ( on b919 b645 )
    ( on b342 b919 )
    ( on b937 b342 )
    ( on b678 b937 )
    ( on b210 b678 )
    ( on b361 b210 )
    ( on b772 b361 )
    ( on b683 b772 )
    ( on b256 b683 )
    ( on b441 b256 )
    ( on b95 b441 )
    ( on b745 b95 )
    ( on b538 b745 )
    ( on b878 b538 )
    ( on b214 b878 )
    ( on b943 b214 )
    ( on b125 b943 )
    ( on b791 b125 )
    ( on b993 b791 )
    ( on b185 b993 )
    ( on b521 b185 )
    ( on b263 b521 )
    ( on b906 b263 )
    ( clear b906 )
  )
  ( :tasks
    ( Make-30Pile b480 b63 b587 b992 b870 b659 b645 b919 b342 b937 b678 b210 b361 b772 b683 b256 b441 b95 b745 b538 b878 b214 b943 b125 b791 b993 b185 b521 b263 b906 )
  )
)
