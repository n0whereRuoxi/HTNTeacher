( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b827 - block
    b493 - block
    b293 - block
    b507 - block
    b965 - block
    b688 - block
    b607 - block
    b902 - block
    b641 - block
    b628 - block
    b444 - block
    b440 - block
    b980 - block
    b682 - block
    b294 - block
    b815 - block
    b116 - block
    b817 - block
    b864 - block
    b596 - block
    b8 - block
    b868 - block
    b390 - block
    b148 - block
    b642 - block
    b926 - block
    b708 - block
    b733 - block
    b612 - block
    b427 - block
    b674 - block
    b325 - block
    b931 - block
    b631 - block
    b710 - block
    b854 - block
    b762 - block
    b439 - block
    b265 - block
    b255 - block
    b150 - block
    b949 - block
    b24 - block
    b482 - block
    b418 - block
    b955 - block
    b551 - block
    b768 - block
    b620 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b827 )
    ( on b493 b827 )
    ( on b293 b493 )
    ( on b507 b293 )
    ( on b965 b507 )
    ( on b688 b965 )
    ( on b607 b688 )
    ( on b902 b607 )
    ( on b641 b902 )
    ( on b628 b641 )
    ( on b444 b628 )
    ( on b440 b444 )
    ( on b980 b440 )
    ( on b682 b980 )
    ( on b294 b682 )
    ( on b815 b294 )
    ( on b116 b815 )
    ( on b817 b116 )
    ( on b864 b817 )
    ( on b596 b864 )
    ( on b8 b596 )
    ( on b868 b8 )
    ( on b390 b868 )
    ( on b148 b390 )
    ( on b642 b148 )
    ( on b926 b642 )
    ( on b708 b926 )
    ( on b733 b708 )
    ( on b612 b733 )
    ( on b427 b612 )
    ( on b674 b427 )
    ( on b325 b674 )
    ( on b931 b325 )
    ( on b631 b931 )
    ( on b710 b631 )
    ( on b854 b710 )
    ( on b762 b854 )
    ( on b439 b762 )
    ( on b265 b439 )
    ( on b255 b265 )
    ( on b150 b255 )
    ( on b949 b150 )
    ( on b24 b949 )
    ( on b482 b24 )
    ( on b418 b482 )
    ( on b955 b418 )
    ( on b551 b955 )
    ( on b768 b551 )
    ( on b620 b768 )
    ( clear b620 )
  )
  ( :goal
    ( and
      ( clear b827 )
    )
  )
)
