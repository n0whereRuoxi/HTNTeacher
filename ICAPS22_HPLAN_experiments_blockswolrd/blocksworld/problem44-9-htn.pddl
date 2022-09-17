( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b270 - block
    b186 - block
    b428 - block
    b916 - block
    b469 - block
    b818 - block
    b911 - block
    b880 - block
    b340 - block
    b676 - block
    b506 - block
    b718 - block
    b568 - block
    b927 - block
    b170 - block
    b638 - block
    b5 - block
    b814 - block
    b414 - block
    b87 - block
    b845 - block
    b443 - block
    b567 - block
    b900 - block
    b174 - block
    b696 - block
    b399 - block
    b710 - block
    b804 - block
    b491 - block
    b232 - block
    b609 - block
    b862 - block
    b979 - block
    b999 - block
    b352 - block
    b136 - block
    b83 - block
    b677 - block
    b589 - block
    b528 - block
    b226 - block
    b60 - block
    b331 - block
    b868 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b270 )
    ( on b186 b270 )
    ( on b428 b186 )
    ( on b916 b428 )
    ( on b469 b916 )
    ( on b818 b469 )
    ( on b911 b818 )
    ( on b880 b911 )
    ( on b340 b880 )
    ( on b676 b340 )
    ( on b506 b676 )
    ( on b718 b506 )
    ( on b568 b718 )
    ( on b927 b568 )
    ( on b170 b927 )
    ( on b638 b170 )
    ( on b5 b638 )
    ( on b814 b5 )
    ( on b414 b814 )
    ( on b87 b414 )
    ( on b845 b87 )
    ( on b443 b845 )
    ( on b567 b443 )
    ( on b900 b567 )
    ( on b174 b900 )
    ( on b696 b174 )
    ( on b399 b696 )
    ( on b710 b399 )
    ( on b804 b710 )
    ( on b491 b804 )
    ( on b232 b491 )
    ( on b609 b232 )
    ( on b862 b609 )
    ( on b979 b862 )
    ( on b999 b979 )
    ( on b352 b999 )
    ( on b136 b352 )
    ( on b83 b136 )
    ( on b677 b83 )
    ( on b589 b677 )
    ( on b528 b589 )
    ( on b226 b528 )
    ( on b60 b226 )
    ( on b331 b60 )
    ( on b868 b331 )
    ( clear b868 )
  )
  ( :tasks
    ( Make-44Pile b186 b428 b916 b469 b818 b911 b880 b340 b676 b506 b718 b568 b927 b170 b638 b5 b814 b414 b87 b845 b443 b567 b900 b174 b696 b399 b710 b804 b491 b232 b609 b862 b979 b999 b352 b136 b83 b677 b589 b528 b226 b60 b331 b868 )
  )
)
