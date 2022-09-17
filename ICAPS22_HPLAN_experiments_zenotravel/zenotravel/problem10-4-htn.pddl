( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city822 - city
    city336 - city
    city569 - city
    city820 - city
    city150 - city
    city765 - city
    city645 - city
    city385 - city
    city64 - city
    city91 - city
    city405 - city
    city788 - city
    city78 - city
    city795 - city
    city909 - city
    city191 - city
    city442 - city
    city72 - city
    person949 - person
    person130 - person
    person725 - person
    person27 - person
    person131 - person
    person926 - person
    person942 - person
    person951 - person
    person808 - person
    person893 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person949 city150 )
    ( person-at person130 city64 )
    ( person-at person725 city909 )
    ( person-at person27 city765 )
    ( person-at person131 city405 )
    ( person-at person926 city91 )
    ( person-at person942 city569 )
    ( person-at person951 city909 )
    ( person-at person808 city822 )
    ( person-at person893 city336 )
  )
  ( :tasks
    ( Fly-10Ppl person949 person130 person725 person27 person131 person926 person942 person951 person808 person893 city000 )
  )
)
