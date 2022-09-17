( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city202 - city
    city107 - city
    city956 - city
    city327 - city
    city317 - city
    city780 - city
    city919 - city
    city716 - city
    city272 - city
    city135 - city
    city49 - city
    city153 - city
    city994 - city
    city261 - city
    city644 - city
    city539 - city
    city33 - city
    city620 - city
    city45 - city
    city876 - city
    city536 - city
    city796 - city
    person373 - person
    person995 - person
    person744 - person
    person533 - person
    person927 - person
    person317 - person
    person768 - person
    person133 - person
    person598 - person
    person865 - person
    person514 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person373 city33 )
    ( person-at person995 city716 )
    ( person-at person744 city135 )
    ( person-at person533 city261 )
    ( person-at person927 city644 )
    ( person-at person317 city272 )
    ( person-at person768 city272 )
    ( person-at person133 city153 )
    ( person-at person598 city317 )
    ( person-at person865 city202 )
    ( person-at person514 city202 )
  )
  ( :tasks
    ( Fly-11Ppl person373 person995 person744 person533 person927 person317 person768 person133 person598 person865 person514 city000 )
  )
)
