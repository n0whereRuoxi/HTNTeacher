( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-208 - location
    l000-154 - location
    l000-492 - location
    l000-380 - location
    l000-743 - location
    l000-527 - location
    l000-879 - location
    l000-901 - location
    l000-945 - location
    l000-745 - location
    l000-929 - location
    l000-194 - location
    l000-537 - location
    p472 - obj
    p949 - obj
    p580 - obj
    p219 - obj
    p624 - obj
    p644 - obj
    p922 - obj
    p966 - obj
    p279 - obj
    p981 - obj
    p899 - obj
    p486 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-208 c000 )
    ( in-city l000-154 c000 )
    ( in-city l000-492 c000 )
    ( in-city l000-380 c000 )
    ( in-city l000-743 c000 )
    ( in-city l000-527 c000 )
    ( in-city l000-879 c000 )
    ( in-city l000-901 c000 )
    ( in-city l000-945 c000 )
    ( in-city l000-745 c000 )
    ( in-city l000-929 c000 )
    ( in-city l000-194 c000 )
    ( in-city l000-537 c000 )
    ( obj-at p472 l000-901 )
    ( obj-at p949 l000-743 )
    ( obj-at p580 l000-901 )
    ( obj-at p219 l000-154 )
    ( obj-at p624 l000-929 )
    ( obj-at p644 l000-154 )
    ( obj-at p922 l000-745 )
    ( obj-at p966 l000-929 )
    ( obj-at p279 l000-154 )
    ( obj-at p981 l000-901 )
    ( obj-at p899 l000-208 )
    ( obj-at p486 l000-901 )
    ( greater-than p949 p472 )
    ( greater-than p580 p472 )
    ( greater-than p580 p949 )
    ( greater-than p219 p472 )
    ( greater-than p219 p949 )
    ( greater-than p219 p580 )
    ( greater-than p624 p472 )
    ( greater-than p624 p949 )
    ( greater-than p624 p580 )
    ( greater-than p624 p219 )
    ( greater-than p644 p472 )
    ( greater-than p644 p949 )
    ( greater-than p644 p580 )
    ( greater-than p644 p219 )
    ( greater-than p644 p624 )
    ( greater-than p922 p472 )
    ( greater-than p922 p949 )
    ( greater-than p922 p580 )
    ( greater-than p922 p219 )
    ( greater-than p922 p624 )
    ( greater-than p922 p644 )
    ( greater-than p966 p472 )
    ( greater-than p966 p949 )
    ( greater-than p966 p580 )
    ( greater-than p966 p219 )
    ( greater-than p966 p624 )
    ( greater-than p966 p644 )
    ( greater-than p966 p922 )
    ( greater-than p279 p472 )
    ( greater-than p279 p949 )
    ( greater-than p279 p580 )
    ( greater-than p279 p219 )
    ( greater-than p279 p624 )
    ( greater-than p279 p644 )
    ( greater-than p279 p922 )
    ( greater-than p279 p966 )
    ( greater-than p981 p472 )
    ( greater-than p981 p949 )
    ( greater-than p981 p580 )
    ( greater-than p981 p219 )
    ( greater-than p981 p624 )
    ( greater-than p981 p644 )
    ( greater-than p981 p922 )
    ( greater-than p981 p966 )
    ( greater-than p981 p279 )
    ( greater-than p899 p472 )
    ( greater-than p899 p949 )
    ( greater-than p899 p580 )
    ( greater-than p899 p219 )
    ( greater-than p899 p624 )
    ( greater-than p899 p644 )
    ( greater-than p899 p922 )
    ( greater-than p899 p966 )
    ( greater-than p899 p279 )
    ( greater-than p899 p981 )
    ( greater-than p486 p472 )
    ( greater-than p486 p949 )
    ( greater-than p486 p580 )
    ( greater-than p486 p219 )
    ( greater-than p486 p624 )
    ( greater-than p486 p644 )
    ( greater-than p486 p922 )
    ( greater-than p486 p966 )
    ( greater-than p486 p279 )
    ( greater-than p486 p981 )
    ( greater-than p486 p899 )
  )
  ( :goal
    ( and
      ( obj-at p472 l000-000 )
      ( obj-at p949 l000-000 )
      ( obj-at p580 l000-000 )
      ( obj-at p219 l000-000 )
      ( obj-at p624 l000-000 )
      ( obj-at p644 l000-000 )
      ( obj-at p922 l000-000 )
      ( obj-at p966 l000-000 )
      ( obj-at p279 l000-000 )
      ( obj-at p981 l000-000 )
      ( obj-at p899 l000-000 )
      ( obj-at p486 l000-000 )
    )
  )
)
