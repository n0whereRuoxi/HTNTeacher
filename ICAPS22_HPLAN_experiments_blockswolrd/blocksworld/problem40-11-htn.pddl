( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b873 - block
    b359 - block
    b762 - block
    b836 - block
    b229 - block
    b415 - block
    b305 - block
    b907 - block
    b792 - block
    b921 - block
    b628 - block
    b686 - block
    b341 - block
    b495 - block
    b546 - block
    b454 - block
    b582 - block
    b920 - block
    b945 - block
    b204 - block
    b574 - block
    b571 - block
    b217 - block
    b830 - block
    b376 - block
    b467 - block
    b969 - block
    b474 - block
    b456 - block
    b418 - block
    b537 - block
    b719 - block
    b178 - block
    b85 - block
    b759 - block
    b990 - block
    b860 - block
    b949 - block
    b253 - block
    b1 - block
    b606 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b873 )
    ( on b359 b873 )
    ( on b762 b359 )
    ( on b836 b762 )
    ( on b229 b836 )
    ( on b415 b229 )
    ( on b305 b415 )
    ( on b907 b305 )
    ( on b792 b907 )
    ( on b921 b792 )
    ( on b628 b921 )
    ( on b686 b628 )
    ( on b341 b686 )
    ( on b495 b341 )
    ( on b546 b495 )
    ( on b454 b546 )
    ( on b582 b454 )
    ( on b920 b582 )
    ( on b945 b920 )
    ( on b204 b945 )
    ( on b574 b204 )
    ( on b571 b574 )
    ( on b217 b571 )
    ( on b830 b217 )
    ( on b376 b830 )
    ( on b467 b376 )
    ( on b969 b467 )
    ( on b474 b969 )
    ( on b456 b474 )
    ( on b418 b456 )
    ( on b537 b418 )
    ( on b719 b537 )
    ( on b178 b719 )
    ( on b85 b178 )
    ( on b759 b85 )
    ( on b990 b759 )
    ( on b860 b990 )
    ( on b949 b860 )
    ( on b253 b949 )
    ( on b1 b253 )
    ( on b606 b1 )
    ( clear b606 )
  )
  ( :tasks
    ( Make-40Pile b359 b762 b836 b229 b415 b305 b907 b792 b921 b628 b686 b341 b495 b546 b454 b582 b920 b945 b204 b574 b571 b217 b830 b376 b467 b969 b474 b456 b418 b537 b719 b178 b85 b759 b990 b860 b949 b253 b1 b606 )
  )
)
