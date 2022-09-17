( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3038431 - OBJ
      ?auto_3038430 - LOCATION
    )
    :vars
    (
      ?auto_3038433 - LOCATION
      ?auto_3038434 - CITY
      ?auto_3038432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3038433 ?auto_3038434 ) ( IN-CITY ?auto_3038430 ?auto_3038434 ) ( not ( = ?auto_3038430 ?auto_3038433 ) ) ( OBJ-AT ?auto_3038431 ?auto_3038433 ) ( TRUCK-AT ?auto_3038432 ?auto_3038430 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3038432 ?auto_3038430 ?auto_3038433 ?auto_3038434 )
      ( !LOAD-TRUCK ?auto_3038431 ?auto_3038432 ?auto_3038433 )
      ( !DRIVE-TRUCK ?auto_3038432 ?auto_3038433 ?auto_3038430 ?auto_3038434 )
      ( !UNLOAD-TRUCK ?auto_3038431 ?auto_3038432 ?auto_3038430 )
      ( DELIVER-1PKG-VERIFY ?auto_3038431 ?auto_3038430 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3038452 - OBJ
      ?auto_3038453 - OBJ
      ?auto_3038451 - LOCATION
    )
    :vars
    (
      ?auto_3038456 - LOCATION
      ?auto_3038454 - CITY
      ?auto_3038455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3038456 ?auto_3038454 ) ( IN-CITY ?auto_3038451 ?auto_3038454 ) ( not ( = ?auto_3038451 ?auto_3038456 ) ) ( OBJ-AT ?auto_3038453 ?auto_3038456 ) ( OBJ-AT ?auto_3038452 ?auto_3038456 ) ( TRUCK-AT ?auto_3038455 ?auto_3038451 ) ( not ( = ?auto_3038452 ?auto_3038453 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3038452 ?auto_3038451 )
      ( DELIVER-1PKG ?auto_3038453 ?auto_3038451 )
      ( DELIVER-2PKG-VERIFY ?auto_3038452 ?auto_3038453 ?auto_3038451 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3038560 - OBJ
      ?auto_3038561 - OBJ
      ?auto_3038562 - OBJ
      ?auto_3038559 - LOCATION
    )
    :vars
    (
      ?auto_3038565 - LOCATION
      ?auto_3038564 - CITY
      ?auto_3038566 - LOCATION
      ?auto_3038563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3038565 ?auto_3038564 ) ( IN-CITY ?auto_3038559 ?auto_3038564 ) ( not ( = ?auto_3038559 ?auto_3038565 ) ) ( OBJ-AT ?auto_3038562 ?auto_3038565 ) ( IN-CITY ?auto_3038566 ?auto_3038564 ) ( not ( = ?auto_3038559 ?auto_3038566 ) ) ( OBJ-AT ?auto_3038561 ?auto_3038566 ) ( OBJ-AT ?auto_3038560 ?auto_3038566 ) ( TRUCK-AT ?auto_3038563 ?auto_3038559 ) ( not ( = ?auto_3038560 ?auto_3038561 ) ) ( not ( = ?auto_3038560 ?auto_3038562 ) ) ( not ( = ?auto_3038561 ?auto_3038562 ) ) ( not ( = ?auto_3038565 ?auto_3038566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3038560 ?auto_3038561 ?auto_3038559 )
      ( DELIVER-1PKG ?auto_3038562 ?auto_3038559 )
      ( DELIVER-3PKG-VERIFY ?auto_3038560 ?auto_3038561 ?auto_3038562 ?auto_3038559 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3038577 - OBJ
      ?auto_3038578 - OBJ
      ?auto_3038579 - OBJ
      ?auto_3038576 - LOCATION
    )
    :vars
    (
      ?auto_3038581 - LOCATION
      ?auto_3038582 - CITY
      ?auto_3038583 - LOCATION
      ?auto_3038580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3038581 ?auto_3038582 ) ( IN-CITY ?auto_3038576 ?auto_3038582 ) ( not ( = ?auto_3038576 ?auto_3038581 ) ) ( OBJ-AT ?auto_3038578 ?auto_3038581 ) ( IN-CITY ?auto_3038583 ?auto_3038582 ) ( not ( = ?auto_3038576 ?auto_3038583 ) ) ( OBJ-AT ?auto_3038579 ?auto_3038583 ) ( OBJ-AT ?auto_3038577 ?auto_3038583 ) ( TRUCK-AT ?auto_3038580 ?auto_3038576 ) ( not ( = ?auto_3038577 ?auto_3038579 ) ) ( not ( = ?auto_3038577 ?auto_3038578 ) ) ( not ( = ?auto_3038579 ?auto_3038578 ) ) ( not ( = ?auto_3038581 ?auto_3038583 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3038577 ?auto_3038579 ?auto_3038578 ?auto_3038576 )
      ( DELIVER-3PKG-VERIFY ?auto_3038577 ?auto_3038578 ?auto_3038579 ?auto_3038576 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3038638 - OBJ
      ?auto_3038639 - OBJ
      ?auto_3038640 - OBJ
      ?auto_3038637 - LOCATION
    )
    :vars
    (
      ?auto_3038641 - LOCATION
      ?auto_3038642 - CITY
      ?auto_3038643 - LOCATION
      ?auto_3038644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3038641 ?auto_3038642 ) ( IN-CITY ?auto_3038637 ?auto_3038642 ) ( not ( = ?auto_3038637 ?auto_3038641 ) ) ( OBJ-AT ?auto_3038638 ?auto_3038641 ) ( IN-CITY ?auto_3038643 ?auto_3038642 ) ( not ( = ?auto_3038637 ?auto_3038643 ) ) ( OBJ-AT ?auto_3038640 ?auto_3038643 ) ( OBJ-AT ?auto_3038639 ?auto_3038643 ) ( TRUCK-AT ?auto_3038644 ?auto_3038637 ) ( not ( = ?auto_3038639 ?auto_3038640 ) ) ( not ( = ?auto_3038639 ?auto_3038638 ) ) ( not ( = ?auto_3038640 ?auto_3038638 ) ) ( not ( = ?auto_3038641 ?auto_3038643 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3038639 ?auto_3038638 ?auto_3038640 ?auto_3038637 )
      ( DELIVER-3PKG-VERIFY ?auto_3038638 ?auto_3038639 ?auto_3038640 ?auto_3038637 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3039680 - OBJ
      ?auto_3039681 - OBJ
      ?auto_3039682 - OBJ
      ?auto_3039683 - OBJ
      ?auto_3039679 - LOCATION
    )
    :vars
    (
      ?auto_3039685 - LOCATION
      ?auto_3039686 - CITY
      ?auto_3039687 - LOCATION
      ?auto_3039684 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3039685 ?auto_3039686 ) ( IN-CITY ?auto_3039679 ?auto_3039686 ) ( not ( = ?auto_3039679 ?auto_3039685 ) ) ( OBJ-AT ?auto_3039683 ?auto_3039685 ) ( IN-CITY ?auto_3039687 ?auto_3039686 ) ( not ( = ?auto_3039679 ?auto_3039687 ) ) ( OBJ-AT ?auto_3039682 ?auto_3039687 ) ( OBJ-AT ?auto_3039681 ?auto_3039685 ) ( OBJ-AT ?auto_3039680 ?auto_3039685 ) ( TRUCK-AT ?auto_3039684 ?auto_3039679 ) ( not ( = ?auto_3039680 ?auto_3039681 ) ) ( not ( = ?auto_3039680 ?auto_3039682 ) ) ( not ( = ?auto_3039681 ?auto_3039682 ) ) ( not ( = ?auto_3039687 ?auto_3039685 ) ) ( not ( = ?auto_3039680 ?auto_3039683 ) ) ( not ( = ?auto_3039681 ?auto_3039683 ) ) ( not ( = ?auto_3039682 ?auto_3039683 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3039680 ?auto_3039682 ?auto_3039681 ?auto_3039679 )
      ( DELIVER-1PKG ?auto_3039683 ?auto_3039679 )
      ( DELIVER-4PKG-VERIFY ?auto_3039680 ?auto_3039681 ?auto_3039682 ?auto_3039683 ?auto_3039679 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3039709 - OBJ
      ?auto_3039710 - OBJ
      ?auto_3039711 - OBJ
      ?auto_3039712 - OBJ
      ?auto_3039708 - LOCATION
    )
    :vars
    (
      ?auto_3039716 - LOCATION
      ?auto_3039714 - CITY
      ?auto_3039713 - LOCATION
      ?auto_3039715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3039716 ?auto_3039714 ) ( IN-CITY ?auto_3039708 ?auto_3039714 ) ( not ( = ?auto_3039708 ?auto_3039716 ) ) ( OBJ-AT ?auto_3039711 ?auto_3039716 ) ( IN-CITY ?auto_3039713 ?auto_3039714 ) ( not ( = ?auto_3039708 ?auto_3039713 ) ) ( OBJ-AT ?auto_3039712 ?auto_3039713 ) ( OBJ-AT ?auto_3039710 ?auto_3039716 ) ( OBJ-AT ?auto_3039709 ?auto_3039716 ) ( TRUCK-AT ?auto_3039715 ?auto_3039708 ) ( not ( = ?auto_3039709 ?auto_3039710 ) ) ( not ( = ?auto_3039709 ?auto_3039712 ) ) ( not ( = ?auto_3039710 ?auto_3039712 ) ) ( not ( = ?auto_3039713 ?auto_3039716 ) ) ( not ( = ?auto_3039709 ?auto_3039711 ) ) ( not ( = ?auto_3039710 ?auto_3039711 ) ) ( not ( = ?auto_3039712 ?auto_3039711 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3039709 ?auto_3039710 ?auto_3039712 ?auto_3039711 ?auto_3039708 )
      ( DELIVER-4PKG-VERIFY ?auto_3039709 ?auto_3039710 ?auto_3039711 ?auto_3039712 ?auto_3039708 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3039738 - OBJ
      ?auto_3039739 - OBJ
      ?auto_3039740 - OBJ
      ?auto_3039741 - OBJ
      ?auto_3039737 - LOCATION
    )
    :vars
    (
      ?auto_3039743 - LOCATION
      ?auto_3039742 - CITY
      ?auto_3039744 - LOCATION
      ?auto_3039745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3039743 ?auto_3039742 ) ( IN-CITY ?auto_3039737 ?auto_3039742 ) ( not ( = ?auto_3039737 ?auto_3039743 ) ) ( OBJ-AT ?auto_3039741 ?auto_3039743 ) ( IN-CITY ?auto_3039744 ?auto_3039742 ) ( not ( = ?auto_3039737 ?auto_3039744 ) ) ( OBJ-AT ?auto_3039739 ?auto_3039744 ) ( OBJ-AT ?auto_3039740 ?auto_3039743 ) ( OBJ-AT ?auto_3039738 ?auto_3039743 ) ( TRUCK-AT ?auto_3039745 ?auto_3039737 ) ( not ( = ?auto_3039738 ?auto_3039740 ) ) ( not ( = ?auto_3039738 ?auto_3039739 ) ) ( not ( = ?auto_3039740 ?auto_3039739 ) ) ( not ( = ?auto_3039744 ?auto_3039743 ) ) ( not ( = ?auto_3039738 ?auto_3039741 ) ) ( not ( = ?auto_3039740 ?auto_3039741 ) ) ( not ( = ?auto_3039739 ?auto_3039741 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3039738 ?auto_3039740 ?auto_3039741 ?auto_3039739 ?auto_3039737 )
      ( DELIVER-4PKG-VERIFY ?auto_3039738 ?auto_3039739 ?auto_3039740 ?auto_3039741 ?auto_3039737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3040303 - OBJ
      ?auto_3040304 - OBJ
      ?auto_3040305 - OBJ
      ?auto_3040306 - OBJ
      ?auto_3040302 - LOCATION
    )
    :vars
    (
      ?auto_3040308 - LOCATION
      ?auto_3040307 - CITY
      ?auto_3040309 - LOCATION
      ?auto_3040310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3040308 ?auto_3040307 ) ( IN-CITY ?auto_3040302 ?auto_3040307 ) ( not ( = ?auto_3040302 ?auto_3040308 ) ) ( OBJ-AT ?auto_3040306 ?auto_3040308 ) ( IN-CITY ?auto_3040309 ?auto_3040307 ) ( not ( = ?auto_3040302 ?auto_3040309 ) ) ( OBJ-AT ?auto_3040303 ?auto_3040309 ) ( OBJ-AT ?auto_3040305 ?auto_3040308 ) ( OBJ-AT ?auto_3040304 ?auto_3040308 ) ( TRUCK-AT ?auto_3040310 ?auto_3040302 ) ( not ( = ?auto_3040304 ?auto_3040305 ) ) ( not ( = ?auto_3040304 ?auto_3040303 ) ) ( not ( = ?auto_3040305 ?auto_3040303 ) ) ( not ( = ?auto_3040309 ?auto_3040308 ) ) ( not ( = ?auto_3040304 ?auto_3040306 ) ) ( not ( = ?auto_3040305 ?auto_3040306 ) ) ( not ( = ?auto_3040303 ?auto_3040306 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3040304 ?auto_3040305 ?auto_3040306 ?auto_3040303 ?auto_3040302 )
      ( DELIVER-4PKG-VERIFY ?auto_3040303 ?auto_3040304 ?auto_3040305 ?auto_3040306 ?auto_3040302 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3054852 - OBJ
      ?auto_3054853 - OBJ
      ?auto_3054854 - OBJ
      ?auto_3054855 - OBJ
      ?auto_3054856 - OBJ
      ?auto_3054851 - LOCATION
    )
    :vars
    (
      ?auto_3054858 - LOCATION
      ?auto_3054857 - CITY
      ?auto_3054860 - LOCATION
      ?auto_3054859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3054858 ?auto_3054857 ) ( IN-CITY ?auto_3054851 ?auto_3054857 ) ( not ( = ?auto_3054851 ?auto_3054858 ) ) ( OBJ-AT ?auto_3054856 ?auto_3054858 ) ( IN-CITY ?auto_3054860 ?auto_3054857 ) ( not ( = ?auto_3054851 ?auto_3054860 ) ) ( OBJ-AT ?auto_3054855 ?auto_3054860 ) ( OBJ-AT ?auto_3054854 ?auto_3054858 ) ( OBJ-AT ?auto_3054853 ?auto_3054860 ) ( OBJ-AT ?auto_3054852 ?auto_3054860 ) ( TRUCK-AT ?auto_3054859 ?auto_3054851 ) ( not ( = ?auto_3054852 ?auto_3054853 ) ) ( not ( = ?auto_3054852 ?auto_3054854 ) ) ( not ( = ?auto_3054853 ?auto_3054854 ) ) ( not ( = ?auto_3054858 ?auto_3054860 ) ) ( not ( = ?auto_3054852 ?auto_3054855 ) ) ( not ( = ?auto_3054853 ?auto_3054855 ) ) ( not ( = ?auto_3054854 ?auto_3054855 ) ) ( not ( = ?auto_3054852 ?auto_3054856 ) ) ( not ( = ?auto_3054853 ?auto_3054856 ) ) ( not ( = ?auto_3054854 ?auto_3054856 ) ) ( not ( = ?auto_3054855 ?auto_3054856 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3054852 ?auto_3054853 ?auto_3054855 ?auto_3054854 ?auto_3054851 )
      ( DELIVER-1PKG ?auto_3054856 ?auto_3054851 )
      ( DELIVER-5PKG-VERIFY ?auto_3054852 ?auto_3054853 ?auto_3054854 ?auto_3054855 ?auto_3054856 ?auto_3054851 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3054895 - OBJ
      ?auto_3054896 - OBJ
      ?auto_3054897 - OBJ
      ?auto_3054898 - OBJ
      ?auto_3054899 - OBJ
      ?auto_3054894 - LOCATION
    )
    :vars
    (
      ?auto_3054900 - LOCATION
      ?auto_3054901 - CITY
      ?auto_3054902 - LOCATION
      ?auto_3054903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3054900 ?auto_3054901 ) ( IN-CITY ?auto_3054894 ?auto_3054901 ) ( not ( = ?auto_3054894 ?auto_3054900 ) ) ( OBJ-AT ?auto_3054898 ?auto_3054900 ) ( IN-CITY ?auto_3054902 ?auto_3054901 ) ( not ( = ?auto_3054894 ?auto_3054902 ) ) ( OBJ-AT ?auto_3054899 ?auto_3054902 ) ( OBJ-AT ?auto_3054897 ?auto_3054900 ) ( OBJ-AT ?auto_3054896 ?auto_3054902 ) ( OBJ-AT ?auto_3054895 ?auto_3054902 ) ( TRUCK-AT ?auto_3054903 ?auto_3054894 ) ( not ( = ?auto_3054895 ?auto_3054896 ) ) ( not ( = ?auto_3054895 ?auto_3054897 ) ) ( not ( = ?auto_3054896 ?auto_3054897 ) ) ( not ( = ?auto_3054900 ?auto_3054902 ) ) ( not ( = ?auto_3054895 ?auto_3054899 ) ) ( not ( = ?auto_3054896 ?auto_3054899 ) ) ( not ( = ?auto_3054897 ?auto_3054899 ) ) ( not ( = ?auto_3054895 ?auto_3054898 ) ) ( not ( = ?auto_3054896 ?auto_3054898 ) ) ( not ( = ?auto_3054897 ?auto_3054898 ) ) ( not ( = ?auto_3054899 ?auto_3054898 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3054895 ?auto_3054896 ?auto_3054897 ?auto_3054899 ?auto_3054898 ?auto_3054894 )
      ( DELIVER-5PKG-VERIFY ?auto_3054895 ?auto_3054896 ?auto_3054897 ?auto_3054898 ?auto_3054899 ?auto_3054894 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3054938 - OBJ
      ?auto_3054939 - OBJ
      ?auto_3054940 - OBJ
      ?auto_3054941 - OBJ
      ?auto_3054942 - OBJ
      ?auto_3054937 - LOCATION
    )
    :vars
    (
      ?auto_3054945 - LOCATION
      ?auto_3054943 - CITY
      ?auto_3054944 - LOCATION
      ?auto_3054946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3054945 ?auto_3054943 ) ( IN-CITY ?auto_3054937 ?auto_3054943 ) ( not ( = ?auto_3054937 ?auto_3054945 ) ) ( OBJ-AT ?auto_3054942 ?auto_3054945 ) ( IN-CITY ?auto_3054944 ?auto_3054943 ) ( not ( = ?auto_3054937 ?auto_3054944 ) ) ( OBJ-AT ?auto_3054940 ?auto_3054944 ) ( OBJ-AT ?auto_3054941 ?auto_3054945 ) ( OBJ-AT ?auto_3054939 ?auto_3054944 ) ( OBJ-AT ?auto_3054938 ?auto_3054944 ) ( TRUCK-AT ?auto_3054946 ?auto_3054937 ) ( not ( = ?auto_3054938 ?auto_3054939 ) ) ( not ( = ?auto_3054938 ?auto_3054941 ) ) ( not ( = ?auto_3054939 ?auto_3054941 ) ) ( not ( = ?auto_3054945 ?auto_3054944 ) ) ( not ( = ?auto_3054938 ?auto_3054940 ) ) ( not ( = ?auto_3054939 ?auto_3054940 ) ) ( not ( = ?auto_3054941 ?auto_3054940 ) ) ( not ( = ?auto_3054938 ?auto_3054942 ) ) ( not ( = ?auto_3054939 ?auto_3054942 ) ) ( not ( = ?auto_3054941 ?auto_3054942 ) ) ( not ( = ?auto_3054940 ?auto_3054942 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3054938 ?auto_3054939 ?auto_3054941 ?auto_3054942 ?auto_3054940 ?auto_3054937 )
      ( DELIVER-5PKG-VERIFY ?auto_3054938 ?auto_3054939 ?auto_3054940 ?auto_3054941 ?auto_3054942 ?auto_3054937 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3055420 - OBJ
      ?auto_3055421 - OBJ
      ?auto_3055422 - OBJ
      ?auto_3055423 - OBJ
      ?auto_3055424 - OBJ
      ?auto_3055419 - LOCATION
    )
    :vars
    (
      ?auto_3055427 - LOCATION
      ?auto_3055425 - CITY
      ?auto_3055426 - LOCATION
      ?auto_3055428 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3055427 ?auto_3055425 ) ( IN-CITY ?auto_3055419 ?auto_3055425 ) ( not ( = ?auto_3055419 ?auto_3055427 ) ) ( OBJ-AT ?auto_3055424 ?auto_3055427 ) ( IN-CITY ?auto_3055426 ?auto_3055425 ) ( not ( = ?auto_3055419 ?auto_3055426 ) ) ( OBJ-AT ?auto_3055423 ?auto_3055426 ) ( OBJ-AT ?auto_3055421 ?auto_3055427 ) ( OBJ-AT ?auto_3055422 ?auto_3055426 ) ( OBJ-AT ?auto_3055420 ?auto_3055426 ) ( TRUCK-AT ?auto_3055428 ?auto_3055419 ) ( not ( = ?auto_3055420 ?auto_3055422 ) ) ( not ( = ?auto_3055420 ?auto_3055421 ) ) ( not ( = ?auto_3055422 ?auto_3055421 ) ) ( not ( = ?auto_3055427 ?auto_3055426 ) ) ( not ( = ?auto_3055420 ?auto_3055423 ) ) ( not ( = ?auto_3055422 ?auto_3055423 ) ) ( not ( = ?auto_3055421 ?auto_3055423 ) ) ( not ( = ?auto_3055420 ?auto_3055424 ) ) ( not ( = ?auto_3055422 ?auto_3055424 ) ) ( not ( = ?auto_3055421 ?auto_3055424 ) ) ( not ( = ?auto_3055423 ?auto_3055424 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3055420 ?auto_3055422 ?auto_3055421 ?auto_3055424 ?auto_3055423 ?auto_3055419 )
      ( DELIVER-5PKG-VERIFY ?auto_3055420 ?auto_3055421 ?auto_3055422 ?auto_3055423 ?auto_3055424 ?auto_3055419 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3055463 - OBJ
      ?auto_3055464 - OBJ
      ?auto_3055465 - OBJ
      ?auto_3055466 - OBJ
      ?auto_3055467 - OBJ
      ?auto_3055462 - LOCATION
    )
    :vars
    (
      ?auto_3055470 - LOCATION
      ?auto_3055468 - CITY
      ?auto_3055469 - LOCATION
      ?auto_3055471 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3055470 ?auto_3055468 ) ( IN-CITY ?auto_3055462 ?auto_3055468 ) ( not ( = ?auto_3055462 ?auto_3055470 ) ) ( OBJ-AT ?auto_3055466 ?auto_3055470 ) ( IN-CITY ?auto_3055469 ?auto_3055468 ) ( not ( = ?auto_3055462 ?auto_3055469 ) ) ( OBJ-AT ?auto_3055467 ?auto_3055469 ) ( OBJ-AT ?auto_3055464 ?auto_3055470 ) ( OBJ-AT ?auto_3055465 ?auto_3055469 ) ( OBJ-AT ?auto_3055463 ?auto_3055469 ) ( TRUCK-AT ?auto_3055471 ?auto_3055462 ) ( not ( = ?auto_3055463 ?auto_3055465 ) ) ( not ( = ?auto_3055463 ?auto_3055464 ) ) ( not ( = ?auto_3055465 ?auto_3055464 ) ) ( not ( = ?auto_3055470 ?auto_3055469 ) ) ( not ( = ?auto_3055463 ?auto_3055467 ) ) ( not ( = ?auto_3055465 ?auto_3055467 ) ) ( not ( = ?auto_3055464 ?auto_3055467 ) ) ( not ( = ?auto_3055463 ?auto_3055466 ) ) ( not ( = ?auto_3055465 ?auto_3055466 ) ) ( not ( = ?auto_3055464 ?auto_3055466 ) ) ( not ( = ?auto_3055467 ?auto_3055466 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3055463 ?auto_3055465 ?auto_3055464 ?auto_3055466 ?auto_3055467 ?auto_3055462 )
      ( DELIVER-5PKG-VERIFY ?auto_3055463 ?auto_3055464 ?auto_3055465 ?auto_3055466 ?auto_3055467 ?auto_3055462 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3055768 - OBJ
      ?auto_3055769 - OBJ
      ?auto_3055770 - OBJ
      ?auto_3055771 - OBJ
      ?auto_3055772 - OBJ
      ?auto_3055767 - LOCATION
    )
    :vars
    (
      ?auto_3055775 - LOCATION
      ?auto_3055773 - CITY
      ?auto_3055774 - LOCATION
      ?auto_3055776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3055775 ?auto_3055773 ) ( IN-CITY ?auto_3055767 ?auto_3055773 ) ( not ( = ?auto_3055767 ?auto_3055775 ) ) ( OBJ-AT ?auto_3055770 ?auto_3055775 ) ( IN-CITY ?auto_3055774 ?auto_3055773 ) ( not ( = ?auto_3055767 ?auto_3055774 ) ) ( OBJ-AT ?auto_3055772 ?auto_3055774 ) ( OBJ-AT ?auto_3055769 ?auto_3055775 ) ( OBJ-AT ?auto_3055771 ?auto_3055774 ) ( OBJ-AT ?auto_3055768 ?auto_3055774 ) ( TRUCK-AT ?auto_3055776 ?auto_3055767 ) ( not ( = ?auto_3055768 ?auto_3055771 ) ) ( not ( = ?auto_3055768 ?auto_3055769 ) ) ( not ( = ?auto_3055771 ?auto_3055769 ) ) ( not ( = ?auto_3055775 ?auto_3055774 ) ) ( not ( = ?auto_3055768 ?auto_3055772 ) ) ( not ( = ?auto_3055771 ?auto_3055772 ) ) ( not ( = ?auto_3055769 ?auto_3055772 ) ) ( not ( = ?auto_3055768 ?auto_3055770 ) ) ( not ( = ?auto_3055771 ?auto_3055770 ) ) ( not ( = ?auto_3055769 ?auto_3055770 ) ) ( not ( = ?auto_3055772 ?auto_3055770 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3055768 ?auto_3055771 ?auto_3055769 ?auto_3055770 ?auto_3055772 ?auto_3055767 )
      ( DELIVER-5PKG-VERIFY ?auto_3055768 ?auto_3055769 ?auto_3055770 ?auto_3055771 ?auto_3055772 ?auto_3055767 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3062289 - OBJ
      ?auto_3062290 - OBJ
      ?auto_3062291 - OBJ
      ?auto_3062292 - OBJ
      ?auto_3062293 - OBJ
      ?auto_3062288 - LOCATION
    )
    :vars
    (
      ?auto_3062296 - LOCATION
      ?auto_3062294 - CITY
      ?auto_3062295 - LOCATION
      ?auto_3062297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3062296 ?auto_3062294 ) ( IN-CITY ?auto_3062288 ?auto_3062294 ) ( not ( = ?auto_3062288 ?auto_3062296 ) ) ( OBJ-AT ?auto_3062293 ?auto_3062296 ) ( IN-CITY ?auto_3062295 ?auto_3062294 ) ( not ( = ?auto_3062288 ?auto_3062295 ) ) ( OBJ-AT ?auto_3062292 ?auto_3062295 ) ( OBJ-AT ?auto_3062289 ?auto_3062296 ) ( OBJ-AT ?auto_3062291 ?auto_3062295 ) ( OBJ-AT ?auto_3062290 ?auto_3062295 ) ( TRUCK-AT ?auto_3062297 ?auto_3062288 ) ( not ( = ?auto_3062290 ?auto_3062291 ) ) ( not ( = ?auto_3062290 ?auto_3062289 ) ) ( not ( = ?auto_3062291 ?auto_3062289 ) ) ( not ( = ?auto_3062296 ?auto_3062295 ) ) ( not ( = ?auto_3062290 ?auto_3062292 ) ) ( not ( = ?auto_3062291 ?auto_3062292 ) ) ( not ( = ?auto_3062289 ?auto_3062292 ) ) ( not ( = ?auto_3062290 ?auto_3062293 ) ) ( not ( = ?auto_3062291 ?auto_3062293 ) ) ( not ( = ?auto_3062289 ?auto_3062293 ) ) ( not ( = ?auto_3062292 ?auto_3062293 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3062290 ?auto_3062291 ?auto_3062289 ?auto_3062293 ?auto_3062292 ?auto_3062288 )
      ( DELIVER-5PKG-VERIFY ?auto_3062289 ?auto_3062290 ?auto_3062291 ?auto_3062292 ?auto_3062293 ?auto_3062288 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3062332 - OBJ
      ?auto_3062333 - OBJ
      ?auto_3062334 - OBJ
      ?auto_3062335 - OBJ
      ?auto_3062336 - OBJ
      ?auto_3062331 - LOCATION
    )
    :vars
    (
      ?auto_3062339 - LOCATION
      ?auto_3062337 - CITY
      ?auto_3062338 - LOCATION
      ?auto_3062340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3062339 ?auto_3062337 ) ( IN-CITY ?auto_3062331 ?auto_3062337 ) ( not ( = ?auto_3062331 ?auto_3062339 ) ) ( OBJ-AT ?auto_3062335 ?auto_3062339 ) ( IN-CITY ?auto_3062338 ?auto_3062337 ) ( not ( = ?auto_3062331 ?auto_3062338 ) ) ( OBJ-AT ?auto_3062336 ?auto_3062338 ) ( OBJ-AT ?auto_3062332 ?auto_3062339 ) ( OBJ-AT ?auto_3062334 ?auto_3062338 ) ( OBJ-AT ?auto_3062333 ?auto_3062338 ) ( TRUCK-AT ?auto_3062340 ?auto_3062331 ) ( not ( = ?auto_3062333 ?auto_3062334 ) ) ( not ( = ?auto_3062333 ?auto_3062332 ) ) ( not ( = ?auto_3062334 ?auto_3062332 ) ) ( not ( = ?auto_3062339 ?auto_3062338 ) ) ( not ( = ?auto_3062333 ?auto_3062336 ) ) ( not ( = ?auto_3062334 ?auto_3062336 ) ) ( not ( = ?auto_3062332 ?auto_3062336 ) ) ( not ( = ?auto_3062333 ?auto_3062335 ) ) ( not ( = ?auto_3062334 ?auto_3062335 ) ) ( not ( = ?auto_3062332 ?auto_3062335 ) ) ( not ( = ?auto_3062336 ?auto_3062335 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3062333 ?auto_3062334 ?auto_3062332 ?auto_3062335 ?auto_3062336 ?auto_3062331 )
      ( DELIVER-5PKG-VERIFY ?auto_3062332 ?auto_3062333 ?auto_3062334 ?auto_3062335 ?auto_3062336 ?auto_3062331 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3062637 - OBJ
      ?auto_3062638 - OBJ
      ?auto_3062639 - OBJ
      ?auto_3062640 - OBJ
      ?auto_3062641 - OBJ
      ?auto_3062636 - LOCATION
    )
    :vars
    (
      ?auto_3062644 - LOCATION
      ?auto_3062642 - CITY
      ?auto_3062643 - LOCATION
      ?auto_3062645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3062644 ?auto_3062642 ) ( IN-CITY ?auto_3062636 ?auto_3062642 ) ( not ( = ?auto_3062636 ?auto_3062644 ) ) ( OBJ-AT ?auto_3062639 ?auto_3062644 ) ( IN-CITY ?auto_3062643 ?auto_3062642 ) ( not ( = ?auto_3062636 ?auto_3062643 ) ) ( OBJ-AT ?auto_3062641 ?auto_3062643 ) ( OBJ-AT ?auto_3062637 ?auto_3062644 ) ( OBJ-AT ?auto_3062640 ?auto_3062643 ) ( OBJ-AT ?auto_3062638 ?auto_3062643 ) ( TRUCK-AT ?auto_3062645 ?auto_3062636 ) ( not ( = ?auto_3062638 ?auto_3062640 ) ) ( not ( = ?auto_3062638 ?auto_3062637 ) ) ( not ( = ?auto_3062640 ?auto_3062637 ) ) ( not ( = ?auto_3062644 ?auto_3062643 ) ) ( not ( = ?auto_3062638 ?auto_3062641 ) ) ( not ( = ?auto_3062640 ?auto_3062641 ) ) ( not ( = ?auto_3062637 ?auto_3062641 ) ) ( not ( = ?auto_3062638 ?auto_3062639 ) ) ( not ( = ?auto_3062640 ?auto_3062639 ) ) ( not ( = ?auto_3062637 ?auto_3062639 ) ) ( not ( = ?auto_3062641 ?auto_3062639 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3062638 ?auto_3062640 ?auto_3062637 ?auto_3062639 ?auto_3062641 ?auto_3062636 )
      ( DELIVER-5PKG-VERIFY ?auto_3062637 ?auto_3062638 ?auto_3062639 ?auto_3062640 ?auto_3062641 ?auto_3062636 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3064956 - OBJ
      ?auto_3064957 - OBJ
      ?auto_3064958 - OBJ
      ?auto_3064959 - OBJ
      ?auto_3064960 - OBJ
      ?auto_3064955 - LOCATION
    )
    :vars
    (
      ?auto_3064963 - LOCATION
      ?auto_3064961 - CITY
      ?auto_3064962 - LOCATION
      ?auto_3064964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3064963 ?auto_3064961 ) ( IN-CITY ?auto_3064955 ?auto_3064961 ) ( not ( = ?auto_3064955 ?auto_3064963 ) ) ( OBJ-AT ?auto_3064957 ?auto_3064963 ) ( IN-CITY ?auto_3064962 ?auto_3064961 ) ( not ( = ?auto_3064955 ?auto_3064962 ) ) ( OBJ-AT ?auto_3064960 ?auto_3064962 ) ( OBJ-AT ?auto_3064956 ?auto_3064963 ) ( OBJ-AT ?auto_3064959 ?auto_3064962 ) ( OBJ-AT ?auto_3064958 ?auto_3064962 ) ( TRUCK-AT ?auto_3064964 ?auto_3064955 ) ( not ( = ?auto_3064958 ?auto_3064959 ) ) ( not ( = ?auto_3064958 ?auto_3064956 ) ) ( not ( = ?auto_3064959 ?auto_3064956 ) ) ( not ( = ?auto_3064963 ?auto_3064962 ) ) ( not ( = ?auto_3064958 ?auto_3064960 ) ) ( not ( = ?auto_3064959 ?auto_3064960 ) ) ( not ( = ?auto_3064956 ?auto_3064960 ) ) ( not ( = ?auto_3064958 ?auto_3064957 ) ) ( not ( = ?auto_3064959 ?auto_3064957 ) ) ( not ( = ?auto_3064956 ?auto_3064957 ) ) ( not ( = ?auto_3064960 ?auto_3064957 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3064958 ?auto_3064959 ?auto_3064956 ?auto_3064957 ?auto_3064960 ?auto_3064955 )
      ( DELIVER-5PKG-VERIFY ?auto_3064956 ?auto_3064957 ?auto_3064958 ?auto_3064959 ?auto_3064960 ?auto_3064955 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3307388 - OBJ
      ?auto_3307389 - OBJ
      ?auto_3307390 - OBJ
      ?auto_3307391 - OBJ
      ?auto_3307392 - OBJ
      ?auto_3307393 - OBJ
      ?auto_3307387 - LOCATION
    )
    :vars
    (
      ?auto_3307396 - LOCATION
      ?auto_3307395 - CITY
      ?auto_3307398 - LOCATION
      ?auto_3307397 - LOCATION
      ?auto_3307394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3307396 ?auto_3307395 ) ( IN-CITY ?auto_3307387 ?auto_3307395 ) ( not ( = ?auto_3307387 ?auto_3307396 ) ) ( OBJ-AT ?auto_3307393 ?auto_3307396 ) ( IN-CITY ?auto_3307398 ?auto_3307395 ) ( not ( = ?auto_3307387 ?auto_3307398 ) ) ( OBJ-AT ?auto_3307392 ?auto_3307398 ) ( IN-CITY ?auto_3307397 ?auto_3307395 ) ( not ( = ?auto_3307387 ?auto_3307397 ) ) ( OBJ-AT ?auto_3307391 ?auto_3307397 ) ( OBJ-AT ?auto_3307390 ?auto_3307398 ) ( OBJ-AT ?auto_3307389 ?auto_3307397 ) ( OBJ-AT ?auto_3307388 ?auto_3307397 ) ( TRUCK-AT ?auto_3307394 ?auto_3307387 ) ( not ( = ?auto_3307388 ?auto_3307389 ) ) ( not ( = ?auto_3307388 ?auto_3307390 ) ) ( not ( = ?auto_3307389 ?auto_3307390 ) ) ( not ( = ?auto_3307398 ?auto_3307397 ) ) ( not ( = ?auto_3307388 ?auto_3307391 ) ) ( not ( = ?auto_3307389 ?auto_3307391 ) ) ( not ( = ?auto_3307390 ?auto_3307391 ) ) ( not ( = ?auto_3307388 ?auto_3307392 ) ) ( not ( = ?auto_3307389 ?auto_3307392 ) ) ( not ( = ?auto_3307390 ?auto_3307392 ) ) ( not ( = ?auto_3307391 ?auto_3307392 ) ) ( not ( = ?auto_3307388 ?auto_3307393 ) ) ( not ( = ?auto_3307389 ?auto_3307393 ) ) ( not ( = ?auto_3307390 ?auto_3307393 ) ) ( not ( = ?auto_3307391 ?auto_3307393 ) ) ( not ( = ?auto_3307392 ?auto_3307393 ) ) ( not ( = ?auto_3307396 ?auto_3307398 ) ) ( not ( = ?auto_3307396 ?auto_3307397 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3307388 ?auto_3307389 ?auto_3307390 ?auto_3307392 ?auto_3307391 ?auto_3307387 )
      ( DELIVER-1PKG ?auto_3307393 ?auto_3307387 )
      ( DELIVER-6PKG-VERIFY ?auto_3307388 ?auto_3307389 ?auto_3307390 ?auto_3307391 ?auto_3307392 ?auto_3307393 ?auto_3307387 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3307452 - OBJ
      ?auto_3307453 - OBJ
      ?auto_3307454 - OBJ
      ?auto_3307455 - OBJ
      ?auto_3307456 - OBJ
      ?auto_3307457 - OBJ
      ?auto_3307451 - LOCATION
    )
    :vars
    (
      ?auto_3307462 - LOCATION
      ?auto_3307461 - CITY
      ?auto_3307458 - LOCATION
      ?auto_3307459 - LOCATION
      ?auto_3307460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3307462 ?auto_3307461 ) ( IN-CITY ?auto_3307451 ?auto_3307461 ) ( not ( = ?auto_3307451 ?auto_3307462 ) ) ( OBJ-AT ?auto_3307456 ?auto_3307462 ) ( IN-CITY ?auto_3307458 ?auto_3307461 ) ( not ( = ?auto_3307451 ?auto_3307458 ) ) ( OBJ-AT ?auto_3307457 ?auto_3307458 ) ( IN-CITY ?auto_3307459 ?auto_3307461 ) ( not ( = ?auto_3307451 ?auto_3307459 ) ) ( OBJ-AT ?auto_3307455 ?auto_3307459 ) ( OBJ-AT ?auto_3307454 ?auto_3307458 ) ( OBJ-AT ?auto_3307453 ?auto_3307459 ) ( OBJ-AT ?auto_3307452 ?auto_3307459 ) ( TRUCK-AT ?auto_3307460 ?auto_3307451 ) ( not ( = ?auto_3307452 ?auto_3307453 ) ) ( not ( = ?auto_3307452 ?auto_3307454 ) ) ( not ( = ?auto_3307453 ?auto_3307454 ) ) ( not ( = ?auto_3307458 ?auto_3307459 ) ) ( not ( = ?auto_3307452 ?auto_3307455 ) ) ( not ( = ?auto_3307453 ?auto_3307455 ) ) ( not ( = ?auto_3307454 ?auto_3307455 ) ) ( not ( = ?auto_3307452 ?auto_3307457 ) ) ( not ( = ?auto_3307453 ?auto_3307457 ) ) ( not ( = ?auto_3307454 ?auto_3307457 ) ) ( not ( = ?auto_3307455 ?auto_3307457 ) ) ( not ( = ?auto_3307452 ?auto_3307456 ) ) ( not ( = ?auto_3307453 ?auto_3307456 ) ) ( not ( = ?auto_3307454 ?auto_3307456 ) ) ( not ( = ?auto_3307455 ?auto_3307456 ) ) ( not ( = ?auto_3307457 ?auto_3307456 ) ) ( not ( = ?auto_3307462 ?auto_3307458 ) ) ( not ( = ?auto_3307462 ?auto_3307459 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3307452 ?auto_3307453 ?auto_3307454 ?auto_3307455 ?auto_3307457 ?auto_3307456 ?auto_3307451 )
      ( DELIVER-6PKG-VERIFY ?auto_3307452 ?auto_3307453 ?auto_3307454 ?auto_3307455 ?auto_3307456 ?auto_3307457 ?auto_3307451 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3307516 - OBJ
      ?auto_3307517 - OBJ
      ?auto_3307518 - OBJ
      ?auto_3307519 - OBJ
      ?auto_3307520 - OBJ
      ?auto_3307521 - OBJ
      ?auto_3307515 - LOCATION
    )
    :vars
    (
      ?auto_3307524 - LOCATION
      ?auto_3307526 - CITY
      ?auto_3307525 - LOCATION
      ?auto_3307522 - LOCATION
      ?auto_3307523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3307524 ?auto_3307526 ) ( IN-CITY ?auto_3307515 ?auto_3307526 ) ( not ( = ?auto_3307515 ?auto_3307524 ) ) ( OBJ-AT ?auto_3307521 ?auto_3307524 ) ( IN-CITY ?auto_3307525 ?auto_3307526 ) ( not ( = ?auto_3307515 ?auto_3307525 ) ) ( OBJ-AT ?auto_3307519 ?auto_3307525 ) ( IN-CITY ?auto_3307522 ?auto_3307526 ) ( not ( = ?auto_3307515 ?auto_3307522 ) ) ( OBJ-AT ?auto_3307520 ?auto_3307522 ) ( OBJ-AT ?auto_3307518 ?auto_3307525 ) ( OBJ-AT ?auto_3307517 ?auto_3307522 ) ( OBJ-AT ?auto_3307516 ?auto_3307522 ) ( TRUCK-AT ?auto_3307523 ?auto_3307515 ) ( not ( = ?auto_3307516 ?auto_3307517 ) ) ( not ( = ?auto_3307516 ?auto_3307518 ) ) ( not ( = ?auto_3307517 ?auto_3307518 ) ) ( not ( = ?auto_3307525 ?auto_3307522 ) ) ( not ( = ?auto_3307516 ?auto_3307520 ) ) ( not ( = ?auto_3307517 ?auto_3307520 ) ) ( not ( = ?auto_3307518 ?auto_3307520 ) ) ( not ( = ?auto_3307516 ?auto_3307519 ) ) ( not ( = ?auto_3307517 ?auto_3307519 ) ) ( not ( = ?auto_3307518 ?auto_3307519 ) ) ( not ( = ?auto_3307520 ?auto_3307519 ) ) ( not ( = ?auto_3307516 ?auto_3307521 ) ) ( not ( = ?auto_3307517 ?auto_3307521 ) ) ( not ( = ?auto_3307518 ?auto_3307521 ) ) ( not ( = ?auto_3307520 ?auto_3307521 ) ) ( not ( = ?auto_3307519 ?auto_3307521 ) ) ( not ( = ?auto_3307524 ?auto_3307525 ) ) ( not ( = ?auto_3307524 ?auto_3307522 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3307516 ?auto_3307517 ?auto_3307518 ?auto_3307520 ?auto_3307521 ?auto_3307519 ?auto_3307515 )
      ( DELIVER-6PKG-VERIFY ?auto_3307516 ?auto_3307517 ?auto_3307518 ?auto_3307519 ?auto_3307520 ?auto_3307521 ?auto_3307515 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3307580 - OBJ
      ?auto_3307581 - OBJ
      ?auto_3307582 - OBJ
      ?auto_3307583 - OBJ
      ?auto_3307584 - OBJ
      ?auto_3307585 - OBJ
      ?auto_3307579 - LOCATION
    )
    :vars
    (
      ?auto_3307588 - LOCATION
      ?auto_3307590 - CITY
      ?auto_3307589 - LOCATION
      ?auto_3307586 - LOCATION
      ?auto_3307587 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3307588 ?auto_3307590 ) ( IN-CITY ?auto_3307579 ?auto_3307590 ) ( not ( = ?auto_3307579 ?auto_3307588 ) ) ( OBJ-AT ?auto_3307584 ?auto_3307588 ) ( IN-CITY ?auto_3307589 ?auto_3307590 ) ( not ( = ?auto_3307579 ?auto_3307589 ) ) ( OBJ-AT ?auto_3307583 ?auto_3307589 ) ( IN-CITY ?auto_3307586 ?auto_3307590 ) ( not ( = ?auto_3307579 ?auto_3307586 ) ) ( OBJ-AT ?auto_3307585 ?auto_3307586 ) ( OBJ-AT ?auto_3307582 ?auto_3307589 ) ( OBJ-AT ?auto_3307581 ?auto_3307586 ) ( OBJ-AT ?auto_3307580 ?auto_3307586 ) ( TRUCK-AT ?auto_3307587 ?auto_3307579 ) ( not ( = ?auto_3307580 ?auto_3307581 ) ) ( not ( = ?auto_3307580 ?auto_3307582 ) ) ( not ( = ?auto_3307581 ?auto_3307582 ) ) ( not ( = ?auto_3307589 ?auto_3307586 ) ) ( not ( = ?auto_3307580 ?auto_3307585 ) ) ( not ( = ?auto_3307581 ?auto_3307585 ) ) ( not ( = ?auto_3307582 ?auto_3307585 ) ) ( not ( = ?auto_3307580 ?auto_3307583 ) ) ( not ( = ?auto_3307581 ?auto_3307583 ) ) ( not ( = ?auto_3307582 ?auto_3307583 ) ) ( not ( = ?auto_3307585 ?auto_3307583 ) ) ( not ( = ?auto_3307580 ?auto_3307584 ) ) ( not ( = ?auto_3307581 ?auto_3307584 ) ) ( not ( = ?auto_3307582 ?auto_3307584 ) ) ( not ( = ?auto_3307585 ?auto_3307584 ) ) ( not ( = ?auto_3307583 ?auto_3307584 ) ) ( not ( = ?auto_3307588 ?auto_3307589 ) ) ( not ( = ?auto_3307588 ?auto_3307586 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3307580 ?auto_3307581 ?auto_3307582 ?auto_3307585 ?auto_3307584 ?auto_3307583 ?auto_3307579 )
      ( DELIVER-6PKG-VERIFY ?auto_3307580 ?auto_3307581 ?auto_3307582 ?auto_3307583 ?auto_3307584 ?auto_3307585 ?auto_3307579 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3307916 - OBJ
      ?auto_3307917 - OBJ
      ?auto_3307918 - OBJ
      ?auto_3307919 - OBJ
      ?auto_3307920 - OBJ
      ?auto_3307921 - OBJ
      ?auto_3307915 - LOCATION
    )
    :vars
    (
      ?auto_3307924 - LOCATION
      ?auto_3307926 - CITY
      ?auto_3307925 - LOCATION
      ?auto_3307922 - LOCATION
      ?auto_3307923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3307924 ?auto_3307926 ) ( IN-CITY ?auto_3307915 ?auto_3307926 ) ( not ( = ?auto_3307915 ?auto_3307924 ) ) ( OBJ-AT ?auto_3307919 ?auto_3307924 ) ( IN-CITY ?auto_3307925 ?auto_3307926 ) ( not ( = ?auto_3307915 ?auto_3307925 ) ) ( OBJ-AT ?auto_3307921 ?auto_3307925 ) ( IN-CITY ?auto_3307922 ?auto_3307926 ) ( not ( = ?auto_3307915 ?auto_3307922 ) ) ( OBJ-AT ?auto_3307920 ?auto_3307922 ) ( OBJ-AT ?auto_3307918 ?auto_3307925 ) ( OBJ-AT ?auto_3307917 ?auto_3307922 ) ( OBJ-AT ?auto_3307916 ?auto_3307922 ) ( TRUCK-AT ?auto_3307923 ?auto_3307915 ) ( not ( = ?auto_3307916 ?auto_3307917 ) ) ( not ( = ?auto_3307916 ?auto_3307918 ) ) ( not ( = ?auto_3307917 ?auto_3307918 ) ) ( not ( = ?auto_3307925 ?auto_3307922 ) ) ( not ( = ?auto_3307916 ?auto_3307920 ) ) ( not ( = ?auto_3307917 ?auto_3307920 ) ) ( not ( = ?auto_3307918 ?auto_3307920 ) ) ( not ( = ?auto_3307916 ?auto_3307921 ) ) ( not ( = ?auto_3307917 ?auto_3307921 ) ) ( not ( = ?auto_3307918 ?auto_3307921 ) ) ( not ( = ?auto_3307920 ?auto_3307921 ) ) ( not ( = ?auto_3307916 ?auto_3307919 ) ) ( not ( = ?auto_3307917 ?auto_3307919 ) ) ( not ( = ?auto_3307918 ?auto_3307919 ) ) ( not ( = ?auto_3307920 ?auto_3307919 ) ) ( not ( = ?auto_3307921 ?auto_3307919 ) ) ( not ( = ?auto_3307924 ?auto_3307925 ) ) ( not ( = ?auto_3307924 ?auto_3307922 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3307916 ?auto_3307917 ?auto_3307918 ?auto_3307920 ?auto_3307919 ?auto_3307921 ?auto_3307915 )
      ( DELIVER-6PKG-VERIFY ?auto_3307916 ?auto_3307917 ?auto_3307918 ?auto_3307919 ?auto_3307920 ?auto_3307921 ?auto_3307915 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3307980 - OBJ
      ?auto_3307981 - OBJ
      ?auto_3307982 - OBJ
      ?auto_3307983 - OBJ
      ?auto_3307984 - OBJ
      ?auto_3307985 - OBJ
      ?auto_3307979 - LOCATION
    )
    :vars
    (
      ?auto_3307988 - LOCATION
      ?auto_3307990 - CITY
      ?auto_3307989 - LOCATION
      ?auto_3307986 - LOCATION
      ?auto_3307987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3307988 ?auto_3307990 ) ( IN-CITY ?auto_3307979 ?auto_3307990 ) ( not ( = ?auto_3307979 ?auto_3307988 ) ) ( OBJ-AT ?auto_3307983 ?auto_3307988 ) ( IN-CITY ?auto_3307989 ?auto_3307990 ) ( not ( = ?auto_3307979 ?auto_3307989 ) ) ( OBJ-AT ?auto_3307984 ?auto_3307989 ) ( IN-CITY ?auto_3307986 ?auto_3307990 ) ( not ( = ?auto_3307979 ?auto_3307986 ) ) ( OBJ-AT ?auto_3307985 ?auto_3307986 ) ( OBJ-AT ?auto_3307982 ?auto_3307989 ) ( OBJ-AT ?auto_3307981 ?auto_3307986 ) ( OBJ-AT ?auto_3307980 ?auto_3307986 ) ( TRUCK-AT ?auto_3307987 ?auto_3307979 ) ( not ( = ?auto_3307980 ?auto_3307981 ) ) ( not ( = ?auto_3307980 ?auto_3307982 ) ) ( not ( = ?auto_3307981 ?auto_3307982 ) ) ( not ( = ?auto_3307989 ?auto_3307986 ) ) ( not ( = ?auto_3307980 ?auto_3307985 ) ) ( not ( = ?auto_3307981 ?auto_3307985 ) ) ( not ( = ?auto_3307982 ?auto_3307985 ) ) ( not ( = ?auto_3307980 ?auto_3307984 ) ) ( not ( = ?auto_3307981 ?auto_3307984 ) ) ( not ( = ?auto_3307982 ?auto_3307984 ) ) ( not ( = ?auto_3307985 ?auto_3307984 ) ) ( not ( = ?auto_3307980 ?auto_3307983 ) ) ( not ( = ?auto_3307981 ?auto_3307983 ) ) ( not ( = ?auto_3307982 ?auto_3307983 ) ) ( not ( = ?auto_3307985 ?auto_3307983 ) ) ( not ( = ?auto_3307984 ?auto_3307983 ) ) ( not ( = ?auto_3307988 ?auto_3307989 ) ) ( not ( = ?auto_3307988 ?auto_3307986 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3307980 ?auto_3307981 ?auto_3307982 ?auto_3307985 ?auto_3307983 ?auto_3307984 ?auto_3307979 )
      ( DELIVER-6PKG-VERIFY ?auto_3307980 ?auto_3307981 ?auto_3307982 ?auto_3307983 ?auto_3307984 ?auto_3307985 ?auto_3307979 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3308452 - OBJ
      ?auto_3308453 - OBJ
      ?auto_3308454 - OBJ
      ?auto_3308455 - OBJ
      ?auto_3308456 - OBJ
      ?auto_3308457 - OBJ
      ?auto_3308451 - LOCATION
    )
    :vars
    (
      ?auto_3308460 - LOCATION
      ?auto_3308462 - CITY
      ?auto_3308461 - LOCATION
      ?auto_3308458 - LOCATION
      ?auto_3308459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3308460 ?auto_3308462 ) ( IN-CITY ?auto_3308451 ?auto_3308462 ) ( not ( = ?auto_3308451 ?auto_3308460 ) ) ( OBJ-AT ?auto_3308457 ?auto_3308460 ) ( IN-CITY ?auto_3308461 ?auto_3308462 ) ( not ( = ?auto_3308451 ?auto_3308461 ) ) ( OBJ-AT ?auto_3308456 ?auto_3308461 ) ( IN-CITY ?auto_3308458 ?auto_3308462 ) ( not ( = ?auto_3308451 ?auto_3308458 ) ) ( OBJ-AT ?auto_3308454 ?auto_3308458 ) ( OBJ-AT ?auto_3308455 ?auto_3308461 ) ( OBJ-AT ?auto_3308453 ?auto_3308458 ) ( OBJ-AT ?auto_3308452 ?auto_3308458 ) ( TRUCK-AT ?auto_3308459 ?auto_3308451 ) ( not ( = ?auto_3308452 ?auto_3308453 ) ) ( not ( = ?auto_3308452 ?auto_3308455 ) ) ( not ( = ?auto_3308453 ?auto_3308455 ) ) ( not ( = ?auto_3308461 ?auto_3308458 ) ) ( not ( = ?auto_3308452 ?auto_3308454 ) ) ( not ( = ?auto_3308453 ?auto_3308454 ) ) ( not ( = ?auto_3308455 ?auto_3308454 ) ) ( not ( = ?auto_3308452 ?auto_3308456 ) ) ( not ( = ?auto_3308453 ?auto_3308456 ) ) ( not ( = ?auto_3308455 ?auto_3308456 ) ) ( not ( = ?auto_3308454 ?auto_3308456 ) ) ( not ( = ?auto_3308452 ?auto_3308457 ) ) ( not ( = ?auto_3308453 ?auto_3308457 ) ) ( not ( = ?auto_3308455 ?auto_3308457 ) ) ( not ( = ?auto_3308454 ?auto_3308457 ) ) ( not ( = ?auto_3308456 ?auto_3308457 ) ) ( not ( = ?auto_3308460 ?auto_3308461 ) ) ( not ( = ?auto_3308460 ?auto_3308458 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3308452 ?auto_3308453 ?auto_3308455 ?auto_3308454 ?auto_3308457 ?auto_3308456 ?auto_3308451 )
      ( DELIVER-6PKG-VERIFY ?auto_3308452 ?auto_3308453 ?auto_3308454 ?auto_3308455 ?auto_3308456 ?auto_3308457 ?auto_3308451 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3308516 - OBJ
      ?auto_3308517 - OBJ
      ?auto_3308518 - OBJ
      ?auto_3308519 - OBJ
      ?auto_3308520 - OBJ
      ?auto_3308521 - OBJ
      ?auto_3308515 - LOCATION
    )
    :vars
    (
      ?auto_3308524 - LOCATION
      ?auto_3308526 - CITY
      ?auto_3308525 - LOCATION
      ?auto_3308522 - LOCATION
      ?auto_3308523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3308524 ?auto_3308526 ) ( IN-CITY ?auto_3308515 ?auto_3308526 ) ( not ( = ?auto_3308515 ?auto_3308524 ) ) ( OBJ-AT ?auto_3308520 ?auto_3308524 ) ( IN-CITY ?auto_3308525 ?auto_3308526 ) ( not ( = ?auto_3308515 ?auto_3308525 ) ) ( OBJ-AT ?auto_3308521 ?auto_3308525 ) ( IN-CITY ?auto_3308522 ?auto_3308526 ) ( not ( = ?auto_3308515 ?auto_3308522 ) ) ( OBJ-AT ?auto_3308518 ?auto_3308522 ) ( OBJ-AT ?auto_3308519 ?auto_3308525 ) ( OBJ-AT ?auto_3308517 ?auto_3308522 ) ( OBJ-AT ?auto_3308516 ?auto_3308522 ) ( TRUCK-AT ?auto_3308523 ?auto_3308515 ) ( not ( = ?auto_3308516 ?auto_3308517 ) ) ( not ( = ?auto_3308516 ?auto_3308519 ) ) ( not ( = ?auto_3308517 ?auto_3308519 ) ) ( not ( = ?auto_3308525 ?auto_3308522 ) ) ( not ( = ?auto_3308516 ?auto_3308518 ) ) ( not ( = ?auto_3308517 ?auto_3308518 ) ) ( not ( = ?auto_3308519 ?auto_3308518 ) ) ( not ( = ?auto_3308516 ?auto_3308521 ) ) ( not ( = ?auto_3308517 ?auto_3308521 ) ) ( not ( = ?auto_3308519 ?auto_3308521 ) ) ( not ( = ?auto_3308518 ?auto_3308521 ) ) ( not ( = ?auto_3308516 ?auto_3308520 ) ) ( not ( = ?auto_3308517 ?auto_3308520 ) ) ( not ( = ?auto_3308519 ?auto_3308520 ) ) ( not ( = ?auto_3308518 ?auto_3308520 ) ) ( not ( = ?auto_3308521 ?auto_3308520 ) ) ( not ( = ?auto_3308524 ?auto_3308525 ) ) ( not ( = ?auto_3308524 ?auto_3308522 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3308516 ?auto_3308517 ?auto_3308519 ?auto_3308518 ?auto_3308520 ?auto_3308521 ?auto_3308515 )
      ( DELIVER-6PKG-VERIFY ?auto_3308516 ?auto_3308517 ?auto_3308518 ?auto_3308519 ?auto_3308520 ?auto_3308521 ?auto_3308515 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3309038 - OBJ
      ?auto_3309039 - OBJ
      ?auto_3309040 - OBJ
      ?auto_3309041 - OBJ
      ?auto_3309042 - OBJ
      ?auto_3309043 - OBJ
      ?auto_3309037 - LOCATION
    )
    :vars
    (
      ?auto_3309046 - LOCATION
      ?auto_3309048 - CITY
      ?auto_3309047 - LOCATION
      ?auto_3309044 - LOCATION
      ?auto_3309045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3309046 ?auto_3309048 ) ( IN-CITY ?auto_3309037 ?auto_3309048 ) ( not ( = ?auto_3309037 ?auto_3309046 ) ) ( OBJ-AT ?auto_3309041 ?auto_3309046 ) ( IN-CITY ?auto_3309047 ?auto_3309048 ) ( not ( = ?auto_3309037 ?auto_3309047 ) ) ( OBJ-AT ?auto_3309043 ?auto_3309047 ) ( IN-CITY ?auto_3309044 ?auto_3309048 ) ( not ( = ?auto_3309037 ?auto_3309044 ) ) ( OBJ-AT ?auto_3309040 ?auto_3309044 ) ( OBJ-AT ?auto_3309042 ?auto_3309047 ) ( OBJ-AT ?auto_3309039 ?auto_3309044 ) ( OBJ-AT ?auto_3309038 ?auto_3309044 ) ( TRUCK-AT ?auto_3309045 ?auto_3309037 ) ( not ( = ?auto_3309038 ?auto_3309039 ) ) ( not ( = ?auto_3309038 ?auto_3309042 ) ) ( not ( = ?auto_3309039 ?auto_3309042 ) ) ( not ( = ?auto_3309047 ?auto_3309044 ) ) ( not ( = ?auto_3309038 ?auto_3309040 ) ) ( not ( = ?auto_3309039 ?auto_3309040 ) ) ( not ( = ?auto_3309042 ?auto_3309040 ) ) ( not ( = ?auto_3309038 ?auto_3309043 ) ) ( not ( = ?auto_3309039 ?auto_3309043 ) ) ( not ( = ?auto_3309042 ?auto_3309043 ) ) ( not ( = ?auto_3309040 ?auto_3309043 ) ) ( not ( = ?auto_3309038 ?auto_3309041 ) ) ( not ( = ?auto_3309039 ?auto_3309041 ) ) ( not ( = ?auto_3309042 ?auto_3309041 ) ) ( not ( = ?auto_3309040 ?auto_3309041 ) ) ( not ( = ?auto_3309043 ?auto_3309041 ) ) ( not ( = ?auto_3309046 ?auto_3309047 ) ) ( not ( = ?auto_3309046 ?auto_3309044 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3309038 ?auto_3309039 ?auto_3309042 ?auto_3309040 ?auto_3309041 ?auto_3309043 ?auto_3309037 )
      ( DELIVER-6PKG-VERIFY ?auto_3309038 ?auto_3309039 ?auto_3309040 ?auto_3309041 ?auto_3309042 ?auto_3309043 ?auto_3309037 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3311795 - OBJ
      ?auto_3311796 - OBJ
      ?auto_3311797 - OBJ
      ?auto_3311798 - OBJ
      ?auto_3311799 - OBJ
      ?auto_3311800 - OBJ
      ?auto_3311794 - LOCATION
    )
    :vars
    (
      ?auto_3311803 - LOCATION
      ?auto_3311805 - CITY
      ?auto_3311804 - LOCATION
      ?auto_3311801 - LOCATION
      ?auto_3311802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3311803 ?auto_3311805 ) ( IN-CITY ?auto_3311794 ?auto_3311805 ) ( not ( = ?auto_3311794 ?auto_3311803 ) ) ( OBJ-AT ?auto_3311797 ?auto_3311803 ) ( IN-CITY ?auto_3311804 ?auto_3311805 ) ( not ( = ?auto_3311794 ?auto_3311804 ) ) ( OBJ-AT ?auto_3311800 ?auto_3311804 ) ( IN-CITY ?auto_3311801 ?auto_3311805 ) ( not ( = ?auto_3311794 ?auto_3311801 ) ) ( OBJ-AT ?auto_3311799 ?auto_3311801 ) ( OBJ-AT ?auto_3311798 ?auto_3311804 ) ( OBJ-AT ?auto_3311796 ?auto_3311801 ) ( OBJ-AT ?auto_3311795 ?auto_3311801 ) ( TRUCK-AT ?auto_3311802 ?auto_3311794 ) ( not ( = ?auto_3311795 ?auto_3311796 ) ) ( not ( = ?auto_3311795 ?auto_3311798 ) ) ( not ( = ?auto_3311796 ?auto_3311798 ) ) ( not ( = ?auto_3311804 ?auto_3311801 ) ) ( not ( = ?auto_3311795 ?auto_3311799 ) ) ( not ( = ?auto_3311796 ?auto_3311799 ) ) ( not ( = ?auto_3311798 ?auto_3311799 ) ) ( not ( = ?auto_3311795 ?auto_3311800 ) ) ( not ( = ?auto_3311796 ?auto_3311800 ) ) ( not ( = ?auto_3311798 ?auto_3311800 ) ) ( not ( = ?auto_3311799 ?auto_3311800 ) ) ( not ( = ?auto_3311795 ?auto_3311797 ) ) ( not ( = ?auto_3311796 ?auto_3311797 ) ) ( not ( = ?auto_3311798 ?auto_3311797 ) ) ( not ( = ?auto_3311799 ?auto_3311797 ) ) ( not ( = ?auto_3311800 ?auto_3311797 ) ) ( not ( = ?auto_3311803 ?auto_3311804 ) ) ( not ( = ?auto_3311803 ?auto_3311801 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3311795 ?auto_3311796 ?auto_3311798 ?auto_3311799 ?auto_3311797 ?auto_3311800 ?auto_3311794 )
      ( DELIVER-6PKG-VERIFY ?auto_3311795 ?auto_3311796 ?auto_3311797 ?auto_3311798 ?auto_3311799 ?auto_3311800 ?auto_3311794 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3311859 - OBJ
      ?auto_3311860 - OBJ
      ?auto_3311861 - OBJ
      ?auto_3311862 - OBJ
      ?auto_3311863 - OBJ
      ?auto_3311864 - OBJ
      ?auto_3311858 - LOCATION
    )
    :vars
    (
      ?auto_3311867 - LOCATION
      ?auto_3311869 - CITY
      ?auto_3311868 - LOCATION
      ?auto_3311865 - LOCATION
      ?auto_3311866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3311867 ?auto_3311869 ) ( IN-CITY ?auto_3311858 ?auto_3311869 ) ( not ( = ?auto_3311858 ?auto_3311867 ) ) ( OBJ-AT ?auto_3311861 ?auto_3311867 ) ( IN-CITY ?auto_3311868 ?auto_3311869 ) ( not ( = ?auto_3311858 ?auto_3311868 ) ) ( OBJ-AT ?auto_3311863 ?auto_3311868 ) ( IN-CITY ?auto_3311865 ?auto_3311869 ) ( not ( = ?auto_3311858 ?auto_3311865 ) ) ( OBJ-AT ?auto_3311864 ?auto_3311865 ) ( OBJ-AT ?auto_3311862 ?auto_3311868 ) ( OBJ-AT ?auto_3311860 ?auto_3311865 ) ( OBJ-AT ?auto_3311859 ?auto_3311865 ) ( TRUCK-AT ?auto_3311866 ?auto_3311858 ) ( not ( = ?auto_3311859 ?auto_3311860 ) ) ( not ( = ?auto_3311859 ?auto_3311862 ) ) ( not ( = ?auto_3311860 ?auto_3311862 ) ) ( not ( = ?auto_3311868 ?auto_3311865 ) ) ( not ( = ?auto_3311859 ?auto_3311864 ) ) ( not ( = ?auto_3311860 ?auto_3311864 ) ) ( not ( = ?auto_3311862 ?auto_3311864 ) ) ( not ( = ?auto_3311859 ?auto_3311863 ) ) ( not ( = ?auto_3311860 ?auto_3311863 ) ) ( not ( = ?auto_3311862 ?auto_3311863 ) ) ( not ( = ?auto_3311864 ?auto_3311863 ) ) ( not ( = ?auto_3311859 ?auto_3311861 ) ) ( not ( = ?auto_3311860 ?auto_3311861 ) ) ( not ( = ?auto_3311862 ?auto_3311861 ) ) ( not ( = ?auto_3311864 ?auto_3311861 ) ) ( not ( = ?auto_3311863 ?auto_3311861 ) ) ( not ( = ?auto_3311867 ?auto_3311868 ) ) ( not ( = ?auto_3311867 ?auto_3311865 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3311859 ?auto_3311860 ?auto_3311862 ?auto_3311864 ?auto_3311861 ?auto_3311863 ?auto_3311858 )
      ( DELIVER-6PKG-VERIFY ?auto_3311859 ?auto_3311860 ?auto_3311861 ?auto_3311862 ?auto_3311863 ?auto_3311864 ?auto_3311858 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3312195 - OBJ
      ?auto_3312196 - OBJ
      ?auto_3312197 - OBJ
      ?auto_3312198 - OBJ
      ?auto_3312199 - OBJ
      ?auto_3312200 - OBJ
      ?auto_3312194 - LOCATION
    )
    :vars
    (
      ?auto_3312203 - LOCATION
      ?auto_3312205 - CITY
      ?auto_3312204 - LOCATION
      ?auto_3312201 - LOCATION
      ?auto_3312202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3312203 ?auto_3312205 ) ( IN-CITY ?auto_3312194 ?auto_3312205 ) ( not ( = ?auto_3312194 ?auto_3312203 ) ) ( OBJ-AT ?auto_3312197 ?auto_3312203 ) ( IN-CITY ?auto_3312204 ?auto_3312205 ) ( not ( = ?auto_3312194 ?auto_3312204 ) ) ( OBJ-AT ?auto_3312200 ?auto_3312204 ) ( IN-CITY ?auto_3312201 ?auto_3312205 ) ( not ( = ?auto_3312194 ?auto_3312201 ) ) ( OBJ-AT ?auto_3312198 ?auto_3312201 ) ( OBJ-AT ?auto_3312199 ?auto_3312204 ) ( OBJ-AT ?auto_3312196 ?auto_3312201 ) ( OBJ-AT ?auto_3312195 ?auto_3312201 ) ( TRUCK-AT ?auto_3312202 ?auto_3312194 ) ( not ( = ?auto_3312195 ?auto_3312196 ) ) ( not ( = ?auto_3312195 ?auto_3312199 ) ) ( not ( = ?auto_3312196 ?auto_3312199 ) ) ( not ( = ?auto_3312204 ?auto_3312201 ) ) ( not ( = ?auto_3312195 ?auto_3312198 ) ) ( not ( = ?auto_3312196 ?auto_3312198 ) ) ( not ( = ?auto_3312199 ?auto_3312198 ) ) ( not ( = ?auto_3312195 ?auto_3312200 ) ) ( not ( = ?auto_3312196 ?auto_3312200 ) ) ( not ( = ?auto_3312199 ?auto_3312200 ) ) ( not ( = ?auto_3312198 ?auto_3312200 ) ) ( not ( = ?auto_3312195 ?auto_3312197 ) ) ( not ( = ?auto_3312196 ?auto_3312197 ) ) ( not ( = ?auto_3312199 ?auto_3312197 ) ) ( not ( = ?auto_3312198 ?auto_3312197 ) ) ( not ( = ?auto_3312200 ?auto_3312197 ) ) ( not ( = ?auto_3312203 ?auto_3312204 ) ) ( not ( = ?auto_3312203 ?auto_3312201 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3312195 ?auto_3312196 ?auto_3312199 ?auto_3312198 ?auto_3312197 ?auto_3312200 ?auto_3312194 )
      ( DELIVER-6PKG-VERIFY ?auto_3312195 ?auto_3312196 ?auto_3312197 ?auto_3312198 ?auto_3312199 ?auto_3312200 ?auto_3312194 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3315212 - OBJ
      ?auto_3315213 - OBJ
      ?auto_3315214 - OBJ
      ?auto_3315215 - OBJ
      ?auto_3315216 - OBJ
      ?auto_3315217 - OBJ
      ?auto_3315211 - LOCATION
    )
    :vars
    (
      ?auto_3315220 - LOCATION
      ?auto_3315222 - CITY
      ?auto_3315221 - LOCATION
      ?auto_3315218 - LOCATION
      ?auto_3315219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3315220 ?auto_3315222 ) ( IN-CITY ?auto_3315211 ?auto_3315222 ) ( not ( = ?auto_3315211 ?auto_3315220 ) ) ( OBJ-AT ?auto_3315217 ?auto_3315220 ) ( IN-CITY ?auto_3315221 ?auto_3315222 ) ( not ( = ?auto_3315211 ?auto_3315221 ) ) ( OBJ-AT ?auto_3315216 ?auto_3315221 ) ( IN-CITY ?auto_3315218 ?auto_3315222 ) ( not ( = ?auto_3315211 ?auto_3315218 ) ) ( OBJ-AT ?auto_3315215 ?auto_3315218 ) ( OBJ-AT ?auto_3315213 ?auto_3315221 ) ( OBJ-AT ?auto_3315214 ?auto_3315218 ) ( OBJ-AT ?auto_3315212 ?auto_3315218 ) ( TRUCK-AT ?auto_3315219 ?auto_3315211 ) ( not ( = ?auto_3315212 ?auto_3315214 ) ) ( not ( = ?auto_3315212 ?auto_3315213 ) ) ( not ( = ?auto_3315214 ?auto_3315213 ) ) ( not ( = ?auto_3315221 ?auto_3315218 ) ) ( not ( = ?auto_3315212 ?auto_3315215 ) ) ( not ( = ?auto_3315214 ?auto_3315215 ) ) ( not ( = ?auto_3315213 ?auto_3315215 ) ) ( not ( = ?auto_3315212 ?auto_3315216 ) ) ( not ( = ?auto_3315214 ?auto_3315216 ) ) ( not ( = ?auto_3315213 ?auto_3315216 ) ) ( not ( = ?auto_3315215 ?auto_3315216 ) ) ( not ( = ?auto_3315212 ?auto_3315217 ) ) ( not ( = ?auto_3315214 ?auto_3315217 ) ) ( not ( = ?auto_3315213 ?auto_3315217 ) ) ( not ( = ?auto_3315215 ?auto_3315217 ) ) ( not ( = ?auto_3315216 ?auto_3315217 ) ) ( not ( = ?auto_3315220 ?auto_3315221 ) ) ( not ( = ?auto_3315220 ?auto_3315218 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3315212 ?auto_3315214 ?auto_3315213 ?auto_3315215 ?auto_3315217 ?auto_3315216 ?auto_3315211 )
      ( DELIVER-6PKG-VERIFY ?auto_3315212 ?auto_3315213 ?auto_3315214 ?auto_3315215 ?auto_3315216 ?auto_3315217 ?auto_3315211 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3315276 - OBJ
      ?auto_3315277 - OBJ
      ?auto_3315278 - OBJ
      ?auto_3315279 - OBJ
      ?auto_3315280 - OBJ
      ?auto_3315281 - OBJ
      ?auto_3315275 - LOCATION
    )
    :vars
    (
      ?auto_3315284 - LOCATION
      ?auto_3315286 - CITY
      ?auto_3315285 - LOCATION
      ?auto_3315282 - LOCATION
      ?auto_3315283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3315284 ?auto_3315286 ) ( IN-CITY ?auto_3315275 ?auto_3315286 ) ( not ( = ?auto_3315275 ?auto_3315284 ) ) ( OBJ-AT ?auto_3315280 ?auto_3315284 ) ( IN-CITY ?auto_3315285 ?auto_3315286 ) ( not ( = ?auto_3315275 ?auto_3315285 ) ) ( OBJ-AT ?auto_3315281 ?auto_3315285 ) ( IN-CITY ?auto_3315282 ?auto_3315286 ) ( not ( = ?auto_3315275 ?auto_3315282 ) ) ( OBJ-AT ?auto_3315279 ?auto_3315282 ) ( OBJ-AT ?auto_3315277 ?auto_3315285 ) ( OBJ-AT ?auto_3315278 ?auto_3315282 ) ( OBJ-AT ?auto_3315276 ?auto_3315282 ) ( TRUCK-AT ?auto_3315283 ?auto_3315275 ) ( not ( = ?auto_3315276 ?auto_3315278 ) ) ( not ( = ?auto_3315276 ?auto_3315277 ) ) ( not ( = ?auto_3315278 ?auto_3315277 ) ) ( not ( = ?auto_3315285 ?auto_3315282 ) ) ( not ( = ?auto_3315276 ?auto_3315279 ) ) ( not ( = ?auto_3315278 ?auto_3315279 ) ) ( not ( = ?auto_3315277 ?auto_3315279 ) ) ( not ( = ?auto_3315276 ?auto_3315281 ) ) ( not ( = ?auto_3315278 ?auto_3315281 ) ) ( not ( = ?auto_3315277 ?auto_3315281 ) ) ( not ( = ?auto_3315279 ?auto_3315281 ) ) ( not ( = ?auto_3315276 ?auto_3315280 ) ) ( not ( = ?auto_3315278 ?auto_3315280 ) ) ( not ( = ?auto_3315277 ?auto_3315280 ) ) ( not ( = ?auto_3315279 ?auto_3315280 ) ) ( not ( = ?auto_3315281 ?auto_3315280 ) ) ( not ( = ?auto_3315284 ?auto_3315285 ) ) ( not ( = ?auto_3315284 ?auto_3315282 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3315276 ?auto_3315278 ?auto_3315277 ?auto_3315279 ?auto_3315280 ?auto_3315281 ?auto_3315275 )
      ( DELIVER-6PKG-VERIFY ?auto_3315276 ?auto_3315277 ?auto_3315278 ?auto_3315279 ?auto_3315280 ?auto_3315281 ?auto_3315275 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3315340 - OBJ
      ?auto_3315341 - OBJ
      ?auto_3315342 - OBJ
      ?auto_3315343 - OBJ
      ?auto_3315344 - OBJ
      ?auto_3315345 - OBJ
      ?auto_3315339 - LOCATION
    )
    :vars
    (
      ?auto_3315348 - LOCATION
      ?auto_3315350 - CITY
      ?auto_3315349 - LOCATION
      ?auto_3315346 - LOCATION
      ?auto_3315347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3315348 ?auto_3315350 ) ( IN-CITY ?auto_3315339 ?auto_3315350 ) ( not ( = ?auto_3315339 ?auto_3315348 ) ) ( OBJ-AT ?auto_3315345 ?auto_3315348 ) ( IN-CITY ?auto_3315349 ?auto_3315350 ) ( not ( = ?auto_3315339 ?auto_3315349 ) ) ( OBJ-AT ?auto_3315343 ?auto_3315349 ) ( IN-CITY ?auto_3315346 ?auto_3315350 ) ( not ( = ?auto_3315339 ?auto_3315346 ) ) ( OBJ-AT ?auto_3315344 ?auto_3315346 ) ( OBJ-AT ?auto_3315341 ?auto_3315349 ) ( OBJ-AT ?auto_3315342 ?auto_3315346 ) ( OBJ-AT ?auto_3315340 ?auto_3315346 ) ( TRUCK-AT ?auto_3315347 ?auto_3315339 ) ( not ( = ?auto_3315340 ?auto_3315342 ) ) ( not ( = ?auto_3315340 ?auto_3315341 ) ) ( not ( = ?auto_3315342 ?auto_3315341 ) ) ( not ( = ?auto_3315349 ?auto_3315346 ) ) ( not ( = ?auto_3315340 ?auto_3315344 ) ) ( not ( = ?auto_3315342 ?auto_3315344 ) ) ( not ( = ?auto_3315341 ?auto_3315344 ) ) ( not ( = ?auto_3315340 ?auto_3315343 ) ) ( not ( = ?auto_3315342 ?auto_3315343 ) ) ( not ( = ?auto_3315341 ?auto_3315343 ) ) ( not ( = ?auto_3315344 ?auto_3315343 ) ) ( not ( = ?auto_3315340 ?auto_3315345 ) ) ( not ( = ?auto_3315342 ?auto_3315345 ) ) ( not ( = ?auto_3315341 ?auto_3315345 ) ) ( not ( = ?auto_3315344 ?auto_3315345 ) ) ( not ( = ?auto_3315343 ?auto_3315345 ) ) ( not ( = ?auto_3315348 ?auto_3315349 ) ) ( not ( = ?auto_3315348 ?auto_3315346 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3315340 ?auto_3315342 ?auto_3315341 ?auto_3315344 ?auto_3315345 ?auto_3315343 ?auto_3315339 )
      ( DELIVER-6PKG-VERIFY ?auto_3315340 ?auto_3315341 ?auto_3315342 ?auto_3315343 ?auto_3315344 ?auto_3315345 ?auto_3315339 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3315404 - OBJ
      ?auto_3315405 - OBJ
      ?auto_3315406 - OBJ
      ?auto_3315407 - OBJ
      ?auto_3315408 - OBJ
      ?auto_3315409 - OBJ
      ?auto_3315403 - LOCATION
    )
    :vars
    (
      ?auto_3315412 - LOCATION
      ?auto_3315414 - CITY
      ?auto_3315413 - LOCATION
      ?auto_3315410 - LOCATION
      ?auto_3315411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3315412 ?auto_3315414 ) ( IN-CITY ?auto_3315403 ?auto_3315414 ) ( not ( = ?auto_3315403 ?auto_3315412 ) ) ( OBJ-AT ?auto_3315408 ?auto_3315412 ) ( IN-CITY ?auto_3315413 ?auto_3315414 ) ( not ( = ?auto_3315403 ?auto_3315413 ) ) ( OBJ-AT ?auto_3315407 ?auto_3315413 ) ( IN-CITY ?auto_3315410 ?auto_3315414 ) ( not ( = ?auto_3315403 ?auto_3315410 ) ) ( OBJ-AT ?auto_3315409 ?auto_3315410 ) ( OBJ-AT ?auto_3315405 ?auto_3315413 ) ( OBJ-AT ?auto_3315406 ?auto_3315410 ) ( OBJ-AT ?auto_3315404 ?auto_3315410 ) ( TRUCK-AT ?auto_3315411 ?auto_3315403 ) ( not ( = ?auto_3315404 ?auto_3315406 ) ) ( not ( = ?auto_3315404 ?auto_3315405 ) ) ( not ( = ?auto_3315406 ?auto_3315405 ) ) ( not ( = ?auto_3315413 ?auto_3315410 ) ) ( not ( = ?auto_3315404 ?auto_3315409 ) ) ( not ( = ?auto_3315406 ?auto_3315409 ) ) ( not ( = ?auto_3315405 ?auto_3315409 ) ) ( not ( = ?auto_3315404 ?auto_3315407 ) ) ( not ( = ?auto_3315406 ?auto_3315407 ) ) ( not ( = ?auto_3315405 ?auto_3315407 ) ) ( not ( = ?auto_3315409 ?auto_3315407 ) ) ( not ( = ?auto_3315404 ?auto_3315408 ) ) ( not ( = ?auto_3315406 ?auto_3315408 ) ) ( not ( = ?auto_3315405 ?auto_3315408 ) ) ( not ( = ?auto_3315409 ?auto_3315408 ) ) ( not ( = ?auto_3315407 ?auto_3315408 ) ) ( not ( = ?auto_3315412 ?auto_3315413 ) ) ( not ( = ?auto_3315412 ?auto_3315410 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3315404 ?auto_3315406 ?auto_3315405 ?auto_3315409 ?auto_3315408 ?auto_3315407 ?auto_3315403 )
      ( DELIVER-6PKG-VERIFY ?auto_3315404 ?auto_3315405 ?auto_3315406 ?auto_3315407 ?auto_3315408 ?auto_3315409 ?auto_3315403 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3315740 - OBJ
      ?auto_3315741 - OBJ
      ?auto_3315742 - OBJ
      ?auto_3315743 - OBJ
      ?auto_3315744 - OBJ
      ?auto_3315745 - OBJ
      ?auto_3315739 - LOCATION
    )
    :vars
    (
      ?auto_3315748 - LOCATION
      ?auto_3315750 - CITY
      ?auto_3315749 - LOCATION
      ?auto_3315746 - LOCATION
      ?auto_3315747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3315748 ?auto_3315750 ) ( IN-CITY ?auto_3315739 ?auto_3315750 ) ( not ( = ?auto_3315739 ?auto_3315748 ) ) ( OBJ-AT ?auto_3315743 ?auto_3315748 ) ( IN-CITY ?auto_3315749 ?auto_3315750 ) ( not ( = ?auto_3315739 ?auto_3315749 ) ) ( OBJ-AT ?auto_3315745 ?auto_3315749 ) ( IN-CITY ?auto_3315746 ?auto_3315750 ) ( not ( = ?auto_3315739 ?auto_3315746 ) ) ( OBJ-AT ?auto_3315744 ?auto_3315746 ) ( OBJ-AT ?auto_3315741 ?auto_3315749 ) ( OBJ-AT ?auto_3315742 ?auto_3315746 ) ( OBJ-AT ?auto_3315740 ?auto_3315746 ) ( TRUCK-AT ?auto_3315747 ?auto_3315739 ) ( not ( = ?auto_3315740 ?auto_3315742 ) ) ( not ( = ?auto_3315740 ?auto_3315741 ) ) ( not ( = ?auto_3315742 ?auto_3315741 ) ) ( not ( = ?auto_3315749 ?auto_3315746 ) ) ( not ( = ?auto_3315740 ?auto_3315744 ) ) ( not ( = ?auto_3315742 ?auto_3315744 ) ) ( not ( = ?auto_3315741 ?auto_3315744 ) ) ( not ( = ?auto_3315740 ?auto_3315745 ) ) ( not ( = ?auto_3315742 ?auto_3315745 ) ) ( not ( = ?auto_3315741 ?auto_3315745 ) ) ( not ( = ?auto_3315744 ?auto_3315745 ) ) ( not ( = ?auto_3315740 ?auto_3315743 ) ) ( not ( = ?auto_3315742 ?auto_3315743 ) ) ( not ( = ?auto_3315741 ?auto_3315743 ) ) ( not ( = ?auto_3315744 ?auto_3315743 ) ) ( not ( = ?auto_3315745 ?auto_3315743 ) ) ( not ( = ?auto_3315748 ?auto_3315749 ) ) ( not ( = ?auto_3315748 ?auto_3315746 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3315740 ?auto_3315742 ?auto_3315741 ?auto_3315744 ?auto_3315743 ?auto_3315745 ?auto_3315739 )
      ( DELIVER-6PKG-VERIFY ?auto_3315740 ?auto_3315741 ?auto_3315742 ?auto_3315743 ?auto_3315744 ?auto_3315745 ?auto_3315739 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3315804 - OBJ
      ?auto_3315805 - OBJ
      ?auto_3315806 - OBJ
      ?auto_3315807 - OBJ
      ?auto_3315808 - OBJ
      ?auto_3315809 - OBJ
      ?auto_3315803 - LOCATION
    )
    :vars
    (
      ?auto_3315812 - LOCATION
      ?auto_3315814 - CITY
      ?auto_3315813 - LOCATION
      ?auto_3315810 - LOCATION
      ?auto_3315811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3315812 ?auto_3315814 ) ( IN-CITY ?auto_3315803 ?auto_3315814 ) ( not ( = ?auto_3315803 ?auto_3315812 ) ) ( OBJ-AT ?auto_3315807 ?auto_3315812 ) ( IN-CITY ?auto_3315813 ?auto_3315814 ) ( not ( = ?auto_3315803 ?auto_3315813 ) ) ( OBJ-AT ?auto_3315808 ?auto_3315813 ) ( IN-CITY ?auto_3315810 ?auto_3315814 ) ( not ( = ?auto_3315803 ?auto_3315810 ) ) ( OBJ-AT ?auto_3315809 ?auto_3315810 ) ( OBJ-AT ?auto_3315805 ?auto_3315813 ) ( OBJ-AT ?auto_3315806 ?auto_3315810 ) ( OBJ-AT ?auto_3315804 ?auto_3315810 ) ( TRUCK-AT ?auto_3315811 ?auto_3315803 ) ( not ( = ?auto_3315804 ?auto_3315806 ) ) ( not ( = ?auto_3315804 ?auto_3315805 ) ) ( not ( = ?auto_3315806 ?auto_3315805 ) ) ( not ( = ?auto_3315813 ?auto_3315810 ) ) ( not ( = ?auto_3315804 ?auto_3315809 ) ) ( not ( = ?auto_3315806 ?auto_3315809 ) ) ( not ( = ?auto_3315805 ?auto_3315809 ) ) ( not ( = ?auto_3315804 ?auto_3315808 ) ) ( not ( = ?auto_3315806 ?auto_3315808 ) ) ( not ( = ?auto_3315805 ?auto_3315808 ) ) ( not ( = ?auto_3315809 ?auto_3315808 ) ) ( not ( = ?auto_3315804 ?auto_3315807 ) ) ( not ( = ?auto_3315806 ?auto_3315807 ) ) ( not ( = ?auto_3315805 ?auto_3315807 ) ) ( not ( = ?auto_3315809 ?auto_3315807 ) ) ( not ( = ?auto_3315808 ?auto_3315807 ) ) ( not ( = ?auto_3315812 ?auto_3315813 ) ) ( not ( = ?auto_3315812 ?auto_3315810 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3315804 ?auto_3315806 ?auto_3315805 ?auto_3315809 ?auto_3315807 ?auto_3315808 ?auto_3315803 )
      ( DELIVER-6PKG-VERIFY ?auto_3315804 ?auto_3315805 ?auto_3315806 ?auto_3315807 ?auto_3315808 ?auto_3315809 ?auto_3315803 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3318572 - OBJ
      ?auto_3318573 - OBJ
      ?auto_3318574 - OBJ
      ?auto_3318575 - OBJ
      ?auto_3318576 - OBJ
      ?auto_3318577 - OBJ
      ?auto_3318571 - LOCATION
    )
    :vars
    (
      ?auto_3318580 - LOCATION
      ?auto_3318582 - CITY
      ?auto_3318581 - LOCATION
      ?auto_3318578 - LOCATION
      ?auto_3318579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3318580 ?auto_3318582 ) ( IN-CITY ?auto_3318571 ?auto_3318582 ) ( not ( = ?auto_3318571 ?auto_3318580 ) ) ( OBJ-AT ?auto_3318577 ?auto_3318580 ) ( IN-CITY ?auto_3318581 ?auto_3318582 ) ( not ( = ?auto_3318571 ?auto_3318581 ) ) ( OBJ-AT ?auto_3318574 ?auto_3318581 ) ( IN-CITY ?auto_3318578 ?auto_3318582 ) ( not ( = ?auto_3318571 ?auto_3318578 ) ) ( OBJ-AT ?auto_3318576 ?auto_3318578 ) ( OBJ-AT ?auto_3318573 ?auto_3318581 ) ( OBJ-AT ?auto_3318575 ?auto_3318578 ) ( OBJ-AT ?auto_3318572 ?auto_3318578 ) ( TRUCK-AT ?auto_3318579 ?auto_3318571 ) ( not ( = ?auto_3318572 ?auto_3318575 ) ) ( not ( = ?auto_3318572 ?auto_3318573 ) ) ( not ( = ?auto_3318575 ?auto_3318573 ) ) ( not ( = ?auto_3318581 ?auto_3318578 ) ) ( not ( = ?auto_3318572 ?auto_3318576 ) ) ( not ( = ?auto_3318575 ?auto_3318576 ) ) ( not ( = ?auto_3318573 ?auto_3318576 ) ) ( not ( = ?auto_3318572 ?auto_3318574 ) ) ( not ( = ?auto_3318575 ?auto_3318574 ) ) ( not ( = ?auto_3318573 ?auto_3318574 ) ) ( not ( = ?auto_3318576 ?auto_3318574 ) ) ( not ( = ?auto_3318572 ?auto_3318577 ) ) ( not ( = ?auto_3318575 ?auto_3318577 ) ) ( not ( = ?auto_3318573 ?auto_3318577 ) ) ( not ( = ?auto_3318576 ?auto_3318577 ) ) ( not ( = ?auto_3318574 ?auto_3318577 ) ) ( not ( = ?auto_3318580 ?auto_3318581 ) ) ( not ( = ?auto_3318580 ?auto_3318578 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3318572 ?auto_3318575 ?auto_3318573 ?auto_3318576 ?auto_3318577 ?auto_3318574 ?auto_3318571 )
      ( DELIVER-6PKG-VERIFY ?auto_3318572 ?auto_3318573 ?auto_3318574 ?auto_3318575 ?auto_3318576 ?auto_3318577 ?auto_3318571 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3318636 - OBJ
      ?auto_3318637 - OBJ
      ?auto_3318638 - OBJ
      ?auto_3318639 - OBJ
      ?auto_3318640 - OBJ
      ?auto_3318641 - OBJ
      ?auto_3318635 - LOCATION
    )
    :vars
    (
      ?auto_3318644 - LOCATION
      ?auto_3318646 - CITY
      ?auto_3318645 - LOCATION
      ?auto_3318642 - LOCATION
      ?auto_3318643 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3318644 ?auto_3318646 ) ( IN-CITY ?auto_3318635 ?auto_3318646 ) ( not ( = ?auto_3318635 ?auto_3318644 ) ) ( OBJ-AT ?auto_3318640 ?auto_3318644 ) ( IN-CITY ?auto_3318645 ?auto_3318646 ) ( not ( = ?auto_3318635 ?auto_3318645 ) ) ( OBJ-AT ?auto_3318638 ?auto_3318645 ) ( IN-CITY ?auto_3318642 ?auto_3318646 ) ( not ( = ?auto_3318635 ?auto_3318642 ) ) ( OBJ-AT ?auto_3318641 ?auto_3318642 ) ( OBJ-AT ?auto_3318637 ?auto_3318645 ) ( OBJ-AT ?auto_3318639 ?auto_3318642 ) ( OBJ-AT ?auto_3318636 ?auto_3318642 ) ( TRUCK-AT ?auto_3318643 ?auto_3318635 ) ( not ( = ?auto_3318636 ?auto_3318639 ) ) ( not ( = ?auto_3318636 ?auto_3318637 ) ) ( not ( = ?auto_3318639 ?auto_3318637 ) ) ( not ( = ?auto_3318645 ?auto_3318642 ) ) ( not ( = ?auto_3318636 ?auto_3318641 ) ) ( not ( = ?auto_3318639 ?auto_3318641 ) ) ( not ( = ?auto_3318637 ?auto_3318641 ) ) ( not ( = ?auto_3318636 ?auto_3318638 ) ) ( not ( = ?auto_3318639 ?auto_3318638 ) ) ( not ( = ?auto_3318637 ?auto_3318638 ) ) ( not ( = ?auto_3318641 ?auto_3318638 ) ) ( not ( = ?auto_3318636 ?auto_3318640 ) ) ( not ( = ?auto_3318639 ?auto_3318640 ) ) ( not ( = ?auto_3318637 ?auto_3318640 ) ) ( not ( = ?auto_3318641 ?auto_3318640 ) ) ( not ( = ?auto_3318638 ?auto_3318640 ) ) ( not ( = ?auto_3318644 ?auto_3318645 ) ) ( not ( = ?auto_3318644 ?auto_3318642 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3318636 ?auto_3318639 ?auto_3318637 ?auto_3318641 ?auto_3318640 ?auto_3318638 ?auto_3318635 )
      ( DELIVER-6PKG-VERIFY ?auto_3318636 ?auto_3318637 ?auto_3318638 ?auto_3318639 ?auto_3318640 ?auto_3318641 ?auto_3318635 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3319226 - OBJ
      ?auto_3319227 - OBJ
      ?auto_3319228 - OBJ
      ?auto_3319229 - OBJ
      ?auto_3319230 - OBJ
      ?auto_3319231 - OBJ
      ?auto_3319225 - LOCATION
    )
    :vars
    (
      ?auto_3319234 - LOCATION
      ?auto_3319236 - CITY
      ?auto_3319235 - LOCATION
      ?auto_3319232 - LOCATION
      ?auto_3319233 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3319234 ?auto_3319236 ) ( IN-CITY ?auto_3319225 ?auto_3319236 ) ( not ( = ?auto_3319225 ?auto_3319234 ) ) ( OBJ-AT ?auto_3319229 ?auto_3319234 ) ( IN-CITY ?auto_3319235 ?auto_3319236 ) ( not ( = ?auto_3319225 ?auto_3319235 ) ) ( OBJ-AT ?auto_3319228 ?auto_3319235 ) ( IN-CITY ?auto_3319232 ?auto_3319236 ) ( not ( = ?auto_3319225 ?auto_3319232 ) ) ( OBJ-AT ?auto_3319231 ?auto_3319232 ) ( OBJ-AT ?auto_3319227 ?auto_3319235 ) ( OBJ-AT ?auto_3319230 ?auto_3319232 ) ( OBJ-AT ?auto_3319226 ?auto_3319232 ) ( TRUCK-AT ?auto_3319233 ?auto_3319225 ) ( not ( = ?auto_3319226 ?auto_3319230 ) ) ( not ( = ?auto_3319226 ?auto_3319227 ) ) ( not ( = ?auto_3319230 ?auto_3319227 ) ) ( not ( = ?auto_3319235 ?auto_3319232 ) ) ( not ( = ?auto_3319226 ?auto_3319231 ) ) ( not ( = ?auto_3319230 ?auto_3319231 ) ) ( not ( = ?auto_3319227 ?auto_3319231 ) ) ( not ( = ?auto_3319226 ?auto_3319228 ) ) ( not ( = ?auto_3319230 ?auto_3319228 ) ) ( not ( = ?auto_3319227 ?auto_3319228 ) ) ( not ( = ?auto_3319231 ?auto_3319228 ) ) ( not ( = ?auto_3319226 ?auto_3319229 ) ) ( not ( = ?auto_3319230 ?auto_3319229 ) ) ( not ( = ?auto_3319227 ?auto_3319229 ) ) ( not ( = ?auto_3319231 ?auto_3319229 ) ) ( not ( = ?auto_3319228 ?auto_3319229 ) ) ( not ( = ?auto_3319234 ?auto_3319235 ) ) ( not ( = ?auto_3319234 ?auto_3319232 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3319226 ?auto_3319230 ?auto_3319227 ?auto_3319231 ?auto_3319229 ?auto_3319228 ?auto_3319225 )
      ( DELIVER-6PKG-VERIFY ?auto_3319226 ?auto_3319227 ?auto_3319228 ?auto_3319229 ?auto_3319230 ?auto_3319231 ?auto_3319225 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3320387 - OBJ
      ?auto_3320388 - OBJ
      ?auto_3320389 - OBJ
      ?auto_3320390 - OBJ
      ?auto_3320391 - OBJ
      ?auto_3320392 - OBJ
      ?auto_3320386 - LOCATION
    )
    :vars
    (
      ?auto_3320395 - LOCATION
      ?auto_3320397 - CITY
      ?auto_3320396 - LOCATION
      ?auto_3320393 - LOCATION
      ?auto_3320394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3320395 ?auto_3320397 ) ( IN-CITY ?auto_3320386 ?auto_3320397 ) ( not ( = ?auto_3320386 ?auto_3320395 ) ) ( OBJ-AT ?auto_3320389 ?auto_3320395 ) ( IN-CITY ?auto_3320396 ?auto_3320397 ) ( not ( = ?auto_3320386 ?auto_3320396 ) ) ( OBJ-AT ?auto_3320392 ?auto_3320396 ) ( IN-CITY ?auto_3320393 ?auto_3320397 ) ( not ( = ?auto_3320386 ?auto_3320393 ) ) ( OBJ-AT ?auto_3320391 ?auto_3320393 ) ( OBJ-AT ?auto_3320388 ?auto_3320396 ) ( OBJ-AT ?auto_3320390 ?auto_3320393 ) ( OBJ-AT ?auto_3320387 ?auto_3320393 ) ( TRUCK-AT ?auto_3320394 ?auto_3320386 ) ( not ( = ?auto_3320387 ?auto_3320390 ) ) ( not ( = ?auto_3320387 ?auto_3320388 ) ) ( not ( = ?auto_3320390 ?auto_3320388 ) ) ( not ( = ?auto_3320396 ?auto_3320393 ) ) ( not ( = ?auto_3320387 ?auto_3320391 ) ) ( not ( = ?auto_3320390 ?auto_3320391 ) ) ( not ( = ?auto_3320388 ?auto_3320391 ) ) ( not ( = ?auto_3320387 ?auto_3320392 ) ) ( not ( = ?auto_3320390 ?auto_3320392 ) ) ( not ( = ?auto_3320388 ?auto_3320392 ) ) ( not ( = ?auto_3320391 ?auto_3320392 ) ) ( not ( = ?auto_3320387 ?auto_3320389 ) ) ( not ( = ?auto_3320390 ?auto_3320389 ) ) ( not ( = ?auto_3320388 ?auto_3320389 ) ) ( not ( = ?auto_3320391 ?auto_3320389 ) ) ( not ( = ?auto_3320392 ?auto_3320389 ) ) ( not ( = ?auto_3320395 ?auto_3320396 ) ) ( not ( = ?auto_3320395 ?auto_3320393 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3320387 ?auto_3320390 ?auto_3320388 ?auto_3320391 ?auto_3320389 ?auto_3320392 ?auto_3320386 )
      ( DELIVER-6PKG-VERIFY ?auto_3320387 ?auto_3320388 ?auto_3320389 ?auto_3320390 ?auto_3320391 ?auto_3320392 ?auto_3320386 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3320451 - OBJ
      ?auto_3320452 - OBJ
      ?auto_3320453 - OBJ
      ?auto_3320454 - OBJ
      ?auto_3320455 - OBJ
      ?auto_3320456 - OBJ
      ?auto_3320450 - LOCATION
    )
    :vars
    (
      ?auto_3320459 - LOCATION
      ?auto_3320461 - CITY
      ?auto_3320460 - LOCATION
      ?auto_3320457 - LOCATION
      ?auto_3320458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3320459 ?auto_3320461 ) ( IN-CITY ?auto_3320450 ?auto_3320461 ) ( not ( = ?auto_3320450 ?auto_3320459 ) ) ( OBJ-AT ?auto_3320453 ?auto_3320459 ) ( IN-CITY ?auto_3320460 ?auto_3320461 ) ( not ( = ?auto_3320450 ?auto_3320460 ) ) ( OBJ-AT ?auto_3320455 ?auto_3320460 ) ( IN-CITY ?auto_3320457 ?auto_3320461 ) ( not ( = ?auto_3320450 ?auto_3320457 ) ) ( OBJ-AT ?auto_3320456 ?auto_3320457 ) ( OBJ-AT ?auto_3320452 ?auto_3320460 ) ( OBJ-AT ?auto_3320454 ?auto_3320457 ) ( OBJ-AT ?auto_3320451 ?auto_3320457 ) ( TRUCK-AT ?auto_3320458 ?auto_3320450 ) ( not ( = ?auto_3320451 ?auto_3320454 ) ) ( not ( = ?auto_3320451 ?auto_3320452 ) ) ( not ( = ?auto_3320454 ?auto_3320452 ) ) ( not ( = ?auto_3320460 ?auto_3320457 ) ) ( not ( = ?auto_3320451 ?auto_3320456 ) ) ( not ( = ?auto_3320454 ?auto_3320456 ) ) ( not ( = ?auto_3320452 ?auto_3320456 ) ) ( not ( = ?auto_3320451 ?auto_3320455 ) ) ( not ( = ?auto_3320454 ?auto_3320455 ) ) ( not ( = ?auto_3320452 ?auto_3320455 ) ) ( not ( = ?auto_3320456 ?auto_3320455 ) ) ( not ( = ?auto_3320451 ?auto_3320453 ) ) ( not ( = ?auto_3320454 ?auto_3320453 ) ) ( not ( = ?auto_3320452 ?auto_3320453 ) ) ( not ( = ?auto_3320456 ?auto_3320453 ) ) ( not ( = ?auto_3320455 ?auto_3320453 ) ) ( not ( = ?auto_3320459 ?auto_3320460 ) ) ( not ( = ?auto_3320459 ?auto_3320457 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3320451 ?auto_3320454 ?auto_3320452 ?auto_3320456 ?auto_3320453 ?auto_3320455 ?auto_3320450 )
      ( DELIVER-6PKG-VERIFY ?auto_3320451 ?auto_3320452 ?auto_3320453 ?auto_3320454 ?auto_3320455 ?auto_3320456 ?auto_3320450 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3321671 - OBJ
      ?auto_3321672 - OBJ
      ?auto_3321673 - OBJ
      ?auto_3321674 - OBJ
      ?auto_3321675 - OBJ
      ?auto_3321676 - OBJ
      ?auto_3321670 - LOCATION
    )
    :vars
    (
      ?auto_3321679 - LOCATION
      ?auto_3321681 - CITY
      ?auto_3321680 - LOCATION
      ?auto_3321677 - LOCATION
      ?auto_3321678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3321679 ?auto_3321681 ) ( IN-CITY ?auto_3321670 ?auto_3321681 ) ( not ( = ?auto_3321670 ?auto_3321679 ) ) ( OBJ-AT ?auto_3321673 ?auto_3321679 ) ( IN-CITY ?auto_3321680 ?auto_3321681 ) ( not ( = ?auto_3321670 ?auto_3321680 ) ) ( OBJ-AT ?auto_3321674 ?auto_3321680 ) ( IN-CITY ?auto_3321677 ?auto_3321681 ) ( not ( = ?auto_3321670 ?auto_3321677 ) ) ( OBJ-AT ?auto_3321676 ?auto_3321677 ) ( OBJ-AT ?auto_3321672 ?auto_3321680 ) ( OBJ-AT ?auto_3321675 ?auto_3321677 ) ( OBJ-AT ?auto_3321671 ?auto_3321677 ) ( TRUCK-AT ?auto_3321678 ?auto_3321670 ) ( not ( = ?auto_3321671 ?auto_3321675 ) ) ( not ( = ?auto_3321671 ?auto_3321672 ) ) ( not ( = ?auto_3321675 ?auto_3321672 ) ) ( not ( = ?auto_3321680 ?auto_3321677 ) ) ( not ( = ?auto_3321671 ?auto_3321676 ) ) ( not ( = ?auto_3321675 ?auto_3321676 ) ) ( not ( = ?auto_3321672 ?auto_3321676 ) ) ( not ( = ?auto_3321671 ?auto_3321674 ) ) ( not ( = ?auto_3321675 ?auto_3321674 ) ) ( not ( = ?auto_3321672 ?auto_3321674 ) ) ( not ( = ?auto_3321676 ?auto_3321674 ) ) ( not ( = ?auto_3321671 ?auto_3321673 ) ) ( not ( = ?auto_3321675 ?auto_3321673 ) ) ( not ( = ?auto_3321672 ?auto_3321673 ) ) ( not ( = ?auto_3321676 ?auto_3321673 ) ) ( not ( = ?auto_3321674 ?auto_3321673 ) ) ( not ( = ?auto_3321679 ?auto_3321680 ) ) ( not ( = ?auto_3321679 ?auto_3321677 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3321671 ?auto_3321675 ?auto_3321672 ?auto_3321676 ?auto_3321673 ?auto_3321674 ?auto_3321670 )
      ( DELIVER-6PKG-VERIFY ?auto_3321671 ?auto_3321672 ?auto_3321673 ?auto_3321674 ?auto_3321675 ?auto_3321676 ?auto_3321670 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3345016 - OBJ
      ?auto_3345017 - OBJ
      ?auto_3345018 - OBJ
      ?auto_3345019 - OBJ
      ?auto_3345020 - OBJ
      ?auto_3345021 - OBJ
      ?auto_3345015 - LOCATION
    )
    :vars
    (
      ?auto_3345024 - LOCATION
      ?auto_3345026 - CITY
      ?auto_3345025 - LOCATION
      ?auto_3345022 - LOCATION
      ?auto_3345023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3345024 ?auto_3345026 ) ( IN-CITY ?auto_3345015 ?auto_3345026 ) ( not ( = ?auto_3345015 ?auto_3345024 ) ) ( OBJ-AT ?auto_3345017 ?auto_3345024 ) ( IN-CITY ?auto_3345025 ?auto_3345026 ) ( not ( = ?auto_3345015 ?auto_3345025 ) ) ( OBJ-AT ?auto_3345021 ?auto_3345025 ) ( IN-CITY ?auto_3345022 ?auto_3345026 ) ( not ( = ?auto_3345015 ?auto_3345022 ) ) ( OBJ-AT ?auto_3345020 ?auto_3345022 ) ( OBJ-AT ?auto_3345019 ?auto_3345025 ) ( OBJ-AT ?auto_3345018 ?auto_3345022 ) ( OBJ-AT ?auto_3345016 ?auto_3345022 ) ( TRUCK-AT ?auto_3345023 ?auto_3345015 ) ( not ( = ?auto_3345016 ?auto_3345018 ) ) ( not ( = ?auto_3345016 ?auto_3345019 ) ) ( not ( = ?auto_3345018 ?auto_3345019 ) ) ( not ( = ?auto_3345025 ?auto_3345022 ) ) ( not ( = ?auto_3345016 ?auto_3345020 ) ) ( not ( = ?auto_3345018 ?auto_3345020 ) ) ( not ( = ?auto_3345019 ?auto_3345020 ) ) ( not ( = ?auto_3345016 ?auto_3345021 ) ) ( not ( = ?auto_3345018 ?auto_3345021 ) ) ( not ( = ?auto_3345019 ?auto_3345021 ) ) ( not ( = ?auto_3345020 ?auto_3345021 ) ) ( not ( = ?auto_3345016 ?auto_3345017 ) ) ( not ( = ?auto_3345018 ?auto_3345017 ) ) ( not ( = ?auto_3345019 ?auto_3345017 ) ) ( not ( = ?auto_3345020 ?auto_3345017 ) ) ( not ( = ?auto_3345021 ?auto_3345017 ) ) ( not ( = ?auto_3345024 ?auto_3345025 ) ) ( not ( = ?auto_3345024 ?auto_3345022 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3345016 ?auto_3345018 ?auto_3345019 ?auto_3345020 ?auto_3345017 ?auto_3345021 ?auto_3345015 )
      ( DELIVER-6PKG-VERIFY ?auto_3345016 ?auto_3345017 ?auto_3345018 ?auto_3345019 ?auto_3345020 ?auto_3345021 ?auto_3345015 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3345080 - OBJ
      ?auto_3345081 - OBJ
      ?auto_3345082 - OBJ
      ?auto_3345083 - OBJ
      ?auto_3345084 - OBJ
      ?auto_3345085 - OBJ
      ?auto_3345079 - LOCATION
    )
    :vars
    (
      ?auto_3345088 - LOCATION
      ?auto_3345090 - CITY
      ?auto_3345089 - LOCATION
      ?auto_3345086 - LOCATION
      ?auto_3345087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3345088 ?auto_3345090 ) ( IN-CITY ?auto_3345079 ?auto_3345090 ) ( not ( = ?auto_3345079 ?auto_3345088 ) ) ( OBJ-AT ?auto_3345081 ?auto_3345088 ) ( IN-CITY ?auto_3345089 ?auto_3345090 ) ( not ( = ?auto_3345079 ?auto_3345089 ) ) ( OBJ-AT ?auto_3345084 ?auto_3345089 ) ( IN-CITY ?auto_3345086 ?auto_3345090 ) ( not ( = ?auto_3345079 ?auto_3345086 ) ) ( OBJ-AT ?auto_3345085 ?auto_3345086 ) ( OBJ-AT ?auto_3345083 ?auto_3345089 ) ( OBJ-AT ?auto_3345082 ?auto_3345086 ) ( OBJ-AT ?auto_3345080 ?auto_3345086 ) ( TRUCK-AT ?auto_3345087 ?auto_3345079 ) ( not ( = ?auto_3345080 ?auto_3345082 ) ) ( not ( = ?auto_3345080 ?auto_3345083 ) ) ( not ( = ?auto_3345082 ?auto_3345083 ) ) ( not ( = ?auto_3345089 ?auto_3345086 ) ) ( not ( = ?auto_3345080 ?auto_3345085 ) ) ( not ( = ?auto_3345082 ?auto_3345085 ) ) ( not ( = ?auto_3345083 ?auto_3345085 ) ) ( not ( = ?auto_3345080 ?auto_3345084 ) ) ( not ( = ?auto_3345082 ?auto_3345084 ) ) ( not ( = ?auto_3345083 ?auto_3345084 ) ) ( not ( = ?auto_3345085 ?auto_3345084 ) ) ( not ( = ?auto_3345080 ?auto_3345081 ) ) ( not ( = ?auto_3345082 ?auto_3345081 ) ) ( not ( = ?auto_3345083 ?auto_3345081 ) ) ( not ( = ?auto_3345085 ?auto_3345081 ) ) ( not ( = ?auto_3345084 ?auto_3345081 ) ) ( not ( = ?auto_3345088 ?auto_3345089 ) ) ( not ( = ?auto_3345088 ?auto_3345086 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3345080 ?auto_3345082 ?auto_3345083 ?auto_3345085 ?auto_3345081 ?auto_3345084 ?auto_3345079 )
      ( DELIVER-6PKG-VERIFY ?auto_3345080 ?auto_3345081 ?auto_3345082 ?auto_3345083 ?auto_3345084 ?auto_3345085 ?auto_3345079 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3345416 - OBJ
      ?auto_3345417 - OBJ
      ?auto_3345418 - OBJ
      ?auto_3345419 - OBJ
      ?auto_3345420 - OBJ
      ?auto_3345421 - OBJ
      ?auto_3345415 - LOCATION
    )
    :vars
    (
      ?auto_3345424 - LOCATION
      ?auto_3345426 - CITY
      ?auto_3345425 - LOCATION
      ?auto_3345422 - LOCATION
      ?auto_3345423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3345424 ?auto_3345426 ) ( IN-CITY ?auto_3345415 ?auto_3345426 ) ( not ( = ?auto_3345415 ?auto_3345424 ) ) ( OBJ-AT ?auto_3345417 ?auto_3345424 ) ( IN-CITY ?auto_3345425 ?auto_3345426 ) ( not ( = ?auto_3345415 ?auto_3345425 ) ) ( OBJ-AT ?auto_3345421 ?auto_3345425 ) ( IN-CITY ?auto_3345422 ?auto_3345426 ) ( not ( = ?auto_3345415 ?auto_3345422 ) ) ( OBJ-AT ?auto_3345419 ?auto_3345422 ) ( OBJ-AT ?auto_3345420 ?auto_3345425 ) ( OBJ-AT ?auto_3345418 ?auto_3345422 ) ( OBJ-AT ?auto_3345416 ?auto_3345422 ) ( TRUCK-AT ?auto_3345423 ?auto_3345415 ) ( not ( = ?auto_3345416 ?auto_3345418 ) ) ( not ( = ?auto_3345416 ?auto_3345420 ) ) ( not ( = ?auto_3345418 ?auto_3345420 ) ) ( not ( = ?auto_3345425 ?auto_3345422 ) ) ( not ( = ?auto_3345416 ?auto_3345419 ) ) ( not ( = ?auto_3345418 ?auto_3345419 ) ) ( not ( = ?auto_3345420 ?auto_3345419 ) ) ( not ( = ?auto_3345416 ?auto_3345421 ) ) ( not ( = ?auto_3345418 ?auto_3345421 ) ) ( not ( = ?auto_3345420 ?auto_3345421 ) ) ( not ( = ?auto_3345419 ?auto_3345421 ) ) ( not ( = ?auto_3345416 ?auto_3345417 ) ) ( not ( = ?auto_3345418 ?auto_3345417 ) ) ( not ( = ?auto_3345420 ?auto_3345417 ) ) ( not ( = ?auto_3345419 ?auto_3345417 ) ) ( not ( = ?auto_3345421 ?auto_3345417 ) ) ( not ( = ?auto_3345424 ?auto_3345425 ) ) ( not ( = ?auto_3345424 ?auto_3345422 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3345416 ?auto_3345418 ?auto_3345420 ?auto_3345419 ?auto_3345417 ?auto_3345421 ?auto_3345415 )
      ( DELIVER-6PKG-VERIFY ?auto_3345416 ?auto_3345417 ?auto_3345418 ?auto_3345419 ?auto_3345420 ?auto_3345421 ?auto_3345415 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3347461 - OBJ
      ?auto_3347462 - OBJ
      ?auto_3347463 - OBJ
      ?auto_3347464 - OBJ
      ?auto_3347465 - OBJ
      ?auto_3347466 - OBJ
      ?auto_3347460 - LOCATION
    )
    :vars
    (
      ?auto_3347469 - LOCATION
      ?auto_3347471 - CITY
      ?auto_3347470 - LOCATION
      ?auto_3347467 - LOCATION
      ?auto_3347468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3347469 ?auto_3347471 ) ( IN-CITY ?auto_3347460 ?auto_3347471 ) ( not ( = ?auto_3347460 ?auto_3347469 ) ) ( OBJ-AT ?auto_3347462 ?auto_3347469 ) ( IN-CITY ?auto_3347470 ?auto_3347471 ) ( not ( = ?auto_3347460 ?auto_3347470 ) ) ( OBJ-AT ?auto_3347466 ?auto_3347470 ) ( IN-CITY ?auto_3347467 ?auto_3347471 ) ( not ( = ?auto_3347460 ?auto_3347467 ) ) ( OBJ-AT ?auto_3347465 ?auto_3347467 ) ( OBJ-AT ?auto_3347463 ?auto_3347470 ) ( OBJ-AT ?auto_3347464 ?auto_3347467 ) ( OBJ-AT ?auto_3347461 ?auto_3347467 ) ( TRUCK-AT ?auto_3347468 ?auto_3347460 ) ( not ( = ?auto_3347461 ?auto_3347464 ) ) ( not ( = ?auto_3347461 ?auto_3347463 ) ) ( not ( = ?auto_3347464 ?auto_3347463 ) ) ( not ( = ?auto_3347470 ?auto_3347467 ) ) ( not ( = ?auto_3347461 ?auto_3347465 ) ) ( not ( = ?auto_3347464 ?auto_3347465 ) ) ( not ( = ?auto_3347463 ?auto_3347465 ) ) ( not ( = ?auto_3347461 ?auto_3347466 ) ) ( not ( = ?auto_3347464 ?auto_3347466 ) ) ( not ( = ?auto_3347463 ?auto_3347466 ) ) ( not ( = ?auto_3347465 ?auto_3347466 ) ) ( not ( = ?auto_3347461 ?auto_3347462 ) ) ( not ( = ?auto_3347464 ?auto_3347462 ) ) ( not ( = ?auto_3347463 ?auto_3347462 ) ) ( not ( = ?auto_3347465 ?auto_3347462 ) ) ( not ( = ?auto_3347466 ?auto_3347462 ) ) ( not ( = ?auto_3347469 ?auto_3347470 ) ) ( not ( = ?auto_3347469 ?auto_3347467 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3347461 ?auto_3347464 ?auto_3347463 ?auto_3347465 ?auto_3347462 ?auto_3347466 ?auto_3347460 )
      ( DELIVER-6PKG-VERIFY ?auto_3347461 ?auto_3347462 ?auto_3347463 ?auto_3347464 ?auto_3347465 ?auto_3347466 ?auto_3347460 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3347525 - OBJ
      ?auto_3347526 - OBJ
      ?auto_3347527 - OBJ
      ?auto_3347528 - OBJ
      ?auto_3347529 - OBJ
      ?auto_3347530 - OBJ
      ?auto_3347524 - LOCATION
    )
    :vars
    (
      ?auto_3347533 - LOCATION
      ?auto_3347535 - CITY
      ?auto_3347534 - LOCATION
      ?auto_3347531 - LOCATION
      ?auto_3347532 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3347533 ?auto_3347535 ) ( IN-CITY ?auto_3347524 ?auto_3347535 ) ( not ( = ?auto_3347524 ?auto_3347533 ) ) ( OBJ-AT ?auto_3347526 ?auto_3347533 ) ( IN-CITY ?auto_3347534 ?auto_3347535 ) ( not ( = ?auto_3347524 ?auto_3347534 ) ) ( OBJ-AT ?auto_3347529 ?auto_3347534 ) ( IN-CITY ?auto_3347531 ?auto_3347535 ) ( not ( = ?auto_3347524 ?auto_3347531 ) ) ( OBJ-AT ?auto_3347530 ?auto_3347531 ) ( OBJ-AT ?auto_3347527 ?auto_3347534 ) ( OBJ-AT ?auto_3347528 ?auto_3347531 ) ( OBJ-AT ?auto_3347525 ?auto_3347531 ) ( TRUCK-AT ?auto_3347532 ?auto_3347524 ) ( not ( = ?auto_3347525 ?auto_3347528 ) ) ( not ( = ?auto_3347525 ?auto_3347527 ) ) ( not ( = ?auto_3347528 ?auto_3347527 ) ) ( not ( = ?auto_3347534 ?auto_3347531 ) ) ( not ( = ?auto_3347525 ?auto_3347530 ) ) ( not ( = ?auto_3347528 ?auto_3347530 ) ) ( not ( = ?auto_3347527 ?auto_3347530 ) ) ( not ( = ?auto_3347525 ?auto_3347529 ) ) ( not ( = ?auto_3347528 ?auto_3347529 ) ) ( not ( = ?auto_3347527 ?auto_3347529 ) ) ( not ( = ?auto_3347530 ?auto_3347529 ) ) ( not ( = ?auto_3347525 ?auto_3347526 ) ) ( not ( = ?auto_3347528 ?auto_3347526 ) ) ( not ( = ?auto_3347527 ?auto_3347526 ) ) ( not ( = ?auto_3347530 ?auto_3347526 ) ) ( not ( = ?auto_3347529 ?auto_3347526 ) ) ( not ( = ?auto_3347533 ?auto_3347534 ) ) ( not ( = ?auto_3347533 ?auto_3347531 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3347525 ?auto_3347528 ?auto_3347527 ?auto_3347530 ?auto_3347526 ?auto_3347529 ?auto_3347524 )
      ( DELIVER-6PKG-VERIFY ?auto_3347525 ?auto_3347526 ?auto_3347527 ?auto_3347528 ?auto_3347529 ?auto_3347530 ?auto_3347524 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3348745 - OBJ
      ?auto_3348746 - OBJ
      ?auto_3348747 - OBJ
      ?auto_3348748 - OBJ
      ?auto_3348749 - OBJ
      ?auto_3348750 - OBJ
      ?auto_3348744 - LOCATION
    )
    :vars
    (
      ?auto_3348753 - LOCATION
      ?auto_3348755 - CITY
      ?auto_3348754 - LOCATION
      ?auto_3348751 - LOCATION
      ?auto_3348752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3348753 ?auto_3348755 ) ( IN-CITY ?auto_3348744 ?auto_3348755 ) ( not ( = ?auto_3348744 ?auto_3348753 ) ) ( OBJ-AT ?auto_3348746 ?auto_3348753 ) ( IN-CITY ?auto_3348754 ?auto_3348755 ) ( not ( = ?auto_3348744 ?auto_3348754 ) ) ( OBJ-AT ?auto_3348748 ?auto_3348754 ) ( IN-CITY ?auto_3348751 ?auto_3348755 ) ( not ( = ?auto_3348744 ?auto_3348751 ) ) ( OBJ-AT ?auto_3348750 ?auto_3348751 ) ( OBJ-AT ?auto_3348747 ?auto_3348754 ) ( OBJ-AT ?auto_3348749 ?auto_3348751 ) ( OBJ-AT ?auto_3348745 ?auto_3348751 ) ( TRUCK-AT ?auto_3348752 ?auto_3348744 ) ( not ( = ?auto_3348745 ?auto_3348749 ) ) ( not ( = ?auto_3348745 ?auto_3348747 ) ) ( not ( = ?auto_3348749 ?auto_3348747 ) ) ( not ( = ?auto_3348754 ?auto_3348751 ) ) ( not ( = ?auto_3348745 ?auto_3348750 ) ) ( not ( = ?auto_3348749 ?auto_3348750 ) ) ( not ( = ?auto_3348747 ?auto_3348750 ) ) ( not ( = ?auto_3348745 ?auto_3348748 ) ) ( not ( = ?auto_3348749 ?auto_3348748 ) ) ( not ( = ?auto_3348747 ?auto_3348748 ) ) ( not ( = ?auto_3348750 ?auto_3348748 ) ) ( not ( = ?auto_3348745 ?auto_3348746 ) ) ( not ( = ?auto_3348749 ?auto_3348746 ) ) ( not ( = ?auto_3348747 ?auto_3348746 ) ) ( not ( = ?auto_3348750 ?auto_3348746 ) ) ( not ( = ?auto_3348748 ?auto_3348746 ) ) ( not ( = ?auto_3348753 ?auto_3348754 ) ) ( not ( = ?auto_3348753 ?auto_3348751 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3348745 ?auto_3348749 ?auto_3348747 ?auto_3348750 ?auto_3348746 ?auto_3348748 ?auto_3348744 )
      ( DELIVER-6PKG-VERIFY ?auto_3348745 ?auto_3348746 ?auto_3348747 ?auto_3348748 ?auto_3348749 ?auto_3348750 ?auto_3348744 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3423967 - OBJ
      ?auto_3423968 - OBJ
      ?auto_3423969 - OBJ
      ?auto_3423970 - OBJ
      ?auto_3423971 - OBJ
      ?auto_3423972 - OBJ
      ?auto_3423966 - LOCATION
    )
    :vars
    (
      ?auto_3423975 - LOCATION
      ?auto_3423977 - CITY
      ?auto_3423976 - LOCATION
      ?auto_3423973 - LOCATION
      ?auto_3423974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3423975 ?auto_3423977 ) ( IN-CITY ?auto_3423966 ?auto_3423977 ) ( not ( = ?auto_3423966 ?auto_3423975 ) ) ( OBJ-AT ?auto_3423972 ?auto_3423975 ) ( IN-CITY ?auto_3423976 ?auto_3423977 ) ( not ( = ?auto_3423966 ?auto_3423976 ) ) ( OBJ-AT ?auto_3423971 ?auto_3423976 ) ( IN-CITY ?auto_3423973 ?auto_3423977 ) ( not ( = ?auto_3423966 ?auto_3423973 ) ) ( OBJ-AT ?auto_3423970 ?auto_3423973 ) ( OBJ-AT ?auto_3423967 ?auto_3423976 ) ( OBJ-AT ?auto_3423969 ?auto_3423973 ) ( OBJ-AT ?auto_3423968 ?auto_3423973 ) ( TRUCK-AT ?auto_3423974 ?auto_3423966 ) ( not ( = ?auto_3423968 ?auto_3423969 ) ) ( not ( = ?auto_3423968 ?auto_3423967 ) ) ( not ( = ?auto_3423969 ?auto_3423967 ) ) ( not ( = ?auto_3423976 ?auto_3423973 ) ) ( not ( = ?auto_3423968 ?auto_3423970 ) ) ( not ( = ?auto_3423969 ?auto_3423970 ) ) ( not ( = ?auto_3423967 ?auto_3423970 ) ) ( not ( = ?auto_3423968 ?auto_3423971 ) ) ( not ( = ?auto_3423969 ?auto_3423971 ) ) ( not ( = ?auto_3423967 ?auto_3423971 ) ) ( not ( = ?auto_3423970 ?auto_3423971 ) ) ( not ( = ?auto_3423968 ?auto_3423972 ) ) ( not ( = ?auto_3423969 ?auto_3423972 ) ) ( not ( = ?auto_3423967 ?auto_3423972 ) ) ( not ( = ?auto_3423970 ?auto_3423972 ) ) ( not ( = ?auto_3423971 ?auto_3423972 ) ) ( not ( = ?auto_3423975 ?auto_3423976 ) ) ( not ( = ?auto_3423975 ?auto_3423973 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3423968 ?auto_3423969 ?auto_3423967 ?auto_3423970 ?auto_3423972 ?auto_3423971 ?auto_3423966 )
      ( DELIVER-6PKG-VERIFY ?auto_3423967 ?auto_3423968 ?auto_3423969 ?auto_3423970 ?auto_3423971 ?auto_3423972 ?auto_3423966 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3424031 - OBJ
      ?auto_3424032 - OBJ
      ?auto_3424033 - OBJ
      ?auto_3424034 - OBJ
      ?auto_3424035 - OBJ
      ?auto_3424036 - OBJ
      ?auto_3424030 - LOCATION
    )
    :vars
    (
      ?auto_3424039 - LOCATION
      ?auto_3424041 - CITY
      ?auto_3424040 - LOCATION
      ?auto_3424037 - LOCATION
      ?auto_3424038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3424039 ?auto_3424041 ) ( IN-CITY ?auto_3424030 ?auto_3424041 ) ( not ( = ?auto_3424030 ?auto_3424039 ) ) ( OBJ-AT ?auto_3424035 ?auto_3424039 ) ( IN-CITY ?auto_3424040 ?auto_3424041 ) ( not ( = ?auto_3424030 ?auto_3424040 ) ) ( OBJ-AT ?auto_3424036 ?auto_3424040 ) ( IN-CITY ?auto_3424037 ?auto_3424041 ) ( not ( = ?auto_3424030 ?auto_3424037 ) ) ( OBJ-AT ?auto_3424034 ?auto_3424037 ) ( OBJ-AT ?auto_3424031 ?auto_3424040 ) ( OBJ-AT ?auto_3424033 ?auto_3424037 ) ( OBJ-AT ?auto_3424032 ?auto_3424037 ) ( TRUCK-AT ?auto_3424038 ?auto_3424030 ) ( not ( = ?auto_3424032 ?auto_3424033 ) ) ( not ( = ?auto_3424032 ?auto_3424031 ) ) ( not ( = ?auto_3424033 ?auto_3424031 ) ) ( not ( = ?auto_3424040 ?auto_3424037 ) ) ( not ( = ?auto_3424032 ?auto_3424034 ) ) ( not ( = ?auto_3424033 ?auto_3424034 ) ) ( not ( = ?auto_3424031 ?auto_3424034 ) ) ( not ( = ?auto_3424032 ?auto_3424036 ) ) ( not ( = ?auto_3424033 ?auto_3424036 ) ) ( not ( = ?auto_3424031 ?auto_3424036 ) ) ( not ( = ?auto_3424034 ?auto_3424036 ) ) ( not ( = ?auto_3424032 ?auto_3424035 ) ) ( not ( = ?auto_3424033 ?auto_3424035 ) ) ( not ( = ?auto_3424031 ?auto_3424035 ) ) ( not ( = ?auto_3424034 ?auto_3424035 ) ) ( not ( = ?auto_3424036 ?auto_3424035 ) ) ( not ( = ?auto_3424039 ?auto_3424040 ) ) ( not ( = ?auto_3424039 ?auto_3424037 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3424032 ?auto_3424033 ?auto_3424031 ?auto_3424034 ?auto_3424035 ?auto_3424036 ?auto_3424030 )
      ( DELIVER-6PKG-VERIFY ?auto_3424031 ?auto_3424032 ?auto_3424033 ?auto_3424034 ?auto_3424035 ?auto_3424036 ?auto_3424030 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3424095 - OBJ
      ?auto_3424096 - OBJ
      ?auto_3424097 - OBJ
      ?auto_3424098 - OBJ
      ?auto_3424099 - OBJ
      ?auto_3424100 - OBJ
      ?auto_3424094 - LOCATION
    )
    :vars
    (
      ?auto_3424103 - LOCATION
      ?auto_3424105 - CITY
      ?auto_3424104 - LOCATION
      ?auto_3424101 - LOCATION
      ?auto_3424102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3424103 ?auto_3424105 ) ( IN-CITY ?auto_3424094 ?auto_3424105 ) ( not ( = ?auto_3424094 ?auto_3424103 ) ) ( OBJ-AT ?auto_3424100 ?auto_3424103 ) ( IN-CITY ?auto_3424104 ?auto_3424105 ) ( not ( = ?auto_3424094 ?auto_3424104 ) ) ( OBJ-AT ?auto_3424098 ?auto_3424104 ) ( IN-CITY ?auto_3424101 ?auto_3424105 ) ( not ( = ?auto_3424094 ?auto_3424101 ) ) ( OBJ-AT ?auto_3424099 ?auto_3424101 ) ( OBJ-AT ?auto_3424095 ?auto_3424104 ) ( OBJ-AT ?auto_3424097 ?auto_3424101 ) ( OBJ-AT ?auto_3424096 ?auto_3424101 ) ( TRUCK-AT ?auto_3424102 ?auto_3424094 ) ( not ( = ?auto_3424096 ?auto_3424097 ) ) ( not ( = ?auto_3424096 ?auto_3424095 ) ) ( not ( = ?auto_3424097 ?auto_3424095 ) ) ( not ( = ?auto_3424104 ?auto_3424101 ) ) ( not ( = ?auto_3424096 ?auto_3424099 ) ) ( not ( = ?auto_3424097 ?auto_3424099 ) ) ( not ( = ?auto_3424095 ?auto_3424099 ) ) ( not ( = ?auto_3424096 ?auto_3424098 ) ) ( not ( = ?auto_3424097 ?auto_3424098 ) ) ( not ( = ?auto_3424095 ?auto_3424098 ) ) ( not ( = ?auto_3424099 ?auto_3424098 ) ) ( not ( = ?auto_3424096 ?auto_3424100 ) ) ( not ( = ?auto_3424097 ?auto_3424100 ) ) ( not ( = ?auto_3424095 ?auto_3424100 ) ) ( not ( = ?auto_3424099 ?auto_3424100 ) ) ( not ( = ?auto_3424098 ?auto_3424100 ) ) ( not ( = ?auto_3424103 ?auto_3424104 ) ) ( not ( = ?auto_3424103 ?auto_3424101 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3424096 ?auto_3424097 ?auto_3424095 ?auto_3424099 ?auto_3424100 ?auto_3424098 ?auto_3424094 )
      ( DELIVER-6PKG-VERIFY ?auto_3424095 ?auto_3424096 ?auto_3424097 ?auto_3424098 ?auto_3424099 ?auto_3424100 ?auto_3424094 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3424159 - OBJ
      ?auto_3424160 - OBJ
      ?auto_3424161 - OBJ
      ?auto_3424162 - OBJ
      ?auto_3424163 - OBJ
      ?auto_3424164 - OBJ
      ?auto_3424158 - LOCATION
    )
    :vars
    (
      ?auto_3424167 - LOCATION
      ?auto_3424169 - CITY
      ?auto_3424168 - LOCATION
      ?auto_3424165 - LOCATION
      ?auto_3424166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3424167 ?auto_3424169 ) ( IN-CITY ?auto_3424158 ?auto_3424169 ) ( not ( = ?auto_3424158 ?auto_3424167 ) ) ( OBJ-AT ?auto_3424163 ?auto_3424167 ) ( IN-CITY ?auto_3424168 ?auto_3424169 ) ( not ( = ?auto_3424158 ?auto_3424168 ) ) ( OBJ-AT ?auto_3424162 ?auto_3424168 ) ( IN-CITY ?auto_3424165 ?auto_3424169 ) ( not ( = ?auto_3424158 ?auto_3424165 ) ) ( OBJ-AT ?auto_3424164 ?auto_3424165 ) ( OBJ-AT ?auto_3424159 ?auto_3424168 ) ( OBJ-AT ?auto_3424161 ?auto_3424165 ) ( OBJ-AT ?auto_3424160 ?auto_3424165 ) ( TRUCK-AT ?auto_3424166 ?auto_3424158 ) ( not ( = ?auto_3424160 ?auto_3424161 ) ) ( not ( = ?auto_3424160 ?auto_3424159 ) ) ( not ( = ?auto_3424161 ?auto_3424159 ) ) ( not ( = ?auto_3424168 ?auto_3424165 ) ) ( not ( = ?auto_3424160 ?auto_3424164 ) ) ( not ( = ?auto_3424161 ?auto_3424164 ) ) ( not ( = ?auto_3424159 ?auto_3424164 ) ) ( not ( = ?auto_3424160 ?auto_3424162 ) ) ( not ( = ?auto_3424161 ?auto_3424162 ) ) ( not ( = ?auto_3424159 ?auto_3424162 ) ) ( not ( = ?auto_3424164 ?auto_3424162 ) ) ( not ( = ?auto_3424160 ?auto_3424163 ) ) ( not ( = ?auto_3424161 ?auto_3424163 ) ) ( not ( = ?auto_3424159 ?auto_3424163 ) ) ( not ( = ?auto_3424164 ?auto_3424163 ) ) ( not ( = ?auto_3424162 ?auto_3424163 ) ) ( not ( = ?auto_3424167 ?auto_3424168 ) ) ( not ( = ?auto_3424167 ?auto_3424165 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3424160 ?auto_3424161 ?auto_3424159 ?auto_3424164 ?auto_3424163 ?auto_3424162 ?auto_3424158 )
      ( DELIVER-6PKG-VERIFY ?auto_3424159 ?auto_3424160 ?auto_3424161 ?auto_3424162 ?auto_3424163 ?auto_3424164 ?auto_3424158 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3424495 - OBJ
      ?auto_3424496 - OBJ
      ?auto_3424497 - OBJ
      ?auto_3424498 - OBJ
      ?auto_3424499 - OBJ
      ?auto_3424500 - OBJ
      ?auto_3424494 - LOCATION
    )
    :vars
    (
      ?auto_3424503 - LOCATION
      ?auto_3424505 - CITY
      ?auto_3424504 - LOCATION
      ?auto_3424501 - LOCATION
      ?auto_3424502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3424503 ?auto_3424505 ) ( IN-CITY ?auto_3424494 ?auto_3424505 ) ( not ( = ?auto_3424494 ?auto_3424503 ) ) ( OBJ-AT ?auto_3424498 ?auto_3424503 ) ( IN-CITY ?auto_3424504 ?auto_3424505 ) ( not ( = ?auto_3424494 ?auto_3424504 ) ) ( OBJ-AT ?auto_3424500 ?auto_3424504 ) ( IN-CITY ?auto_3424501 ?auto_3424505 ) ( not ( = ?auto_3424494 ?auto_3424501 ) ) ( OBJ-AT ?auto_3424499 ?auto_3424501 ) ( OBJ-AT ?auto_3424495 ?auto_3424504 ) ( OBJ-AT ?auto_3424497 ?auto_3424501 ) ( OBJ-AT ?auto_3424496 ?auto_3424501 ) ( TRUCK-AT ?auto_3424502 ?auto_3424494 ) ( not ( = ?auto_3424496 ?auto_3424497 ) ) ( not ( = ?auto_3424496 ?auto_3424495 ) ) ( not ( = ?auto_3424497 ?auto_3424495 ) ) ( not ( = ?auto_3424504 ?auto_3424501 ) ) ( not ( = ?auto_3424496 ?auto_3424499 ) ) ( not ( = ?auto_3424497 ?auto_3424499 ) ) ( not ( = ?auto_3424495 ?auto_3424499 ) ) ( not ( = ?auto_3424496 ?auto_3424500 ) ) ( not ( = ?auto_3424497 ?auto_3424500 ) ) ( not ( = ?auto_3424495 ?auto_3424500 ) ) ( not ( = ?auto_3424499 ?auto_3424500 ) ) ( not ( = ?auto_3424496 ?auto_3424498 ) ) ( not ( = ?auto_3424497 ?auto_3424498 ) ) ( not ( = ?auto_3424495 ?auto_3424498 ) ) ( not ( = ?auto_3424499 ?auto_3424498 ) ) ( not ( = ?auto_3424500 ?auto_3424498 ) ) ( not ( = ?auto_3424503 ?auto_3424504 ) ) ( not ( = ?auto_3424503 ?auto_3424501 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3424496 ?auto_3424497 ?auto_3424495 ?auto_3424499 ?auto_3424498 ?auto_3424500 ?auto_3424494 )
      ( DELIVER-6PKG-VERIFY ?auto_3424495 ?auto_3424496 ?auto_3424497 ?auto_3424498 ?auto_3424499 ?auto_3424500 ?auto_3424494 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3424559 - OBJ
      ?auto_3424560 - OBJ
      ?auto_3424561 - OBJ
      ?auto_3424562 - OBJ
      ?auto_3424563 - OBJ
      ?auto_3424564 - OBJ
      ?auto_3424558 - LOCATION
    )
    :vars
    (
      ?auto_3424567 - LOCATION
      ?auto_3424569 - CITY
      ?auto_3424568 - LOCATION
      ?auto_3424565 - LOCATION
      ?auto_3424566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3424567 ?auto_3424569 ) ( IN-CITY ?auto_3424558 ?auto_3424569 ) ( not ( = ?auto_3424558 ?auto_3424567 ) ) ( OBJ-AT ?auto_3424562 ?auto_3424567 ) ( IN-CITY ?auto_3424568 ?auto_3424569 ) ( not ( = ?auto_3424558 ?auto_3424568 ) ) ( OBJ-AT ?auto_3424563 ?auto_3424568 ) ( IN-CITY ?auto_3424565 ?auto_3424569 ) ( not ( = ?auto_3424558 ?auto_3424565 ) ) ( OBJ-AT ?auto_3424564 ?auto_3424565 ) ( OBJ-AT ?auto_3424559 ?auto_3424568 ) ( OBJ-AT ?auto_3424561 ?auto_3424565 ) ( OBJ-AT ?auto_3424560 ?auto_3424565 ) ( TRUCK-AT ?auto_3424566 ?auto_3424558 ) ( not ( = ?auto_3424560 ?auto_3424561 ) ) ( not ( = ?auto_3424560 ?auto_3424559 ) ) ( not ( = ?auto_3424561 ?auto_3424559 ) ) ( not ( = ?auto_3424568 ?auto_3424565 ) ) ( not ( = ?auto_3424560 ?auto_3424564 ) ) ( not ( = ?auto_3424561 ?auto_3424564 ) ) ( not ( = ?auto_3424559 ?auto_3424564 ) ) ( not ( = ?auto_3424560 ?auto_3424563 ) ) ( not ( = ?auto_3424561 ?auto_3424563 ) ) ( not ( = ?auto_3424559 ?auto_3424563 ) ) ( not ( = ?auto_3424564 ?auto_3424563 ) ) ( not ( = ?auto_3424560 ?auto_3424562 ) ) ( not ( = ?auto_3424561 ?auto_3424562 ) ) ( not ( = ?auto_3424559 ?auto_3424562 ) ) ( not ( = ?auto_3424564 ?auto_3424562 ) ) ( not ( = ?auto_3424563 ?auto_3424562 ) ) ( not ( = ?auto_3424567 ?auto_3424568 ) ) ( not ( = ?auto_3424567 ?auto_3424565 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3424560 ?auto_3424561 ?auto_3424559 ?auto_3424564 ?auto_3424562 ?auto_3424563 ?auto_3424558 )
      ( DELIVER-6PKG-VERIFY ?auto_3424559 ?auto_3424560 ?auto_3424561 ?auto_3424562 ?auto_3424563 ?auto_3424564 ?auto_3424558 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3427327 - OBJ
      ?auto_3427328 - OBJ
      ?auto_3427329 - OBJ
      ?auto_3427330 - OBJ
      ?auto_3427331 - OBJ
      ?auto_3427332 - OBJ
      ?auto_3427326 - LOCATION
    )
    :vars
    (
      ?auto_3427335 - LOCATION
      ?auto_3427337 - CITY
      ?auto_3427336 - LOCATION
      ?auto_3427333 - LOCATION
      ?auto_3427334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3427335 ?auto_3427337 ) ( IN-CITY ?auto_3427326 ?auto_3427337 ) ( not ( = ?auto_3427326 ?auto_3427335 ) ) ( OBJ-AT ?auto_3427332 ?auto_3427335 ) ( IN-CITY ?auto_3427336 ?auto_3427337 ) ( not ( = ?auto_3427326 ?auto_3427336 ) ) ( OBJ-AT ?auto_3427329 ?auto_3427336 ) ( IN-CITY ?auto_3427333 ?auto_3427337 ) ( not ( = ?auto_3427326 ?auto_3427333 ) ) ( OBJ-AT ?auto_3427331 ?auto_3427333 ) ( OBJ-AT ?auto_3427327 ?auto_3427336 ) ( OBJ-AT ?auto_3427330 ?auto_3427333 ) ( OBJ-AT ?auto_3427328 ?auto_3427333 ) ( TRUCK-AT ?auto_3427334 ?auto_3427326 ) ( not ( = ?auto_3427328 ?auto_3427330 ) ) ( not ( = ?auto_3427328 ?auto_3427327 ) ) ( not ( = ?auto_3427330 ?auto_3427327 ) ) ( not ( = ?auto_3427336 ?auto_3427333 ) ) ( not ( = ?auto_3427328 ?auto_3427331 ) ) ( not ( = ?auto_3427330 ?auto_3427331 ) ) ( not ( = ?auto_3427327 ?auto_3427331 ) ) ( not ( = ?auto_3427328 ?auto_3427329 ) ) ( not ( = ?auto_3427330 ?auto_3427329 ) ) ( not ( = ?auto_3427327 ?auto_3427329 ) ) ( not ( = ?auto_3427331 ?auto_3427329 ) ) ( not ( = ?auto_3427328 ?auto_3427332 ) ) ( not ( = ?auto_3427330 ?auto_3427332 ) ) ( not ( = ?auto_3427327 ?auto_3427332 ) ) ( not ( = ?auto_3427331 ?auto_3427332 ) ) ( not ( = ?auto_3427329 ?auto_3427332 ) ) ( not ( = ?auto_3427335 ?auto_3427336 ) ) ( not ( = ?auto_3427335 ?auto_3427333 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3427328 ?auto_3427330 ?auto_3427327 ?auto_3427331 ?auto_3427332 ?auto_3427329 ?auto_3427326 )
      ( DELIVER-6PKG-VERIFY ?auto_3427327 ?auto_3427328 ?auto_3427329 ?auto_3427330 ?auto_3427331 ?auto_3427332 ?auto_3427326 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3427391 - OBJ
      ?auto_3427392 - OBJ
      ?auto_3427393 - OBJ
      ?auto_3427394 - OBJ
      ?auto_3427395 - OBJ
      ?auto_3427396 - OBJ
      ?auto_3427390 - LOCATION
    )
    :vars
    (
      ?auto_3427399 - LOCATION
      ?auto_3427401 - CITY
      ?auto_3427400 - LOCATION
      ?auto_3427397 - LOCATION
      ?auto_3427398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3427399 ?auto_3427401 ) ( IN-CITY ?auto_3427390 ?auto_3427401 ) ( not ( = ?auto_3427390 ?auto_3427399 ) ) ( OBJ-AT ?auto_3427395 ?auto_3427399 ) ( IN-CITY ?auto_3427400 ?auto_3427401 ) ( not ( = ?auto_3427390 ?auto_3427400 ) ) ( OBJ-AT ?auto_3427393 ?auto_3427400 ) ( IN-CITY ?auto_3427397 ?auto_3427401 ) ( not ( = ?auto_3427390 ?auto_3427397 ) ) ( OBJ-AT ?auto_3427396 ?auto_3427397 ) ( OBJ-AT ?auto_3427391 ?auto_3427400 ) ( OBJ-AT ?auto_3427394 ?auto_3427397 ) ( OBJ-AT ?auto_3427392 ?auto_3427397 ) ( TRUCK-AT ?auto_3427398 ?auto_3427390 ) ( not ( = ?auto_3427392 ?auto_3427394 ) ) ( not ( = ?auto_3427392 ?auto_3427391 ) ) ( not ( = ?auto_3427394 ?auto_3427391 ) ) ( not ( = ?auto_3427400 ?auto_3427397 ) ) ( not ( = ?auto_3427392 ?auto_3427396 ) ) ( not ( = ?auto_3427394 ?auto_3427396 ) ) ( not ( = ?auto_3427391 ?auto_3427396 ) ) ( not ( = ?auto_3427392 ?auto_3427393 ) ) ( not ( = ?auto_3427394 ?auto_3427393 ) ) ( not ( = ?auto_3427391 ?auto_3427393 ) ) ( not ( = ?auto_3427396 ?auto_3427393 ) ) ( not ( = ?auto_3427392 ?auto_3427395 ) ) ( not ( = ?auto_3427394 ?auto_3427395 ) ) ( not ( = ?auto_3427391 ?auto_3427395 ) ) ( not ( = ?auto_3427396 ?auto_3427395 ) ) ( not ( = ?auto_3427393 ?auto_3427395 ) ) ( not ( = ?auto_3427399 ?auto_3427400 ) ) ( not ( = ?auto_3427399 ?auto_3427397 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3427392 ?auto_3427394 ?auto_3427391 ?auto_3427396 ?auto_3427395 ?auto_3427393 ?auto_3427390 )
      ( DELIVER-6PKG-VERIFY ?auto_3427391 ?auto_3427392 ?auto_3427393 ?auto_3427394 ?auto_3427395 ?auto_3427396 ?auto_3427390 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3427981 - OBJ
      ?auto_3427982 - OBJ
      ?auto_3427983 - OBJ
      ?auto_3427984 - OBJ
      ?auto_3427985 - OBJ
      ?auto_3427986 - OBJ
      ?auto_3427980 - LOCATION
    )
    :vars
    (
      ?auto_3427989 - LOCATION
      ?auto_3427991 - CITY
      ?auto_3427990 - LOCATION
      ?auto_3427987 - LOCATION
      ?auto_3427988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3427989 ?auto_3427991 ) ( IN-CITY ?auto_3427980 ?auto_3427991 ) ( not ( = ?auto_3427980 ?auto_3427989 ) ) ( OBJ-AT ?auto_3427984 ?auto_3427989 ) ( IN-CITY ?auto_3427990 ?auto_3427991 ) ( not ( = ?auto_3427980 ?auto_3427990 ) ) ( OBJ-AT ?auto_3427983 ?auto_3427990 ) ( IN-CITY ?auto_3427987 ?auto_3427991 ) ( not ( = ?auto_3427980 ?auto_3427987 ) ) ( OBJ-AT ?auto_3427986 ?auto_3427987 ) ( OBJ-AT ?auto_3427981 ?auto_3427990 ) ( OBJ-AT ?auto_3427985 ?auto_3427987 ) ( OBJ-AT ?auto_3427982 ?auto_3427987 ) ( TRUCK-AT ?auto_3427988 ?auto_3427980 ) ( not ( = ?auto_3427982 ?auto_3427985 ) ) ( not ( = ?auto_3427982 ?auto_3427981 ) ) ( not ( = ?auto_3427985 ?auto_3427981 ) ) ( not ( = ?auto_3427990 ?auto_3427987 ) ) ( not ( = ?auto_3427982 ?auto_3427986 ) ) ( not ( = ?auto_3427985 ?auto_3427986 ) ) ( not ( = ?auto_3427981 ?auto_3427986 ) ) ( not ( = ?auto_3427982 ?auto_3427983 ) ) ( not ( = ?auto_3427985 ?auto_3427983 ) ) ( not ( = ?auto_3427981 ?auto_3427983 ) ) ( not ( = ?auto_3427986 ?auto_3427983 ) ) ( not ( = ?auto_3427982 ?auto_3427984 ) ) ( not ( = ?auto_3427985 ?auto_3427984 ) ) ( not ( = ?auto_3427981 ?auto_3427984 ) ) ( not ( = ?auto_3427986 ?auto_3427984 ) ) ( not ( = ?auto_3427983 ?auto_3427984 ) ) ( not ( = ?auto_3427989 ?auto_3427990 ) ) ( not ( = ?auto_3427989 ?auto_3427987 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3427982 ?auto_3427985 ?auto_3427981 ?auto_3427986 ?auto_3427984 ?auto_3427983 ?auto_3427980 )
      ( DELIVER-6PKG-VERIFY ?auto_3427981 ?auto_3427982 ?auto_3427983 ?auto_3427984 ?auto_3427985 ?auto_3427986 ?auto_3427980 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3429142 - OBJ
      ?auto_3429143 - OBJ
      ?auto_3429144 - OBJ
      ?auto_3429145 - OBJ
      ?auto_3429146 - OBJ
      ?auto_3429147 - OBJ
      ?auto_3429141 - LOCATION
    )
    :vars
    (
      ?auto_3429150 - LOCATION
      ?auto_3429152 - CITY
      ?auto_3429151 - LOCATION
      ?auto_3429148 - LOCATION
      ?auto_3429149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3429150 ?auto_3429152 ) ( IN-CITY ?auto_3429141 ?auto_3429152 ) ( not ( = ?auto_3429141 ?auto_3429150 ) ) ( OBJ-AT ?auto_3429144 ?auto_3429150 ) ( IN-CITY ?auto_3429151 ?auto_3429152 ) ( not ( = ?auto_3429141 ?auto_3429151 ) ) ( OBJ-AT ?auto_3429147 ?auto_3429151 ) ( IN-CITY ?auto_3429148 ?auto_3429152 ) ( not ( = ?auto_3429141 ?auto_3429148 ) ) ( OBJ-AT ?auto_3429146 ?auto_3429148 ) ( OBJ-AT ?auto_3429142 ?auto_3429151 ) ( OBJ-AT ?auto_3429145 ?auto_3429148 ) ( OBJ-AT ?auto_3429143 ?auto_3429148 ) ( TRUCK-AT ?auto_3429149 ?auto_3429141 ) ( not ( = ?auto_3429143 ?auto_3429145 ) ) ( not ( = ?auto_3429143 ?auto_3429142 ) ) ( not ( = ?auto_3429145 ?auto_3429142 ) ) ( not ( = ?auto_3429151 ?auto_3429148 ) ) ( not ( = ?auto_3429143 ?auto_3429146 ) ) ( not ( = ?auto_3429145 ?auto_3429146 ) ) ( not ( = ?auto_3429142 ?auto_3429146 ) ) ( not ( = ?auto_3429143 ?auto_3429147 ) ) ( not ( = ?auto_3429145 ?auto_3429147 ) ) ( not ( = ?auto_3429142 ?auto_3429147 ) ) ( not ( = ?auto_3429146 ?auto_3429147 ) ) ( not ( = ?auto_3429143 ?auto_3429144 ) ) ( not ( = ?auto_3429145 ?auto_3429144 ) ) ( not ( = ?auto_3429142 ?auto_3429144 ) ) ( not ( = ?auto_3429146 ?auto_3429144 ) ) ( not ( = ?auto_3429147 ?auto_3429144 ) ) ( not ( = ?auto_3429150 ?auto_3429151 ) ) ( not ( = ?auto_3429150 ?auto_3429148 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3429143 ?auto_3429145 ?auto_3429142 ?auto_3429146 ?auto_3429144 ?auto_3429147 ?auto_3429141 )
      ( DELIVER-6PKG-VERIFY ?auto_3429142 ?auto_3429143 ?auto_3429144 ?auto_3429145 ?auto_3429146 ?auto_3429147 ?auto_3429141 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3429206 - OBJ
      ?auto_3429207 - OBJ
      ?auto_3429208 - OBJ
      ?auto_3429209 - OBJ
      ?auto_3429210 - OBJ
      ?auto_3429211 - OBJ
      ?auto_3429205 - LOCATION
    )
    :vars
    (
      ?auto_3429214 - LOCATION
      ?auto_3429216 - CITY
      ?auto_3429215 - LOCATION
      ?auto_3429212 - LOCATION
      ?auto_3429213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3429214 ?auto_3429216 ) ( IN-CITY ?auto_3429205 ?auto_3429216 ) ( not ( = ?auto_3429205 ?auto_3429214 ) ) ( OBJ-AT ?auto_3429208 ?auto_3429214 ) ( IN-CITY ?auto_3429215 ?auto_3429216 ) ( not ( = ?auto_3429205 ?auto_3429215 ) ) ( OBJ-AT ?auto_3429210 ?auto_3429215 ) ( IN-CITY ?auto_3429212 ?auto_3429216 ) ( not ( = ?auto_3429205 ?auto_3429212 ) ) ( OBJ-AT ?auto_3429211 ?auto_3429212 ) ( OBJ-AT ?auto_3429206 ?auto_3429215 ) ( OBJ-AT ?auto_3429209 ?auto_3429212 ) ( OBJ-AT ?auto_3429207 ?auto_3429212 ) ( TRUCK-AT ?auto_3429213 ?auto_3429205 ) ( not ( = ?auto_3429207 ?auto_3429209 ) ) ( not ( = ?auto_3429207 ?auto_3429206 ) ) ( not ( = ?auto_3429209 ?auto_3429206 ) ) ( not ( = ?auto_3429215 ?auto_3429212 ) ) ( not ( = ?auto_3429207 ?auto_3429211 ) ) ( not ( = ?auto_3429209 ?auto_3429211 ) ) ( not ( = ?auto_3429206 ?auto_3429211 ) ) ( not ( = ?auto_3429207 ?auto_3429210 ) ) ( not ( = ?auto_3429209 ?auto_3429210 ) ) ( not ( = ?auto_3429206 ?auto_3429210 ) ) ( not ( = ?auto_3429211 ?auto_3429210 ) ) ( not ( = ?auto_3429207 ?auto_3429208 ) ) ( not ( = ?auto_3429209 ?auto_3429208 ) ) ( not ( = ?auto_3429206 ?auto_3429208 ) ) ( not ( = ?auto_3429211 ?auto_3429208 ) ) ( not ( = ?auto_3429210 ?auto_3429208 ) ) ( not ( = ?auto_3429214 ?auto_3429215 ) ) ( not ( = ?auto_3429214 ?auto_3429212 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3429207 ?auto_3429209 ?auto_3429206 ?auto_3429211 ?auto_3429208 ?auto_3429210 ?auto_3429205 )
      ( DELIVER-6PKG-VERIFY ?auto_3429206 ?auto_3429207 ?auto_3429208 ?auto_3429209 ?auto_3429210 ?auto_3429211 ?auto_3429205 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3430426 - OBJ
      ?auto_3430427 - OBJ
      ?auto_3430428 - OBJ
      ?auto_3430429 - OBJ
      ?auto_3430430 - OBJ
      ?auto_3430431 - OBJ
      ?auto_3430425 - LOCATION
    )
    :vars
    (
      ?auto_3430434 - LOCATION
      ?auto_3430436 - CITY
      ?auto_3430435 - LOCATION
      ?auto_3430432 - LOCATION
      ?auto_3430433 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3430434 ?auto_3430436 ) ( IN-CITY ?auto_3430425 ?auto_3430436 ) ( not ( = ?auto_3430425 ?auto_3430434 ) ) ( OBJ-AT ?auto_3430428 ?auto_3430434 ) ( IN-CITY ?auto_3430435 ?auto_3430436 ) ( not ( = ?auto_3430425 ?auto_3430435 ) ) ( OBJ-AT ?auto_3430429 ?auto_3430435 ) ( IN-CITY ?auto_3430432 ?auto_3430436 ) ( not ( = ?auto_3430425 ?auto_3430432 ) ) ( OBJ-AT ?auto_3430431 ?auto_3430432 ) ( OBJ-AT ?auto_3430426 ?auto_3430435 ) ( OBJ-AT ?auto_3430430 ?auto_3430432 ) ( OBJ-AT ?auto_3430427 ?auto_3430432 ) ( TRUCK-AT ?auto_3430433 ?auto_3430425 ) ( not ( = ?auto_3430427 ?auto_3430430 ) ) ( not ( = ?auto_3430427 ?auto_3430426 ) ) ( not ( = ?auto_3430430 ?auto_3430426 ) ) ( not ( = ?auto_3430435 ?auto_3430432 ) ) ( not ( = ?auto_3430427 ?auto_3430431 ) ) ( not ( = ?auto_3430430 ?auto_3430431 ) ) ( not ( = ?auto_3430426 ?auto_3430431 ) ) ( not ( = ?auto_3430427 ?auto_3430429 ) ) ( not ( = ?auto_3430430 ?auto_3430429 ) ) ( not ( = ?auto_3430426 ?auto_3430429 ) ) ( not ( = ?auto_3430431 ?auto_3430429 ) ) ( not ( = ?auto_3430427 ?auto_3430428 ) ) ( not ( = ?auto_3430430 ?auto_3430428 ) ) ( not ( = ?auto_3430426 ?auto_3430428 ) ) ( not ( = ?auto_3430431 ?auto_3430428 ) ) ( not ( = ?auto_3430429 ?auto_3430428 ) ) ( not ( = ?auto_3430434 ?auto_3430435 ) ) ( not ( = ?auto_3430434 ?auto_3430432 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3430427 ?auto_3430430 ?auto_3430426 ?auto_3430431 ?auto_3430428 ?auto_3430429 ?auto_3430425 )
      ( DELIVER-6PKG-VERIFY ?auto_3430426 ?auto_3430427 ?auto_3430428 ?auto_3430429 ?auto_3430430 ?auto_3430431 ?auto_3430425 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3459084 - OBJ
      ?auto_3459085 - OBJ
      ?auto_3459086 - OBJ
      ?auto_3459087 - OBJ
      ?auto_3459088 - OBJ
      ?auto_3459089 - OBJ
      ?auto_3459083 - LOCATION
    )
    :vars
    (
      ?auto_3459092 - LOCATION
      ?auto_3459094 - CITY
      ?auto_3459093 - LOCATION
      ?auto_3459090 - LOCATION
      ?auto_3459091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3459092 ?auto_3459094 ) ( IN-CITY ?auto_3459083 ?auto_3459094 ) ( not ( = ?auto_3459083 ?auto_3459092 ) ) ( OBJ-AT ?auto_3459089 ?auto_3459092 ) ( IN-CITY ?auto_3459093 ?auto_3459094 ) ( not ( = ?auto_3459083 ?auto_3459093 ) ) ( OBJ-AT ?auto_3459085 ?auto_3459093 ) ( IN-CITY ?auto_3459090 ?auto_3459094 ) ( not ( = ?auto_3459083 ?auto_3459090 ) ) ( OBJ-AT ?auto_3459088 ?auto_3459090 ) ( OBJ-AT ?auto_3459084 ?auto_3459093 ) ( OBJ-AT ?auto_3459087 ?auto_3459090 ) ( OBJ-AT ?auto_3459086 ?auto_3459090 ) ( TRUCK-AT ?auto_3459091 ?auto_3459083 ) ( not ( = ?auto_3459086 ?auto_3459087 ) ) ( not ( = ?auto_3459086 ?auto_3459084 ) ) ( not ( = ?auto_3459087 ?auto_3459084 ) ) ( not ( = ?auto_3459093 ?auto_3459090 ) ) ( not ( = ?auto_3459086 ?auto_3459088 ) ) ( not ( = ?auto_3459087 ?auto_3459088 ) ) ( not ( = ?auto_3459084 ?auto_3459088 ) ) ( not ( = ?auto_3459086 ?auto_3459085 ) ) ( not ( = ?auto_3459087 ?auto_3459085 ) ) ( not ( = ?auto_3459084 ?auto_3459085 ) ) ( not ( = ?auto_3459088 ?auto_3459085 ) ) ( not ( = ?auto_3459086 ?auto_3459089 ) ) ( not ( = ?auto_3459087 ?auto_3459089 ) ) ( not ( = ?auto_3459084 ?auto_3459089 ) ) ( not ( = ?auto_3459088 ?auto_3459089 ) ) ( not ( = ?auto_3459085 ?auto_3459089 ) ) ( not ( = ?auto_3459092 ?auto_3459093 ) ) ( not ( = ?auto_3459092 ?auto_3459090 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3459086 ?auto_3459087 ?auto_3459084 ?auto_3459088 ?auto_3459089 ?auto_3459085 ?auto_3459083 )
      ( DELIVER-6PKG-VERIFY ?auto_3459084 ?auto_3459085 ?auto_3459086 ?auto_3459087 ?auto_3459088 ?auto_3459089 ?auto_3459083 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3459148 - OBJ
      ?auto_3459149 - OBJ
      ?auto_3459150 - OBJ
      ?auto_3459151 - OBJ
      ?auto_3459152 - OBJ
      ?auto_3459153 - OBJ
      ?auto_3459147 - LOCATION
    )
    :vars
    (
      ?auto_3459156 - LOCATION
      ?auto_3459158 - CITY
      ?auto_3459157 - LOCATION
      ?auto_3459154 - LOCATION
      ?auto_3459155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3459156 ?auto_3459158 ) ( IN-CITY ?auto_3459147 ?auto_3459158 ) ( not ( = ?auto_3459147 ?auto_3459156 ) ) ( OBJ-AT ?auto_3459152 ?auto_3459156 ) ( IN-CITY ?auto_3459157 ?auto_3459158 ) ( not ( = ?auto_3459147 ?auto_3459157 ) ) ( OBJ-AT ?auto_3459149 ?auto_3459157 ) ( IN-CITY ?auto_3459154 ?auto_3459158 ) ( not ( = ?auto_3459147 ?auto_3459154 ) ) ( OBJ-AT ?auto_3459153 ?auto_3459154 ) ( OBJ-AT ?auto_3459148 ?auto_3459157 ) ( OBJ-AT ?auto_3459151 ?auto_3459154 ) ( OBJ-AT ?auto_3459150 ?auto_3459154 ) ( TRUCK-AT ?auto_3459155 ?auto_3459147 ) ( not ( = ?auto_3459150 ?auto_3459151 ) ) ( not ( = ?auto_3459150 ?auto_3459148 ) ) ( not ( = ?auto_3459151 ?auto_3459148 ) ) ( not ( = ?auto_3459157 ?auto_3459154 ) ) ( not ( = ?auto_3459150 ?auto_3459153 ) ) ( not ( = ?auto_3459151 ?auto_3459153 ) ) ( not ( = ?auto_3459148 ?auto_3459153 ) ) ( not ( = ?auto_3459150 ?auto_3459149 ) ) ( not ( = ?auto_3459151 ?auto_3459149 ) ) ( not ( = ?auto_3459148 ?auto_3459149 ) ) ( not ( = ?auto_3459153 ?auto_3459149 ) ) ( not ( = ?auto_3459150 ?auto_3459152 ) ) ( not ( = ?auto_3459151 ?auto_3459152 ) ) ( not ( = ?auto_3459148 ?auto_3459152 ) ) ( not ( = ?auto_3459153 ?auto_3459152 ) ) ( not ( = ?auto_3459149 ?auto_3459152 ) ) ( not ( = ?auto_3459156 ?auto_3459157 ) ) ( not ( = ?auto_3459156 ?auto_3459154 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3459150 ?auto_3459151 ?auto_3459148 ?auto_3459153 ?auto_3459152 ?auto_3459149 ?auto_3459147 )
      ( DELIVER-6PKG-VERIFY ?auto_3459148 ?auto_3459149 ?auto_3459150 ?auto_3459151 ?auto_3459152 ?auto_3459153 ?auto_3459147 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3459738 - OBJ
      ?auto_3459739 - OBJ
      ?auto_3459740 - OBJ
      ?auto_3459741 - OBJ
      ?auto_3459742 - OBJ
      ?auto_3459743 - OBJ
      ?auto_3459737 - LOCATION
    )
    :vars
    (
      ?auto_3459746 - LOCATION
      ?auto_3459748 - CITY
      ?auto_3459747 - LOCATION
      ?auto_3459744 - LOCATION
      ?auto_3459745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3459746 ?auto_3459748 ) ( IN-CITY ?auto_3459737 ?auto_3459748 ) ( not ( = ?auto_3459737 ?auto_3459746 ) ) ( OBJ-AT ?auto_3459741 ?auto_3459746 ) ( IN-CITY ?auto_3459747 ?auto_3459748 ) ( not ( = ?auto_3459737 ?auto_3459747 ) ) ( OBJ-AT ?auto_3459739 ?auto_3459747 ) ( IN-CITY ?auto_3459744 ?auto_3459748 ) ( not ( = ?auto_3459737 ?auto_3459744 ) ) ( OBJ-AT ?auto_3459743 ?auto_3459744 ) ( OBJ-AT ?auto_3459738 ?auto_3459747 ) ( OBJ-AT ?auto_3459742 ?auto_3459744 ) ( OBJ-AT ?auto_3459740 ?auto_3459744 ) ( TRUCK-AT ?auto_3459745 ?auto_3459737 ) ( not ( = ?auto_3459740 ?auto_3459742 ) ) ( not ( = ?auto_3459740 ?auto_3459738 ) ) ( not ( = ?auto_3459742 ?auto_3459738 ) ) ( not ( = ?auto_3459747 ?auto_3459744 ) ) ( not ( = ?auto_3459740 ?auto_3459743 ) ) ( not ( = ?auto_3459742 ?auto_3459743 ) ) ( not ( = ?auto_3459738 ?auto_3459743 ) ) ( not ( = ?auto_3459740 ?auto_3459739 ) ) ( not ( = ?auto_3459742 ?auto_3459739 ) ) ( not ( = ?auto_3459738 ?auto_3459739 ) ) ( not ( = ?auto_3459743 ?auto_3459739 ) ) ( not ( = ?auto_3459740 ?auto_3459741 ) ) ( not ( = ?auto_3459742 ?auto_3459741 ) ) ( not ( = ?auto_3459738 ?auto_3459741 ) ) ( not ( = ?auto_3459743 ?auto_3459741 ) ) ( not ( = ?auto_3459739 ?auto_3459741 ) ) ( not ( = ?auto_3459746 ?auto_3459747 ) ) ( not ( = ?auto_3459746 ?auto_3459744 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3459740 ?auto_3459742 ?auto_3459738 ?auto_3459743 ?auto_3459741 ?auto_3459739 ?auto_3459737 )
      ( DELIVER-6PKG-VERIFY ?auto_3459738 ?auto_3459739 ?auto_3459740 ?auto_3459741 ?auto_3459742 ?auto_3459743 ?auto_3459737 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3465133 - OBJ
      ?auto_3465134 - OBJ
      ?auto_3465135 - OBJ
      ?auto_3465136 - OBJ
      ?auto_3465137 - OBJ
      ?auto_3465138 - OBJ
      ?auto_3465132 - LOCATION
    )
    :vars
    (
      ?auto_3465141 - LOCATION
      ?auto_3465143 - CITY
      ?auto_3465142 - LOCATION
      ?auto_3465139 - LOCATION
      ?auto_3465140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3465141 ?auto_3465143 ) ( IN-CITY ?auto_3465132 ?auto_3465143 ) ( not ( = ?auto_3465132 ?auto_3465141 ) ) ( OBJ-AT ?auto_3465135 ?auto_3465141 ) ( IN-CITY ?auto_3465142 ?auto_3465143 ) ( not ( = ?auto_3465132 ?auto_3465142 ) ) ( OBJ-AT ?auto_3465134 ?auto_3465142 ) ( IN-CITY ?auto_3465139 ?auto_3465143 ) ( not ( = ?auto_3465132 ?auto_3465139 ) ) ( OBJ-AT ?auto_3465138 ?auto_3465139 ) ( OBJ-AT ?auto_3465133 ?auto_3465142 ) ( OBJ-AT ?auto_3465137 ?auto_3465139 ) ( OBJ-AT ?auto_3465136 ?auto_3465139 ) ( TRUCK-AT ?auto_3465140 ?auto_3465132 ) ( not ( = ?auto_3465136 ?auto_3465137 ) ) ( not ( = ?auto_3465136 ?auto_3465133 ) ) ( not ( = ?auto_3465137 ?auto_3465133 ) ) ( not ( = ?auto_3465142 ?auto_3465139 ) ) ( not ( = ?auto_3465136 ?auto_3465138 ) ) ( not ( = ?auto_3465137 ?auto_3465138 ) ) ( not ( = ?auto_3465133 ?auto_3465138 ) ) ( not ( = ?auto_3465136 ?auto_3465134 ) ) ( not ( = ?auto_3465137 ?auto_3465134 ) ) ( not ( = ?auto_3465133 ?auto_3465134 ) ) ( not ( = ?auto_3465138 ?auto_3465134 ) ) ( not ( = ?auto_3465136 ?auto_3465135 ) ) ( not ( = ?auto_3465137 ?auto_3465135 ) ) ( not ( = ?auto_3465133 ?auto_3465135 ) ) ( not ( = ?auto_3465138 ?auto_3465135 ) ) ( not ( = ?auto_3465134 ?auto_3465135 ) ) ( not ( = ?auto_3465141 ?auto_3465142 ) ) ( not ( = ?auto_3465141 ?auto_3465139 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3465136 ?auto_3465137 ?auto_3465133 ?auto_3465138 ?auto_3465135 ?auto_3465134 ?auto_3465132 )
      ( DELIVER-6PKG-VERIFY ?auto_3465133 ?auto_3465134 ?auto_3465135 ?auto_3465136 ?auto_3465137 ?auto_3465138 ?auto_3465132 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3468759 - OBJ
      ?auto_3468760 - OBJ
      ?auto_3468761 - OBJ
      ?auto_3468762 - OBJ
      ?auto_3468763 - OBJ
      ?auto_3468764 - OBJ
      ?auto_3468758 - LOCATION
    )
    :vars
    (
      ?auto_3468767 - LOCATION
      ?auto_3468769 - CITY
      ?auto_3468768 - LOCATION
      ?auto_3468765 - LOCATION
      ?auto_3468766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3468767 ?auto_3468769 ) ( IN-CITY ?auto_3468758 ?auto_3468769 ) ( not ( = ?auto_3468758 ?auto_3468767 ) ) ( OBJ-AT ?auto_3468760 ?auto_3468767 ) ( IN-CITY ?auto_3468768 ?auto_3468769 ) ( not ( = ?auto_3468758 ?auto_3468768 ) ) ( OBJ-AT ?auto_3468764 ?auto_3468768 ) ( IN-CITY ?auto_3468765 ?auto_3468769 ) ( not ( = ?auto_3468758 ?auto_3468765 ) ) ( OBJ-AT ?auto_3468763 ?auto_3468765 ) ( OBJ-AT ?auto_3468759 ?auto_3468768 ) ( OBJ-AT ?auto_3468762 ?auto_3468765 ) ( OBJ-AT ?auto_3468761 ?auto_3468765 ) ( TRUCK-AT ?auto_3468766 ?auto_3468758 ) ( not ( = ?auto_3468761 ?auto_3468762 ) ) ( not ( = ?auto_3468761 ?auto_3468759 ) ) ( not ( = ?auto_3468762 ?auto_3468759 ) ) ( not ( = ?auto_3468768 ?auto_3468765 ) ) ( not ( = ?auto_3468761 ?auto_3468763 ) ) ( not ( = ?auto_3468762 ?auto_3468763 ) ) ( not ( = ?auto_3468759 ?auto_3468763 ) ) ( not ( = ?auto_3468761 ?auto_3468764 ) ) ( not ( = ?auto_3468762 ?auto_3468764 ) ) ( not ( = ?auto_3468759 ?auto_3468764 ) ) ( not ( = ?auto_3468763 ?auto_3468764 ) ) ( not ( = ?auto_3468761 ?auto_3468760 ) ) ( not ( = ?auto_3468762 ?auto_3468760 ) ) ( not ( = ?auto_3468759 ?auto_3468760 ) ) ( not ( = ?auto_3468763 ?auto_3468760 ) ) ( not ( = ?auto_3468764 ?auto_3468760 ) ) ( not ( = ?auto_3468767 ?auto_3468768 ) ) ( not ( = ?auto_3468767 ?auto_3468765 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3468761 ?auto_3468762 ?auto_3468759 ?auto_3468763 ?auto_3468760 ?auto_3468764 ?auto_3468758 )
      ( DELIVER-6PKG-VERIFY ?auto_3468759 ?auto_3468760 ?auto_3468761 ?auto_3468762 ?auto_3468763 ?auto_3468764 ?auto_3468758 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3468823 - OBJ
      ?auto_3468824 - OBJ
      ?auto_3468825 - OBJ
      ?auto_3468826 - OBJ
      ?auto_3468827 - OBJ
      ?auto_3468828 - OBJ
      ?auto_3468822 - LOCATION
    )
    :vars
    (
      ?auto_3468831 - LOCATION
      ?auto_3468833 - CITY
      ?auto_3468832 - LOCATION
      ?auto_3468829 - LOCATION
      ?auto_3468830 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3468831 ?auto_3468833 ) ( IN-CITY ?auto_3468822 ?auto_3468833 ) ( not ( = ?auto_3468822 ?auto_3468831 ) ) ( OBJ-AT ?auto_3468824 ?auto_3468831 ) ( IN-CITY ?auto_3468832 ?auto_3468833 ) ( not ( = ?auto_3468822 ?auto_3468832 ) ) ( OBJ-AT ?auto_3468827 ?auto_3468832 ) ( IN-CITY ?auto_3468829 ?auto_3468833 ) ( not ( = ?auto_3468822 ?auto_3468829 ) ) ( OBJ-AT ?auto_3468828 ?auto_3468829 ) ( OBJ-AT ?auto_3468823 ?auto_3468832 ) ( OBJ-AT ?auto_3468826 ?auto_3468829 ) ( OBJ-AT ?auto_3468825 ?auto_3468829 ) ( TRUCK-AT ?auto_3468830 ?auto_3468822 ) ( not ( = ?auto_3468825 ?auto_3468826 ) ) ( not ( = ?auto_3468825 ?auto_3468823 ) ) ( not ( = ?auto_3468826 ?auto_3468823 ) ) ( not ( = ?auto_3468832 ?auto_3468829 ) ) ( not ( = ?auto_3468825 ?auto_3468828 ) ) ( not ( = ?auto_3468826 ?auto_3468828 ) ) ( not ( = ?auto_3468823 ?auto_3468828 ) ) ( not ( = ?auto_3468825 ?auto_3468827 ) ) ( not ( = ?auto_3468826 ?auto_3468827 ) ) ( not ( = ?auto_3468823 ?auto_3468827 ) ) ( not ( = ?auto_3468828 ?auto_3468827 ) ) ( not ( = ?auto_3468825 ?auto_3468824 ) ) ( not ( = ?auto_3468826 ?auto_3468824 ) ) ( not ( = ?auto_3468823 ?auto_3468824 ) ) ( not ( = ?auto_3468828 ?auto_3468824 ) ) ( not ( = ?auto_3468827 ?auto_3468824 ) ) ( not ( = ?auto_3468831 ?auto_3468832 ) ) ( not ( = ?auto_3468831 ?auto_3468829 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3468825 ?auto_3468826 ?auto_3468823 ?auto_3468828 ?auto_3468824 ?auto_3468827 ?auto_3468822 )
      ( DELIVER-6PKG-VERIFY ?auto_3468823 ?auto_3468824 ?auto_3468825 ?auto_3468826 ?auto_3468827 ?auto_3468828 ?auto_3468822 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3470043 - OBJ
      ?auto_3470044 - OBJ
      ?auto_3470045 - OBJ
      ?auto_3470046 - OBJ
      ?auto_3470047 - OBJ
      ?auto_3470048 - OBJ
      ?auto_3470042 - LOCATION
    )
    :vars
    (
      ?auto_3470051 - LOCATION
      ?auto_3470053 - CITY
      ?auto_3470052 - LOCATION
      ?auto_3470049 - LOCATION
      ?auto_3470050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3470051 ?auto_3470053 ) ( IN-CITY ?auto_3470042 ?auto_3470053 ) ( not ( = ?auto_3470042 ?auto_3470051 ) ) ( OBJ-AT ?auto_3470044 ?auto_3470051 ) ( IN-CITY ?auto_3470052 ?auto_3470053 ) ( not ( = ?auto_3470042 ?auto_3470052 ) ) ( OBJ-AT ?auto_3470046 ?auto_3470052 ) ( IN-CITY ?auto_3470049 ?auto_3470053 ) ( not ( = ?auto_3470042 ?auto_3470049 ) ) ( OBJ-AT ?auto_3470048 ?auto_3470049 ) ( OBJ-AT ?auto_3470043 ?auto_3470052 ) ( OBJ-AT ?auto_3470047 ?auto_3470049 ) ( OBJ-AT ?auto_3470045 ?auto_3470049 ) ( TRUCK-AT ?auto_3470050 ?auto_3470042 ) ( not ( = ?auto_3470045 ?auto_3470047 ) ) ( not ( = ?auto_3470045 ?auto_3470043 ) ) ( not ( = ?auto_3470047 ?auto_3470043 ) ) ( not ( = ?auto_3470052 ?auto_3470049 ) ) ( not ( = ?auto_3470045 ?auto_3470048 ) ) ( not ( = ?auto_3470047 ?auto_3470048 ) ) ( not ( = ?auto_3470043 ?auto_3470048 ) ) ( not ( = ?auto_3470045 ?auto_3470046 ) ) ( not ( = ?auto_3470047 ?auto_3470046 ) ) ( not ( = ?auto_3470043 ?auto_3470046 ) ) ( not ( = ?auto_3470048 ?auto_3470046 ) ) ( not ( = ?auto_3470045 ?auto_3470044 ) ) ( not ( = ?auto_3470047 ?auto_3470044 ) ) ( not ( = ?auto_3470043 ?auto_3470044 ) ) ( not ( = ?auto_3470048 ?auto_3470044 ) ) ( not ( = ?auto_3470046 ?auto_3470044 ) ) ( not ( = ?auto_3470051 ?auto_3470052 ) ) ( not ( = ?auto_3470051 ?auto_3470049 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3470045 ?auto_3470047 ?auto_3470043 ?auto_3470048 ?auto_3470044 ?auto_3470046 ?auto_3470042 )
      ( DELIVER-6PKG-VERIFY ?auto_3470043 ?auto_3470044 ?auto_3470045 ?auto_3470046 ?auto_3470047 ?auto_3470048 ?auto_3470042 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3479993 - OBJ
      ?auto_3479994 - OBJ
      ?auto_3479995 - OBJ
      ?auto_3479996 - OBJ
      ?auto_3479997 - OBJ
      ?auto_3479998 - OBJ
      ?auto_3479992 - LOCATION
    )
    :vars
    (
      ?auto_3480001 - LOCATION
      ?auto_3480003 - CITY
      ?auto_3480002 - LOCATION
      ?auto_3479999 - LOCATION
      ?auto_3480000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3480001 ?auto_3480003 ) ( IN-CITY ?auto_3479992 ?auto_3480003 ) ( not ( = ?auto_3479992 ?auto_3480001 ) ) ( OBJ-AT ?auto_3479994 ?auto_3480001 ) ( IN-CITY ?auto_3480002 ?auto_3480003 ) ( not ( = ?auto_3479992 ?auto_3480002 ) ) ( OBJ-AT ?auto_3479995 ?auto_3480002 ) ( IN-CITY ?auto_3479999 ?auto_3480003 ) ( not ( = ?auto_3479992 ?auto_3479999 ) ) ( OBJ-AT ?auto_3479998 ?auto_3479999 ) ( OBJ-AT ?auto_3479993 ?auto_3480002 ) ( OBJ-AT ?auto_3479997 ?auto_3479999 ) ( OBJ-AT ?auto_3479996 ?auto_3479999 ) ( TRUCK-AT ?auto_3480000 ?auto_3479992 ) ( not ( = ?auto_3479996 ?auto_3479997 ) ) ( not ( = ?auto_3479996 ?auto_3479993 ) ) ( not ( = ?auto_3479997 ?auto_3479993 ) ) ( not ( = ?auto_3480002 ?auto_3479999 ) ) ( not ( = ?auto_3479996 ?auto_3479998 ) ) ( not ( = ?auto_3479997 ?auto_3479998 ) ) ( not ( = ?auto_3479993 ?auto_3479998 ) ) ( not ( = ?auto_3479996 ?auto_3479995 ) ) ( not ( = ?auto_3479997 ?auto_3479995 ) ) ( not ( = ?auto_3479993 ?auto_3479995 ) ) ( not ( = ?auto_3479998 ?auto_3479995 ) ) ( not ( = ?auto_3479996 ?auto_3479994 ) ) ( not ( = ?auto_3479997 ?auto_3479994 ) ) ( not ( = ?auto_3479993 ?auto_3479994 ) ) ( not ( = ?auto_3479998 ?auto_3479994 ) ) ( not ( = ?auto_3479995 ?auto_3479994 ) ) ( not ( = ?auto_3480001 ?auto_3480002 ) ) ( not ( = ?auto_3480001 ?auto_3479999 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3479996 ?auto_3479997 ?auto_3479993 ?auto_3479998 ?auto_3479994 ?auto_3479995 ?auto_3479992 )
      ( DELIVER-6PKG-VERIFY ?auto_3479993 ?auto_3479994 ?auto_3479995 ?auto_3479996 ?auto_3479997 ?auto_3479998 ?auto_3479992 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3617542 - OBJ
      ?auto_3617543 - OBJ
      ?auto_3617544 - OBJ
      ?auto_3617545 - OBJ
      ?auto_3617546 - OBJ
      ?auto_3617547 - OBJ
      ?auto_3617541 - LOCATION
    )
    :vars
    (
      ?auto_3617550 - LOCATION
      ?auto_3617552 - CITY
      ?auto_3617551 - LOCATION
      ?auto_3617548 - LOCATION
      ?auto_3617549 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3617550 ?auto_3617552 ) ( IN-CITY ?auto_3617541 ?auto_3617552 ) ( not ( = ?auto_3617541 ?auto_3617550 ) ) ( OBJ-AT ?auto_3617542 ?auto_3617550 ) ( IN-CITY ?auto_3617551 ?auto_3617552 ) ( not ( = ?auto_3617541 ?auto_3617551 ) ) ( OBJ-AT ?auto_3617547 ?auto_3617551 ) ( IN-CITY ?auto_3617548 ?auto_3617552 ) ( not ( = ?auto_3617541 ?auto_3617548 ) ) ( OBJ-AT ?auto_3617546 ?auto_3617548 ) ( OBJ-AT ?auto_3617545 ?auto_3617551 ) ( OBJ-AT ?auto_3617544 ?auto_3617548 ) ( OBJ-AT ?auto_3617543 ?auto_3617548 ) ( TRUCK-AT ?auto_3617549 ?auto_3617541 ) ( not ( = ?auto_3617543 ?auto_3617544 ) ) ( not ( = ?auto_3617543 ?auto_3617545 ) ) ( not ( = ?auto_3617544 ?auto_3617545 ) ) ( not ( = ?auto_3617551 ?auto_3617548 ) ) ( not ( = ?auto_3617543 ?auto_3617546 ) ) ( not ( = ?auto_3617544 ?auto_3617546 ) ) ( not ( = ?auto_3617545 ?auto_3617546 ) ) ( not ( = ?auto_3617543 ?auto_3617547 ) ) ( not ( = ?auto_3617544 ?auto_3617547 ) ) ( not ( = ?auto_3617545 ?auto_3617547 ) ) ( not ( = ?auto_3617546 ?auto_3617547 ) ) ( not ( = ?auto_3617543 ?auto_3617542 ) ) ( not ( = ?auto_3617544 ?auto_3617542 ) ) ( not ( = ?auto_3617545 ?auto_3617542 ) ) ( not ( = ?auto_3617546 ?auto_3617542 ) ) ( not ( = ?auto_3617547 ?auto_3617542 ) ) ( not ( = ?auto_3617550 ?auto_3617551 ) ) ( not ( = ?auto_3617550 ?auto_3617548 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3617543 ?auto_3617544 ?auto_3617545 ?auto_3617546 ?auto_3617542 ?auto_3617547 ?auto_3617541 )
      ( DELIVER-6PKG-VERIFY ?auto_3617542 ?auto_3617543 ?auto_3617544 ?auto_3617545 ?auto_3617546 ?auto_3617547 ?auto_3617541 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3617606 - OBJ
      ?auto_3617607 - OBJ
      ?auto_3617608 - OBJ
      ?auto_3617609 - OBJ
      ?auto_3617610 - OBJ
      ?auto_3617611 - OBJ
      ?auto_3617605 - LOCATION
    )
    :vars
    (
      ?auto_3617614 - LOCATION
      ?auto_3617616 - CITY
      ?auto_3617615 - LOCATION
      ?auto_3617612 - LOCATION
      ?auto_3617613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3617614 ?auto_3617616 ) ( IN-CITY ?auto_3617605 ?auto_3617616 ) ( not ( = ?auto_3617605 ?auto_3617614 ) ) ( OBJ-AT ?auto_3617606 ?auto_3617614 ) ( IN-CITY ?auto_3617615 ?auto_3617616 ) ( not ( = ?auto_3617605 ?auto_3617615 ) ) ( OBJ-AT ?auto_3617610 ?auto_3617615 ) ( IN-CITY ?auto_3617612 ?auto_3617616 ) ( not ( = ?auto_3617605 ?auto_3617612 ) ) ( OBJ-AT ?auto_3617611 ?auto_3617612 ) ( OBJ-AT ?auto_3617609 ?auto_3617615 ) ( OBJ-AT ?auto_3617608 ?auto_3617612 ) ( OBJ-AT ?auto_3617607 ?auto_3617612 ) ( TRUCK-AT ?auto_3617613 ?auto_3617605 ) ( not ( = ?auto_3617607 ?auto_3617608 ) ) ( not ( = ?auto_3617607 ?auto_3617609 ) ) ( not ( = ?auto_3617608 ?auto_3617609 ) ) ( not ( = ?auto_3617615 ?auto_3617612 ) ) ( not ( = ?auto_3617607 ?auto_3617611 ) ) ( not ( = ?auto_3617608 ?auto_3617611 ) ) ( not ( = ?auto_3617609 ?auto_3617611 ) ) ( not ( = ?auto_3617607 ?auto_3617610 ) ) ( not ( = ?auto_3617608 ?auto_3617610 ) ) ( not ( = ?auto_3617609 ?auto_3617610 ) ) ( not ( = ?auto_3617611 ?auto_3617610 ) ) ( not ( = ?auto_3617607 ?auto_3617606 ) ) ( not ( = ?auto_3617608 ?auto_3617606 ) ) ( not ( = ?auto_3617609 ?auto_3617606 ) ) ( not ( = ?auto_3617611 ?auto_3617606 ) ) ( not ( = ?auto_3617610 ?auto_3617606 ) ) ( not ( = ?auto_3617614 ?auto_3617615 ) ) ( not ( = ?auto_3617614 ?auto_3617612 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3617607 ?auto_3617608 ?auto_3617609 ?auto_3617611 ?auto_3617606 ?auto_3617610 ?auto_3617605 )
      ( DELIVER-6PKG-VERIFY ?auto_3617606 ?auto_3617607 ?auto_3617608 ?auto_3617609 ?auto_3617610 ?auto_3617611 ?auto_3617605 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3617942 - OBJ
      ?auto_3617943 - OBJ
      ?auto_3617944 - OBJ
      ?auto_3617945 - OBJ
      ?auto_3617946 - OBJ
      ?auto_3617947 - OBJ
      ?auto_3617941 - LOCATION
    )
    :vars
    (
      ?auto_3617950 - LOCATION
      ?auto_3617952 - CITY
      ?auto_3617951 - LOCATION
      ?auto_3617948 - LOCATION
      ?auto_3617949 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3617950 ?auto_3617952 ) ( IN-CITY ?auto_3617941 ?auto_3617952 ) ( not ( = ?auto_3617941 ?auto_3617950 ) ) ( OBJ-AT ?auto_3617942 ?auto_3617950 ) ( IN-CITY ?auto_3617951 ?auto_3617952 ) ( not ( = ?auto_3617941 ?auto_3617951 ) ) ( OBJ-AT ?auto_3617947 ?auto_3617951 ) ( IN-CITY ?auto_3617948 ?auto_3617952 ) ( not ( = ?auto_3617941 ?auto_3617948 ) ) ( OBJ-AT ?auto_3617945 ?auto_3617948 ) ( OBJ-AT ?auto_3617946 ?auto_3617951 ) ( OBJ-AT ?auto_3617944 ?auto_3617948 ) ( OBJ-AT ?auto_3617943 ?auto_3617948 ) ( TRUCK-AT ?auto_3617949 ?auto_3617941 ) ( not ( = ?auto_3617943 ?auto_3617944 ) ) ( not ( = ?auto_3617943 ?auto_3617946 ) ) ( not ( = ?auto_3617944 ?auto_3617946 ) ) ( not ( = ?auto_3617951 ?auto_3617948 ) ) ( not ( = ?auto_3617943 ?auto_3617945 ) ) ( not ( = ?auto_3617944 ?auto_3617945 ) ) ( not ( = ?auto_3617946 ?auto_3617945 ) ) ( not ( = ?auto_3617943 ?auto_3617947 ) ) ( not ( = ?auto_3617944 ?auto_3617947 ) ) ( not ( = ?auto_3617946 ?auto_3617947 ) ) ( not ( = ?auto_3617945 ?auto_3617947 ) ) ( not ( = ?auto_3617943 ?auto_3617942 ) ) ( not ( = ?auto_3617944 ?auto_3617942 ) ) ( not ( = ?auto_3617946 ?auto_3617942 ) ) ( not ( = ?auto_3617945 ?auto_3617942 ) ) ( not ( = ?auto_3617947 ?auto_3617942 ) ) ( not ( = ?auto_3617950 ?auto_3617951 ) ) ( not ( = ?auto_3617950 ?auto_3617948 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3617943 ?auto_3617944 ?auto_3617946 ?auto_3617945 ?auto_3617942 ?auto_3617947 ?auto_3617941 )
      ( DELIVER-6PKG-VERIFY ?auto_3617942 ?auto_3617943 ?auto_3617944 ?auto_3617945 ?auto_3617946 ?auto_3617947 ?auto_3617941 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3619987 - OBJ
      ?auto_3619988 - OBJ
      ?auto_3619989 - OBJ
      ?auto_3619990 - OBJ
      ?auto_3619991 - OBJ
      ?auto_3619992 - OBJ
      ?auto_3619986 - LOCATION
    )
    :vars
    (
      ?auto_3619995 - LOCATION
      ?auto_3619997 - CITY
      ?auto_3619996 - LOCATION
      ?auto_3619993 - LOCATION
      ?auto_3619994 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3619995 ?auto_3619997 ) ( IN-CITY ?auto_3619986 ?auto_3619997 ) ( not ( = ?auto_3619986 ?auto_3619995 ) ) ( OBJ-AT ?auto_3619987 ?auto_3619995 ) ( IN-CITY ?auto_3619996 ?auto_3619997 ) ( not ( = ?auto_3619986 ?auto_3619996 ) ) ( OBJ-AT ?auto_3619992 ?auto_3619996 ) ( IN-CITY ?auto_3619993 ?auto_3619997 ) ( not ( = ?auto_3619986 ?auto_3619993 ) ) ( OBJ-AT ?auto_3619991 ?auto_3619993 ) ( OBJ-AT ?auto_3619989 ?auto_3619996 ) ( OBJ-AT ?auto_3619990 ?auto_3619993 ) ( OBJ-AT ?auto_3619988 ?auto_3619993 ) ( TRUCK-AT ?auto_3619994 ?auto_3619986 ) ( not ( = ?auto_3619988 ?auto_3619990 ) ) ( not ( = ?auto_3619988 ?auto_3619989 ) ) ( not ( = ?auto_3619990 ?auto_3619989 ) ) ( not ( = ?auto_3619996 ?auto_3619993 ) ) ( not ( = ?auto_3619988 ?auto_3619991 ) ) ( not ( = ?auto_3619990 ?auto_3619991 ) ) ( not ( = ?auto_3619989 ?auto_3619991 ) ) ( not ( = ?auto_3619988 ?auto_3619992 ) ) ( not ( = ?auto_3619990 ?auto_3619992 ) ) ( not ( = ?auto_3619989 ?auto_3619992 ) ) ( not ( = ?auto_3619991 ?auto_3619992 ) ) ( not ( = ?auto_3619988 ?auto_3619987 ) ) ( not ( = ?auto_3619990 ?auto_3619987 ) ) ( not ( = ?auto_3619989 ?auto_3619987 ) ) ( not ( = ?auto_3619991 ?auto_3619987 ) ) ( not ( = ?auto_3619992 ?auto_3619987 ) ) ( not ( = ?auto_3619995 ?auto_3619996 ) ) ( not ( = ?auto_3619995 ?auto_3619993 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3619988 ?auto_3619990 ?auto_3619989 ?auto_3619991 ?auto_3619987 ?auto_3619992 ?auto_3619986 )
      ( DELIVER-6PKG-VERIFY ?auto_3619987 ?auto_3619988 ?auto_3619989 ?auto_3619990 ?auto_3619991 ?auto_3619992 ?auto_3619986 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3620051 - OBJ
      ?auto_3620052 - OBJ
      ?auto_3620053 - OBJ
      ?auto_3620054 - OBJ
      ?auto_3620055 - OBJ
      ?auto_3620056 - OBJ
      ?auto_3620050 - LOCATION
    )
    :vars
    (
      ?auto_3620059 - LOCATION
      ?auto_3620061 - CITY
      ?auto_3620060 - LOCATION
      ?auto_3620057 - LOCATION
      ?auto_3620058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3620059 ?auto_3620061 ) ( IN-CITY ?auto_3620050 ?auto_3620061 ) ( not ( = ?auto_3620050 ?auto_3620059 ) ) ( OBJ-AT ?auto_3620051 ?auto_3620059 ) ( IN-CITY ?auto_3620060 ?auto_3620061 ) ( not ( = ?auto_3620050 ?auto_3620060 ) ) ( OBJ-AT ?auto_3620055 ?auto_3620060 ) ( IN-CITY ?auto_3620057 ?auto_3620061 ) ( not ( = ?auto_3620050 ?auto_3620057 ) ) ( OBJ-AT ?auto_3620056 ?auto_3620057 ) ( OBJ-AT ?auto_3620053 ?auto_3620060 ) ( OBJ-AT ?auto_3620054 ?auto_3620057 ) ( OBJ-AT ?auto_3620052 ?auto_3620057 ) ( TRUCK-AT ?auto_3620058 ?auto_3620050 ) ( not ( = ?auto_3620052 ?auto_3620054 ) ) ( not ( = ?auto_3620052 ?auto_3620053 ) ) ( not ( = ?auto_3620054 ?auto_3620053 ) ) ( not ( = ?auto_3620060 ?auto_3620057 ) ) ( not ( = ?auto_3620052 ?auto_3620056 ) ) ( not ( = ?auto_3620054 ?auto_3620056 ) ) ( not ( = ?auto_3620053 ?auto_3620056 ) ) ( not ( = ?auto_3620052 ?auto_3620055 ) ) ( not ( = ?auto_3620054 ?auto_3620055 ) ) ( not ( = ?auto_3620053 ?auto_3620055 ) ) ( not ( = ?auto_3620056 ?auto_3620055 ) ) ( not ( = ?auto_3620052 ?auto_3620051 ) ) ( not ( = ?auto_3620054 ?auto_3620051 ) ) ( not ( = ?auto_3620053 ?auto_3620051 ) ) ( not ( = ?auto_3620056 ?auto_3620051 ) ) ( not ( = ?auto_3620055 ?auto_3620051 ) ) ( not ( = ?auto_3620059 ?auto_3620060 ) ) ( not ( = ?auto_3620059 ?auto_3620057 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3620052 ?auto_3620054 ?auto_3620053 ?auto_3620056 ?auto_3620051 ?auto_3620055 ?auto_3620050 )
      ( DELIVER-6PKG-VERIFY ?auto_3620051 ?auto_3620052 ?auto_3620053 ?auto_3620054 ?auto_3620055 ?auto_3620056 ?auto_3620050 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3621271 - OBJ
      ?auto_3621272 - OBJ
      ?auto_3621273 - OBJ
      ?auto_3621274 - OBJ
      ?auto_3621275 - OBJ
      ?auto_3621276 - OBJ
      ?auto_3621270 - LOCATION
    )
    :vars
    (
      ?auto_3621279 - LOCATION
      ?auto_3621281 - CITY
      ?auto_3621280 - LOCATION
      ?auto_3621277 - LOCATION
      ?auto_3621278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3621279 ?auto_3621281 ) ( IN-CITY ?auto_3621270 ?auto_3621281 ) ( not ( = ?auto_3621270 ?auto_3621279 ) ) ( OBJ-AT ?auto_3621271 ?auto_3621279 ) ( IN-CITY ?auto_3621280 ?auto_3621281 ) ( not ( = ?auto_3621270 ?auto_3621280 ) ) ( OBJ-AT ?auto_3621274 ?auto_3621280 ) ( IN-CITY ?auto_3621277 ?auto_3621281 ) ( not ( = ?auto_3621270 ?auto_3621277 ) ) ( OBJ-AT ?auto_3621276 ?auto_3621277 ) ( OBJ-AT ?auto_3621273 ?auto_3621280 ) ( OBJ-AT ?auto_3621275 ?auto_3621277 ) ( OBJ-AT ?auto_3621272 ?auto_3621277 ) ( TRUCK-AT ?auto_3621278 ?auto_3621270 ) ( not ( = ?auto_3621272 ?auto_3621275 ) ) ( not ( = ?auto_3621272 ?auto_3621273 ) ) ( not ( = ?auto_3621275 ?auto_3621273 ) ) ( not ( = ?auto_3621280 ?auto_3621277 ) ) ( not ( = ?auto_3621272 ?auto_3621276 ) ) ( not ( = ?auto_3621275 ?auto_3621276 ) ) ( not ( = ?auto_3621273 ?auto_3621276 ) ) ( not ( = ?auto_3621272 ?auto_3621274 ) ) ( not ( = ?auto_3621275 ?auto_3621274 ) ) ( not ( = ?auto_3621273 ?auto_3621274 ) ) ( not ( = ?auto_3621276 ?auto_3621274 ) ) ( not ( = ?auto_3621272 ?auto_3621271 ) ) ( not ( = ?auto_3621275 ?auto_3621271 ) ) ( not ( = ?auto_3621273 ?auto_3621271 ) ) ( not ( = ?auto_3621276 ?auto_3621271 ) ) ( not ( = ?auto_3621274 ?auto_3621271 ) ) ( not ( = ?auto_3621279 ?auto_3621280 ) ) ( not ( = ?auto_3621279 ?auto_3621277 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3621272 ?auto_3621275 ?auto_3621273 ?auto_3621276 ?auto_3621271 ?auto_3621274 ?auto_3621270 )
      ( DELIVER-6PKG-VERIFY ?auto_3621271 ?auto_3621272 ?auto_3621273 ?auto_3621274 ?auto_3621275 ?auto_3621276 ?auto_3621270 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3649837 - OBJ
      ?auto_3649838 - OBJ
      ?auto_3649839 - OBJ
      ?auto_3649840 - OBJ
      ?auto_3649841 - OBJ
      ?auto_3649842 - OBJ
      ?auto_3649836 - LOCATION
    )
    :vars
    (
      ?auto_3649845 - LOCATION
      ?auto_3649847 - CITY
      ?auto_3649846 - LOCATION
      ?auto_3649843 - LOCATION
      ?auto_3649844 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3649845 ?auto_3649847 ) ( IN-CITY ?auto_3649836 ?auto_3649847 ) ( not ( = ?auto_3649836 ?auto_3649845 ) ) ( OBJ-AT ?auto_3649837 ?auto_3649845 ) ( IN-CITY ?auto_3649846 ?auto_3649847 ) ( not ( = ?auto_3649836 ?auto_3649846 ) ) ( OBJ-AT ?auto_3649842 ?auto_3649846 ) ( IN-CITY ?auto_3649843 ?auto_3649847 ) ( not ( = ?auto_3649836 ?auto_3649843 ) ) ( OBJ-AT ?auto_3649841 ?auto_3649843 ) ( OBJ-AT ?auto_3649838 ?auto_3649846 ) ( OBJ-AT ?auto_3649840 ?auto_3649843 ) ( OBJ-AT ?auto_3649839 ?auto_3649843 ) ( TRUCK-AT ?auto_3649844 ?auto_3649836 ) ( not ( = ?auto_3649839 ?auto_3649840 ) ) ( not ( = ?auto_3649839 ?auto_3649838 ) ) ( not ( = ?auto_3649840 ?auto_3649838 ) ) ( not ( = ?auto_3649846 ?auto_3649843 ) ) ( not ( = ?auto_3649839 ?auto_3649841 ) ) ( not ( = ?auto_3649840 ?auto_3649841 ) ) ( not ( = ?auto_3649838 ?auto_3649841 ) ) ( not ( = ?auto_3649839 ?auto_3649842 ) ) ( not ( = ?auto_3649840 ?auto_3649842 ) ) ( not ( = ?auto_3649838 ?auto_3649842 ) ) ( not ( = ?auto_3649841 ?auto_3649842 ) ) ( not ( = ?auto_3649839 ?auto_3649837 ) ) ( not ( = ?auto_3649840 ?auto_3649837 ) ) ( not ( = ?auto_3649838 ?auto_3649837 ) ) ( not ( = ?auto_3649841 ?auto_3649837 ) ) ( not ( = ?auto_3649842 ?auto_3649837 ) ) ( not ( = ?auto_3649845 ?auto_3649846 ) ) ( not ( = ?auto_3649845 ?auto_3649843 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3649839 ?auto_3649840 ?auto_3649838 ?auto_3649841 ?auto_3649837 ?auto_3649842 ?auto_3649836 )
      ( DELIVER-6PKG-VERIFY ?auto_3649837 ?auto_3649838 ?auto_3649839 ?auto_3649840 ?auto_3649841 ?auto_3649842 ?auto_3649836 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3649901 - OBJ
      ?auto_3649902 - OBJ
      ?auto_3649903 - OBJ
      ?auto_3649904 - OBJ
      ?auto_3649905 - OBJ
      ?auto_3649906 - OBJ
      ?auto_3649900 - LOCATION
    )
    :vars
    (
      ?auto_3649909 - LOCATION
      ?auto_3649911 - CITY
      ?auto_3649910 - LOCATION
      ?auto_3649907 - LOCATION
      ?auto_3649908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3649909 ?auto_3649911 ) ( IN-CITY ?auto_3649900 ?auto_3649911 ) ( not ( = ?auto_3649900 ?auto_3649909 ) ) ( OBJ-AT ?auto_3649901 ?auto_3649909 ) ( IN-CITY ?auto_3649910 ?auto_3649911 ) ( not ( = ?auto_3649900 ?auto_3649910 ) ) ( OBJ-AT ?auto_3649905 ?auto_3649910 ) ( IN-CITY ?auto_3649907 ?auto_3649911 ) ( not ( = ?auto_3649900 ?auto_3649907 ) ) ( OBJ-AT ?auto_3649906 ?auto_3649907 ) ( OBJ-AT ?auto_3649902 ?auto_3649910 ) ( OBJ-AT ?auto_3649904 ?auto_3649907 ) ( OBJ-AT ?auto_3649903 ?auto_3649907 ) ( TRUCK-AT ?auto_3649908 ?auto_3649900 ) ( not ( = ?auto_3649903 ?auto_3649904 ) ) ( not ( = ?auto_3649903 ?auto_3649902 ) ) ( not ( = ?auto_3649904 ?auto_3649902 ) ) ( not ( = ?auto_3649910 ?auto_3649907 ) ) ( not ( = ?auto_3649903 ?auto_3649906 ) ) ( not ( = ?auto_3649904 ?auto_3649906 ) ) ( not ( = ?auto_3649902 ?auto_3649906 ) ) ( not ( = ?auto_3649903 ?auto_3649905 ) ) ( not ( = ?auto_3649904 ?auto_3649905 ) ) ( not ( = ?auto_3649902 ?auto_3649905 ) ) ( not ( = ?auto_3649906 ?auto_3649905 ) ) ( not ( = ?auto_3649903 ?auto_3649901 ) ) ( not ( = ?auto_3649904 ?auto_3649901 ) ) ( not ( = ?auto_3649902 ?auto_3649901 ) ) ( not ( = ?auto_3649906 ?auto_3649901 ) ) ( not ( = ?auto_3649905 ?auto_3649901 ) ) ( not ( = ?auto_3649909 ?auto_3649910 ) ) ( not ( = ?auto_3649909 ?auto_3649907 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3649903 ?auto_3649904 ?auto_3649902 ?auto_3649906 ?auto_3649901 ?auto_3649905 ?auto_3649900 )
      ( DELIVER-6PKG-VERIFY ?auto_3649901 ?auto_3649902 ?auto_3649903 ?auto_3649904 ?auto_3649905 ?auto_3649906 ?auto_3649900 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3651121 - OBJ
      ?auto_3651122 - OBJ
      ?auto_3651123 - OBJ
      ?auto_3651124 - OBJ
      ?auto_3651125 - OBJ
      ?auto_3651126 - OBJ
      ?auto_3651120 - LOCATION
    )
    :vars
    (
      ?auto_3651129 - LOCATION
      ?auto_3651131 - CITY
      ?auto_3651130 - LOCATION
      ?auto_3651127 - LOCATION
      ?auto_3651128 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3651129 ?auto_3651131 ) ( IN-CITY ?auto_3651120 ?auto_3651131 ) ( not ( = ?auto_3651120 ?auto_3651129 ) ) ( OBJ-AT ?auto_3651121 ?auto_3651129 ) ( IN-CITY ?auto_3651130 ?auto_3651131 ) ( not ( = ?auto_3651120 ?auto_3651130 ) ) ( OBJ-AT ?auto_3651124 ?auto_3651130 ) ( IN-CITY ?auto_3651127 ?auto_3651131 ) ( not ( = ?auto_3651120 ?auto_3651127 ) ) ( OBJ-AT ?auto_3651126 ?auto_3651127 ) ( OBJ-AT ?auto_3651122 ?auto_3651130 ) ( OBJ-AT ?auto_3651125 ?auto_3651127 ) ( OBJ-AT ?auto_3651123 ?auto_3651127 ) ( TRUCK-AT ?auto_3651128 ?auto_3651120 ) ( not ( = ?auto_3651123 ?auto_3651125 ) ) ( not ( = ?auto_3651123 ?auto_3651122 ) ) ( not ( = ?auto_3651125 ?auto_3651122 ) ) ( not ( = ?auto_3651130 ?auto_3651127 ) ) ( not ( = ?auto_3651123 ?auto_3651126 ) ) ( not ( = ?auto_3651125 ?auto_3651126 ) ) ( not ( = ?auto_3651122 ?auto_3651126 ) ) ( not ( = ?auto_3651123 ?auto_3651124 ) ) ( not ( = ?auto_3651125 ?auto_3651124 ) ) ( not ( = ?auto_3651122 ?auto_3651124 ) ) ( not ( = ?auto_3651126 ?auto_3651124 ) ) ( not ( = ?auto_3651123 ?auto_3651121 ) ) ( not ( = ?auto_3651125 ?auto_3651121 ) ) ( not ( = ?auto_3651122 ?auto_3651121 ) ) ( not ( = ?auto_3651126 ?auto_3651121 ) ) ( not ( = ?auto_3651124 ?auto_3651121 ) ) ( not ( = ?auto_3651129 ?auto_3651130 ) ) ( not ( = ?auto_3651129 ?auto_3651127 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3651123 ?auto_3651125 ?auto_3651122 ?auto_3651126 ?auto_3651121 ?auto_3651124 ?auto_3651120 )
      ( DELIVER-6PKG-VERIFY ?auto_3651121 ?auto_3651122 ?auto_3651123 ?auto_3651124 ?auto_3651125 ?auto_3651126 ?auto_3651120 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3661071 - OBJ
      ?auto_3661072 - OBJ
      ?auto_3661073 - OBJ
      ?auto_3661074 - OBJ
      ?auto_3661075 - OBJ
      ?auto_3661076 - OBJ
      ?auto_3661070 - LOCATION
    )
    :vars
    (
      ?auto_3661079 - LOCATION
      ?auto_3661081 - CITY
      ?auto_3661080 - LOCATION
      ?auto_3661077 - LOCATION
      ?auto_3661078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3661079 ?auto_3661081 ) ( IN-CITY ?auto_3661070 ?auto_3661081 ) ( not ( = ?auto_3661070 ?auto_3661079 ) ) ( OBJ-AT ?auto_3661071 ?auto_3661079 ) ( IN-CITY ?auto_3661080 ?auto_3661081 ) ( not ( = ?auto_3661070 ?auto_3661080 ) ) ( OBJ-AT ?auto_3661073 ?auto_3661080 ) ( IN-CITY ?auto_3661077 ?auto_3661081 ) ( not ( = ?auto_3661070 ?auto_3661077 ) ) ( OBJ-AT ?auto_3661076 ?auto_3661077 ) ( OBJ-AT ?auto_3661072 ?auto_3661080 ) ( OBJ-AT ?auto_3661075 ?auto_3661077 ) ( OBJ-AT ?auto_3661074 ?auto_3661077 ) ( TRUCK-AT ?auto_3661078 ?auto_3661070 ) ( not ( = ?auto_3661074 ?auto_3661075 ) ) ( not ( = ?auto_3661074 ?auto_3661072 ) ) ( not ( = ?auto_3661075 ?auto_3661072 ) ) ( not ( = ?auto_3661080 ?auto_3661077 ) ) ( not ( = ?auto_3661074 ?auto_3661076 ) ) ( not ( = ?auto_3661075 ?auto_3661076 ) ) ( not ( = ?auto_3661072 ?auto_3661076 ) ) ( not ( = ?auto_3661074 ?auto_3661073 ) ) ( not ( = ?auto_3661075 ?auto_3661073 ) ) ( not ( = ?auto_3661072 ?auto_3661073 ) ) ( not ( = ?auto_3661076 ?auto_3661073 ) ) ( not ( = ?auto_3661074 ?auto_3661071 ) ) ( not ( = ?auto_3661075 ?auto_3661071 ) ) ( not ( = ?auto_3661072 ?auto_3661071 ) ) ( not ( = ?auto_3661076 ?auto_3661071 ) ) ( not ( = ?auto_3661073 ?auto_3661071 ) ) ( not ( = ?auto_3661079 ?auto_3661080 ) ) ( not ( = ?auto_3661079 ?auto_3661077 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3661074 ?auto_3661075 ?auto_3661072 ?auto_3661076 ?auto_3661071 ?auto_3661073 ?auto_3661070 )
      ( DELIVER-6PKG-VERIFY ?auto_3661071 ?auto_3661072 ?auto_3661073 ?auto_3661074 ?auto_3661075 ?auto_3661076 ?auto_3661070 ) )
  )

)

