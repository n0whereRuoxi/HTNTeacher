( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-194 - location
    l000-512 - location
    l000-663 - location
    l000-581 - location
    l000-556 - location
    l000-551 - location
    l000-881 - location
    l000-33 - location
    l000-589 - location
    l000-59 - location
    l000-156 - location
    l000-515 - location
    l000-441 - location
    l000-363 - location
    p740 - obj
    p296 - obj
    p237 - obj
    p859 - obj
    p429 - obj
    p745 - obj
    p423 - obj
    p890 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-194 c000 )
    ( in-city l000-512 c000 )
    ( in-city l000-663 c000 )
    ( in-city l000-581 c000 )
    ( in-city l000-556 c000 )
    ( in-city l000-551 c000 )
    ( in-city l000-881 c000 )
    ( in-city l000-33 c000 )
    ( in-city l000-589 c000 )
    ( in-city l000-59 c000 )
    ( in-city l000-156 c000 )
    ( in-city l000-515 c000 )
    ( in-city l000-441 c000 )
    ( in-city l000-363 c000 )
    ( obj-at p740 l000-581 )
    ( obj-at p296 l000-156 )
    ( obj-at p237 l000-556 )
    ( obj-at p859 l000-156 )
    ( obj-at p429 l000-59 )
    ( obj-at p745 l000-512 )
    ( obj-at p423 l000-512 )
    ( obj-at p890 l000-441 )
    ( greater-than p296 p740 )
    ( greater-than p237 p740 )
    ( greater-than p237 p296 )
    ( greater-than p859 p740 )
    ( greater-than p859 p296 )
    ( greater-than p859 p237 )
    ( greater-than p429 p740 )
    ( greater-than p429 p296 )
    ( greater-than p429 p237 )
    ( greater-than p429 p859 )
    ( greater-than p745 p740 )
    ( greater-than p745 p296 )
    ( greater-than p745 p237 )
    ( greater-than p745 p859 )
    ( greater-than p745 p429 )
    ( greater-than p423 p740 )
    ( greater-than p423 p296 )
    ( greater-than p423 p237 )
    ( greater-than p423 p859 )
    ( greater-than p423 p429 )
    ( greater-than p423 p745 )
    ( greater-than p890 p740 )
    ( greater-than p890 p296 )
    ( greater-than p890 p237 )
    ( greater-than p890 p859 )
    ( greater-than p890 p429 )
    ( greater-than p890 p745 )
    ( greater-than p890 p423 )
  )
  ( :tasks
    ( Deliver-8Pkg p740 p296 p237 p859 p429 p745 p423 p890 l000-000 )
  )
)
