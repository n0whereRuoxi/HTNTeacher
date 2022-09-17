( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b886 - block
    b72 - block
    b305 - block
    b1 - block
    b949 - block
    b399 - block
    b851 - block
    b821 - block
    b876 - block
    b857 - block
    b437 - block
    b936 - block
    b31 - block
    b991 - block
    b77 - block
    b690 - block
    b267 - block
    b415 - block
    b735 - block
    b793 - block
    b575 - block
    b929 - block
    b591 - block
    b501 - block
    b972 - block
    b634 - block
    b234 - block
    b53 - block
    b689 - block
    b840 - block
    b916 - block
    b16 - block
    b558 - block
    b443 - block
    b705 - block
    b237 - block
    b346 - block
    b919 - block
    b775 - block
    b723 - block
    b626 - block
    b824 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b886 )
    ( on b72 b886 )
    ( on b305 b72 )
    ( on b1 b305 )
    ( on b949 b1 )
    ( on b399 b949 )
    ( on b851 b399 )
    ( on b821 b851 )
    ( on b876 b821 )
    ( on b857 b876 )
    ( on b437 b857 )
    ( on b936 b437 )
    ( on b31 b936 )
    ( on b991 b31 )
    ( on b77 b991 )
    ( on b690 b77 )
    ( on b267 b690 )
    ( on b415 b267 )
    ( on b735 b415 )
    ( on b793 b735 )
    ( on b575 b793 )
    ( on b929 b575 )
    ( on b591 b929 )
    ( on b501 b591 )
    ( on b972 b501 )
    ( on b634 b972 )
    ( on b234 b634 )
    ( on b53 b234 )
    ( on b689 b53 )
    ( on b840 b689 )
    ( on b916 b840 )
    ( on b16 b916 )
    ( on b558 b16 )
    ( on b443 b558 )
    ( on b705 b443 )
    ( on b237 b705 )
    ( on b346 b237 )
    ( on b919 b346 )
    ( on b775 b919 )
    ( on b723 b775 )
    ( on b626 b723 )
    ( on b824 b626 )
    ( clear b824 )
  )
  ( :goal
    ( and
      ( clear b886 )
    )
  )
)
