( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city427 - city
    city179 - city
    city871 - city
    city793 - city
    person224 - person
    person930 - person
    person604 - person
    person313 - person
    person33 - person
    person394 - person
    person456 - person
    person533 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person224 city427 )
    ( person-at person930 city871 )
    ( person-at person604 city179 )
    ( person-at person313 city179 )
    ( person-at person33 city427 )
    ( person-at person394 city793 )
    ( person-at person456 city871 )
    ( person-at person533 city871 )
  )
  ( :tasks
    ( Fly-8Ppl person224 person930 person604 person313 person33 person394 person456 person533 city000 )
  )
)