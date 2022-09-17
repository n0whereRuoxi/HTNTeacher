( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b447 - block
    b221 - block
    b99 - block
    b919 - block
    b861 - block
    b171 - block
    b590 - block
    b8 - block
    b838 - block
    b186 - block
    b231 - block
    b636 - block
    b653 - block
    b124 - block
    b145 - block
    b217 - block
    b313 - block
    b536 - block
    b119 - block
    b253 - block
    b991 - block
    b666 - block
    b964 - block
    b241 - block
    b546 - block
    b323 - block
    b943 - block
    b149 - block
    b292 - block
    b122 - block
    b619 - block
    b351 - block
    b304 - block
    b951 - block
    b996 - block
    b375 - block
    b759 - block
    b446 - block
    b227 - block
    b72 - block
    b465 - block
    b407 - block
    b874 - block
    b185 - block
    b191 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b447 )
    ( on b221 b447 )
    ( on b99 b221 )
    ( on b919 b99 )
    ( on b861 b919 )
    ( on b171 b861 )
    ( on b590 b171 )
    ( on b8 b590 )
    ( on b838 b8 )
    ( on b186 b838 )
    ( on b231 b186 )
    ( on b636 b231 )
    ( on b653 b636 )
    ( on b124 b653 )
    ( on b145 b124 )
    ( on b217 b145 )
    ( on b313 b217 )
    ( on b536 b313 )
    ( on b119 b536 )
    ( on b253 b119 )
    ( on b991 b253 )
    ( on b666 b991 )
    ( on b964 b666 )
    ( on b241 b964 )
    ( on b546 b241 )
    ( on b323 b546 )
    ( on b943 b323 )
    ( on b149 b943 )
    ( on b292 b149 )
    ( on b122 b292 )
    ( on b619 b122 )
    ( on b351 b619 )
    ( on b304 b351 )
    ( on b951 b304 )
    ( on b996 b951 )
    ( on b375 b996 )
    ( on b759 b375 )
    ( on b446 b759 )
    ( on b227 b446 )
    ( on b72 b227 )
    ( on b465 b72 )
    ( on b407 b465 )
    ( on b874 b407 )
    ( on b185 b874 )
    ( on b191 b185 )
    ( clear b191 )
  )
  ( :goal
    ( and
      ( clear b447 )
    )
  )
)
