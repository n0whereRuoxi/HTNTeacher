( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b380 - block
    b278 - block
    b152 - block
    b751 - block
    b337 - block
    b851 - block
    b789 - block
    b827 - block
    b879 - block
    b615 - block
    b638 - block
    b769 - block
    b355 - block
    b426 - block
    b729 - block
    b513 - block
    b665 - block
    b10 - block
    b215 - block
    b687 - block
    b210 - block
    b702 - block
    b567 - block
    b292 - block
    b477 - block
    b781 - block
    b455 - block
    b312 - block
    b886 - block
    b219 - block
    b184 - block
    b454 - block
    b207 - block
    b377 - block
    b216 - block
    b563 - block
    b758 - block
    b943 - block
    b831 - block
    b317 - block
    b400 - block
    b761 - block
    b382 - block
    b161 - block
    b224 - block
    b733 - block
    b358 - block
    b21 - block
    b864 - block
    b293 - block
    b220 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b380 )
    ( on b278 b380 )
    ( on b152 b278 )
    ( on b751 b152 )
    ( on b337 b751 )
    ( on b851 b337 )
    ( on b789 b851 )
    ( on b827 b789 )
    ( on b879 b827 )
    ( on b615 b879 )
    ( on b638 b615 )
    ( on b769 b638 )
    ( on b355 b769 )
    ( on b426 b355 )
    ( on b729 b426 )
    ( on b513 b729 )
    ( on b665 b513 )
    ( on b10 b665 )
    ( on b215 b10 )
    ( on b687 b215 )
    ( on b210 b687 )
    ( on b702 b210 )
    ( on b567 b702 )
    ( on b292 b567 )
    ( on b477 b292 )
    ( on b781 b477 )
    ( on b455 b781 )
    ( on b312 b455 )
    ( on b886 b312 )
    ( on b219 b886 )
    ( on b184 b219 )
    ( on b454 b184 )
    ( on b207 b454 )
    ( on b377 b207 )
    ( on b216 b377 )
    ( on b563 b216 )
    ( on b758 b563 )
    ( on b943 b758 )
    ( on b831 b943 )
    ( on b317 b831 )
    ( on b400 b317 )
    ( on b761 b400 )
    ( on b382 b761 )
    ( on b161 b382 )
    ( on b224 b161 )
    ( on b733 b224 )
    ( on b358 b733 )
    ( on b21 b358 )
    ( on b864 b21 )
    ( on b293 b864 )
    ( on b220 b293 )
    ( clear b220 )
  )
  ( :goal
    ( and
      ( clear b380 )
    )
  )
)
