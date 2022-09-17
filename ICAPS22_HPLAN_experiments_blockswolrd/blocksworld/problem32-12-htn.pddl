( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b152 - block
    b826 - block
    b453 - block
    b87 - block
    b346 - block
    b751 - block
    b470 - block
    b160 - block
    b62 - block
    b708 - block
    b326 - block
    b90 - block
    b872 - block
    b72 - block
    b730 - block
    b731 - block
    b623 - block
    b215 - block
    b116 - block
    b433 - block
    b157 - block
    b966 - block
    b991 - block
    b403 - block
    b969 - block
    b536 - block
    b404 - block
    b897 - block
    b235 - block
    b445 - block
    b379 - block
    b416 - block
    b507 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b826 b152 )
    ( on b453 b826 )
    ( on b87 b453 )
    ( on b346 b87 )
    ( on b751 b346 )
    ( on b470 b751 )
    ( on b160 b470 )
    ( on b62 b160 )
    ( on b708 b62 )
    ( on b326 b708 )
    ( on b90 b326 )
    ( on b872 b90 )
    ( on b72 b872 )
    ( on b730 b72 )
    ( on b731 b730 )
    ( on b623 b731 )
    ( on b215 b623 )
    ( on b116 b215 )
    ( on b433 b116 )
    ( on b157 b433 )
    ( on b966 b157 )
    ( on b991 b966 )
    ( on b403 b991 )
    ( on b969 b403 )
    ( on b536 b969 )
    ( on b404 b536 )
    ( on b897 b404 )
    ( on b235 b897 )
    ( on b445 b235 )
    ( on b379 b445 )
    ( on b416 b379 )
    ( on b507 b416 )
    ( clear b507 )
  )
  ( :tasks
    ( Make-32Pile b826 b453 b87 b346 b751 b470 b160 b62 b708 b326 b90 b872 b72 b730 b731 b623 b215 b116 b433 b157 b966 b991 b403 b969 b536 b404 b897 b235 b445 b379 b416 b507 )
  )
)
