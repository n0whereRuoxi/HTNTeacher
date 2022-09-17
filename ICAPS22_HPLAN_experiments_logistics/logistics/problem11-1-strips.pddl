( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-431 - location
    l000-72 - location
    l000-600 - location
    l000-53 - location
    l000-556 - location
    l000-439 - location
    l000-381 - location
    l000-853 - location
    l000-487 - location
    l000-412 - location
    l000-871 - location
    l000-181 - location
    l000-553 - location
    l000-371 - location
    l000-398 - location
    l000-658 - location
    p479 - obj
    p727 - obj
    p52 - obj
    p467 - obj
    p833 - obj
    p989 - obj
    p41 - obj
    p442 - obj
    p637 - obj
    p168 - obj
    p943 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-431 c000 )
    ( in-city l000-72 c000 )
    ( in-city l000-600 c000 )
    ( in-city l000-53 c000 )
    ( in-city l000-556 c000 )
    ( in-city l000-439 c000 )
    ( in-city l000-381 c000 )
    ( in-city l000-853 c000 )
    ( in-city l000-487 c000 )
    ( in-city l000-412 c000 )
    ( in-city l000-871 c000 )
    ( in-city l000-181 c000 )
    ( in-city l000-553 c000 )
    ( in-city l000-371 c000 )
    ( in-city l000-398 c000 )
    ( in-city l000-658 c000 )
    ( obj-at p479 l000-72 )
    ( obj-at p727 l000-398 )
    ( obj-at p52 l000-398 )
    ( obj-at p467 l000-600 )
    ( obj-at p833 l000-556 )
    ( obj-at p989 l000-181 )
    ( obj-at p41 l000-871 )
    ( obj-at p442 l000-431 )
    ( obj-at p637 l000-871 )
    ( obj-at p168 l000-398 )
    ( obj-at p943 l000-412 )
    ( greater-than p727 p479 )
    ( greater-than p52 p479 )
    ( greater-than p52 p727 )
    ( greater-than p467 p479 )
    ( greater-than p467 p727 )
    ( greater-than p467 p52 )
    ( greater-than p833 p479 )
    ( greater-than p833 p727 )
    ( greater-than p833 p52 )
    ( greater-than p833 p467 )
    ( greater-than p989 p479 )
    ( greater-than p989 p727 )
    ( greater-than p989 p52 )
    ( greater-than p989 p467 )
    ( greater-than p989 p833 )
    ( greater-than p41 p479 )
    ( greater-than p41 p727 )
    ( greater-than p41 p52 )
    ( greater-than p41 p467 )
    ( greater-than p41 p833 )
    ( greater-than p41 p989 )
    ( greater-than p442 p479 )
    ( greater-than p442 p727 )
    ( greater-than p442 p52 )
    ( greater-than p442 p467 )
    ( greater-than p442 p833 )
    ( greater-than p442 p989 )
    ( greater-than p442 p41 )
    ( greater-than p637 p479 )
    ( greater-than p637 p727 )
    ( greater-than p637 p52 )
    ( greater-than p637 p467 )
    ( greater-than p637 p833 )
    ( greater-than p637 p989 )
    ( greater-than p637 p41 )
    ( greater-than p637 p442 )
    ( greater-than p168 p479 )
    ( greater-than p168 p727 )
    ( greater-than p168 p52 )
    ( greater-than p168 p467 )
    ( greater-than p168 p833 )
    ( greater-than p168 p989 )
    ( greater-than p168 p41 )
    ( greater-than p168 p442 )
    ( greater-than p168 p637 )
    ( greater-than p943 p479 )
    ( greater-than p943 p727 )
    ( greater-than p943 p52 )
    ( greater-than p943 p467 )
    ( greater-than p943 p833 )
    ( greater-than p943 p989 )
    ( greater-than p943 p41 )
    ( greater-than p943 p442 )
    ( greater-than p943 p637 )
    ( greater-than p943 p168 )
  )
  ( :goal
    ( and
      ( obj-at p479 l000-000 )
      ( obj-at p727 l000-000 )
      ( obj-at p52 l000-000 )
      ( obj-at p467 l000-000 )
      ( obj-at p833 l000-000 )
      ( obj-at p989 l000-000 )
      ( obj-at p41 l000-000 )
      ( obj-at p442 l000-000 )
      ( obj-at p637 l000-000 )
      ( obj-at p168 l000-000 )
      ( obj-at p943 l000-000 )
    )
  )
)
