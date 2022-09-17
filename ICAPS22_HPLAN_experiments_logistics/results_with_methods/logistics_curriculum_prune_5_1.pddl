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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61827 - OBJ
      ?auto_61826 - LOCATION
    )
    :vars
    (
      ?auto_61829 - LOCATION
      ?auto_61830 - CITY
      ?auto_61828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61829 ?auto_61830 ) ( IN-CITY ?auto_61826 ?auto_61830 ) ( not ( = ?auto_61826 ?auto_61829 ) ) ( OBJ-AT ?auto_61827 ?auto_61829 ) ( TRUCK-AT ?auto_61828 ?auto_61826 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_61828 ?auto_61826 ?auto_61829 ?auto_61830 )
      ( !LOAD-TRUCK ?auto_61827 ?auto_61828 ?auto_61829 )
      ( !DRIVE-TRUCK ?auto_61828 ?auto_61829 ?auto_61826 ?auto_61830 )
      ( !UNLOAD-TRUCK ?auto_61827 ?auto_61828 ?auto_61826 )
      ( DELIVER-1PKG-VERIFY ?auto_61827 ?auto_61826 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61848 - OBJ
      ?auto_61849 - OBJ
      ?auto_61847 - LOCATION
    )
    :vars
    (
      ?auto_61852 - LOCATION
      ?auto_61851 - CITY
      ?auto_61853 - LOCATION
      ?auto_61850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61852 ?auto_61851 ) ( IN-CITY ?auto_61847 ?auto_61851 ) ( not ( = ?auto_61847 ?auto_61852 ) ) ( OBJ-AT ?auto_61849 ?auto_61852 ) ( IN-CITY ?auto_61853 ?auto_61851 ) ( not ( = ?auto_61847 ?auto_61853 ) ) ( OBJ-AT ?auto_61848 ?auto_61853 ) ( TRUCK-AT ?auto_61850 ?auto_61847 ) ( not ( = ?auto_61848 ?auto_61849 ) ) ( not ( = ?auto_61852 ?auto_61853 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61848 ?auto_61847 )
      ( DELIVER-1PKG ?auto_61849 ?auto_61847 )
      ( DELIVER-2PKG-VERIFY ?auto_61848 ?auto_61849 ?auto_61847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61959 - OBJ
      ?auto_61960 - OBJ
      ?auto_61961 - OBJ
      ?auto_61958 - LOCATION
    )
    :vars
    (
      ?auto_61963 - LOCATION
      ?auto_61962 - CITY
      ?auto_61966 - LOCATION
      ?auto_61965 - LOCATION
      ?auto_61964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61963 ?auto_61962 ) ( IN-CITY ?auto_61958 ?auto_61962 ) ( not ( = ?auto_61958 ?auto_61963 ) ) ( OBJ-AT ?auto_61961 ?auto_61963 ) ( IN-CITY ?auto_61966 ?auto_61962 ) ( not ( = ?auto_61958 ?auto_61966 ) ) ( OBJ-AT ?auto_61960 ?auto_61966 ) ( IN-CITY ?auto_61965 ?auto_61962 ) ( not ( = ?auto_61958 ?auto_61965 ) ) ( OBJ-AT ?auto_61959 ?auto_61965 ) ( TRUCK-AT ?auto_61964 ?auto_61958 ) ( not ( = ?auto_61959 ?auto_61960 ) ) ( not ( = ?auto_61966 ?auto_61965 ) ) ( not ( = ?auto_61959 ?auto_61961 ) ) ( not ( = ?auto_61960 ?auto_61961 ) ) ( not ( = ?auto_61963 ?auto_61966 ) ) ( not ( = ?auto_61963 ?auto_61965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61959 ?auto_61960 ?auto_61958 )
      ( DELIVER-1PKG ?auto_61961 ?auto_61958 )
      ( DELIVER-3PKG-VERIFY ?auto_61959 ?auto_61960 ?auto_61961 ?auto_61958 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_63102 - OBJ
      ?auto_63103 - OBJ
      ?auto_63104 - OBJ
      ?auto_63105 - OBJ
      ?auto_63101 - LOCATION
    )
    :vars
    (
      ?auto_63107 - LOCATION
      ?auto_63106 - CITY
      ?auto_63110 - LOCATION
      ?auto_63111 - LOCATION
      ?auto_63109 - LOCATION
      ?auto_63108 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_63107 ?auto_63106 ) ( IN-CITY ?auto_63101 ?auto_63106 ) ( not ( = ?auto_63101 ?auto_63107 ) ) ( OBJ-AT ?auto_63105 ?auto_63107 ) ( IN-CITY ?auto_63110 ?auto_63106 ) ( not ( = ?auto_63101 ?auto_63110 ) ) ( OBJ-AT ?auto_63104 ?auto_63110 ) ( IN-CITY ?auto_63111 ?auto_63106 ) ( not ( = ?auto_63101 ?auto_63111 ) ) ( OBJ-AT ?auto_63103 ?auto_63111 ) ( IN-CITY ?auto_63109 ?auto_63106 ) ( not ( = ?auto_63101 ?auto_63109 ) ) ( OBJ-AT ?auto_63102 ?auto_63109 ) ( TRUCK-AT ?auto_63108 ?auto_63101 ) ( not ( = ?auto_63102 ?auto_63103 ) ) ( not ( = ?auto_63111 ?auto_63109 ) ) ( not ( = ?auto_63102 ?auto_63104 ) ) ( not ( = ?auto_63103 ?auto_63104 ) ) ( not ( = ?auto_63110 ?auto_63111 ) ) ( not ( = ?auto_63110 ?auto_63109 ) ) ( not ( = ?auto_63102 ?auto_63105 ) ) ( not ( = ?auto_63103 ?auto_63105 ) ) ( not ( = ?auto_63104 ?auto_63105 ) ) ( not ( = ?auto_63107 ?auto_63110 ) ) ( not ( = ?auto_63107 ?auto_63111 ) ) ( not ( = ?auto_63107 ?auto_63109 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_63102 ?auto_63103 ?auto_63104 ?auto_63101 )
      ( DELIVER-1PKG ?auto_63105 ?auto_63101 )
      ( DELIVER-4PKG-VERIFY ?auto_63102 ?auto_63103 ?auto_63104 ?auto_63105 ?auto_63101 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78712 - OBJ
      ?auto_78713 - OBJ
      ?auto_78714 - OBJ
      ?auto_78715 - OBJ
      ?auto_78716 - OBJ
      ?auto_78711 - LOCATION
    )
    :vars
    (
      ?auto_78717 - LOCATION
      ?auto_78718 - CITY
      ?auto_78722 - LOCATION
      ?auto_78720 - LOCATION
      ?auto_78721 - LOCATION
      ?auto_78719 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78717 ?auto_78718 ) ( IN-CITY ?auto_78711 ?auto_78718 ) ( not ( = ?auto_78711 ?auto_78717 ) ) ( OBJ-AT ?auto_78716 ?auto_78717 ) ( IN-CITY ?auto_78722 ?auto_78718 ) ( not ( = ?auto_78711 ?auto_78722 ) ) ( OBJ-AT ?auto_78715 ?auto_78722 ) ( OBJ-AT ?auto_78714 ?auto_78717 ) ( IN-CITY ?auto_78720 ?auto_78718 ) ( not ( = ?auto_78711 ?auto_78720 ) ) ( OBJ-AT ?auto_78713 ?auto_78720 ) ( IN-CITY ?auto_78721 ?auto_78718 ) ( not ( = ?auto_78711 ?auto_78721 ) ) ( OBJ-AT ?auto_78712 ?auto_78721 ) ( TRUCK-AT ?auto_78719 ?auto_78711 ) ( not ( = ?auto_78712 ?auto_78713 ) ) ( not ( = ?auto_78720 ?auto_78721 ) ) ( not ( = ?auto_78712 ?auto_78714 ) ) ( not ( = ?auto_78713 ?auto_78714 ) ) ( not ( = ?auto_78717 ?auto_78720 ) ) ( not ( = ?auto_78717 ?auto_78721 ) ) ( not ( = ?auto_78712 ?auto_78715 ) ) ( not ( = ?auto_78713 ?auto_78715 ) ) ( not ( = ?auto_78714 ?auto_78715 ) ) ( not ( = ?auto_78722 ?auto_78717 ) ) ( not ( = ?auto_78722 ?auto_78720 ) ) ( not ( = ?auto_78722 ?auto_78721 ) ) ( not ( = ?auto_78712 ?auto_78716 ) ) ( not ( = ?auto_78713 ?auto_78716 ) ) ( not ( = ?auto_78714 ?auto_78716 ) ) ( not ( = ?auto_78715 ?auto_78716 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_78712 ?auto_78713 ?auto_78714 ?auto_78715 ?auto_78711 )
      ( DELIVER-1PKG ?auto_78716 ?auto_78711 )
      ( DELIVER-5PKG-VERIFY ?auto_78712 ?auto_78713 ?auto_78714 ?auto_78715 ?auto_78716 ?auto_78711 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78763 - OBJ
      ?auto_78764 - OBJ
      ?auto_78765 - OBJ
      ?auto_78766 - OBJ
      ?auto_78767 - OBJ
      ?auto_78762 - LOCATION
    )
    :vars
    (
      ?auto_78773 - LOCATION
      ?auto_78769 - CITY
      ?auto_78770 - LOCATION
      ?auto_78768 - LOCATION
      ?auto_78772 - LOCATION
      ?auto_78771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78773 ?auto_78769 ) ( IN-CITY ?auto_78762 ?auto_78769 ) ( not ( = ?auto_78762 ?auto_78773 ) ) ( OBJ-AT ?auto_78766 ?auto_78773 ) ( IN-CITY ?auto_78770 ?auto_78769 ) ( not ( = ?auto_78762 ?auto_78770 ) ) ( OBJ-AT ?auto_78767 ?auto_78770 ) ( OBJ-AT ?auto_78765 ?auto_78773 ) ( IN-CITY ?auto_78768 ?auto_78769 ) ( not ( = ?auto_78762 ?auto_78768 ) ) ( OBJ-AT ?auto_78764 ?auto_78768 ) ( IN-CITY ?auto_78772 ?auto_78769 ) ( not ( = ?auto_78762 ?auto_78772 ) ) ( OBJ-AT ?auto_78763 ?auto_78772 ) ( TRUCK-AT ?auto_78771 ?auto_78762 ) ( not ( = ?auto_78763 ?auto_78764 ) ) ( not ( = ?auto_78768 ?auto_78772 ) ) ( not ( = ?auto_78763 ?auto_78765 ) ) ( not ( = ?auto_78764 ?auto_78765 ) ) ( not ( = ?auto_78773 ?auto_78768 ) ) ( not ( = ?auto_78773 ?auto_78772 ) ) ( not ( = ?auto_78763 ?auto_78767 ) ) ( not ( = ?auto_78764 ?auto_78767 ) ) ( not ( = ?auto_78765 ?auto_78767 ) ) ( not ( = ?auto_78770 ?auto_78773 ) ) ( not ( = ?auto_78770 ?auto_78768 ) ) ( not ( = ?auto_78770 ?auto_78772 ) ) ( not ( = ?auto_78763 ?auto_78766 ) ) ( not ( = ?auto_78764 ?auto_78766 ) ) ( not ( = ?auto_78765 ?auto_78766 ) ) ( not ( = ?auto_78767 ?auto_78766 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78763 ?auto_78764 ?auto_78765 ?auto_78767 ?auto_78766 ?auto_78762 )
      ( DELIVER-5PKG-VERIFY ?auto_78763 ?auto_78764 ?auto_78765 ?auto_78766 ?auto_78767 ?auto_78762 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78814 - OBJ
      ?auto_78815 - OBJ
      ?auto_78816 - OBJ
      ?auto_78817 - OBJ
      ?auto_78818 - OBJ
      ?auto_78813 - LOCATION
    )
    :vars
    (
      ?auto_78824 - LOCATION
      ?auto_78823 - CITY
      ?auto_78821 - LOCATION
      ?auto_78822 - LOCATION
      ?auto_78819 - LOCATION
      ?auto_78820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78824 ?auto_78823 ) ( IN-CITY ?auto_78813 ?auto_78823 ) ( not ( = ?auto_78813 ?auto_78824 ) ) ( OBJ-AT ?auto_78818 ?auto_78824 ) ( IN-CITY ?auto_78821 ?auto_78823 ) ( not ( = ?auto_78813 ?auto_78821 ) ) ( OBJ-AT ?auto_78816 ?auto_78821 ) ( OBJ-AT ?auto_78817 ?auto_78824 ) ( IN-CITY ?auto_78822 ?auto_78823 ) ( not ( = ?auto_78813 ?auto_78822 ) ) ( OBJ-AT ?auto_78815 ?auto_78822 ) ( IN-CITY ?auto_78819 ?auto_78823 ) ( not ( = ?auto_78813 ?auto_78819 ) ) ( OBJ-AT ?auto_78814 ?auto_78819 ) ( TRUCK-AT ?auto_78820 ?auto_78813 ) ( not ( = ?auto_78814 ?auto_78815 ) ) ( not ( = ?auto_78822 ?auto_78819 ) ) ( not ( = ?auto_78814 ?auto_78817 ) ) ( not ( = ?auto_78815 ?auto_78817 ) ) ( not ( = ?auto_78824 ?auto_78822 ) ) ( not ( = ?auto_78824 ?auto_78819 ) ) ( not ( = ?auto_78814 ?auto_78816 ) ) ( not ( = ?auto_78815 ?auto_78816 ) ) ( not ( = ?auto_78817 ?auto_78816 ) ) ( not ( = ?auto_78821 ?auto_78824 ) ) ( not ( = ?auto_78821 ?auto_78822 ) ) ( not ( = ?auto_78821 ?auto_78819 ) ) ( not ( = ?auto_78814 ?auto_78818 ) ) ( not ( = ?auto_78815 ?auto_78818 ) ) ( not ( = ?auto_78817 ?auto_78818 ) ) ( not ( = ?auto_78816 ?auto_78818 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78814 ?auto_78815 ?auto_78817 ?auto_78818 ?auto_78816 ?auto_78813 )
      ( DELIVER-5PKG-VERIFY ?auto_78814 ?auto_78815 ?auto_78816 ?auto_78817 ?auto_78818 ?auto_78813 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79378 - OBJ
      ?auto_79379 - OBJ
      ?auto_79380 - OBJ
      ?auto_79381 - OBJ
      ?auto_79382 - OBJ
      ?auto_79377 - LOCATION
    )
    :vars
    (
      ?auto_79388 - LOCATION
      ?auto_79387 - CITY
      ?auto_79385 - LOCATION
      ?auto_79386 - LOCATION
      ?auto_79383 - LOCATION
      ?auto_79384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79388 ?auto_79387 ) ( IN-CITY ?auto_79377 ?auto_79387 ) ( not ( = ?auto_79377 ?auto_79388 ) ) ( OBJ-AT ?auto_79382 ?auto_79388 ) ( IN-CITY ?auto_79385 ?auto_79387 ) ( not ( = ?auto_79377 ?auto_79385 ) ) ( OBJ-AT ?auto_79381 ?auto_79385 ) ( OBJ-AT ?auto_79379 ?auto_79388 ) ( IN-CITY ?auto_79386 ?auto_79387 ) ( not ( = ?auto_79377 ?auto_79386 ) ) ( OBJ-AT ?auto_79380 ?auto_79386 ) ( IN-CITY ?auto_79383 ?auto_79387 ) ( not ( = ?auto_79377 ?auto_79383 ) ) ( OBJ-AT ?auto_79378 ?auto_79383 ) ( TRUCK-AT ?auto_79384 ?auto_79377 ) ( not ( = ?auto_79378 ?auto_79380 ) ) ( not ( = ?auto_79386 ?auto_79383 ) ) ( not ( = ?auto_79378 ?auto_79379 ) ) ( not ( = ?auto_79380 ?auto_79379 ) ) ( not ( = ?auto_79388 ?auto_79386 ) ) ( not ( = ?auto_79388 ?auto_79383 ) ) ( not ( = ?auto_79378 ?auto_79381 ) ) ( not ( = ?auto_79380 ?auto_79381 ) ) ( not ( = ?auto_79379 ?auto_79381 ) ) ( not ( = ?auto_79385 ?auto_79388 ) ) ( not ( = ?auto_79385 ?auto_79386 ) ) ( not ( = ?auto_79385 ?auto_79383 ) ) ( not ( = ?auto_79378 ?auto_79382 ) ) ( not ( = ?auto_79380 ?auto_79382 ) ) ( not ( = ?auto_79379 ?auto_79382 ) ) ( not ( = ?auto_79381 ?auto_79382 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79378 ?auto_79380 ?auto_79379 ?auto_79382 ?auto_79381 ?auto_79377 )
      ( DELIVER-5PKG-VERIFY ?auto_79378 ?auto_79379 ?auto_79380 ?auto_79381 ?auto_79382 ?auto_79377 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79429 - OBJ
      ?auto_79430 - OBJ
      ?auto_79431 - OBJ
      ?auto_79432 - OBJ
      ?auto_79433 - OBJ
      ?auto_79428 - LOCATION
    )
    :vars
    (
      ?auto_79439 - LOCATION
      ?auto_79438 - CITY
      ?auto_79436 - LOCATION
      ?auto_79437 - LOCATION
      ?auto_79434 - LOCATION
      ?auto_79435 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79439 ?auto_79438 ) ( IN-CITY ?auto_79428 ?auto_79438 ) ( not ( = ?auto_79428 ?auto_79439 ) ) ( OBJ-AT ?auto_79432 ?auto_79439 ) ( IN-CITY ?auto_79436 ?auto_79438 ) ( not ( = ?auto_79428 ?auto_79436 ) ) ( OBJ-AT ?auto_79433 ?auto_79436 ) ( OBJ-AT ?auto_79430 ?auto_79439 ) ( IN-CITY ?auto_79437 ?auto_79438 ) ( not ( = ?auto_79428 ?auto_79437 ) ) ( OBJ-AT ?auto_79431 ?auto_79437 ) ( IN-CITY ?auto_79434 ?auto_79438 ) ( not ( = ?auto_79428 ?auto_79434 ) ) ( OBJ-AT ?auto_79429 ?auto_79434 ) ( TRUCK-AT ?auto_79435 ?auto_79428 ) ( not ( = ?auto_79429 ?auto_79431 ) ) ( not ( = ?auto_79437 ?auto_79434 ) ) ( not ( = ?auto_79429 ?auto_79430 ) ) ( not ( = ?auto_79431 ?auto_79430 ) ) ( not ( = ?auto_79439 ?auto_79437 ) ) ( not ( = ?auto_79439 ?auto_79434 ) ) ( not ( = ?auto_79429 ?auto_79433 ) ) ( not ( = ?auto_79431 ?auto_79433 ) ) ( not ( = ?auto_79430 ?auto_79433 ) ) ( not ( = ?auto_79436 ?auto_79439 ) ) ( not ( = ?auto_79436 ?auto_79437 ) ) ( not ( = ?auto_79436 ?auto_79434 ) ) ( not ( = ?auto_79429 ?auto_79432 ) ) ( not ( = ?auto_79431 ?auto_79432 ) ) ( not ( = ?auto_79430 ?auto_79432 ) ) ( not ( = ?auto_79433 ?auto_79432 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79429 ?auto_79431 ?auto_79430 ?auto_79432 ?auto_79433 ?auto_79428 )
      ( DELIVER-5PKG-VERIFY ?auto_79429 ?auto_79430 ?auto_79431 ?auto_79432 ?auto_79433 ?auto_79428 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79786 - OBJ
      ?auto_79787 - OBJ
      ?auto_79788 - OBJ
      ?auto_79789 - OBJ
      ?auto_79790 - OBJ
      ?auto_79785 - LOCATION
    )
    :vars
    (
      ?auto_79796 - LOCATION
      ?auto_79795 - CITY
      ?auto_79793 - LOCATION
      ?auto_79794 - LOCATION
      ?auto_79791 - LOCATION
      ?auto_79792 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79796 ?auto_79795 ) ( IN-CITY ?auto_79785 ?auto_79795 ) ( not ( = ?auto_79785 ?auto_79796 ) ) ( OBJ-AT ?auto_79788 ?auto_79796 ) ( IN-CITY ?auto_79793 ?auto_79795 ) ( not ( = ?auto_79785 ?auto_79793 ) ) ( OBJ-AT ?auto_79790 ?auto_79793 ) ( OBJ-AT ?auto_79787 ?auto_79796 ) ( IN-CITY ?auto_79794 ?auto_79795 ) ( not ( = ?auto_79785 ?auto_79794 ) ) ( OBJ-AT ?auto_79789 ?auto_79794 ) ( IN-CITY ?auto_79791 ?auto_79795 ) ( not ( = ?auto_79785 ?auto_79791 ) ) ( OBJ-AT ?auto_79786 ?auto_79791 ) ( TRUCK-AT ?auto_79792 ?auto_79785 ) ( not ( = ?auto_79786 ?auto_79789 ) ) ( not ( = ?auto_79794 ?auto_79791 ) ) ( not ( = ?auto_79786 ?auto_79787 ) ) ( not ( = ?auto_79789 ?auto_79787 ) ) ( not ( = ?auto_79796 ?auto_79794 ) ) ( not ( = ?auto_79796 ?auto_79791 ) ) ( not ( = ?auto_79786 ?auto_79790 ) ) ( not ( = ?auto_79789 ?auto_79790 ) ) ( not ( = ?auto_79787 ?auto_79790 ) ) ( not ( = ?auto_79793 ?auto_79796 ) ) ( not ( = ?auto_79793 ?auto_79794 ) ) ( not ( = ?auto_79793 ?auto_79791 ) ) ( not ( = ?auto_79786 ?auto_79788 ) ) ( not ( = ?auto_79789 ?auto_79788 ) ) ( not ( = ?auto_79787 ?auto_79788 ) ) ( not ( = ?auto_79790 ?auto_79788 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79786 ?auto_79789 ?auto_79787 ?auto_79788 ?auto_79790 ?auto_79785 )
      ( DELIVER-5PKG-VERIFY ?auto_79786 ?auto_79787 ?auto_79788 ?auto_79789 ?auto_79790 ?auto_79785 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87401 - OBJ
      ?auto_87402 - OBJ
      ?auto_87403 - OBJ
      ?auto_87404 - OBJ
      ?auto_87405 - OBJ
      ?auto_87400 - LOCATION
    )
    :vars
    (
      ?auto_87411 - LOCATION
      ?auto_87410 - CITY
      ?auto_87408 - LOCATION
      ?auto_87409 - LOCATION
      ?auto_87406 - LOCATION
      ?auto_87407 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87411 ?auto_87410 ) ( IN-CITY ?auto_87400 ?auto_87410 ) ( not ( = ?auto_87400 ?auto_87411 ) ) ( OBJ-AT ?auto_87405 ?auto_87411 ) ( IN-CITY ?auto_87408 ?auto_87410 ) ( not ( = ?auto_87400 ?auto_87408 ) ) ( OBJ-AT ?auto_87404 ?auto_87408 ) ( OBJ-AT ?auto_87401 ?auto_87411 ) ( IN-CITY ?auto_87409 ?auto_87410 ) ( not ( = ?auto_87400 ?auto_87409 ) ) ( OBJ-AT ?auto_87403 ?auto_87409 ) ( IN-CITY ?auto_87406 ?auto_87410 ) ( not ( = ?auto_87400 ?auto_87406 ) ) ( OBJ-AT ?auto_87402 ?auto_87406 ) ( TRUCK-AT ?auto_87407 ?auto_87400 ) ( not ( = ?auto_87402 ?auto_87403 ) ) ( not ( = ?auto_87409 ?auto_87406 ) ) ( not ( = ?auto_87402 ?auto_87401 ) ) ( not ( = ?auto_87403 ?auto_87401 ) ) ( not ( = ?auto_87411 ?auto_87409 ) ) ( not ( = ?auto_87411 ?auto_87406 ) ) ( not ( = ?auto_87402 ?auto_87404 ) ) ( not ( = ?auto_87403 ?auto_87404 ) ) ( not ( = ?auto_87401 ?auto_87404 ) ) ( not ( = ?auto_87408 ?auto_87411 ) ) ( not ( = ?auto_87408 ?auto_87409 ) ) ( not ( = ?auto_87408 ?auto_87406 ) ) ( not ( = ?auto_87402 ?auto_87405 ) ) ( not ( = ?auto_87403 ?auto_87405 ) ) ( not ( = ?auto_87401 ?auto_87405 ) ) ( not ( = ?auto_87404 ?auto_87405 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87402 ?auto_87403 ?auto_87401 ?auto_87405 ?auto_87404 ?auto_87400 )
      ( DELIVER-5PKG-VERIFY ?auto_87401 ?auto_87402 ?auto_87403 ?auto_87404 ?auto_87405 ?auto_87400 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87452 - OBJ
      ?auto_87453 - OBJ
      ?auto_87454 - OBJ
      ?auto_87455 - OBJ
      ?auto_87456 - OBJ
      ?auto_87451 - LOCATION
    )
    :vars
    (
      ?auto_87462 - LOCATION
      ?auto_87461 - CITY
      ?auto_87459 - LOCATION
      ?auto_87460 - LOCATION
      ?auto_87457 - LOCATION
      ?auto_87458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87462 ?auto_87461 ) ( IN-CITY ?auto_87451 ?auto_87461 ) ( not ( = ?auto_87451 ?auto_87462 ) ) ( OBJ-AT ?auto_87455 ?auto_87462 ) ( IN-CITY ?auto_87459 ?auto_87461 ) ( not ( = ?auto_87451 ?auto_87459 ) ) ( OBJ-AT ?auto_87456 ?auto_87459 ) ( OBJ-AT ?auto_87452 ?auto_87462 ) ( IN-CITY ?auto_87460 ?auto_87461 ) ( not ( = ?auto_87451 ?auto_87460 ) ) ( OBJ-AT ?auto_87454 ?auto_87460 ) ( IN-CITY ?auto_87457 ?auto_87461 ) ( not ( = ?auto_87451 ?auto_87457 ) ) ( OBJ-AT ?auto_87453 ?auto_87457 ) ( TRUCK-AT ?auto_87458 ?auto_87451 ) ( not ( = ?auto_87453 ?auto_87454 ) ) ( not ( = ?auto_87460 ?auto_87457 ) ) ( not ( = ?auto_87453 ?auto_87452 ) ) ( not ( = ?auto_87454 ?auto_87452 ) ) ( not ( = ?auto_87462 ?auto_87460 ) ) ( not ( = ?auto_87462 ?auto_87457 ) ) ( not ( = ?auto_87453 ?auto_87456 ) ) ( not ( = ?auto_87454 ?auto_87456 ) ) ( not ( = ?auto_87452 ?auto_87456 ) ) ( not ( = ?auto_87459 ?auto_87462 ) ) ( not ( = ?auto_87459 ?auto_87460 ) ) ( not ( = ?auto_87459 ?auto_87457 ) ) ( not ( = ?auto_87453 ?auto_87455 ) ) ( not ( = ?auto_87454 ?auto_87455 ) ) ( not ( = ?auto_87452 ?auto_87455 ) ) ( not ( = ?auto_87456 ?auto_87455 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87453 ?auto_87454 ?auto_87452 ?auto_87455 ?auto_87456 ?auto_87451 )
      ( DELIVER-5PKG-VERIFY ?auto_87452 ?auto_87453 ?auto_87454 ?auto_87455 ?auto_87456 ?auto_87451 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87809 - OBJ
      ?auto_87810 - OBJ
      ?auto_87811 - OBJ
      ?auto_87812 - OBJ
      ?auto_87813 - OBJ
      ?auto_87808 - LOCATION
    )
    :vars
    (
      ?auto_87819 - LOCATION
      ?auto_87818 - CITY
      ?auto_87816 - LOCATION
      ?auto_87817 - LOCATION
      ?auto_87814 - LOCATION
      ?auto_87815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87819 ?auto_87818 ) ( IN-CITY ?auto_87808 ?auto_87818 ) ( not ( = ?auto_87808 ?auto_87819 ) ) ( OBJ-AT ?auto_87811 ?auto_87819 ) ( IN-CITY ?auto_87816 ?auto_87818 ) ( not ( = ?auto_87808 ?auto_87816 ) ) ( OBJ-AT ?auto_87813 ?auto_87816 ) ( OBJ-AT ?auto_87809 ?auto_87819 ) ( IN-CITY ?auto_87817 ?auto_87818 ) ( not ( = ?auto_87808 ?auto_87817 ) ) ( OBJ-AT ?auto_87812 ?auto_87817 ) ( IN-CITY ?auto_87814 ?auto_87818 ) ( not ( = ?auto_87808 ?auto_87814 ) ) ( OBJ-AT ?auto_87810 ?auto_87814 ) ( TRUCK-AT ?auto_87815 ?auto_87808 ) ( not ( = ?auto_87810 ?auto_87812 ) ) ( not ( = ?auto_87817 ?auto_87814 ) ) ( not ( = ?auto_87810 ?auto_87809 ) ) ( not ( = ?auto_87812 ?auto_87809 ) ) ( not ( = ?auto_87819 ?auto_87817 ) ) ( not ( = ?auto_87819 ?auto_87814 ) ) ( not ( = ?auto_87810 ?auto_87813 ) ) ( not ( = ?auto_87812 ?auto_87813 ) ) ( not ( = ?auto_87809 ?auto_87813 ) ) ( not ( = ?auto_87816 ?auto_87819 ) ) ( not ( = ?auto_87816 ?auto_87817 ) ) ( not ( = ?auto_87816 ?auto_87814 ) ) ( not ( = ?auto_87810 ?auto_87811 ) ) ( not ( = ?auto_87812 ?auto_87811 ) ) ( not ( = ?auto_87809 ?auto_87811 ) ) ( not ( = ?auto_87813 ?auto_87811 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87810 ?auto_87812 ?auto_87809 ?auto_87811 ?auto_87813 ?auto_87808 )
      ( DELIVER-5PKG-VERIFY ?auto_87809 ?auto_87810 ?auto_87811 ?auto_87812 ?auto_87813 ?auto_87808 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90518 - OBJ
      ?auto_90519 - OBJ
      ?auto_90520 - OBJ
      ?auto_90521 - OBJ
      ?auto_90522 - OBJ
      ?auto_90517 - LOCATION
    )
    :vars
    (
      ?auto_90528 - LOCATION
      ?auto_90527 - CITY
      ?auto_90525 - LOCATION
      ?auto_90526 - LOCATION
      ?auto_90523 - LOCATION
      ?auto_90524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90528 ?auto_90527 ) ( IN-CITY ?auto_90517 ?auto_90527 ) ( not ( = ?auto_90517 ?auto_90528 ) ) ( OBJ-AT ?auto_90519 ?auto_90528 ) ( IN-CITY ?auto_90525 ?auto_90527 ) ( not ( = ?auto_90517 ?auto_90525 ) ) ( OBJ-AT ?auto_90522 ?auto_90525 ) ( OBJ-AT ?auto_90518 ?auto_90528 ) ( IN-CITY ?auto_90526 ?auto_90527 ) ( not ( = ?auto_90517 ?auto_90526 ) ) ( OBJ-AT ?auto_90521 ?auto_90526 ) ( IN-CITY ?auto_90523 ?auto_90527 ) ( not ( = ?auto_90517 ?auto_90523 ) ) ( OBJ-AT ?auto_90520 ?auto_90523 ) ( TRUCK-AT ?auto_90524 ?auto_90517 ) ( not ( = ?auto_90520 ?auto_90521 ) ) ( not ( = ?auto_90526 ?auto_90523 ) ) ( not ( = ?auto_90520 ?auto_90518 ) ) ( not ( = ?auto_90521 ?auto_90518 ) ) ( not ( = ?auto_90528 ?auto_90526 ) ) ( not ( = ?auto_90528 ?auto_90523 ) ) ( not ( = ?auto_90520 ?auto_90522 ) ) ( not ( = ?auto_90521 ?auto_90522 ) ) ( not ( = ?auto_90518 ?auto_90522 ) ) ( not ( = ?auto_90525 ?auto_90528 ) ) ( not ( = ?auto_90525 ?auto_90526 ) ) ( not ( = ?auto_90525 ?auto_90523 ) ) ( not ( = ?auto_90520 ?auto_90519 ) ) ( not ( = ?auto_90521 ?auto_90519 ) ) ( not ( = ?auto_90518 ?auto_90519 ) ) ( not ( = ?auto_90522 ?auto_90519 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90520 ?auto_90521 ?auto_90518 ?auto_90519 ?auto_90522 ?auto_90517 )
      ( DELIVER-5PKG-VERIFY ?auto_90518 ?auto_90519 ?auto_90520 ?auto_90521 ?auto_90522 ?auto_90517 ) )
  )

)

