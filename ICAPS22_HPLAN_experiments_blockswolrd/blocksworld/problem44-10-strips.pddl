( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b821 - block
    b403 - block
    b728 - block
    b203 - block
    b900 - block
    b954 - block
    b409 - block
    b107 - block
    b711 - block
    b475 - block
    b639 - block
    b627 - block
    b299 - block
    b262 - block
    b90 - block
    b763 - block
    b238 - block
    b202 - block
    b738 - block
    b103 - block
    b764 - block
    b660 - block
    b447 - block
    b713 - block
    b157 - block
    b444 - block
    b47 - block
    b376 - block
    b804 - block
    b925 - block
    b800 - block
    b617 - block
    b408 - block
    b92 - block
    b100 - block
    b192 - block
    b196 - block
    b774 - block
    b831 - block
    b549 - block
    b33 - block
    b911 - block
    b53 - block
    b920 - block
    b569 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b821 )
    ( on b403 b821 )
    ( on b728 b403 )
    ( on b203 b728 )
    ( on b900 b203 )
    ( on b954 b900 )
    ( on b409 b954 )
    ( on b107 b409 )
    ( on b711 b107 )
    ( on b475 b711 )
    ( on b639 b475 )
    ( on b627 b639 )
    ( on b299 b627 )
    ( on b262 b299 )
    ( on b90 b262 )
    ( on b763 b90 )
    ( on b238 b763 )
    ( on b202 b238 )
    ( on b738 b202 )
    ( on b103 b738 )
    ( on b764 b103 )
    ( on b660 b764 )
    ( on b447 b660 )
    ( on b713 b447 )
    ( on b157 b713 )
    ( on b444 b157 )
    ( on b47 b444 )
    ( on b376 b47 )
    ( on b804 b376 )
    ( on b925 b804 )
    ( on b800 b925 )
    ( on b617 b800 )
    ( on b408 b617 )
    ( on b92 b408 )
    ( on b100 b92 )
    ( on b192 b100 )
    ( on b196 b192 )
    ( on b774 b196 )
    ( on b831 b774 )
    ( on b549 b831 )
    ( on b33 b549 )
    ( on b911 b33 )
    ( on b53 b911 )
    ( on b920 b53 )
    ( on b569 b920 )
    ( clear b569 )
  )
  ( :goal
    ( and
      ( clear b821 )
    )
  )
)
