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

  ( :method FLY-6PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?p6 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) ( PERSON-AT ?p6 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_956505 - PERSON
      ?auto_956504 - CITY
    )
    :vars
    (
      ?auto_956508 - FLEVEL
      ?auto_956507 - FLEVEL
      ?auto_956509 - CITY
      ?auto_956506 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_956508 ?auto_956507 ) ( PERSON-AT ?auto_956505 ?auto_956509 ) ( AIRCRAFT-AT ?auto_956506 ?auto_956504 ) ( FUEL-LEVEL ?auto_956506 ?auto_956508 ) ( not ( = ?auto_956504 ?auto_956509 ) ) ( not ( = ?auto_956508 ?auto_956507 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_956506 ?auto_956504 ?auto_956508 ?auto_956507 )
      ( !FLY ?auto_956506 ?auto_956504 ?auto_956509 ?auto_956507 ?auto_956508 )
      ( !REFUEL ?auto_956506 ?auto_956509 ?auto_956508 ?auto_956507 )
      ( !BOARD ?auto_956505 ?auto_956506 ?auto_956509 )
      ( !FLY ?auto_956506 ?auto_956509 ?auto_956504 ?auto_956507 ?auto_956508 )
      ( !DEBARK ?auto_956505 ?auto_956506 ?auto_956504 )
      ( FLY-1PPL-VERIFY ?auto_956505 ?auto_956504 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_956528 - PERSON
      ?auto_956529 - PERSON
      ?auto_956527 - CITY
    )
    :vars
    (
      ?auto_956532 - FLEVEL
      ?auto_956533 - FLEVEL
      ?auto_956531 - CITY
      ?auto_956534 - CITY
      ?auto_956530 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_956532 ?auto_956533 ) ( PERSON-AT ?auto_956529 ?auto_956531 ) ( not ( = ?auto_956527 ?auto_956531 ) ) ( not ( = ?auto_956532 ?auto_956533 ) ) ( PERSON-AT ?auto_956528 ?auto_956534 ) ( AIRCRAFT-AT ?auto_956530 ?auto_956527 ) ( FUEL-LEVEL ?auto_956530 ?auto_956532 ) ( not ( = ?auto_956527 ?auto_956534 ) ) ( not ( = ?auto_956528 ?auto_956529 ) ) ( not ( = ?auto_956531 ?auto_956534 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_956528 ?auto_956527 )
      ( FLY-1PPL ?auto_956529 ?auto_956527 )
      ( FLY-2PPL-VERIFY ?auto_956528 ?auto_956529 ?auto_956527 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_956643 - PERSON
      ?auto_956644 - PERSON
      ?auto_956645 - PERSON
      ?auto_956642 - CITY
    )
    :vars
    (
      ?auto_956649 - FLEVEL
      ?auto_956648 - FLEVEL
      ?auto_956647 - CITY
      ?auto_956650 - CITY
      ?auto_956651 - CITY
      ?auto_956646 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_956649 ?auto_956648 ) ( PERSON-AT ?auto_956645 ?auto_956647 ) ( not ( = ?auto_956642 ?auto_956647 ) ) ( not ( = ?auto_956649 ?auto_956648 ) ) ( PERSON-AT ?auto_956644 ?auto_956650 ) ( not ( = ?auto_956642 ?auto_956650 ) ) ( PERSON-AT ?auto_956643 ?auto_956651 ) ( AIRCRAFT-AT ?auto_956646 ?auto_956642 ) ( FUEL-LEVEL ?auto_956646 ?auto_956649 ) ( not ( = ?auto_956642 ?auto_956651 ) ) ( not ( = ?auto_956643 ?auto_956644 ) ) ( not ( = ?auto_956650 ?auto_956651 ) ) ( not ( = ?auto_956643 ?auto_956645 ) ) ( not ( = ?auto_956644 ?auto_956645 ) ) ( not ( = ?auto_956647 ?auto_956650 ) ) ( not ( = ?auto_956647 ?auto_956651 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_956643 ?auto_956644 ?auto_956642 )
      ( FLY-1PPL ?auto_956645 ?auto_956642 )
      ( FLY-3PPL-VERIFY ?auto_956643 ?auto_956644 ?auto_956645 ?auto_956642 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_957800 - PERSON
      ?auto_957801 - PERSON
      ?auto_957802 - PERSON
      ?auto_957803 - PERSON
      ?auto_957799 - CITY
    )
    :vars
    (
      ?auto_957807 - FLEVEL
      ?auto_957805 - FLEVEL
      ?auto_957806 - CITY
      ?auto_957808 - CITY
      ?auto_957809 - CITY
      ?auto_957804 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_957807 ?auto_957805 ) ( PERSON-AT ?auto_957803 ?auto_957806 ) ( not ( = ?auto_957799 ?auto_957806 ) ) ( not ( = ?auto_957807 ?auto_957805 ) ) ( PERSON-AT ?auto_957802 ?auto_957808 ) ( not ( = ?auto_957799 ?auto_957808 ) ) ( PERSON-AT ?auto_957801 ?auto_957806 ) ( PERSON-AT ?auto_957800 ?auto_957809 ) ( AIRCRAFT-AT ?auto_957804 ?auto_957799 ) ( FUEL-LEVEL ?auto_957804 ?auto_957807 ) ( not ( = ?auto_957799 ?auto_957809 ) ) ( not ( = ?auto_957800 ?auto_957801 ) ) ( not ( = ?auto_957806 ?auto_957809 ) ) ( not ( = ?auto_957800 ?auto_957802 ) ) ( not ( = ?auto_957801 ?auto_957802 ) ) ( not ( = ?auto_957808 ?auto_957806 ) ) ( not ( = ?auto_957808 ?auto_957809 ) ) ( not ( = ?auto_957800 ?auto_957803 ) ) ( not ( = ?auto_957801 ?auto_957803 ) ) ( not ( = ?auto_957802 ?auto_957803 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_957800 ?auto_957801 ?auto_957802 ?auto_957799 )
      ( FLY-1PPL ?auto_957803 ?auto_957799 )
      ( FLY-4PPL-VERIFY ?auto_957800 ?auto_957801 ?auto_957802 ?auto_957803 ?auto_957799 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_957835 - PERSON
      ?auto_957836 - PERSON
      ?auto_957837 - PERSON
      ?auto_957838 - PERSON
      ?auto_957834 - CITY
    )
    :vars
    (
      ?auto_957843 - FLEVEL
      ?auto_957844 - FLEVEL
      ?auto_957841 - CITY
      ?auto_957842 - CITY
      ?auto_957839 - CITY
      ?auto_957840 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_957843 ?auto_957844 ) ( PERSON-AT ?auto_957837 ?auto_957841 ) ( not ( = ?auto_957834 ?auto_957841 ) ) ( not ( = ?auto_957843 ?auto_957844 ) ) ( PERSON-AT ?auto_957838 ?auto_957842 ) ( not ( = ?auto_957834 ?auto_957842 ) ) ( PERSON-AT ?auto_957836 ?auto_957841 ) ( PERSON-AT ?auto_957835 ?auto_957839 ) ( AIRCRAFT-AT ?auto_957840 ?auto_957834 ) ( FUEL-LEVEL ?auto_957840 ?auto_957843 ) ( not ( = ?auto_957834 ?auto_957839 ) ) ( not ( = ?auto_957835 ?auto_957836 ) ) ( not ( = ?auto_957841 ?auto_957839 ) ) ( not ( = ?auto_957835 ?auto_957838 ) ) ( not ( = ?auto_957836 ?auto_957838 ) ) ( not ( = ?auto_957842 ?auto_957841 ) ) ( not ( = ?auto_957842 ?auto_957839 ) ) ( not ( = ?auto_957835 ?auto_957837 ) ) ( not ( = ?auto_957836 ?auto_957837 ) ) ( not ( = ?auto_957838 ?auto_957837 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_957835 ?auto_957836 ?auto_957838 ?auto_957837 ?auto_957834 )
      ( FLY-4PPL-VERIFY ?auto_957835 ?auto_957836 ?auto_957837 ?auto_957838 ?auto_957834 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_957870 - PERSON
      ?auto_957871 - PERSON
      ?auto_957872 - PERSON
      ?auto_957873 - PERSON
      ?auto_957869 - CITY
    )
    :vars
    (
      ?auto_957874 - FLEVEL
      ?auto_957876 - FLEVEL
      ?auto_957878 - CITY
      ?auto_957879 - CITY
      ?auto_957875 - CITY
      ?auto_957877 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_957874 ?auto_957876 ) ( PERSON-AT ?auto_957873 ?auto_957878 ) ( not ( = ?auto_957869 ?auto_957878 ) ) ( not ( = ?auto_957874 ?auto_957876 ) ) ( PERSON-AT ?auto_957871 ?auto_957879 ) ( not ( = ?auto_957869 ?auto_957879 ) ) ( PERSON-AT ?auto_957872 ?auto_957878 ) ( PERSON-AT ?auto_957870 ?auto_957875 ) ( AIRCRAFT-AT ?auto_957877 ?auto_957869 ) ( FUEL-LEVEL ?auto_957877 ?auto_957874 ) ( not ( = ?auto_957869 ?auto_957875 ) ) ( not ( = ?auto_957870 ?auto_957872 ) ) ( not ( = ?auto_957878 ?auto_957875 ) ) ( not ( = ?auto_957870 ?auto_957871 ) ) ( not ( = ?auto_957872 ?auto_957871 ) ) ( not ( = ?auto_957879 ?auto_957878 ) ) ( not ( = ?auto_957879 ?auto_957875 ) ) ( not ( = ?auto_957870 ?auto_957873 ) ) ( not ( = ?auto_957872 ?auto_957873 ) ) ( not ( = ?auto_957871 ?auto_957873 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_957870 ?auto_957872 ?auto_957873 ?auto_957871 ?auto_957869 )
      ( FLY-4PPL-VERIFY ?auto_957870 ?auto_957871 ?auto_957872 ?auto_957873 ?auto_957869 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_958140 - PERSON
      ?auto_958141 - PERSON
      ?auto_958142 - PERSON
      ?auto_958143 - PERSON
      ?auto_958139 - CITY
    )
    :vars
    (
      ?auto_958144 - FLEVEL
      ?auto_958146 - FLEVEL
      ?auto_958148 - CITY
      ?auto_958149 - CITY
      ?auto_958145 - CITY
      ?auto_958147 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_958144 ?auto_958146 ) ( PERSON-AT ?auto_958143 ?auto_958148 ) ( not ( = ?auto_958139 ?auto_958148 ) ) ( not ( = ?auto_958144 ?auto_958146 ) ) ( PERSON-AT ?auto_958142 ?auto_958149 ) ( not ( = ?auto_958139 ?auto_958149 ) ) ( PERSON-AT ?auto_958140 ?auto_958148 ) ( PERSON-AT ?auto_958141 ?auto_958145 ) ( AIRCRAFT-AT ?auto_958147 ?auto_958139 ) ( FUEL-LEVEL ?auto_958147 ?auto_958144 ) ( not ( = ?auto_958139 ?auto_958145 ) ) ( not ( = ?auto_958141 ?auto_958140 ) ) ( not ( = ?auto_958148 ?auto_958145 ) ) ( not ( = ?auto_958141 ?auto_958142 ) ) ( not ( = ?auto_958140 ?auto_958142 ) ) ( not ( = ?auto_958149 ?auto_958148 ) ) ( not ( = ?auto_958149 ?auto_958145 ) ) ( not ( = ?auto_958141 ?auto_958143 ) ) ( not ( = ?auto_958140 ?auto_958143 ) ) ( not ( = ?auto_958142 ?auto_958143 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_958141 ?auto_958140 ?auto_958143 ?auto_958142 ?auto_958139 )
      ( FLY-4PPL-VERIFY ?auto_958140 ?auto_958141 ?auto_958142 ?auto_958143 ?auto_958139 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_958175 - PERSON
      ?auto_958176 - PERSON
      ?auto_958177 - PERSON
      ?auto_958178 - PERSON
      ?auto_958174 - CITY
    )
    :vars
    (
      ?auto_958179 - FLEVEL
      ?auto_958181 - FLEVEL
      ?auto_958183 - CITY
      ?auto_958184 - CITY
      ?auto_958180 - CITY
      ?auto_958182 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_958179 ?auto_958181 ) ( PERSON-AT ?auto_958177 ?auto_958183 ) ( not ( = ?auto_958174 ?auto_958183 ) ) ( not ( = ?auto_958179 ?auto_958181 ) ) ( PERSON-AT ?auto_958178 ?auto_958184 ) ( not ( = ?auto_958174 ?auto_958184 ) ) ( PERSON-AT ?auto_958175 ?auto_958183 ) ( PERSON-AT ?auto_958176 ?auto_958180 ) ( AIRCRAFT-AT ?auto_958182 ?auto_958174 ) ( FUEL-LEVEL ?auto_958182 ?auto_958179 ) ( not ( = ?auto_958174 ?auto_958180 ) ) ( not ( = ?auto_958176 ?auto_958175 ) ) ( not ( = ?auto_958183 ?auto_958180 ) ) ( not ( = ?auto_958176 ?auto_958178 ) ) ( not ( = ?auto_958175 ?auto_958178 ) ) ( not ( = ?auto_958184 ?auto_958183 ) ) ( not ( = ?auto_958184 ?auto_958180 ) ) ( not ( = ?auto_958176 ?auto_958177 ) ) ( not ( = ?auto_958175 ?auto_958177 ) ) ( not ( = ?auto_958178 ?auto_958177 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_958176 ?auto_958175 ?auto_958177 ?auto_958178 ?auto_958174 )
      ( FLY-4PPL-VERIFY ?auto_958175 ?auto_958176 ?auto_958177 ?auto_958178 ?auto_958174 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_958379 - PERSON
      ?auto_958380 - PERSON
      ?auto_958381 - PERSON
      ?auto_958382 - PERSON
      ?auto_958378 - CITY
    )
    :vars
    (
      ?auto_958383 - FLEVEL
      ?auto_958385 - FLEVEL
      ?auto_958387 - CITY
      ?auto_958388 - CITY
      ?auto_958384 - CITY
      ?auto_958386 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_958383 ?auto_958385 ) ( PERSON-AT ?auto_958380 ?auto_958387 ) ( not ( = ?auto_958378 ?auto_958387 ) ) ( not ( = ?auto_958383 ?auto_958385 ) ) ( PERSON-AT ?auto_958382 ?auto_958388 ) ( not ( = ?auto_958378 ?auto_958388 ) ) ( PERSON-AT ?auto_958379 ?auto_958387 ) ( PERSON-AT ?auto_958381 ?auto_958384 ) ( AIRCRAFT-AT ?auto_958386 ?auto_958378 ) ( FUEL-LEVEL ?auto_958386 ?auto_958383 ) ( not ( = ?auto_958378 ?auto_958384 ) ) ( not ( = ?auto_958381 ?auto_958379 ) ) ( not ( = ?auto_958387 ?auto_958384 ) ) ( not ( = ?auto_958381 ?auto_958382 ) ) ( not ( = ?auto_958379 ?auto_958382 ) ) ( not ( = ?auto_958388 ?auto_958387 ) ) ( not ( = ?auto_958388 ?auto_958384 ) ) ( not ( = ?auto_958381 ?auto_958380 ) ) ( not ( = ?auto_958379 ?auto_958380 ) ) ( not ( = ?auto_958382 ?auto_958380 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_958381 ?auto_958379 ?auto_958380 ?auto_958382 ?auto_958378 )
      ( FLY-4PPL-VERIFY ?auto_958379 ?auto_958380 ?auto_958381 ?auto_958382 ?auto_958378 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_973441 - PERSON
      ?auto_973442 - PERSON
      ?auto_973443 - PERSON
      ?auto_973444 - PERSON
      ?auto_973445 - PERSON
      ?auto_973440 - CITY
    )
    :vars
    (
      ?auto_973446 - FLEVEL
      ?auto_973449 - FLEVEL
      ?auto_973448 - CITY
      ?auto_973451 - CITY
      ?auto_973450 - CITY
      ?auto_973447 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_973446 ?auto_973449 ) ( PERSON-AT ?auto_973445 ?auto_973448 ) ( not ( = ?auto_973440 ?auto_973448 ) ) ( not ( = ?auto_973446 ?auto_973449 ) ) ( PERSON-AT ?auto_973444 ?auto_973451 ) ( not ( = ?auto_973440 ?auto_973451 ) ) ( PERSON-AT ?auto_973443 ?auto_973448 ) ( PERSON-AT ?auto_973442 ?auto_973451 ) ( PERSON-AT ?auto_973441 ?auto_973450 ) ( AIRCRAFT-AT ?auto_973447 ?auto_973440 ) ( FUEL-LEVEL ?auto_973447 ?auto_973446 ) ( not ( = ?auto_973440 ?auto_973450 ) ) ( not ( = ?auto_973441 ?auto_973442 ) ) ( not ( = ?auto_973451 ?auto_973450 ) ) ( not ( = ?auto_973441 ?auto_973443 ) ) ( not ( = ?auto_973442 ?auto_973443 ) ) ( not ( = ?auto_973448 ?auto_973451 ) ) ( not ( = ?auto_973448 ?auto_973450 ) ) ( not ( = ?auto_973441 ?auto_973444 ) ) ( not ( = ?auto_973442 ?auto_973444 ) ) ( not ( = ?auto_973443 ?auto_973444 ) ) ( not ( = ?auto_973441 ?auto_973445 ) ) ( not ( = ?auto_973442 ?auto_973445 ) ) ( not ( = ?auto_973443 ?auto_973445 ) ) ( not ( = ?auto_973444 ?auto_973445 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_973441 ?auto_973442 ?auto_973444 ?auto_973443 ?auto_973440 )
      ( FLY-1PPL ?auto_973445 ?auto_973440 )
      ( FLY-5PPL-VERIFY ?auto_973441 ?auto_973442 ?auto_973443 ?auto_973444 ?auto_973445 ?auto_973440 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_973492 - PERSON
      ?auto_973493 - PERSON
      ?auto_973494 - PERSON
      ?auto_973495 - PERSON
      ?auto_973496 - PERSON
      ?auto_973491 - CITY
    )
    :vars
    (
      ?auto_973502 - FLEVEL
      ?auto_973497 - FLEVEL
      ?auto_973498 - CITY
      ?auto_973500 - CITY
      ?auto_973499 - CITY
      ?auto_973501 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_973502 ?auto_973497 ) ( PERSON-AT ?auto_973495 ?auto_973498 ) ( not ( = ?auto_973491 ?auto_973498 ) ) ( not ( = ?auto_973502 ?auto_973497 ) ) ( PERSON-AT ?auto_973496 ?auto_973500 ) ( not ( = ?auto_973491 ?auto_973500 ) ) ( PERSON-AT ?auto_973494 ?auto_973498 ) ( PERSON-AT ?auto_973493 ?auto_973500 ) ( PERSON-AT ?auto_973492 ?auto_973499 ) ( AIRCRAFT-AT ?auto_973501 ?auto_973491 ) ( FUEL-LEVEL ?auto_973501 ?auto_973502 ) ( not ( = ?auto_973491 ?auto_973499 ) ) ( not ( = ?auto_973492 ?auto_973493 ) ) ( not ( = ?auto_973500 ?auto_973499 ) ) ( not ( = ?auto_973492 ?auto_973494 ) ) ( not ( = ?auto_973493 ?auto_973494 ) ) ( not ( = ?auto_973498 ?auto_973500 ) ) ( not ( = ?auto_973498 ?auto_973499 ) ) ( not ( = ?auto_973492 ?auto_973496 ) ) ( not ( = ?auto_973493 ?auto_973496 ) ) ( not ( = ?auto_973494 ?auto_973496 ) ) ( not ( = ?auto_973492 ?auto_973495 ) ) ( not ( = ?auto_973493 ?auto_973495 ) ) ( not ( = ?auto_973494 ?auto_973495 ) ) ( not ( = ?auto_973496 ?auto_973495 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_973492 ?auto_973493 ?auto_973494 ?auto_973496 ?auto_973495 ?auto_973491 )
      ( FLY-5PPL-VERIFY ?auto_973492 ?auto_973493 ?auto_973494 ?auto_973495 ?auto_973496 ?auto_973491 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_973543 - PERSON
      ?auto_973544 - PERSON
      ?auto_973545 - PERSON
      ?auto_973546 - PERSON
      ?auto_973547 - PERSON
      ?auto_973542 - CITY
    )
    :vars
    (
      ?auto_973551 - FLEVEL
      ?auto_973550 - FLEVEL
      ?auto_973549 - CITY
      ?auto_973548 - CITY
      ?auto_973552 - CITY
      ?auto_973553 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_973551 ?auto_973550 ) ( PERSON-AT ?auto_973547 ?auto_973549 ) ( not ( = ?auto_973542 ?auto_973549 ) ) ( not ( = ?auto_973551 ?auto_973550 ) ) ( PERSON-AT ?auto_973545 ?auto_973548 ) ( not ( = ?auto_973542 ?auto_973548 ) ) ( PERSON-AT ?auto_973546 ?auto_973549 ) ( PERSON-AT ?auto_973544 ?auto_973548 ) ( PERSON-AT ?auto_973543 ?auto_973552 ) ( AIRCRAFT-AT ?auto_973553 ?auto_973542 ) ( FUEL-LEVEL ?auto_973553 ?auto_973551 ) ( not ( = ?auto_973542 ?auto_973552 ) ) ( not ( = ?auto_973543 ?auto_973544 ) ) ( not ( = ?auto_973548 ?auto_973552 ) ) ( not ( = ?auto_973543 ?auto_973546 ) ) ( not ( = ?auto_973544 ?auto_973546 ) ) ( not ( = ?auto_973549 ?auto_973548 ) ) ( not ( = ?auto_973549 ?auto_973552 ) ) ( not ( = ?auto_973543 ?auto_973545 ) ) ( not ( = ?auto_973544 ?auto_973545 ) ) ( not ( = ?auto_973546 ?auto_973545 ) ) ( not ( = ?auto_973543 ?auto_973547 ) ) ( not ( = ?auto_973544 ?auto_973547 ) ) ( not ( = ?auto_973546 ?auto_973547 ) ) ( not ( = ?auto_973545 ?auto_973547 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_973543 ?auto_973544 ?auto_973546 ?auto_973547 ?auto_973545 ?auto_973542 )
      ( FLY-5PPL-VERIFY ?auto_973543 ?auto_973544 ?auto_973545 ?auto_973546 ?auto_973547 ?auto_973542 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_977425 - PERSON
      ?auto_977426 - PERSON
      ?auto_977427 - PERSON
      ?auto_977428 - PERSON
      ?auto_977429 - PERSON
      ?auto_977424 - CITY
    )
    :vars
    (
      ?auto_977433 - FLEVEL
      ?auto_977432 - FLEVEL
      ?auto_977431 - CITY
      ?auto_977430 - CITY
      ?auto_977434 - CITY
      ?auto_977435 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_977433 ?auto_977432 ) ( PERSON-AT ?auto_977429 ?auto_977431 ) ( not ( = ?auto_977424 ?auto_977431 ) ) ( not ( = ?auto_977433 ?auto_977432 ) ) ( PERSON-AT ?auto_977428 ?auto_977430 ) ( not ( = ?auto_977424 ?auto_977430 ) ) ( PERSON-AT ?auto_977427 ?auto_977431 ) ( PERSON-AT ?auto_977425 ?auto_977430 ) ( PERSON-AT ?auto_977426 ?auto_977434 ) ( AIRCRAFT-AT ?auto_977435 ?auto_977424 ) ( FUEL-LEVEL ?auto_977435 ?auto_977433 ) ( not ( = ?auto_977424 ?auto_977434 ) ) ( not ( = ?auto_977426 ?auto_977425 ) ) ( not ( = ?auto_977430 ?auto_977434 ) ) ( not ( = ?auto_977426 ?auto_977427 ) ) ( not ( = ?auto_977425 ?auto_977427 ) ) ( not ( = ?auto_977431 ?auto_977430 ) ) ( not ( = ?auto_977431 ?auto_977434 ) ) ( not ( = ?auto_977426 ?auto_977428 ) ) ( not ( = ?auto_977425 ?auto_977428 ) ) ( not ( = ?auto_977427 ?auto_977428 ) ) ( not ( = ?auto_977426 ?auto_977429 ) ) ( not ( = ?auto_977425 ?auto_977429 ) ) ( not ( = ?auto_977427 ?auto_977429 ) ) ( not ( = ?auto_977428 ?auto_977429 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_977426 ?auto_977425 ?auto_977427 ?auto_977429 ?auto_977428 ?auto_977424 )
      ( FLY-5PPL-VERIFY ?auto_977425 ?auto_977426 ?auto_977427 ?auto_977428 ?auto_977429 ?auto_977424 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_977476 - PERSON
      ?auto_977477 - PERSON
      ?auto_977478 - PERSON
      ?auto_977479 - PERSON
      ?auto_977480 - PERSON
      ?auto_977475 - CITY
    )
    :vars
    (
      ?auto_977484 - FLEVEL
      ?auto_977483 - FLEVEL
      ?auto_977482 - CITY
      ?auto_977481 - CITY
      ?auto_977485 - CITY
      ?auto_977486 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_977484 ?auto_977483 ) ( PERSON-AT ?auto_977479 ?auto_977482 ) ( not ( = ?auto_977475 ?auto_977482 ) ) ( not ( = ?auto_977484 ?auto_977483 ) ) ( PERSON-AT ?auto_977480 ?auto_977481 ) ( not ( = ?auto_977475 ?auto_977481 ) ) ( PERSON-AT ?auto_977478 ?auto_977482 ) ( PERSON-AT ?auto_977476 ?auto_977481 ) ( PERSON-AT ?auto_977477 ?auto_977485 ) ( AIRCRAFT-AT ?auto_977486 ?auto_977475 ) ( FUEL-LEVEL ?auto_977486 ?auto_977484 ) ( not ( = ?auto_977475 ?auto_977485 ) ) ( not ( = ?auto_977477 ?auto_977476 ) ) ( not ( = ?auto_977481 ?auto_977485 ) ) ( not ( = ?auto_977477 ?auto_977478 ) ) ( not ( = ?auto_977476 ?auto_977478 ) ) ( not ( = ?auto_977482 ?auto_977481 ) ) ( not ( = ?auto_977482 ?auto_977485 ) ) ( not ( = ?auto_977477 ?auto_977480 ) ) ( not ( = ?auto_977476 ?auto_977480 ) ) ( not ( = ?auto_977478 ?auto_977480 ) ) ( not ( = ?auto_977477 ?auto_977479 ) ) ( not ( = ?auto_977476 ?auto_977479 ) ) ( not ( = ?auto_977478 ?auto_977479 ) ) ( not ( = ?auto_977480 ?auto_977479 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_977477 ?auto_977476 ?auto_977478 ?auto_977479 ?auto_977480 ?auto_977475 )
      ( FLY-5PPL-VERIFY ?auto_977476 ?auto_977477 ?auto_977478 ?auto_977479 ?auto_977480 ?auto_977475 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_977527 - PERSON
      ?auto_977528 - PERSON
      ?auto_977529 - PERSON
      ?auto_977530 - PERSON
      ?auto_977531 - PERSON
      ?auto_977526 - CITY
    )
    :vars
    (
      ?auto_977535 - FLEVEL
      ?auto_977534 - FLEVEL
      ?auto_977533 - CITY
      ?auto_977532 - CITY
      ?auto_977536 - CITY
      ?auto_977537 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_977535 ?auto_977534 ) ( PERSON-AT ?auto_977531 ?auto_977533 ) ( not ( = ?auto_977526 ?auto_977533 ) ) ( not ( = ?auto_977535 ?auto_977534 ) ) ( PERSON-AT ?auto_977529 ?auto_977532 ) ( not ( = ?auto_977526 ?auto_977532 ) ) ( PERSON-AT ?auto_977530 ?auto_977533 ) ( PERSON-AT ?auto_977527 ?auto_977532 ) ( PERSON-AT ?auto_977528 ?auto_977536 ) ( AIRCRAFT-AT ?auto_977537 ?auto_977526 ) ( FUEL-LEVEL ?auto_977537 ?auto_977535 ) ( not ( = ?auto_977526 ?auto_977536 ) ) ( not ( = ?auto_977528 ?auto_977527 ) ) ( not ( = ?auto_977532 ?auto_977536 ) ) ( not ( = ?auto_977528 ?auto_977530 ) ) ( not ( = ?auto_977527 ?auto_977530 ) ) ( not ( = ?auto_977533 ?auto_977532 ) ) ( not ( = ?auto_977533 ?auto_977536 ) ) ( not ( = ?auto_977528 ?auto_977529 ) ) ( not ( = ?auto_977527 ?auto_977529 ) ) ( not ( = ?auto_977530 ?auto_977529 ) ) ( not ( = ?auto_977528 ?auto_977531 ) ) ( not ( = ?auto_977527 ?auto_977531 ) ) ( not ( = ?auto_977530 ?auto_977531 ) ) ( not ( = ?auto_977529 ?auto_977531 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_977528 ?auto_977527 ?auto_977530 ?auto_977531 ?auto_977529 ?auto_977526 )
      ( FLY-5PPL-VERIFY ?auto_977527 ?auto_977528 ?auto_977529 ?auto_977530 ?auto_977531 ?auto_977526 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_978812 - PERSON
      ?auto_978813 - PERSON
      ?auto_978814 - PERSON
      ?auto_978815 - PERSON
      ?auto_978816 - PERSON
      ?auto_978811 - CITY
    )
    :vars
    (
      ?auto_978820 - FLEVEL
      ?auto_978819 - FLEVEL
      ?auto_978818 - CITY
      ?auto_978817 - CITY
      ?auto_978821 - CITY
      ?auto_978822 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_978820 ?auto_978819 ) ( PERSON-AT ?auto_978816 ?auto_978818 ) ( not ( = ?auto_978811 ?auto_978818 ) ) ( not ( = ?auto_978820 ?auto_978819 ) ) ( PERSON-AT ?auto_978815 ?auto_978817 ) ( not ( = ?auto_978811 ?auto_978817 ) ) ( PERSON-AT ?auto_978813 ?auto_978818 ) ( PERSON-AT ?auto_978812 ?auto_978817 ) ( PERSON-AT ?auto_978814 ?auto_978821 ) ( AIRCRAFT-AT ?auto_978822 ?auto_978811 ) ( FUEL-LEVEL ?auto_978822 ?auto_978820 ) ( not ( = ?auto_978811 ?auto_978821 ) ) ( not ( = ?auto_978814 ?auto_978812 ) ) ( not ( = ?auto_978817 ?auto_978821 ) ) ( not ( = ?auto_978814 ?auto_978813 ) ) ( not ( = ?auto_978812 ?auto_978813 ) ) ( not ( = ?auto_978818 ?auto_978817 ) ) ( not ( = ?auto_978818 ?auto_978821 ) ) ( not ( = ?auto_978814 ?auto_978815 ) ) ( not ( = ?auto_978812 ?auto_978815 ) ) ( not ( = ?auto_978813 ?auto_978815 ) ) ( not ( = ?auto_978814 ?auto_978816 ) ) ( not ( = ?auto_978812 ?auto_978816 ) ) ( not ( = ?auto_978813 ?auto_978816 ) ) ( not ( = ?auto_978815 ?auto_978816 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_978814 ?auto_978812 ?auto_978813 ?auto_978816 ?auto_978815 ?auto_978811 )
      ( FLY-5PPL-VERIFY ?auto_978812 ?auto_978813 ?auto_978814 ?auto_978815 ?auto_978816 ?auto_978811 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_978863 - PERSON
      ?auto_978864 - PERSON
      ?auto_978865 - PERSON
      ?auto_978866 - PERSON
      ?auto_978867 - PERSON
      ?auto_978862 - CITY
    )
    :vars
    (
      ?auto_978871 - FLEVEL
      ?auto_978870 - FLEVEL
      ?auto_978869 - CITY
      ?auto_978868 - CITY
      ?auto_978872 - CITY
      ?auto_978873 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_978871 ?auto_978870 ) ( PERSON-AT ?auto_978866 ?auto_978869 ) ( not ( = ?auto_978862 ?auto_978869 ) ) ( not ( = ?auto_978871 ?auto_978870 ) ) ( PERSON-AT ?auto_978867 ?auto_978868 ) ( not ( = ?auto_978862 ?auto_978868 ) ) ( PERSON-AT ?auto_978864 ?auto_978869 ) ( PERSON-AT ?auto_978863 ?auto_978868 ) ( PERSON-AT ?auto_978865 ?auto_978872 ) ( AIRCRAFT-AT ?auto_978873 ?auto_978862 ) ( FUEL-LEVEL ?auto_978873 ?auto_978871 ) ( not ( = ?auto_978862 ?auto_978872 ) ) ( not ( = ?auto_978865 ?auto_978863 ) ) ( not ( = ?auto_978868 ?auto_978872 ) ) ( not ( = ?auto_978865 ?auto_978864 ) ) ( not ( = ?auto_978863 ?auto_978864 ) ) ( not ( = ?auto_978869 ?auto_978868 ) ) ( not ( = ?auto_978869 ?auto_978872 ) ) ( not ( = ?auto_978865 ?auto_978867 ) ) ( not ( = ?auto_978863 ?auto_978867 ) ) ( not ( = ?auto_978864 ?auto_978867 ) ) ( not ( = ?auto_978865 ?auto_978866 ) ) ( not ( = ?auto_978863 ?auto_978866 ) ) ( not ( = ?auto_978864 ?auto_978866 ) ) ( not ( = ?auto_978867 ?auto_978866 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_978865 ?auto_978863 ?auto_978864 ?auto_978866 ?auto_978867 ?auto_978862 )
      ( FLY-5PPL-VERIFY ?auto_978863 ?auto_978864 ?auto_978865 ?auto_978866 ?auto_978867 ?auto_978862 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_979132 - PERSON
      ?auto_979133 - PERSON
      ?auto_979134 - PERSON
      ?auto_979135 - PERSON
      ?auto_979136 - PERSON
      ?auto_979131 - CITY
    )
    :vars
    (
      ?auto_979140 - FLEVEL
      ?auto_979139 - FLEVEL
      ?auto_979138 - CITY
      ?auto_979137 - CITY
      ?auto_979141 - CITY
      ?auto_979142 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_979140 ?auto_979139 ) ( PERSON-AT ?auto_979136 ?auto_979138 ) ( not ( = ?auto_979131 ?auto_979138 ) ) ( not ( = ?auto_979140 ?auto_979139 ) ) ( PERSON-AT ?auto_979134 ?auto_979137 ) ( not ( = ?auto_979131 ?auto_979137 ) ) ( PERSON-AT ?auto_979133 ?auto_979138 ) ( PERSON-AT ?auto_979132 ?auto_979137 ) ( PERSON-AT ?auto_979135 ?auto_979141 ) ( AIRCRAFT-AT ?auto_979142 ?auto_979131 ) ( FUEL-LEVEL ?auto_979142 ?auto_979140 ) ( not ( = ?auto_979131 ?auto_979141 ) ) ( not ( = ?auto_979135 ?auto_979132 ) ) ( not ( = ?auto_979137 ?auto_979141 ) ) ( not ( = ?auto_979135 ?auto_979133 ) ) ( not ( = ?auto_979132 ?auto_979133 ) ) ( not ( = ?auto_979138 ?auto_979137 ) ) ( not ( = ?auto_979138 ?auto_979141 ) ) ( not ( = ?auto_979135 ?auto_979134 ) ) ( not ( = ?auto_979132 ?auto_979134 ) ) ( not ( = ?auto_979133 ?auto_979134 ) ) ( not ( = ?auto_979135 ?auto_979136 ) ) ( not ( = ?auto_979132 ?auto_979136 ) ) ( not ( = ?auto_979133 ?auto_979136 ) ) ( not ( = ?auto_979134 ?auto_979136 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_979135 ?auto_979132 ?auto_979133 ?auto_979136 ?auto_979134 ?auto_979131 )
      ( FLY-5PPL-VERIFY ?auto_979132 ?auto_979133 ?auto_979134 ?auto_979135 ?auto_979136 ?auto_979131 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_979183 - PERSON
      ?auto_979184 - PERSON
      ?auto_979185 - PERSON
      ?auto_979186 - PERSON
      ?auto_979187 - PERSON
      ?auto_979182 - CITY
    )
    :vars
    (
      ?auto_979191 - FLEVEL
      ?auto_979190 - FLEVEL
      ?auto_979189 - CITY
      ?auto_979188 - CITY
      ?auto_979192 - CITY
      ?auto_979193 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_979191 ?auto_979190 ) ( PERSON-AT ?auto_979186 ?auto_979189 ) ( not ( = ?auto_979182 ?auto_979189 ) ) ( not ( = ?auto_979191 ?auto_979190 ) ) ( PERSON-AT ?auto_979185 ?auto_979188 ) ( not ( = ?auto_979182 ?auto_979188 ) ) ( PERSON-AT ?auto_979184 ?auto_979189 ) ( PERSON-AT ?auto_979183 ?auto_979188 ) ( PERSON-AT ?auto_979187 ?auto_979192 ) ( AIRCRAFT-AT ?auto_979193 ?auto_979182 ) ( FUEL-LEVEL ?auto_979193 ?auto_979191 ) ( not ( = ?auto_979182 ?auto_979192 ) ) ( not ( = ?auto_979187 ?auto_979183 ) ) ( not ( = ?auto_979188 ?auto_979192 ) ) ( not ( = ?auto_979187 ?auto_979184 ) ) ( not ( = ?auto_979183 ?auto_979184 ) ) ( not ( = ?auto_979189 ?auto_979188 ) ) ( not ( = ?auto_979189 ?auto_979192 ) ) ( not ( = ?auto_979187 ?auto_979185 ) ) ( not ( = ?auto_979183 ?auto_979185 ) ) ( not ( = ?auto_979184 ?auto_979185 ) ) ( not ( = ?auto_979187 ?auto_979186 ) ) ( not ( = ?auto_979183 ?auto_979186 ) ) ( not ( = ?auto_979184 ?auto_979186 ) ) ( not ( = ?auto_979185 ?auto_979186 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_979187 ?auto_979183 ?auto_979184 ?auto_979186 ?auto_979185 ?auto_979182 )
      ( FLY-5PPL-VERIFY ?auto_979183 ?auto_979184 ?auto_979185 ?auto_979186 ?auto_979187 ?auto_979182 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_979286 - PERSON
      ?auto_979287 - PERSON
      ?auto_979288 - PERSON
      ?auto_979289 - PERSON
      ?auto_979290 - PERSON
      ?auto_979285 - CITY
    )
    :vars
    (
      ?auto_979294 - FLEVEL
      ?auto_979293 - FLEVEL
      ?auto_979292 - CITY
      ?auto_979291 - CITY
      ?auto_979295 - CITY
      ?auto_979296 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_979294 ?auto_979293 ) ( PERSON-AT ?auto_979288 ?auto_979292 ) ( not ( = ?auto_979285 ?auto_979292 ) ) ( not ( = ?auto_979294 ?auto_979293 ) ) ( PERSON-AT ?auto_979290 ?auto_979291 ) ( not ( = ?auto_979285 ?auto_979291 ) ) ( PERSON-AT ?auto_979287 ?auto_979292 ) ( PERSON-AT ?auto_979286 ?auto_979291 ) ( PERSON-AT ?auto_979289 ?auto_979295 ) ( AIRCRAFT-AT ?auto_979296 ?auto_979285 ) ( FUEL-LEVEL ?auto_979296 ?auto_979294 ) ( not ( = ?auto_979285 ?auto_979295 ) ) ( not ( = ?auto_979289 ?auto_979286 ) ) ( not ( = ?auto_979291 ?auto_979295 ) ) ( not ( = ?auto_979289 ?auto_979287 ) ) ( not ( = ?auto_979286 ?auto_979287 ) ) ( not ( = ?auto_979292 ?auto_979291 ) ) ( not ( = ?auto_979292 ?auto_979295 ) ) ( not ( = ?auto_979289 ?auto_979290 ) ) ( not ( = ?auto_979286 ?auto_979290 ) ) ( not ( = ?auto_979287 ?auto_979290 ) ) ( not ( = ?auto_979289 ?auto_979288 ) ) ( not ( = ?auto_979286 ?auto_979288 ) ) ( not ( = ?auto_979287 ?auto_979288 ) ) ( not ( = ?auto_979290 ?auto_979288 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_979289 ?auto_979286 ?auto_979287 ?auto_979288 ?auto_979290 ?auto_979285 )
      ( FLY-5PPL-VERIFY ?auto_979286 ?auto_979287 ?auto_979288 ?auto_979289 ?auto_979290 ?auto_979285 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_979447 - PERSON
      ?auto_979448 - PERSON
      ?auto_979449 - PERSON
      ?auto_979450 - PERSON
      ?auto_979451 - PERSON
      ?auto_979446 - CITY
    )
    :vars
    (
      ?auto_979455 - FLEVEL
      ?auto_979454 - FLEVEL
      ?auto_979453 - CITY
      ?auto_979452 - CITY
      ?auto_979456 - CITY
      ?auto_979457 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_979455 ?auto_979454 ) ( PERSON-AT ?auto_979449 ?auto_979453 ) ( not ( = ?auto_979446 ?auto_979453 ) ) ( not ( = ?auto_979455 ?auto_979454 ) ) ( PERSON-AT ?auto_979450 ?auto_979452 ) ( not ( = ?auto_979446 ?auto_979452 ) ) ( PERSON-AT ?auto_979448 ?auto_979453 ) ( PERSON-AT ?auto_979447 ?auto_979452 ) ( PERSON-AT ?auto_979451 ?auto_979456 ) ( AIRCRAFT-AT ?auto_979457 ?auto_979446 ) ( FUEL-LEVEL ?auto_979457 ?auto_979455 ) ( not ( = ?auto_979446 ?auto_979456 ) ) ( not ( = ?auto_979451 ?auto_979447 ) ) ( not ( = ?auto_979452 ?auto_979456 ) ) ( not ( = ?auto_979451 ?auto_979448 ) ) ( not ( = ?auto_979447 ?auto_979448 ) ) ( not ( = ?auto_979453 ?auto_979452 ) ) ( not ( = ?auto_979453 ?auto_979456 ) ) ( not ( = ?auto_979451 ?auto_979450 ) ) ( not ( = ?auto_979447 ?auto_979450 ) ) ( not ( = ?auto_979448 ?auto_979450 ) ) ( not ( = ?auto_979451 ?auto_979449 ) ) ( not ( = ?auto_979447 ?auto_979449 ) ) ( not ( = ?auto_979448 ?auto_979449 ) ) ( not ( = ?auto_979450 ?auto_979449 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_979451 ?auto_979447 ?auto_979448 ?auto_979449 ?auto_979450 ?auto_979446 )
      ( FLY-5PPL-VERIFY ?auto_979447 ?auto_979448 ?auto_979449 ?auto_979450 ?auto_979451 ?auto_979446 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_979605 - PERSON
      ?auto_979606 - PERSON
      ?auto_979607 - PERSON
      ?auto_979608 - PERSON
      ?auto_979609 - PERSON
      ?auto_979604 - CITY
    )
    :vars
    (
      ?auto_979613 - FLEVEL
      ?auto_979612 - FLEVEL
      ?auto_979611 - CITY
      ?auto_979610 - CITY
      ?auto_979614 - CITY
      ?auto_979615 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_979613 ?auto_979612 ) ( PERSON-AT ?auto_979609 ?auto_979611 ) ( not ( = ?auto_979604 ?auto_979611 ) ) ( not ( = ?auto_979613 ?auto_979612 ) ) ( PERSON-AT ?auto_979606 ?auto_979610 ) ( not ( = ?auto_979604 ?auto_979610 ) ) ( PERSON-AT ?auto_979608 ?auto_979611 ) ( PERSON-AT ?auto_979605 ?auto_979610 ) ( PERSON-AT ?auto_979607 ?auto_979614 ) ( AIRCRAFT-AT ?auto_979615 ?auto_979604 ) ( FUEL-LEVEL ?auto_979615 ?auto_979613 ) ( not ( = ?auto_979604 ?auto_979614 ) ) ( not ( = ?auto_979607 ?auto_979605 ) ) ( not ( = ?auto_979610 ?auto_979614 ) ) ( not ( = ?auto_979607 ?auto_979608 ) ) ( not ( = ?auto_979605 ?auto_979608 ) ) ( not ( = ?auto_979611 ?auto_979610 ) ) ( not ( = ?auto_979611 ?auto_979614 ) ) ( not ( = ?auto_979607 ?auto_979606 ) ) ( not ( = ?auto_979605 ?auto_979606 ) ) ( not ( = ?auto_979608 ?auto_979606 ) ) ( not ( = ?auto_979607 ?auto_979609 ) ) ( not ( = ?auto_979605 ?auto_979609 ) ) ( not ( = ?auto_979608 ?auto_979609 ) ) ( not ( = ?auto_979606 ?auto_979609 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_979607 ?auto_979605 ?auto_979608 ?auto_979609 ?auto_979606 ?auto_979604 )
      ( FLY-5PPL-VERIFY ?auto_979605 ?auto_979606 ?auto_979607 ?auto_979608 ?auto_979609 ?auto_979604 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_979810 - PERSON
      ?auto_979811 - PERSON
      ?auto_979812 - PERSON
      ?auto_979813 - PERSON
      ?auto_979814 - PERSON
      ?auto_979809 - CITY
    )
    :vars
    (
      ?auto_979818 - FLEVEL
      ?auto_979817 - FLEVEL
      ?auto_979816 - CITY
      ?auto_979815 - CITY
      ?auto_979819 - CITY
      ?auto_979820 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_979818 ?auto_979817 ) ( PERSON-AT ?auto_979814 ?auto_979816 ) ( not ( = ?auto_979809 ?auto_979816 ) ) ( not ( = ?auto_979818 ?auto_979817 ) ) ( PERSON-AT ?auto_979811 ?auto_979815 ) ( not ( = ?auto_979809 ?auto_979815 ) ) ( PERSON-AT ?auto_979812 ?auto_979816 ) ( PERSON-AT ?auto_979810 ?auto_979815 ) ( PERSON-AT ?auto_979813 ?auto_979819 ) ( AIRCRAFT-AT ?auto_979820 ?auto_979809 ) ( FUEL-LEVEL ?auto_979820 ?auto_979818 ) ( not ( = ?auto_979809 ?auto_979819 ) ) ( not ( = ?auto_979813 ?auto_979810 ) ) ( not ( = ?auto_979815 ?auto_979819 ) ) ( not ( = ?auto_979813 ?auto_979812 ) ) ( not ( = ?auto_979810 ?auto_979812 ) ) ( not ( = ?auto_979816 ?auto_979815 ) ) ( not ( = ?auto_979816 ?auto_979819 ) ) ( not ( = ?auto_979813 ?auto_979811 ) ) ( not ( = ?auto_979810 ?auto_979811 ) ) ( not ( = ?auto_979812 ?auto_979811 ) ) ( not ( = ?auto_979813 ?auto_979814 ) ) ( not ( = ?auto_979810 ?auto_979814 ) ) ( not ( = ?auto_979812 ?auto_979814 ) ) ( not ( = ?auto_979811 ?auto_979814 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_979813 ?auto_979810 ?auto_979812 ?auto_979814 ?auto_979811 ?auto_979809 )
      ( FLY-5PPL-VERIFY ?auto_979810 ?auto_979811 ?auto_979812 ?auto_979813 ?auto_979814 ?auto_979809 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_979861 - PERSON
      ?auto_979862 - PERSON
      ?auto_979863 - PERSON
      ?auto_979864 - PERSON
      ?auto_979865 - PERSON
      ?auto_979860 - CITY
    )
    :vars
    (
      ?auto_979869 - FLEVEL
      ?auto_979868 - FLEVEL
      ?auto_979867 - CITY
      ?auto_979866 - CITY
      ?auto_979870 - CITY
      ?auto_979871 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_979869 ?auto_979868 ) ( PERSON-AT ?auto_979864 ?auto_979867 ) ( not ( = ?auto_979860 ?auto_979867 ) ) ( not ( = ?auto_979869 ?auto_979868 ) ) ( PERSON-AT ?auto_979862 ?auto_979866 ) ( not ( = ?auto_979860 ?auto_979866 ) ) ( PERSON-AT ?auto_979863 ?auto_979867 ) ( PERSON-AT ?auto_979861 ?auto_979866 ) ( PERSON-AT ?auto_979865 ?auto_979870 ) ( AIRCRAFT-AT ?auto_979871 ?auto_979860 ) ( FUEL-LEVEL ?auto_979871 ?auto_979869 ) ( not ( = ?auto_979860 ?auto_979870 ) ) ( not ( = ?auto_979865 ?auto_979861 ) ) ( not ( = ?auto_979866 ?auto_979870 ) ) ( not ( = ?auto_979865 ?auto_979863 ) ) ( not ( = ?auto_979861 ?auto_979863 ) ) ( not ( = ?auto_979867 ?auto_979866 ) ) ( not ( = ?auto_979867 ?auto_979870 ) ) ( not ( = ?auto_979865 ?auto_979862 ) ) ( not ( = ?auto_979861 ?auto_979862 ) ) ( not ( = ?auto_979863 ?auto_979862 ) ) ( not ( = ?auto_979865 ?auto_979864 ) ) ( not ( = ?auto_979861 ?auto_979864 ) ) ( not ( = ?auto_979863 ?auto_979864 ) ) ( not ( = ?auto_979862 ?auto_979864 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_979865 ?auto_979861 ?auto_979863 ?auto_979864 ?auto_979862 ?auto_979860 )
      ( FLY-5PPL-VERIFY ?auto_979861 ?auto_979862 ?auto_979863 ?auto_979864 ?auto_979865 ?auto_979860 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1230716 - PERSON
      ?auto_1230717 - PERSON
      ?auto_1230718 - PERSON
      ?auto_1230719 - PERSON
      ?auto_1230720 - PERSON
      ?auto_1230721 - PERSON
      ?auto_1230715 - CITY
    )
    :vars
    (
      ?auto_1230722 - FLEVEL
      ?auto_1230723 - FLEVEL
      ?auto_1230724 - CITY
      ?auto_1230726 - CITY
      ?auto_1230727 - CITY
      ?auto_1230725 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1230722 ?auto_1230723 ) ( PERSON-AT ?auto_1230721 ?auto_1230724 ) ( not ( = ?auto_1230715 ?auto_1230724 ) ) ( not ( = ?auto_1230722 ?auto_1230723 ) ) ( PERSON-AT ?auto_1230720 ?auto_1230726 ) ( not ( = ?auto_1230715 ?auto_1230726 ) ) ( PERSON-AT ?auto_1230719 ?auto_1230724 ) ( PERSON-AT ?auto_1230718 ?auto_1230726 ) ( PERSON-AT ?auto_1230717 ?auto_1230724 ) ( PERSON-AT ?auto_1230716 ?auto_1230727 ) ( AIRCRAFT-AT ?auto_1230725 ?auto_1230715 ) ( FUEL-LEVEL ?auto_1230725 ?auto_1230722 ) ( not ( = ?auto_1230715 ?auto_1230727 ) ) ( not ( = ?auto_1230716 ?auto_1230717 ) ) ( not ( = ?auto_1230724 ?auto_1230727 ) ) ( not ( = ?auto_1230716 ?auto_1230718 ) ) ( not ( = ?auto_1230717 ?auto_1230718 ) ) ( not ( = ?auto_1230726 ?auto_1230724 ) ) ( not ( = ?auto_1230726 ?auto_1230727 ) ) ( not ( = ?auto_1230716 ?auto_1230719 ) ) ( not ( = ?auto_1230717 ?auto_1230719 ) ) ( not ( = ?auto_1230718 ?auto_1230719 ) ) ( not ( = ?auto_1230716 ?auto_1230720 ) ) ( not ( = ?auto_1230717 ?auto_1230720 ) ) ( not ( = ?auto_1230718 ?auto_1230720 ) ) ( not ( = ?auto_1230719 ?auto_1230720 ) ) ( not ( = ?auto_1230716 ?auto_1230721 ) ) ( not ( = ?auto_1230717 ?auto_1230721 ) ) ( not ( = ?auto_1230718 ?auto_1230721 ) ) ( not ( = ?auto_1230719 ?auto_1230721 ) ) ( not ( = ?auto_1230720 ?auto_1230721 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1230716 ?auto_1230717 ?auto_1230718 ?auto_1230720 ?auto_1230719 ?auto_1230715 )
      ( FLY-1PPL ?auto_1230721 ?auto_1230715 )
      ( FLY-6PPL-VERIFY ?auto_1230716 ?auto_1230717 ?auto_1230718 ?auto_1230719 ?auto_1230720 ?auto_1230721 ?auto_1230715 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1230785 - PERSON
      ?auto_1230786 - PERSON
      ?auto_1230787 - PERSON
      ?auto_1230788 - PERSON
      ?auto_1230789 - PERSON
      ?auto_1230790 - PERSON
      ?auto_1230784 - CITY
    )
    :vars
    (
      ?auto_1230791 - FLEVEL
      ?auto_1230794 - FLEVEL
      ?auto_1230792 - CITY
      ?auto_1230796 - CITY
      ?auto_1230793 - CITY
      ?auto_1230795 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1230791 ?auto_1230794 ) ( PERSON-AT ?auto_1230789 ?auto_1230792 ) ( not ( = ?auto_1230784 ?auto_1230792 ) ) ( not ( = ?auto_1230791 ?auto_1230794 ) ) ( PERSON-AT ?auto_1230790 ?auto_1230796 ) ( not ( = ?auto_1230784 ?auto_1230796 ) ) ( PERSON-AT ?auto_1230788 ?auto_1230792 ) ( PERSON-AT ?auto_1230787 ?auto_1230796 ) ( PERSON-AT ?auto_1230786 ?auto_1230792 ) ( PERSON-AT ?auto_1230785 ?auto_1230793 ) ( AIRCRAFT-AT ?auto_1230795 ?auto_1230784 ) ( FUEL-LEVEL ?auto_1230795 ?auto_1230791 ) ( not ( = ?auto_1230784 ?auto_1230793 ) ) ( not ( = ?auto_1230785 ?auto_1230786 ) ) ( not ( = ?auto_1230792 ?auto_1230793 ) ) ( not ( = ?auto_1230785 ?auto_1230787 ) ) ( not ( = ?auto_1230786 ?auto_1230787 ) ) ( not ( = ?auto_1230796 ?auto_1230792 ) ) ( not ( = ?auto_1230796 ?auto_1230793 ) ) ( not ( = ?auto_1230785 ?auto_1230788 ) ) ( not ( = ?auto_1230786 ?auto_1230788 ) ) ( not ( = ?auto_1230787 ?auto_1230788 ) ) ( not ( = ?auto_1230785 ?auto_1230790 ) ) ( not ( = ?auto_1230786 ?auto_1230790 ) ) ( not ( = ?auto_1230787 ?auto_1230790 ) ) ( not ( = ?auto_1230788 ?auto_1230790 ) ) ( not ( = ?auto_1230785 ?auto_1230789 ) ) ( not ( = ?auto_1230786 ?auto_1230789 ) ) ( not ( = ?auto_1230787 ?auto_1230789 ) ) ( not ( = ?auto_1230788 ?auto_1230789 ) ) ( not ( = ?auto_1230790 ?auto_1230789 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1230785 ?auto_1230786 ?auto_1230787 ?auto_1230788 ?auto_1230790 ?auto_1230789 ?auto_1230784 )
      ( FLY-6PPL-VERIFY ?auto_1230785 ?auto_1230786 ?auto_1230787 ?auto_1230788 ?auto_1230789 ?auto_1230790 ?auto_1230784 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1230854 - PERSON
      ?auto_1230855 - PERSON
      ?auto_1230856 - PERSON
      ?auto_1230857 - PERSON
      ?auto_1230858 - PERSON
      ?auto_1230859 - PERSON
      ?auto_1230853 - CITY
    )
    :vars
    (
      ?auto_1230861 - FLEVEL
      ?auto_1230863 - FLEVEL
      ?auto_1230864 - CITY
      ?auto_1230865 - CITY
      ?auto_1230860 - CITY
      ?auto_1230862 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1230861 ?auto_1230863 ) ( PERSON-AT ?auto_1230859 ?auto_1230864 ) ( not ( = ?auto_1230853 ?auto_1230864 ) ) ( not ( = ?auto_1230861 ?auto_1230863 ) ) ( PERSON-AT ?auto_1230857 ?auto_1230865 ) ( not ( = ?auto_1230853 ?auto_1230865 ) ) ( PERSON-AT ?auto_1230858 ?auto_1230864 ) ( PERSON-AT ?auto_1230856 ?auto_1230865 ) ( PERSON-AT ?auto_1230855 ?auto_1230864 ) ( PERSON-AT ?auto_1230854 ?auto_1230860 ) ( AIRCRAFT-AT ?auto_1230862 ?auto_1230853 ) ( FUEL-LEVEL ?auto_1230862 ?auto_1230861 ) ( not ( = ?auto_1230853 ?auto_1230860 ) ) ( not ( = ?auto_1230854 ?auto_1230855 ) ) ( not ( = ?auto_1230864 ?auto_1230860 ) ) ( not ( = ?auto_1230854 ?auto_1230856 ) ) ( not ( = ?auto_1230855 ?auto_1230856 ) ) ( not ( = ?auto_1230865 ?auto_1230864 ) ) ( not ( = ?auto_1230865 ?auto_1230860 ) ) ( not ( = ?auto_1230854 ?auto_1230858 ) ) ( not ( = ?auto_1230855 ?auto_1230858 ) ) ( not ( = ?auto_1230856 ?auto_1230858 ) ) ( not ( = ?auto_1230854 ?auto_1230857 ) ) ( not ( = ?auto_1230855 ?auto_1230857 ) ) ( not ( = ?auto_1230856 ?auto_1230857 ) ) ( not ( = ?auto_1230858 ?auto_1230857 ) ) ( not ( = ?auto_1230854 ?auto_1230859 ) ) ( not ( = ?auto_1230855 ?auto_1230859 ) ) ( not ( = ?auto_1230856 ?auto_1230859 ) ) ( not ( = ?auto_1230858 ?auto_1230859 ) ) ( not ( = ?auto_1230857 ?auto_1230859 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1230854 ?auto_1230855 ?auto_1230856 ?auto_1230858 ?auto_1230859 ?auto_1230857 ?auto_1230853 )
      ( FLY-6PPL-VERIFY ?auto_1230854 ?auto_1230855 ?auto_1230856 ?auto_1230857 ?auto_1230858 ?auto_1230859 ?auto_1230853 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1231842 - PERSON
      ?auto_1231843 - PERSON
      ?auto_1231844 - PERSON
      ?auto_1231845 - PERSON
      ?auto_1231846 - PERSON
      ?auto_1231847 - PERSON
      ?auto_1231841 - CITY
    )
    :vars
    (
      ?auto_1231849 - FLEVEL
      ?auto_1231851 - FLEVEL
      ?auto_1231852 - CITY
      ?auto_1231853 - CITY
      ?auto_1231848 - CITY
      ?auto_1231850 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1231849 ?auto_1231851 ) ( PERSON-AT ?auto_1231847 ?auto_1231852 ) ( not ( = ?auto_1231841 ?auto_1231852 ) ) ( not ( = ?auto_1231849 ?auto_1231851 ) ) ( PERSON-AT ?auto_1231846 ?auto_1231853 ) ( not ( = ?auto_1231841 ?auto_1231853 ) ) ( PERSON-AT ?auto_1231844 ?auto_1231852 ) ( PERSON-AT ?auto_1231845 ?auto_1231853 ) ( PERSON-AT ?auto_1231843 ?auto_1231852 ) ( PERSON-AT ?auto_1231842 ?auto_1231848 ) ( AIRCRAFT-AT ?auto_1231850 ?auto_1231841 ) ( FUEL-LEVEL ?auto_1231850 ?auto_1231849 ) ( not ( = ?auto_1231841 ?auto_1231848 ) ) ( not ( = ?auto_1231842 ?auto_1231843 ) ) ( not ( = ?auto_1231852 ?auto_1231848 ) ) ( not ( = ?auto_1231842 ?auto_1231845 ) ) ( not ( = ?auto_1231843 ?auto_1231845 ) ) ( not ( = ?auto_1231853 ?auto_1231852 ) ) ( not ( = ?auto_1231853 ?auto_1231848 ) ) ( not ( = ?auto_1231842 ?auto_1231844 ) ) ( not ( = ?auto_1231843 ?auto_1231844 ) ) ( not ( = ?auto_1231845 ?auto_1231844 ) ) ( not ( = ?auto_1231842 ?auto_1231846 ) ) ( not ( = ?auto_1231843 ?auto_1231846 ) ) ( not ( = ?auto_1231845 ?auto_1231846 ) ) ( not ( = ?auto_1231844 ?auto_1231846 ) ) ( not ( = ?auto_1231842 ?auto_1231847 ) ) ( not ( = ?auto_1231843 ?auto_1231847 ) ) ( not ( = ?auto_1231845 ?auto_1231847 ) ) ( not ( = ?auto_1231844 ?auto_1231847 ) ) ( not ( = ?auto_1231846 ?auto_1231847 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1231842 ?auto_1231843 ?auto_1231845 ?auto_1231844 ?auto_1231847 ?auto_1231846 ?auto_1231841 )
      ( FLY-6PPL-VERIFY ?auto_1231842 ?auto_1231843 ?auto_1231844 ?auto_1231845 ?auto_1231846 ?auto_1231847 ?auto_1231841 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1231911 - PERSON
      ?auto_1231912 - PERSON
      ?auto_1231913 - PERSON
      ?auto_1231914 - PERSON
      ?auto_1231915 - PERSON
      ?auto_1231916 - PERSON
      ?auto_1231910 - CITY
    )
    :vars
    (
      ?auto_1231918 - FLEVEL
      ?auto_1231920 - FLEVEL
      ?auto_1231921 - CITY
      ?auto_1231922 - CITY
      ?auto_1231917 - CITY
      ?auto_1231919 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1231918 ?auto_1231920 ) ( PERSON-AT ?auto_1231915 ?auto_1231921 ) ( not ( = ?auto_1231910 ?auto_1231921 ) ) ( not ( = ?auto_1231918 ?auto_1231920 ) ) ( PERSON-AT ?auto_1231916 ?auto_1231922 ) ( not ( = ?auto_1231910 ?auto_1231922 ) ) ( PERSON-AT ?auto_1231913 ?auto_1231921 ) ( PERSON-AT ?auto_1231914 ?auto_1231922 ) ( PERSON-AT ?auto_1231912 ?auto_1231921 ) ( PERSON-AT ?auto_1231911 ?auto_1231917 ) ( AIRCRAFT-AT ?auto_1231919 ?auto_1231910 ) ( FUEL-LEVEL ?auto_1231919 ?auto_1231918 ) ( not ( = ?auto_1231910 ?auto_1231917 ) ) ( not ( = ?auto_1231911 ?auto_1231912 ) ) ( not ( = ?auto_1231921 ?auto_1231917 ) ) ( not ( = ?auto_1231911 ?auto_1231914 ) ) ( not ( = ?auto_1231912 ?auto_1231914 ) ) ( not ( = ?auto_1231922 ?auto_1231921 ) ) ( not ( = ?auto_1231922 ?auto_1231917 ) ) ( not ( = ?auto_1231911 ?auto_1231913 ) ) ( not ( = ?auto_1231912 ?auto_1231913 ) ) ( not ( = ?auto_1231914 ?auto_1231913 ) ) ( not ( = ?auto_1231911 ?auto_1231916 ) ) ( not ( = ?auto_1231912 ?auto_1231916 ) ) ( not ( = ?auto_1231914 ?auto_1231916 ) ) ( not ( = ?auto_1231913 ?auto_1231916 ) ) ( not ( = ?auto_1231911 ?auto_1231915 ) ) ( not ( = ?auto_1231912 ?auto_1231915 ) ) ( not ( = ?auto_1231914 ?auto_1231915 ) ) ( not ( = ?auto_1231913 ?auto_1231915 ) ) ( not ( = ?auto_1231916 ?auto_1231915 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1231911 ?auto_1231912 ?auto_1231914 ?auto_1231913 ?auto_1231915 ?auto_1231916 ?auto_1231910 )
      ( FLY-6PPL-VERIFY ?auto_1231911 ?auto_1231912 ?auto_1231913 ?auto_1231914 ?auto_1231915 ?auto_1231916 ?auto_1231910 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1232471 - PERSON
      ?auto_1232472 - PERSON
      ?auto_1232473 - PERSON
      ?auto_1232474 - PERSON
      ?auto_1232475 - PERSON
      ?auto_1232476 - PERSON
      ?auto_1232470 - CITY
    )
    :vars
    (
      ?auto_1232478 - FLEVEL
      ?auto_1232480 - FLEVEL
      ?auto_1232481 - CITY
      ?auto_1232482 - CITY
      ?auto_1232477 - CITY
      ?auto_1232479 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1232478 ?auto_1232480 ) ( PERSON-AT ?auto_1232474 ?auto_1232481 ) ( not ( = ?auto_1232470 ?auto_1232481 ) ) ( not ( = ?auto_1232478 ?auto_1232480 ) ) ( PERSON-AT ?auto_1232476 ?auto_1232482 ) ( not ( = ?auto_1232470 ?auto_1232482 ) ) ( PERSON-AT ?auto_1232473 ?auto_1232481 ) ( PERSON-AT ?auto_1232475 ?auto_1232482 ) ( PERSON-AT ?auto_1232472 ?auto_1232481 ) ( PERSON-AT ?auto_1232471 ?auto_1232477 ) ( AIRCRAFT-AT ?auto_1232479 ?auto_1232470 ) ( FUEL-LEVEL ?auto_1232479 ?auto_1232478 ) ( not ( = ?auto_1232470 ?auto_1232477 ) ) ( not ( = ?auto_1232471 ?auto_1232472 ) ) ( not ( = ?auto_1232481 ?auto_1232477 ) ) ( not ( = ?auto_1232471 ?auto_1232475 ) ) ( not ( = ?auto_1232472 ?auto_1232475 ) ) ( not ( = ?auto_1232482 ?auto_1232481 ) ) ( not ( = ?auto_1232482 ?auto_1232477 ) ) ( not ( = ?auto_1232471 ?auto_1232473 ) ) ( not ( = ?auto_1232472 ?auto_1232473 ) ) ( not ( = ?auto_1232475 ?auto_1232473 ) ) ( not ( = ?auto_1232471 ?auto_1232476 ) ) ( not ( = ?auto_1232472 ?auto_1232476 ) ) ( not ( = ?auto_1232475 ?auto_1232476 ) ) ( not ( = ?auto_1232473 ?auto_1232476 ) ) ( not ( = ?auto_1232471 ?auto_1232474 ) ) ( not ( = ?auto_1232472 ?auto_1232474 ) ) ( not ( = ?auto_1232475 ?auto_1232474 ) ) ( not ( = ?auto_1232473 ?auto_1232474 ) ) ( not ( = ?auto_1232476 ?auto_1232474 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1232471 ?auto_1232472 ?auto_1232475 ?auto_1232473 ?auto_1232474 ?auto_1232476 ?auto_1232470 )
      ( FLY-6PPL-VERIFY ?auto_1232471 ?auto_1232472 ?auto_1232473 ?auto_1232474 ?auto_1232475 ?auto_1232476 ?auto_1232470 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1239072 - PERSON
      ?auto_1239073 - PERSON
      ?auto_1239074 - PERSON
      ?auto_1239075 - PERSON
      ?auto_1239076 - PERSON
      ?auto_1239077 - PERSON
      ?auto_1239071 - CITY
    )
    :vars
    (
      ?auto_1239079 - FLEVEL
      ?auto_1239081 - FLEVEL
      ?auto_1239082 - CITY
      ?auto_1239083 - CITY
      ?auto_1239078 - CITY
      ?auto_1239080 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1239079 ?auto_1239081 ) ( PERSON-AT ?auto_1239077 ?auto_1239082 ) ( not ( = ?auto_1239071 ?auto_1239082 ) ) ( not ( = ?auto_1239079 ?auto_1239081 ) ) ( PERSON-AT ?auto_1239076 ?auto_1239083 ) ( not ( = ?auto_1239071 ?auto_1239083 ) ) ( PERSON-AT ?auto_1239075 ?auto_1239082 ) ( PERSON-AT ?auto_1239073 ?auto_1239083 ) ( PERSON-AT ?auto_1239074 ?auto_1239082 ) ( PERSON-AT ?auto_1239072 ?auto_1239078 ) ( AIRCRAFT-AT ?auto_1239080 ?auto_1239071 ) ( FUEL-LEVEL ?auto_1239080 ?auto_1239079 ) ( not ( = ?auto_1239071 ?auto_1239078 ) ) ( not ( = ?auto_1239072 ?auto_1239074 ) ) ( not ( = ?auto_1239082 ?auto_1239078 ) ) ( not ( = ?auto_1239072 ?auto_1239073 ) ) ( not ( = ?auto_1239074 ?auto_1239073 ) ) ( not ( = ?auto_1239083 ?auto_1239082 ) ) ( not ( = ?auto_1239083 ?auto_1239078 ) ) ( not ( = ?auto_1239072 ?auto_1239075 ) ) ( not ( = ?auto_1239074 ?auto_1239075 ) ) ( not ( = ?auto_1239073 ?auto_1239075 ) ) ( not ( = ?auto_1239072 ?auto_1239076 ) ) ( not ( = ?auto_1239074 ?auto_1239076 ) ) ( not ( = ?auto_1239073 ?auto_1239076 ) ) ( not ( = ?auto_1239075 ?auto_1239076 ) ) ( not ( = ?auto_1239072 ?auto_1239077 ) ) ( not ( = ?auto_1239074 ?auto_1239077 ) ) ( not ( = ?auto_1239073 ?auto_1239077 ) ) ( not ( = ?auto_1239075 ?auto_1239077 ) ) ( not ( = ?auto_1239076 ?auto_1239077 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1239072 ?auto_1239074 ?auto_1239073 ?auto_1239075 ?auto_1239077 ?auto_1239076 ?auto_1239071 )
      ( FLY-6PPL-VERIFY ?auto_1239072 ?auto_1239073 ?auto_1239074 ?auto_1239075 ?auto_1239076 ?auto_1239077 ?auto_1239071 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1239141 - PERSON
      ?auto_1239142 - PERSON
      ?auto_1239143 - PERSON
      ?auto_1239144 - PERSON
      ?auto_1239145 - PERSON
      ?auto_1239146 - PERSON
      ?auto_1239140 - CITY
    )
    :vars
    (
      ?auto_1239148 - FLEVEL
      ?auto_1239150 - FLEVEL
      ?auto_1239151 - CITY
      ?auto_1239152 - CITY
      ?auto_1239147 - CITY
      ?auto_1239149 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1239148 ?auto_1239150 ) ( PERSON-AT ?auto_1239145 ?auto_1239151 ) ( not ( = ?auto_1239140 ?auto_1239151 ) ) ( not ( = ?auto_1239148 ?auto_1239150 ) ) ( PERSON-AT ?auto_1239146 ?auto_1239152 ) ( not ( = ?auto_1239140 ?auto_1239152 ) ) ( PERSON-AT ?auto_1239144 ?auto_1239151 ) ( PERSON-AT ?auto_1239142 ?auto_1239152 ) ( PERSON-AT ?auto_1239143 ?auto_1239151 ) ( PERSON-AT ?auto_1239141 ?auto_1239147 ) ( AIRCRAFT-AT ?auto_1239149 ?auto_1239140 ) ( FUEL-LEVEL ?auto_1239149 ?auto_1239148 ) ( not ( = ?auto_1239140 ?auto_1239147 ) ) ( not ( = ?auto_1239141 ?auto_1239143 ) ) ( not ( = ?auto_1239151 ?auto_1239147 ) ) ( not ( = ?auto_1239141 ?auto_1239142 ) ) ( not ( = ?auto_1239143 ?auto_1239142 ) ) ( not ( = ?auto_1239152 ?auto_1239151 ) ) ( not ( = ?auto_1239152 ?auto_1239147 ) ) ( not ( = ?auto_1239141 ?auto_1239144 ) ) ( not ( = ?auto_1239143 ?auto_1239144 ) ) ( not ( = ?auto_1239142 ?auto_1239144 ) ) ( not ( = ?auto_1239141 ?auto_1239146 ) ) ( not ( = ?auto_1239143 ?auto_1239146 ) ) ( not ( = ?auto_1239142 ?auto_1239146 ) ) ( not ( = ?auto_1239144 ?auto_1239146 ) ) ( not ( = ?auto_1239141 ?auto_1239145 ) ) ( not ( = ?auto_1239143 ?auto_1239145 ) ) ( not ( = ?auto_1239142 ?auto_1239145 ) ) ( not ( = ?auto_1239144 ?auto_1239145 ) ) ( not ( = ?auto_1239146 ?auto_1239145 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1239141 ?auto_1239143 ?auto_1239142 ?auto_1239144 ?auto_1239145 ?auto_1239146 ?auto_1239140 )
      ( FLY-6PPL-VERIFY ?auto_1239141 ?auto_1239142 ?auto_1239143 ?auto_1239144 ?auto_1239145 ?auto_1239146 ?auto_1239140 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1239210 - PERSON
      ?auto_1239211 - PERSON
      ?auto_1239212 - PERSON
      ?auto_1239213 - PERSON
      ?auto_1239214 - PERSON
      ?auto_1239215 - PERSON
      ?auto_1239209 - CITY
    )
    :vars
    (
      ?auto_1239217 - FLEVEL
      ?auto_1239219 - FLEVEL
      ?auto_1239220 - CITY
      ?auto_1239221 - CITY
      ?auto_1239216 - CITY
      ?auto_1239218 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1239217 ?auto_1239219 ) ( PERSON-AT ?auto_1239215 ?auto_1239220 ) ( not ( = ?auto_1239209 ?auto_1239220 ) ) ( not ( = ?auto_1239217 ?auto_1239219 ) ) ( PERSON-AT ?auto_1239213 ?auto_1239221 ) ( not ( = ?auto_1239209 ?auto_1239221 ) ) ( PERSON-AT ?auto_1239214 ?auto_1239220 ) ( PERSON-AT ?auto_1239211 ?auto_1239221 ) ( PERSON-AT ?auto_1239212 ?auto_1239220 ) ( PERSON-AT ?auto_1239210 ?auto_1239216 ) ( AIRCRAFT-AT ?auto_1239218 ?auto_1239209 ) ( FUEL-LEVEL ?auto_1239218 ?auto_1239217 ) ( not ( = ?auto_1239209 ?auto_1239216 ) ) ( not ( = ?auto_1239210 ?auto_1239212 ) ) ( not ( = ?auto_1239220 ?auto_1239216 ) ) ( not ( = ?auto_1239210 ?auto_1239211 ) ) ( not ( = ?auto_1239212 ?auto_1239211 ) ) ( not ( = ?auto_1239221 ?auto_1239220 ) ) ( not ( = ?auto_1239221 ?auto_1239216 ) ) ( not ( = ?auto_1239210 ?auto_1239214 ) ) ( not ( = ?auto_1239212 ?auto_1239214 ) ) ( not ( = ?auto_1239211 ?auto_1239214 ) ) ( not ( = ?auto_1239210 ?auto_1239213 ) ) ( not ( = ?auto_1239212 ?auto_1239213 ) ) ( not ( = ?auto_1239211 ?auto_1239213 ) ) ( not ( = ?auto_1239214 ?auto_1239213 ) ) ( not ( = ?auto_1239210 ?auto_1239215 ) ) ( not ( = ?auto_1239212 ?auto_1239215 ) ) ( not ( = ?auto_1239211 ?auto_1239215 ) ) ( not ( = ?auto_1239214 ?auto_1239215 ) ) ( not ( = ?auto_1239213 ?auto_1239215 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1239210 ?auto_1239212 ?auto_1239211 ?auto_1239214 ?auto_1239215 ?auto_1239213 ?auto_1239209 )
      ( FLY-6PPL-VERIFY ?auto_1239210 ?auto_1239211 ?auto_1239212 ?auto_1239213 ?auto_1239214 ?auto_1239215 ?auto_1239209 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1242658 - PERSON
      ?auto_1242659 - PERSON
      ?auto_1242660 - PERSON
      ?auto_1242661 - PERSON
      ?auto_1242662 - PERSON
      ?auto_1242663 - PERSON
      ?auto_1242657 - CITY
    )
    :vars
    (
      ?auto_1242665 - FLEVEL
      ?auto_1242667 - FLEVEL
      ?auto_1242668 - CITY
      ?auto_1242669 - CITY
      ?auto_1242664 - CITY
      ?auto_1242666 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1242665 ?auto_1242667 ) ( PERSON-AT ?auto_1242663 ?auto_1242668 ) ( not ( = ?auto_1242657 ?auto_1242668 ) ) ( not ( = ?auto_1242665 ?auto_1242667 ) ) ( PERSON-AT ?auto_1242660 ?auto_1242669 ) ( not ( = ?auto_1242657 ?auto_1242669 ) ) ( PERSON-AT ?auto_1242662 ?auto_1242668 ) ( PERSON-AT ?auto_1242659 ?auto_1242669 ) ( PERSON-AT ?auto_1242661 ?auto_1242668 ) ( PERSON-AT ?auto_1242658 ?auto_1242664 ) ( AIRCRAFT-AT ?auto_1242666 ?auto_1242657 ) ( FUEL-LEVEL ?auto_1242666 ?auto_1242665 ) ( not ( = ?auto_1242657 ?auto_1242664 ) ) ( not ( = ?auto_1242658 ?auto_1242661 ) ) ( not ( = ?auto_1242668 ?auto_1242664 ) ) ( not ( = ?auto_1242658 ?auto_1242659 ) ) ( not ( = ?auto_1242661 ?auto_1242659 ) ) ( not ( = ?auto_1242669 ?auto_1242668 ) ) ( not ( = ?auto_1242669 ?auto_1242664 ) ) ( not ( = ?auto_1242658 ?auto_1242662 ) ) ( not ( = ?auto_1242661 ?auto_1242662 ) ) ( not ( = ?auto_1242659 ?auto_1242662 ) ) ( not ( = ?auto_1242658 ?auto_1242660 ) ) ( not ( = ?auto_1242661 ?auto_1242660 ) ) ( not ( = ?auto_1242659 ?auto_1242660 ) ) ( not ( = ?auto_1242662 ?auto_1242660 ) ) ( not ( = ?auto_1242658 ?auto_1242663 ) ) ( not ( = ?auto_1242661 ?auto_1242663 ) ) ( not ( = ?auto_1242659 ?auto_1242663 ) ) ( not ( = ?auto_1242662 ?auto_1242663 ) ) ( not ( = ?auto_1242660 ?auto_1242663 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1242658 ?auto_1242661 ?auto_1242659 ?auto_1242662 ?auto_1242663 ?auto_1242660 ?auto_1242657 )
      ( FLY-6PPL-VERIFY ?auto_1242658 ?auto_1242659 ?auto_1242660 ?auto_1242661 ?auto_1242662 ?auto_1242663 ?auto_1242657 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1288724 - PERSON
      ?auto_1288725 - PERSON
      ?auto_1288726 - PERSON
      ?auto_1288727 - PERSON
      ?auto_1288728 - PERSON
      ?auto_1288729 - PERSON
      ?auto_1288723 - CITY
    )
    :vars
    (
      ?auto_1288731 - FLEVEL
      ?auto_1288733 - FLEVEL
      ?auto_1288734 - CITY
      ?auto_1288735 - CITY
      ?auto_1288730 - CITY
      ?auto_1288732 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1288731 ?auto_1288733 ) ( PERSON-AT ?auto_1288729 ?auto_1288734 ) ( not ( = ?auto_1288723 ?auto_1288734 ) ) ( not ( = ?auto_1288731 ?auto_1288733 ) ) ( PERSON-AT ?auto_1288728 ?auto_1288735 ) ( not ( = ?auto_1288723 ?auto_1288735 ) ) ( PERSON-AT ?auto_1288727 ?auto_1288734 ) ( PERSON-AT ?auto_1288726 ?auto_1288735 ) ( PERSON-AT ?auto_1288724 ?auto_1288734 ) ( PERSON-AT ?auto_1288725 ?auto_1288730 ) ( AIRCRAFT-AT ?auto_1288732 ?auto_1288723 ) ( FUEL-LEVEL ?auto_1288732 ?auto_1288731 ) ( not ( = ?auto_1288723 ?auto_1288730 ) ) ( not ( = ?auto_1288725 ?auto_1288724 ) ) ( not ( = ?auto_1288734 ?auto_1288730 ) ) ( not ( = ?auto_1288725 ?auto_1288726 ) ) ( not ( = ?auto_1288724 ?auto_1288726 ) ) ( not ( = ?auto_1288735 ?auto_1288734 ) ) ( not ( = ?auto_1288735 ?auto_1288730 ) ) ( not ( = ?auto_1288725 ?auto_1288727 ) ) ( not ( = ?auto_1288724 ?auto_1288727 ) ) ( not ( = ?auto_1288726 ?auto_1288727 ) ) ( not ( = ?auto_1288725 ?auto_1288728 ) ) ( not ( = ?auto_1288724 ?auto_1288728 ) ) ( not ( = ?auto_1288726 ?auto_1288728 ) ) ( not ( = ?auto_1288727 ?auto_1288728 ) ) ( not ( = ?auto_1288725 ?auto_1288729 ) ) ( not ( = ?auto_1288724 ?auto_1288729 ) ) ( not ( = ?auto_1288726 ?auto_1288729 ) ) ( not ( = ?auto_1288727 ?auto_1288729 ) ) ( not ( = ?auto_1288728 ?auto_1288729 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1288725 ?auto_1288724 ?auto_1288726 ?auto_1288727 ?auto_1288729 ?auto_1288728 ?auto_1288723 )
      ( FLY-6PPL-VERIFY ?auto_1288724 ?auto_1288725 ?auto_1288726 ?auto_1288727 ?auto_1288728 ?auto_1288729 ?auto_1288723 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1288793 - PERSON
      ?auto_1288794 - PERSON
      ?auto_1288795 - PERSON
      ?auto_1288796 - PERSON
      ?auto_1288797 - PERSON
      ?auto_1288798 - PERSON
      ?auto_1288792 - CITY
    )
    :vars
    (
      ?auto_1288800 - FLEVEL
      ?auto_1288802 - FLEVEL
      ?auto_1288803 - CITY
      ?auto_1288804 - CITY
      ?auto_1288799 - CITY
      ?auto_1288801 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1288800 ?auto_1288802 ) ( PERSON-AT ?auto_1288797 ?auto_1288803 ) ( not ( = ?auto_1288792 ?auto_1288803 ) ) ( not ( = ?auto_1288800 ?auto_1288802 ) ) ( PERSON-AT ?auto_1288798 ?auto_1288804 ) ( not ( = ?auto_1288792 ?auto_1288804 ) ) ( PERSON-AT ?auto_1288796 ?auto_1288803 ) ( PERSON-AT ?auto_1288795 ?auto_1288804 ) ( PERSON-AT ?auto_1288793 ?auto_1288803 ) ( PERSON-AT ?auto_1288794 ?auto_1288799 ) ( AIRCRAFT-AT ?auto_1288801 ?auto_1288792 ) ( FUEL-LEVEL ?auto_1288801 ?auto_1288800 ) ( not ( = ?auto_1288792 ?auto_1288799 ) ) ( not ( = ?auto_1288794 ?auto_1288793 ) ) ( not ( = ?auto_1288803 ?auto_1288799 ) ) ( not ( = ?auto_1288794 ?auto_1288795 ) ) ( not ( = ?auto_1288793 ?auto_1288795 ) ) ( not ( = ?auto_1288804 ?auto_1288803 ) ) ( not ( = ?auto_1288804 ?auto_1288799 ) ) ( not ( = ?auto_1288794 ?auto_1288796 ) ) ( not ( = ?auto_1288793 ?auto_1288796 ) ) ( not ( = ?auto_1288795 ?auto_1288796 ) ) ( not ( = ?auto_1288794 ?auto_1288798 ) ) ( not ( = ?auto_1288793 ?auto_1288798 ) ) ( not ( = ?auto_1288795 ?auto_1288798 ) ) ( not ( = ?auto_1288796 ?auto_1288798 ) ) ( not ( = ?auto_1288794 ?auto_1288797 ) ) ( not ( = ?auto_1288793 ?auto_1288797 ) ) ( not ( = ?auto_1288795 ?auto_1288797 ) ) ( not ( = ?auto_1288796 ?auto_1288797 ) ) ( not ( = ?auto_1288798 ?auto_1288797 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1288794 ?auto_1288793 ?auto_1288795 ?auto_1288796 ?auto_1288797 ?auto_1288798 ?auto_1288792 )
      ( FLY-6PPL-VERIFY ?auto_1288793 ?auto_1288794 ?auto_1288795 ?auto_1288796 ?auto_1288797 ?auto_1288798 ?auto_1288792 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1288862 - PERSON
      ?auto_1288863 - PERSON
      ?auto_1288864 - PERSON
      ?auto_1288865 - PERSON
      ?auto_1288866 - PERSON
      ?auto_1288867 - PERSON
      ?auto_1288861 - CITY
    )
    :vars
    (
      ?auto_1288869 - FLEVEL
      ?auto_1288871 - FLEVEL
      ?auto_1288872 - CITY
      ?auto_1288873 - CITY
      ?auto_1288868 - CITY
      ?auto_1288870 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1288869 ?auto_1288871 ) ( PERSON-AT ?auto_1288867 ?auto_1288872 ) ( not ( = ?auto_1288861 ?auto_1288872 ) ) ( not ( = ?auto_1288869 ?auto_1288871 ) ) ( PERSON-AT ?auto_1288865 ?auto_1288873 ) ( not ( = ?auto_1288861 ?auto_1288873 ) ) ( PERSON-AT ?auto_1288866 ?auto_1288872 ) ( PERSON-AT ?auto_1288864 ?auto_1288873 ) ( PERSON-AT ?auto_1288862 ?auto_1288872 ) ( PERSON-AT ?auto_1288863 ?auto_1288868 ) ( AIRCRAFT-AT ?auto_1288870 ?auto_1288861 ) ( FUEL-LEVEL ?auto_1288870 ?auto_1288869 ) ( not ( = ?auto_1288861 ?auto_1288868 ) ) ( not ( = ?auto_1288863 ?auto_1288862 ) ) ( not ( = ?auto_1288872 ?auto_1288868 ) ) ( not ( = ?auto_1288863 ?auto_1288864 ) ) ( not ( = ?auto_1288862 ?auto_1288864 ) ) ( not ( = ?auto_1288873 ?auto_1288872 ) ) ( not ( = ?auto_1288873 ?auto_1288868 ) ) ( not ( = ?auto_1288863 ?auto_1288866 ) ) ( not ( = ?auto_1288862 ?auto_1288866 ) ) ( not ( = ?auto_1288864 ?auto_1288866 ) ) ( not ( = ?auto_1288863 ?auto_1288865 ) ) ( not ( = ?auto_1288862 ?auto_1288865 ) ) ( not ( = ?auto_1288864 ?auto_1288865 ) ) ( not ( = ?auto_1288866 ?auto_1288865 ) ) ( not ( = ?auto_1288863 ?auto_1288867 ) ) ( not ( = ?auto_1288862 ?auto_1288867 ) ) ( not ( = ?auto_1288864 ?auto_1288867 ) ) ( not ( = ?auto_1288866 ?auto_1288867 ) ) ( not ( = ?auto_1288865 ?auto_1288867 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1288863 ?auto_1288862 ?auto_1288864 ?auto_1288866 ?auto_1288867 ?auto_1288865 ?auto_1288861 )
      ( FLY-6PPL-VERIFY ?auto_1288862 ?auto_1288863 ?auto_1288864 ?auto_1288865 ?auto_1288866 ?auto_1288867 ?auto_1288861 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1289850 - PERSON
      ?auto_1289851 - PERSON
      ?auto_1289852 - PERSON
      ?auto_1289853 - PERSON
      ?auto_1289854 - PERSON
      ?auto_1289855 - PERSON
      ?auto_1289849 - CITY
    )
    :vars
    (
      ?auto_1289857 - FLEVEL
      ?auto_1289859 - FLEVEL
      ?auto_1289860 - CITY
      ?auto_1289861 - CITY
      ?auto_1289856 - CITY
      ?auto_1289858 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1289857 ?auto_1289859 ) ( PERSON-AT ?auto_1289855 ?auto_1289860 ) ( not ( = ?auto_1289849 ?auto_1289860 ) ) ( not ( = ?auto_1289857 ?auto_1289859 ) ) ( PERSON-AT ?auto_1289854 ?auto_1289861 ) ( not ( = ?auto_1289849 ?auto_1289861 ) ) ( PERSON-AT ?auto_1289852 ?auto_1289860 ) ( PERSON-AT ?auto_1289853 ?auto_1289861 ) ( PERSON-AT ?auto_1289850 ?auto_1289860 ) ( PERSON-AT ?auto_1289851 ?auto_1289856 ) ( AIRCRAFT-AT ?auto_1289858 ?auto_1289849 ) ( FUEL-LEVEL ?auto_1289858 ?auto_1289857 ) ( not ( = ?auto_1289849 ?auto_1289856 ) ) ( not ( = ?auto_1289851 ?auto_1289850 ) ) ( not ( = ?auto_1289860 ?auto_1289856 ) ) ( not ( = ?auto_1289851 ?auto_1289853 ) ) ( not ( = ?auto_1289850 ?auto_1289853 ) ) ( not ( = ?auto_1289861 ?auto_1289860 ) ) ( not ( = ?auto_1289861 ?auto_1289856 ) ) ( not ( = ?auto_1289851 ?auto_1289852 ) ) ( not ( = ?auto_1289850 ?auto_1289852 ) ) ( not ( = ?auto_1289853 ?auto_1289852 ) ) ( not ( = ?auto_1289851 ?auto_1289854 ) ) ( not ( = ?auto_1289850 ?auto_1289854 ) ) ( not ( = ?auto_1289853 ?auto_1289854 ) ) ( not ( = ?auto_1289852 ?auto_1289854 ) ) ( not ( = ?auto_1289851 ?auto_1289855 ) ) ( not ( = ?auto_1289850 ?auto_1289855 ) ) ( not ( = ?auto_1289853 ?auto_1289855 ) ) ( not ( = ?auto_1289852 ?auto_1289855 ) ) ( not ( = ?auto_1289854 ?auto_1289855 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1289851 ?auto_1289850 ?auto_1289853 ?auto_1289852 ?auto_1289855 ?auto_1289854 ?auto_1289849 )
      ( FLY-6PPL-VERIFY ?auto_1289850 ?auto_1289851 ?auto_1289852 ?auto_1289853 ?auto_1289854 ?auto_1289855 ?auto_1289849 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1289919 - PERSON
      ?auto_1289920 - PERSON
      ?auto_1289921 - PERSON
      ?auto_1289922 - PERSON
      ?auto_1289923 - PERSON
      ?auto_1289924 - PERSON
      ?auto_1289918 - CITY
    )
    :vars
    (
      ?auto_1289926 - FLEVEL
      ?auto_1289928 - FLEVEL
      ?auto_1289929 - CITY
      ?auto_1289930 - CITY
      ?auto_1289925 - CITY
      ?auto_1289927 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1289926 ?auto_1289928 ) ( PERSON-AT ?auto_1289923 ?auto_1289929 ) ( not ( = ?auto_1289918 ?auto_1289929 ) ) ( not ( = ?auto_1289926 ?auto_1289928 ) ) ( PERSON-AT ?auto_1289924 ?auto_1289930 ) ( not ( = ?auto_1289918 ?auto_1289930 ) ) ( PERSON-AT ?auto_1289921 ?auto_1289929 ) ( PERSON-AT ?auto_1289922 ?auto_1289930 ) ( PERSON-AT ?auto_1289919 ?auto_1289929 ) ( PERSON-AT ?auto_1289920 ?auto_1289925 ) ( AIRCRAFT-AT ?auto_1289927 ?auto_1289918 ) ( FUEL-LEVEL ?auto_1289927 ?auto_1289926 ) ( not ( = ?auto_1289918 ?auto_1289925 ) ) ( not ( = ?auto_1289920 ?auto_1289919 ) ) ( not ( = ?auto_1289929 ?auto_1289925 ) ) ( not ( = ?auto_1289920 ?auto_1289922 ) ) ( not ( = ?auto_1289919 ?auto_1289922 ) ) ( not ( = ?auto_1289930 ?auto_1289929 ) ) ( not ( = ?auto_1289930 ?auto_1289925 ) ) ( not ( = ?auto_1289920 ?auto_1289921 ) ) ( not ( = ?auto_1289919 ?auto_1289921 ) ) ( not ( = ?auto_1289922 ?auto_1289921 ) ) ( not ( = ?auto_1289920 ?auto_1289924 ) ) ( not ( = ?auto_1289919 ?auto_1289924 ) ) ( not ( = ?auto_1289922 ?auto_1289924 ) ) ( not ( = ?auto_1289921 ?auto_1289924 ) ) ( not ( = ?auto_1289920 ?auto_1289923 ) ) ( not ( = ?auto_1289919 ?auto_1289923 ) ) ( not ( = ?auto_1289922 ?auto_1289923 ) ) ( not ( = ?auto_1289921 ?auto_1289923 ) ) ( not ( = ?auto_1289924 ?auto_1289923 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1289920 ?auto_1289919 ?auto_1289922 ?auto_1289921 ?auto_1289923 ?auto_1289924 ?auto_1289918 )
      ( FLY-6PPL-VERIFY ?auto_1289919 ?auto_1289920 ?auto_1289921 ?auto_1289922 ?auto_1289923 ?auto_1289924 ?auto_1289918 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1290479 - PERSON
      ?auto_1290480 - PERSON
      ?auto_1290481 - PERSON
      ?auto_1290482 - PERSON
      ?auto_1290483 - PERSON
      ?auto_1290484 - PERSON
      ?auto_1290478 - CITY
    )
    :vars
    (
      ?auto_1290486 - FLEVEL
      ?auto_1290488 - FLEVEL
      ?auto_1290489 - CITY
      ?auto_1290490 - CITY
      ?auto_1290485 - CITY
      ?auto_1290487 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1290486 ?auto_1290488 ) ( PERSON-AT ?auto_1290482 ?auto_1290489 ) ( not ( = ?auto_1290478 ?auto_1290489 ) ) ( not ( = ?auto_1290486 ?auto_1290488 ) ) ( PERSON-AT ?auto_1290484 ?auto_1290490 ) ( not ( = ?auto_1290478 ?auto_1290490 ) ) ( PERSON-AT ?auto_1290481 ?auto_1290489 ) ( PERSON-AT ?auto_1290483 ?auto_1290490 ) ( PERSON-AT ?auto_1290479 ?auto_1290489 ) ( PERSON-AT ?auto_1290480 ?auto_1290485 ) ( AIRCRAFT-AT ?auto_1290487 ?auto_1290478 ) ( FUEL-LEVEL ?auto_1290487 ?auto_1290486 ) ( not ( = ?auto_1290478 ?auto_1290485 ) ) ( not ( = ?auto_1290480 ?auto_1290479 ) ) ( not ( = ?auto_1290489 ?auto_1290485 ) ) ( not ( = ?auto_1290480 ?auto_1290483 ) ) ( not ( = ?auto_1290479 ?auto_1290483 ) ) ( not ( = ?auto_1290490 ?auto_1290489 ) ) ( not ( = ?auto_1290490 ?auto_1290485 ) ) ( not ( = ?auto_1290480 ?auto_1290481 ) ) ( not ( = ?auto_1290479 ?auto_1290481 ) ) ( not ( = ?auto_1290483 ?auto_1290481 ) ) ( not ( = ?auto_1290480 ?auto_1290484 ) ) ( not ( = ?auto_1290479 ?auto_1290484 ) ) ( not ( = ?auto_1290483 ?auto_1290484 ) ) ( not ( = ?auto_1290481 ?auto_1290484 ) ) ( not ( = ?auto_1290480 ?auto_1290482 ) ) ( not ( = ?auto_1290479 ?auto_1290482 ) ) ( not ( = ?auto_1290483 ?auto_1290482 ) ) ( not ( = ?auto_1290481 ?auto_1290482 ) ) ( not ( = ?auto_1290484 ?auto_1290482 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1290480 ?auto_1290479 ?auto_1290483 ?auto_1290481 ?auto_1290482 ?auto_1290484 ?auto_1290478 )
      ( FLY-6PPL-VERIFY ?auto_1290479 ?auto_1290480 ?auto_1290481 ?auto_1290482 ?auto_1290483 ?auto_1290484 ?auto_1290478 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1305913 - PERSON
      ?auto_1305914 - PERSON
      ?auto_1305915 - PERSON
      ?auto_1305916 - PERSON
      ?auto_1305917 - PERSON
      ?auto_1305918 - PERSON
      ?auto_1305912 - CITY
    )
    :vars
    (
      ?auto_1305920 - FLEVEL
      ?auto_1305922 - FLEVEL
      ?auto_1305923 - CITY
      ?auto_1305924 - CITY
      ?auto_1305919 - CITY
      ?auto_1305921 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1305920 ?auto_1305922 ) ( PERSON-AT ?auto_1305918 ?auto_1305923 ) ( not ( = ?auto_1305912 ?auto_1305923 ) ) ( not ( = ?auto_1305920 ?auto_1305922 ) ) ( PERSON-AT ?auto_1305917 ?auto_1305924 ) ( not ( = ?auto_1305912 ?auto_1305924 ) ) ( PERSON-AT ?auto_1305916 ?auto_1305923 ) ( PERSON-AT ?auto_1305914 ?auto_1305924 ) ( PERSON-AT ?auto_1305913 ?auto_1305923 ) ( PERSON-AT ?auto_1305915 ?auto_1305919 ) ( AIRCRAFT-AT ?auto_1305921 ?auto_1305912 ) ( FUEL-LEVEL ?auto_1305921 ?auto_1305920 ) ( not ( = ?auto_1305912 ?auto_1305919 ) ) ( not ( = ?auto_1305915 ?auto_1305913 ) ) ( not ( = ?auto_1305923 ?auto_1305919 ) ) ( not ( = ?auto_1305915 ?auto_1305914 ) ) ( not ( = ?auto_1305913 ?auto_1305914 ) ) ( not ( = ?auto_1305924 ?auto_1305923 ) ) ( not ( = ?auto_1305924 ?auto_1305919 ) ) ( not ( = ?auto_1305915 ?auto_1305916 ) ) ( not ( = ?auto_1305913 ?auto_1305916 ) ) ( not ( = ?auto_1305914 ?auto_1305916 ) ) ( not ( = ?auto_1305915 ?auto_1305917 ) ) ( not ( = ?auto_1305913 ?auto_1305917 ) ) ( not ( = ?auto_1305914 ?auto_1305917 ) ) ( not ( = ?auto_1305916 ?auto_1305917 ) ) ( not ( = ?auto_1305915 ?auto_1305918 ) ) ( not ( = ?auto_1305913 ?auto_1305918 ) ) ( not ( = ?auto_1305914 ?auto_1305918 ) ) ( not ( = ?auto_1305916 ?auto_1305918 ) ) ( not ( = ?auto_1305917 ?auto_1305918 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1305915 ?auto_1305913 ?auto_1305914 ?auto_1305916 ?auto_1305918 ?auto_1305917 ?auto_1305912 )
      ( FLY-6PPL-VERIFY ?auto_1305913 ?auto_1305914 ?auto_1305915 ?auto_1305916 ?auto_1305917 ?auto_1305918 ?auto_1305912 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1305982 - PERSON
      ?auto_1305983 - PERSON
      ?auto_1305984 - PERSON
      ?auto_1305985 - PERSON
      ?auto_1305986 - PERSON
      ?auto_1305987 - PERSON
      ?auto_1305981 - CITY
    )
    :vars
    (
      ?auto_1305989 - FLEVEL
      ?auto_1305991 - FLEVEL
      ?auto_1305992 - CITY
      ?auto_1305993 - CITY
      ?auto_1305988 - CITY
      ?auto_1305990 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1305989 ?auto_1305991 ) ( PERSON-AT ?auto_1305986 ?auto_1305992 ) ( not ( = ?auto_1305981 ?auto_1305992 ) ) ( not ( = ?auto_1305989 ?auto_1305991 ) ) ( PERSON-AT ?auto_1305987 ?auto_1305993 ) ( not ( = ?auto_1305981 ?auto_1305993 ) ) ( PERSON-AT ?auto_1305985 ?auto_1305992 ) ( PERSON-AT ?auto_1305983 ?auto_1305993 ) ( PERSON-AT ?auto_1305982 ?auto_1305992 ) ( PERSON-AT ?auto_1305984 ?auto_1305988 ) ( AIRCRAFT-AT ?auto_1305990 ?auto_1305981 ) ( FUEL-LEVEL ?auto_1305990 ?auto_1305989 ) ( not ( = ?auto_1305981 ?auto_1305988 ) ) ( not ( = ?auto_1305984 ?auto_1305982 ) ) ( not ( = ?auto_1305992 ?auto_1305988 ) ) ( not ( = ?auto_1305984 ?auto_1305983 ) ) ( not ( = ?auto_1305982 ?auto_1305983 ) ) ( not ( = ?auto_1305993 ?auto_1305992 ) ) ( not ( = ?auto_1305993 ?auto_1305988 ) ) ( not ( = ?auto_1305984 ?auto_1305985 ) ) ( not ( = ?auto_1305982 ?auto_1305985 ) ) ( not ( = ?auto_1305983 ?auto_1305985 ) ) ( not ( = ?auto_1305984 ?auto_1305987 ) ) ( not ( = ?auto_1305982 ?auto_1305987 ) ) ( not ( = ?auto_1305983 ?auto_1305987 ) ) ( not ( = ?auto_1305985 ?auto_1305987 ) ) ( not ( = ?auto_1305984 ?auto_1305986 ) ) ( not ( = ?auto_1305982 ?auto_1305986 ) ) ( not ( = ?auto_1305983 ?auto_1305986 ) ) ( not ( = ?auto_1305985 ?auto_1305986 ) ) ( not ( = ?auto_1305987 ?auto_1305986 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1305984 ?auto_1305982 ?auto_1305983 ?auto_1305985 ?auto_1305986 ?auto_1305987 ?auto_1305981 )
      ( FLY-6PPL-VERIFY ?auto_1305982 ?auto_1305983 ?auto_1305984 ?auto_1305985 ?auto_1305986 ?auto_1305987 ?auto_1305981 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1306051 - PERSON
      ?auto_1306052 - PERSON
      ?auto_1306053 - PERSON
      ?auto_1306054 - PERSON
      ?auto_1306055 - PERSON
      ?auto_1306056 - PERSON
      ?auto_1306050 - CITY
    )
    :vars
    (
      ?auto_1306058 - FLEVEL
      ?auto_1306060 - FLEVEL
      ?auto_1306061 - CITY
      ?auto_1306062 - CITY
      ?auto_1306057 - CITY
      ?auto_1306059 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1306058 ?auto_1306060 ) ( PERSON-AT ?auto_1306056 ?auto_1306061 ) ( not ( = ?auto_1306050 ?auto_1306061 ) ) ( not ( = ?auto_1306058 ?auto_1306060 ) ) ( PERSON-AT ?auto_1306054 ?auto_1306062 ) ( not ( = ?auto_1306050 ?auto_1306062 ) ) ( PERSON-AT ?auto_1306055 ?auto_1306061 ) ( PERSON-AT ?auto_1306052 ?auto_1306062 ) ( PERSON-AT ?auto_1306051 ?auto_1306061 ) ( PERSON-AT ?auto_1306053 ?auto_1306057 ) ( AIRCRAFT-AT ?auto_1306059 ?auto_1306050 ) ( FUEL-LEVEL ?auto_1306059 ?auto_1306058 ) ( not ( = ?auto_1306050 ?auto_1306057 ) ) ( not ( = ?auto_1306053 ?auto_1306051 ) ) ( not ( = ?auto_1306061 ?auto_1306057 ) ) ( not ( = ?auto_1306053 ?auto_1306052 ) ) ( not ( = ?auto_1306051 ?auto_1306052 ) ) ( not ( = ?auto_1306062 ?auto_1306061 ) ) ( not ( = ?auto_1306062 ?auto_1306057 ) ) ( not ( = ?auto_1306053 ?auto_1306055 ) ) ( not ( = ?auto_1306051 ?auto_1306055 ) ) ( not ( = ?auto_1306052 ?auto_1306055 ) ) ( not ( = ?auto_1306053 ?auto_1306054 ) ) ( not ( = ?auto_1306051 ?auto_1306054 ) ) ( not ( = ?auto_1306052 ?auto_1306054 ) ) ( not ( = ?auto_1306055 ?auto_1306054 ) ) ( not ( = ?auto_1306053 ?auto_1306056 ) ) ( not ( = ?auto_1306051 ?auto_1306056 ) ) ( not ( = ?auto_1306052 ?auto_1306056 ) ) ( not ( = ?auto_1306055 ?auto_1306056 ) ) ( not ( = ?auto_1306054 ?auto_1306056 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1306053 ?auto_1306051 ?auto_1306052 ?auto_1306055 ?auto_1306056 ?auto_1306054 ?auto_1306050 )
      ( FLY-6PPL-VERIFY ?auto_1306051 ?auto_1306052 ?auto_1306053 ?auto_1306054 ?auto_1306055 ?auto_1306056 ?auto_1306050 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1309449 - PERSON
      ?auto_1309450 - PERSON
      ?auto_1309451 - PERSON
      ?auto_1309452 - PERSON
      ?auto_1309453 - PERSON
      ?auto_1309454 - PERSON
      ?auto_1309448 - CITY
    )
    :vars
    (
      ?auto_1309456 - FLEVEL
      ?auto_1309458 - FLEVEL
      ?auto_1309459 - CITY
      ?auto_1309460 - CITY
      ?auto_1309455 - CITY
      ?auto_1309457 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1309456 ?auto_1309458 ) ( PERSON-AT ?auto_1309454 ?auto_1309459 ) ( not ( = ?auto_1309448 ?auto_1309459 ) ) ( not ( = ?auto_1309456 ?auto_1309458 ) ) ( PERSON-AT ?auto_1309453 ?auto_1309460 ) ( not ( = ?auto_1309448 ?auto_1309460 ) ) ( PERSON-AT ?auto_1309451 ?auto_1309459 ) ( PERSON-AT ?auto_1309450 ?auto_1309460 ) ( PERSON-AT ?auto_1309449 ?auto_1309459 ) ( PERSON-AT ?auto_1309452 ?auto_1309455 ) ( AIRCRAFT-AT ?auto_1309457 ?auto_1309448 ) ( FUEL-LEVEL ?auto_1309457 ?auto_1309456 ) ( not ( = ?auto_1309448 ?auto_1309455 ) ) ( not ( = ?auto_1309452 ?auto_1309449 ) ) ( not ( = ?auto_1309459 ?auto_1309455 ) ) ( not ( = ?auto_1309452 ?auto_1309450 ) ) ( not ( = ?auto_1309449 ?auto_1309450 ) ) ( not ( = ?auto_1309460 ?auto_1309459 ) ) ( not ( = ?auto_1309460 ?auto_1309455 ) ) ( not ( = ?auto_1309452 ?auto_1309451 ) ) ( not ( = ?auto_1309449 ?auto_1309451 ) ) ( not ( = ?auto_1309450 ?auto_1309451 ) ) ( not ( = ?auto_1309452 ?auto_1309453 ) ) ( not ( = ?auto_1309449 ?auto_1309453 ) ) ( not ( = ?auto_1309450 ?auto_1309453 ) ) ( not ( = ?auto_1309451 ?auto_1309453 ) ) ( not ( = ?auto_1309452 ?auto_1309454 ) ) ( not ( = ?auto_1309449 ?auto_1309454 ) ) ( not ( = ?auto_1309450 ?auto_1309454 ) ) ( not ( = ?auto_1309451 ?auto_1309454 ) ) ( not ( = ?auto_1309453 ?auto_1309454 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1309452 ?auto_1309449 ?auto_1309450 ?auto_1309451 ?auto_1309454 ?auto_1309453 ?auto_1309448 )
      ( FLY-6PPL-VERIFY ?auto_1309449 ?auto_1309450 ?auto_1309451 ?auto_1309452 ?auto_1309453 ?auto_1309454 ?auto_1309448 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1309518 - PERSON
      ?auto_1309519 - PERSON
      ?auto_1309520 - PERSON
      ?auto_1309521 - PERSON
      ?auto_1309522 - PERSON
      ?auto_1309523 - PERSON
      ?auto_1309517 - CITY
    )
    :vars
    (
      ?auto_1309525 - FLEVEL
      ?auto_1309527 - FLEVEL
      ?auto_1309528 - CITY
      ?auto_1309529 - CITY
      ?auto_1309524 - CITY
      ?auto_1309526 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1309525 ?auto_1309527 ) ( PERSON-AT ?auto_1309522 ?auto_1309528 ) ( not ( = ?auto_1309517 ?auto_1309528 ) ) ( not ( = ?auto_1309525 ?auto_1309527 ) ) ( PERSON-AT ?auto_1309523 ?auto_1309529 ) ( not ( = ?auto_1309517 ?auto_1309529 ) ) ( PERSON-AT ?auto_1309520 ?auto_1309528 ) ( PERSON-AT ?auto_1309519 ?auto_1309529 ) ( PERSON-AT ?auto_1309518 ?auto_1309528 ) ( PERSON-AT ?auto_1309521 ?auto_1309524 ) ( AIRCRAFT-AT ?auto_1309526 ?auto_1309517 ) ( FUEL-LEVEL ?auto_1309526 ?auto_1309525 ) ( not ( = ?auto_1309517 ?auto_1309524 ) ) ( not ( = ?auto_1309521 ?auto_1309518 ) ) ( not ( = ?auto_1309528 ?auto_1309524 ) ) ( not ( = ?auto_1309521 ?auto_1309519 ) ) ( not ( = ?auto_1309518 ?auto_1309519 ) ) ( not ( = ?auto_1309529 ?auto_1309528 ) ) ( not ( = ?auto_1309529 ?auto_1309524 ) ) ( not ( = ?auto_1309521 ?auto_1309520 ) ) ( not ( = ?auto_1309518 ?auto_1309520 ) ) ( not ( = ?auto_1309519 ?auto_1309520 ) ) ( not ( = ?auto_1309521 ?auto_1309523 ) ) ( not ( = ?auto_1309518 ?auto_1309523 ) ) ( not ( = ?auto_1309519 ?auto_1309523 ) ) ( not ( = ?auto_1309520 ?auto_1309523 ) ) ( not ( = ?auto_1309521 ?auto_1309522 ) ) ( not ( = ?auto_1309518 ?auto_1309522 ) ) ( not ( = ?auto_1309519 ?auto_1309522 ) ) ( not ( = ?auto_1309520 ?auto_1309522 ) ) ( not ( = ?auto_1309523 ?auto_1309522 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1309521 ?auto_1309518 ?auto_1309519 ?auto_1309520 ?auto_1309522 ?auto_1309523 ?auto_1309517 )
      ( FLY-6PPL-VERIFY ?auto_1309518 ?auto_1309519 ?auto_1309520 ?auto_1309521 ?auto_1309522 ?auto_1309523 ?auto_1309517 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1310028 - PERSON
      ?auto_1310029 - PERSON
      ?auto_1310030 - PERSON
      ?auto_1310031 - PERSON
      ?auto_1310032 - PERSON
      ?auto_1310033 - PERSON
      ?auto_1310027 - CITY
    )
    :vars
    (
      ?auto_1310035 - FLEVEL
      ?auto_1310037 - FLEVEL
      ?auto_1310038 - CITY
      ?auto_1310039 - CITY
      ?auto_1310034 - CITY
      ?auto_1310036 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1310035 ?auto_1310037 ) ( PERSON-AT ?auto_1310033 ?auto_1310038 ) ( not ( = ?auto_1310027 ?auto_1310038 ) ) ( not ( = ?auto_1310035 ?auto_1310037 ) ) ( PERSON-AT ?auto_1310031 ?auto_1310039 ) ( not ( = ?auto_1310027 ?auto_1310039 ) ) ( PERSON-AT ?auto_1310030 ?auto_1310038 ) ( PERSON-AT ?auto_1310029 ?auto_1310039 ) ( PERSON-AT ?auto_1310028 ?auto_1310038 ) ( PERSON-AT ?auto_1310032 ?auto_1310034 ) ( AIRCRAFT-AT ?auto_1310036 ?auto_1310027 ) ( FUEL-LEVEL ?auto_1310036 ?auto_1310035 ) ( not ( = ?auto_1310027 ?auto_1310034 ) ) ( not ( = ?auto_1310032 ?auto_1310028 ) ) ( not ( = ?auto_1310038 ?auto_1310034 ) ) ( not ( = ?auto_1310032 ?auto_1310029 ) ) ( not ( = ?auto_1310028 ?auto_1310029 ) ) ( not ( = ?auto_1310039 ?auto_1310038 ) ) ( not ( = ?auto_1310039 ?auto_1310034 ) ) ( not ( = ?auto_1310032 ?auto_1310030 ) ) ( not ( = ?auto_1310028 ?auto_1310030 ) ) ( not ( = ?auto_1310029 ?auto_1310030 ) ) ( not ( = ?auto_1310032 ?auto_1310031 ) ) ( not ( = ?auto_1310028 ?auto_1310031 ) ) ( not ( = ?auto_1310029 ?auto_1310031 ) ) ( not ( = ?auto_1310030 ?auto_1310031 ) ) ( not ( = ?auto_1310032 ?auto_1310033 ) ) ( not ( = ?auto_1310028 ?auto_1310033 ) ) ( not ( = ?auto_1310029 ?auto_1310033 ) ) ( not ( = ?auto_1310030 ?auto_1310033 ) ) ( not ( = ?auto_1310031 ?auto_1310033 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1310032 ?auto_1310028 ?auto_1310029 ?auto_1310030 ?auto_1310033 ?auto_1310031 ?auto_1310027 )
      ( FLY-6PPL-VERIFY ?auto_1310028 ?auto_1310029 ?auto_1310030 ?auto_1310031 ?auto_1310032 ?auto_1310033 ?auto_1310027 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1310097 - PERSON
      ?auto_1310098 - PERSON
      ?auto_1310099 - PERSON
      ?auto_1310100 - PERSON
      ?auto_1310101 - PERSON
      ?auto_1310102 - PERSON
      ?auto_1310096 - CITY
    )
    :vars
    (
      ?auto_1310104 - FLEVEL
      ?auto_1310106 - FLEVEL
      ?auto_1310107 - CITY
      ?auto_1310108 - CITY
      ?auto_1310103 - CITY
      ?auto_1310105 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1310104 ?auto_1310106 ) ( PERSON-AT ?auto_1310101 ?auto_1310107 ) ( not ( = ?auto_1310096 ?auto_1310107 ) ) ( not ( = ?auto_1310104 ?auto_1310106 ) ) ( PERSON-AT ?auto_1310100 ?auto_1310108 ) ( not ( = ?auto_1310096 ?auto_1310108 ) ) ( PERSON-AT ?auto_1310099 ?auto_1310107 ) ( PERSON-AT ?auto_1310098 ?auto_1310108 ) ( PERSON-AT ?auto_1310097 ?auto_1310107 ) ( PERSON-AT ?auto_1310102 ?auto_1310103 ) ( AIRCRAFT-AT ?auto_1310105 ?auto_1310096 ) ( FUEL-LEVEL ?auto_1310105 ?auto_1310104 ) ( not ( = ?auto_1310096 ?auto_1310103 ) ) ( not ( = ?auto_1310102 ?auto_1310097 ) ) ( not ( = ?auto_1310107 ?auto_1310103 ) ) ( not ( = ?auto_1310102 ?auto_1310098 ) ) ( not ( = ?auto_1310097 ?auto_1310098 ) ) ( not ( = ?auto_1310108 ?auto_1310107 ) ) ( not ( = ?auto_1310108 ?auto_1310103 ) ) ( not ( = ?auto_1310102 ?auto_1310099 ) ) ( not ( = ?auto_1310097 ?auto_1310099 ) ) ( not ( = ?auto_1310098 ?auto_1310099 ) ) ( not ( = ?auto_1310102 ?auto_1310100 ) ) ( not ( = ?auto_1310097 ?auto_1310100 ) ) ( not ( = ?auto_1310098 ?auto_1310100 ) ) ( not ( = ?auto_1310099 ?auto_1310100 ) ) ( not ( = ?auto_1310102 ?auto_1310101 ) ) ( not ( = ?auto_1310097 ?auto_1310101 ) ) ( not ( = ?auto_1310098 ?auto_1310101 ) ) ( not ( = ?auto_1310099 ?auto_1310101 ) ) ( not ( = ?auto_1310100 ?auto_1310101 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1310102 ?auto_1310097 ?auto_1310098 ?auto_1310099 ?auto_1310101 ?auto_1310100 ?auto_1310096 )
      ( FLY-6PPL-VERIFY ?auto_1310097 ?auto_1310098 ?auto_1310099 ?auto_1310100 ?auto_1310101 ?auto_1310102 ?auto_1310096 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1310236 - PERSON
      ?auto_1310237 - PERSON
      ?auto_1310238 - PERSON
      ?auto_1310239 - PERSON
      ?auto_1310240 - PERSON
      ?auto_1310241 - PERSON
      ?auto_1310235 - CITY
    )
    :vars
    (
      ?auto_1310243 - FLEVEL
      ?auto_1310245 - FLEVEL
      ?auto_1310246 - CITY
      ?auto_1310247 - CITY
      ?auto_1310242 - CITY
      ?auto_1310244 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1310243 ?auto_1310245 ) ( PERSON-AT ?auto_1310239 ?auto_1310246 ) ( not ( = ?auto_1310235 ?auto_1310246 ) ) ( not ( = ?auto_1310243 ?auto_1310245 ) ) ( PERSON-AT ?auto_1310241 ?auto_1310247 ) ( not ( = ?auto_1310235 ?auto_1310247 ) ) ( PERSON-AT ?auto_1310238 ?auto_1310246 ) ( PERSON-AT ?auto_1310237 ?auto_1310247 ) ( PERSON-AT ?auto_1310236 ?auto_1310246 ) ( PERSON-AT ?auto_1310240 ?auto_1310242 ) ( AIRCRAFT-AT ?auto_1310244 ?auto_1310235 ) ( FUEL-LEVEL ?auto_1310244 ?auto_1310243 ) ( not ( = ?auto_1310235 ?auto_1310242 ) ) ( not ( = ?auto_1310240 ?auto_1310236 ) ) ( not ( = ?auto_1310246 ?auto_1310242 ) ) ( not ( = ?auto_1310240 ?auto_1310237 ) ) ( not ( = ?auto_1310236 ?auto_1310237 ) ) ( not ( = ?auto_1310247 ?auto_1310246 ) ) ( not ( = ?auto_1310247 ?auto_1310242 ) ) ( not ( = ?auto_1310240 ?auto_1310238 ) ) ( not ( = ?auto_1310236 ?auto_1310238 ) ) ( not ( = ?auto_1310237 ?auto_1310238 ) ) ( not ( = ?auto_1310240 ?auto_1310241 ) ) ( not ( = ?auto_1310236 ?auto_1310241 ) ) ( not ( = ?auto_1310237 ?auto_1310241 ) ) ( not ( = ?auto_1310238 ?auto_1310241 ) ) ( not ( = ?auto_1310240 ?auto_1310239 ) ) ( not ( = ?auto_1310236 ?auto_1310239 ) ) ( not ( = ?auto_1310237 ?auto_1310239 ) ) ( not ( = ?auto_1310238 ?auto_1310239 ) ) ( not ( = ?auto_1310241 ?auto_1310239 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1310240 ?auto_1310236 ?auto_1310237 ?auto_1310238 ?auto_1310239 ?auto_1310241 ?auto_1310235 )
      ( FLY-6PPL-VERIFY ?auto_1310236 ?auto_1310237 ?auto_1310238 ?auto_1310239 ?auto_1310240 ?auto_1310241 ?auto_1310235 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1310527 - PERSON
      ?auto_1310528 - PERSON
      ?auto_1310529 - PERSON
      ?auto_1310530 - PERSON
      ?auto_1310531 - PERSON
      ?auto_1310532 - PERSON
      ?auto_1310526 - CITY
    )
    :vars
    (
      ?auto_1310534 - FLEVEL
      ?auto_1310536 - FLEVEL
      ?auto_1310537 - CITY
      ?auto_1310538 - CITY
      ?auto_1310533 - CITY
      ?auto_1310535 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1310534 ?auto_1310536 ) ( PERSON-AT ?auto_1310530 ?auto_1310537 ) ( not ( = ?auto_1310526 ?auto_1310537 ) ) ( not ( = ?auto_1310534 ?auto_1310536 ) ) ( PERSON-AT ?auto_1310531 ?auto_1310538 ) ( not ( = ?auto_1310526 ?auto_1310538 ) ) ( PERSON-AT ?auto_1310529 ?auto_1310537 ) ( PERSON-AT ?auto_1310528 ?auto_1310538 ) ( PERSON-AT ?auto_1310527 ?auto_1310537 ) ( PERSON-AT ?auto_1310532 ?auto_1310533 ) ( AIRCRAFT-AT ?auto_1310535 ?auto_1310526 ) ( FUEL-LEVEL ?auto_1310535 ?auto_1310534 ) ( not ( = ?auto_1310526 ?auto_1310533 ) ) ( not ( = ?auto_1310532 ?auto_1310527 ) ) ( not ( = ?auto_1310537 ?auto_1310533 ) ) ( not ( = ?auto_1310532 ?auto_1310528 ) ) ( not ( = ?auto_1310527 ?auto_1310528 ) ) ( not ( = ?auto_1310538 ?auto_1310537 ) ) ( not ( = ?auto_1310538 ?auto_1310533 ) ) ( not ( = ?auto_1310532 ?auto_1310529 ) ) ( not ( = ?auto_1310527 ?auto_1310529 ) ) ( not ( = ?auto_1310528 ?auto_1310529 ) ) ( not ( = ?auto_1310532 ?auto_1310531 ) ) ( not ( = ?auto_1310527 ?auto_1310531 ) ) ( not ( = ?auto_1310528 ?auto_1310531 ) ) ( not ( = ?auto_1310529 ?auto_1310531 ) ) ( not ( = ?auto_1310532 ?auto_1310530 ) ) ( not ( = ?auto_1310527 ?auto_1310530 ) ) ( not ( = ?auto_1310528 ?auto_1310530 ) ) ( not ( = ?auto_1310529 ?auto_1310530 ) ) ( not ( = ?auto_1310531 ?auto_1310530 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1310532 ?auto_1310527 ?auto_1310528 ?auto_1310529 ?auto_1310530 ?auto_1310531 ?auto_1310526 )
      ( FLY-6PPL-VERIFY ?auto_1310527 ?auto_1310528 ?auto_1310529 ?auto_1310530 ?auto_1310531 ?auto_1310532 ?auto_1310526 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1310740 - PERSON
      ?auto_1310741 - PERSON
      ?auto_1310742 - PERSON
      ?auto_1310743 - PERSON
      ?auto_1310744 - PERSON
      ?auto_1310745 - PERSON
      ?auto_1310739 - CITY
    )
    :vars
    (
      ?auto_1310747 - FLEVEL
      ?auto_1310749 - FLEVEL
      ?auto_1310750 - CITY
      ?auto_1310751 - CITY
      ?auto_1310746 - CITY
      ?auto_1310748 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1310747 ?auto_1310749 ) ( PERSON-AT ?auto_1310745 ?auto_1310750 ) ( not ( = ?auto_1310739 ?auto_1310750 ) ) ( not ( = ?auto_1310747 ?auto_1310749 ) ) ( PERSON-AT ?auto_1310742 ?auto_1310751 ) ( not ( = ?auto_1310739 ?auto_1310751 ) ) ( PERSON-AT ?auto_1310744 ?auto_1310750 ) ( PERSON-AT ?auto_1310741 ?auto_1310751 ) ( PERSON-AT ?auto_1310740 ?auto_1310750 ) ( PERSON-AT ?auto_1310743 ?auto_1310746 ) ( AIRCRAFT-AT ?auto_1310748 ?auto_1310739 ) ( FUEL-LEVEL ?auto_1310748 ?auto_1310747 ) ( not ( = ?auto_1310739 ?auto_1310746 ) ) ( not ( = ?auto_1310743 ?auto_1310740 ) ) ( not ( = ?auto_1310750 ?auto_1310746 ) ) ( not ( = ?auto_1310743 ?auto_1310741 ) ) ( not ( = ?auto_1310740 ?auto_1310741 ) ) ( not ( = ?auto_1310751 ?auto_1310750 ) ) ( not ( = ?auto_1310751 ?auto_1310746 ) ) ( not ( = ?auto_1310743 ?auto_1310744 ) ) ( not ( = ?auto_1310740 ?auto_1310744 ) ) ( not ( = ?auto_1310741 ?auto_1310744 ) ) ( not ( = ?auto_1310743 ?auto_1310742 ) ) ( not ( = ?auto_1310740 ?auto_1310742 ) ) ( not ( = ?auto_1310741 ?auto_1310742 ) ) ( not ( = ?auto_1310744 ?auto_1310742 ) ) ( not ( = ?auto_1310743 ?auto_1310745 ) ) ( not ( = ?auto_1310740 ?auto_1310745 ) ) ( not ( = ?auto_1310741 ?auto_1310745 ) ) ( not ( = ?auto_1310744 ?auto_1310745 ) ) ( not ( = ?auto_1310742 ?auto_1310745 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1310743 ?auto_1310740 ?auto_1310741 ?auto_1310744 ?auto_1310745 ?auto_1310742 ?auto_1310739 )
      ( FLY-6PPL-VERIFY ?auto_1310740 ?auto_1310741 ?auto_1310742 ?auto_1310743 ?auto_1310744 ?auto_1310745 ?auto_1310739 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1311166 - PERSON
      ?auto_1311167 - PERSON
      ?auto_1311168 - PERSON
      ?auto_1311169 - PERSON
      ?auto_1311170 - PERSON
      ?auto_1311171 - PERSON
      ?auto_1311165 - CITY
    )
    :vars
    (
      ?auto_1311173 - FLEVEL
      ?auto_1311175 - FLEVEL
      ?auto_1311176 - CITY
      ?auto_1311177 - CITY
      ?auto_1311172 - CITY
      ?auto_1311174 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1311173 ?auto_1311175 ) ( PERSON-AT ?auto_1311171 ?auto_1311176 ) ( not ( = ?auto_1311165 ?auto_1311176 ) ) ( not ( = ?auto_1311173 ?auto_1311175 ) ) ( PERSON-AT ?auto_1311168 ?auto_1311177 ) ( not ( = ?auto_1311165 ?auto_1311177 ) ) ( PERSON-AT ?auto_1311169 ?auto_1311176 ) ( PERSON-AT ?auto_1311167 ?auto_1311177 ) ( PERSON-AT ?auto_1311166 ?auto_1311176 ) ( PERSON-AT ?auto_1311170 ?auto_1311172 ) ( AIRCRAFT-AT ?auto_1311174 ?auto_1311165 ) ( FUEL-LEVEL ?auto_1311174 ?auto_1311173 ) ( not ( = ?auto_1311165 ?auto_1311172 ) ) ( not ( = ?auto_1311170 ?auto_1311166 ) ) ( not ( = ?auto_1311176 ?auto_1311172 ) ) ( not ( = ?auto_1311170 ?auto_1311167 ) ) ( not ( = ?auto_1311166 ?auto_1311167 ) ) ( not ( = ?auto_1311177 ?auto_1311176 ) ) ( not ( = ?auto_1311177 ?auto_1311172 ) ) ( not ( = ?auto_1311170 ?auto_1311169 ) ) ( not ( = ?auto_1311166 ?auto_1311169 ) ) ( not ( = ?auto_1311167 ?auto_1311169 ) ) ( not ( = ?auto_1311170 ?auto_1311168 ) ) ( not ( = ?auto_1311166 ?auto_1311168 ) ) ( not ( = ?auto_1311167 ?auto_1311168 ) ) ( not ( = ?auto_1311169 ?auto_1311168 ) ) ( not ( = ?auto_1311170 ?auto_1311171 ) ) ( not ( = ?auto_1311166 ?auto_1311171 ) ) ( not ( = ?auto_1311167 ?auto_1311171 ) ) ( not ( = ?auto_1311169 ?auto_1311171 ) ) ( not ( = ?auto_1311168 ?auto_1311171 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1311170 ?auto_1311166 ?auto_1311167 ?auto_1311169 ?auto_1311171 ?auto_1311168 ?auto_1311165 )
      ( FLY-6PPL-VERIFY ?auto_1311166 ?auto_1311167 ?auto_1311168 ?auto_1311169 ?auto_1311170 ?auto_1311171 ?auto_1311165 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1311235 - PERSON
      ?auto_1311236 - PERSON
      ?auto_1311237 - PERSON
      ?auto_1311238 - PERSON
      ?auto_1311239 - PERSON
      ?auto_1311240 - PERSON
      ?auto_1311234 - CITY
    )
    :vars
    (
      ?auto_1311242 - FLEVEL
      ?auto_1311244 - FLEVEL
      ?auto_1311245 - CITY
      ?auto_1311246 - CITY
      ?auto_1311241 - CITY
      ?auto_1311243 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1311242 ?auto_1311244 ) ( PERSON-AT ?auto_1311239 ?auto_1311245 ) ( not ( = ?auto_1311234 ?auto_1311245 ) ) ( not ( = ?auto_1311242 ?auto_1311244 ) ) ( PERSON-AT ?auto_1311237 ?auto_1311246 ) ( not ( = ?auto_1311234 ?auto_1311246 ) ) ( PERSON-AT ?auto_1311238 ?auto_1311245 ) ( PERSON-AT ?auto_1311236 ?auto_1311246 ) ( PERSON-AT ?auto_1311235 ?auto_1311245 ) ( PERSON-AT ?auto_1311240 ?auto_1311241 ) ( AIRCRAFT-AT ?auto_1311243 ?auto_1311234 ) ( FUEL-LEVEL ?auto_1311243 ?auto_1311242 ) ( not ( = ?auto_1311234 ?auto_1311241 ) ) ( not ( = ?auto_1311240 ?auto_1311235 ) ) ( not ( = ?auto_1311245 ?auto_1311241 ) ) ( not ( = ?auto_1311240 ?auto_1311236 ) ) ( not ( = ?auto_1311235 ?auto_1311236 ) ) ( not ( = ?auto_1311246 ?auto_1311245 ) ) ( not ( = ?auto_1311246 ?auto_1311241 ) ) ( not ( = ?auto_1311240 ?auto_1311238 ) ) ( not ( = ?auto_1311235 ?auto_1311238 ) ) ( not ( = ?auto_1311236 ?auto_1311238 ) ) ( not ( = ?auto_1311240 ?auto_1311237 ) ) ( not ( = ?auto_1311235 ?auto_1311237 ) ) ( not ( = ?auto_1311236 ?auto_1311237 ) ) ( not ( = ?auto_1311238 ?auto_1311237 ) ) ( not ( = ?auto_1311240 ?auto_1311239 ) ) ( not ( = ?auto_1311235 ?auto_1311239 ) ) ( not ( = ?auto_1311236 ?auto_1311239 ) ) ( not ( = ?auto_1311238 ?auto_1311239 ) ) ( not ( = ?auto_1311237 ?auto_1311239 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1311240 ?auto_1311235 ?auto_1311236 ?auto_1311238 ?auto_1311239 ?auto_1311237 ?auto_1311234 )
      ( FLY-6PPL-VERIFY ?auto_1311235 ?auto_1311236 ?auto_1311237 ?auto_1311238 ?auto_1311239 ?auto_1311240 ?auto_1311234 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1315510 - PERSON
      ?auto_1315511 - PERSON
      ?auto_1315512 - PERSON
      ?auto_1315513 - PERSON
      ?auto_1315514 - PERSON
      ?auto_1315515 - PERSON
      ?auto_1315509 - CITY
    )
    :vars
    (
      ?auto_1315517 - FLEVEL
      ?auto_1315519 - FLEVEL
      ?auto_1315520 - CITY
      ?auto_1315521 - CITY
      ?auto_1315516 - CITY
      ?auto_1315518 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1315517 ?auto_1315519 ) ( PERSON-AT ?auto_1315515 ?auto_1315520 ) ( not ( = ?auto_1315509 ?auto_1315520 ) ) ( not ( = ?auto_1315517 ?auto_1315519 ) ) ( PERSON-AT ?auto_1315514 ?auto_1315521 ) ( not ( = ?auto_1315509 ?auto_1315521 ) ) ( PERSON-AT ?auto_1315511 ?auto_1315520 ) ( PERSON-AT ?auto_1315513 ?auto_1315521 ) ( PERSON-AT ?auto_1315510 ?auto_1315520 ) ( PERSON-AT ?auto_1315512 ?auto_1315516 ) ( AIRCRAFT-AT ?auto_1315518 ?auto_1315509 ) ( FUEL-LEVEL ?auto_1315518 ?auto_1315517 ) ( not ( = ?auto_1315509 ?auto_1315516 ) ) ( not ( = ?auto_1315512 ?auto_1315510 ) ) ( not ( = ?auto_1315520 ?auto_1315516 ) ) ( not ( = ?auto_1315512 ?auto_1315513 ) ) ( not ( = ?auto_1315510 ?auto_1315513 ) ) ( not ( = ?auto_1315521 ?auto_1315520 ) ) ( not ( = ?auto_1315521 ?auto_1315516 ) ) ( not ( = ?auto_1315512 ?auto_1315511 ) ) ( not ( = ?auto_1315510 ?auto_1315511 ) ) ( not ( = ?auto_1315513 ?auto_1315511 ) ) ( not ( = ?auto_1315512 ?auto_1315514 ) ) ( not ( = ?auto_1315510 ?auto_1315514 ) ) ( not ( = ?auto_1315513 ?auto_1315514 ) ) ( not ( = ?auto_1315511 ?auto_1315514 ) ) ( not ( = ?auto_1315512 ?auto_1315515 ) ) ( not ( = ?auto_1315510 ?auto_1315515 ) ) ( not ( = ?auto_1315513 ?auto_1315515 ) ) ( not ( = ?auto_1315511 ?auto_1315515 ) ) ( not ( = ?auto_1315514 ?auto_1315515 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1315512 ?auto_1315510 ?auto_1315513 ?auto_1315511 ?auto_1315515 ?auto_1315514 ?auto_1315509 )
      ( FLY-6PPL-VERIFY ?auto_1315510 ?auto_1315511 ?auto_1315512 ?auto_1315513 ?auto_1315514 ?auto_1315515 ?auto_1315509 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1315579 - PERSON
      ?auto_1315580 - PERSON
      ?auto_1315581 - PERSON
      ?auto_1315582 - PERSON
      ?auto_1315583 - PERSON
      ?auto_1315584 - PERSON
      ?auto_1315578 - CITY
    )
    :vars
    (
      ?auto_1315586 - FLEVEL
      ?auto_1315588 - FLEVEL
      ?auto_1315589 - CITY
      ?auto_1315590 - CITY
      ?auto_1315585 - CITY
      ?auto_1315587 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1315586 ?auto_1315588 ) ( PERSON-AT ?auto_1315583 ?auto_1315589 ) ( not ( = ?auto_1315578 ?auto_1315589 ) ) ( not ( = ?auto_1315586 ?auto_1315588 ) ) ( PERSON-AT ?auto_1315584 ?auto_1315590 ) ( not ( = ?auto_1315578 ?auto_1315590 ) ) ( PERSON-AT ?auto_1315580 ?auto_1315589 ) ( PERSON-AT ?auto_1315582 ?auto_1315590 ) ( PERSON-AT ?auto_1315579 ?auto_1315589 ) ( PERSON-AT ?auto_1315581 ?auto_1315585 ) ( AIRCRAFT-AT ?auto_1315587 ?auto_1315578 ) ( FUEL-LEVEL ?auto_1315587 ?auto_1315586 ) ( not ( = ?auto_1315578 ?auto_1315585 ) ) ( not ( = ?auto_1315581 ?auto_1315579 ) ) ( not ( = ?auto_1315589 ?auto_1315585 ) ) ( not ( = ?auto_1315581 ?auto_1315582 ) ) ( not ( = ?auto_1315579 ?auto_1315582 ) ) ( not ( = ?auto_1315590 ?auto_1315589 ) ) ( not ( = ?auto_1315590 ?auto_1315585 ) ) ( not ( = ?auto_1315581 ?auto_1315580 ) ) ( not ( = ?auto_1315579 ?auto_1315580 ) ) ( not ( = ?auto_1315582 ?auto_1315580 ) ) ( not ( = ?auto_1315581 ?auto_1315584 ) ) ( not ( = ?auto_1315579 ?auto_1315584 ) ) ( not ( = ?auto_1315582 ?auto_1315584 ) ) ( not ( = ?auto_1315580 ?auto_1315584 ) ) ( not ( = ?auto_1315581 ?auto_1315583 ) ) ( not ( = ?auto_1315579 ?auto_1315583 ) ) ( not ( = ?auto_1315582 ?auto_1315583 ) ) ( not ( = ?auto_1315580 ?auto_1315583 ) ) ( not ( = ?auto_1315584 ?auto_1315583 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1315581 ?auto_1315579 ?auto_1315582 ?auto_1315580 ?auto_1315583 ?auto_1315584 ?auto_1315578 )
      ( FLY-6PPL-VERIFY ?auto_1315579 ?auto_1315580 ?auto_1315581 ?auto_1315582 ?auto_1315583 ?auto_1315584 ?auto_1315578 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1316139 - PERSON
      ?auto_1316140 - PERSON
      ?auto_1316141 - PERSON
      ?auto_1316142 - PERSON
      ?auto_1316143 - PERSON
      ?auto_1316144 - PERSON
      ?auto_1316138 - CITY
    )
    :vars
    (
      ?auto_1316146 - FLEVEL
      ?auto_1316148 - FLEVEL
      ?auto_1316149 - CITY
      ?auto_1316150 - CITY
      ?auto_1316145 - CITY
      ?auto_1316147 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1316146 ?auto_1316148 ) ( PERSON-AT ?auto_1316142 ?auto_1316149 ) ( not ( = ?auto_1316138 ?auto_1316149 ) ) ( not ( = ?auto_1316146 ?auto_1316148 ) ) ( PERSON-AT ?auto_1316144 ?auto_1316150 ) ( not ( = ?auto_1316138 ?auto_1316150 ) ) ( PERSON-AT ?auto_1316140 ?auto_1316149 ) ( PERSON-AT ?auto_1316143 ?auto_1316150 ) ( PERSON-AT ?auto_1316139 ?auto_1316149 ) ( PERSON-AT ?auto_1316141 ?auto_1316145 ) ( AIRCRAFT-AT ?auto_1316147 ?auto_1316138 ) ( FUEL-LEVEL ?auto_1316147 ?auto_1316146 ) ( not ( = ?auto_1316138 ?auto_1316145 ) ) ( not ( = ?auto_1316141 ?auto_1316139 ) ) ( not ( = ?auto_1316149 ?auto_1316145 ) ) ( not ( = ?auto_1316141 ?auto_1316143 ) ) ( not ( = ?auto_1316139 ?auto_1316143 ) ) ( not ( = ?auto_1316150 ?auto_1316149 ) ) ( not ( = ?auto_1316150 ?auto_1316145 ) ) ( not ( = ?auto_1316141 ?auto_1316140 ) ) ( not ( = ?auto_1316139 ?auto_1316140 ) ) ( not ( = ?auto_1316143 ?auto_1316140 ) ) ( not ( = ?auto_1316141 ?auto_1316144 ) ) ( not ( = ?auto_1316139 ?auto_1316144 ) ) ( not ( = ?auto_1316143 ?auto_1316144 ) ) ( not ( = ?auto_1316140 ?auto_1316144 ) ) ( not ( = ?auto_1316141 ?auto_1316142 ) ) ( not ( = ?auto_1316139 ?auto_1316142 ) ) ( not ( = ?auto_1316143 ?auto_1316142 ) ) ( not ( = ?auto_1316140 ?auto_1316142 ) ) ( not ( = ?auto_1316144 ?auto_1316142 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1316141 ?auto_1316139 ?auto_1316143 ?auto_1316140 ?auto_1316142 ?auto_1316144 ?auto_1316138 )
      ( FLY-6PPL-VERIFY ?auto_1316139 ?auto_1316140 ?auto_1316141 ?auto_1316142 ?auto_1316143 ?auto_1316144 ?auto_1316138 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1317841 - PERSON
      ?auto_1317842 - PERSON
      ?auto_1317843 - PERSON
      ?auto_1317844 - PERSON
      ?auto_1317845 - PERSON
      ?auto_1317846 - PERSON
      ?auto_1317840 - CITY
    )
    :vars
    (
      ?auto_1317848 - FLEVEL
      ?auto_1317850 - FLEVEL
      ?auto_1317851 - CITY
      ?auto_1317852 - CITY
      ?auto_1317847 - CITY
      ?auto_1317849 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1317848 ?auto_1317850 ) ( PERSON-AT ?auto_1317846 ?auto_1317851 ) ( not ( = ?auto_1317840 ?auto_1317851 ) ) ( not ( = ?auto_1317848 ?auto_1317850 ) ) ( PERSON-AT ?auto_1317845 ?auto_1317852 ) ( not ( = ?auto_1317840 ?auto_1317852 ) ) ( PERSON-AT ?auto_1317842 ?auto_1317851 ) ( PERSON-AT ?auto_1317843 ?auto_1317852 ) ( PERSON-AT ?auto_1317841 ?auto_1317851 ) ( PERSON-AT ?auto_1317844 ?auto_1317847 ) ( AIRCRAFT-AT ?auto_1317849 ?auto_1317840 ) ( FUEL-LEVEL ?auto_1317849 ?auto_1317848 ) ( not ( = ?auto_1317840 ?auto_1317847 ) ) ( not ( = ?auto_1317844 ?auto_1317841 ) ) ( not ( = ?auto_1317851 ?auto_1317847 ) ) ( not ( = ?auto_1317844 ?auto_1317843 ) ) ( not ( = ?auto_1317841 ?auto_1317843 ) ) ( not ( = ?auto_1317852 ?auto_1317851 ) ) ( not ( = ?auto_1317852 ?auto_1317847 ) ) ( not ( = ?auto_1317844 ?auto_1317842 ) ) ( not ( = ?auto_1317841 ?auto_1317842 ) ) ( not ( = ?auto_1317843 ?auto_1317842 ) ) ( not ( = ?auto_1317844 ?auto_1317845 ) ) ( not ( = ?auto_1317841 ?auto_1317845 ) ) ( not ( = ?auto_1317843 ?auto_1317845 ) ) ( not ( = ?auto_1317842 ?auto_1317845 ) ) ( not ( = ?auto_1317844 ?auto_1317846 ) ) ( not ( = ?auto_1317841 ?auto_1317846 ) ) ( not ( = ?auto_1317843 ?auto_1317846 ) ) ( not ( = ?auto_1317842 ?auto_1317846 ) ) ( not ( = ?auto_1317845 ?auto_1317846 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1317844 ?auto_1317841 ?auto_1317843 ?auto_1317842 ?auto_1317846 ?auto_1317845 ?auto_1317840 )
      ( FLY-6PPL-VERIFY ?auto_1317841 ?auto_1317842 ?auto_1317843 ?auto_1317844 ?auto_1317845 ?auto_1317846 ?auto_1317840 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1317910 - PERSON
      ?auto_1317911 - PERSON
      ?auto_1317912 - PERSON
      ?auto_1317913 - PERSON
      ?auto_1317914 - PERSON
      ?auto_1317915 - PERSON
      ?auto_1317909 - CITY
    )
    :vars
    (
      ?auto_1317917 - FLEVEL
      ?auto_1317919 - FLEVEL
      ?auto_1317920 - CITY
      ?auto_1317921 - CITY
      ?auto_1317916 - CITY
      ?auto_1317918 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1317917 ?auto_1317919 ) ( PERSON-AT ?auto_1317914 ?auto_1317920 ) ( not ( = ?auto_1317909 ?auto_1317920 ) ) ( not ( = ?auto_1317917 ?auto_1317919 ) ) ( PERSON-AT ?auto_1317915 ?auto_1317921 ) ( not ( = ?auto_1317909 ?auto_1317921 ) ) ( PERSON-AT ?auto_1317911 ?auto_1317920 ) ( PERSON-AT ?auto_1317912 ?auto_1317921 ) ( PERSON-AT ?auto_1317910 ?auto_1317920 ) ( PERSON-AT ?auto_1317913 ?auto_1317916 ) ( AIRCRAFT-AT ?auto_1317918 ?auto_1317909 ) ( FUEL-LEVEL ?auto_1317918 ?auto_1317917 ) ( not ( = ?auto_1317909 ?auto_1317916 ) ) ( not ( = ?auto_1317913 ?auto_1317910 ) ) ( not ( = ?auto_1317920 ?auto_1317916 ) ) ( not ( = ?auto_1317913 ?auto_1317912 ) ) ( not ( = ?auto_1317910 ?auto_1317912 ) ) ( not ( = ?auto_1317921 ?auto_1317920 ) ) ( not ( = ?auto_1317921 ?auto_1317916 ) ) ( not ( = ?auto_1317913 ?auto_1317911 ) ) ( not ( = ?auto_1317910 ?auto_1317911 ) ) ( not ( = ?auto_1317912 ?auto_1317911 ) ) ( not ( = ?auto_1317913 ?auto_1317915 ) ) ( not ( = ?auto_1317910 ?auto_1317915 ) ) ( not ( = ?auto_1317912 ?auto_1317915 ) ) ( not ( = ?auto_1317911 ?auto_1317915 ) ) ( not ( = ?auto_1317913 ?auto_1317914 ) ) ( not ( = ?auto_1317910 ?auto_1317914 ) ) ( not ( = ?auto_1317912 ?auto_1317914 ) ) ( not ( = ?auto_1317911 ?auto_1317914 ) ) ( not ( = ?auto_1317915 ?auto_1317914 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1317913 ?auto_1317910 ?auto_1317912 ?auto_1317911 ?auto_1317914 ?auto_1317915 ?auto_1317909 )
      ( FLY-6PPL-VERIFY ?auto_1317910 ?auto_1317911 ?auto_1317912 ?auto_1317913 ?auto_1317914 ?auto_1317915 ?auto_1317909 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1318420 - PERSON
      ?auto_1318421 - PERSON
      ?auto_1318422 - PERSON
      ?auto_1318423 - PERSON
      ?auto_1318424 - PERSON
      ?auto_1318425 - PERSON
      ?auto_1318419 - CITY
    )
    :vars
    (
      ?auto_1318427 - FLEVEL
      ?auto_1318429 - FLEVEL
      ?auto_1318430 - CITY
      ?auto_1318431 - CITY
      ?auto_1318426 - CITY
      ?auto_1318428 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1318427 ?auto_1318429 ) ( PERSON-AT ?auto_1318425 ?auto_1318430 ) ( not ( = ?auto_1318419 ?auto_1318430 ) ) ( not ( = ?auto_1318427 ?auto_1318429 ) ) ( PERSON-AT ?auto_1318423 ?auto_1318431 ) ( not ( = ?auto_1318419 ?auto_1318431 ) ) ( PERSON-AT ?auto_1318421 ?auto_1318430 ) ( PERSON-AT ?auto_1318422 ?auto_1318431 ) ( PERSON-AT ?auto_1318420 ?auto_1318430 ) ( PERSON-AT ?auto_1318424 ?auto_1318426 ) ( AIRCRAFT-AT ?auto_1318428 ?auto_1318419 ) ( FUEL-LEVEL ?auto_1318428 ?auto_1318427 ) ( not ( = ?auto_1318419 ?auto_1318426 ) ) ( not ( = ?auto_1318424 ?auto_1318420 ) ) ( not ( = ?auto_1318430 ?auto_1318426 ) ) ( not ( = ?auto_1318424 ?auto_1318422 ) ) ( not ( = ?auto_1318420 ?auto_1318422 ) ) ( not ( = ?auto_1318431 ?auto_1318430 ) ) ( not ( = ?auto_1318431 ?auto_1318426 ) ) ( not ( = ?auto_1318424 ?auto_1318421 ) ) ( not ( = ?auto_1318420 ?auto_1318421 ) ) ( not ( = ?auto_1318422 ?auto_1318421 ) ) ( not ( = ?auto_1318424 ?auto_1318423 ) ) ( not ( = ?auto_1318420 ?auto_1318423 ) ) ( not ( = ?auto_1318422 ?auto_1318423 ) ) ( not ( = ?auto_1318421 ?auto_1318423 ) ) ( not ( = ?auto_1318424 ?auto_1318425 ) ) ( not ( = ?auto_1318420 ?auto_1318425 ) ) ( not ( = ?auto_1318422 ?auto_1318425 ) ) ( not ( = ?auto_1318421 ?auto_1318425 ) ) ( not ( = ?auto_1318423 ?auto_1318425 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1318424 ?auto_1318420 ?auto_1318422 ?auto_1318421 ?auto_1318425 ?auto_1318423 ?auto_1318419 )
      ( FLY-6PPL-VERIFY ?auto_1318420 ?auto_1318421 ?auto_1318422 ?auto_1318423 ?auto_1318424 ?auto_1318425 ?auto_1318419 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1318489 - PERSON
      ?auto_1318490 - PERSON
      ?auto_1318491 - PERSON
      ?auto_1318492 - PERSON
      ?auto_1318493 - PERSON
      ?auto_1318494 - PERSON
      ?auto_1318488 - CITY
    )
    :vars
    (
      ?auto_1318496 - FLEVEL
      ?auto_1318498 - FLEVEL
      ?auto_1318499 - CITY
      ?auto_1318500 - CITY
      ?auto_1318495 - CITY
      ?auto_1318497 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1318496 ?auto_1318498 ) ( PERSON-AT ?auto_1318493 ?auto_1318499 ) ( not ( = ?auto_1318488 ?auto_1318499 ) ) ( not ( = ?auto_1318496 ?auto_1318498 ) ) ( PERSON-AT ?auto_1318492 ?auto_1318500 ) ( not ( = ?auto_1318488 ?auto_1318500 ) ) ( PERSON-AT ?auto_1318490 ?auto_1318499 ) ( PERSON-AT ?auto_1318491 ?auto_1318500 ) ( PERSON-AT ?auto_1318489 ?auto_1318499 ) ( PERSON-AT ?auto_1318494 ?auto_1318495 ) ( AIRCRAFT-AT ?auto_1318497 ?auto_1318488 ) ( FUEL-LEVEL ?auto_1318497 ?auto_1318496 ) ( not ( = ?auto_1318488 ?auto_1318495 ) ) ( not ( = ?auto_1318494 ?auto_1318489 ) ) ( not ( = ?auto_1318499 ?auto_1318495 ) ) ( not ( = ?auto_1318494 ?auto_1318491 ) ) ( not ( = ?auto_1318489 ?auto_1318491 ) ) ( not ( = ?auto_1318500 ?auto_1318499 ) ) ( not ( = ?auto_1318500 ?auto_1318495 ) ) ( not ( = ?auto_1318494 ?auto_1318490 ) ) ( not ( = ?auto_1318489 ?auto_1318490 ) ) ( not ( = ?auto_1318491 ?auto_1318490 ) ) ( not ( = ?auto_1318494 ?auto_1318492 ) ) ( not ( = ?auto_1318489 ?auto_1318492 ) ) ( not ( = ?auto_1318491 ?auto_1318492 ) ) ( not ( = ?auto_1318490 ?auto_1318492 ) ) ( not ( = ?auto_1318494 ?auto_1318493 ) ) ( not ( = ?auto_1318489 ?auto_1318493 ) ) ( not ( = ?auto_1318491 ?auto_1318493 ) ) ( not ( = ?auto_1318490 ?auto_1318493 ) ) ( not ( = ?auto_1318492 ?auto_1318493 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1318494 ?auto_1318489 ?auto_1318491 ?auto_1318490 ?auto_1318493 ?auto_1318492 ?auto_1318488 )
      ( FLY-6PPL-VERIFY ?auto_1318489 ?auto_1318490 ?auto_1318491 ?auto_1318492 ?auto_1318493 ?auto_1318494 ?auto_1318488 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1318628 - PERSON
      ?auto_1318629 - PERSON
      ?auto_1318630 - PERSON
      ?auto_1318631 - PERSON
      ?auto_1318632 - PERSON
      ?auto_1318633 - PERSON
      ?auto_1318627 - CITY
    )
    :vars
    (
      ?auto_1318635 - FLEVEL
      ?auto_1318637 - FLEVEL
      ?auto_1318638 - CITY
      ?auto_1318639 - CITY
      ?auto_1318634 - CITY
      ?auto_1318636 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1318635 ?auto_1318637 ) ( PERSON-AT ?auto_1318631 ?auto_1318638 ) ( not ( = ?auto_1318627 ?auto_1318638 ) ) ( not ( = ?auto_1318635 ?auto_1318637 ) ) ( PERSON-AT ?auto_1318633 ?auto_1318639 ) ( not ( = ?auto_1318627 ?auto_1318639 ) ) ( PERSON-AT ?auto_1318629 ?auto_1318638 ) ( PERSON-AT ?auto_1318630 ?auto_1318639 ) ( PERSON-AT ?auto_1318628 ?auto_1318638 ) ( PERSON-AT ?auto_1318632 ?auto_1318634 ) ( AIRCRAFT-AT ?auto_1318636 ?auto_1318627 ) ( FUEL-LEVEL ?auto_1318636 ?auto_1318635 ) ( not ( = ?auto_1318627 ?auto_1318634 ) ) ( not ( = ?auto_1318632 ?auto_1318628 ) ) ( not ( = ?auto_1318638 ?auto_1318634 ) ) ( not ( = ?auto_1318632 ?auto_1318630 ) ) ( not ( = ?auto_1318628 ?auto_1318630 ) ) ( not ( = ?auto_1318639 ?auto_1318638 ) ) ( not ( = ?auto_1318639 ?auto_1318634 ) ) ( not ( = ?auto_1318632 ?auto_1318629 ) ) ( not ( = ?auto_1318628 ?auto_1318629 ) ) ( not ( = ?auto_1318630 ?auto_1318629 ) ) ( not ( = ?auto_1318632 ?auto_1318633 ) ) ( not ( = ?auto_1318628 ?auto_1318633 ) ) ( not ( = ?auto_1318630 ?auto_1318633 ) ) ( not ( = ?auto_1318629 ?auto_1318633 ) ) ( not ( = ?auto_1318632 ?auto_1318631 ) ) ( not ( = ?auto_1318628 ?auto_1318631 ) ) ( not ( = ?auto_1318630 ?auto_1318631 ) ) ( not ( = ?auto_1318629 ?auto_1318631 ) ) ( not ( = ?auto_1318633 ?auto_1318631 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1318632 ?auto_1318628 ?auto_1318630 ?auto_1318629 ?auto_1318631 ?auto_1318633 ?auto_1318627 )
      ( FLY-6PPL-VERIFY ?auto_1318628 ?auto_1318629 ?auto_1318630 ?auto_1318631 ?auto_1318632 ?auto_1318633 ?auto_1318627 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1318919 - PERSON
      ?auto_1318920 - PERSON
      ?auto_1318921 - PERSON
      ?auto_1318922 - PERSON
      ?auto_1318923 - PERSON
      ?auto_1318924 - PERSON
      ?auto_1318918 - CITY
    )
    :vars
    (
      ?auto_1318926 - FLEVEL
      ?auto_1318928 - FLEVEL
      ?auto_1318929 - CITY
      ?auto_1318930 - CITY
      ?auto_1318925 - CITY
      ?auto_1318927 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1318926 ?auto_1318928 ) ( PERSON-AT ?auto_1318922 ?auto_1318929 ) ( not ( = ?auto_1318918 ?auto_1318929 ) ) ( not ( = ?auto_1318926 ?auto_1318928 ) ) ( PERSON-AT ?auto_1318923 ?auto_1318930 ) ( not ( = ?auto_1318918 ?auto_1318930 ) ) ( PERSON-AT ?auto_1318920 ?auto_1318929 ) ( PERSON-AT ?auto_1318921 ?auto_1318930 ) ( PERSON-AT ?auto_1318919 ?auto_1318929 ) ( PERSON-AT ?auto_1318924 ?auto_1318925 ) ( AIRCRAFT-AT ?auto_1318927 ?auto_1318918 ) ( FUEL-LEVEL ?auto_1318927 ?auto_1318926 ) ( not ( = ?auto_1318918 ?auto_1318925 ) ) ( not ( = ?auto_1318924 ?auto_1318919 ) ) ( not ( = ?auto_1318929 ?auto_1318925 ) ) ( not ( = ?auto_1318924 ?auto_1318921 ) ) ( not ( = ?auto_1318919 ?auto_1318921 ) ) ( not ( = ?auto_1318930 ?auto_1318929 ) ) ( not ( = ?auto_1318930 ?auto_1318925 ) ) ( not ( = ?auto_1318924 ?auto_1318920 ) ) ( not ( = ?auto_1318919 ?auto_1318920 ) ) ( not ( = ?auto_1318921 ?auto_1318920 ) ) ( not ( = ?auto_1318924 ?auto_1318923 ) ) ( not ( = ?auto_1318919 ?auto_1318923 ) ) ( not ( = ?auto_1318921 ?auto_1318923 ) ) ( not ( = ?auto_1318920 ?auto_1318923 ) ) ( not ( = ?auto_1318924 ?auto_1318922 ) ) ( not ( = ?auto_1318919 ?auto_1318922 ) ) ( not ( = ?auto_1318921 ?auto_1318922 ) ) ( not ( = ?auto_1318920 ?auto_1318922 ) ) ( not ( = ?auto_1318923 ?auto_1318922 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1318924 ?auto_1318919 ?auto_1318921 ?auto_1318920 ?auto_1318922 ?auto_1318923 ?auto_1318918 )
      ( FLY-6PPL-VERIFY ?auto_1318919 ?auto_1318920 ?auto_1318921 ?auto_1318922 ?auto_1318923 ?auto_1318924 ?auto_1318918 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1321957 - PERSON
      ?auto_1321958 - PERSON
      ?auto_1321959 - PERSON
      ?auto_1321960 - PERSON
      ?auto_1321961 - PERSON
      ?auto_1321962 - PERSON
      ?auto_1321956 - CITY
    )
    :vars
    (
      ?auto_1321964 - FLEVEL
      ?auto_1321966 - FLEVEL
      ?auto_1321967 - CITY
      ?auto_1321968 - CITY
      ?auto_1321963 - CITY
      ?auto_1321965 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1321964 ?auto_1321966 ) ( PERSON-AT ?auto_1321959 ?auto_1321967 ) ( not ( = ?auto_1321956 ?auto_1321967 ) ) ( not ( = ?auto_1321964 ?auto_1321966 ) ) ( PERSON-AT ?auto_1321962 ?auto_1321968 ) ( not ( = ?auto_1321956 ?auto_1321968 ) ) ( PERSON-AT ?auto_1321958 ?auto_1321967 ) ( PERSON-AT ?auto_1321961 ?auto_1321968 ) ( PERSON-AT ?auto_1321957 ?auto_1321967 ) ( PERSON-AT ?auto_1321960 ?auto_1321963 ) ( AIRCRAFT-AT ?auto_1321965 ?auto_1321956 ) ( FUEL-LEVEL ?auto_1321965 ?auto_1321964 ) ( not ( = ?auto_1321956 ?auto_1321963 ) ) ( not ( = ?auto_1321960 ?auto_1321957 ) ) ( not ( = ?auto_1321967 ?auto_1321963 ) ) ( not ( = ?auto_1321960 ?auto_1321961 ) ) ( not ( = ?auto_1321957 ?auto_1321961 ) ) ( not ( = ?auto_1321968 ?auto_1321967 ) ) ( not ( = ?auto_1321968 ?auto_1321963 ) ) ( not ( = ?auto_1321960 ?auto_1321958 ) ) ( not ( = ?auto_1321957 ?auto_1321958 ) ) ( not ( = ?auto_1321961 ?auto_1321958 ) ) ( not ( = ?auto_1321960 ?auto_1321962 ) ) ( not ( = ?auto_1321957 ?auto_1321962 ) ) ( not ( = ?auto_1321961 ?auto_1321962 ) ) ( not ( = ?auto_1321958 ?auto_1321962 ) ) ( not ( = ?auto_1321960 ?auto_1321959 ) ) ( not ( = ?auto_1321957 ?auto_1321959 ) ) ( not ( = ?auto_1321961 ?auto_1321959 ) ) ( not ( = ?auto_1321958 ?auto_1321959 ) ) ( not ( = ?auto_1321962 ?auto_1321959 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1321960 ?auto_1321957 ?auto_1321961 ?auto_1321958 ?auto_1321959 ?auto_1321962 ?auto_1321956 )
      ( FLY-6PPL-VERIFY ?auto_1321957 ?auto_1321958 ?auto_1321959 ?auto_1321960 ?auto_1321961 ?auto_1321962 ?auto_1321956 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1322836 - PERSON
      ?auto_1322837 - PERSON
      ?auto_1322838 - PERSON
      ?auto_1322839 - PERSON
      ?auto_1322840 - PERSON
      ?auto_1322841 - PERSON
      ?auto_1322835 - CITY
    )
    :vars
    (
      ?auto_1322843 - FLEVEL
      ?auto_1322845 - FLEVEL
      ?auto_1322846 - CITY
      ?auto_1322847 - CITY
      ?auto_1322842 - CITY
      ?auto_1322844 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1322843 ?auto_1322845 ) ( PERSON-AT ?auto_1322838 ?auto_1322846 ) ( not ( = ?auto_1322835 ?auto_1322846 ) ) ( not ( = ?auto_1322843 ?auto_1322845 ) ) ( PERSON-AT ?auto_1322841 ?auto_1322847 ) ( not ( = ?auto_1322835 ?auto_1322847 ) ) ( PERSON-AT ?auto_1322837 ?auto_1322846 ) ( PERSON-AT ?auto_1322839 ?auto_1322847 ) ( PERSON-AT ?auto_1322836 ?auto_1322846 ) ( PERSON-AT ?auto_1322840 ?auto_1322842 ) ( AIRCRAFT-AT ?auto_1322844 ?auto_1322835 ) ( FUEL-LEVEL ?auto_1322844 ?auto_1322843 ) ( not ( = ?auto_1322835 ?auto_1322842 ) ) ( not ( = ?auto_1322840 ?auto_1322836 ) ) ( not ( = ?auto_1322846 ?auto_1322842 ) ) ( not ( = ?auto_1322840 ?auto_1322839 ) ) ( not ( = ?auto_1322836 ?auto_1322839 ) ) ( not ( = ?auto_1322847 ?auto_1322846 ) ) ( not ( = ?auto_1322847 ?auto_1322842 ) ) ( not ( = ?auto_1322840 ?auto_1322837 ) ) ( not ( = ?auto_1322836 ?auto_1322837 ) ) ( not ( = ?auto_1322839 ?auto_1322837 ) ) ( not ( = ?auto_1322840 ?auto_1322841 ) ) ( not ( = ?auto_1322836 ?auto_1322841 ) ) ( not ( = ?auto_1322839 ?auto_1322841 ) ) ( not ( = ?auto_1322837 ?auto_1322841 ) ) ( not ( = ?auto_1322840 ?auto_1322838 ) ) ( not ( = ?auto_1322836 ?auto_1322838 ) ) ( not ( = ?auto_1322839 ?auto_1322838 ) ) ( not ( = ?auto_1322837 ?auto_1322838 ) ) ( not ( = ?auto_1322841 ?auto_1322838 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1322840 ?auto_1322836 ?auto_1322839 ?auto_1322837 ?auto_1322838 ?auto_1322841 ?auto_1322835 )
      ( FLY-6PPL-VERIFY ?auto_1322836 ?auto_1322837 ?auto_1322838 ?auto_1322839 ?auto_1322840 ?auto_1322841 ?auto_1322835 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1323127 - PERSON
      ?auto_1323128 - PERSON
      ?auto_1323129 - PERSON
      ?auto_1323130 - PERSON
      ?auto_1323131 - PERSON
      ?auto_1323132 - PERSON
      ?auto_1323126 - CITY
    )
    :vars
    (
      ?auto_1323134 - FLEVEL
      ?auto_1323136 - FLEVEL
      ?auto_1323137 - CITY
      ?auto_1323138 - CITY
      ?auto_1323133 - CITY
      ?auto_1323135 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1323134 ?auto_1323136 ) ( PERSON-AT ?auto_1323129 ?auto_1323137 ) ( not ( = ?auto_1323126 ?auto_1323137 ) ) ( not ( = ?auto_1323134 ?auto_1323136 ) ) ( PERSON-AT ?auto_1323131 ?auto_1323138 ) ( not ( = ?auto_1323126 ?auto_1323138 ) ) ( PERSON-AT ?auto_1323128 ?auto_1323137 ) ( PERSON-AT ?auto_1323130 ?auto_1323138 ) ( PERSON-AT ?auto_1323127 ?auto_1323137 ) ( PERSON-AT ?auto_1323132 ?auto_1323133 ) ( AIRCRAFT-AT ?auto_1323135 ?auto_1323126 ) ( FUEL-LEVEL ?auto_1323135 ?auto_1323134 ) ( not ( = ?auto_1323126 ?auto_1323133 ) ) ( not ( = ?auto_1323132 ?auto_1323127 ) ) ( not ( = ?auto_1323137 ?auto_1323133 ) ) ( not ( = ?auto_1323132 ?auto_1323130 ) ) ( not ( = ?auto_1323127 ?auto_1323130 ) ) ( not ( = ?auto_1323138 ?auto_1323137 ) ) ( not ( = ?auto_1323138 ?auto_1323133 ) ) ( not ( = ?auto_1323132 ?auto_1323128 ) ) ( not ( = ?auto_1323127 ?auto_1323128 ) ) ( not ( = ?auto_1323130 ?auto_1323128 ) ) ( not ( = ?auto_1323132 ?auto_1323131 ) ) ( not ( = ?auto_1323127 ?auto_1323131 ) ) ( not ( = ?auto_1323130 ?auto_1323131 ) ) ( not ( = ?auto_1323128 ?auto_1323131 ) ) ( not ( = ?auto_1323132 ?auto_1323129 ) ) ( not ( = ?auto_1323127 ?auto_1323129 ) ) ( not ( = ?auto_1323130 ?auto_1323129 ) ) ( not ( = ?auto_1323128 ?auto_1323129 ) ) ( not ( = ?auto_1323131 ?auto_1323129 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1323132 ?auto_1323127 ?auto_1323130 ?auto_1323128 ?auto_1323129 ?auto_1323131 ?auto_1323126 )
      ( FLY-6PPL-VERIFY ?auto_1323127 ?auto_1323128 ?auto_1323129 ?auto_1323130 ?auto_1323131 ?auto_1323132 ?auto_1323126 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1355685 - PERSON
      ?auto_1355686 - PERSON
      ?auto_1355687 - PERSON
      ?auto_1355688 - PERSON
      ?auto_1355689 - PERSON
      ?auto_1355690 - PERSON
      ?auto_1355684 - CITY
    )
    :vars
    (
      ?auto_1355692 - FLEVEL
      ?auto_1355694 - FLEVEL
      ?auto_1355695 - CITY
      ?auto_1355696 - CITY
      ?auto_1355691 - CITY
      ?auto_1355693 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1355692 ?auto_1355694 ) ( PERSON-AT ?auto_1355690 ?auto_1355695 ) ( not ( = ?auto_1355684 ?auto_1355695 ) ) ( not ( = ?auto_1355692 ?auto_1355694 ) ) ( PERSON-AT ?auto_1355689 ?auto_1355696 ) ( not ( = ?auto_1355684 ?auto_1355696 ) ) ( PERSON-AT ?auto_1355688 ?auto_1355695 ) ( PERSON-AT ?auto_1355685 ?auto_1355696 ) ( PERSON-AT ?auto_1355687 ?auto_1355695 ) ( PERSON-AT ?auto_1355686 ?auto_1355691 ) ( AIRCRAFT-AT ?auto_1355693 ?auto_1355684 ) ( FUEL-LEVEL ?auto_1355693 ?auto_1355692 ) ( not ( = ?auto_1355684 ?auto_1355691 ) ) ( not ( = ?auto_1355686 ?auto_1355687 ) ) ( not ( = ?auto_1355695 ?auto_1355691 ) ) ( not ( = ?auto_1355686 ?auto_1355685 ) ) ( not ( = ?auto_1355687 ?auto_1355685 ) ) ( not ( = ?auto_1355696 ?auto_1355695 ) ) ( not ( = ?auto_1355696 ?auto_1355691 ) ) ( not ( = ?auto_1355686 ?auto_1355688 ) ) ( not ( = ?auto_1355687 ?auto_1355688 ) ) ( not ( = ?auto_1355685 ?auto_1355688 ) ) ( not ( = ?auto_1355686 ?auto_1355689 ) ) ( not ( = ?auto_1355687 ?auto_1355689 ) ) ( not ( = ?auto_1355685 ?auto_1355689 ) ) ( not ( = ?auto_1355688 ?auto_1355689 ) ) ( not ( = ?auto_1355686 ?auto_1355690 ) ) ( not ( = ?auto_1355687 ?auto_1355690 ) ) ( not ( = ?auto_1355685 ?auto_1355690 ) ) ( not ( = ?auto_1355688 ?auto_1355690 ) ) ( not ( = ?auto_1355689 ?auto_1355690 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1355686 ?auto_1355687 ?auto_1355685 ?auto_1355688 ?auto_1355690 ?auto_1355689 ?auto_1355684 )
      ( FLY-6PPL-VERIFY ?auto_1355685 ?auto_1355686 ?auto_1355687 ?auto_1355688 ?auto_1355689 ?auto_1355690 ?auto_1355684 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1355754 - PERSON
      ?auto_1355755 - PERSON
      ?auto_1355756 - PERSON
      ?auto_1355757 - PERSON
      ?auto_1355758 - PERSON
      ?auto_1355759 - PERSON
      ?auto_1355753 - CITY
    )
    :vars
    (
      ?auto_1355761 - FLEVEL
      ?auto_1355763 - FLEVEL
      ?auto_1355764 - CITY
      ?auto_1355765 - CITY
      ?auto_1355760 - CITY
      ?auto_1355762 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1355761 ?auto_1355763 ) ( PERSON-AT ?auto_1355758 ?auto_1355764 ) ( not ( = ?auto_1355753 ?auto_1355764 ) ) ( not ( = ?auto_1355761 ?auto_1355763 ) ) ( PERSON-AT ?auto_1355759 ?auto_1355765 ) ( not ( = ?auto_1355753 ?auto_1355765 ) ) ( PERSON-AT ?auto_1355757 ?auto_1355764 ) ( PERSON-AT ?auto_1355754 ?auto_1355765 ) ( PERSON-AT ?auto_1355756 ?auto_1355764 ) ( PERSON-AT ?auto_1355755 ?auto_1355760 ) ( AIRCRAFT-AT ?auto_1355762 ?auto_1355753 ) ( FUEL-LEVEL ?auto_1355762 ?auto_1355761 ) ( not ( = ?auto_1355753 ?auto_1355760 ) ) ( not ( = ?auto_1355755 ?auto_1355756 ) ) ( not ( = ?auto_1355764 ?auto_1355760 ) ) ( not ( = ?auto_1355755 ?auto_1355754 ) ) ( not ( = ?auto_1355756 ?auto_1355754 ) ) ( not ( = ?auto_1355765 ?auto_1355764 ) ) ( not ( = ?auto_1355765 ?auto_1355760 ) ) ( not ( = ?auto_1355755 ?auto_1355757 ) ) ( not ( = ?auto_1355756 ?auto_1355757 ) ) ( not ( = ?auto_1355754 ?auto_1355757 ) ) ( not ( = ?auto_1355755 ?auto_1355759 ) ) ( not ( = ?auto_1355756 ?auto_1355759 ) ) ( not ( = ?auto_1355754 ?auto_1355759 ) ) ( not ( = ?auto_1355757 ?auto_1355759 ) ) ( not ( = ?auto_1355755 ?auto_1355758 ) ) ( not ( = ?auto_1355756 ?auto_1355758 ) ) ( not ( = ?auto_1355754 ?auto_1355758 ) ) ( not ( = ?auto_1355757 ?auto_1355758 ) ) ( not ( = ?auto_1355759 ?auto_1355758 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1355755 ?auto_1355756 ?auto_1355754 ?auto_1355757 ?auto_1355758 ?auto_1355759 ?auto_1355753 )
      ( FLY-6PPL-VERIFY ?auto_1355754 ?auto_1355755 ?auto_1355756 ?auto_1355757 ?auto_1355758 ?auto_1355759 ?auto_1355753 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1355823 - PERSON
      ?auto_1355824 - PERSON
      ?auto_1355825 - PERSON
      ?auto_1355826 - PERSON
      ?auto_1355827 - PERSON
      ?auto_1355828 - PERSON
      ?auto_1355822 - CITY
    )
    :vars
    (
      ?auto_1355830 - FLEVEL
      ?auto_1355832 - FLEVEL
      ?auto_1355833 - CITY
      ?auto_1355834 - CITY
      ?auto_1355829 - CITY
      ?auto_1355831 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1355830 ?auto_1355832 ) ( PERSON-AT ?auto_1355828 ?auto_1355833 ) ( not ( = ?auto_1355822 ?auto_1355833 ) ) ( not ( = ?auto_1355830 ?auto_1355832 ) ) ( PERSON-AT ?auto_1355826 ?auto_1355834 ) ( not ( = ?auto_1355822 ?auto_1355834 ) ) ( PERSON-AT ?auto_1355827 ?auto_1355833 ) ( PERSON-AT ?auto_1355823 ?auto_1355834 ) ( PERSON-AT ?auto_1355825 ?auto_1355833 ) ( PERSON-AT ?auto_1355824 ?auto_1355829 ) ( AIRCRAFT-AT ?auto_1355831 ?auto_1355822 ) ( FUEL-LEVEL ?auto_1355831 ?auto_1355830 ) ( not ( = ?auto_1355822 ?auto_1355829 ) ) ( not ( = ?auto_1355824 ?auto_1355825 ) ) ( not ( = ?auto_1355833 ?auto_1355829 ) ) ( not ( = ?auto_1355824 ?auto_1355823 ) ) ( not ( = ?auto_1355825 ?auto_1355823 ) ) ( not ( = ?auto_1355834 ?auto_1355833 ) ) ( not ( = ?auto_1355834 ?auto_1355829 ) ) ( not ( = ?auto_1355824 ?auto_1355827 ) ) ( not ( = ?auto_1355825 ?auto_1355827 ) ) ( not ( = ?auto_1355823 ?auto_1355827 ) ) ( not ( = ?auto_1355824 ?auto_1355826 ) ) ( not ( = ?auto_1355825 ?auto_1355826 ) ) ( not ( = ?auto_1355823 ?auto_1355826 ) ) ( not ( = ?auto_1355827 ?auto_1355826 ) ) ( not ( = ?auto_1355824 ?auto_1355828 ) ) ( not ( = ?auto_1355825 ?auto_1355828 ) ) ( not ( = ?auto_1355823 ?auto_1355828 ) ) ( not ( = ?auto_1355827 ?auto_1355828 ) ) ( not ( = ?auto_1355826 ?auto_1355828 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1355824 ?auto_1355825 ?auto_1355823 ?auto_1355827 ?auto_1355828 ?auto_1355826 ?auto_1355822 )
      ( FLY-6PPL-VERIFY ?auto_1355823 ?auto_1355824 ?auto_1355825 ?auto_1355826 ?auto_1355827 ?auto_1355828 ?auto_1355822 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1359271 - PERSON
      ?auto_1359272 - PERSON
      ?auto_1359273 - PERSON
      ?auto_1359274 - PERSON
      ?auto_1359275 - PERSON
      ?auto_1359276 - PERSON
      ?auto_1359270 - CITY
    )
    :vars
    (
      ?auto_1359278 - FLEVEL
      ?auto_1359280 - FLEVEL
      ?auto_1359281 - CITY
      ?auto_1359282 - CITY
      ?auto_1359277 - CITY
      ?auto_1359279 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1359278 ?auto_1359280 ) ( PERSON-AT ?auto_1359276 ?auto_1359281 ) ( not ( = ?auto_1359270 ?auto_1359281 ) ) ( not ( = ?auto_1359278 ?auto_1359280 ) ) ( PERSON-AT ?auto_1359273 ?auto_1359282 ) ( not ( = ?auto_1359270 ?auto_1359282 ) ) ( PERSON-AT ?auto_1359275 ?auto_1359281 ) ( PERSON-AT ?auto_1359271 ?auto_1359282 ) ( PERSON-AT ?auto_1359274 ?auto_1359281 ) ( PERSON-AT ?auto_1359272 ?auto_1359277 ) ( AIRCRAFT-AT ?auto_1359279 ?auto_1359270 ) ( FUEL-LEVEL ?auto_1359279 ?auto_1359278 ) ( not ( = ?auto_1359270 ?auto_1359277 ) ) ( not ( = ?auto_1359272 ?auto_1359274 ) ) ( not ( = ?auto_1359281 ?auto_1359277 ) ) ( not ( = ?auto_1359272 ?auto_1359271 ) ) ( not ( = ?auto_1359274 ?auto_1359271 ) ) ( not ( = ?auto_1359282 ?auto_1359281 ) ) ( not ( = ?auto_1359282 ?auto_1359277 ) ) ( not ( = ?auto_1359272 ?auto_1359275 ) ) ( not ( = ?auto_1359274 ?auto_1359275 ) ) ( not ( = ?auto_1359271 ?auto_1359275 ) ) ( not ( = ?auto_1359272 ?auto_1359273 ) ) ( not ( = ?auto_1359274 ?auto_1359273 ) ) ( not ( = ?auto_1359271 ?auto_1359273 ) ) ( not ( = ?auto_1359275 ?auto_1359273 ) ) ( not ( = ?auto_1359272 ?auto_1359276 ) ) ( not ( = ?auto_1359274 ?auto_1359276 ) ) ( not ( = ?auto_1359271 ?auto_1359276 ) ) ( not ( = ?auto_1359275 ?auto_1359276 ) ) ( not ( = ?auto_1359273 ?auto_1359276 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1359272 ?auto_1359274 ?auto_1359271 ?auto_1359275 ?auto_1359276 ?auto_1359273 ?auto_1359270 )
      ( FLY-6PPL-VERIFY ?auto_1359271 ?auto_1359272 ?auto_1359273 ?auto_1359274 ?auto_1359275 ?auto_1359276 ?auto_1359270 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1364029 - PERSON
      ?auto_1364030 - PERSON
      ?auto_1364031 - PERSON
      ?auto_1364032 - PERSON
      ?auto_1364033 - PERSON
      ?auto_1364034 - PERSON
      ?auto_1364028 - CITY
    )
    :vars
    (
      ?auto_1364036 - FLEVEL
      ?auto_1364038 - FLEVEL
      ?auto_1364039 - CITY
      ?auto_1364040 - CITY
      ?auto_1364035 - CITY
      ?auto_1364037 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1364036 ?auto_1364038 ) ( PERSON-AT ?auto_1364034 ?auto_1364039 ) ( not ( = ?auto_1364028 ?auto_1364039 ) ) ( not ( = ?auto_1364036 ?auto_1364038 ) ) ( PERSON-AT ?auto_1364033 ?auto_1364040 ) ( not ( = ?auto_1364028 ?auto_1364040 ) ) ( PERSON-AT ?auto_1364032 ?auto_1364039 ) ( PERSON-AT ?auto_1364029 ?auto_1364040 ) ( PERSON-AT ?auto_1364030 ?auto_1364039 ) ( PERSON-AT ?auto_1364031 ?auto_1364035 ) ( AIRCRAFT-AT ?auto_1364037 ?auto_1364028 ) ( FUEL-LEVEL ?auto_1364037 ?auto_1364036 ) ( not ( = ?auto_1364028 ?auto_1364035 ) ) ( not ( = ?auto_1364031 ?auto_1364030 ) ) ( not ( = ?auto_1364039 ?auto_1364035 ) ) ( not ( = ?auto_1364031 ?auto_1364029 ) ) ( not ( = ?auto_1364030 ?auto_1364029 ) ) ( not ( = ?auto_1364040 ?auto_1364039 ) ) ( not ( = ?auto_1364040 ?auto_1364035 ) ) ( not ( = ?auto_1364031 ?auto_1364032 ) ) ( not ( = ?auto_1364030 ?auto_1364032 ) ) ( not ( = ?auto_1364029 ?auto_1364032 ) ) ( not ( = ?auto_1364031 ?auto_1364033 ) ) ( not ( = ?auto_1364030 ?auto_1364033 ) ) ( not ( = ?auto_1364029 ?auto_1364033 ) ) ( not ( = ?auto_1364032 ?auto_1364033 ) ) ( not ( = ?auto_1364031 ?auto_1364034 ) ) ( not ( = ?auto_1364030 ?auto_1364034 ) ) ( not ( = ?auto_1364029 ?auto_1364034 ) ) ( not ( = ?auto_1364032 ?auto_1364034 ) ) ( not ( = ?auto_1364033 ?auto_1364034 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1364031 ?auto_1364030 ?auto_1364029 ?auto_1364032 ?auto_1364034 ?auto_1364033 ?auto_1364028 )
      ( FLY-6PPL-VERIFY ?auto_1364029 ?auto_1364030 ?auto_1364031 ?auto_1364032 ?auto_1364033 ?auto_1364034 ?auto_1364028 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1364098 - PERSON
      ?auto_1364099 - PERSON
      ?auto_1364100 - PERSON
      ?auto_1364101 - PERSON
      ?auto_1364102 - PERSON
      ?auto_1364103 - PERSON
      ?auto_1364097 - CITY
    )
    :vars
    (
      ?auto_1364105 - FLEVEL
      ?auto_1364107 - FLEVEL
      ?auto_1364108 - CITY
      ?auto_1364109 - CITY
      ?auto_1364104 - CITY
      ?auto_1364106 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1364105 ?auto_1364107 ) ( PERSON-AT ?auto_1364102 ?auto_1364108 ) ( not ( = ?auto_1364097 ?auto_1364108 ) ) ( not ( = ?auto_1364105 ?auto_1364107 ) ) ( PERSON-AT ?auto_1364103 ?auto_1364109 ) ( not ( = ?auto_1364097 ?auto_1364109 ) ) ( PERSON-AT ?auto_1364101 ?auto_1364108 ) ( PERSON-AT ?auto_1364098 ?auto_1364109 ) ( PERSON-AT ?auto_1364099 ?auto_1364108 ) ( PERSON-AT ?auto_1364100 ?auto_1364104 ) ( AIRCRAFT-AT ?auto_1364106 ?auto_1364097 ) ( FUEL-LEVEL ?auto_1364106 ?auto_1364105 ) ( not ( = ?auto_1364097 ?auto_1364104 ) ) ( not ( = ?auto_1364100 ?auto_1364099 ) ) ( not ( = ?auto_1364108 ?auto_1364104 ) ) ( not ( = ?auto_1364100 ?auto_1364098 ) ) ( not ( = ?auto_1364099 ?auto_1364098 ) ) ( not ( = ?auto_1364109 ?auto_1364108 ) ) ( not ( = ?auto_1364109 ?auto_1364104 ) ) ( not ( = ?auto_1364100 ?auto_1364101 ) ) ( not ( = ?auto_1364099 ?auto_1364101 ) ) ( not ( = ?auto_1364098 ?auto_1364101 ) ) ( not ( = ?auto_1364100 ?auto_1364103 ) ) ( not ( = ?auto_1364099 ?auto_1364103 ) ) ( not ( = ?auto_1364098 ?auto_1364103 ) ) ( not ( = ?auto_1364101 ?auto_1364103 ) ) ( not ( = ?auto_1364100 ?auto_1364102 ) ) ( not ( = ?auto_1364099 ?auto_1364102 ) ) ( not ( = ?auto_1364098 ?auto_1364102 ) ) ( not ( = ?auto_1364101 ?auto_1364102 ) ) ( not ( = ?auto_1364103 ?auto_1364102 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1364100 ?auto_1364099 ?auto_1364098 ?auto_1364101 ?auto_1364102 ?auto_1364103 ?auto_1364097 )
      ( FLY-6PPL-VERIFY ?auto_1364098 ?auto_1364099 ?auto_1364100 ?auto_1364101 ?auto_1364102 ?auto_1364103 ?auto_1364097 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1364167 - PERSON
      ?auto_1364168 - PERSON
      ?auto_1364169 - PERSON
      ?auto_1364170 - PERSON
      ?auto_1364171 - PERSON
      ?auto_1364172 - PERSON
      ?auto_1364166 - CITY
    )
    :vars
    (
      ?auto_1364174 - FLEVEL
      ?auto_1364176 - FLEVEL
      ?auto_1364177 - CITY
      ?auto_1364178 - CITY
      ?auto_1364173 - CITY
      ?auto_1364175 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1364174 ?auto_1364176 ) ( PERSON-AT ?auto_1364172 ?auto_1364177 ) ( not ( = ?auto_1364166 ?auto_1364177 ) ) ( not ( = ?auto_1364174 ?auto_1364176 ) ) ( PERSON-AT ?auto_1364170 ?auto_1364178 ) ( not ( = ?auto_1364166 ?auto_1364178 ) ) ( PERSON-AT ?auto_1364171 ?auto_1364177 ) ( PERSON-AT ?auto_1364167 ?auto_1364178 ) ( PERSON-AT ?auto_1364168 ?auto_1364177 ) ( PERSON-AT ?auto_1364169 ?auto_1364173 ) ( AIRCRAFT-AT ?auto_1364175 ?auto_1364166 ) ( FUEL-LEVEL ?auto_1364175 ?auto_1364174 ) ( not ( = ?auto_1364166 ?auto_1364173 ) ) ( not ( = ?auto_1364169 ?auto_1364168 ) ) ( not ( = ?auto_1364177 ?auto_1364173 ) ) ( not ( = ?auto_1364169 ?auto_1364167 ) ) ( not ( = ?auto_1364168 ?auto_1364167 ) ) ( not ( = ?auto_1364178 ?auto_1364177 ) ) ( not ( = ?auto_1364178 ?auto_1364173 ) ) ( not ( = ?auto_1364169 ?auto_1364171 ) ) ( not ( = ?auto_1364168 ?auto_1364171 ) ) ( not ( = ?auto_1364167 ?auto_1364171 ) ) ( not ( = ?auto_1364169 ?auto_1364170 ) ) ( not ( = ?auto_1364168 ?auto_1364170 ) ) ( not ( = ?auto_1364167 ?auto_1364170 ) ) ( not ( = ?auto_1364171 ?auto_1364170 ) ) ( not ( = ?auto_1364169 ?auto_1364172 ) ) ( not ( = ?auto_1364168 ?auto_1364172 ) ) ( not ( = ?auto_1364167 ?auto_1364172 ) ) ( not ( = ?auto_1364171 ?auto_1364172 ) ) ( not ( = ?auto_1364170 ?auto_1364172 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1364169 ?auto_1364168 ?auto_1364167 ?auto_1364171 ?auto_1364172 ?auto_1364170 ?auto_1364166 )
      ( FLY-6PPL-VERIFY ?auto_1364167 ?auto_1364168 ?auto_1364169 ?auto_1364170 ?auto_1364171 ?auto_1364172 ?auto_1364166 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1367565 - PERSON
      ?auto_1367566 - PERSON
      ?auto_1367567 - PERSON
      ?auto_1367568 - PERSON
      ?auto_1367569 - PERSON
      ?auto_1367570 - PERSON
      ?auto_1367564 - CITY
    )
    :vars
    (
      ?auto_1367572 - FLEVEL
      ?auto_1367574 - FLEVEL
      ?auto_1367575 - CITY
      ?auto_1367576 - CITY
      ?auto_1367571 - CITY
      ?auto_1367573 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1367572 ?auto_1367574 ) ( PERSON-AT ?auto_1367570 ?auto_1367575 ) ( not ( = ?auto_1367564 ?auto_1367575 ) ) ( not ( = ?auto_1367572 ?auto_1367574 ) ) ( PERSON-AT ?auto_1367569 ?auto_1367576 ) ( not ( = ?auto_1367564 ?auto_1367576 ) ) ( PERSON-AT ?auto_1367567 ?auto_1367575 ) ( PERSON-AT ?auto_1367565 ?auto_1367576 ) ( PERSON-AT ?auto_1367566 ?auto_1367575 ) ( PERSON-AT ?auto_1367568 ?auto_1367571 ) ( AIRCRAFT-AT ?auto_1367573 ?auto_1367564 ) ( FUEL-LEVEL ?auto_1367573 ?auto_1367572 ) ( not ( = ?auto_1367564 ?auto_1367571 ) ) ( not ( = ?auto_1367568 ?auto_1367566 ) ) ( not ( = ?auto_1367575 ?auto_1367571 ) ) ( not ( = ?auto_1367568 ?auto_1367565 ) ) ( not ( = ?auto_1367566 ?auto_1367565 ) ) ( not ( = ?auto_1367576 ?auto_1367575 ) ) ( not ( = ?auto_1367576 ?auto_1367571 ) ) ( not ( = ?auto_1367568 ?auto_1367567 ) ) ( not ( = ?auto_1367566 ?auto_1367567 ) ) ( not ( = ?auto_1367565 ?auto_1367567 ) ) ( not ( = ?auto_1367568 ?auto_1367569 ) ) ( not ( = ?auto_1367566 ?auto_1367569 ) ) ( not ( = ?auto_1367565 ?auto_1367569 ) ) ( not ( = ?auto_1367567 ?auto_1367569 ) ) ( not ( = ?auto_1367568 ?auto_1367570 ) ) ( not ( = ?auto_1367566 ?auto_1367570 ) ) ( not ( = ?auto_1367565 ?auto_1367570 ) ) ( not ( = ?auto_1367567 ?auto_1367570 ) ) ( not ( = ?auto_1367569 ?auto_1367570 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1367568 ?auto_1367566 ?auto_1367565 ?auto_1367567 ?auto_1367570 ?auto_1367569 ?auto_1367564 )
      ( FLY-6PPL-VERIFY ?auto_1367565 ?auto_1367566 ?auto_1367567 ?auto_1367568 ?auto_1367569 ?auto_1367570 ?auto_1367564 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1367634 - PERSON
      ?auto_1367635 - PERSON
      ?auto_1367636 - PERSON
      ?auto_1367637 - PERSON
      ?auto_1367638 - PERSON
      ?auto_1367639 - PERSON
      ?auto_1367633 - CITY
    )
    :vars
    (
      ?auto_1367641 - FLEVEL
      ?auto_1367643 - FLEVEL
      ?auto_1367644 - CITY
      ?auto_1367645 - CITY
      ?auto_1367640 - CITY
      ?auto_1367642 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1367641 ?auto_1367643 ) ( PERSON-AT ?auto_1367638 ?auto_1367644 ) ( not ( = ?auto_1367633 ?auto_1367644 ) ) ( not ( = ?auto_1367641 ?auto_1367643 ) ) ( PERSON-AT ?auto_1367639 ?auto_1367645 ) ( not ( = ?auto_1367633 ?auto_1367645 ) ) ( PERSON-AT ?auto_1367636 ?auto_1367644 ) ( PERSON-AT ?auto_1367634 ?auto_1367645 ) ( PERSON-AT ?auto_1367635 ?auto_1367644 ) ( PERSON-AT ?auto_1367637 ?auto_1367640 ) ( AIRCRAFT-AT ?auto_1367642 ?auto_1367633 ) ( FUEL-LEVEL ?auto_1367642 ?auto_1367641 ) ( not ( = ?auto_1367633 ?auto_1367640 ) ) ( not ( = ?auto_1367637 ?auto_1367635 ) ) ( not ( = ?auto_1367644 ?auto_1367640 ) ) ( not ( = ?auto_1367637 ?auto_1367634 ) ) ( not ( = ?auto_1367635 ?auto_1367634 ) ) ( not ( = ?auto_1367645 ?auto_1367644 ) ) ( not ( = ?auto_1367645 ?auto_1367640 ) ) ( not ( = ?auto_1367637 ?auto_1367636 ) ) ( not ( = ?auto_1367635 ?auto_1367636 ) ) ( not ( = ?auto_1367634 ?auto_1367636 ) ) ( not ( = ?auto_1367637 ?auto_1367639 ) ) ( not ( = ?auto_1367635 ?auto_1367639 ) ) ( not ( = ?auto_1367634 ?auto_1367639 ) ) ( not ( = ?auto_1367636 ?auto_1367639 ) ) ( not ( = ?auto_1367637 ?auto_1367638 ) ) ( not ( = ?auto_1367635 ?auto_1367638 ) ) ( not ( = ?auto_1367634 ?auto_1367638 ) ) ( not ( = ?auto_1367636 ?auto_1367638 ) ) ( not ( = ?auto_1367639 ?auto_1367638 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1367637 ?auto_1367635 ?auto_1367634 ?auto_1367636 ?auto_1367638 ?auto_1367639 ?auto_1367633 )
      ( FLY-6PPL-VERIFY ?auto_1367634 ?auto_1367635 ?auto_1367636 ?auto_1367637 ?auto_1367638 ?auto_1367639 ?auto_1367633 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1368144 - PERSON
      ?auto_1368145 - PERSON
      ?auto_1368146 - PERSON
      ?auto_1368147 - PERSON
      ?auto_1368148 - PERSON
      ?auto_1368149 - PERSON
      ?auto_1368143 - CITY
    )
    :vars
    (
      ?auto_1368151 - FLEVEL
      ?auto_1368153 - FLEVEL
      ?auto_1368154 - CITY
      ?auto_1368155 - CITY
      ?auto_1368150 - CITY
      ?auto_1368152 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1368151 ?auto_1368153 ) ( PERSON-AT ?auto_1368149 ?auto_1368154 ) ( not ( = ?auto_1368143 ?auto_1368154 ) ) ( not ( = ?auto_1368151 ?auto_1368153 ) ) ( PERSON-AT ?auto_1368147 ?auto_1368155 ) ( not ( = ?auto_1368143 ?auto_1368155 ) ) ( PERSON-AT ?auto_1368146 ?auto_1368154 ) ( PERSON-AT ?auto_1368144 ?auto_1368155 ) ( PERSON-AT ?auto_1368145 ?auto_1368154 ) ( PERSON-AT ?auto_1368148 ?auto_1368150 ) ( AIRCRAFT-AT ?auto_1368152 ?auto_1368143 ) ( FUEL-LEVEL ?auto_1368152 ?auto_1368151 ) ( not ( = ?auto_1368143 ?auto_1368150 ) ) ( not ( = ?auto_1368148 ?auto_1368145 ) ) ( not ( = ?auto_1368154 ?auto_1368150 ) ) ( not ( = ?auto_1368148 ?auto_1368144 ) ) ( not ( = ?auto_1368145 ?auto_1368144 ) ) ( not ( = ?auto_1368155 ?auto_1368154 ) ) ( not ( = ?auto_1368155 ?auto_1368150 ) ) ( not ( = ?auto_1368148 ?auto_1368146 ) ) ( not ( = ?auto_1368145 ?auto_1368146 ) ) ( not ( = ?auto_1368144 ?auto_1368146 ) ) ( not ( = ?auto_1368148 ?auto_1368147 ) ) ( not ( = ?auto_1368145 ?auto_1368147 ) ) ( not ( = ?auto_1368144 ?auto_1368147 ) ) ( not ( = ?auto_1368146 ?auto_1368147 ) ) ( not ( = ?auto_1368148 ?auto_1368149 ) ) ( not ( = ?auto_1368145 ?auto_1368149 ) ) ( not ( = ?auto_1368144 ?auto_1368149 ) ) ( not ( = ?auto_1368146 ?auto_1368149 ) ) ( not ( = ?auto_1368147 ?auto_1368149 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1368148 ?auto_1368145 ?auto_1368144 ?auto_1368146 ?auto_1368149 ?auto_1368147 ?auto_1368143 )
      ( FLY-6PPL-VERIFY ?auto_1368144 ?auto_1368145 ?auto_1368146 ?auto_1368147 ?auto_1368148 ?auto_1368149 ?auto_1368143 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1368213 - PERSON
      ?auto_1368214 - PERSON
      ?auto_1368215 - PERSON
      ?auto_1368216 - PERSON
      ?auto_1368217 - PERSON
      ?auto_1368218 - PERSON
      ?auto_1368212 - CITY
    )
    :vars
    (
      ?auto_1368220 - FLEVEL
      ?auto_1368222 - FLEVEL
      ?auto_1368223 - CITY
      ?auto_1368224 - CITY
      ?auto_1368219 - CITY
      ?auto_1368221 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1368220 ?auto_1368222 ) ( PERSON-AT ?auto_1368217 ?auto_1368223 ) ( not ( = ?auto_1368212 ?auto_1368223 ) ) ( not ( = ?auto_1368220 ?auto_1368222 ) ) ( PERSON-AT ?auto_1368216 ?auto_1368224 ) ( not ( = ?auto_1368212 ?auto_1368224 ) ) ( PERSON-AT ?auto_1368215 ?auto_1368223 ) ( PERSON-AT ?auto_1368213 ?auto_1368224 ) ( PERSON-AT ?auto_1368214 ?auto_1368223 ) ( PERSON-AT ?auto_1368218 ?auto_1368219 ) ( AIRCRAFT-AT ?auto_1368221 ?auto_1368212 ) ( FUEL-LEVEL ?auto_1368221 ?auto_1368220 ) ( not ( = ?auto_1368212 ?auto_1368219 ) ) ( not ( = ?auto_1368218 ?auto_1368214 ) ) ( not ( = ?auto_1368223 ?auto_1368219 ) ) ( not ( = ?auto_1368218 ?auto_1368213 ) ) ( not ( = ?auto_1368214 ?auto_1368213 ) ) ( not ( = ?auto_1368224 ?auto_1368223 ) ) ( not ( = ?auto_1368224 ?auto_1368219 ) ) ( not ( = ?auto_1368218 ?auto_1368215 ) ) ( not ( = ?auto_1368214 ?auto_1368215 ) ) ( not ( = ?auto_1368213 ?auto_1368215 ) ) ( not ( = ?auto_1368218 ?auto_1368216 ) ) ( not ( = ?auto_1368214 ?auto_1368216 ) ) ( not ( = ?auto_1368213 ?auto_1368216 ) ) ( not ( = ?auto_1368215 ?auto_1368216 ) ) ( not ( = ?auto_1368218 ?auto_1368217 ) ) ( not ( = ?auto_1368214 ?auto_1368217 ) ) ( not ( = ?auto_1368213 ?auto_1368217 ) ) ( not ( = ?auto_1368215 ?auto_1368217 ) ) ( not ( = ?auto_1368216 ?auto_1368217 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1368218 ?auto_1368214 ?auto_1368213 ?auto_1368215 ?auto_1368217 ?auto_1368216 ?auto_1368212 )
      ( FLY-6PPL-VERIFY ?auto_1368213 ?auto_1368214 ?auto_1368215 ?auto_1368216 ?auto_1368217 ?auto_1368218 ?auto_1368212 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1368352 - PERSON
      ?auto_1368353 - PERSON
      ?auto_1368354 - PERSON
      ?auto_1368355 - PERSON
      ?auto_1368356 - PERSON
      ?auto_1368357 - PERSON
      ?auto_1368351 - CITY
    )
    :vars
    (
      ?auto_1368359 - FLEVEL
      ?auto_1368361 - FLEVEL
      ?auto_1368362 - CITY
      ?auto_1368363 - CITY
      ?auto_1368358 - CITY
      ?auto_1368360 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1368359 ?auto_1368361 ) ( PERSON-AT ?auto_1368355 ?auto_1368362 ) ( not ( = ?auto_1368351 ?auto_1368362 ) ) ( not ( = ?auto_1368359 ?auto_1368361 ) ) ( PERSON-AT ?auto_1368357 ?auto_1368363 ) ( not ( = ?auto_1368351 ?auto_1368363 ) ) ( PERSON-AT ?auto_1368354 ?auto_1368362 ) ( PERSON-AT ?auto_1368352 ?auto_1368363 ) ( PERSON-AT ?auto_1368353 ?auto_1368362 ) ( PERSON-AT ?auto_1368356 ?auto_1368358 ) ( AIRCRAFT-AT ?auto_1368360 ?auto_1368351 ) ( FUEL-LEVEL ?auto_1368360 ?auto_1368359 ) ( not ( = ?auto_1368351 ?auto_1368358 ) ) ( not ( = ?auto_1368356 ?auto_1368353 ) ) ( not ( = ?auto_1368362 ?auto_1368358 ) ) ( not ( = ?auto_1368356 ?auto_1368352 ) ) ( not ( = ?auto_1368353 ?auto_1368352 ) ) ( not ( = ?auto_1368363 ?auto_1368362 ) ) ( not ( = ?auto_1368363 ?auto_1368358 ) ) ( not ( = ?auto_1368356 ?auto_1368354 ) ) ( not ( = ?auto_1368353 ?auto_1368354 ) ) ( not ( = ?auto_1368352 ?auto_1368354 ) ) ( not ( = ?auto_1368356 ?auto_1368357 ) ) ( not ( = ?auto_1368353 ?auto_1368357 ) ) ( not ( = ?auto_1368352 ?auto_1368357 ) ) ( not ( = ?auto_1368354 ?auto_1368357 ) ) ( not ( = ?auto_1368356 ?auto_1368355 ) ) ( not ( = ?auto_1368353 ?auto_1368355 ) ) ( not ( = ?auto_1368352 ?auto_1368355 ) ) ( not ( = ?auto_1368354 ?auto_1368355 ) ) ( not ( = ?auto_1368357 ?auto_1368355 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1368356 ?auto_1368353 ?auto_1368352 ?auto_1368354 ?auto_1368355 ?auto_1368357 ?auto_1368351 )
      ( FLY-6PPL-VERIFY ?auto_1368352 ?auto_1368353 ?auto_1368354 ?auto_1368355 ?auto_1368356 ?auto_1368357 ?auto_1368351 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1368643 - PERSON
      ?auto_1368644 - PERSON
      ?auto_1368645 - PERSON
      ?auto_1368646 - PERSON
      ?auto_1368647 - PERSON
      ?auto_1368648 - PERSON
      ?auto_1368642 - CITY
    )
    :vars
    (
      ?auto_1368650 - FLEVEL
      ?auto_1368652 - FLEVEL
      ?auto_1368653 - CITY
      ?auto_1368654 - CITY
      ?auto_1368649 - CITY
      ?auto_1368651 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1368650 ?auto_1368652 ) ( PERSON-AT ?auto_1368646 ?auto_1368653 ) ( not ( = ?auto_1368642 ?auto_1368653 ) ) ( not ( = ?auto_1368650 ?auto_1368652 ) ) ( PERSON-AT ?auto_1368647 ?auto_1368654 ) ( not ( = ?auto_1368642 ?auto_1368654 ) ) ( PERSON-AT ?auto_1368645 ?auto_1368653 ) ( PERSON-AT ?auto_1368643 ?auto_1368654 ) ( PERSON-AT ?auto_1368644 ?auto_1368653 ) ( PERSON-AT ?auto_1368648 ?auto_1368649 ) ( AIRCRAFT-AT ?auto_1368651 ?auto_1368642 ) ( FUEL-LEVEL ?auto_1368651 ?auto_1368650 ) ( not ( = ?auto_1368642 ?auto_1368649 ) ) ( not ( = ?auto_1368648 ?auto_1368644 ) ) ( not ( = ?auto_1368653 ?auto_1368649 ) ) ( not ( = ?auto_1368648 ?auto_1368643 ) ) ( not ( = ?auto_1368644 ?auto_1368643 ) ) ( not ( = ?auto_1368654 ?auto_1368653 ) ) ( not ( = ?auto_1368654 ?auto_1368649 ) ) ( not ( = ?auto_1368648 ?auto_1368645 ) ) ( not ( = ?auto_1368644 ?auto_1368645 ) ) ( not ( = ?auto_1368643 ?auto_1368645 ) ) ( not ( = ?auto_1368648 ?auto_1368647 ) ) ( not ( = ?auto_1368644 ?auto_1368647 ) ) ( not ( = ?auto_1368643 ?auto_1368647 ) ) ( not ( = ?auto_1368645 ?auto_1368647 ) ) ( not ( = ?auto_1368648 ?auto_1368646 ) ) ( not ( = ?auto_1368644 ?auto_1368646 ) ) ( not ( = ?auto_1368643 ?auto_1368646 ) ) ( not ( = ?auto_1368645 ?auto_1368646 ) ) ( not ( = ?auto_1368647 ?auto_1368646 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1368648 ?auto_1368644 ?auto_1368643 ?auto_1368645 ?auto_1368646 ?auto_1368647 ?auto_1368642 )
      ( FLY-6PPL-VERIFY ?auto_1368643 ?auto_1368644 ?auto_1368645 ?auto_1368646 ?auto_1368647 ?auto_1368648 ?auto_1368642 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1368856 - PERSON
      ?auto_1368857 - PERSON
      ?auto_1368858 - PERSON
      ?auto_1368859 - PERSON
      ?auto_1368860 - PERSON
      ?auto_1368861 - PERSON
      ?auto_1368855 - CITY
    )
    :vars
    (
      ?auto_1368863 - FLEVEL
      ?auto_1368865 - FLEVEL
      ?auto_1368866 - CITY
      ?auto_1368867 - CITY
      ?auto_1368862 - CITY
      ?auto_1368864 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1368863 ?auto_1368865 ) ( PERSON-AT ?auto_1368861 ?auto_1368866 ) ( not ( = ?auto_1368855 ?auto_1368866 ) ) ( not ( = ?auto_1368863 ?auto_1368865 ) ) ( PERSON-AT ?auto_1368858 ?auto_1368867 ) ( not ( = ?auto_1368855 ?auto_1368867 ) ) ( PERSON-AT ?auto_1368860 ?auto_1368866 ) ( PERSON-AT ?auto_1368856 ?auto_1368867 ) ( PERSON-AT ?auto_1368857 ?auto_1368866 ) ( PERSON-AT ?auto_1368859 ?auto_1368862 ) ( AIRCRAFT-AT ?auto_1368864 ?auto_1368855 ) ( FUEL-LEVEL ?auto_1368864 ?auto_1368863 ) ( not ( = ?auto_1368855 ?auto_1368862 ) ) ( not ( = ?auto_1368859 ?auto_1368857 ) ) ( not ( = ?auto_1368866 ?auto_1368862 ) ) ( not ( = ?auto_1368859 ?auto_1368856 ) ) ( not ( = ?auto_1368857 ?auto_1368856 ) ) ( not ( = ?auto_1368867 ?auto_1368866 ) ) ( not ( = ?auto_1368867 ?auto_1368862 ) ) ( not ( = ?auto_1368859 ?auto_1368860 ) ) ( not ( = ?auto_1368857 ?auto_1368860 ) ) ( not ( = ?auto_1368856 ?auto_1368860 ) ) ( not ( = ?auto_1368859 ?auto_1368858 ) ) ( not ( = ?auto_1368857 ?auto_1368858 ) ) ( not ( = ?auto_1368856 ?auto_1368858 ) ) ( not ( = ?auto_1368860 ?auto_1368858 ) ) ( not ( = ?auto_1368859 ?auto_1368861 ) ) ( not ( = ?auto_1368857 ?auto_1368861 ) ) ( not ( = ?auto_1368856 ?auto_1368861 ) ) ( not ( = ?auto_1368860 ?auto_1368861 ) ) ( not ( = ?auto_1368858 ?auto_1368861 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1368859 ?auto_1368857 ?auto_1368856 ?auto_1368860 ?auto_1368861 ?auto_1368858 ?auto_1368855 )
      ( FLY-6PPL-VERIFY ?auto_1368856 ?auto_1368857 ?auto_1368858 ?auto_1368859 ?auto_1368860 ?auto_1368861 ?auto_1368855 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1369282 - PERSON
      ?auto_1369283 - PERSON
      ?auto_1369284 - PERSON
      ?auto_1369285 - PERSON
      ?auto_1369286 - PERSON
      ?auto_1369287 - PERSON
      ?auto_1369281 - CITY
    )
    :vars
    (
      ?auto_1369289 - FLEVEL
      ?auto_1369291 - FLEVEL
      ?auto_1369292 - CITY
      ?auto_1369293 - CITY
      ?auto_1369288 - CITY
      ?auto_1369290 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1369289 ?auto_1369291 ) ( PERSON-AT ?auto_1369287 ?auto_1369292 ) ( not ( = ?auto_1369281 ?auto_1369292 ) ) ( not ( = ?auto_1369289 ?auto_1369291 ) ) ( PERSON-AT ?auto_1369284 ?auto_1369293 ) ( not ( = ?auto_1369281 ?auto_1369293 ) ) ( PERSON-AT ?auto_1369285 ?auto_1369292 ) ( PERSON-AT ?auto_1369282 ?auto_1369293 ) ( PERSON-AT ?auto_1369283 ?auto_1369292 ) ( PERSON-AT ?auto_1369286 ?auto_1369288 ) ( AIRCRAFT-AT ?auto_1369290 ?auto_1369281 ) ( FUEL-LEVEL ?auto_1369290 ?auto_1369289 ) ( not ( = ?auto_1369281 ?auto_1369288 ) ) ( not ( = ?auto_1369286 ?auto_1369283 ) ) ( not ( = ?auto_1369292 ?auto_1369288 ) ) ( not ( = ?auto_1369286 ?auto_1369282 ) ) ( not ( = ?auto_1369283 ?auto_1369282 ) ) ( not ( = ?auto_1369293 ?auto_1369292 ) ) ( not ( = ?auto_1369293 ?auto_1369288 ) ) ( not ( = ?auto_1369286 ?auto_1369285 ) ) ( not ( = ?auto_1369283 ?auto_1369285 ) ) ( not ( = ?auto_1369282 ?auto_1369285 ) ) ( not ( = ?auto_1369286 ?auto_1369284 ) ) ( not ( = ?auto_1369283 ?auto_1369284 ) ) ( not ( = ?auto_1369282 ?auto_1369284 ) ) ( not ( = ?auto_1369285 ?auto_1369284 ) ) ( not ( = ?auto_1369286 ?auto_1369287 ) ) ( not ( = ?auto_1369283 ?auto_1369287 ) ) ( not ( = ?auto_1369282 ?auto_1369287 ) ) ( not ( = ?auto_1369285 ?auto_1369287 ) ) ( not ( = ?auto_1369284 ?auto_1369287 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1369286 ?auto_1369283 ?auto_1369282 ?auto_1369285 ?auto_1369287 ?auto_1369284 ?auto_1369281 )
      ( FLY-6PPL-VERIFY ?auto_1369282 ?auto_1369283 ?auto_1369284 ?auto_1369285 ?auto_1369286 ?auto_1369287 ?auto_1369281 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1369351 - PERSON
      ?auto_1369352 - PERSON
      ?auto_1369353 - PERSON
      ?auto_1369354 - PERSON
      ?auto_1369355 - PERSON
      ?auto_1369356 - PERSON
      ?auto_1369350 - CITY
    )
    :vars
    (
      ?auto_1369358 - FLEVEL
      ?auto_1369360 - FLEVEL
      ?auto_1369361 - CITY
      ?auto_1369362 - CITY
      ?auto_1369357 - CITY
      ?auto_1369359 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1369358 ?auto_1369360 ) ( PERSON-AT ?auto_1369355 ?auto_1369361 ) ( not ( = ?auto_1369350 ?auto_1369361 ) ) ( not ( = ?auto_1369358 ?auto_1369360 ) ) ( PERSON-AT ?auto_1369353 ?auto_1369362 ) ( not ( = ?auto_1369350 ?auto_1369362 ) ) ( PERSON-AT ?auto_1369354 ?auto_1369361 ) ( PERSON-AT ?auto_1369351 ?auto_1369362 ) ( PERSON-AT ?auto_1369352 ?auto_1369361 ) ( PERSON-AT ?auto_1369356 ?auto_1369357 ) ( AIRCRAFT-AT ?auto_1369359 ?auto_1369350 ) ( FUEL-LEVEL ?auto_1369359 ?auto_1369358 ) ( not ( = ?auto_1369350 ?auto_1369357 ) ) ( not ( = ?auto_1369356 ?auto_1369352 ) ) ( not ( = ?auto_1369361 ?auto_1369357 ) ) ( not ( = ?auto_1369356 ?auto_1369351 ) ) ( not ( = ?auto_1369352 ?auto_1369351 ) ) ( not ( = ?auto_1369362 ?auto_1369361 ) ) ( not ( = ?auto_1369362 ?auto_1369357 ) ) ( not ( = ?auto_1369356 ?auto_1369354 ) ) ( not ( = ?auto_1369352 ?auto_1369354 ) ) ( not ( = ?auto_1369351 ?auto_1369354 ) ) ( not ( = ?auto_1369356 ?auto_1369353 ) ) ( not ( = ?auto_1369352 ?auto_1369353 ) ) ( not ( = ?auto_1369351 ?auto_1369353 ) ) ( not ( = ?auto_1369354 ?auto_1369353 ) ) ( not ( = ?auto_1369356 ?auto_1369355 ) ) ( not ( = ?auto_1369352 ?auto_1369355 ) ) ( not ( = ?auto_1369351 ?auto_1369355 ) ) ( not ( = ?auto_1369354 ?auto_1369355 ) ) ( not ( = ?auto_1369353 ?auto_1369355 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1369356 ?auto_1369352 ?auto_1369351 ?auto_1369354 ?auto_1369355 ?auto_1369353 ?auto_1369350 )
      ( FLY-6PPL-VERIFY ?auto_1369351 ?auto_1369352 ?auto_1369353 ?auto_1369354 ?auto_1369355 ?auto_1369356 ?auto_1369350 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1393336 - PERSON
      ?auto_1393337 - PERSON
      ?auto_1393338 - PERSON
      ?auto_1393339 - PERSON
      ?auto_1393340 - PERSON
      ?auto_1393341 - PERSON
      ?auto_1393335 - CITY
    )
    :vars
    (
      ?auto_1393343 - FLEVEL
      ?auto_1393345 - FLEVEL
      ?auto_1393346 - CITY
      ?auto_1393347 - CITY
      ?auto_1393342 - CITY
      ?auto_1393344 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1393343 ?auto_1393345 ) ( PERSON-AT ?auto_1393341 ?auto_1393346 ) ( not ( = ?auto_1393335 ?auto_1393346 ) ) ( not ( = ?auto_1393343 ?auto_1393345 ) ) ( PERSON-AT ?auto_1393337 ?auto_1393347 ) ( not ( = ?auto_1393335 ?auto_1393347 ) ) ( PERSON-AT ?auto_1393340 ?auto_1393346 ) ( PERSON-AT ?auto_1393336 ?auto_1393347 ) ( PERSON-AT ?auto_1393339 ?auto_1393346 ) ( PERSON-AT ?auto_1393338 ?auto_1393342 ) ( AIRCRAFT-AT ?auto_1393344 ?auto_1393335 ) ( FUEL-LEVEL ?auto_1393344 ?auto_1393343 ) ( not ( = ?auto_1393335 ?auto_1393342 ) ) ( not ( = ?auto_1393338 ?auto_1393339 ) ) ( not ( = ?auto_1393346 ?auto_1393342 ) ) ( not ( = ?auto_1393338 ?auto_1393336 ) ) ( not ( = ?auto_1393339 ?auto_1393336 ) ) ( not ( = ?auto_1393347 ?auto_1393346 ) ) ( not ( = ?auto_1393347 ?auto_1393342 ) ) ( not ( = ?auto_1393338 ?auto_1393340 ) ) ( not ( = ?auto_1393339 ?auto_1393340 ) ) ( not ( = ?auto_1393336 ?auto_1393340 ) ) ( not ( = ?auto_1393338 ?auto_1393337 ) ) ( not ( = ?auto_1393339 ?auto_1393337 ) ) ( not ( = ?auto_1393336 ?auto_1393337 ) ) ( not ( = ?auto_1393340 ?auto_1393337 ) ) ( not ( = ?auto_1393338 ?auto_1393341 ) ) ( not ( = ?auto_1393339 ?auto_1393341 ) ) ( not ( = ?auto_1393336 ?auto_1393341 ) ) ( not ( = ?auto_1393340 ?auto_1393341 ) ) ( not ( = ?auto_1393337 ?auto_1393341 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1393338 ?auto_1393339 ?auto_1393336 ?auto_1393340 ?auto_1393341 ?auto_1393337 ?auto_1393335 )
      ( FLY-6PPL-VERIFY ?auto_1393336 ?auto_1393337 ?auto_1393338 ?auto_1393339 ?auto_1393340 ?auto_1393341 ?auto_1393335 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1394450 - PERSON
      ?auto_1394451 - PERSON
      ?auto_1394452 - PERSON
      ?auto_1394453 - PERSON
      ?auto_1394454 - PERSON
      ?auto_1394455 - PERSON
      ?auto_1394449 - CITY
    )
    :vars
    (
      ?auto_1394457 - FLEVEL
      ?auto_1394459 - FLEVEL
      ?auto_1394460 - CITY
      ?auto_1394461 - CITY
      ?auto_1394456 - CITY
      ?auto_1394458 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1394457 ?auto_1394459 ) ( PERSON-AT ?auto_1394455 ?auto_1394460 ) ( not ( = ?auto_1394449 ?auto_1394460 ) ) ( not ( = ?auto_1394457 ?auto_1394459 ) ) ( PERSON-AT ?auto_1394451 ?auto_1394461 ) ( not ( = ?auto_1394449 ?auto_1394461 ) ) ( PERSON-AT ?auto_1394454 ?auto_1394460 ) ( PERSON-AT ?auto_1394450 ?auto_1394461 ) ( PERSON-AT ?auto_1394452 ?auto_1394460 ) ( PERSON-AT ?auto_1394453 ?auto_1394456 ) ( AIRCRAFT-AT ?auto_1394458 ?auto_1394449 ) ( FUEL-LEVEL ?auto_1394458 ?auto_1394457 ) ( not ( = ?auto_1394449 ?auto_1394456 ) ) ( not ( = ?auto_1394453 ?auto_1394452 ) ) ( not ( = ?auto_1394460 ?auto_1394456 ) ) ( not ( = ?auto_1394453 ?auto_1394450 ) ) ( not ( = ?auto_1394452 ?auto_1394450 ) ) ( not ( = ?auto_1394461 ?auto_1394460 ) ) ( not ( = ?auto_1394461 ?auto_1394456 ) ) ( not ( = ?auto_1394453 ?auto_1394454 ) ) ( not ( = ?auto_1394452 ?auto_1394454 ) ) ( not ( = ?auto_1394450 ?auto_1394454 ) ) ( not ( = ?auto_1394453 ?auto_1394451 ) ) ( not ( = ?auto_1394452 ?auto_1394451 ) ) ( not ( = ?auto_1394450 ?auto_1394451 ) ) ( not ( = ?auto_1394454 ?auto_1394451 ) ) ( not ( = ?auto_1394453 ?auto_1394455 ) ) ( not ( = ?auto_1394452 ?auto_1394455 ) ) ( not ( = ?auto_1394450 ?auto_1394455 ) ) ( not ( = ?auto_1394454 ?auto_1394455 ) ) ( not ( = ?auto_1394451 ?auto_1394455 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1394453 ?auto_1394452 ?auto_1394450 ?auto_1394454 ?auto_1394455 ?auto_1394451 ?auto_1394449 )
      ( FLY-6PPL-VERIFY ?auto_1394450 ?auto_1394451 ?auto_1394452 ?auto_1394453 ?auto_1394454 ?auto_1394455 ?auto_1394449 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1394876 - PERSON
      ?auto_1394877 - PERSON
      ?auto_1394878 - PERSON
      ?auto_1394879 - PERSON
      ?auto_1394880 - PERSON
      ?auto_1394881 - PERSON
      ?auto_1394875 - CITY
    )
    :vars
    (
      ?auto_1394883 - FLEVEL
      ?auto_1394885 - FLEVEL
      ?auto_1394886 - CITY
      ?auto_1394887 - CITY
      ?auto_1394882 - CITY
      ?auto_1394884 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1394883 ?auto_1394885 ) ( PERSON-AT ?auto_1394881 ?auto_1394886 ) ( not ( = ?auto_1394875 ?auto_1394886 ) ) ( not ( = ?auto_1394883 ?auto_1394885 ) ) ( PERSON-AT ?auto_1394877 ?auto_1394887 ) ( not ( = ?auto_1394875 ?auto_1394887 ) ) ( PERSON-AT ?auto_1394879 ?auto_1394886 ) ( PERSON-AT ?auto_1394876 ?auto_1394887 ) ( PERSON-AT ?auto_1394878 ?auto_1394886 ) ( PERSON-AT ?auto_1394880 ?auto_1394882 ) ( AIRCRAFT-AT ?auto_1394884 ?auto_1394875 ) ( FUEL-LEVEL ?auto_1394884 ?auto_1394883 ) ( not ( = ?auto_1394875 ?auto_1394882 ) ) ( not ( = ?auto_1394880 ?auto_1394878 ) ) ( not ( = ?auto_1394886 ?auto_1394882 ) ) ( not ( = ?auto_1394880 ?auto_1394876 ) ) ( not ( = ?auto_1394878 ?auto_1394876 ) ) ( not ( = ?auto_1394887 ?auto_1394886 ) ) ( not ( = ?auto_1394887 ?auto_1394882 ) ) ( not ( = ?auto_1394880 ?auto_1394879 ) ) ( not ( = ?auto_1394878 ?auto_1394879 ) ) ( not ( = ?auto_1394876 ?auto_1394879 ) ) ( not ( = ?auto_1394880 ?auto_1394877 ) ) ( not ( = ?auto_1394878 ?auto_1394877 ) ) ( not ( = ?auto_1394876 ?auto_1394877 ) ) ( not ( = ?auto_1394879 ?auto_1394877 ) ) ( not ( = ?auto_1394880 ?auto_1394881 ) ) ( not ( = ?auto_1394878 ?auto_1394881 ) ) ( not ( = ?auto_1394876 ?auto_1394881 ) ) ( not ( = ?auto_1394879 ?auto_1394881 ) ) ( not ( = ?auto_1394877 ?auto_1394881 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1394880 ?auto_1394878 ?auto_1394876 ?auto_1394879 ?auto_1394881 ?auto_1394877 ?auto_1394875 )
      ( FLY-6PPL-VERIFY ?auto_1394876 ?auto_1394877 ?auto_1394878 ?auto_1394879 ?auto_1394880 ?auto_1394881 ?auto_1394875 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1394945 - PERSON
      ?auto_1394946 - PERSON
      ?auto_1394947 - PERSON
      ?auto_1394948 - PERSON
      ?auto_1394949 - PERSON
      ?auto_1394950 - PERSON
      ?auto_1394944 - CITY
    )
    :vars
    (
      ?auto_1394952 - FLEVEL
      ?auto_1394954 - FLEVEL
      ?auto_1394955 - CITY
      ?auto_1394956 - CITY
      ?auto_1394951 - CITY
      ?auto_1394953 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1394952 ?auto_1394954 ) ( PERSON-AT ?auto_1394949 ?auto_1394955 ) ( not ( = ?auto_1394944 ?auto_1394955 ) ) ( not ( = ?auto_1394952 ?auto_1394954 ) ) ( PERSON-AT ?auto_1394946 ?auto_1394956 ) ( not ( = ?auto_1394944 ?auto_1394956 ) ) ( PERSON-AT ?auto_1394948 ?auto_1394955 ) ( PERSON-AT ?auto_1394945 ?auto_1394956 ) ( PERSON-AT ?auto_1394947 ?auto_1394955 ) ( PERSON-AT ?auto_1394950 ?auto_1394951 ) ( AIRCRAFT-AT ?auto_1394953 ?auto_1394944 ) ( FUEL-LEVEL ?auto_1394953 ?auto_1394952 ) ( not ( = ?auto_1394944 ?auto_1394951 ) ) ( not ( = ?auto_1394950 ?auto_1394947 ) ) ( not ( = ?auto_1394955 ?auto_1394951 ) ) ( not ( = ?auto_1394950 ?auto_1394945 ) ) ( not ( = ?auto_1394947 ?auto_1394945 ) ) ( not ( = ?auto_1394956 ?auto_1394955 ) ) ( not ( = ?auto_1394956 ?auto_1394951 ) ) ( not ( = ?auto_1394950 ?auto_1394948 ) ) ( not ( = ?auto_1394947 ?auto_1394948 ) ) ( not ( = ?auto_1394945 ?auto_1394948 ) ) ( not ( = ?auto_1394950 ?auto_1394946 ) ) ( not ( = ?auto_1394947 ?auto_1394946 ) ) ( not ( = ?auto_1394945 ?auto_1394946 ) ) ( not ( = ?auto_1394948 ?auto_1394946 ) ) ( not ( = ?auto_1394950 ?auto_1394949 ) ) ( not ( = ?auto_1394947 ?auto_1394949 ) ) ( not ( = ?auto_1394945 ?auto_1394949 ) ) ( not ( = ?auto_1394948 ?auto_1394949 ) ) ( not ( = ?auto_1394946 ?auto_1394949 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1394950 ?auto_1394947 ?auto_1394945 ?auto_1394948 ?auto_1394949 ?auto_1394946 ?auto_1394944 )
      ( FLY-6PPL-VERIFY ?auto_1394945 ?auto_1394946 ?auto_1394947 ?auto_1394948 ?auto_1394949 ?auto_1394950 ?auto_1394944 ) )
  )

)

