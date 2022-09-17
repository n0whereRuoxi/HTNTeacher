( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b296 - block
    b220 - block
    b810 - block
    b771 - block
    b519 - block
    b380 - block
    b2 - block
    b173 - block
    b530 - block
    b172 - block
    b16 - block
    b47 - block
    b946 - block
    b565 - block
    b76 - block
    b849 - block
    b110 - block
    b399 - block
    b56 - block
    b360 - block
    b212 - block
    b858 - block
    b726 - block
    b923 - block
    b906 - block
    b684 - block
    b705 - block
    b460 - block
    b559 - block
    b423 - block
    b43 - block
    b183 - block
    b808 - block
    b985 - block
    b114 - block
    b911 - block
    b835 - block
    b710 - block
    b988 - block
    b814 - block
    b620 - block
    b472 - block
    b670 - block
    b975 - block
    b392 - block
    b728 - block
    b90 - block
    b449 - block
    b753 - block
    b929 - block
    b470 - block
    b45 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b296 )
    ( on b220 b296 )
    ( on b810 b220 )
    ( on b771 b810 )
    ( on b519 b771 )
    ( on b380 b519 )
    ( on b2 b380 )
    ( on b173 b2 )
    ( on b530 b173 )
    ( on b172 b530 )
    ( on b16 b172 )
    ( on b47 b16 )
    ( on b946 b47 )
    ( on b565 b946 )
    ( on b76 b565 )
    ( on b849 b76 )
    ( on b110 b849 )
    ( on b399 b110 )
    ( on b56 b399 )
    ( on b360 b56 )
    ( on b212 b360 )
    ( on b858 b212 )
    ( on b726 b858 )
    ( on b923 b726 )
    ( on b906 b923 )
    ( on b684 b906 )
    ( on b705 b684 )
    ( on b460 b705 )
    ( on b559 b460 )
    ( on b423 b559 )
    ( on b43 b423 )
    ( on b183 b43 )
    ( on b808 b183 )
    ( on b985 b808 )
    ( on b114 b985 )
    ( on b911 b114 )
    ( on b835 b911 )
    ( on b710 b835 )
    ( on b988 b710 )
    ( on b814 b988 )
    ( on b620 b814 )
    ( on b472 b620 )
    ( on b670 b472 )
    ( on b975 b670 )
    ( on b392 b975 )
    ( on b728 b392 )
    ( on b90 b728 )
    ( on b449 b90 )
    ( on b753 b449 )
    ( on b929 b753 )
    ( on b470 b929 )
    ( on b45 b470 )
    ( clear b45 )
  )
  ( :goal
    ( and
      ( clear b296 )
    )
  )
)
