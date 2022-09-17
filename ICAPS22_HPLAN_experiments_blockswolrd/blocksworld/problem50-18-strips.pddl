( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b661 - block
    b431 - block
    b785 - block
    b235 - block
    b629 - block
    b215 - block
    b866 - block
    b220 - block
    b348 - block
    b197 - block
    b405 - block
    b616 - block
    b750 - block
    b665 - block
    b270 - block
    b908 - block
    b463 - block
    b909 - block
    b676 - block
    b917 - block
    b790 - block
    b693 - block
    b330 - block
    b502 - block
    b748 - block
    b178 - block
    b638 - block
    b18 - block
    b321 - block
    b172 - block
    b817 - block
    b287 - block
    b424 - block
    b571 - block
    b369 - block
    b894 - block
    b897 - block
    b726 - block
    b947 - block
    b707 - block
    b761 - block
    b42 - block
    b442 - block
    b13 - block
    b55 - block
    b951 - block
    b105 - block
    b974 - block
    b198 - block
    b260 - block
    b371 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b661 )
    ( on b431 b661 )
    ( on b785 b431 )
    ( on b235 b785 )
    ( on b629 b235 )
    ( on b215 b629 )
    ( on b866 b215 )
    ( on b220 b866 )
    ( on b348 b220 )
    ( on b197 b348 )
    ( on b405 b197 )
    ( on b616 b405 )
    ( on b750 b616 )
    ( on b665 b750 )
    ( on b270 b665 )
    ( on b908 b270 )
    ( on b463 b908 )
    ( on b909 b463 )
    ( on b676 b909 )
    ( on b917 b676 )
    ( on b790 b917 )
    ( on b693 b790 )
    ( on b330 b693 )
    ( on b502 b330 )
    ( on b748 b502 )
    ( on b178 b748 )
    ( on b638 b178 )
    ( on b18 b638 )
    ( on b321 b18 )
    ( on b172 b321 )
    ( on b817 b172 )
    ( on b287 b817 )
    ( on b424 b287 )
    ( on b571 b424 )
    ( on b369 b571 )
    ( on b894 b369 )
    ( on b897 b894 )
    ( on b726 b897 )
    ( on b947 b726 )
    ( on b707 b947 )
    ( on b761 b707 )
    ( on b42 b761 )
    ( on b442 b42 )
    ( on b13 b442 )
    ( on b55 b13 )
    ( on b951 b55 )
    ( on b105 b951 )
    ( on b974 b105 )
    ( on b198 b974 )
    ( on b260 b198 )
    ( on b371 b260 )
    ( clear b371 )
  )
  ( :goal
    ( and
      ( clear b661 )
    )
  )
)
