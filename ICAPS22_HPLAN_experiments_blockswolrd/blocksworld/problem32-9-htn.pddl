( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b855 - block
    b271 - block
    b192 - block
    b743 - block
    b920 - block
    b267 - block
    b708 - block
    b175 - block
    b219 - block
    b641 - block
    b368 - block
    b136 - block
    b485 - block
    b68 - block
    b745 - block
    b143 - block
    b156 - block
    b605 - block
    b296 - block
    b814 - block
    b330 - block
    b335 - block
    b276 - block
    b739 - block
    b107 - block
    b666 - block
    b28 - block
    b831 - block
    b498 - block
    b475 - block
    b826 - block
    b770 - block
    b664 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b855 )
    ( on b271 b855 )
    ( on b192 b271 )
    ( on b743 b192 )
    ( on b920 b743 )
    ( on b267 b920 )
    ( on b708 b267 )
    ( on b175 b708 )
    ( on b219 b175 )
    ( on b641 b219 )
    ( on b368 b641 )
    ( on b136 b368 )
    ( on b485 b136 )
    ( on b68 b485 )
    ( on b745 b68 )
    ( on b143 b745 )
    ( on b156 b143 )
    ( on b605 b156 )
    ( on b296 b605 )
    ( on b814 b296 )
    ( on b330 b814 )
    ( on b335 b330 )
    ( on b276 b335 )
    ( on b739 b276 )
    ( on b107 b739 )
    ( on b666 b107 )
    ( on b28 b666 )
    ( on b831 b28 )
    ( on b498 b831 )
    ( on b475 b498 )
    ( on b826 b475 )
    ( on b770 b826 )
    ( on b664 b770 )
    ( clear b664 )
  )
  ( :tasks
    ( Make-32Pile b271 b192 b743 b920 b267 b708 b175 b219 b641 b368 b136 b485 b68 b745 b143 b156 b605 b296 b814 b330 b335 b276 b739 b107 b666 b28 b831 b498 b475 b826 b770 b664 )
  )
)
