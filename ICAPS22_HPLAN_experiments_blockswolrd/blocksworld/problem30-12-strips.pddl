( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b834 - block
    b708 - block
    b855 - block
    b530 - block
    b387 - block
    b788 - block
    b527 - block
    b745 - block
    b442 - block
    b317 - block
    b854 - block
    b36 - block
    b221 - block
    b326 - block
    b158 - block
    b129 - block
    b821 - block
    b942 - block
    b899 - block
    b818 - block
    b40 - block
    b209 - block
    b86 - block
    b742 - block
    b205 - block
    b300 - block
    b709 - block
    b579 - block
    b957 - block
    b44 - block
    b76 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b834 )
    ( on b708 b834 )
    ( on b855 b708 )
    ( on b530 b855 )
    ( on b387 b530 )
    ( on b788 b387 )
    ( on b527 b788 )
    ( on b745 b527 )
    ( on b442 b745 )
    ( on b317 b442 )
    ( on b854 b317 )
    ( on b36 b854 )
    ( on b221 b36 )
    ( on b326 b221 )
    ( on b158 b326 )
    ( on b129 b158 )
    ( on b821 b129 )
    ( on b942 b821 )
    ( on b899 b942 )
    ( on b818 b899 )
    ( on b40 b818 )
    ( on b209 b40 )
    ( on b86 b209 )
    ( on b742 b86 )
    ( on b205 b742 )
    ( on b300 b205 )
    ( on b709 b300 )
    ( on b579 b709 )
    ( on b957 b579 )
    ( on b44 b957 )
    ( on b76 b44 )
    ( clear b76 )
  )
  ( :goal
    ( and
      ( clear b834 )
    )
  )
)
