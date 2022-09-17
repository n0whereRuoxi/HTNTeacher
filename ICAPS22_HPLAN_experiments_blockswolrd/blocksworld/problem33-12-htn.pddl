( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b428 - block
    b207 - block
    b734 - block
    b420 - block
    b855 - block
    b907 - block
    b817 - block
    b102 - block
    b958 - block
    b756 - block
    b632 - block
    b926 - block
    b853 - block
    b151 - block
    b636 - block
    b134 - block
    b194 - block
    b275 - block
    b213 - block
    b683 - block
    b816 - block
    b42 - block
    b492 - block
    b204 - block
    b369 - block
    b738 - block
    b798 - block
    b304 - block
    b970 - block
    b383 - block
    b50 - block
    b712 - block
    b722 - block
    b124 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b428 )
    ( on b207 b428 )
    ( on b734 b207 )
    ( on b420 b734 )
    ( on b855 b420 )
    ( on b907 b855 )
    ( on b817 b907 )
    ( on b102 b817 )
    ( on b958 b102 )
    ( on b756 b958 )
    ( on b632 b756 )
    ( on b926 b632 )
    ( on b853 b926 )
    ( on b151 b853 )
    ( on b636 b151 )
    ( on b134 b636 )
    ( on b194 b134 )
    ( on b275 b194 )
    ( on b213 b275 )
    ( on b683 b213 )
    ( on b816 b683 )
    ( on b42 b816 )
    ( on b492 b42 )
    ( on b204 b492 )
    ( on b369 b204 )
    ( on b738 b369 )
    ( on b798 b738 )
    ( on b304 b798 )
    ( on b970 b304 )
    ( on b383 b970 )
    ( on b50 b383 )
    ( on b712 b50 )
    ( on b722 b712 )
    ( on b124 b722 )
    ( clear b124 )
  )
  ( :tasks
    ( Make-33Pile b207 b734 b420 b855 b907 b817 b102 b958 b756 b632 b926 b853 b151 b636 b134 b194 b275 b213 b683 b816 b42 b492 b204 b369 b738 b798 b304 b970 b383 b50 b712 b722 b124 )
  )
)
