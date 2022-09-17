( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b4 - block
    b519 - block
    b465 - block
    b462 - block
    b198 - block
    b497 - block
    b165 - block
    b208 - block
    b961 - block
    b745 - block
    b25 - block
    b689 - block
    b490 - block
    b894 - block
    b238 - block
    b522 - block
    b432 - block
    b576 - block
    b709 - block
    b854 - block
    b472 - block
    b677 - block
    b884 - block
    b697 - block
    b227 - block
    b296 - block
    b200 - block
    b78 - block
    b731 - block
    b233 - block
    b314 - block
    b897 - block
    b725 - block
    b642 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b4 )
    ( on b519 b4 )
    ( on b465 b519 )
    ( on b462 b465 )
    ( on b198 b462 )
    ( on b497 b198 )
    ( on b165 b497 )
    ( on b208 b165 )
    ( on b961 b208 )
    ( on b745 b961 )
    ( on b25 b745 )
    ( on b689 b25 )
    ( on b490 b689 )
    ( on b894 b490 )
    ( on b238 b894 )
    ( on b522 b238 )
    ( on b432 b522 )
    ( on b576 b432 )
    ( on b709 b576 )
    ( on b854 b709 )
    ( on b472 b854 )
    ( on b677 b472 )
    ( on b884 b677 )
    ( on b697 b884 )
    ( on b227 b697 )
    ( on b296 b227 )
    ( on b200 b296 )
    ( on b78 b200 )
    ( on b731 b78 )
    ( on b233 b731 )
    ( on b314 b233 )
    ( on b897 b314 )
    ( on b725 b897 )
    ( on b642 b725 )
    ( clear b642 )
  )
  ( :tasks
    ( Make-33Pile b519 b465 b462 b198 b497 b165 b208 b961 b745 b25 b689 b490 b894 b238 b522 b432 b576 b709 b854 b472 b677 b884 b697 b227 b296 b200 b78 b731 b233 b314 b897 b725 b642 )
  )
)
