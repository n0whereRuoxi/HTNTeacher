( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city486 - city
    city68 - city
    city548 - city
    city262 - city
    city884 - city
    city782 - city
    city5 - city
    city939 - city
    city534 - city
    city406 - city
    city31 - city
    city746 - city
    city791 - city
    city453 - city
    city698 - city
    person796 - person
    person574 - person
    person499 - person
    person479 - person
    person168 - person
    person187 - person
    person171 - person
    person951 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person796 city698 )
    ( person-at person574 city486 )
    ( person-at person499 city406 )
    ( person-at person479 city406 )
    ( person-at person168 city406 )
    ( person-at person187 city548 )
    ( person-at person171 city782 )
    ( person-at person951 city884 )
  )
  ( :tasks
    ( Fly-8Ppl person796 person574 person499 person479 person168 person187 person171 person951 city000 )
  )
)
