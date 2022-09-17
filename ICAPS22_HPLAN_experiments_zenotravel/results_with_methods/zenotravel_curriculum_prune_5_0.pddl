( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-5PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17482 - PERSON
      ?auto_17481 - CITY
    )
    :vars
    (
      ?auto_17485 - FLEVEL
      ?auto_17484 - FLEVEL
      ?auto_17486 - CITY
      ?auto_17483 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17485 ?auto_17484 ) ( PERSON-AT ?auto_17482 ?auto_17486 ) ( AIRCRAFT-AT ?auto_17483 ?auto_17481 ) ( FUEL-LEVEL ?auto_17483 ?auto_17485 ) ( not ( = ?auto_17481 ?auto_17486 ) ) ( not ( = ?auto_17485 ?auto_17484 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_17483 ?auto_17481 ?auto_17485 ?auto_17484 )
      ( !FLY ?auto_17483 ?auto_17481 ?auto_17486 ?auto_17484 ?auto_17485 )
      ( !REFUEL ?auto_17483 ?auto_17486 ?auto_17485 ?auto_17484 )
      ( !BOARD ?auto_17482 ?auto_17483 ?auto_17486 )
      ( !FLY ?auto_17483 ?auto_17486 ?auto_17481 ?auto_17484 ?auto_17485 )
      ( !DEBARK ?auto_17482 ?auto_17483 ?auto_17481 )
      ( FLY-1PPL-VERIFY ?auto_17482 ?auto_17481 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17505 - PERSON
      ?auto_17506 - PERSON
      ?auto_17504 - CITY
    )
    :vars
    (
      ?auto_17510 - FLEVEL
      ?auto_17509 - FLEVEL
      ?auto_17507 - CITY
      ?auto_17511 - CITY
      ?auto_17508 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17510 ?auto_17509 ) ( PERSON-AT ?auto_17506 ?auto_17507 ) ( not ( = ?auto_17504 ?auto_17507 ) ) ( not ( = ?auto_17510 ?auto_17509 ) ) ( PERSON-AT ?auto_17505 ?auto_17511 ) ( AIRCRAFT-AT ?auto_17508 ?auto_17504 ) ( FUEL-LEVEL ?auto_17508 ?auto_17510 ) ( not ( = ?auto_17504 ?auto_17511 ) ) ( not ( = ?auto_17505 ?auto_17506 ) ) ( not ( = ?auto_17507 ?auto_17511 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_17505 ?auto_17504 )
      ( FLY-1PPL ?auto_17506 ?auto_17504 )
      ( FLY-2PPL-VERIFY ?auto_17505 ?auto_17506 ?auto_17504 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17619 - PERSON
      ?auto_17620 - PERSON
      ?auto_17621 - PERSON
      ?auto_17618 - CITY
    )
    :vars
    (
      ?auto_17624 - FLEVEL
      ?auto_17622 - FLEVEL
      ?auto_17623 - CITY
      ?auto_17626 - CITY
      ?auto_17625 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17624 ?auto_17622 ) ( PERSON-AT ?auto_17621 ?auto_17623 ) ( not ( = ?auto_17618 ?auto_17623 ) ) ( not ( = ?auto_17624 ?auto_17622 ) ) ( PERSON-AT ?auto_17620 ?auto_17626 ) ( not ( = ?auto_17618 ?auto_17626 ) ) ( PERSON-AT ?auto_17619 ?auto_17623 ) ( AIRCRAFT-AT ?auto_17625 ?auto_17618 ) ( FUEL-LEVEL ?auto_17625 ?auto_17624 ) ( not ( = ?auto_17619 ?auto_17620 ) ) ( not ( = ?auto_17626 ?auto_17623 ) ) ( not ( = ?auto_17619 ?auto_17621 ) ) ( not ( = ?auto_17620 ?auto_17621 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17619 ?auto_17620 ?auto_17618 )
      ( FLY-1PPL ?auto_17621 ?auto_17618 )
      ( FLY-3PPL-VERIFY ?auto_17619 ?auto_17620 ?auto_17621 ?auto_17618 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17638 - PERSON
      ?auto_17639 - PERSON
      ?auto_17640 - PERSON
      ?auto_17637 - CITY
    )
    :vars
    (
      ?auto_17644 - FLEVEL
      ?auto_17643 - FLEVEL
      ?auto_17642 - CITY
      ?auto_17641 - CITY
      ?auto_17645 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17644 ?auto_17643 ) ( PERSON-AT ?auto_17639 ?auto_17642 ) ( not ( = ?auto_17637 ?auto_17642 ) ) ( not ( = ?auto_17644 ?auto_17643 ) ) ( PERSON-AT ?auto_17640 ?auto_17641 ) ( not ( = ?auto_17637 ?auto_17641 ) ) ( PERSON-AT ?auto_17638 ?auto_17642 ) ( AIRCRAFT-AT ?auto_17645 ?auto_17637 ) ( FUEL-LEVEL ?auto_17645 ?auto_17644 ) ( not ( = ?auto_17638 ?auto_17640 ) ) ( not ( = ?auto_17641 ?auto_17642 ) ) ( not ( = ?auto_17638 ?auto_17639 ) ) ( not ( = ?auto_17640 ?auto_17639 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_17638 ?auto_17640 ?auto_17639 ?auto_17637 )
      ( FLY-3PPL-VERIFY ?auto_17638 ?auto_17639 ?auto_17640 ?auto_17637 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17657 - PERSON
      ?auto_17658 - PERSON
      ?auto_17659 - PERSON
      ?auto_17656 - CITY
    )
    :vars
    (
      ?auto_17662 - FLEVEL
      ?auto_17664 - FLEVEL
      ?auto_17661 - CITY
      ?auto_17660 - CITY
      ?auto_17663 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17662 ?auto_17664 ) ( PERSON-AT ?auto_17659 ?auto_17661 ) ( not ( = ?auto_17656 ?auto_17661 ) ) ( not ( = ?auto_17662 ?auto_17664 ) ) ( PERSON-AT ?auto_17657 ?auto_17660 ) ( not ( = ?auto_17656 ?auto_17660 ) ) ( PERSON-AT ?auto_17658 ?auto_17661 ) ( AIRCRAFT-AT ?auto_17663 ?auto_17656 ) ( FUEL-LEVEL ?auto_17663 ?auto_17662 ) ( not ( = ?auto_17658 ?auto_17657 ) ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( not ( = ?auto_17658 ?auto_17659 ) ) ( not ( = ?auto_17657 ?auto_17659 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_17658 ?auto_17659 ?auto_17657 ?auto_17656 )
      ( FLY-3PPL-VERIFY ?auto_17657 ?auto_17658 ?auto_17659 ?auto_17656 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_18773 - PERSON
      ?auto_18774 - PERSON
      ?auto_18775 - PERSON
      ?auto_18776 - PERSON
      ?auto_18772 - CITY
    )
    :vars
    (
      ?auto_18780 - FLEVEL
      ?auto_18778 - FLEVEL
      ?auto_18777 - CITY
      ?auto_18782 - CITY
      ?auto_18781 - CITY
      ?auto_18779 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18780 ?auto_18778 ) ( PERSON-AT ?auto_18776 ?auto_18777 ) ( not ( = ?auto_18772 ?auto_18777 ) ) ( not ( = ?auto_18780 ?auto_18778 ) ) ( PERSON-AT ?auto_18775 ?auto_18782 ) ( not ( = ?auto_18772 ?auto_18782 ) ) ( PERSON-AT ?auto_18774 ?auto_18781 ) ( not ( = ?auto_18772 ?auto_18781 ) ) ( PERSON-AT ?auto_18773 ?auto_18782 ) ( AIRCRAFT-AT ?auto_18779 ?auto_18772 ) ( FUEL-LEVEL ?auto_18779 ?auto_18780 ) ( not ( = ?auto_18773 ?auto_18774 ) ) ( not ( = ?auto_18781 ?auto_18782 ) ) ( not ( = ?auto_18773 ?auto_18775 ) ) ( not ( = ?auto_18774 ?auto_18775 ) ) ( not ( = ?auto_18773 ?auto_18776 ) ) ( not ( = ?auto_18774 ?auto_18776 ) ) ( not ( = ?auto_18775 ?auto_18776 ) ) ( not ( = ?auto_18777 ?auto_18782 ) ) ( not ( = ?auto_18777 ?auto_18781 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_18773 ?auto_18775 ?auto_18774 ?auto_18772 )
      ( FLY-1PPL ?auto_18776 ?auto_18772 )
      ( FLY-4PPL-VERIFY ?auto_18773 ?auto_18774 ?auto_18775 ?auto_18776 ?auto_18772 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_18808 - PERSON
      ?auto_18809 - PERSON
      ?auto_18810 - PERSON
      ?auto_18811 - PERSON
      ?auto_18807 - CITY
    )
    :vars
    (
      ?auto_18815 - FLEVEL
      ?auto_18812 - FLEVEL
      ?auto_18817 - CITY
      ?auto_18816 - CITY
      ?auto_18814 - CITY
      ?auto_18813 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18815 ?auto_18812 ) ( PERSON-AT ?auto_18810 ?auto_18817 ) ( not ( = ?auto_18807 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18812 ) ) ( PERSON-AT ?auto_18811 ?auto_18816 ) ( not ( = ?auto_18807 ?auto_18816 ) ) ( PERSON-AT ?auto_18809 ?auto_18814 ) ( not ( = ?auto_18807 ?auto_18814 ) ) ( PERSON-AT ?auto_18808 ?auto_18816 ) ( AIRCRAFT-AT ?auto_18813 ?auto_18807 ) ( FUEL-LEVEL ?auto_18813 ?auto_18815 ) ( not ( = ?auto_18808 ?auto_18809 ) ) ( not ( = ?auto_18814 ?auto_18816 ) ) ( not ( = ?auto_18808 ?auto_18811 ) ) ( not ( = ?auto_18809 ?auto_18811 ) ) ( not ( = ?auto_18808 ?auto_18810 ) ) ( not ( = ?auto_18809 ?auto_18810 ) ) ( not ( = ?auto_18811 ?auto_18810 ) ) ( not ( = ?auto_18817 ?auto_18816 ) ) ( not ( = ?auto_18817 ?auto_18814 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_18808 ?auto_18809 ?auto_18811 ?auto_18810 ?auto_18807 )
      ( FLY-4PPL-VERIFY ?auto_18808 ?auto_18809 ?auto_18810 ?auto_18811 ?auto_18807 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_18843 - PERSON
      ?auto_18844 - PERSON
      ?auto_18845 - PERSON
      ?auto_18846 - PERSON
      ?auto_18842 - CITY
    )
    :vars
    (
      ?auto_18848 - FLEVEL
      ?auto_18847 - FLEVEL
      ?auto_18851 - CITY
      ?auto_18852 - CITY
      ?auto_18850 - CITY
      ?auto_18849 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18848 ?auto_18847 ) ( PERSON-AT ?auto_18846 ?auto_18851 ) ( not ( = ?auto_18842 ?auto_18851 ) ) ( not ( = ?auto_18848 ?auto_18847 ) ) ( PERSON-AT ?auto_18844 ?auto_18852 ) ( not ( = ?auto_18842 ?auto_18852 ) ) ( PERSON-AT ?auto_18845 ?auto_18850 ) ( not ( = ?auto_18842 ?auto_18850 ) ) ( PERSON-AT ?auto_18843 ?auto_18852 ) ( AIRCRAFT-AT ?auto_18849 ?auto_18842 ) ( FUEL-LEVEL ?auto_18849 ?auto_18848 ) ( not ( = ?auto_18843 ?auto_18845 ) ) ( not ( = ?auto_18850 ?auto_18852 ) ) ( not ( = ?auto_18843 ?auto_18844 ) ) ( not ( = ?auto_18845 ?auto_18844 ) ) ( not ( = ?auto_18843 ?auto_18846 ) ) ( not ( = ?auto_18845 ?auto_18846 ) ) ( not ( = ?auto_18844 ?auto_18846 ) ) ( not ( = ?auto_18851 ?auto_18852 ) ) ( not ( = ?auto_18851 ?auto_18850 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_18843 ?auto_18845 ?auto_18846 ?auto_18844 ?auto_18842 )
      ( FLY-4PPL-VERIFY ?auto_18843 ?auto_18844 ?auto_18845 ?auto_18846 ?auto_18842 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_19113 - PERSON
      ?auto_19114 - PERSON
      ?auto_19115 - PERSON
      ?auto_19116 - PERSON
      ?auto_19112 - CITY
    )
    :vars
    (
      ?auto_19118 - FLEVEL
      ?auto_19117 - FLEVEL
      ?auto_19121 - CITY
      ?auto_19122 - CITY
      ?auto_19120 - CITY
      ?auto_19119 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19118 ?auto_19117 ) ( PERSON-AT ?auto_19116 ?auto_19121 ) ( not ( = ?auto_19112 ?auto_19121 ) ) ( not ( = ?auto_19118 ?auto_19117 ) ) ( PERSON-AT ?auto_19115 ?auto_19122 ) ( not ( = ?auto_19112 ?auto_19122 ) ) ( PERSON-AT ?auto_19113 ?auto_19120 ) ( not ( = ?auto_19112 ?auto_19120 ) ) ( PERSON-AT ?auto_19114 ?auto_19122 ) ( AIRCRAFT-AT ?auto_19119 ?auto_19112 ) ( FUEL-LEVEL ?auto_19119 ?auto_19118 ) ( not ( = ?auto_19114 ?auto_19113 ) ) ( not ( = ?auto_19120 ?auto_19122 ) ) ( not ( = ?auto_19114 ?auto_19115 ) ) ( not ( = ?auto_19113 ?auto_19115 ) ) ( not ( = ?auto_19114 ?auto_19116 ) ) ( not ( = ?auto_19113 ?auto_19116 ) ) ( not ( = ?auto_19115 ?auto_19116 ) ) ( not ( = ?auto_19121 ?auto_19122 ) ) ( not ( = ?auto_19121 ?auto_19120 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_19114 ?auto_19113 ?auto_19116 ?auto_19115 ?auto_19112 )
      ( FLY-4PPL-VERIFY ?auto_19113 ?auto_19114 ?auto_19115 ?auto_19116 ?auto_19112 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_19148 - PERSON
      ?auto_19149 - PERSON
      ?auto_19150 - PERSON
      ?auto_19151 - PERSON
      ?auto_19147 - CITY
    )
    :vars
    (
      ?auto_19153 - FLEVEL
      ?auto_19152 - FLEVEL
      ?auto_19156 - CITY
      ?auto_19157 - CITY
      ?auto_19155 - CITY
      ?auto_19154 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19153 ?auto_19152 ) ( PERSON-AT ?auto_19150 ?auto_19156 ) ( not ( = ?auto_19147 ?auto_19156 ) ) ( not ( = ?auto_19153 ?auto_19152 ) ) ( PERSON-AT ?auto_19151 ?auto_19157 ) ( not ( = ?auto_19147 ?auto_19157 ) ) ( PERSON-AT ?auto_19148 ?auto_19155 ) ( not ( = ?auto_19147 ?auto_19155 ) ) ( PERSON-AT ?auto_19149 ?auto_19157 ) ( AIRCRAFT-AT ?auto_19154 ?auto_19147 ) ( FUEL-LEVEL ?auto_19154 ?auto_19153 ) ( not ( = ?auto_19149 ?auto_19148 ) ) ( not ( = ?auto_19155 ?auto_19157 ) ) ( not ( = ?auto_19149 ?auto_19151 ) ) ( not ( = ?auto_19148 ?auto_19151 ) ) ( not ( = ?auto_19149 ?auto_19150 ) ) ( not ( = ?auto_19148 ?auto_19150 ) ) ( not ( = ?auto_19151 ?auto_19150 ) ) ( not ( = ?auto_19156 ?auto_19157 ) ) ( not ( = ?auto_19156 ?auto_19155 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_19149 ?auto_19148 ?auto_19150 ?auto_19151 ?auto_19147 )
      ( FLY-4PPL-VERIFY ?auto_19148 ?auto_19149 ?auto_19150 ?auto_19151 ?auto_19147 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_19352 - PERSON
      ?auto_19353 - PERSON
      ?auto_19354 - PERSON
      ?auto_19355 - PERSON
      ?auto_19351 - CITY
    )
    :vars
    (
      ?auto_19357 - FLEVEL
      ?auto_19356 - FLEVEL
      ?auto_19360 - CITY
      ?auto_19361 - CITY
      ?auto_19359 - CITY
      ?auto_19358 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19357 ?auto_19356 ) ( PERSON-AT ?auto_19353 ?auto_19360 ) ( not ( = ?auto_19351 ?auto_19360 ) ) ( not ( = ?auto_19357 ?auto_19356 ) ) ( PERSON-AT ?auto_19355 ?auto_19361 ) ( not ( = ?auto_19351 ?auto_19361 ) ) ( PERSON-AT ?auto_19352 ?auto_19359 ) ( not ( = ?auto_19351 ?auto_19359 ) ) ( PERSON-AT ?auto_19354 ?auto_19361 ) ( AIRCRAFT-AT ?auto_19358 ?auto_19351 ) ( FUEL-LEVEL ?auto_19358 ?auto_19357 ) ( not ( = ?auto_19354 ?auto_19352 ) ) ( not ( = ?auto_19359 ?auto_19361 ) ) ( not ( = ?auto_19354 ?auto_19355 ) ) ( not ( = ?auto_19352 ?auto_19355 ) ) ( not ( = ?auto_19354 ?auto_19353 ) ) ( not ( = ?auto_19352 ?auto_19353 ) ) ( not ( = ?auto_19355 ?auto_19353 ) ) ( not ( = ?auto_19360 ?auto_19361 ) ) ( not ( = ?auto_19360 ?auto_19359 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_19354 ?auto_19352 ?auto_19353 ?auto_19355 ?auto_19351 )
      ( FLY-4PPL-VERIFY ?auto_19352 ?auto_19353 ?auto_19354 ?auto_19355 ?auto_19351 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_34414 - PERSON
      ?auto_34415 - PERSON
      ?auto_34416 - PERSON
      ?auto_34417 - PERSON
      ?auto_34418 - PERSON
      ?auto_34413 - CITY
    )
    :vars
    (
      ?auto_34419 - FLEVEL
      ?auto_34420 - FLEVEL
      ?auto_34421 - CITY
      ?auto_34423 - CITY
      ?auto_34424 - CITY
      ?auto_34422 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_34419 ?auto_34420 ) ( PERSON-AT ?auto_34418 ?auto_34421 ) ( not ( = ?auto_34413 ?auto_34421 ) ) ( not ( = ?auto_34419 ?auto_34420 ) ) ( PERSON-AT ?auto_34417 ?auto_34423 ) ( not ( = ?auto_34413 ?auto_34423 ) ) ( PERSON-AT ?auto_34416 ?auto_34424 ) ( not ( = ?auto_34413 ?auto_34424 ) ) ( PERSON-AT ?auto_34415 ?auto_34421 ) ( PERSON-AT ?auto_34414 ?auto_34424 ) ( AIRCRAFT-AT ?auto_34422 ?auto_34413 ) ( FUEL-LEVEL ?auto_34422 ?auto_34419 ) ( not ( = ?auto_34414 ?auto_34415 ) ) ( not ( = ?auto_34421 ?auto_34424 ) ) ( not ( = ?auto_34414 ?auto_34416 ) ) ( not ( = ?auto_34415 ?auto_34416 ) ) ( not ( = ?auto_34414 ?auto_34417 ) ) ( not ( = ?auto_34415 ?auto_34417 ) ) ( not ( = ?auto_34416 ?auto_34417 ) ) ( not ( = ?auto_34423 ?auto_34424 ) ) ( not ( = ?auto_34423 ?auto_34421 ) ) ( not ( = ?auto_34414 ?auto_34418 ) ) ( not ( = ?auto_34415 ?auto_34418 ) ) ( not ( = ?auto_34416 ?auto_34418 ) ) ( not ( = ?auto_34417 ?auto_34418 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_34414 ?auto_34415 ?auto_34417 ?auto_34416 ?auto_34413 )
      ( FLY-1PPL ?auto_34418 ?auto_34413 )
      ( FLY-5PPL-VERIFY ?auto_34414 ?auto_34415 ?auto_34416 ?auto_34417 ?auto_34418 ?auto_34413 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_34465 - PERSON
      ?auto_34466 - PERSON
      ?auto_34467 - PERSON
      ?auto_34468 - PERSON
      ?auto_34469 - PERSON
      ?auto_34464 - CITY
    )
    :vars
    (
      ?auto_34470 - FLEVEL
      ?auto_34473 - FLEVEL
      ?auto_34472 - CITY
      ?auto_34474 - CITY
      ?auto_34475 - CITY
      ?auto_34471 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_34470 ?auto_34473 ) ( PERSON-AT ?auto_34468 ?auto_34472 ) ( not ( = ?auto_34464 ?auto_34472 ) ) ( not ( = ?auto_34470 ?auto_34473 ) ) ( PERSON-AT ?auto_34469 ?auto_34474 ) ( not ( = ?auto_34464 ?auto_34474 ) ) ( PERSON-AT ?auto_34467 ?auto_34475 ) ( not ( = ?auto_34464 ?auto_34475 ) ) ( PERSON-AT ?auto_34466 ?auto_34472 ) ( PERSON-AT ?auto_34465 ?auto_34475 ) ( AIRCRAFT-AT ?auto_34471 ?auto_34464 ) ( FUEL-LEVEL ?auto_34471 ?auto_34470 ) ( not ( = ?auto_34465 ?auto_34466 ) ) ( not ( = ?auto_34472 ?auto_34475 ) ) ( not ( = ?auto_34465 ?auto_34467 ) ) ( not ( = ?auto_34466 ?auto_34467 ) ) ( not ( = ?auto_34465 ?auto_34469 ) ) ( not ( = ?auto_34466 ?auto_34469 ) ) ( not ( = ?auto_34467 ?auto_34469 ) ) ( not ( = ?auto_34474 ?auto_34475 ) ) ( not ( = ?auto_34474 ?auto_34472 ) ) ( not ( = ?auto_34465 ?auto_34468 ) ) ( not ( = ?auto_34466 ?auto_34468 ) ) ( not ( = ?auto_34467 ?auto_34468 ) ) ( not ( = ?auto_34469 ?auto_34468 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_34465 ?auto_34466 ?auto_34467 ?auto_34469 ?auto_34468 ?auto_34464 )
      ( FLY-5PPL-VERIFY ?auto_34465 ?auto_34466 ?auto_34467 ?auto_34468 ?auto_34469 ?auto_34464 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_34516 - PERSON
      ?auto_34517 - PERSON
      ?auto_34518 - PERSON
      ?auto_34519 - PERSON
      ?auto_34520 - PERSON
      ?auto_34515 - CITY
    )
    :vars
    (
      ?auto_34521 - FLEVEL
      ?auto_34522 - FLEVEL
      ?auto_34525 - CITY
      ?auto_34526 - CITY
      ?auto_34523 - CITY
      ?auto_34524 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_34521 ?auto_34522 ) ( PERSON-AT ?auto_34520 ?auto_34525 ) ( not ( = ?auto_34515 ?auto_34525 ) ) ( not ( = ?auto_34521 ?auto_34522 ) ) ( PERSON-AT ?auto_34518 ?auto_34526 ) ( not ( = ?auto_34515 ?auto_34526 ) ) ( PERSON-AT ?auto_34519 ?auto_34523 ) ( not ( = ?auto_34515 ?auto_34523 ) ) ( PERSON-AT ?auto_34517 ?auto_34525 ) ( PERSON-AT ?auto_34516 ?auto_34523 ) ( AIRCRAFT-AT ?auto_34524 ?auto_34515 ) ( FUEL-LEVEL ?auto_34524 ?auto_34521 ) ( not ( = ?auto_34516 ?auto_34517 ) ) ( not ( = ?auto_34525 ?auto_34523 ) ) ( not ( = ?auto_34516 ?auto_34519 ) ) ( not ( = ?auto_34517 ?auto_34519 ) ) ( not ( = ?auto_34516 ?auto_34518 ) ) ( not ( = ?auto_34517 ?auto_34518 ) ) ( not ( = ?auto_34519 ?auto_34518 ) ) ( not ( = ?auto_34526 ?auto_34523 ) ) ( not ( = ?auto_34526 ?auto_34525 ) ) ( not ( = ?auto_34516 ?auto_34520 ) ) ( not ( = ?auto_34517 ?auto_34520 ) ) ( not ( = ?auto_34519 ?auto_34520 ) ) ( not ( = ?auto_34518 ?auto_34520 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_34516 ?auto_34517 ?auto_34519 ?auto_34520 ?auto_34518 ?auto_34515 )
      ( FLY-5PPL-VERIFY ?auto_34516 ?auto_34517 ?auto_34518 ?auto_34519 ?auto_34520 ?auto_34515 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_34567 - PERSON
      ?auto_34568 - PERSON
      ?auto_34569 - PERSON
      ?auto_34570 - PERSON
      ?auto_34571 - PERSON
      ?auto_34566 - CITY
    )
    :vars
    (
      ?auto_34572 - FLEVEL
      ?auto_34573 - FLEVEL
      ?auto_34576 - CITY
      ?auto_34577 - CITY
      ?auto_34574 - CITY
      ?auto_34575 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_34572 ?auto_34573 ) ( PERSON-AT ?auto_34570 ?auto_34576 ) ( not ( = ?auto_34566 ?auto_34576 ) ) ( not ( = ?auto_34572 ?auto_34573 ) ) ( PERSON-AT ?auto_34569 ?auto_34577 ) ( not ( = ?auto_34566 ?auto_34577 ) ) ( PERSON-AT ?auto_34571 ?auto_34574 ) ( not ( = ?auto_34566 ?auto_34574 ) ) ( PERSON-AT ?auto_34568 ?auto_34576 ) ( PERSON-AT ?auto_34567 ?auto_34574 ) ( AIRCRAFT-AT ?auto_34575 ?auto_34566 ) ( FUEL-LEVEL ?auto_34575 ?auto_34572 ) ( not ( = ?auto_34567 ?auto_34568 ) ) ( not ( = ?auto_34576 ?auto_34574 ) ) ( not ( = ?auto_34567 ?auto_34571 ) ) ( not ( = ?auto_34568 ?auto_34571 ) ) ( not ( = ?auto_34567 ?auto_34569 ) ) ( not ( = ?auto_34568 ?auto_34569 ) ) ( not ( = ?auto_34571 ?auto_34569 ) ) ( not ( = ?auto_34577 ?auto_34574 ) ) ( not ( = ?auto_34577 ?auto_34576 ) ) ( not ( = ?auto_34567 ?auto_34570 ) ) ( not ( = ?auto_34568 ?auto_34570 ) ) ( not ( = ?auto_34571 ?auto_34570 ) ) ( not ( = ?auto_34569 ?auto_34570 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_34567 ?auto_34568 ?auto_34571 ?auto_34570 ?auto_34569 ?auto_34566 )
      ( FLY-5PPL-VERIFY ?auto_34567 ?auto_34568 ?auto_34569 ?auto_34570 ?auto_34571 ?auto_34566 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_34780 - PERSON
      ?auto_34781 - PERSON
      ?auto_34782 - PERSON
      ?auto_34783 - PERSON
      ?auto_34784 - PERSON
      ?auto_34779 - CITY
    )
    :vars
    (
      ?auto_34785 - FLEVEL
      ?auto_34786 - FLEVEL
      ?auto_34789 - CITY
      ?auto_34790 - CITY
      ?auto_34787 - CITY
      ?auto_34788 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_34785 ?auto_34786 ) ( PERSON-AT ?auto_34782 ?auto_34789 ) ( not ( = ?auto_34779 ?auto_34789 ) ) ( not ( = ?auto_34785 ?auto_34786 ) ) ( PERSON-AT ?auto_34784 ?auto_34790 ) ( not ( = ?auto_34779 ?auto_34790 ) ) ( PERSON-AT ?auto_34783 ?auto_34787 ) ( not ( = ?auto_34779 ?auto_34787 ) ) ( PERSON-AT ?auto_34781 ?auto_34789 ) ( PERSON-AT ?auto_34780 ?auto_34787 ) ( AIRCRAFT-AT ?auto_34788 ?auto_34779 ) ( FUEL-LEVEL ?auto_34788 ?auto_34785 ) ( not ( = ?auto_34780 ?auto_34781 ) ) ( not ( = ?auto_34789 ?auto_34787 ) ) ( not ( = ?auto_34780 ?auto_34783 ) ) ( not ( = ?auto_34781 ?auto_34783 ) ) ( not ( = ?auto_34780 ?auto_34784 ) ) ( not ( = ?auto_34781 ?auto_34784 ) ) ( not ( = ?auto_34783 ?auto_34784 ) ) ( not ( = ?auto_34790 ?auto_34787 ) ) ( not ( = ?auto_34790 ?auto_34789 ) ) ( not ( = ?auto_34780 ?auto_34782 ) ) ( not ( = ?auto_34781 ?auto_34782 ) ) ( not ( = ?auto_34783 ?auto_34782 ) ) ( not ( = ?auto_34784 ?auto_34782 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_34780 ?auto_34781 ?auto_34783 ?auto_34782 ?auto_34784 ?auto_34779 )
      ( FLY-5PPL-VERIFY ?auto_34780 ?auto_34781 ?auto_34782 ?auto_34783 ?auto_34784 ?auto_34779 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_34831 - PERSON
      ?auto_34832 - PERSON
      ?auto_34833 - PERSON
      ?auto_34834 - PERSON
      ?auto_34835 - PERSON
      ?auto_34830 - CITY
    )
    :vars
    (
      ?auto_34836 - FLEVEL
      ?auto_34837 - FLEVEL
      ?auto_34840 - CITY
      ?auto_34841 - CITY
      ?auto_34838 - CITY
      ?auto_34839 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_34836 ?auto_34837 ) ( PERSON-AT ?auto_34833 ?auto_34840 ) ( not ( = ?auto_34830 ?auto_34840 ) ) ( not ( = ?auto_34836 ?auto_34837 ) ) ( PERSON-AT ?auto_34834 ?auto_34841 ) ( not ( = ?auto_34830 ?auto_34841 ) ) ( PERSON-AT ?auto_34835 ?auto_34838 ) ( not ( = ?auto_34830 ?auto_34838 ) ) ( PERSON-AT ?auto_34832 ?auto_34840 ) ( PERSON-AT ?auto_34831 ?auto_34838 ) ( AIRCRAFT-AT ?auto_34839 ?auto_34830 ) ( FUEL-LEVEL ?auto_34839 ?auto_34836 ) ( not ( = ?auto_34831 ?auto_34832 ) ) ( not ( = ?auto_34840 ?auto_34838 ) ) ( not ( = ?auto_34831 ?auto_34835 ) ) ( not ( = ?auto_34832 ?auto_34835 ) ) ( not ( = ?auto_34831 ?auto_34834 ) ) ( not ( = ?auto_34832 ?auto_34834 ) ) ( not ( = ?auto_34835 ?auto_34834 ) ) ( not ( = ?auto_34841 ?auto_34838 ) ) ( not ( = ?auto_34841 ?auto_34840 ) ) ( not ( = ?auto_34831 ?auto_34833 ) ) ( not ( = ?auto_34832 ?auto_34833 ) ) ( not ( = ?auto_34835 ?auto_34833 ) ) ( not ( = ?auto_34834 ?auto_34833 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_34831 ?auto_34832 ?auto_34835 ?auto_34833 ?auto_34834 ?auto_34830 )
      ( FLY-5PPL-VERIFY ?auto_34831 ?auto_34832 ?auto_34833 ?auto_34834 ?auto_34835 ?auto_34830 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_35098 - PERSON
      ?auto_35099 - PERSON
      ?auto_35100 - PERSON
      ?auto_35101 - PERSON
      ?auto_35102 - PERSON
      ?auto_35097 - CITY
    )
    :vars
    (
      ?auto_35103 - FLEVEL
      ?auto_35104 - FLEVEL
      ?auto_35107 - CITY
      ?auto_35108 - CITY
      ?auto_35105 - CITY
      ?auto_35106 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_35103 ?auto_35104 ) ( PERSON-AT ?auto_35102 ?auto_35107 ) ( not ( = ?auto_35097 ?auto_35107 ) ) ( not ( = ?auto_35103 ?auto_35104 ) ) ( PERSON-AT ?auto_35101 ?auto_35108 ) ( not ( = ?auto_35097 ?auto_35108 ) ) ( PERSON-AT ?auto_35099 ?auto_35105 ) ( not ( = ?auto_35097 ?auto_35105 ) ) ( PERSON-AT ?auto_35100 ?auto_35107 ) ( PERSON-AT ?auto_35098 ?auto_35105 ) ( AIRCRAFT-AT ?auto_35106 ?auto_35097 ) ( FUEL-LEVEL ?auto_35106 ?auto_35103 ) ( not ( = ?auto_35098 ?auto_35100 ) ) ( not ( = ?auto_35107 ?auto_35105 ) ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( not ( = ?auto_35100 ?auto_35099 ) ) ( not ( = ?auto_35098 ?auto_35101 ) ) ( not ( = ?auto_35100 ?auto_35101 ) ) ( not ( = ?auto_35099 ?auto_35101 ) ) ( not ( = ?auto_35108 ?auto_35105 ) ) ( not ( = ?auto_35108 ?auto_35107 ) ) ( not ( = ?auto_35098 ?auto_35102 ) ) ( not ( = ?auto_35100 ?auto_35102 ) ) ( not ( = ?auto_35099 ?auto_35102 ) ) ( not ( = ?auto_35101 ?auto_35102 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_35098 ?auto_35100 ?auto_35099 ?auto_35102 ?auto_35101 ?auto_35097 )
      ( FLY-5PPL-VERIFY ?auto_35098 ?auto_35099 ?auto_35100 ?auto_35101 ?auto_35102 ?auto_35097 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_35149 - PERSON
      ?auto_35150 - PERSON
      ?auto_35151 - PERSON
      ?auto_35152 - PERSON
      ?auto_35153 - PERSON
      ?auto_35148 - CITY
    )
    :vars
    (
      ?auto_35154 - FLEVEL
      ?auto_35155 - FLEVEL
      ?auto_35158 - CITY
      ?auto_35159 - CITY
      ?auto_35156 - CITY
      ?auto_35157 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_35154 ?auto_35155 ) ( PERSON-AT ?auto_35152 ?auto_35158 ) ( not ( = ?auto_35148 ?auto_35158 ) ) ( not ( = ?auto_35154 ?auto_35155 ) ) ( PERSON-AT ?auto_35153 ?auto_35159 ) ( not ( = ?auto_35148 ?auto_35159 ) ) ( PERSON-AT ?auto_35150 ?auto_35156 ) ( not ( = ?auto_35148 ?auto_35156 ) ) ( PERSON-AT ?auto_35151 ?auto_35158 ) ( PERSON-AT ?auto_35149 ?auto_35156 ) ( AIRCRAFT-AT ?auto_35157 ?auto_35148 ) ( FUEL-LEVEL ?auto_35157 ?auto_35154 ) ( not ( = ?auto_35149 ?auto_35151 ) ) ( not ( = ?auto_35158 ?auto_35156 ) ) ( not ( = ?auto_35149 ?auto_35150 ) ) ( not ( = ?auto_35151 ?auto_35150 ) ) ( not ( = ?auto_35149 ?auto_35153 ) ) ( not ( = ?auto_35151 ?auto_35153 ) ) ( not ( = ?auto_35150 ?auto_35153 ) ) ( not ( = ?auto_35159 ?auto_35156 ) ) ( not ( = ?auto_35159 ?auto_35158 ) ) ( not ( = ?auto_35149 ?auto_35152 ) ) ( not ( = ?auto_35151 ?auto_35152 ) ) ( not ( = ?auto_35150 ?auto_35152 ) ) ( not ( = ?auto_35153 ?auto_35152 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_35149 ?auto_35151 ?auto_35150 ?auto_35152 ?auto_35153 ?auto_35148 )
      ( FLY-5PPL-VERIFY ?auto_35149 ?auto_35150 ?auto_35151 ?auto_35152 ?auto_35153 ?auto_35148 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_35309 - PERSON
      ?auto_35310 - PERSON
      ?auto_35311 - PERSON
      ?auto_35312 - PERSON
      ?auto_35313 - PERSON
      ?auto_35308 - CITY
    )
    :vars
    (
      ?auto_35314 - FLEVEL
      ?auto_35315 - FLEVEL
      ?auto_35318 - CITY
      ?auto_35319 - CITY
      ?auto_35316 - CITY
      ?auto_35317 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_35314 ?auto_35315 ) ( PERSON-AT ?auto_35313 ?auto_35318 ) ( not ( = ?auto_35308 ?auto_35318 ) ) ( not ( = ?auto_35314 ?auto_35315 ) ) ( PERSON-AT ?auto_35311 ?auto_35319 ) ( not ( = ?auto_35308 ?auto_35319 ) ) ( PERSON-AT ?auto_35310 ?auto_35316 ) ( not ( = ?auto_35308 ?auto_35316 ) ) ( PERSON-AT ?auto_35312 ?auto_35318 ) ( PERSON-AT ?auto_35309 ?auto_35316 ) ( AIRCRAFT-AT ?auto_35317 ?auto_35308 ) ( FUEL-LEVEL ?auto_35317 ?auto_35314 ) ( not ( = ?auto_35309 ?auto_35312 ) ) ( not ( = ?auto_35318 ?auto_35316 ) ) ( not ( = ?auto_35309 ?auto_35310 ) ) ( not ( = ?auto_35312 ?auto_35310 ) ) ( not ( = ?auto_35309 ?auto_35311 ) ) ( not ( = ?auto_35312 ?auto_35311 ) ) ( not ( = ?auto_35310 ?auto_35311 ) ) ( not ( = ?auto_35319 ?auto_35316 ) ) ( not ( = ?auto_35319 ?auto_35318 ) ) ( not ( = ?auto_35309 ?auto_35313 ) ) ( not ( = ?auto_35312 ?auto_35313 ) ) ( not ( = ?auto_35310 ?auto_35313 ) ) ( not ( = ?auto_35311 ?auto_35313 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_35309 ?auto_35312 ?auto_35310 ?auto_35313 ?auto_35311 ?auto_35308 )
      ( FLY-5PPL-VERIFY ?auto_35309 ?auto_35310 ?auto_35311 ?auto_35312 ?auto_35313 ?auto_35308 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_35873 - PERSON
      ?auto_35874 - PERSON
      ?auto_35875 - PERSON
      ?auto_35876 - PERSON
      ?auto_35877 - PERSON
      ?auto_35872 - CITY
    )
    :vars
    (
      ?auto_35878 - FLEVEL
      ?auto_35879 - FLEVEL
      ?auto_35882 - CITY
      ?auto_35883 - CITY
      ?auto_35880 - CITY
      ?auto_35881 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_35878 ?auto_35879 ) ( PERSON-AT ?auto_35877 ?auto_35882 ) ( not ( = ?auto_35872 ?auto_35882 ) ) ( not ( = ?auto_35878 ?auto_35879 ) ) ( PERSON-AT ?auto_35874 ?auto_35883 ) ( not ( = ?auto_35872 ?auto_35883 ) ) ( PERSON-AT ?auto_35876 ?auto_35880 ) ( not ( = ?auto_35872 ?auto_35880 ) ) ( PERSON-AT ?auto_35875 ?auto_35882 ) ( PERSON-AT ?auto_35873 ?auto_35880 ) ( AIRCRAFT-AT ?auto_35881 ?auto_35872 ) ( FUEL-LEVEL ?auto_35881 ?auto_35878 ) ( not ( = ?auto_35873 ?auto_35875 ) ) ( not ( = ?auto_35882 ?auto_35880 ) ) ( not ( = ?auto_35873 ?auto_35876 ) ) ( not ( = ?auto_35875 ?auto_35876 ) ) ( not ( = ?auto_35873 ?auto_35874 ) ) ( not ( = ?auto_35875 ?auto_35874 ) ) ( not ( = ?auto_35876 ?auto_35874 ) ) ( not ( = ?auto_35883 ?auto_35880 ) ) ( not ( = ?auto_35883 ?auto_35882 ) ) ( not ( = ?auto_35873 ?auto_35877 ) ) ( not ( = ?auto_35875 ?auto_35877 ) ) ( not ( = ?auto_35876 ?auto_35877 ) ) ( not ( = ?auto_35874 ?auto_35877 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_35873 ?auto_35875 ?auto_35876 ?auto_35877 ?auto_35874 ?auto_35872 )
      ( FLY-5PPL-VERIFY ?auto_35873 ?auto_35874 ?auto_35875 ?auto_35876 ?auto_35877 ?auto_35872 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_35924 - PERSON
      ?auto_35925 - PERSON
      ?auto_35926 - PERSON
      ?auto_35927 - PERSON
      ?auto_35928 - PERSON
      ?auto_35923 - CITY
    )
    :vars
    (
      ?auto_35929 - FLEVEL
      ?auto_35930 - FLEVEL
      ?auto_35933 - CITY
      ?auto_35934 - CITY
      ?auto_35931 - CITY
      ?auto_35932 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_35929 ?auto_35930 ) ( PERSON-AT ?auto_35927 ?auto_35933 ) ( not ( = ?auto_35923 ?auto_35933 ) ) ( not ( = ?auto_35929 ?auto_35930 ) ) ( PERSON-AT ?auto_35925 ?auto_35934 ) ( not ( = ?auto_35923 ?auto_35934 ) ) ( PERSON-AT ?auto_35928 ?auto_35931 ) ( not ( = ?auto_35923 ?auto_35931 ) ) ( PERSON-AT ?auto_35926 ?auto_35933 ) ( PERSON-AT ?auto_35924 ?auto_35931 ) ( AIRCRAFT-AT ?auto_35932 ?auto_35923 ) ( FUEL-LEVEL ?auto_35932 ?auto_35929 ) ( not ( = ?auto_35924 ?auto_35926 ) ) ( not ( = ?auto_35933 ?auto_35931 ) ) ( not ( = ?auto_35924 ?auto_35928 ) ) ( not ( = ?auto_35926 ?auto_35928 ) ) ( not ( = ?auto_35924 ?auto_35925 ) ) ( not ( = ?auto_35926 ?auto_35925 ) ) ( not ( = ?auto_35928 ?auto_35925 ) ) ( not ( = ?auto_35934 ?auto_35931 ) ) ( not ( = ?auto_35934 ?auto_35933 ) ) ( not ( = ?auto_35924 ?auto_35927 ) ) ( not ( = ?auto_35926 ?auto_35927 ) ) ( not ( = ?auto_35928 ?auto_35927 ) ) ( not ( = ?auto_35925 ?auto_35927 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_35924 ?auto_35926 ?auto_35928 ?auto_35927 ?auto_35925 ?auto_35923 )
      ( FLY-5PPL-VERIFY ?auto_35924 ?auto_35925 ?auto_35926 ?auto_35927 ?auto_35928 ?auto_35923 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_35975 - PERSON
      ?auto_35976 - PERSON
      ?auto_35977 - PERSON
      ?auto_35978 - PERSON
      ?auto_35979 - PERSON
      ?auto_35974 - CITY
    )
    :vars
    (
      ?auto_35980 - FLEVEL
      ?auto_35981 - FLEVEL
      ?auto_35984 - CITY
      ?auto_35985 - CITY
      ?auto_35982 - CITY
      ?auto_35983 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_35980 ?auto_35981 ) ( PERSON-AT ?auto_35979 ?auto_35984 ) ( not ( = ?auto_35974 ?auto_35984 ) ) ( not ( = ?auto_35980 ?auto_35981 ) ) ( PERSON-AT ?auto_35976 ?auto_35985 ) ( not ( = ?auto_35974 ?auto_35985 ) ) ( PERSON-AT ?auto_35977 ?auto_35982 ) ( not ( = ?auto_35974 ?auto_35982 ) ) ( PERSON-AT ?auto_35978 ?auto_35984 ) ( PERSON-AT ?auto_35975 ?auto_35982 ) ( AIRCRAFT-AT ?auto_35983 ?auto_35974 ) ( FUEL-LEVEL ?auto_35983 ?auto_35980 ) ( not ( = ?auto_35975 ?auto_35978 ) ) ( not ( = ?auto_35984 ?auto_35982 ) ) ( not ( = ?auto_35975 ?auto_35977 ) ) ( not ( = ?auto_35978 ?auto_35977 ) ) ( not ( = ?auto_35975 ?auto_35976 ) ) ( not ( = ?auto_35978 ?auto_35976 ) ) ( not ( = ?auto_35977 ?auto_35976 ) ) ( not ( = ?auto_35985 ?auto_35982 ) ) ( not ( = ?auto_35985 ?auto_35984 ) ) ( not ( = ?auto_35975 ?auto_35979 ) ) ( not ( = ?auto_35978 ?auto_35979 ) ) ( not ( = ?auto_35977 ?auto_35979 ) ) ( not ( = ?auto_35976 ?auto_35979 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_35975 ?auto_35978 ?auto_35977 ?auto_35979 ?auto_35976 ?auto_35974 )
      ( FLY-5PPL-VERIFY ?auto_35975 ?auto_35976 ?auto_35977 ?auto_35978 ?auto_35979 ?auto_35974 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_47935 - PERSON
      ?auto_47936 - PERSON
      ?auto_47937 - PERSON
      ?auto_47938 - PERSON
      ?auto_47939 - PERSON
      ?auto_47934 - CITY
    )
    :vars
    (
      ?auto_47940 - FLEVEL
      ?auto_47941 - FLEVEL
      ?auto_47944 - CITY
      ?auto_47945 - CITY
      ?auto_47942 - CITY
      ?auto_47943 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_47940 ?auto_47941 ) ( PERSON-AT ?auto_47939 ?auto_47944 ) ( not ( = ?auto_47934 ?auto_47944 ) ) ( not ( = ?auto_47940 ?auto_47941 ) ) ( PERSON-AT ?auto_47935 ?auto_47945 ) ( not ( = ?auto_47934 ?auto_47945 ) ) ( PERSON-AT ?auto_47938 ?auto_47942 ) ( not ( = ?auto_47934 ?auto_47942 ) ) ( PERSON-AT ?auto_47937 ?auto_47944 ) ( PERSON-AT ?auto_47936 ?auto_47942 ) ( AIRCRAFT-AT ?auto_47943 ?auto_47934 ) ( FUEL-LEVEL ?auto_47943 ?auto_47940 ) ( not ( = ?auto_47936 ?auto_47937 ) ) ( not ( = ?auto_47944 ?auto_47942 ) ) ( not ( = ?auto_47936 ?auto_47938 ) ) ( not ( = ?auto_47937 ?auto_47938 ) ) ( not ( = ?auto_47936 ?auto_47935 ) ) ( not ( = ?auto_47937 ?auto_47935 ) ) ( not ( = ?auto_47938 ?auto_47935 ) ) ( not ( = ?auto_47945 ?auto_47942 ) ) ( not ( = ?auto_47945 ?auto_47944 ) ) ( not ( = ?auto_47936 ?auto_47939 ) ) ( not ( = ?auto_47937 ?auto_47939 ) ) ( not ( = ?auto_47938 ?auto_47939 ) ) ( not ( = ?auto_47935 ?auto_47939 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_47936 ?auto_47937 ?auto_47938 ?auto_47939 ?auto_47935 ?auto_47934 )
      ( FLY-5PPL-VERIFY ?auto_47935 ?auto_47936 ?auto_47937 ?auto_47938 ?auto_47939 ?auto_47934 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_47986 - PERSON
      ?auto_47987 - PERSON
      ?auto_47988 - PERSON
      ?auto_47989 - PERSON
      ?auto_47990 - PERSON
      ?auto_47985 - CITY
    )
    :vars
    (
      ?auto_47991 - FLEVEL
      ?auto_47992 - FLEVEL
      ?auto_47995 - CITY
      ?auto_47996 - CITY
      ?auto_47993 - CITY
      ?auto_47994 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_47991 ?auto_47992 ) ( PERSON-AT ?auto_47989 ?auto_47995 ) ( not ( = ?auto_47985 ?auto_47995 ) ) ( not ( = ?auto_47991 ?auto_47992 ) ) ( PERSON-AT ?auto_47986 ?auto_47996 ) ( not ( = ?auto_47985 ?auto_47996 ) ) ( PERSON-AT ?auto_47990 ?auto_47993 ) ( not ( = ?auto_47985 ?auto_47993 ) ) ( PERSON-AT ?auto_47988 ?auto_47995 ) ( PERSON-AT ?auto_47987 ?auto_47993 ) ( AIRCRAFT-AT ?auto_47994 ?auto_47985 ) ( FUEL-LEVEL ?auto_47994 ?auto_47991 ) ( not ( = ?auto_47987 ?auto_47988 ) ) ( not ( = ?auto_47995 ?auto_47993 ) ) ( not ( = ?auto_47987 ?auto_47990 ) ) ( not ( = ?auto_47988 ?auto_47990 ) ) ( not ( = ?auto_47987 ?auto_47986 ) ) ( not ( = ?auto_47988 ?auto_47986 ) ) ( not ( = ?auto_47990 ?auto_47986 ) ) ( not ( = ?auto_47996 ?auto_47993 ) ) ( not ( = ?auto_47996 ?auto_47995 ) ) ( not ( = ?auto_47987 ?auto_47989 ) ) ( not ( = ?auto_47988 ?auto_47989 ) ) ( not ( = ?auto_47990 ?auto_47989 ) ) ( not ( = ?auto_47986 ?auto_47989 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_47987 ?auto_47988 ?auto_47990 ?auto_47989 ?auto_47986 ?auto_47985 )
      ( FLY-5PPL-VERIFY ?auto_47986 ?auto_47987 ?auto_47988 ?auto_47989 ?auto_47990 ?auto_47985 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_48037 - PERSON
      ?auto_48038 - PERSON
      ?auto_48039 - PERSON
      ?auto_48040 - PERSON
      ?auto_48041 - PERSON
      ?auto_48036 - CITY
    )
    :vars
    (
      ?auto_48042 - FLEVEL
      ?auto_48043 - FLEVEL
      ?auto_48046 - CITY
      ?auto_48047 - CITY
      ?auto_48044 - CITY
      ?auto_48045 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_48042 ?auto_48043 ) ( PERSON-AT ?auto_48041 ?auto_48046 ) ( not ( = ?auto_48036 ?auto_48046 ) ) ( not ( = ?auto_48042 ?auto_48043 ) ) ( PERSON-AT ?auto_48037 ?auto_48047 ) ( not ( = ?auto_48036 ?auto_48047 ) ) ( PERSON-AT ?auto_48039 ?auto_48044 ) ( not ( = ?auto_48036 ?auto_48044 ) ) ( PERSON-AT ?auto_48040 ?auto_48046 ) ( PERSON-AT ?auto_48038 ?auto_48044 ) ( AIRCRAFT-AT ?auto_48045 ?auto_48036 ) ( FUEL-LEVEL ?auto_48045 ?auto_48042 ) ( not ( = ?auto_48038 ?auto_48040 ) ) ( not ( = ?auto_48046 ?auto_48044 ) ) ( not ( = ?auto_48038 ?auto_48039 ) ) ( not ( = ?auto_48040 ?auto_48039 ) ) ( not ( = ?auto_48038 ?auto_48037 ) ) ( not ( = ?auto_48040 ?auto_48037 ) ) ( not ( = ?auto_48039 ?auto_48037 ) ) ( not ( = ?auto_48047 ?auto_48044 ) ) ( not ( = ?auto_48047 ?auto_48046 ) ) ( not ( = ?auto_48038 ?auto_48041 ) ) ( not ( = ?auto_48040 ?auto_48041 ) ) ( not ( = ?auto_48039 ?auto_48041 ) ) ( not ( = ?auto_48037 ?auto_48041 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_48038 ?auto_48040 ?auto_48039 ?auto_48041 ?auto_48037 ?auto_48036 )
      ( FLY-5PPL-VERIFY ?auto_48037 ?auto_48038 ?auto_48039 ?auto_48040 ?auto_48041 ?auto_48036 ) )
  )

)

