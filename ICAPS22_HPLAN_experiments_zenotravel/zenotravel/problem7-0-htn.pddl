( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city564 - city
    city638 - city
    city699 - city
    city788 - city
    city107 - city
    city767 - city
    city831 - city
    person249 - person
    person259 - person
    person528 - person
    person101 - person
    person220 - person
    person18 - person
    person990 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person249 city638 )
    ( person-at person259 city788 )
    ( person-at person528 city638 )
    ( person-at person101 city699 )
    ( person-at person220 city699 )
    ( person-at person18 city831 )
    ( person-at person990 city767 )
  )
  ( :tasks
    ( Fly-7Ppl person249 person259 person528 person101 person220 person18 person990 city000 )
  )
)
