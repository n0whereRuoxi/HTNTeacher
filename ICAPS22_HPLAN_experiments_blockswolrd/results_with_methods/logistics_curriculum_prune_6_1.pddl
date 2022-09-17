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
      ?auto_948579 - OBJ
      ?auto_948578 - LOCATION
    )
    :vars
    (
      ?auto_948581 - LOCATION
      ?auto_948582 - CITY
      ?auto_948580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_948581 ?auto_948582 ) ( IN-CITY ?auto_948578 ?auto_948582 ) ( not ( = ?auto_948578 ?auto_948581 ) ) ( OBJ-AT ?auto_948579 ?auto_948581 ) ( TRUCK-AT ?auto_948580 ?auto_948578 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_948580 ?auto_948578 ?auto_948581 ?auto_948582 )
      ( !LOAD-TRUCK ?auto_948579 ?auto_948580 ?auto_948581 )
      ( !DRIVE-TRUCK ?auto_948580 ?auto_948581 ?auto_948578 ?auto_948582 )
      ( !UNLOAD-TRUCK ?auto_948579 ?auto_948580 ?auto_948578 )
      ( DELIVER-1PKG-VERIFY ?auto_948579 ?auto_948578 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_948600 - OBJ
      ?auto_948601 - OBJ
      ?auto_948599 - LOCATION
    )
    :vars
    (
      ?auto_948603 - LOCATION
      ?auto_948604 - CITY
      ?auto_948602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_948603 ?auto_948604 ) ( IN-CITY ?auto_948599 ?auto_948604 ) ( not ( = ?auto_948599 ?auto_948603 ) ) ( OBJ-AT ?auto_948601 ?auto_948603 ) ( OBJ-AT ?auto_948600 ?auto_948603 ) ( TRUCK-AT ?auto_948602 ?auto_948599 ) ( not ( = ?auto_948600 ?auto_948601 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_948600 ?auto_948599 )
      ( DELIVER-1PKG ?auto_948601 ?auto_948599 )
      ( DELIVER-2PKG-VERIFY ?auto_948600 ?auto_948601 ?auto_948599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_948708 - OBJ
      ?auto_948709 - OBJ
      ?auto_948710 - OBJ
      ?auto_948707 - LOCATION
    )
    :vars
    (
      ?auto_948713 - LOCATION
      ?auto_948711 - CITY
      ?auto_948714 - LOCATION
      ?auto_948712 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_948713 ?auto_948711 ) ( IN-CITY ?auto_948707 ?auto_948711 ) ( not ( = ?auto_948707 ?auto_948713 ) ) ( OBJ-AT ?auto_948710 ?auto_948713 ) ( IN-CITY ?auto_948714 ?auto_948711 ) ( not ( = ?auto_948707 ?auto_948714 ) ) ( OBJ-AT ?auto_948709 ?auto_948714 ) ( OBJ-AT ?auto_948708 ?auto_948714 ) ( TRUCK-AT ?auto_948712 ?auto_948707 ) ( not ( = ?auto_948708 ?auto_948709 ) ) ( not ( = ?auto_948708 ?auto_948710 ) ) ( not ( = ?auto_948709 ?auto_948710 ) ) ( not ( = ?auto_948713 ?auto_948714 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_948708 ?auto_948709 ?auto_948707 )
      ( DELIVER-1PKG ?auto_948710 ?auto_948707 )
      ( DELIVER-3PKG-VERIFY ?auto_948708 ?auto_948709 ?auto_948710 ?auto_948707 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_948725 - OBJ
      ?auto_948726 - OBJ
      ?auto_948727 - OBJ
      ?auto_948724 - LOCATION
    )
    :vars
    (
      ?auto_948730 - LOCATION
      ?auto_948728 - CITY
      ?auto_948729 - LOCATION
      ?auto_948731 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_948730 ?auto_948728 ) ( IN-CITY ?auto_948724 ?auto_948728 ) ( not ( = ?auto_948724 ?auto_948730 ) ) ( OBJ-AT ?auto_948726 ?auto_948730 ) ( IN-CITY ?auto_948729 ?auto_948728 ) ( not ( = ?auto_948724 ?auto_948729 ) ) ( OBJ-AT ?auto_948727 ?auto_948729 ) ( OBJ-AT ?auto_948725 ?auto_948729 ) ( TRUCK-AT ?auto_948731 ?auto_948724 ) ( not ( = ?auto_948725 ?auto_948727 ) ) ( not ( = ?auto_948725 ?auto_948726 ) ) ( not ( = ?auto_948727 ?auto_948726 ) ) ( not ( = ?auto_948730 ?auto_948729 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_948725 ?auto_948727 ?auto_948726 ?auto_948724 )
      ( DELIVER-3PKG-VERIFY ?auto_948725 ?auto_948726 ?auto_948727 ?auto_948724 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_948786 - OBJ
      ?auto_948787 - OBJ
      ?auto_948788 - OBJ
      ?auto_948785 - LOCATION
    )
    :vars
    (
      ?auto_948791 - LOCATION
      ?auto_948789 - CITY
      ?auto_948790 - LOCATION
      ?auto_948792 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_948791 ?auto_948789 ) ( IN-CITY ?auto_948785 ?auto_948789 ) ( not ( = ?auto_948785 ?auto_948791 ) ) ( OBJ-AT ?auto_948786 ?auto_948791 ) ( IN-CITY ?auto_948790 ?auto_948789 ) ( not ( = ?auto_948785 ?auto_948790 ) ) ( OBJ-AT ?auto_948788 ?auto_948790 ) ( OBJ-AT ?auto_948787 ?auto_948790 ) ( TRUCK-AT ?auto_948792 ?auto_948785 ) ( not ( = ?auto_948787 ?auto_948788 ) ) ( not ( = ?auto_948787 ?auto_948786 ) ) ( not ( = ?auto_948788 ?auto_948786 ) ) ( not ( = ?auto_948791 ?auto_948790 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_948787 ?auto_948786 ?auto_948788 ?auto_948785 )
      ( DELIVER-3PKG-VERIFY ?auto_948786 ?auto_948787 ?auto_948788 ?auto_948785 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_949828 - OBJ
      ?auto_949829 - OBJ
      ?auto_949830 - OBJ
      ?auto_949831 - OBJ
      ?auto_949827 - LOCATION
    )
    :vars
    (
      ?auto_949834 - LOCATION
      ?auto_949832 - CITY
      ?auto_949835 - LOCATION
      ?auto_949833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_949834 ?auto_949832 ) ( IN-CITY ?auto_949827 ?auto_949832 ) ( not ( = ?auto_949827 ?auto_949834 ) ) ( OBJ-AT ?auto_949831 ?auto_949834 ) ( IN-CITY ?auto_949835 ?auto_949832 ) ( not ( = ?auto_949827 ?auto_949835 ) ) ( OBJ-AT ?auto_949830 ?auto_949835 ) ( OBJ-AT ?auto_949829 ?auto_949834 ) ( OBJ-AT ?auto_949828 ?auto_949834 ) ( TRUCK-AT ?auto_949833 ?auto_949827 ) ( not ( = ?auto_949828 ?auto_949829 ) ) ( not ( = ?auto_949828 ?auto_949830 ) ) ( not ( = ?auto_949829 ?auto_949830 ) ) ( not ( = ?auto_949835 ?auto_949834 ) ) ( not ( = ?auto_949828 ?auto_949831 ) ) ( not ( = ?auto_949829 ?auto_949831 ) ) ( not ( = ?auto_949830 ?auto_949831 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_949828 ?auto_949830 ?auto_949829 ?auto_949827 )
      ( DELIVER-1PKG ?auto_949831 ?auto_949827 )
      ( DELIVER-4PKG-VERIFY ?auto_949828 ?auto_949829 ?auto_949830 ?auto_949831 ?auto_949827 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_949857 - OBJ
      ?auto_949858 - OBJ
      ?auto_949859 - OBJ
      ?auto_949860 - OBJ
      ?auto_949856 - LOCATION
    )
    :vars
    (
      ?auto_949863 - LOCATION
      ?auto_949864 - CITY
      ?auto_949862 - LOCATION
      ?auto_949861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_949863 ?auto_949864 ) ( IN-CITY ?auto_949856 ?auto_949864 ) ( not ( = ?auto_949856 ?auto_949863 ) ) ( OBJ-AT ?auto_949859 ?auto_949863 ) ( IN-CITY ?auto_949862 ?auto_949864 ) ( not ( = ?auto_949856 ?auto_949862 ) ) ( OBJ-AT ?auto_949860 ?auto_949862 ) ( OBJ-AT ?auto_949858 ?auto_949863 ) ( OBJ-AT ?auto_949857 ?auto_949863 ) ( TRUCK-AT ?auto_949861 ?auto_949856 ) ( not ( = ?auto_949857 ?auto_949858 ) ) ( not ( = ?auto_949857 ?auto_949860 ) ) ( not ( = ?auto_949858 ?auto_949860 ) ) ( not ( = ?auto_949862 ?auto_949863 ) ) ( not ( = ?auto_949857 ?auto_949859 ) ) ( not ( = ?auto_949858 ?auto_949859 ) ) ( not ( = ?auto_949860 ?auto_949859 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_949857 ?auto_949858 ?auto_949860 ?auto_949859 ?auto_949856 )
      ( DELIVER-4PKG-VERIFY ?auto_949857 ?auto_949858 ?auto_949859 ?auto_949860 ?auto_949856 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_949886 - OBJ
      ?auto_949887 - OBJ
      ?auto_949888 - OBJ
      ?auto_949889 - OBJ
      ?auto_949885 - LOCATION
    )
    :vars
    (
      ?auto_949890 - LOCATION
      ?auto_949893 - CITY
      ?auto_949892 - LOCATION
      ?auto_949891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_949890 ?auto_949893 ) ( IN-CITY ?auto_949885 ?auto_949893 ) ( not ( = ?auto_949885 ?auto_949890 ) ) ( OBJ-AT ?auto_949889 ?auto_949890 ) ( IN-CITY ?auto_949892 ?auto_949893 ) ( not ( = ?auto_949885 ?auto_949892 ) ) ( OBJ-AT ?auto_949887 ?auto_949892 ) ( OBJ-AT ?auto_949888 ?auto_949890 ) ( OBJ-AT ?auto_949886 ?auto_949890 ) ( TRUCK-AT ?auto_949891 ?auto_949885 ) ( not ( = ?auto_949886 ?auto_949888 ) ) ( not ( = ?auto_949886 ?auto_949887 ) ) ( not ( = ?auto_949888 ?auto_949887 ) ) ( not ( = ?auto_949892 ?auto_949890 ) ) ( not ( = ?auto_949886 ?auto_949889 ) ) ( not ( = ?auto_949888 ?auto_949889 ) ) ( not ( = ?auto_949887 ?auto_949889 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_949886 ?auto_949888 ?auto_949889 ?auto_949887 ?auto_949885 )
      ( DELIVER-4PKG-VERIFY ?auto_949886 ?auto_949887 ?auto_949888 ?auto_949889 ?auto_949885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_950451 - OBJ
      ?auto_950452 - OBJ
      ?auto_950453 - OBJ
      ?auto_950454 - OBJ
      ?auto_950450 - LOCATION
    )
    :vars
    (
      ?auto_950455 - LOCATION
      ?auto_950458 - CITY
      ?auto_950457 - LOCATION
      ?auto_950456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950455 ?auto_950458 ) ( IN-CITY ?auto_950450 ?auto_950458 ) ( not ( = ?auto_950450 ?auto_950455 ) ) ( OBJ-AT ?auto_950454 ?auto_950455 ) ( IN-CITY ?auto_950457 ?auto_950458 ) ( not ( = ?auto_950450 ?auto_950457 ) ) ( OBJ-AT ?auto_950451 ?auto_950457 ) ( OBJ-AT ?auto_950453 ?auto_950455 ) ( OBJ-AT ?auto_950452 ?auto_950455 ) ( TRUCK-AT ?auto_950456 ?auto_950450 ) ( not ( = ?auto_950452 ?auto_950453 ) ) ( not ( = ?auto_950452 ?auto_950451 ) ) ( not ( = ?auto_950453 ?auto_950451 ) ) ( not ( = ?auto_950457 ?auto_950455 ) ) ( not ( = ?auto_950452 ?auto_950454 ) ) ( not ( = ?auto_950453 ?auto_950454 ) ) ( not ( = ?auto_950451 ?auto_950454 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_950452 ?auto_950453 ?auto_950454 ?auto_950451 ?auto_950450 )
      ( DELIVER-4PKG-VERIFY ?auto_950451 ?auto_950452 ?auto_950453 ?auto_950454 ?auto_950450 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_965082 - OBJ
      ?auto_965083 - OBJ
      ?auto_965084 - OBJ
      ?auto_965085 - OBJ
      ?auto_965086 - OBJ
      ?auto_965081 - LOCATION
    )
    :vars
    (
      ?auto_965089 - LOCATION
      ?auto_965087 - CITY
      ?auto_965090 - LOCATION
      ?auto_965091 - LOCATION
      ?auto_965088 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_965089 ?auto_965087 ) ( IN-CITY ?auto_965081 ?auto_965087 ) ( not ( = ?auto_965081 ?auto_965089 ) ) ( OBJ-AT ?auto_965086 ?auto_965089 ) ( IN-CITY ?auto_965090 ?auto_965087 ) ( not ( = ?auto_965081 ?auto_965090 ) ) ( OBJ-AT ?auto_965085 ?auto_965090 ) ( IN-CITY ?auto_965091 ?auto_965087 ) ( not ( = ?auto_965081 ?auto_965091 ) ) ( OBJ-AT ?auto_965084 ?auto_965091 ) ( OBJ-AT ?auto_965083 ?auto_965090 ) ( OBJ-AT ?auto_965082 ?auto_965090 ) ( TRUCK-AT ?auto_965088 ?auto_965081 ) ( not ( = ?auto_965082 ?auto_965083 ) ) ( not ( = ?auto_965082 ?auto_965084 ) ) ( not ( = ?auto_965083 ?auto_965084 ) ) ( not ( = ?auto_965091 ?auto_965090 ) ) ( not ( = ?auto_965082 ?auto_965085 ) ) ( not ( = ?auto_965083 ?auto_965085 ) ) ( not ( = ?auto_965084 ?auto_965085 ) ) ( not ( = ?auto_965082 ?auto_965086 ) ) ( not ( = ?auto_965083 ?auto_965086 ) ) ( not ( = ?auto_965084 ?auto_965086 ) ) ( not ( = ?auto_965085 ?auto_965086 ) ) ( not ( = ?auto_965089 ?auto_965090 ) ) ( not ( = ?auto_965089 ?auto_965091 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_965082 ?auto_965083 ?auto_965085 ?auto_965084 ?auto_965081 )
      ( DELIVER-1PKG ?auto_965086 ?auto_965081 )
      ( DELIVER-5PKG-VERIFY ?auto_965082 ?auto_965083 ?auto_965084 ?auto_965085 ?auto_965086 ?auto_965081 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_965129 - OBJ
      ?auto_965130 - OBJ
      ?auto_965131 - OBJ
      ?auto_965132 - OBJ
      ?auto_965133 - OBJ
      ?auto_965128 - LOCATION
    )
    :vars
    (
      ?auto_965138 - LOCATION
      ?auto_965136 - CITY
      ?auto_965134 - LOCATION
      ?auto_965137 - LOCATION
      ?auto_965135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_965138 ?auto_965136 ) ( IN-CITY ?auto_965128 ?auto_965136 ) ( not ( = ?auto_965128 ?auto_965138 ) ) ( OBJ-AT ?auto_965132 ?auto_965138 ) ( IN-CITY ?auto_965134 ?auto_965136 ) ( not ( = ?auto_965128 ?auto_965134 ) ) ( OBJ-AT ?auto_965133 ?auto_965134 ) ( IN-CITY ?auto_965137 ?auto_965136 ) ( not ( = ?auto_965128 ?auto_965137 ) ) ( OBJ-AT ?auto_965131 ?auto_965137 ) ( OBJ-AT ?auto_965130 ?auto_965134 ) ( OBJ-AT ?auto_965129 ?auto_965134 ) ( TRUCK-AT ?auto_965135 ?auto_965128 ) ( not ( = ?auto_965129 ?auto_965130 ) ) ( not ( = ?auto_965129 ?auto_965131 ) ) ( not ( = ?auto_965130 ?auto_965131 ) ) ( not ( = ?auto_965137 ?auto_965134 ) ) ( not ( = ?auto_965129 ?auto_965133 ) ) ( not ( = ?auto_965130 ?auto_965133 ) ) ( not ( = ?auto_965131 ?auto_965133 ) ) ( not ( = ?auto_965129 ?auto_965132 ) ) ( not ( = ?auto_965130 ?auto_965132 ) ) ( not ( = ?auto_965131 ?auto_965132 ) ) ( not ( = ?auto_965133 ?auto_965132 ) ) ( not ( = ?auto_965138 ?auto_965134 ) ) ( not ( = ?auto_965138 ?auto_965137 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_965129 ?auto_965130 ?auto_965131 ?auto_965133 ?auto_965132 ?auto_965128 )
      ( DELIVER-5PKG-VERIFY ?auto_965129 ?auto_965130 ?auto_965131 ?auto_965132 ?auto_965133 ?auto_965128 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_965176 - OBJ
      ?auto_965177 - OBJ
      ?auto_965178 - OBJ
      ?auto_965179 - OBJ
      ?auto_965180 - OBJ
      ?auto_965175 - LOCATION
    )
    :vars
    (
      ?auto_965185 - LOCATION
      ?auto_965181 - CITY
      ?auto_965182 - LOCATION
      ?auto_965183 - LOCATION
      ?auto_965184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_965185 ?auto_965181 ) ( IN-CITY ?auto_965175 ?auto_965181 ) ( not ( = ?auto_965175 ?auto_965185 ) ) ( OBJ-AT ?auto_965180 ?auto_965185 ) ( IN-CITY ?auto_965182 ?auto_965181 ) ( not ( = ?auto_965175 ?auto_965182 ) ) ( OBJ-AT ?auto_965178 ?auto_965182 ) ( IN-CITY ?auto_965183 ?auto_965181 ) ( not ( = ?auto_965175 ?auto_965183 ) ) ( OBJ-AT ?auto_965179 ?auto_965183 ) ( OBJ-AT ?auto_965177 ?auto_965182 ) ( OBJ-AT ?auto_965176 ?auto_965182 ) ( TRUCK-AT ?auto_965184 ?auto_965175 ) ( not ( = ?auto_965176 ?auto_965177 ) ) ( not ( = ?auto_965176 ?auto_965179 ) ) ( not ( = ?auto_965177 ?auto_965179 ) ) ( not ( = ?auto_965183 ?auto_965182 ) ) ( not ( = ?auto_965176 ?auto_965178 ) ) ( not ( = ?auto_965177 ?auto_965178 ) ) ( not ( = ?auto_965179 ?auto_965178 ) ) ( not ( = ?auto_965176 ?auto_965180 ) ) ( not ( = ?auto_965177 ?auto_965180 ) ) ( not ( = ?auto_965179 ?auto_965180 ) ) ( not ( = ?auto_965178 ?auto_965180 ) ) ( not ( = ?auto_965185 ?auto_965182 ) ) ( not ( = ?auto_965185 ?auto_965183 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_965176 ?auto_965177 ?auto_965179 ?auto_965180 ?auto_965178 ?auto_965175 )
      ( DELIVER-5PKG-VERIFY ?auto_965176 ?auto_965177 ?auto_965178 ?auto_965179 ?auto_965180 ?auto_965175 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_965699 - OBJ
      ?auto_965700 - OBJ
      ?auto_965701 - OBJ
      ?auto_965702 - OBJ
      ?auto_965703 - OBJ
      ?auto_965698 - LOCATION
    )
    :vars
    (
      ?auto_965708 - LOCATION
      ?auto_965704 - CITY
      ?auto_965705 - LOCATION
      ?auto_965706 - LOCATION
      ?auto_965707 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_965708 ?auto_965704 ) ( IN-CITY ?auto_965698 ?auto_965704 ) ( not ( = ?auto_965698 ?auto_965708 ) ) ( OBJ-AT ?auto_965703 ?auto_965708 ) ( IN-CITY ?auto_965705 ?auto_965704 ) ( not ( = ?auto_965698 ?auto_965705 ) ) ( OBJ-AT ?auto_965702 ?auto_965705 ) ( IN-CITY ?auto_965706 ?auto_965704 ) ( not ( = ?auto_965698 ?auto_965706 ) ) ( OBJ-AT ?auto_965700 ?auto_965706 ) ( OBJ-AT ?auto_965701 ?auto_965705 ) ( OBJ-AT ?auto_965699 ?auto_965705 ) ( TRUCK-AT ?auto_965707 ?auto_965698 ) ( not ( = ?auto_965699 ?auto_965701 ) ) ( not ( = ?auto_965699 ?auto_965700 ) ) ( not ( = ?auto_965701 ?auto_965700 ) ) ( not ( = ?auto_965706 ?auto_965705 ) ) ( not ( = ?auto_965699 ?auto_965702 ) ) ( not ( = ?auto_965701 ?auto_965702 ) ) ( not ( = ?auto_965700 ?auto_965702 ) ) ( not ( = ?auto_965699 ?auto_965703 ) ) ( not ( = ?auto_965701 ?auto_965703 ) ) ( not ( = ?auto_965700 ?auto_965703 ) ) ( not ( = ?auto_965702 ?auto_965703 ) ) ( not ( = ?auto_965708 ?auto_965705 ) ) ( not ( = ?auto_965708 ?auto_965706 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_965699 ?auto_965701 ?auto_965700 ?auto_965703 ?auto_965702 ?auto_965698 )
      ( DELIVER-5PKG-VERIFY ?auto_965699 ?auto_965700 ?auto_965701 ?auto_965702 ?auto_965703 ?auto_965698 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_965746 - OBJ
      ?auto_965747 - OBJ
      ?auto_965748 - OBJ
      ?auto_965749 - OBJ
      ?auto_965750 - OBJ
      ?auto_965745 - LOCATION
    )
    :vars
    (
      ?auto_965755 - LOCATION
      ?auto_965751 - CITY
      ?auto_965752 - LOCATION
      ?auto_965753 - LOCATION
      ?auto_965754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_965755 ?auto_965751 ) ( IN-CITY ?auto_965745 ?auto_965751 ) ( not ( = ?auto_965745 ?auto_965755 ) ) ( OBJ-AT ?auto_965749 ?auto_965755 ) ( IN-CITY ?auto_965752 ?auto_965751 ) ( not ( = ?auto_965745 ?auto_965752 ) ) ( OBJ-AT ?auto_965750 ?auto_965752 ) ( IN-CITY ?auto_965753 ?auto_965751 ) ( not ( = ?auto_965745 ?auto_965753 ) ) ( OBJ-AT ?auto_965747 ?auto_965753 ) ( OBJ-AT ?auto_965748 ?auto_965752 ) ( OBJ-AT ?auto_965746 ?auto_965752 ) ( TRUCK-AT ?auto_965754 ?auto_965745 ) ( not ( = ?auto_965746 ?auto_965748 ) ) ( not ( = ?auto_965746 ?auto_965747 ) ) ( not ( = ?auto_965748 ?auto_965747 ) ) ( not ( = ?auto_965753 ?auto_965752 ) ) ( not ( = ?auto_965746 ?auto_965750 ) ) ( not ( = ?auto_965748 ?auto_965750 ) ) ( not ( = ?auto_965747 ?auto_965750 ) ) ( not ( = ?auto_965746 ?auto_965749 ) ) ( not ( = ?auto_965748 ?auto_965749 ) ) ( not ( = ?auto_965747 ?auto_965749 ) ) ( not ( = ?auto_965750 ?auto_965749 ) ) ( not ( = ?auto_965755 ?auto_965752 ) ) ( not ( = ?auto_965755 ?auto_965753 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_965746 ?auto_965748 ?auto_965747 ?auto_965749 ?auto_965750 ?auto_965745 )
      ( DELIVER-5PKG-VERIFY ?auto_965746 ?auto_965747 ?auto_965748 ?auto_965749 ?auto_965750 ?auto_965745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_966077 - OBJ
      ?auto_966078 - OBJ
      ?auto_966079 - OBJ
      ?auto_966080 - OBJ
      ?auto_966081 - OBJ
      ?auto_966076 - LOCATION
    )
    :vars
    (
      ?auto_966086 - LOCATION
      ?auto_966082 - CITY
      ?auto_966083 - LOCATION
      ?auto_966084 - LOCATION
      ?auto_966085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_966086 ?auto_966082 ) ( IN-CITY ?auto_966076 ?auto_966082 ) ( not ( = ?auto_966076 ?auto_966086 ) ) ( OBJ-AT ?auto_966079 ?auto_966086 ) ( IN-CITY ?auto_966083 ?auto_966082 ) ( not ( = ?auto_966076 ?auto_966083 ) ) ( OBJ-AT ?auto_966081 ?auto_966083 ) ( IN-CITY ?auto_966084 ?auto_966082 ) ( not ( = ?auto_966076 ?auto_966084 ) ) ( OBJ-AT ?auto_966078 ?auto_966084 ) ( OBJ-AT ?auto_966080 ?auto_966083 ) ( OBJ-AT ?auto_966077 ?auto_966083 ) ( TRUCK-AT ?auto_966085 ?auto_966076 ) ( not ( = ?auto_966077 ?auto_966080 ) ) ( not ( = ?auto_966077 ?auto_966078 ) ) ( not ( = ?auto_966080 ?auto_966078 ) ) ( not ( = ?auto_966084 ?auto_966083 ) ) ( not ( = ?auto_966077 ?auto_966081 ) ) ( not ( = ?auto_966080 ?auto_966081 ) ) ( not ( = ?auto_966078 ?auto_966081 ) ) ( not ( = ?auto_966077 ?auto_966079 ) ) ( not ( = ?auto_966080 ?auto_966079 ) ) ( not ( = ?auto_966078 ?auto_966079 ) ) ( not ( = ?auto_966081 ?auto_966079 ) ) ( not ( = ?auto_966086 ?auto_966083 ) ) ( not ( = ?auto_966086 ?auto_966084 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_966077 ?auto_966080 ?auto_966078 ?auto_966079 ?auto_966081 ?auto_966076 )
      ( DELIVER-5PKG-VERIFY ?auto_966077 ?auto_966078 ?auto_966079 ?auto_966080 ?auto_966081 ?auto_966076 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_973145 - OBJ
      ?auto_973146 - OBJ
      ?auto_973147 - OBJ
      ?auto_973148 - OBJ
      ?auto_973149 - OBJ
      ?auto_973144 - LOCATION
    )
    :vars
    (
      ?auto_973154 - LOCATION
      ?auto_973150 - CITY
      ?auto_973151 - LOCATION
      ?auto_973152 - LOCATION
      ?auto_973153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_973154 ?auto_973150 ) ( IN-CITY ?auto_973144 ?auto_973150 ) ( not ( = ?auto_973144 ?auto_973154 ) ) ( OBJ-AT ?auto_973149 ?auto_973154 ) ( IN-CITY ?auto_973151 ?auto_973150 ) ( not ( = ?auto_973144 ?auto_973151 ) ) ( OBJ-AT ?auto_973148 ?auto_973151 ) ( IN-CITY ?auto_973152 ?auto_973150 ) ( not ( = ?auto_973144 ?auto_973152 ) ) ( OBJ-AT ?auto_973145 ?auto_973152 ) ( OBJ-AT ?auto_973147 ?auto_973151 ) ( OBJ-AT ?auto_973146 ?auto_973151 ) ( TRUCK-AT ?auto_973153 ?auto_973144 ) ( not ( = ?auto_973146 ?auto_973147 ) ) ( not ( = ?auto_973146 ?auto_973145 ) ) ( not ( = ?auto_973147 ?auto_973145 ) ) ( not ( = ?auto_973152 ?auto_973151 ) ) ( not ( = ?auto_973146 ?auto_973148 ) ) ( not ( = ?auto_973147 ?auto_973148 ) ) ( not ( = ?auto_973145 ?auto_973148 ) ) ( not ( = ?auto_973146 ?auto_973149 ) ) ( not ( = ?auto_973147 ?auto_973149 ) ) ( not ( = ?auto_973145 ?auto_973149 ) ) ( not ( = ?auto_973148 ?auto_973149 ) ) ( not ( = ?auto_973154 ?auto_973151 ) ) ( not ( = ?auto_973154 ?auto_973152 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_973146 ?auto_973147 ?auto_973145 ?auto_973149 ?auto_973148 ?auto_973144 )
      ( DELIVER-5PKG-VERIFY ?auto_973145 ?auto_973146 ?auto_973147 ?auto_973148 ?auto_973149 ?auto_973144 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_973192 - OBJ
      ?auto_973193 - OBJ
      ?auto_973194 - OBJ
      ?auto_973195 - OBJ
      ?auto_973196 - OBJ
      ?auto_973191 - LOCATION
    )
    :vars
    (
      ?auto_973201 - LOCATION
      ?auto_973197 - CITY
      ?auto_973198 - LOCATION
      ?auto_973199 - LOCATION
      ?auto_973200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_973201 ?auto_973197 ) ( IN-CITY ?auto_973191 ?auto_973197 ) ( not ( = ?auto_973191 ?auto_973201 ) ) ( OBJ-AT ?auto_973195 ?auto_973201 ) ( IN-CITY ?auto_973198 ?auto_973197 ) ( not ( = ?auto_973191 ?auto_973198 ) ) ( OBJ-AT ?auto_973196 ?auto_973198 ) ( IN-CITY ?auto_973199 ?auto_973197 ) ( not ( = ?auto_973191 ?auto_973199 ) ) ( OBJ-AT ?auto_973192 ?auto_973199 ) ( OBJ-AT ?auto_973194 ?auto_973198 ) ( OBJ-AT ?auto_973193 ?auto_973198 ) ( TRUCK-AT ?auto_973200 ?auto_973191 ) ( not ( = ?auto_973193 ?auto_973194 ) ) ( not ( = ?auto_973193 ?auto_973192 ) ) ( not ( = ?auto_973194 ?auto_973192 ) ) ( not ( = ?auto_973199 ?auto_973198 ) ) ( not ( = ?auto_973193 ?auto_973196 ) ) ( not ( = ?auto_973194 ?auto_973196 ) ) ( not ( = ?auto_973192 ?auto_973196 ) ) ( not ( = ?auto_973193 ?auto_973195 ) ) ( not ( = ?auto_973194 ?auto_973195 ) ) ( not ( = ?auto_973192 ?auto_973195 ) ) ( not ( = ?auto_973196 ?auto_973195 ) ) ( not ( = ?auto_973201 ?auto_973198 ) ) ( not ( = ?auto_973201 ?auto_973199 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_973193 ?auto_973194 ?auto_973192 ?auto_973195 ?auto_973196 ?auto_973191 )
      ( DELIVER-5PKG-VERIFY ?auto_973192 ?auto_973193 ?auto_973194 ?auto_973195 ?auto_973196 ?auto_973191 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_973523 - OBJ
      ?auto_973524 - OBJ
      ?auto_973525 - OBJ
      ?auto_973526 - OBJ
      ?auto_973527 - OBJ
      ?auto_973522 - LOCATION
    )
    :vars
    (
      ?auto_973532 - LOCATION
      ?auto_973528 - CITY
      ?auto_973529 - LOCATION
      ?auto_973530 - LOCATION
      ?auto_973531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_973532 ?auto_973528 ) ( IN-CITY ?auto_973522 ?auto_973528 ) ( not ( = ?auto_973522 ?auto_973532 ) ) ( OBJ-AT ?auto_973525 ?auto_973532 ) ( IN-CITY ?auto_973529 ?auto_973528 ) ( not ( = ?auto_973522 ?auto_973529 ) ) ( OBJ-AT ?auto_973527 ?auto_973529 ) ( IN-CITY ?auto_973530 ?auto_973528 ) ( not ( = ?auto_973522 ?auto_973530 ) ) ( OBJ-AT ?auto_973523 ?auto_973530 ) ( OBJ-AT ?auto_973526 ?auto_973529 ) ( OBJ-AT ?auto_973524 ?auto_973529 ) ( TRUCK-AT ?auto_973531 ?auto_973522 ) ( not ( = ?auto_973524 ?auto_973526 ) ) ( not ( = ?auto_973524 ?auto_973523 ) ) ( not ( = ?auto_973526 ?auto_973523 ) ) ( not ( = ?auto_973530 ?auto_973529 ) ) ( not ( = ?auto_973524 ?auto_973527 ) ) ( not ( = ?auto_973526 ?auto_973527 ) ) ( not ( = ?auto_973523 ?auto_973527 ) ) ( not ( = ?auto_973524 ?auto_973525 ) ) ( not ( = ?auto_973526 ?auto_973525 ) ) ( not ( = ?auto_973523 ?auto_973525 ) ) ( not ( = ?auto_973527 ?auto_973525 ) ) ( not ( = ?auto_973532 ?auto_973529 ) ) ( not ( = ?auto_973532 ?auto_973530 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_973524 ?auto_973526 ?auto_973523 ?auto_973525 ?auto_973527 ?auto_973522 )
      ( DELIVER-5PKG-VERIFY ?auto_973523 ?auto_973524 ?auto_973525 ?auto_973526 ?auto_973527 ?auto_973522 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_976037 - OBJ
      ?auto_976038 - OBJ
      ?auto_976039 - OBJ
      ?auto_976040 - OBJ
      ?auto_976041 - OBJ
      ?auto_976036 - LOCATION
    )
    :vars
    (
      ?auto_976046 - LOCATION
      ?auto_976042 - CITY
      ?auto_976043 - LOCATION
      ?auto_976044 - LOCATION
      ?auto_976045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_976046 ?auto_976042 ) ( IN-CITY ?auto_976036 ?auto_976042 ) ( not ( = ?auto_976036 ?auto_976046 ) ) ( OBJ-AT ?auto_976038 ?auto_976046 ) ( IN-CITY ?auto_976043 ?auto_976042 ) ( not ( = ?auto_976036 ?auto_976043 ) ) ( OBJ-AT ?auto_976041 ?auto_976043 ) ( IN-CITY ?auto_976044 ?auto_976042 ) ( not ( = ?auto_976036 ?auto_976044 ) ) ( OBJ-AT ?auto_976037 ?auto_976044 ) ( OBJ-AT ?auto_976040 ?auto_976043 ) ( OBJ-AT ?auto_976039 ?auto_976043 ) ( TRUCK-AT ?auto_976045 ?auto_976036 ) ( not ( = ?auto_976039 ?auto_976040 ) ) ( not ( = ?auto_976039 ?auto_976037 ) ) ( not ( = ?auto_976040 ?auto_976037 ) ) ( not ( = ?auto_976044 ?auto_976043 ) ) ( not ( = ?auto_976039 ?auto_976041 ) ) ( not ( = ?auto_976040 ?auto_976041 ) ) ( not ( = ?auto_976037 ?auto_976041 ) ) ( not ( = ?auto_976039 ?auto_976038 ) ) ( not ( = ?auto_976040 ?auto_976038 ) ) ( not ( = ?auto_976037 ?auto_976038 ) ) ( not ( = ?auto_976041 ?auto_976038 ) ) ( not ( = ?auto_976046 ?auto_976043 ) ) ( not ( = ?auto_976046 ?auto_976044 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_976039 ?auto_976040 ?auto_976037 ?auto_976038 ?auto_976041 ?auto_976036 )
      ( DELIVER-5PKG-VERIFY ?auto_976037 ?auto_976038 ?auto_976039 ?auto_976040 ?auto_976041 ?auto_976036 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1219527 - OBJ
      ?auto_1219528 - OBJ
      ?auto_1219529 - OBJ
      ?auto_1219530 - OBJ
      ?auto_1219531 - OBJ
      ?auto_1219532 - OBJ
      ?auto_1219526 - LOCATION
    )
    :vars
    (
      ?auto_1219534 - LOCATION
      ?auto_1219535 - CITY
      ?auto_1219536 - LOCATION
      ?auto_1219537 - LOCATION
      ?auto_1219533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1219534 ?auto_1219535 ) ( IN-CITY ?auto_1219526 ?auto_1219535 ) ( not ( = ?auto_1219526 ?auto_1219534 ) ) ( OBJ-AT ?auto_1219532 ?auto_1219534 ) ( OBJ-AT ?auto_1219531 ?auto_1219534 ) ( IN-CITY ?auto_1219536 ?auto_1219535 ) ( not ( = ?auto_1219526 ?auto_1219536 ) ) ( OBJ-AT ?auto_1219530 ?auto_1219536 ) ( IN-CITY ?auto_1219537 ?auto_1219535 ) ( not ( = ?auto_1219526 ?auto_1219537 ) ) ( OBJ-AT ?auto_1219529 ?auto_1219537 ) ( OBJ-AT ?auto_1219528 ?auto_1219536 ) ( OBJ-AT ?auto_1219527 ?auto_1219536 ) ( TRUCK-AT ?auto_1219533 ?auto_1219526 ) ( not ( = ?auto_1219527 ?auto_1219528 ) ) ( not ( = ?auto_1219527 ?auto_1219529 ) ) ( not ( = ?auto_1219528 ?auto_1219529 ) ) ( not ( = ?auto_1219537 ?auto_1219536 ) ) ( not ( = ?auto_1219527 ?auto_1219530 ) ) ( not ( = ?auto_1219528 ?auto_1219530 ) ) ( not ( = ?auto_1219529 ?auto_1219530 ) ) ( not ( = ?auto_1219527 ?auto_1219531 ) ) ( not ( = ?auto_1219528 ?auto_1219531 ) ) ( not ( = ?auto_1219529 ?auto_1219531 ) ) ( not ( = ?auto_1219530 ?auto_1219531 ) ) ( not ( = ?auto_1219534 ?auto_1219536 ) ) ( not ( = ?auto_1219534 ?auto_1219537 ) ) ( not ( = ?auto_1219527 ?auto_1219532 ) ) ( not ( = ?auto_1219528 ?auto_1219532 ) ) ( not ( = ?auto_1219529 ?auto_1219532 ) ) ( not ( = ?auto_1219530 ?auto_1219532 ) ) ( not ( = ?auto_1219531 ?auto_1219532 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1219527 ?auto_1219528 ?auto_1219529 ?auto_1219531 ?auto_1219530 ?auto_1219526 )
      ( DELIVER-1PKG ?auto_1219532 ?auto_1219526 )
      ( DELIVER-6PKG-VERIFY ?auto_1219527 ?auto_1219528 ?auto_1219529 ?auto_1219530 ?auto_1219531 ?auto_1219532 ?auto_1219526 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1219650 - OBJ
      ?auto_1219651 - OBJ
      ?auto_1219652 - OBJ
      ?auto_1219653 - OBJ
      ?auto_1219654 - OBJ
      ?auto_1219655 - OBJ
      ?auto_1219649 - LOCATION
    )
    :vars
    (
      ?auto_1219656 - LOCATION
      ?auto_1219660 - CITY
      ?auto_1219657 - LOCATION
      ?auto_1219659 - LOCATION
      ?auto_1219658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1219656 ?auto_1219660 ) ( IN-CITY ?auto_1219649 ?auto_1219660 ) ( not ( = ?auto_1219649 ?auto_1219656 ) ) ( OBJ-AT ?auto_1219655 ?auto_1219656 ) ( OBJ-AT ?auto_1219653 ?auto_1219656 ) ( IN-CITY ?auto_1219657 ?auto_1219660 ) ( not ( = ?auto_1219649 ?auto_1219657 ) ) ( OBJ-AT ?auto_1219654 ?auto_1219657 ) ( IN-CITY ?auto_1219659 ?auto_1219660 ) ( not ( = ?auto_1219649 ?auto_1219659 ) ) ( OBJ-AT ?auto_1219652 ?auto_1219659 ) ( OBJ-AT ?auto_1219651 ?auto_1219657 ) ( OBJ-AT ?auto_1219650 ?auto_1219657 ) ( TRUCK-AT ?auto_1219658 ?auto_1219649 ) ( not ( = ?auto_1219650 ?auto_1219651 ) ) ( not ( = ?auto_1219650 ?auto_1219652 ) ) ( not ( = ?auto_1219651 ?auto_1219652 ) ) ( not ( = ?auto_1219659 ?auto_1219657 ) ) ( not ( = ?auto_1219650 ?auto_1219654 ) ) ( not ( = ?auto_1219651 ?auto_1219654 ) ) ( not ( = ?auto_1219652 ?auto_1219654 ) ) ( not ( = ?auto_1219650 ?auto_1219653 ) ) ( not ( = ?auto_1219651 ?auto_1219653 ) ) ( not ( = ?auto_1219652 ?auto_1219653 ) ) ( not ( = ?auto_1219654 ?auto_1219653 ) ) ( not ( = ?auto_1219656 ?auto_1219657 ) ) ( not ( = ?auto_1219656 ?auto_1219659 ) ) ( not ( = ?auto_1219650 ?auto_1219655 ) ) ( not ( = ?auto_1219651 ?auto_1219655 ) ) ( not ( = ?auto_1219652 ?auto_1219655 ) ) ( not ( = ?auto_1219654 ?auto_1219655 ) ) ( not ( = ?auto_1219653 ?auto_1219655 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1219650 ?auto_1219651 ?auto_1219652 ?auto_1219654 ?auto_1219653 ?auto_1219655 ?auto_1219649 )
      ( DELIVER-6PKG-VERIFY ?auto_1219650 ?auto_1219651 ?auto_1219652 ?auto_1219653 ?auto_1219654 ?auto_1219655 ?auto_1219649 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1219714 - OBJ
      ?auto_1219715 - OBJ
      ?auto_1219716 - OBJ
      ?auto_1219717 - OBJ
      ?auto_1219718 - OBJ
      ?auto_1219719 - OBJ
      ?auto_1219713 - LOCATION
    )
    :vars
    (
      ?auto_1219723 - LOCATION
      ?auto_1219724 - CITY
      ?auto_1219722 - LOCATION
      ?auto_1219720 - LOCATION
      ?auto_1219721 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1219723 ?auto_1219724 ) ( IN-CITY ?auto_1219713 ?auto_1219724 ) ( not ( = ?auto_1219713 ?auto_1219723 ) ) ( OBJ-AT ?auto_1219718 ?auto_1219723 ) ( OBJ-AT ?auto_1219717 ?auto_1219723 ) ( IN-CITY ?auto_1219722 ?auto_1219724 ) ( not ( = ?auto_1219713 ?auto_1219722 ) ) ( OBJ-AT ?auto_1219719 ?auto_1219722 ) ( IN-CITY ?auto_1219720 ?auto_1219724 ) ( not ( = ?auto_1219713 ?auto_1219720 ) ) ( OBJ-AT ?auto_1219716 ?auto_1219720 ) ( OBJ-AT ?auto_1219715 ?auto_1219722 ) ( OBJ-AT ?auto_1219714 ?auto_1219722 ) ( TRUCK-AT ?auto_1219721 ?auto_1219713 ) ( not ( = ?auto_1219714 ?auto_1219715 ) ) ( not ( = ?auto_1219714 ?auto_1219716 ) ) ( not ( = ?auto_1219715 ?auto_1219716 ) ) ( not ( = ?auto_1219720 ?auto_1219722 ) ) ( not ( = ?auto_1219714 ?auto_1219719 ) ) ( not ( = ?auto_1219715 ?auto_1219719 ) ) ( not ( = ?auto_1219716 ?auto_1219719 ) ) ( not ( = ?auto_1219714 ?auto_1219717 ) ) ( not ( = ?auto_1219715 ?auto_1219717 ) ) ( not ( = ?auto_1219716 ?auto_1219717 ) ) ( not ( = ?auto_1219719 ?auto_1219717 ) ) ( not ( = ?auto_1219723 ?auto_1219722 ) ) ( not ( = ?auto_1219723 ?auto_1219720 ) ) ( not ( = ?auto_1219714 ?auto_1219718 ) ) ( not ( = ?auto_1219715 ?auto_1219718 ) ) ( not ( = ?auto_1219716 ?auto_1219718 ) ) ( not ( = ?auto_1219719 ?auto_1219718 ) ) ( not ( = ?auto_1219717 ?auto_1219718 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1219714 ?auto_1219715 ?auto_1219716 ?auto_1219717 ?auto_1219719 ?auto_1219718 ?auto_1219713 )
      ( DELIVER-6PKG-VERIFY ?auto_1219714 ?auto_1219715 ?auto_1219716 ?auto_1219717 ?auto_1219718 ?auto_1219719 ?auto_1219713 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1220576 - OBJ
      ?auto_1220577 - OBJ
      ?auto_1220578 - OBJ
      ?auto_1220579 - OBJ
      ?auto_1220580 - OBJ
      ?auto_1220581 - OBJ
      ?auto_1220575 - LOCATION
    )
    :vars
    (
      ?auto_1220585 - LOCATION
      ?auto_1220586 - CITY
      ?auto_1220584 - LOCATION
      ?auto_1220582 - LOCATION
      ?auto_1220583 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1220585 ?auto_1220586 ) ( IN-CITY ?auto_1220575 ?auto_1220586 ) ( not ( = ?auto_1220575 ?auto_1220585 ) ) ( OBJ-AT ?auto_1220581 ?auto_1220585 ) ( OBJ-AT ?auto_1220580 ?auto_1220585 ) ( IN-CITY ?auto_1220584 ?auto_1220586 ) ( not ( = ?auto_1220575 ?auto_1220584 ) ) ( OBJ-AT ?auto_1220578 ?auto_1220584 ) ( IN-CITY ?auto_1220582 ?auto_1220586 ) ( not ( = ?auto_1220575 ?auto_1220582 ) ) ( OBJ-AT ?auto_1220579 ?auto_1220582 ) ( OBJ-AT ?auto_1220577 ?auto_1220584 ) ( OBJ-AT ?auto_1220576 ?auto_1220584 ) ( TRUCK-AT ?auto_1220583 ?auto_1220575 ) ( not ( = ?auto_1220576 ?auto_1220577 ) ) ( not ( = ?auto_1220576 ?auto_1220579 ) ) ( not ( = ?auto_1220577 ?auto_1220579 ) ) ( not ( = ?auto_1220582 ?auto_1220584 ) ) ( not ( = ?auto_1220576 ?auto_1220578 ) ) ( not ( = ?auto_1220577 ?auto_1220578 ) ) ( not ( = ?auto_1220579 ?auto_1220578 ) ) ( not ( = ?auto_1220576 ?auto_1220580 ) ) ( not ( = ?auto_1220577 ?auto_1220580 ) ) ( not ( = ?auto_1220579 ?auto_1220580 ) ) ( not ( = ?auto_1220578 ?auto_1220580 ) ) ( not ( = ?auto_1220585 ?auto_1220584 ) ) ( not ( = ?auto_1220585 ?auto_1220582 ) ) ( not ( = ?auto_1220576 ?auto_1220581 ) ) ( not ( = ?auto_1220577 ?auto_1220581 ) ) ( not ( = ?auto_1220579 ?auto_1220581 ) ) ( not ( = ?auto_1220578 ?auto_1220581 ) ) ( not ( = ?auto_1220580 ?auto_1220581 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1220576 ?auto_1220577 ?auto_1220579 ?auto_1220580 ?auto_1220578 ?auto_1220581 ?auto_1220575 )
      ( DELIVER-6PKG-VERIFY ?auto_1220576 ?auto_1220577 ?auto_1220578 ?auto_1220579 ?auto_1220580 ?auto_1220581 ?auto_1220575 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1220836 - OBJ
      ?auto_1220837 - OBJ
      ?auto_1220838 - OBJ
      ?auto_1220839 - OBJ
      ?auto_1220840 - OBJ
      ?auto_1220841 - OBJ
      ?auto_1220835 - LOCATION
    )
    :vars
    (
      ?auto_1220845 - LOCATION
      ?auto_1220846 - CITY
      ?auto_1220844 - LOCATION
      ?auto_1220842 - LOCATION
      ?auto_1220843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1220845 ?auto_1220846 ) ( IN-CITY ?auto_1220835 ?auto_1220846 ) ( not ( = ?auto_1220835 ?auto_1220845 ) ) ( OBJ-AT ?auto_1220841 ?auto_1220845 ) ( OBJ-AT ?auto_1220839 ?auto_1220845 ) ( IN-CITY ?auto_1220844 ?auto_1220846 ) ( not ( = ?auto_1220835 ?auto_1220844 ) ) ( OBJ-AT ?auto_1220838 ?auto_1220844 ) ( IN-CITY ?auto_1220842 ?auto_1220846 ) ( not ( = ?auto_1220835 ?auto_1220842 ) ) ( OBJ-AT ?auto_1220840 ?auto_1220842 ) ( OBJ-AT ?auto_1220837 ?auto_1220844 ) ( OBJ-AT ?auto_1220836 ?auto_1220844 ) ( TRUCK-AT ?auto_1220843 ?auto_1220835 ) ( not ( = ?auto_1220836 ?auto_1220837 ) ) ( not ( = ?auto_1220836 ?auto_1220840 ) ) ( not ( = ?auto_1220837 ?auto_1220840 ) ) ( not ( = ?auto_1220842 ?auto_1220844 ) ) ( not ( = ?auto_1220836 ?auto_1220838 ) ) ( not ( = ?auto_1220837 ?auto_1220838 ) ) ( not ( = ?auto_1220840 ?auto_1220838 ) ) ( not ( = ?auto_1220836 ?auto_1220839 ) ) ( not ( = ?auto_1220837 ?auto_1220839 ) ) ( not ( = ?auto_1220840 ?auto_1220839 ) ) ( not ( = ?auto_1220838 ?auto_1220839 ) ) ( not ( = ?auto_1220845 ?auto_1220844 ) ) ( not ( = ?auto_1220845 ?auto_1220842 ) ) ( not ( = ?auto_1220836 ?auto_1220841 ) ) ( not ( = ?auto_1220837 ?auto_1220841 ) ) ( not ( = ?auto_1220840 ?auto_1220841 ) ) ( not ( = ?auto_1220838 ?auto_1220841 ) ) ( not ( = ?auto_1220839 ?auto_1220841 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1220836 ?auto_1220837 ?auto_1220840 ?auto_1220839 ?auto_1220838 ?auto_1220841 ?auto_1220835 )
      ( DELIVER-6PKG-VERIFY ?auto_1220836 ?auto_1220837 ?auto_1220838 ?auto_1220839 ?auto_1220840 ?auto_1220841 ?auto_1220835 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1220900 - OBJ
      ?auto_1220901 - OBJ
      ?auto_1220902 - OBJ
      ?auto_1220903 - OBJ
      ?auto_1220904 - OBJ
      ?auto_1220905 - OBJ
      ?auto_1220899 - LOCATION
    )
    :vars
    (
      ?auto_1220909 - LOCATION
      ?auto_1220910 - CITY
      ?auto_1220908 - LOCATION
      ?auto_1220906 - LOCATION
      ?auto_1220907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1220909 ?auto_1220910 ) ( IN-CITY ?auto_1220899 ?auto_1220910 ) ( not ( = ?auto_1220899 ?auto_1220909 ) ) ( OBJ-AT ?auto_1220904 ?auto_1220909 ) ( OBJ-AT ?auto_1220903 ?auto_1220909 ) ( IN-CITY ?auto_1220908 ?auto_1220910 ) ( not ( = ?auto_1220899 ?auto_1220908 ) ) ( OBJ-AT ?auto_1220902 ?auto_1220908 ) ( IN-CITY ?auto_1220906 ?auto_1220910 ) ( not ( = ?auto_1220899 ?auto_1220906 ) ) ( OBJ-AT ?auto_1220905 ?auto_1220906 ) ( OBJ-AT ?auto_1220901 ?auto_1220908 ) ( OBJ-AT ?auto_1220900 ?auto_1220908 ) ( TRUCK-AT ?auto_1220907 ?auto_1220899 ) ( not ( = ?auto_1220900 ?auto_1220901 ) ) ( not ( = ?auto_1220900 ?auto_1220905 ) ) ( not ( = ?auto_1220901 ?auto_1220905 ) ) ( not ( = ?auto_1220906 ?auto_1220908 ) ) ( not ( = ?auto_1220900 ?auto_1220902 ) ) ( not ( = ?auto_1220901 ?auto_1220902 ) ) ( not ( = ?auto_1220905 ?auto_1220902 ) ) ( not ( = ?auto_1220900 ?auto_1220903 ) ) ( not ( = ?auto_1220901 ?auto_1220903 ) ) ( not ( = ?auto_1220905 ?auto_1220903 ) ) ( not ( = ?auto_1220902 ?auto_1220903 ) ) ( not ( = ?auto_1220909 ?auto_1220908 ) ) ( not ( = ?auto_1220909 ?auto_1220906 ) ) ( not ( = ?auto_1220900 ?auto_1220904 ) ) ( not ( = ?auto_1220901 ?auto_1220904 ) ) ( not ( = ?auto_1220905 ?auto_1220904 ) ) ( not ( = ?auto_1220902 ?auto_1220904 ) ) ( not ( = ?auto_1220903 ?auto_1220904 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1220900 ?auto_1220901 ?auto_1220905 ?auto_1220903 ?auto_1220902 ?auto_1220904 ?auto_1220899 )
      ( DELIVER-6PKG-VERIFY ?auto_1220900 ?auto_1220901 ?auto_1220902 ?auto_1220903 ?auto_1220904 ?auto_1220905 ?auto_1220899 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1221762 - OBJ
      ?auto_1221763 - OBJ
      ?auto_1221764 - OBJ
      ?auto_1221765 - OBJ
      ?auto_1221766 - OBJ
      ?auto_1221767 - OBJ
      ?auto_1221761 - LOCATION
    )
    :vars
    (
      ?auto_1221771 - LOCATION
      ?auto_1221772 - CITY
      ?auto_1221770 - LOCATION
      ?auto_1221768 - LOCATION
      ?auto_1221769 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1221771 ?auto_1221772 ) ( IN-CITY ?auto_1221761 ?auto_1221772 ) ( not ( = ?auto_1221761 ?auto_1221771 ) ) ( OBJ-AT ?auto_1221767 ?auto_1221771 ) ( OBJ-AT ?auto_1221764 ?auto_1221771 ) ( IN-CITY ?auto_1221770 ?auto_1221772 ) ( not ( = ?auto_1221761 ?auto_1221770 ) ) ( OBJ-AT ?auto_1221766 ?auto_1221770 ) ( IN-CITY ?auto_1221768 ?auto_1221772 ) ( not ( = ?auto_1221761 ?auto_1221768 ) ) ( OBJ-AT ?auto_1221765 ?auto_1221768 ) ( OBJ-AT ?auto_1221763 ?auto_1221770 ) ( OBJ-AT ?auto_1221762 ?auto_1221770 ) ( TRUCK-AT ?auto_1221769 ?auto_1221761 ) ( not ( = ?auto_1221762 ?auto_1221763 ) ) ( not ( = ?auto_1221762 ?auto_1221765 ) ) ( not ( = ?auto_1221763 ?auto_1221765 ) ) ( not ( = ?auto_1221768 ?auto_1221770 ) ) ( not ( = ?auto_1221762 ?auto_1221766 ) ) ( not ( = ?auto_1221763 ?auto_1221766 ) ) ( not ( = ?auto_1221765 ?auto_1221766 ) ) ( not ( = ?auto_1221762 ?auto_1221764 ) ) ( not ( = ?auto_1221763 ?auto_1221764 ) ) ( not ( = ?auto_1221765 ?auto_1221764 ) ) ( not ( = ?auto_1221766 ?auto_1221764 ) ) ( not ( = ?auto_1221771 ?auto_1221770 ) ) ( not ( = ?auto_1221771 ?auto_1221768 ) ) ( not ( = ?auto_1221762 ?auto_1221767 ) ) ( not ( = ?auto_1221763 ?auto_1221767 ) ) ( not ( = ?auto_1221765 ?auto_1221767 ) ) ( not ( = ?auto_1221766 ?auto_1221767 ) ) ( not ( = ?auto_1221764 ?auto_1221767 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1221762 ?auto_1221763 ?auto_1221765 ?auto_1221764 ?auto_1221766 ?auto_1221767 ?auto_1221761 )
      ( DELIVER-6PKG-VERIFY ?auto_1221762 ?auto_1221763 ?auto_1221764 ?auto_1221765 ?auto_1221766 ?auto_1221767 ?auto_1221761 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1221826 - OBJ
      ?auto_1221827 - OBJ
      ?auto_1221828 - OBJ
      ?auto_1221829 - OBJ
      ?auto_1221830 - OBJ
      ?auto_1221831 - OBJ
      ?auto_1221825 - LOCATION
    )
    :vars
    (
      ?auto_1221835 - LOCATION
      ?auto_1221836 - CITY
      ?auto_1221834 - LOCATION
      ?auto_1221832 - LOCATION
      ?auto_1221833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1221835 ?auto_1221836 ) ( IN-CITY ?auto_1221825 ?auto_1221836 ) ( not ( = ?auto_1221825 ?auto_1221835 ) ) ( OBJ-AT ?auto_1221830 ?auto_1221835 ) ( OBJ-AT ?auto_1221828 ?auto_1221835 ) ( IN-CITY ?auto_1221834 ?auto_1221836 ) ( not ( = ?auto_1221825 ?auto_1221834 ) ) ( OBJ-AT ?auto_1221831 ?auto_1221834 ) ( IN-CITY ?auto_1221832 ?auto_1221836 ) ( not ( = ?auto_1221825 ?auto_1221832 ) ) ( OBJ-AT ?auto_1221829 ?auto_1221832 ) ( OBJ-AT ?auto_1221827 ?auto_1221834 ) ( OBJ-AT ?auto_1221826 ?auto_1221834 ) ( TRUCK-AT ?auto_1221833 ?auto_1221825 ) ( not ( = ?auto_1221826 ?auto_1221827 ) ) ( not ( = ?auto_1221826 ?auto_1221829 ) ) ( not ( = ?auto_1221827 ?auto_1221829 ) ) ( not ( = ?auto_1221832 ?auto_1221834 ) ) ( not ( = ?auto_1221826 ?auto_1221831 ) ) ( not ( = ?auto_1221827 ?auto_1221831 ) ) ( not ( = ?auto_1221829 ?auto_1221831 ) ) ( not ( = ?auto_1221826 ?auto_1221828 ) ) ( not ( = ?auto_1221827 ?auto_1221828 ) ) ( not ( = ?auto_1221829 ?auto_1221828 ) ) ( not ( = ?auto_1221831 ?auto_1221828 ) ) ( not ( = ?auto_1221835 ?auto_1221834 ) ) ( not ( = ?auto_1221835 ?auto_1221832 ) ) ( not ( = ?auto_1221826 ?auto_1221830 ) ) ( not ( = ?auto_1221827 ?auto_1221830 ) ) ( not ( = ?auto_1221829 ?auto_1221830 ) ) ( not ( = ?auto_1221831 ?auto_1221830 ) ) ( not ( = ?auto_1221828 ?auto_1221830 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1221826 ?auto_1221827 ?auto_1221829 ?auto_1221828 ?auto_1221831 ?auto_1221830 ?auto_1221825 )
      ( DELIVER-6PKG-VERIFY ?auto_1221826 ?auto_1221827 ?auto_1221828 ?auto_1221829 ?auto_1221830 ?auto_1221831 ?auto_1221825 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1221890 - OBJ
      ?auto_1221891 - OBJ
      ?auto_1221892 - OBJ
      ?auto_1221893 - OBJ
      ?auto_1221894 - OBJ
      ?auto_1221895 - OBJ
      ?auto_1221889 - LOCATION
    )
    :vars
    (
      ?auto_1221899 - LOCATION
      ?auto_1221900 - CITY
      ?auto_1221898 - LOCATION
      ?auto_1221896 - LOCATION
      ?auto_1221897 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1221899 ?auto_1221900 ) ( IN-CITY ?auto_1221889 ?auto_1221900 ) ( not ( = ?auto_1221889 ?auto_1221899 ) ) ( OBJ-AT ?auto_1221895 ?auto_1221899 ) ( OBJ-AT ?auto_1221892 ?auto_1221899 ) ( IN-CITY ?auto_1221898 ?auto_1221900 ) ( not ( = ?auto_1221889 ?auto_1221898 ) ) ( OBJ-AT ?auto_1221893 ?auto_1221898 ) ( IN-CITY ?auto_1221896 ?auto_1221900 ) ( not ( = ?auto_1221889 ?auto_1221896 ) ) ( OBJ-AT ?auto_1221894 ?auto_1221896 ) ( OBJ-AT ?auto_1221891 ?auto_1221898 ) ( OBJ-AT ?auto_1221890 ?auto_1221898 ) ( TRUCK-AT ?auto_1221897 ?auto_1221889 ) ( not ( = ?auto_1221890 ?auto_1221891 ) ) ( not ( = ?auto_1221890 ?auto_1221894 ) ) ( not ( = ?auto_1221891 ?auto_1221894 ) ) ( not ( = ?auto_1221896 ?auto_1221898 ) ) ( not ( = ?auto_1221890 ?auto_1221893 ) ) ( not ( = ?auto_1221891 ?auto_1221893 ) ) ( not ( = ?auto_1221894 ?auto_1221893 ) ) ( not ( = ?auto_1221890 ?auto_1221892 ) ) ( not ( = ?auto_1221891 ?auto_1221892 ) ) ( not ( = ?auto_1221894 ?auto_1221892 ) ) ( not ( = ?auto_1221893 ?auto_1221892 ) ) ( not ( = ?auto_1221899 ?auto_1221898 ) ) ( not ( = ?auto_1221899 ?auto_1221896 ) ) ( not ( = ?auto_1221890 ?auto_1221895 ) ) ( not ( = ?auto_1221891 ?auto_1221895 ) ) ( not ( = ?auto_1221894 ?auto_1221895 ) ) ( not ( = ?auto_1221893 ?auto_1221895 ) ) ( not ( = ?auto_1221892 ?auto_1221895 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1221890 ?auto_1221891 ?auto_1221894 ?auto_1221892 ?auto_1221893 ?auto_1221895 ?auto_1221889 )
      ( DELIVER-6PKG-VERIFY ?auto_1221890 ?auto_1221891 ?auto_1221892 ?auto_1221893 ?auto_1221894 ?auto_1221895 ?auto_1221889 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1221954 - OBJ
      ?auto_1221955 - OBJ
      ?auto_1221956 - OBJ
      ?auto_1221957 - OBJ
      ?auto_1221958 - OBJ
      ?auto_1221959 - OBJ
      ?auto_1221953 - LOCATION
    )
    :vars
    (
      ?auto_1221963 - LOCATION
      ?auto_1221964 - CITY
      ?auto_1221962 - LOCATION
      ?auto_1221960 - LOCATION
      ?auto_1221961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1221963 ?auto_1221964 ) ( IN-CITY ?auto_1221953 ?auto_1221964 ) ( not ( = ?auto_1221953 ?auto_1221963 ) ) ( OBJ-AT ?auto_1221958 ?auto_1221963 ) ( OBJ-AT ?auto_1221956 ?auto_1221963 ) ( IN-CITY ?auto_1221962 ?auto_1221964 ) ( not ( = ?auto_1221953 ?auto_1221962 ) ) ( OBJ-AT ?auto_1221957 ?auto_1221962 ) ( IN-CITY ?auto_1221960 ?auto_1221964 ) ( not ( = ?auto_1221953 ?auto_1221960 ) ) ( OBJ-AT ?auto_1221959 ?auto_1221960 ) ( OBJ-AT ?auto_1221955 ?auto_1221962 ) ( OBJ-AT ?auto_1221954 ?auto_1221962 ) ( TRUCK-AT ?auto_1221961 ?auto_1221953 ) ( not ( = ?auto_1221954 ?auto_1221955 ) ) ( not ( = ?auto_1221954 ?auto_1221959 ) ) ( not ( = ?auto_1221955 ?auto_1221959 ) ) ( not ( = ?auto_1221960 ?auto_1221962 ) ) ( not ( = ?auto_1221954 ?auto_1221957 ) ) ( not ( = ?auto_1221955 ?auto_1221957 ) ) ( not ( = ?auto_1221959 ?auto_1221957 ) ) ( not ( = ?auto_1221954 ?auto_1221956 ) ) ( not ( = ?auto_1221955 ?auto_1221956 ) ) ( not ( = ?auto_1221959 ?auto_1221956 ) ) ( not ( = ?auto_1221957 ?auto_1221956 ) ) ( not ( = ?auto_1221963 ?auto_1221962 ) ) ( not ( = ?auto_1221963 ?auto_1221960 ) ) ( not ( = ?auto_1221954 ?auto_1221958 ) ) ( not ( = ?auto_1221955 ?auto_1221958 ) ) ( not ( = ?auto_1221959 ?auto_1221958 ) ) ( not ( = ?auto_1221957 ?auto_1221958 ) ) ( not ( = ?auto_1221956 ?auto_1221958 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1221954 ?auto_1221955 ?auto_1221959 ?auto_1221956 ?auto_1221957 ?auto_1221958 ?auto_1221953 )
      ( DELIVER-6PKG-VERIFY ?auto_1221954 ?auto_1221955 ?auto_1221956 ?auto_1221957 ?auto_1221958 ?auto_1221959 ?auto_1221953 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1222358 - OBJ
      ?auto_1222359 - OBJ
      ?auto_1222360 - OBJ
      ?auto_1222361 - OBJ
      ?auto_1222362 - OBJ
      ?auto_1222363 - OBJ
      ?auto_1222357 - LOCATION
    )
    :vars
    (
      ?auto_1222367 - LOCATION
      ?auto_1222368 - CITY
      ?auto_1222366 - LOCATION
      ?auto_1222364 - LOCATION
      ?auto_1222365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1222367 ?auto_1222368 ) ( IN-CITY ?auto_1222357 ?auto_1222368 ) ( not ( = ?auto_1222357 ?auto_1222367 ) ) ( OBJ-AT ?auto_1222361 ?auto_1222367 ) ( OBJ-AT ?auto_1222360 ?auto_1222367 ) ( IN-CITY ?auto_1222366 ?auto_1222368 ) ( not ( = ?auto_1222357 ?auto_1222366 ) ) ( OBJ-AT ?auto_1222363 ?auto_1222366 ) ( IN-CITY ?auto_1222364 ?auto_1222368 ) ( not ( = ?auto_1222357 ?auto_1222364 ) ) ( OBJ-AT ?auto_1222362 ?auto_1222364 ) ( OBJ-AT ?auto_1222359 ?auto_1222366 ) ( OBJ-AT ?auto_1222358 ?auto_1222366 ) ( TRUCK-AT ?auto_1222365 ?auto_1222357 ) ( not ( = ?auto_1222358 ?auto_1222359 ) ) ( not ( = ?auto_1222358 ?auto_1222362 ) ) ( not ( = ?auto_1222359 ?auto_1222362 ) ) ( not ( = ?auto_1222364 ?auto_1222366 ) ) ( not ( = ?auto_1222358 ?auto_1222363 ) ) ( not ( = ?auto_1222359 ?auto_1222363 ) ) ( not ( = ?auto_1222362 ?auto_1222363 ) ) ( not ( = ?auto_1222358 ?auto_1222360 ) ) ( not ( = ?auto_1222359 ?auto_1222360 ) ) ( not ( = ?auto_1222362 ?auto_1222360 ) ) ( not ( = ?auto_1222363 ?auto_1222360 ) ) ( not ( = ?auto_1222367 ?auto_1222366 ) ) ( not ( = ?auto_1222367 ?auto_1222364 ) ) ( not ( = ?auto_1222358 ?auto_1222361 ) ) ( not ( = ?auto_1222359 ?auto_1222361 ) ) ( not ( = ?auto_1222362 ?auto_1222361 ) ) ( not ( = ?auto_1222363 ?auto_1222361 ) ) ( not ( = ?auto_1222360 ?auto_1222361 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1222358 ?auto_1222359 ?auto_1222362 ?auto_1222360 ?auto_1222363 ?auto_1222361 ?auto_1222357 )
      ( DELIVER-6PKG-VERIFY ?auto_1222358 ?auto_1222359 ?auto_1222360 ?auto_1222361 ?auto_1222362 ?auto_1222363 ?auto_1222357 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1222422 - OBJ
      ?auto_1222423 - OBJ
      ?auto_1222424 - OBJ
      ?auto_1222425 - OBJ
      ?auto_1222426 - OBJ
      ?auto_1222427 - OBJ
      ?auto_1222421 - LOCATION
    )
    :vars
    (
      ?auto_1222431 - LOCATION
      ?auto_1222432 - CITY
      ?auto_1222430 - LOCATION
      ?auto_1222428 - LOCATION
      ?auto_1222429 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1222431 ?auto_1222432 ) ( IN-CITY ?auto_1222421 ?auto_1222432 ) ( not ( = ?auto_1222421 ?auto_1222431 ) ) ( OBJ-AT ?auto_1222425 ?auto_1222431 ) ( OBJ-AT ?auto_1222424 ?auto_1222431 ) ( IN-CITY ?auto_1222430 ?auto_1222432 ) ( not ( = ?auto_1222421 ?auto_1222430 ) ) ( OBJ-AT ?auto_1222426 ?auto_1222430 ) ( IN-CITY ?auto_1222428 ?auto_1222432 ) ( not ( = ?auto_1222421 ?auto_1222428 ) ) ( OBJ-AT ?auto_1222427 ?auto_1222428 ) ( OBJ-AT ?auto_1222423 ?auto_1222430 ) ( OBJ-AT ?auto_1222422 ?auto_1222430 ) ( TRUCK-AT ?auto_1222429 ?auto_1222421 ) ( not ( = ?auto_1222422 ?auto_1222423 ) ) ( not ( = ?auto_1222422 ?auto_1222427 ) ) ( not ( = ?auto_1222423 ?auto_1222427 ) ) ( not ( = ?auto_1222428 ?auto_1222430 ) ) ( not ( = ?auto_1222422 ?auto_1222426 ) ) ( not ( = ?auto_1222423 ?auto_1222426 ) ) ( not ( = ?auto_1222427 ?auto_1222426 ) ) ( not ( = ?auto_1222422 ?auto_1222424 ) ) ( not ( = ?auto_1222423 ?auto_1222424 ) ) ( not ( = ?auto_1222427 ?auto_1222424 ) ) ( not ( = ?auto_1222426 ?auto_1222424 ) ) ( not ( = ?auto_1222431 ?auto_1222430 ) ) ( not ( = ?auto_1222431 ?auto_1222428 ) ) ( not ( = ?auto_1222422 ?auto_1222425 ) ) ( not ( = ?auto_1222423 ?auto_1222425 ) ) ( not ( = ?auto_1222427 ?auto_1222425 ) ) ( not ( = ?auto_1222426 ?auto_1222425 ) ) ( not ( = ?auto_1222424 ?auto_1222425 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1222422 ?auto_1222423 ?auto_1222427 ?auto_1222424 ?auto_1222426 ?auto_1222425 ?auto_1222421 )
      ( DELIVER-6PKG-VERIFY ?auto_1222422 ?auto_1222423 ?auto_1222424 ?auto_1222425 ?auto_1222426 ?auto_1222427 ?auto_1222421 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1227351 - OBJ
      ?auto_1227352 - OBJ
      ?auto_1227353 - OBJ
      ?auto_1227354 - OBJ
      ?auto_1227355 - OBJ
      ?auto_1227356 - OBJ
      ?auto_1227350 - LOCATION
    )
    :vars
    (
      ?auto_1227360 - LOCATION
      ?auto_1227361 - CITY
      ?auto_1227359 - LOCATION
      ?auto_1227357 - LOCATION
      ?auto_1227358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1227360 ?auto_1227361 ) ( IN-CITY ?auto_1227350 ?auto_1227361 ) ( not ( = ?auto_1227350 ?auto_1227360 ) ) ( OBJ-AT ?auto_1227356 ?auto_1227360 ) ( OBJ-AT ?auto_1227355 ?auto_1227360 ) ( IN-CITY ?auto_1227359 ?auto_1227361 ) ( not ( = ?auto_1227350 ?auto_1227359 ) ) ( OBJ-AT ?auto_1227354 ?auto_1227359 ) ( IN-CITY ?auto_1227357 ?auto_1227361 ) ( not ( = ?auto_1227350 ?auto_1227357 ) ) ( OBJ-AT ?auto_1227352 ?auto_1227357 ) ( OBJ-AT ?auto_1227353 ?auto_1227359 ) ( OBJ-AT ?auto_1227351 ?auto_1227359 ) ( TRUCK-AT ?auto_1227358 ?auto_1227350 ) ( not ( = ?auto_1227351 ?auto_1227353 ) ) ( not ( = ?auto_1227351 ?auto_1227352 ) ) ( not ( = ?auto_1227353 ?auto_1227352 ) ) ( not ( = ?auto_1227357 ?auto_1227359 ) ) ( not ( = ?auto_1227351 ?auto_1227354 ) ) ( not ( = ?auto_1227353 ?auto_1227354 ) ) ( not ( = ?auto_1227352 ?auto_1227354 ) ) ( not ( = ?auto_1227351 ?auto_1227355 ) ) ( not ( = ?auto_1227353 ?auto_1227355 ) ) ( not ( = ?auto_1227352 ?auto_1227355 ) ) ( not ( = ?auto_1227354 ?auto_1227355 ) ) ( not ( = ?auto_1227360 ?auto_1227359 ) ) ( not ( = ?auto_1227360 ?auto_1227357 ) ) ( not ( = ?auto_1227351 ?auto_1227356 ) ) ( not ( = ?auto_1227353 ?auto_1227356 ) ) ( not ( = ?auto_1227352 ?auto_1227356 ) ) ( not ( = ?auto_1227354 ?auto_1227356 ) ) ( not ( = ?auto_1227355 ?auto_1227356 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1227351 ?auto_1227353 ?auto_1227352 ?auto_1227355 ?auto_1227354 ?auto_1227356 ?auto_1227350 )
      ( DELIVER-6PKG-VERIFY ?auto_1227351 ?auto_1227352 ?auto_1227353 ?auto_1227354 ?auto_1227355 ?auto_1227356 ?auto_1227350 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1227474 - OBJ
      ?auto_1227475 - OBJ
      ?auto_1227476 - OBJ
      ?auto_1227477 - OBJ
      ?auto_1227478 - OBJ
      ?auto_1227479 - OBJ
      ?auto_1227473 - LOCATION
    )
    :vars
    (
      ?auto_1227483 - LOCATION
      ?auto_1227484 - CITY
      ?auto_1227482 - LOCATION
      ?auto_1227480 - LOCATION
      ?auto_1227481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1227483 ?auto_1227484 ) ( IN-CITY ?auto_1227473 ?auto_1227484 ) ( not ( = ?auto_1227473 ?auto_1227483 ) ) ( OBJ-AT ?auto_1227479 ?auto_1227483 ) ( OBJ-AT ?auto_1227477 ?auto_1227483 ) ( IN-CITY ?auto_1227482 ?auto_1227484 ) ( not ( = ?auto_1227473 ?auto_1227482 ) ) ( OBJ-AT ?auto_1227478 ?auto_1227482 ) ( IN-CITY ?auto_1227480 ?auto_1227484 ) ( not ( = ?auto_1227473 ?auto_1227480 ) ) ( OBJ-AT ?auto_1227475 ?auto_1227480 ) ( OBJ-AT ?auto_1227476 ?auto_1227482 ) ( OBJ-AT ?auto_1227474 ?auto_1227482 ) ( TRUCK-AT ?auto_1227481 ?auto_1227473 ) ( not ( = ?auto_1227474 ?auto_1227476 ) ) ( not ( = ?auto_1227474 ?auto_1227475 ) ) ( not ( = ?auto_1227476 ?auto_1227475 ) ) ( not ( = ?auto_1227480 ?auto_1227482 ) ) ( not ( = ?auto_1227474 ?auto_1227478 ) ) ( not ( = ?auto_1227476 ?auto_1227478 ) ) ( not ( = ?auto_1227475 ?auto_1227478 ) ) ( not ( = ?auto_1227474 ?auto_1227477 ) ) ( not ( = ?auto_1227476 ?auto_1227477 ) ) ( not ( = ?auto_1227475 ?auto_1227477 ) ) ( not ( = ?auto_1227478 ?auto_1227477 ) ) ( not ( = ?auto_1227483 ?auto_1227482 ) ) ( not ( = ?auto_1227483 ?auto_1227480 ) ) ( not ( = ?auto_1227474 ?auto_1227479 ) ) ( not ( = ?auto_1227476 ?auto_1227479 ) ) ( not ( = ?auto_1227475 ?auto_1227479 ) ) ( not ( = ?auto_1227478 ?auto_1227479 ) ) ( not ( = ?auto_1227477 ?auto_1227479 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1227474 ?auto_1227476 ?auto_1227475 ?auto_1227477 ?auto_1227478 ?auto_1227479 ?auto_1227473 )
      ( DELIVER-6PKG-VERIFY ?auto_1227474 ?auto_1227475 ?auto_1227476 ?auto_1227477 ?auto_1227478 ?auto_1227479 ?auto_1227473 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1227538 - OBJ
      ?auto_1227539 - OBJ
      ?auto_1227540 - OBJ
      ?auto_1227541 - OBJ
      ?auto_1227542 - OBJ
      ?auto_1227543 - OBJ
      ?auto_1227537 - LOCATION
    )
    :vars
    (
      ?auto_1227547 - LOCATION
      ?auto_1227548 - CITY
      ?auto_1227546 - LOCATION
      ?auto_1227544 - LOCATION
      ?auto_1227545 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1227547 ?auto_1227548 ) ( IN-CITY ?auto_1227537 ?auto_1227548 ) ( not ( = ?auto_1227537 ?auto_1227547 ) ) ( OBJ-AT ?auto_1227542 ?auto_1227547 ) ( OBJ-AT ?auto_1227541 ?auto_1227547 ) ( IN-CITY ?auto_1227546 ?auto_1227548 ) ( not ( = ?auto_1227537 ?auto_1227546 ) ) ( OBJ-AT ?auto_1227543 ?auto_1227546 ) ( IN-CITY ?auto_1227544 ?auto_1227548 ) ( not ( = ?auto_1227537 ?auto_1227544 ) ) ( OBJ-AT ?auto_1227539 ?auto_1227544 ) ( OBJ-AT ?auto_1227540 ?auto_1227546 ) ( OBJ-AT ?auto_1227538 ?auto_1227546 ) ( TRUCK-AT ?auto_1227545 ?auto_1227537 ) ( not ( = ?auto_1227538 ?auto_1227540 ) ) ( not ( = ?auto_1227538 ?auto_1227539 ) ) ( not ( = ?auto_1227540 ?auto_1227539 ) ) ( not ( = ?auto_1227544 ?auto_1227546 ) ) ( not ( = ?auto_1227538 ?auto_1227543 ) ) ( not ( = ?auto_1227540 ?auto_1227543 ) ) ( not ( = ?auto_1227539 ?auto_1227543 ) ) ( not ( = ?auto_1227538 ?auto_1227541 ) ) ( not ( = ?auto_1227540 ?auto_1227541 ) ) ( not ( = ?auto_1227539 ?auto_1227541 ) ) ( not ( = ?auto_1227543 ?auto_1227541 ) ) ( not ( = ?auto_1227547 ?auto_1227546 ) ) ( not ( = ?auto_1227547 ?auto_1227544 ) ) ( not ( = ?auto_1227538 ?auto_1227542 ) ) ( not ( = ?auto_1227540 ?auto_1227542 ) ) ( not ( = ?auto_1227539 ?auto_1227542 ) ) ( not ( = ?auto_1227543 ?auto_1227542 ) ) ( not ( = ?auto_1227541 ?auto_1227542 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1227538 ?auto_1227540 ?auto_1227539 ?auto_1227541 ?auto_1227543 ?auto_1227542 ?auto_1227537 )
      ( DELIVER-6PKG-VERIFY ?auto_1227538 ?auto_1227539 ?auto_1227540 ?auto_1227541 ?auto_1227542 ?auto_1227543 ?auto_1227537 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1230696 - OBJ
      ?auto_1230697 - OBJ
      ?auto_1230698 - OBJ
      ?auto_1230699 - OBJ
      ?auto_1230700 - OBJ
      ?auto_1230701 - OBJ
      ?auto_1230695 - LOCATION
    )
    :vars
    (
      ?auto_1230705 - LOCATION
      ?auto_1230706 - CITY
      ?auto_1230704 - LOCATION
      ?auto_1230702 - LOCATION
      ?auto_1230703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1230705 ?auto_1230706 ) ( IN-CITY ?auto_1230695 ?auto_1230706 ) ( not ( = ?auto_1230695 ?auto_1230705 ) ) ( OBJ-AT ?auto_1230701 ?auto_1230705 ) ( OBJ-AT ?auto_1230698 ?auto_1230705 ) ( IN-CITY ?auto_1230704 ?auto_1230706 ) ( not ( = ?auto_1230695 ?auto_1230704 ) ) ( OBJ-AT ?auto_1230700 ?auto_1230704 ) ( IN-CITY ?auto_1230702 ?auto_1230706 ) ( not ( = ?auto_1230695 ?auto_1230702 ) ) ( OBJ-AT ?auto_1230697 ?auto_1230702 ) ( OBJ-AT ?auto_1230699 ?auto_1230704 ) ( OBJ-AT ?auto_1230696 ?auto_1230704 ) ( TRUCK-AT ?auto_1230703 ?auto_1230695 ) ( not ( = ?auto_1230696 ?auto_1230699 ) ) ( not ( = ?auto_1230696 ?auto_1230697 ) ) ( not ( = ?auto_1230699 ?auto_1230697 ) ) ( not ( = ?auto_1230702 ?auto_1230704 ) ) ( not ( = ?auto_1230696 ?auto_1230700 ) ) ( not ( = ?auto_1230699 ?auto_1230700 ) ) ( not ( = ?auto_1230697 ?auto_1230700 ) ) ( not ( = ?auto_1230696 ?auto_1230698 ) ) ( not ( = ?auto_1230699 ?auto_1230698 ) ) ( not ( = ?auto_1230697 ?auto_1230698 ) ) ( not ( = ?auto_1230700 ?auto_1230698 ) ) ( not ( = ?auto_1230705 ?auto_1230704 ) ) ( not ( = ?auto_1230705 ?auto_1230702 ) ) ( not ( = ?auto_1230696 ?auto_1230701 ) ) ( not ( = ?auto_1230699 ?auto_1230701 ) ) ( not ( = ?auto_1230697 ?auto_1230701 ) ) ( not ( = ?auto_1230700 ?auto_1230701 ) ) ( not ( = ?auto_1230698 ?auto_1230701 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1230696 ?auto_1230699 ?auto_1230697 ?auto_1230698 ?auto_1230700 ?auto_1230701 ?auto_1230695 )
      ( DELIVER-6PKG-VERIFY ?auto_1230696 ?auto_1230697 ?auto_1230698 ?auto_1230699 ?auto_1230700 ?auto_1230701 ?auto_1230695 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1230760 - OBJ
      ?auto_1230761 - OBJ
      ?auto_1230762 - OBJ
      ?auto_1230763 - OBJ
      ?auto_1230764 - OBJ
      ?auto_1230765 - OBJ
      ?auto_1230759 - LOCATION
    )
    :vars
    (
      ?auto_1230769 - LOCATION
      ?auto_1230770 - CITY
      ?auto_1230768 - LOCATION
      ?auto_1230766 - LOCATION
      ?auto_1230767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1230769 ?auto_1230770 ) ( IN-CITY ?auto_1230759 ?auto_1230770 ) ( not ( = ?auto_1230759 ?auto_1230769 ) ) ( OBJ-AT ?auto_1230764 ?auto_1230769 ) ( OBJ-AT ?auto_1230762 ?auto_1230769 ) ( IN-CITY ?auto_1230768 ?auto_1230770 ) ( not ( = ?auto_1230759 ?auto_1230768 ) ) ( OBJ-AT ?auto_1230765 ?auto_1230768 ) ( IN-CITY ?auto_1230766 ?auto_1230770 ) ( not ( = ?auto_1230759 ?auto_1230766 ) ) ( OBJ-AT ?auto_1230761 ?auto_1230766 ) ( OBJ-AT ?auto_1230763 ?auto_1230768 ) ( OBJ-AT ?auto_1230760 ?auto_1230768 ) ( TRUCK-AT ?auto_1230767 ?auto_1230759 ) ( not ( = ?auto_1230760 ?auto_1230763 ) ) ( not ( = ?auto_1230760 ?auto_1230761 ) ) ( not ( = ?auto_1230763 ?auto_1230761 ) ) ( not ( = ?auto_1230766 ?auto_1230768 ) ) ( not ( = ?auto_1230760 ?auto_1230765 ) ) ( not ( = ?auto_1230763 ?auto_1230765 ) ) ( not ( = ?auto_1230761 ?auto_1230765 ) ) ( not ( = ?auto_1230760 ?auto_1230762 ) ) ( not ( = ?auto_1230763 ?auto_1230762 ) ) ( not ( = ?auto_1230761 ?auto_1230762 ) ) ( not ( = ?auto_1230765 ?auto_1230762 ) ) ( not ( = ?auto_1230769 ?auto_1230768 ) ) ( not ( = ?auto_1230769 ?auto_1230766 ) ) ( not ( = ?auto_1230760 ?auto_1230764 ) ) ( not ( = ?auto_1230763 ?auto_1230764 ) ) ( not ( = ?auto_1230761 ?auto_1230764 ) ) ( not ( = ?auto_1230765 ?auto_1230764 ) ) ( not ( = ?auto_1230762 ?auto_1230764 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1230760 ?auto_1230763 ?auto_1230761 ?auto_1230762 ?auto_1230765 ?auto_1230764 ?auto_1230759 )
      ( DELIVER-6PKG-VERIFY ?auto_1230760 ?auto_1230761 ?auto_1230762 ?auto_1230763 ?auto_1230764 ?auto_1230765 ?auto_1230759 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1231350 - OBJ
      ?auto_1231351 - OBJ
      ?auto_1231352 - OBJ
      ?auto_1231353 - OBJ
      ?auto_1231354 - OBJ
      ?auto_1231355 - OBJ
      ?auto_1231349 - LOCATION
    )
    :vars
    (
      ?auto_1231359 - LOCATION
      ?auto_1231360 - CITY
      ?auto_1231358 - LOCATION
      ?auto_1231356 - LOCATION
      ?auto_1231357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1231359 ?auto_1231360 ) ( IN-CITY ?auto_1231349 ?auto_1231360 ) ( not ( = ?auto_1231349 ?auto_1231359 ) ) ( OBJ-AT ?auto_1231353 ?auto_1231359 ) ( OBJ-AT ?auto_1231352 ?auto_1231359 ) ( IN-CITY ?auto_1231358 ?auto_1231360 ) ( not ( = ?auto_1231349 ?auto_1231358 ) ) ( OBJ-AT ?auto_1231355 ?auto_1231358 ) ( IN-CITY ?auto_1231356 ?auto_1231360 ) ( not ( = ?auto_1231349 ?auto_1231356 ) ) ( OBJ-AT ?auto_1231351 ?auto_1231356 ) ( OBJ-AT ?auto_1231354 ?auto_1231358 ) ( OBJ-AT ?auto_1231350 ?auto_1231358 ) ( TRUCK-AT ?auto_1231357 ?auto_1231349 ) ( not ( = ?auto_1231350 ?auto_1231354 ) ) ( not ( = ?auto_1231350 ?auto_1231351 ) ) ( not ( = ?auto_1231354 ?auto_1231351 ) ) ( not ( = ?auto_1231356 ?auto_1231358 ) ) ( not ( = ?auto_1231350 ?auto_1231355 ) ) ( not ( = ?auto_1231354 ?auto_1231355 ) ) ( not ( = ?auto_1231351 ?auto_1231355 ) ) ( not ( = ?auto_1231350 ?auto_1231352 ) ) ( not ( = ?auto_1231354 ?auto_1231352 ) ) ( not ( = ?auto_1231351 ?auto_1231352 ) ) ( not ( = ?auto_1231355 ?auto_1231352 ) ) ( not ( = ?auto_1231359 ?auto_1231358 ) ) ( not ( = ?auto_1231359 ?auto_1231356 ) ) ( not ( = ?auto_1231350 ?auto_1231353 ) ) ( not ( = ?auto_1231354 ?auto_1231353 ) ) ( not ( = ?auto_1231351 ?auto_1231353 ) ) ( not ( = ?auto_1231355 ?auto_1231353 ) ) ( not ( = ?auto_1231352 ?auto_1231353 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1231350 ?auto_1231354 ?auto_1231351 ?auto_1231352 ?auto_1231355 ?auto_1231353 ?auto_1231349 )
      ( DELIVER-6PKG-VERIFY ?auto_1231350 ?auto_1231351 ?auto_1231352 ?auto_1231353 ?auto_1231354 ?auto_1231355 ?auto_1231349 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1245296 - OBJ
      ?auto_1245297 - OBJ
      ?auto_1245298 - OBJ
      ?auto_1245299 - OBJ
      ?auto_1245300 - OBJ
      ?auto_1245301 - OBJ
      ?auto_1245295 - LOCATION
    )
    :vars
    (
      ?auto_1245305 - LOCATION
      ?auto_1245306 - CITY
      ?auto_1245304 - LOCATION
      ?auto_1245302 - LOCATION
      ?auto_1245303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1245305 ?auto_1245306 ) ( IN-CITY ?auto_1245295 ?auto_1245306 ) ( not ( = ?auto_1245295 ?auto_1245305 ) ) ( OBJ-AT ?auto_1245301 ?auto_1245305 ) ( OBJ-AT ?auto_1245297 ?auto_1245305 ) ( IN-CITY ?auto_1245304 ?auto_1245306 ) ( not ( = ?auto_1245295 ?auto_1245304 ) ) ( OBJ-AT ?auto_1245300 ?auto_1245304 ) ( IN-CITY ?auto_1245302 ?auto_1245306 ) ( not ( = ?auto_1245295 ?auto_1245302 ) ) ( OBJ-AT ?auto_1245299 ?auto_1245302 ) ( OBJ-AT ?auto_1245298 ?auto_1245304 ) ( OBJ-AT ?auto_1245296 ?auto_1245304 ) ( TRUCK-AT ?auto_1245303 ?auto_1245295 ) ( not ( = ?auto_1245296 ?auto_1245298 ) ) ( not ( = ?auto_1245296 ?auto_1245299 ) ) ( not ( = ?auto_1245298 ?auto_1245299 ) ) ( not ( = ?auto_1245302 ?auto_1245304 ) ) ( not ( = ?auto_1245296 ?auto_1245300 ) ) ( not ( = ?auto_1245298 ?auto_1245300 ) ) ( not ( = ?auto_1245299 ?auto_1245300 ) ) ( not ( = ?auto_1245296 ?auto_1245297 ) ) ( not ( = ?auto_1245298 ?auto_1245297 ) ) ( not ( = ?auto_1245299 ?auto_1245297 ) ) ( not ( = ?auto_1245300 ?auto_1245297 ) ) ( not ( = ?auto_1245305 ?auto_1245304 ) ) ( not ( = ?auto_1245305 ?auto_1245302 ) ) ( not ( = ?auto_1245296 ?auto_1245301 ) ) ( not ( = ?auto_1245298 ?auto_1245301 ) ) ( not ( = ?auto_1245299 ?auto_1245301 ) ) ( not ( = ?auto_1245300 ?auto_1245301 ) ) ( not ( = ?auto_1245297 ?auto_1245301 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1245296 ?auto_1245298 ?auto_1245299 ?auto_1245297 ?auto_1245300 ?auto_1245301 ?auto_1245295 )
      ( DELIVER-6PKG-VERIFY ?auto_1245296 ?auto_1245297 ?auto_1245298 ?auto_1245299 ?auto_1245300 ?auto_1245301 ?auto_1245295 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1245360 - OBJ
      ?auto_1245361 - OBJ
      ?auto_1245362 - OBJ
      ?auto_1245363 - OBJ
      ?auto_1245364 - OBJ
      ?auto_1245365 - OBJ
      ?auto_1245359 - LOCATION
    )
    :vars
    (
      ?auto_1245369 - LOCATION
      ?auto_1245370 - CITY
      ?auto_1245368 - LOCATION
      ?auto_1245366 - LOCATION
      ?auto_1245367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1245369 ?auto_1245370 ) ( IN-CITY ?auto_1245359 ?auto_1245370 ) ( not ( = ?auto_1245359 ?auto_1245369 ) ) ( OBJ-AT ?auto_1245364 ?auto_1245369 ) ( OBJ-AT ?auto_1245361 ?auto_1245369 ) ( IN-CITY ?auto_1245368 ?auto_1245370 ) ( not ( = ?auto_1245359 ?auto_1245368 ) ) ( OBJ-AT ?auto_1245365 ?auto_1245368 ) ( IN-CITY ?auto_1245366 ?auto_1245370 ) ( not ( = ?auto_1245359 ?auto_1245366 ) ) ( OBJ-AT ?auto_1245363 ?auto_1245366 ) ( OBJ-AT ?auto_1245362 ?auto_1245368 ) ( OBJ-AT ?auto_1245360 ?auto_1245368 ) ( TRUCK-AT ?auto_1245367 ?auto_1245359 ) ( not ( = ?auto_1245360 ?auto_1245362 ) ) ( not ( = ?auto_1245360 ?auto_1245363 ) ) ( not ( = ?auto_1245362 ?auto_1245363 ) ) ( not ( = ?auto_1245366 ?auto_1245368 ) ) ( not ( = ?auto_1245360 ?auto_1245365 ) ) ( not ( = ?auto_1245362 ?auto_1245365 ) ) ( not ( = ?auto_1245363 ?auto_1245365 ) ) ( not ( = ?auto_1245360 ?auto_1245361 ) ) ( not ( = ?auto_1245362 ?auto_1245361 ) ) ( not ( = ?auto_1245363 ?auto_1245361 ) ) ( not ( = ?auto_1245365 ?auto_1245361 ) ) ( not ( = ?auto_1245369 ?auto_1245368 ) ) ( not ( = ?auto_1245369 ?auto_1245366 ) ) ( not ( = ?auto_1245360 ?auto_1245364 ) ) ( not ( = ?auto_1245362 ?auto_1245364 ) ) ( not ( = ?auto_1245363 ?auto_1245364 ) ) ( not ( = ?auto_1245365 ?auto_1245364 ) ) ( not ( = ?auto_1245361 ?auto_1245364 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1245360 ?auto_1245362 ?auto_1245363 ?auto_1245361 ?auto_1245365 ?auto_1245364 ?auto_1245359 )
      ( DELIVER-6PKG-VERIFY ?auto_1245360 ?auto_1245361 ?auto_1245362 ?auto_1245363 ?auto_1245364 ?auto_1245365 ?auto_1245359 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1245424 - OBJ
      ?auto_1245425 - OBJ
      ?auto_1245426 - OBJ
      ?auto_1245427 - OBJ
      ?auto_1245428 - OBJ
      ?auto_1245429 - OBJ
      ?auto_1245423 - LOCATION
    )
    :vars
    (
      ?auto_1245433 - LOCATION
      ?auto_1245434 - CITY
      ?auto_1245432 - LOCATION
      ?auto_1245430 - LOCATION
      ?auto_1245431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1245433 ?auto_1245434 ) ( IN-CITY ?auto_1245423 ?auto_1245434 ) ( not ( = ?auto_1245423 ?auto_1245433 ) ) ( OBJ-AT ?auto_1245429 ?auto_1245433 ) ( OBJ-AT ?auto_1245425 ?auto_1245433 ) ( IN-CITY ?auto_1245432 ?auto_1245434 ) ( not ( = ?auto_1245423 ?auto_1245432 ) ) ( OBJ-AT ?auto_1245427 ?auto_1245432 ) ( IN-CITY ?auto_1245430 ?auto_1245434 ) ( not ( = ?auto_1245423 ?auto_1245430 ) ) ( OBJ-AT ?auto_1245428 ?auto_1245430 ) ( OBJ-AT ?auto_1245426 ?auto_1245432 ) ( OBJ-AT ?auto_1245424 ?auto_1245432 ) ( TRUCK-AT ?auto_1245431 ?auto_1245423 ) ( not ( = ?auto_1245424 ?auto_1245426 ) ) ( not ( = ?auto_1245424 ?auto_1245428 ) ) ( not ( = ?auto_1245426 ?auto_1245428 ) ) ( not ( = ?auto_1245430 ?auto_1245432 ) ) ( not ( = ?auto_1245424 ?auto_1245427 ) ) ( not ( = ?auto_1245426 ?auto_1245427 ) ) ( not ( = ?auto_1245428 ?auto_1245427 ) ) ( not ( = ?auto_1245424 ?auto_1245425 ) ) ( not ( = ?auto_1245426 ?auto_1245425 ) ) ( not ( = ?auto_1245428 ?auto_1245425 ) ) ( not ( = ?auto_1245427 ?auto_1245425 ) ) ( not ( = ?auto_1245433 ?auto_1245432 ) ) ( not ( = ?auto_1245433 ?auto_1245430 ) ) ( not ( = ?auto_1245424 ?auto_1245429 ) ) ( not ( = ?auto_1245426 ?auto_1245429 ) ) ( not ( = ?auto_1245428 ?auto_1245429 ) ) ( not ( = ?auto_1245427 ?auto_1245429 ) ) ( not ( = ?auto_1245425 ?auto_1245429 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1245424 ?auto_1245426 ?auto_1245428 ?auto_1245425 ?auto_1245427 ?auto_1245429 ?auto_1245423 )
      ( DELIVER-6PKG-VERIFY ?auto_1245424 ?auto_1245425 ?auto_1245426 ?auto_1245427 ?auto_1245428 ?auto_1245429 ?auto_1245423 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1245488 - OBJ
      ?auto_1245489 - OBJ
      ?auto_1245490 - OBJ
      ?auto_1245491 - OBJ
      ?auto_1245492 - OBJ
      ?auto_1245493 - OBJ
      ?auto_1245487 - LOCATION
    )
    :vars
    (
      ?auto_1245497 - LOCATION
      ?auto_1245498 - CITY
      ?auto_1245496 - LOCATION
      ?auto_1245494 - LOCATION
      ?auto_1245495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1245497 ?auto_1245498 ) ( IN-CITY ?auto_1245487 ?auto_1245498 ) ( not ( = ?auto_1245487 ?auto_1245497 ) ) ( OBJ-AT ?auto_1245492 ?auto_1245497 ) ( OBJ-AT ?auto_1245489 ?auto_1245497 ) ( IN-CITY ?auto_1245496 ?auto_1245498 ) ( not ( = ?auto_1245487 ?auto_1245496 ) ) ( OBJ-AT ?auto_1245491 ?auto_1245496 ) ( IN-CITY ?auto_1245494 ?auto_1245498 ) ( not ( = ?auto_1245487 ?auto_1245494 ) ) ( OBJ-AT ?auto_1245493 ?auto_1245494 ) ( OBJ-AT ?auto_1245490 ?auto_1245496 ) ( OBJ-AT ?auto_1245488 ?auto_1245496 ) ( TRUCK-AT ?auto_1245495 ?auto_1245487 ) ( not ( = ?auto_1245488 ?auto_1245490 ) ) ( not ( = ?auto_1245488 ?auto_1245493 ) ) ( not ( = ?auto_1245490 ?auto_1245493 ) ) ( not ( = ?auto_1245494 ?auto_1245496 ) ) ( not ( = ?auto_1245488 ?auto_1245491 ) ) ( not ( = ?auto_1245490 ?auto_1245491 ) ) ( not ( = ?auto_1245493 ?auto_1245491 ) ) ( not ( = ?auto_1245488 ?auto_1245489 ) ) ( not ( = ?auto_1245490 ?auto_1245489 ) ) ( not ( = ?auto_1245493 ?auto_1245489 ) ) ( not ( = ?auto_1245491 ?auto_1245489 ) ) ( not ( = ?auto_1245497 ?auto_1245496 ) ) ( not ( = ?auto_1245497 ?auto_1245494 ) ) ( not ( = ?auto_1245488 ?auto_1245492 ) ) ( not ( = ?auto_1245490 ?auto_1245492 ) ) ( not ( = ?auto_1245493 ?auto_1245492 ) ) ( not ( = ?auto_1245491 ?auto_1245492 ) ) ( not ( = ?auto_1245489 ?auto_1245492 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1245488 ?auto_1245490 ?auto_1245493 ?auto_1245489 ?auto_1245491 ?auto_1245492 ?auto_1245487 )
      ( DELIVER-6PKG-VERIFY ?auto_1245488 ?auto_1245489 ?auto_1245490 ?auto_1245491 ?auto_1245492 ?auto_1245493 ?auto_1245487 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1245892 - OBJ
      ?auto_1245893 - OBJ
      ?auto_1245894 - OBJ
      ?auto_1245895 - OBJ
      ?auto_1245896 - OBJ
      ?auto_1245897 - OBJ
      ?auto_1245891 - LOCATION
    )
    :vars
    (
      ?auto_1245901 - LOCATION
      ?auto_1245902 - CITY
      ?auto_1245900 - LOCATION
      ?auto_1245898 - LOCATION
      ?auto_1245899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1245901 ?auto_1245902 ) ( IN-CITY ?auto_1245891 ?auto_1245902 ) ( not ( = ?auto_1245891 ?auto_1245901 ) ) ( OBJ-AT ?auto_1245895 ?auto_1245901 ) ( OBJ-AT ?auto_1245893 ?auto_1245901 ) ( IN-CITY ?auto_1245900 ?auto_1245902 ) ( not ( = ?auto_1245891 ?auto_1245900 ) ) ( OBJ-AT ?auto_1245897 ?auto_1245900 ) ( IN-CITY ?auto_1245898 ?auto_1245902 ) ( not ( = ?auto_1245891 ?auto_1245898 ) ) ( OBJ-AT ?auto_1245896 ?auto_1245898 ) ( OBJ-AT ?auto_1245894 ?auto_1245900 ) ( OBJ-AT ?auto_1245892 ?auto_1245900 ) ( TRUCK-AT ?auto_1245899 ?auto_1245891 ) ( not ( = ?auto_1245892 ?auto_1245894 ) ) ( not ( = ?auto_1245892 ?auto_1245896 ) ) ( not ( = ?auto_1245894 ?auto_1245896 ) ) ( not ( = ?auto_1245898 ?auto_1245900 ) ) ( not ( = ?auto_1245892 ?auto_1245897 ) ) ( not ( = ?auto_1245894 ?auto_1245897 ) ) ( not ( = ?auto_1245896 ?auto_1245897 ) ) ( not ( = ?auto_1245892 ?auto_1245893 ) ) ( not ( = ?auto_1245894 ?auto_1245893 ) ) ( not ( = ?auto_1245896 ?auto_1245893 ) ) ( not ( = ?auto_1245897 ?auto_1245893 ) ) ( not ( = ?auto_1245901 ?auto_1245900 ) ) ( not ( = ?auto_1245901 ?auto_1245898 ) ) ( not ( = ?auto_1245892 ?auto_1245895 ) ) ( not ( = ?auto_1245894 ?auto_1245895 ) ) ( not ( = ?auto_1245896 ?auto_1245895 ) ) ( not ( = ?auto_1245897 ?auto_1245895 ) ) ( not ( = ?auto_1245893 ?auto_1245895 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1245892 ?auto_1245894 ?auto_1245896 ?auto_1245893 ?auto_1245897 ?auto_1245895 ?auto_1245891 )
      ( DELIVER-6PKG-VERIFY ?auto_1245892 ?auto_1245893 ?auto_1245894 ?auto_1245895 ?auto_1245896 ?auto_1245897 ?auto_1245891 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1245956 - OBJ
      ?auto_1245957 - OBJ
      ?auto_1245958 - OBJ
      ?auto_1245959 - OBJ
      ?auto_1245960 - OBJ
      ?auto_1245961 - OBJ
      ?auto_1245955 - LOCATION
    )
    :vars
    (
      ?auto_1245965 - LOCATION
      ?auto_1245966 - CITY
      ?auto_1245964 - LOCATION
      ?auto_1245962 - LOCATION
      ?auto_1245963 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1245965 ?auto_1245966 ) ( IN-CITY ?auto_1245955 ?auto_1245966 ) ( not ( = ?auto_1245955 ?auto_1245965 ) ) ( OBJ-AT ?auto_1245959 ?auto_1245965 ) ( OBJ-AT ?auto_1245957 ?auto_1245965 ) ( IN-CITY ?auto_1245964 ?auto_1245966 ) ( not ( = ?auto_1245955 ?auto_1245964 ) ) ( OBJ-AT ?auto_1245960 ?auto_1245964 ) ( IN-CITY ?auto_1245962 ?auto_1245966 ) ( not ( = ?auto_1245955 ?auto_1245962 ) ) ( OBJ-AT ?auto_1245961 ?auto_1245962 ) ( OBJ-AT ?auto_1245958 ?auto_1245964 ) ( OBJ-AT ?auto_1245956 ?auto_1245964 ) ( TRUCK-AT ?auto_1245963 ?auto_1245955 ) ( not ( = ?auto_1245956 ?auto_1245958 ) ) ( not ( = ?auto_1245956 ?auto_1245961 ) ) ( not ( = ?auto_1245958 ?auto_1245961 ) ) ( not ( = ?auto_1245962 ?auto_1245964 ) ) ( not ( = ?auto_1245956 ?auto_1245960 ) ) ( not ( = ?auto_1245958 ?auto_1245960 ) ) ( not ( = ?auto_1245961 ?auto_1245960 ) ) ( not ( = ?auto_1245956 ?auto_1245957 ) ) ( not ( = ?auto_1245958 ?auto_1245957 ) ) ( not ( = ?auto_1245961 ?auto_1245957 ) ) ( not ( = ?auto_1245960 ?auto_1245957 ) ) ( not ( = ?auto_1245965 ?auto_1245964 ) ) ( not ( = ?auto_1245965 ?auto_1245962 ) ) ( not ( = ?auto_1245956 ?auto_1245959 ) ) ( not ( = ?auto_1245958 ?auto_1245959 ) ) ( not ( = ?auto_1245961 ?auto_1245959 ) ) ( not ( = ?auto_1245960 ?auto_1245959 ) ) ( not ( = ?auto_1245957 ?auto_1245959 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1245956 ?auto_1245958 ?auto_1245961 ?auto_1245957 ?auto_1245960 ?auto_1245959 ?auto_1245955 )
      ( DELIVER-6PKG-VERIFY ?auto_1245956 ?auto_1245957 ?auto_1245958 ?auto_1245959 ?auto_1245960 ?auto_1245961 ?auto_1245955 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1246360 - OBJ
      ?auto_1246361 - OBJ
      ?auto_1246362 - OBJ
      ?auto_1246363 - OBJ
      ?auto_1246364 - OBJ
      ?auto_1246365 - OBJ
      ?auto_1246359 - LOCATION
    )
    :vars
    (
      ?auto_1246369 - LOCATION
      ?auto_1246370 - CITY
      ?auto_1246368 - LOCATION
      ?auto_1246366 - LOCATION
      ?auto_1246367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1246369 ?auto_1246370 ) ( IN-CITY ?auto_1246359 ?auto_1246370 ) ( not ( = ?auto_1246359 ?auto_1246369 ) ) ( OBJ-AT ?auto_1246365 ?auto_1246369 ) ( OBJ-AT ?auto_1246361 ?auto_1246369 ) ( IN-CITY ?auto_1246368 ?auto_1246370 ) ( not ( = ?auto_1246359 ?auto_1246368 ) ) ( OBJ-AT ?auto_1246364 ?auto_1246368 ) ( IN-CITY ?auto_1246366 ?auto_1246370 ) ( not ( = ?auto_1246359 ?auto_1246366 ) ) ( OBJ-AT ?auto_1246362 ?auto_1246366 ) ( OBJ-AT ?auto_1246363 ?auto_1246368 ) ( OBJ-AT ?auto_1246360 ?auto_1246368 ) ( TRUCK-AT ?auto_1246367 ?auto_1246359 ) ( not ( = ?auto_1246360 ?auto_1246363 ) ) ( not ( = ?auto_1246360 ?auto_1246362 ) ) ( not ( = ?auto_1246363 ?auto_1246362 ) ) ( not ( = ?auto_1246366 ?auto_1246368 ) ) ( not ( = ?auto_1246360 ?auto_1246364 ) ) ( not ( = ?auto_1246363 ?auto_1246364 ) ) ( not ( = ?auto_1246362 ?auto_1246364 ) ) ( not ( = ?auto_1246360 ?auto_1246361 ) ) ( not ( = ?auto_1246363 ?auto_1246361 ) ) ( not ( = ?auto_1246362 ?auto_1246361 ) ) ( not ( = ?auto_1246364 ?auto_1246361 ) ) ( not ( = ?auto_1246369 ?auto_1246368 ) ) ( not ( = ?auto_1246369 ?auto_1246366 ) ) ( not ( = ?auto_1246360 ?auto_1246365 ) ) ( not ( = ?auto_1246363 ?auto_1246365 ) ) ( not ( = ?auto_1246362 ?auto_1246365 ) ) ( not ( = ?auto_1246364 ?auto_1246365 ) ) ( not ( = ?auto_1246361 ?auto_1246365 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1246360 ?auto_1246363 ?auto_1246362 ?auto_1246361 ?auto_1246364 ?auto_1246365 ?auto_1246359 )
      ( DELIVER-6PKG-VERIFY ?auto_1246360 ?auto_1246361 ?auto_1246362 ?auto_1246363 ?auto_1246364 ?auto_1246365 ?auto_1246359 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1246424 - OBJ
      ?auto_1246425 - OBJ
      ?auto_1246426 - OBJ
      ?auto_1246427 - OBJ
      ?auto_1246428 - OBJ
      ?auto_1246429 - OBJ
      ?auto_1246423 - LOCATION
    )
    :vars
    (
      ?auto_1246433 - LOCATION
      ?auto_1246434 - CITY
      ?auto_1246432 - LOCATION
      ?auto_1246430 - LOCATION
      ?auto_1246431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1246433 ?auto_1246434 ) ( IN-CITY ?auto_1246423 ?auto_1246434 ) ( not ( = ?auto_1246423 ?auto_1246433 ) ) ( OBJ-AT ?auto_1246428 ?auto_1246433 ) ( OBJ-AT ?auto_1246425 ?auto_1246433 ) ( IN-CITY ?auto_1246432 ?auto_1246434 ) ( not ( = ?auto_1246423 ?auto_1246432 ) ) ( OBJ-AT ?auto_1246429 ?auto_1246432 ) ( IN-CITY ?auto_1246430 ?auto_1246434 ) ( not ( = ?auto_1246423 ?auto_1246430 ) ) ( OBJ-AT ?auto_1246426 ?auto_1246430 ) ( OBJ-AT ?auto_1246427 ?auto_1246432 ) ( OBJ-AT ?auto_1246424 ?auto_1246432 ) ( TRUCK-AT ?auto_1246431 ?auto_1246423 ) ( not ( = ?auto_1246424 ?auto_1246427 ) ) ( not ( = ?auto_1246424 ?auto_1246426 ) ) ( not ( = ?auto_1246427 ?auto_1246426 ) ) ( not ( = ?auto_1246430 ?auto_1246432 ) ) ( not ( = ?auto_1246424 ?auto_1246429 ) ) ( not ( = ?auto_1246427 ?auto_1246429 ) ) ( not ( = ?auto_1246426 ?auto_1246429 ) ) ( not ( = ?auto_1246424 ?auto_1246425 ) ) ( not ( = ?auto_1246427 ?auto_1246425 ) ) ( not ( = ?auto_1246426 ?auto_1246425 ) ) ( not ( = ?auto_1246429 ?auto_1246425 ) ) ( not ( = ?auto_1246433 ?auto_1246432 ) ) ( not ( = ?auto_1246433 ?auto_1246430 ) ) ( not ( = ?auto_1246424 ?auto_1246428 ) ) ( not ( = ?auto_1246427 ?auto_1246428 ) ) ( not ( = ?auto_1246426 ?auto_1246428 ) ) ( not ( = ?auto_1246429 ?auto_1246428 ) ) ( not ( = ?auto_1246425 ?auto_1246428 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1246424 ?auto_1246427 ?auto_1246426 ?auto_1246425 ?auto_1246429 ?auto_1246428 ?auto_1246423 )
      ( DELIVER-6PKG-VERIFY ?auto_1246424 ?auto_1246425 ?auto_1246426 ?auto_1246427 ?auto_1246428 ?auto_1246429 ?auto_1246423 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1247014 - OBJ
      ?auto_1247015 - OBJ
      ?auto_1247016 - OBJ
      ?auto_1247017 - OBJ
      ?auto_1247018 - OBJ
      ?auto_1247019 - OBJ
      ?auto_1247013 - LOCATION
    )
    :vars
    (
      ?auto_1247023 - LOCATION
      ?auto_1247024 - CITY
      ?auto_1247022 - LOCATION
      ?auto_1247020 - LOCATION
      ?auto_1247021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1247023 ?auto_1247024 ) ( IN-CITY ?auto_1247013 ?auto_1247024 ) ( not ( = ?auto_1247013 ?auto_1247023 ) ) ( OBJ-AT ?auto_1247017 ?auto_1247023 ) ( OBJ-AT ?auto_1247015 ?auto_1247023 ) ( IN-CITY ?auto_1247022 ?auto_1247024 ) ( not ( = ?auto_1247013 ?auto_1247022 ) ) ( OBJ-AT ?auto_1247019 ?auto_1247022 ) ( IN-CITY ?auto_1247020 ?auto_1247024 ) ( not ( = ?auto_1247013 ?auto_1247020 ) ) ( OBJ-AT ?auto_1247016 ?auto_1247020 ) ( OBJ-AT ?auto_1247018 ?auto_1247022 ) ( OBJ-AT ?auto_1247014 ?auto_1247022 ) ( TRUCK-AT ?auto_1247021 ?auto_1247013 ) ( not ( = ?auto_1247014 ?auto_1247018 ) ) ( not ( = ?auto_1247014 ?auto_1247016 ) ) ( not ( = ?auto_1247018 ?auto_1247016 ) ) ( not ( = ?auto_1247020 ?auto_1247022 ) ) ( not ( = ?auto_1247014 ?auto_1247019 ) ) ( not ( = ?auto_1247018 ?auto_1247019 ) ) ( not ( = ?auto_1247016 ?auto_1247019 ) ) ( not ( = ?auto_1247014 ?auto_1247015 ) ) ( not ( = ?auto_1247018 ?auto_1247015 ) ) ( not ( = ?auto_1247016 ?auto_1247015 ) ) ( not ( = ?auto_1247019 ?auto_1247015 ) ) ( not ( = ?auto_1247023 ?auto_1247022 ) ) ( not ( = ?auto_1247023 ?auto_1247020 ) ) ( not ( = ?auto_1247014 ?auto_1247017 ) ) ( not ( = ?auto_1247018 ?auto_1247017 ) ) ( not ( = ?auto_1247016 ?auto_1247017 ) ) ( not ( = ?auto_1247019 ?auto_1247017 ) ) ( not ( = ?auto_1247015 ?auto_1247017 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1247014 ?auto_1247018 ?auto_1247016 ?auto_1247015 ?auto_1247019 ?auto_1247017 ?auto_1247013 )
      ( DELIVER-6PKG-VERIFY ?auto_1247014 ?auto_1247015 ?auto_1247016 ?auto_1247017 ?auto_1247018 ?auto_1247019 ?auto_1247013 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1250539 - OBJ
      ?auto_1250540 - OBJ
      ?auto_1250541 - OBJ
      ?auto_1250542 - OBJ
      ?auto_1250543 - OBJ
      ?auto_1250544 - OBJ
      ?auto_1250538 - LOCATION
    )
    :vars
    (
      ?auto_1250548 - LOCATION
      ?auto_1250549 - CITY
      ?auto_1250547 - LOCATION
      ?auto_1250545 - LOCATION
      ?auto_1250546 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1250548 ?auto_1250549 ) ( IN-CITY ?auto_1250538 ?auto_1250549 ) ( not ( = ?auto_1250538 ?auto_1250548 ) ) ( OBJ-AT ?auto_1250541 ?auto_1250548 ) ( OBJ-AT ?auto_1250540 ?auto_1250548 ) ( IN-CITY ?auto_1250547 ?auto_1250549 ) ( not ( = ?auto_1250538 ?auto_1250547 ) ) ( OBJ-AT ?auto_1250544 ?auto_1250547 ) ( IN-CITY ?auto_1250545 ?auto_1250549 ) ( not ( = ?auto_1250538 ?auto_1250545 ) ) ( OBJ-AT ?auto_1250543 ?auto_1250545 ) ( OBJ-AT ?auto_1250542 ?auto_1250547 ) ( OBJ-AT ?auto_1250539 ?auto_1250547 ) ( TRUCK-AT ?auto_1250546 ?auto_1250538 ) ( not ( = ?auto_1250539 ?auto_1250542 ) ) ( not ( = ?auto_1250539 ?auto_1250543 ) ) ( not ( = ?auto_1250542 ?auto_1250543 ) ) ( not ( = ?auto_1250545 ?auto_1250547 ) ) ( not ( = ?auto_1250539 ?auto_1250544 ) ) ( not ( = ?auto_1250542 ?auto_1250544 ) ) ( not ( = ?auto_1250543 ?auto_1250544 ) ) ( not ( = ?auto_1250539 ?auto_1250540 ) ) ( not ( = ?auto_1250542 ?auto_1250540 ) ) ( not ( = ?auto_1250543 ?auto_1250540 ) ) ( not ( = ?auto_1250544 ?auto_1250540 ) ) ( not ( = ?auto_1250548 ?auto_1250547 ) ) ( not ( = ?auto_1250548 ?auto_1250545 ) ) ( not ( = ?auto_1250539 ?auto_1250541 ) ) ( not ( = ?auto_1250542 ?auto_1250541 ) ) ( not ( = ?auto_1250543 ?auto_1250541 ) ) ( not ( = ?auto_1250544 ?auto_1250541 ) ) ( not ( = ?auto_1250540 ?auto_1250541 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1250539 ?auto_1250542 ?auto_1250543 ?auto_1250540 ?auto_1250544 ?auto_1250541 ?auto_1250538 )
      ( DELIVER-6PKG-VERIFY ?auto_1250539 ?auto_1250540 ?auto_1250541 ?auto_1250542 ?auto_1250543 ?auto_1250544 ?auto_1250538 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1250603 - OBJ
      ?auto_1250604 - OBJ
      ?auto_1250605 - OBJ
      ?auto_1250606 - OBJ
      ?auto_1250607 - OBJ
      ?auto_1250608 - OBJ
      ?auto_1250602 - LOCATION
    )
    :vars
    (
      ?auto_1250612 - LOCATION
      ?auto_1250613 - CITY
      ?auto_1250611 - LOCATION
      ?auto_1250609 - LOCATION
      ?auto_1250610 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1250612 ?auto_1250613 ) ( IN-CITY ?auto_1250602 ?auto_1250613 ) ( not ( = ?auto_1250602 ?auto_1250612 ) ) ( OBJ-AT ?auto_1250605 ?auto_1250612 ) ( OBJ-AT ?auto_1250604 ?auto_1250612 ) ( IN-CITY ?auto_1250611 ?auto_1250613 ) ( not ( = ?auto_1250602 ?auto_1250611 ) ) ( OBJ-AT ?auto_1250607 ?auto_1250611 ) ( IN-CITY ?auto_1250609 ?auto_1250613 ) ( not ( = ?auto_1250602 ?auto_1250609 ) ) ( OBJ-AT ?auto_1250608 ?auto_1250609 ) ( OBJ-AT ?auto_1250606 ?auto_1250611 ) ( OBJ-AT ?auto_1250603 ?auto_1250611 ) ( TRUCK-AT ?auto_1250610 ?auto_1250602 ) ( not ( = ?auto_1250603 ?auto_1250606 ) ) ( not ( = ?auto_1250603 ?auto_1250608 ) ) ( not ( = ?auto_1250606 ?auto_1250608 ) ) ( not ( = ?auto_1250609 ?auto_1250611 ) ) ( not ( = ?auto_1250603 ?auto_1250607 ) ) ( not ( = ?auto_1250606 ?auto_1250607 ) ) ( not ( = ?auto_1250608 ?auto_1250607 ) ) ( not ( = ?auto_1250603 ?auto_1250604 ) ) ( not ( = ?auto_1250606 ?auto_1250604 ) ) ( not ( = ?auto_1250608 ?auto_1250604 ) ) ( not ( = ?auto_1250607 ?auto_1250604 ) ) ( not ( = ?auto_1250612 ?auto_1250611 ) ) ( not ( = ?auto_1250612 ?auto_1250609 ) ) ( not ( = ?auto_1250603 ?auto_1250605 ) ) ( not ( = ?auto_1250606 ?auto_1250605 ) ) ( not ( = ?auto_1250608 ?auto_1250605 ) ) ( not ( = ?auto_1250607 ?auto_1250605 ) ) ( not ( = ?auto_1250604 ?auto_1250605 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1250603 ?auto_1250606 ?auto_1250608 ?auto_1250604 ?auto_1250607 ?auto_1250605 ?auto_1250602 )
      ( DELIVER-6PKG-VERIFY ?auto_1250603 ?auto_1250604 ?auto_1250605 ?auto_1250606 ?auto_1250607 ?auto_1250608 ?auto_1250602 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1250939 - OBJ
      ?auto_1250940 - OBJ
      ?auto_1250941 - OBJ
      ?auto_1250942 - OBJ
      ?auto_1250943 - OBJ
      ?auto_1250944 - OBJ
      ?auto_1250938 - LOCATION
    )
    :vars
    (
      ?auto_1250948 - LOCATION
      ?auto_1250949 - CITY
      ?auto_1250947 - LOCATION
      ?auto_1250945 - LOCATION
      ?auto_1250946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1250948 ?auto_1250949 ) ( IN-CITY ?auto_1250938 ?auto_1250949 ) ( not ( = ?auto_1250938 ?auto_1250948 ) ) ( OBJ-AT ?auto_1250941 ?auto_1250948 ) ( OBJ-AT ?auto_1250940 ?auto_1250948 ) ( IN-CITY ?auto_1250947 ?auto_1250949 ) ( not ( = ?auto_1250938 ?auto_1250947 ) ) ( OBJ-AT ?auto_1250944 ?auto_1250947 ) ( IN-CITY ?auto_1250945 ?auto_1250949 ) ( not ( = ?auto_1250938 ?auto_1250945 ) ) ( OBJ-AT ?auto_1250942 ?auto_1250945 ) ( OBJ-AT ?auto_1250943 ?auto_1250947 ) ( OBJ-AT ?auto_1250939 ?auto_1250947 ) ( TRUCK-AT ?auto_1250946 ?auto_1250938 ) ( not ( = ?auto_1250939 ?auto_1250943 ) ) ( not ( = ?auto_1250939 ?auto_1250942 ) ) ( not ( = ?auto_1250943 ?auto_1250942 ) ) ( not ( = ?auto_1250945 ?auto_1250947 ) ) ( not ( = ?auto_1250939 ?auto_1250944 ) ) ( not ( = ?auto_1250943 ?auto_1250944 ) ) ( not ( = ?auto_1250942 ?auto_1250944 ) ) ( not ( = ?auto_1250939 ?auto_1250940 ) ) ( not ( = ?auto_1250943 ?auto_1250940 ) ) ( not ( = ?auto_1250942 ?auto_1250940 ) ) ( not ( = ?auto_1250944 ?auto_1250940 ) ) ( not ( = ?auto_1250948 ?auto_1250947 ) ) ( not ( = ?auto_1250948 ?auto_1250945 ) ) ( not ( = ?auto_1250939 ?auto_1250941 ) ) ( not ( = ?auto_1250943 ?auto_1250941 ) ) ( not ( = ?auto_1250942 ?auto_1250941 ) ) ( not ( = ?auto_1250944 ?auto_1250941 ) ) ( not ( = ?auto_1250940 ?auto_1250941 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1250939 ?auto_1250943 ?auto_1250942 ?auto_1250940 ?auto_1250944 ?auto_1250941 ?auto_1250938 )
      ( DELIVER-6PKG-VERIFY ?auto_1250939 ?auto_1250940 ?auto_1250941 ?auto_1250942 ?auto_1250943 ?auto_1250944 ?auto_1250938 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1336106 - OBJ
      ?auto_1336107 - OBJ
      ?auto_1336108 - OBJ
      ?auto_1336109 - OBJ
      ?auto_1336110 - OBJ
      ?auto_1336111 - OBJ
      ?auto_1336105 - LOCATION
    )
    :vars
    (
      ?auto_1336115 - LOCATION
      ?auto_1336116 - CITY
      ?auto_1336114 - LOCATION
      ?auto_1336112 - LOCATION
      ?auto_1336113 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1336115 ?auto_1336116 ) ( IN-CITY ?auto_1336105 ?auto_1336116 ) ( not ( = ?auto_1336105 ?auto_1336115 ) ) ( OBJ-AT ?auto_1336111 ?auto_1336115 ) ( OBJ-AT ?auto_1336110 ?auto_1336115 ) ( IN-CITY ?auto_1336114 ?auto_1336116 ) ( not ( = ?auto_1336105 ?auto_1336114 ) ) ( OBJ-AT ?auto_1336109 ?auto_1336114 ) ( IN-CITY ?auto_1336112 ?auto_1336116 ) ( not ( = ?auto_1336105 ?auto_1336112 ) ) ( OBJ-AT ?auto_1336106 ?auto_1336112 ) ( OBJ-AT ?auto_1336108 ?auto_1336114 ) ( OBJ-AT ?auto_1336107 ?auto_1336114 ) ( TRUCK-AT ?auto_1336113 ?auto_1336105 ) ( not ( = ?auto_1336107 ?auto_1336108 ) ) ( not ( = ?auto_1336107 ?auto_1336106 ) ) ( not ( = ?auto_1336108 ?auto_1336106 ) ) ( not ( = ?auto_1336112 ?auto_1336114 ) ) ( not ( = ?auto_1336107 ?auto_1336109 ) ) ( not ( = ?auto_1336108 ?auto_1336109 ) ) ( not ( = ?auto_1336106 ?auto_1336109 ) ) ( not ( = ?auto_1336107 ?auto_1336110 ) ) ( not ( = ?auto_1336108 ?auto_1336110 ) ) ( not ( = ?auto_1336106 ?auto_1336110 ) ) ( not ( = ?auto_1336109 ?auto_1336110 ) ) ( not ( = ?auto_1336115 ?auto_1336114 ) ) ( not ( = ?auto_1336115 ?auto_1336112 ) ) ( not ( = ?auto_1336107 ?auto_1336111 ) ) ( not ( = ?auto_1336108 ?auto_1336111 ) ) ( not ( = ?auto_1336106 ?auto_1336111 ) ) ( not ( = ?auto_1336109 ?auto_1336111 ) ) ( not ( = ?auto_1336110 ?auto_1336111 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1336107 ?auto_1336108 ?auto_1336106 ?auto_1336110 ?auto_1336109 ?auto_1336111 ?auto_1336105 )
      ( DELIVER-6PKG-VERIFY ?auto_1336106 ?auto_1336107 ?auto_1336108 ?auto_1336109 ?auto_1336110 ?auto_1336111 ?auto_1336105 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1336229 - OBJ
      ?auto_1336230 - OBJ
      ?auto_1336231 - OBJ
      ?auto_1336232 - OBJ
      ?auto_1336233 - OBJ
      ?auto_1336234 - OBJ
      ?auto_1336228 - LOCATION
    )
    :vars
    (
      ?auto_1336238 - LOCATION
      ?auto_1336239 - CITY
      ?auto_1336237 - LOCATION
      ?auto_1336235 - LOCATION
      ?auto_1336236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1336238 ?auto_1336239 ) ( IN-CITY ?auto_1336228 ?auto_1336239 ) ( not ( = ?auto_1336228 ?auto_1336238 ) ) ( OBJ-AT ?auto_1336234 ?auto_1336238 ) ( OBJ-AT ?auto_1336232 ?auto_1336238 ) ( IN-CITY ?auto_1336237 ?auto_1336239 ) ( not ( = ?auto_1336228 ?auto_1336237 ) ) ( OBJ-AT ?auto_1336233 ?auto_1336237 ) ( IN-CITY ?auto_1336235 ?auto_1336239 ) ( not ( = ?auto_1336228 ?auto_1336235 ) ) ( OBJ-AT ?auto_1336229 ?auto_1336235 ) ( OBJ-AT ?auto_1336231 ?auto_1336237 ) ( OBJ-AT ?auto_1336230 ?auto_1336237 ) ( TRUCK-AT ?auto_1336236 ?auto_1336228 ) ( not ( = ?auto_1336230 ?auto_1336231 ) ) ( not ( = ?auto_1336230 ?auto_1336229 ) ) ( not ( = ?auto_1336231 ?auto_1336229 ) ) ( not ( = ?auto_1336235 ?auto_1336237 ) ) ( not ( = ?auto_1336230 ?auto_1336233 ) ) ( not ( = ?auto_1336231 ?auto_1336233 ) ) ( not ( = ?auto_1336229 ?auto_1336233 ) ) ( not ( = ?auto_1336230 ?auto_1336232 ) ) ( not ( = ?auto_1336231 ?auto_1336232 ) ) ( not ( = ?auto_1336229 ?auto_1336232 ) ) ( not ( = ?auto_1336233 ?auto_1336232 ) ) ( not ( = ?auto_1336238 ?auto_1336237 ) ) ( not ( = ?auto_1336238 ?auto_1336235 ) ) ( not ( = ?auto_1336230 ?auto_1336234 ) ) ( not ( = ?auto_1336231 ?auto_1336234 ) ) ( not ( = ?auto_1336229 ?auto_1336234 ) ) ( not ( = ?auto_1336233 ?auto_1336234 ) ) ( not ( = ?auto_1336232 ?auto_1336234 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1336230 ?auto_1336231 ?auto_1336229 ?auto_1336232 ?auto_1336233 ?auto_1336234 ?auto_1336228 )
      ( DELIVER-6PKG-VERIFY ?auto_1336229 ?auto_1336230 ?auto_1336231 ?auto_1336232 ?auto_1336233 ?auto_1336234 ?auto_1336228 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1336293 - OBJ
      ?auto_1336294 - OBJ
      ?auto_1336295 - OBJ
      ?auto_1336296 - OBJ
      ?auto_1336297 - OBJ
      ?auto_1336298 - OBJ
      ?auto_1336292 - LOCATION
    )
    :vars
    (
      ?auto_1336302 - LOCATION
      ?auto_1336303 - CITY
      ?auto_1336301 - LOCATION
      ?auto_1336299 - LOCATION
      ?auto_1336300 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1336302 ?auto_1336303 ) ( IN-CITY ?auto_1336292 ?auto_1336303 ) ( not ( = ?auto_1336292 ?auto_1336302 ) ) ( OBJ-AT ?auto_1336297 ?auto_1336302 ) ( OBJ-AT ?auto_1336296 ?auto_1336302 ) ( IN-CITY ?auto_1336301 ?auto_1336303 ) ( not ( = ?auto_1336292 ?auto_1336301 ) ) ( OBJ-AT ?auto_1336298 ?auto_1336301 ) ( IN-CITY ?auto_1336299 ?auto_1336303 ) ( not ( = ?auto_1336292 ?auto_1336299 ) ) ( OBJ-AT ?auto_1336293 ?auto_1336299 ) ( OBJ-AT ?auto_1336295 ?auto_1336301 ) ( OBJ-AT ?auto_1336294 ?auto_1336301 ) ( TRUCK-AT ?auto_1336300 ?auto_1336292 ) ( not ( = ?auto_1336294 ?auto_1336295 ) ) ( not ( = ?auto_1336294 ?auto_1336293 ) ) ( not ( = ?auto_1336295 ?auto_1336293 ) ) ( not ( = ?auto_1336299 ?auto_1336301 ) ) ( not ( = ?auto_1336294 ?auto_1336298 ) ) ( not ( = ?auto_1336295 ?auto_1336298 ) ) ( not ( = ?auto_1336293 ?auto_1336298 ) ) ( not ( = ?auto_1336294 ?auto_1336296 ) ) ( not ( = ?auto_1336295 ?auto_1336296 ) ) ( not ( = ?auto_1336293 ?auto_1336296 ) ) ( not ( = ?auto_1336298 ?auto_1336296 ) ) ( not ( = ?auto_1336302 ?auto_1336301 ) ) ( not ( = ?auto_1336302 ?auto_1336299 ) ) ( not ( = ?auto_1336294 ?auto_1336297 ) ) ( not ( = ?auto_1336295 ?auto_1336297 ) ) ( not ( = ?auto_1336293 ?auto_1336297 ) ) ( not ( = ?auto_1336298 ?auto_1336297 ) ) ( not ( = ?auto_1336296 ?auto_1336297 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1336294 ?auto_1336295 ?auto_1336293 ?auto_1336296 ?auto_1336298 ?auto_1336297 ?auto_1336292 )
      ( DELIVER-6PKG-VERIFY ?auto_1336293 ?auto_1336294 ?auto_1336295 ?auto_1336296 ?auto_1336297 ?auto_1336298 ?auto_1336292 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1339451 - OBJ
      ?auto_1339452 - OBJ
      ?auto_1339453 - OBJ
      ?auto_1339454 - OBJ
      ?auto_1339455 - OBJ
      ?auto_1339456 - OBJ
      ?auto_1339450 - LOCATION
    )
    :vars
    (
      ?auto_1339460 - LOCATION
      ?auto_1339461 - CITY
      ?auto_1339459 - LOCATION
      ?auto_1339457 - LOCATION
      ?auto_1339458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1339460 ?auto_1339461 ) ( IN-CITY ?auto_1339450 ?auto_1339461 ) ( not ( = ?auto_1339450 ?auto_1339460 ) ) ( OBJ-AT ?auto_1339456 ?auto_1339460 ) ( OBJ-AT ?auto_1339453 ?auto_1339460 ) ( IN-CITY ?auto_1339459 ?auto_1339461 ) ( not ( = ?auto_1339450 ?auto_1339459 ) ) ( OBJ-AT ?auto_1339455 ?auto_1339459 ) ( IN-CITY ?auto_1339457 ?auto_1339461 ) ( not ( = ?auto_1339450 ?auto_1339457 ) ) ( OBJ-AT ?auto_1339451 ?auto_1339457 ) ( OBJ-AT ?auto_1339454 ?auto_1339459 ) ( OBJ-AT ?auto_1339452 ?auto_1339459 ) ( TRUCK-AT ?auto_1339458 ?auto_1339450 ) ( not ( = ?auto_1339452 ?auto_1339454 ) ) ( not ( = ?auto_1339452 ?auto_1339451 ) ) ( not ( = ?auto_1339454 ?auto_1339451 ) ) ( not ( = ?auto_1339457 ?auto_1339459 ) ) ( not ( = ?auto_1339452 ?auto_1339455 ) ) ( not ( = ?auto_1339454 ?auto_1339455 ) ) ( not ( = ?auto_1339451 ?auto_1339455 ) ) ( not ( = ?auto_1339452 ?auto_1339453 ) ) ( not ( = ?auto_1339454 ?auto_1339453 ) ) ( not ( = ?auto_1339451 ?auto_1339453 ) ) ( not ( = ?auto_1339455 ?auto_1339453 ) ) ( not ( = ?auto_1339460 ?auto_1339459 ) ) ( not ( = ?auto_1339460 ?auto_1339457 ) ) ( not ( = ?auto_1339452 ?auto_1339456 ) ) ( not ( = ?auto_1339454 ?auto_1339456 ) ) ( not ( = ?auto_1339451 ?auto_1339456 ) ) ( not ( = ?auto_1339455 ?auto_1339456 ) ) ( not ( = ?auto_1339453 ?auto_1339456 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1339452 ?auto_1339454 ?auto_1339451 ?auto_1339453 ?auto_1339455 ?auto_1339456 ?auto_1339450 )
      ( DELIVER-6PKG-VERIFY ?auto_1339451 ?auto_1339452 ?auto_1339453 ?auto_1339454 ?auto_1339455 ?auto_1339456 ?auto_1339450 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1339515 - OBJ
      ?auto_1339516 - OBJ
      ?auto_1339517 - OBJ
      ?auto_1339518 - OBJ
      ?auto_1339519 - OBJ
      ?auto_1339520 - OBJ
      ?auto_1339514 - LOCATION
    )
    :vars
    (
      ?auto_1339524 - LOCATION
      ?auto_1339525 - CITY
      ?auto_1339523 - LOCATION
      ?auto_1339521 - LOCATION
      ?auto_1339522 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1339524 ?auto_1339525 ) ( IN-CITY ?auto_1339514 ?auto_1339525 ) ( not ( = ?auto_1339514 ?auto_1339524 ) ) ( OBJ-AT ?auto_1339519 ?auto_1339524 ) ( OBJ-AT ?auto_1339517 ?auto_1339524 ) ( IN-CITY ?auto_1339523 ?auto_1339525 ) ( not ( = ?auto_1339514 ?auto_1339523 ) ) ( OBJ-AT ?auto_1339520 ?auto_1339523 ) ( IN-CITY ?auto_1339521 ?auto_1339525 ) ( not ( = ?auto_1339514 ?auto_1339521 ) ) ( OBJ-AT ?auto_1339515 ?auto_1339521 ) ( OBJ-AT ?auto_1339518 ?auto_1339523 ) ( OBJ-AT ?auto_1339516 ?auto_1339523 ) ( TRUCK-AT ?auto_1339522 ?auto_1339514 ) ( not ( = ?auto_1339516 ?auto_1339518 ) ) ( not ( = ?auto_1339516 ?auto_1339515 ) ) ( not ( = ?auto_1339518 ?auto_1339515 ) ) ( not ( = ?auto_1339521 ?auto_1339523 ) ) ( not ( = ?auto_1339516 ?auto_1339520 ) ) ( not ( = ?auto_1339518 ?auto_1339520 ) ) ( not ( = ?auto_1339515 ?auto_1339520 ) ) ( not ( = ?auto_1339516 ?auto_1339517 ) ) ( not ( = ?auto_1339518 ?auto_1339517 ) ) ( not ( = ?auto_1339515 ?auto_1339517 ) ) ( not ( = ?auto_1339520 ?auto_1339517 ) ) ( not ( = ?auto_1339524 ?auto_1339523 ) ) ( not ( = ?auto_1339524 ?auto_1339521 ) ) ( not ( = ?auto_1339516 ?auto_1339519 ) ) ( not ( = ?auto_1339518 ?auto_1339519 ) ) ( not ( = ?auto_1339515 ?auto_1339519 ) ) ( not ( = ?auto_1339520 ?auto_1339519 ) ) ( not ( = ?auto_1339517 ?auto_1339519 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1339516 ?auto_1339518 ?auto_1339515 ?auto_1339517 ?auto_1339520 ?auto_1339519 ?auto_1339514 )
      ( DELIVER-6PKG-VERIFY ?auto_1339515 ?auto_1339516 ?auto_1339517 ?auto_1339518 ?auto_1339519 ?auto_1339520 ?auto_1339514 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1340105 - OBJ
      ?auto_1340106 - OBJ
      ?auto_1340107 - OBJ
      ?auto_1340108 - OBJ
      ?auto_1340109 - OBJ
      ?auto_1340110 - OBJ
      ?auto_1340104 - LOCATION
    )
    :vars
    (
      ?auto_1340114 - LOCATION
      ?auto_1340115 - CITY
      ?auto_1340113 - LOCATION
      ?auto_1340111 - LOCATION
      ?auto_1340112 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1340114 ?auto_1340115 ) ( IN-CITY ?auto_1340104 ?auto_1340115 ) ( not ( = ?auto_1340104 ?auto_1340114 ) ) ( OBJ-AT ?auto_1340108 ?auto_1340114 ) ( OBJ-AT ?auto_1340107 ?auto_1340114 ) ( IN-CITY ?auto_1340113 ?auto_1340115 ) ( not ( = ?auto_1340104 ?auto_1340113 ) ) ( OBJ-AT ?auto_1340110 ?auto_1340113 ) ( IN-CITY ?auto_1340111 ?auto_1340115 ) ( not ( = ?auto_1340104 ?auto_1340111 ) ) ( OBJ-AT ?auto_1340105 ?auto_1340111 ) ( OBJ-AT ?auto_1340109 ?auto_1340113 ) ( OBJ-AT ?auto_1340106 ?auto_1340113 ) ( TRUCK-AT ?auto_1340112 ?auto_1340104 ) ( not ( = ?auto_1340106 ?auto_1340109 ) ) ( not ( = ?auto_1340106 ?auto_1340105 ) ) ( not ( = ?auto_1340109 ?auto_1340105 ) ) ( not ( = ?auto_1340111 ?auto_1340113 ) ) ( not ( = ?auto_1340106 ?auto_1340110 ) ) ( not ( = ?auto_1340109 ?auto_1340110 ) ) ( not ( = ?auto_1340105 ?auto_1340110 ) ) ( not ( = ?auto_1340106 ?auto_1340107 ) ) ( not ( = ?auto_1340109 ?auto_1340107 ) ) ( not ( = ?auto_1340105 ?auto_1340107 ) ) ( not ( = ?auto_1340110 ?auto_1340107 ) ) ( not ( = ?auto_1340114 ?auto_1340113 ) ) ( not ( = ?auto_1340114 ?auto_1340111 ) ) ( not ( = ?auto_1340106 ?auto_1340108 ) ) ( not ( = ?auto_1340109 ?auto_1340108 ) ) ( not ( = ?auto_1340105 ?auto_1340108 ) ) ( not ( = ?auto_1340110 ?auto_1340108 ) ) ( not ( = ?auto_1340107 ?auto_1340108 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1340106 ?auto_1340109 ?auto_1340105 ?auto_1340107 ?auto_1340110 ?auto_1340108 ?auto_1340104 )
      ( DELIVER-6PKG-VERIFY ?auto_1340105 ?auto_1340106 ?auto_1340107 ?auto_1340108 ?auto_1340109 ?auto_1340110 ?auto_1340104 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1371193 - OBJ
      ?auto_1371194 - OBJ
      ?auto_1371195 - OBJ
      ?auto_1371196 - OBJ
      ?auto_1371197 - OBJ
      ?auto_1371198 - OBJ
      ?auto_1371192 - LOCATION
    )
    :vars
    (
      ?auto_1371202 - LOCATION
      ?auto_1371203 - CITY
      ?auto_1371201 - LOCATION
      ?auto_1371199 - LOCATION
      ?auto_1371200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1371202 ?auto_1371203 ) ( IN-CITY ?auto_1371192 ?auto_1371203 ) ( not ( = ?auto_1371192 ?auto_1371202 ) ) ( OBJ-AT ?auto_1371198 ?auto_1371202 ) ( OBJ-AT ?auto_1371194 ?auto_1371202 ) ( IN-CITY ?auto_1371201 ?auto_1371203 ) ( not ( = ?auto_1371192 ?auto_1371201 ) ) ( OBJ-AT ?auto_1371197 ?auto_1371201 ) ( IN-CITY ?auto_1371199 ?auto_1371203 ) ( not ( = ?auto_1371192 ?auto_1371199 ) ) ( OBJ-AT ?auto_1371193 ?auto_1371199 ) ( OBJ-AT ?auto_1371196 ?auto_1371201 ) ( OBJ-AT ?auto_1371195 ?auto_1371201 ) ( TRUCK-AT ?auto_1371200 ?auto_1371192 ) ( not ( = ?auto_1371195 ?auto_1371196 ) ) ( not ( = ?auto_1371195 ?auto_1371193 ) ) ( not ( = ?auto_1371196 ?auto_1371193 ) ) ( not ( = ?auto_1371199 ?auto_1371201 ) ) ( not ( = ?auto_1371195 ?auto_1371197 ) ) ( not ( = ?auto_1371196 ?auto_1371197 ) ) ( not ( = ?auto_1371193 ?auto_1371197 ) ) ( not ( = ?auto_1371195 ?auto_1371194 ) ) ( not ( = ?auto_1371196 ?auto_1371194 ) ) ( not ( = ?auto_1371193 ?auto_1371194 ) ) ( not ( = ?auto_1371197 ?auto_1371194 ) ) ( not ( = ?auto_1371202 ?auto_1371201 ) ) ( not ( = ?auto_1371202 ?auto_1371199 ) ) ( not ( = ?auto_1371195 ?auto_1371198 ) ) ( not ( = ?auto_1371196 ?auto_1371198 ) ) ( not ( = ?auto_1371193 ?auto_1371198 ) ) ( not ( = ?auto_1371197 ?auto_1371198 ) ) ( not ( = ?auto_1371194 ?auto_1371198 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1371195 ?auto_1371196 ?auto_1371193 ?auto_1371194 ?auto_1371197 ?auto_1371198 ?auto_1371192 )
      ( DELIVER-6PKG-VERIFY ?auto_1371193 ?auto_1371194 ?auto_1371195 ?auto_1371196 ?auto_1371197 ?auto_1371198 ?auto_1371192 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1371257 - OBJ
      ?auto_1371258 - OBJ
      ?auto_1371259 - OBJ
      ?auto_1371260 - OBJ
      ?auto_1371261 - OBJ
      ?auto_1371262 - OBJ
      ?auto_1371256 - LOCATION
    )
    :vars
    (
      ?auto_1371266 - LOCATION
      ?auto_1371267 - CITY
      ?auto_1371265 - LOCATION
      ?auto_1371263 - LOCATION
      ?auto_1371264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1371266 ?auto_1371267 ) ( IN-CITY ?auto_1371256 ?auto_1371267 ) ( not ( = ?auto_1371256 ?auto_1371266 ) ) ( OBJ-AT ?auto_1371261 ?auto_1371266 ) ( OBJ-AT ?auto_1371258 ?auto_1371266 ) ( IN-CITY ?auto_1371265 ?auto_1371267 ) ( not ( = ?auto_1371256 ?auto_1371265 ) ) ( OBJ-AT ?auto_1371262 ?auto_1371265 ) ( IN-CITY ?auto_1371263 ?auto_1371267 ) ( not ( = ?auto_1371256 ?auto_1371263 ) ) ( OBJ-AT ?auto_1371257 ?auto_1371263 ) ( OBJ-AT ?auto_1371260 ?auto_1371265 ) ( OBJ-AT ?auto_1371259 ?auto_1371265 ) ( TRUCK-AT ?auto_1371264 ?auto_1371256 ) ( not ( = ?auto_1371259 ?auto_1371260 ) ) ( not ( = ?auto_1371259 ?auto_1371257 ) ) ( not ( = ?auto_1371260 ?auto_1371257 ) ) ( not ( = ?auto_1371263 ?auto_1371265 ) ) ( not ( = ?auto_1371259 ?auto_1371262 ) ) ( not ( = ?auto_1371260 ?auto_1371262 ) ) ( not ( = ?auto_1371257 ?auto_1371262 ) ) ( not ( = ?auto_1371259 ?auto_1371258 ) ) ( not ( = ?auto_1371260 ?auto_1371258 ) ) ( not ( = ?auto_1371257 ?auto_1371258 ) ) ( not ( = ?auto_1371262 ?auto_1371258 ) ) ( not ( = ?auto_1371266 ?auto_1371265 ) ) ( not ( = ?auto_1371266 ?auto_1371263 ) ) ( not ( = ?auto_1371259 ?auto_1371261 ) ) ( not ( = ?auto_1371260 ?auto_1371261 ) ) ( not ( = ?auto_1371257 ?auto_1371261 ) ) ( not ( = ?auto_1371262 ?auto_1371261 ) ) ( not ( = ?auto_1371258 ?auto_1371261 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1371259 ?auto_1371260 ?auto_1371257 ?auto_1371258 ?auto_1371262 ?auto_1371261 ?auto_1371256 )
      ( DELIVER-6PKG-VERIFY ?auto_1371257 ?auto_1371258 ?auto_1371259 ?auto_1371260 ?auto_1371261 ?auto_1371262 ?auto_1371256 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1371847 - OBJ
      ?auto_1371848 - OBJ
      ?auto_1371849 - OBJ
      ?auto_1371850 - OBJ
      ?auto_1371851 - OBJ
      ?auto_1371852 - OBJ
      ?auto_1371846 - LOCATION
    )
    :vars
    (
      ?auto_1371856 - LOCATION
      ?auto_1371857 - CITY
      ?auto_1371855 - LOCATION
      ?auto_1371853 - LOCATION
      ?auto_1371854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1371856 ?auto_1371857 ) ( IN-CITY ?auto_1371846 ?auto_1371857 ) ( not ( = ?auto_1371846 ?auto_1371856 ) ) ( OBJ-AT ?auto_1371850 ?auto_1371856 ) ( OBJ-AT ?auto_1371848 ?auto_1371856 ) ( IN-CITY ?auto_1371855 ?auto_1371857 ) ( not ( = ?auto_1371846 ?auto_1371855 ) ) ( OBJ-AT ?auto_1371852 ?auto_1371855 ) ( IN-CITY ?auto_1371853 ?auto_1371857 ) ( not ( = ?auto_1371846 ?auto_1371853 ) ) ( OBJ-AT ?auto_1371847 ?auto_1371853 ) ( OBJ-AT ?auto_1371851 ?auto_1371855 ) ( OBJ-AT ?auto_1371849 ?auto_1371855 ) ( TRUCK-AT ?auto_1371854 ?auto_1371846 ) ( not ( = ?auto_1371849 ?auto_1371851 ) ) ( not ( = ?auto_1371849 ?auto_1371847 ) ) ( not ( = ?auto_1371851 ?auto_1371847 ) ) ( not ( = ?auto_1371853 ?auto_1371855 ) ) ( not ( = ?auto_1371849 ?auto_1371852 ) ) ( not ( = ?auto_1371851 ?auto_1371852 ) ) ( not ( = ?auto_1371847 ?auto_1371852 ) ) ( not ( = ?auto_1371849 ?auto_1371848 ) ) ( not ( = ?auto_1371851 ?auto_1371848 ) ) ( not ( = ?auto_1371847 ?auto_1371848 ) ) ( not ( = ?auto_1371852 ?auto_1371848 ) ) ( not ( = ?auto_1371856 ?auto_1371855 ) ) ( not ( = ?auto_1371856 ?auto_1371853 ) ) ( not ( = ?auto_1371849 ?auto_1371850 ) ) ( not ( = ?auto_1371851 ?auto_1371850 ) ) ( not ( = ?auto_1371847 ?auto_1371850 ) ) ( not ( = ?auto_1371852 ?auto_1371850 ) ) ( not ( = ?auto_1371848 ?auto_1371850 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1371849 ?auto_1371851 ?auto_1371847 ?auto_1371848 ?auto_1371852 ?auto_1371850 ?auto_1371846 )
      ( DELIVER-6PKG-VERIFY ?auto_1371847 ?auto_1371848 ?auto_1371849 ?auto_1371850 ?auto_1371851 ?auto_1371852 ?auto_1371846 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1377242 - OBJ
      ?auto_1377243 - OBJ
      ?auto_1377244 - OBJ
      ?auto_1377245 - OBJ
      ?auto_1377246 - OBJ
      ?auto_1377247 - OBJ
      ?auto_1377241 - LOCATION
    )
    :vars
    (
      ?auto_1377251 - LOCATION
      ?auto_1377252 - CITY
      ?auto_1377250 - LOCATION
      ?auto_1377248 - LOCATION
      ?auto_1377249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1377251 ?auto_1377252 ) ( IN-CITY ?auto_1377241 ?auto_1377252 ) ( not ( = ?auto_1377241 ?auto_1377251 ) ) ( OBJ-AT ?auto_1377244 ?auto_1377251 ) ( OBJ-AT ?auto_1377243 ?auto_1377251 ) ( IN-CITY ?auto_1377250 ?auto_1377252 ) ( not ( = ?auto_1377241 ?auto_1377250 ) ) ( OBJ-AT ?auto_1377247 ?auto_1377250 ) ( IN-CITY ?auto_1377248 ?auto_1377252 ) ( not ( = ?auto_1377241 ?auto_1377248 ) ) ( OBJ-AT ?auto_1377242 ?auto_1377248 ) ( OBJ-AT ?auto_1377246 ?auto_1377250 ) ( OBJ-AT ?auto_1377245 ?auto_1377250 ) ( TRUCK-AT ?auto_1377249 ?auto_1377241 ) ( not ( = ?auto_1377245 ?auto_1377246 ) ) ( not ( = ?auto_1377245 ?auto_1377242 ) ) ( not ( = ?auto_1377246 ?auto_1377242 ) ) ( not ( = ?auto_1377248 ?auto_1377250 ) ) ( not ( = ?auto_1377245 ?auto_1377247 ) ) ( not ( = ?auto_1377246 ?auto_1377247 ) ) ( not ( = ?auto_1377242 ?auto_1377247 ) ) ( not ( = ?auto_1377245 ?auto_1377243 ) ) ( not ( = ?auto_1377246 ?auto_1377243 ) ) ( not ( = ?auto_1377242 ?auto_1377243 ) ) ( not ( = ?auto_1377247 ?auto_1377243 ) ) ( not ( = ?auto_1377251 ?auto_1377250 ) ) ( not ( = ?auto_1377251 ?auto_1377248 ) ) ( not ( = ?auto_1377245 ?auto_1377244 ) ) ( not ( = ?auto_1377246 ?auto_1377244 ) ) ( not ( = ?auto_1377242 ?auto_1377244 ) ) ( not ( = ?auto_1377247 ?auto_1377244 ) ) ( not ( = ?auto_1377243 ?auto_1377244 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1377245 ?auto_1377246 ?auto_1377242 ?auto_1377243 ?auto_1377247 ?auto_1377244 ?auto_1377241 )
      ( DELIVER-6PKG-VERIFY ?auto_1377242 ?auto_1377243 ?auto_1377244 ?auto_1377245 ?auto_1377246 ?auto_1377247 ?auto_1377241 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1463225 - OBJ
      ?auto_1463226 - OBJ
      ?auto_1463227 - OBJ
      ?auto_1463228 - OBJ
      ?auto_1463229 - OBJ
      ?auto_1463230 - OBJ
      ?auto_1463224 - LOCATION
    )
    :vars
    (
      ?auto_1463234 - LOCATION
      ?auto_1463235 - CITY
      ?auto_1463233 - LOCATION
      ?auto_1463231 - LOCATION
      ?auto_1463232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1463234 ?auto_1463235 ) ( IN-CITY ?auto_1463224 ?auto_1463235 ) ( not ( = ?auto_1463224 ?auto_1463234 ) ) ( OBJ-AT ?auto_1463230 ?auto_1463234 ) ( OBJ-AT ?auto_1463225 ?auto_1463234 ) ( IN-CITY ?auto_1463233 ?auto_1463235 ) ( not ( = ?auto_1463224 ?auto_1463233 ) ) ( OBJ-AT ?auto_1463229 ?auto_1463233 ) ( IN-CITY ?auto_1463231 ?auto_1463235 ) ( not ( = ?auto_1463224 ?auto_1463231 ) ) ( OBJ-AT ?auto_1463228 ?auto_1463231 ) ( OBJ-AT ?auto_1463227 ?auto_1463233 ) ( OBJ-AT ?auto_1463226 ?auto_1463233 ) ( TRUCK-AT ?auto_1463232 ?auto_1463224 ) ( not ( = ?auto_1463226 ?auto_1463227 ) ) ( not ( = ?auto_1463226 ?auto_1463228 ) ) ( not ( = ?auto_1463227 ?auto_1463228 ) ) ( not ( = ?auto_1463231 ?auto_1463233 ) ) ( not ( = ?auto_1463226 ?auto_1463229 ) ) ( not ( = ?auto_1463227 ?auto_1463229 ) ) ( not ( = ?auto_1463228 ?auto_1463229 ) ) ( not ( = ?auto_1463226 ?auto_1463225 ) ) ( not ( = ?auto_1463227 ?auto_1463225 ) ) ( not ( = ?auto_1463228 ?auto_1463225 ) ) ( not ( = ?auto_1463229 ?auto_1463225 ) ) ( not ( = ?auto_1463234 ?auto_1463233 ) ) ( not ( = ?auto_1463234 ?auto_1463231 ) ) ( not ( = ?auto_1463226 ?auto_1463230 ) ) ( not ( = ?auto_1463227 ?auto_1463230 ) ) ( not ( = ?auto_1463228 ?auto_1463230 ) ) ( not ( = ?auto_1463229 ?auto_1463230 ) ) ( not ( = ?auto_1463225 ?auto_1463230 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1463226 ?auto_1463227 ?auto_1463228 ?auto_1463225 ?auto_1463229 ?auto_1463230 ?auto_1463224 )
      ( DELIVER-6PKG-VERIFY ?auto_1463225 ?auto_1463226 ?auto_1463227 ?auto_1463228 ?auto_1463229 ?auto_1463230 ?auto_1463224 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1463289 - OBJ
      ?auto_1463290 - OBJ
      ?auto_1463291 - OBJ
      ?auto_1463292 - OBJ
      ?auto_1463293 - OBJ
      ?auto_1463294 - OBJ
      ?auto_1463288 - LOCATION
    )
    :vars
    (
      ?auto_1463298 - LOCATION
      ?auto_1463299 - CITY
      ?auto_1463297 - LOCATION
      ?auto_1463295 - LOCATION
      ?auto_1463296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1463298 ?auto_1463299 ) ( IN-CITY ?auto_1463288 ?auto_1463299 ) ( not ( = ?auto_1463288 ?auto_1463298 ) ) ( OBJ-AT ?auto_1463293 ?auto_1463298 ) ( OBJ-AT ?auto_1463289 ?auto_1463298 ) ( IN-CITY ?auto_1463297 ?auto_1463299 ) ( not ( = ?auto_1463288 ?auto_1463297 ) ) ( OBJ-AT ?auto_1463294 ?auto_1463297 ) ( IN-CITY ?auto_1463295 ?auto_1463299 ) ( not ( = ?auto_1463288 ?auto_1463295 ) ) ( OBJ-AT ?auto_1463292 ?auto_1463295 ) ( OBJ-AT ?auto_1463291 ?auto_1463297 ) ( OBJ-AT ?auto_1463290 ?auto_1463297 ) ( TRUCK-AT ?auto_1463296 ?auto_1463288 ) ( not ( = ?auto_1463290 ?auto_1463291 ) ) ( not ( = ?auto_1463290 ?auto_1463292 ) ) ( not ( = ?auto_1463291 ?auto_1463292 ) ) ( not ( = ?auto_1463295 ?auto_1463297 ) ) ( not ( = ?auto_1463290 ?auto_1463294 ) ) ( not ( = ?auto_1463291 ?auto_1463294 ) ) ( not ( = ?auto_1463292 ?auto_1463294 ) ) ( not ( = ?auto_1463290 ?auto_1463289 ) ) ( not ( = ?auto_1463291 ?auto_1463289 ) ) ( not ( = ?auto_1463292 ?auto_1463289 ) ) ( not ( = ?auto_1463294 ?auto_1463289 ) ) ( not ( = ?auto_1463298 ?auto_1463297 ) ) ( not ( = ?auto_1463298 ?auto_1463295 ) ) ( not ( = ?auto_1463290 ?auto_1463293 ) ) ( not ( = ?auto_1463291 ?auto_1463293 ) ) ( not ( = ?auto_1463292 ?auto_1463293 ) ) ( not ( = ?auto_1463294 ?auto_1463293 ) ) ( not ( = ?auto_1463289 ?auto_1463293 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1463290 ?auto_1463291 ?auto_1463292 ?auto_1463289 ?auto_1463294 ?auto_1463293 ?auto_1463288 )
      ( DELIVER-6PKG-VERIFY ?auto_1463289 ?auto_1463290 ?auto_1463291 ?auto_1463292 ?auto_1463293 ?auto_1463294 ?auto_1463288 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1463353 - OBJ
      ?auto_1463354 - OBJ
      ?auto_1463355 - OBJ
      ?auto_1463356 - OBJ
      ?auto_1463357 - OBJ
      ?auto_1463358 - OBJ
      ?auto_1463352 - LOCATION
    )
    :vars
    (
      ?auto_1463362 - LOCATION
      ?auto_1463363 - CITY
      ?auto_1463361 - LOCATION
      ?auto_1463359 - LOCATION
      ?auto_1463360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1463362 ?auto_1463363 ) ( IN-CITY ?auto_1463352 ?auto_1463363 ) ( not ( = ?auto_1463352 ?auto_1463362 ) ) ( OBJ-AT ?auto_1463358 ?auto_1463362 ) ( OBJ-AT ?auto_1463353 ?auto_1463362 ) ( IN-CITY ?auto_1463361 ?auto_1463363 ) ( not ( = ?auto_1463352 ?auto_1463361 ) ) ( OBJ-AT ?auto_1463356 ?auto_1463361 ) ( IN-CITY ?auto_1463359 ?auto_1463363 ) ( not ( = ?auto_1463352 ?auto_1463359 ) ) ( OBJ-AT ?auto_1463357 ?auto_1463359 ) ( OBJ-AT ?auto_1463355 ?auto_1463361 ) ( OBJ-AT ?auto_1463354 ?auto_1463361 ) ( TRUCK-AT ?auto_1463360 ?auto_1463352 ) ( not ( = ?auto_1463354 ?auto_1463355 ) ) ( not ( = ?auto_1463354 ?auto_1463357 ) ) ( not ( = ?auto_1463355 ?auto_1463357 ) ) ( not ( = ?auto_1463359 ?auto_1463361 ) ) ( not ( = ?auto_1463354 ?auto_1463356 ) ) ( not ( = ?auto_1463355 ?auto_1463356 ) ) ( not ( = ?auto_1463357 ?auto_1463356 ) ) ( not ( = ?auto_1463354 ?auto_1463353 ) ) ( not ( = ?auto_1463355 ?auto_1463353 ) ) ( not ( = ?auto_1463357 ?auto_1463353 ) ) ( not ( = ?auto_1463356 ?auto_1463353 ) ) ( not ( = ?auto_1463362 ?auto_1463361 ) ) ( not ( = ?auto_1463362 ?auto_1463359 ) ) ( not ( = ?auto_1463354 ?auto_1463358 ) ) ( not ( = ?auto_1463355 ?auto_1463358 ) ) ( not ( = ?auto_1463357 ?auto_1463358 ) ) ( not ( = ?auto_1463356 ?auto_1463358 ) ) ( not ( = ?auto_1463353 ?auto_1463358 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1463354 ?auto_1463355 ?auto_1463357 ?auto_1463353 ?auto_1463356 ?auto_1463358 ?auto_1463352 )
      ( DELIVER-6PKG-VERIFY ?auto_1463353 ?auto_1463354 ?auto_1463355 ?auto_1463356 ?auto_1463357 ?auto_1463358 ?auto_1463352 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1463417 - OBJ
      ?auto_1463418 - OBJ
      ?auto_1463419 - OBJ
      ?auto_1463420 - OBJ
      ?auto_1463421 - OBJ
      ?auto_1463422 - OBJ
      ?auto_1463416 - LOCATION
    )
    :vars
    (
      ?auto_1463426 - LOCATION
      ?auto_1463427 - CITY
      ?auto_1463425 - LOCATION
      ?auto_1463423 - LOCATION
      ?auto_1463424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1463426 ?auto_1463427 ) ( IN-CITY ?auto_1463416 ?auto_1463427 ) ( not ( = ?auto_1463416 ?auto_1463426 ) ) ( OBJ-AT ?auto_1463421 ?auto_1463426 ) ( OBJ-AT ?auto_1463417 ?auto_1463426 ) ( IN-CITY ?auto_1463425 ?auto_1463427 ) ( not ( = ?auto_1463416 ?auto_1463425 ) ) ( OBJ-AT ?auto_1463420 ?auto_1463425 ) ( IN-CITY ?auto_1463423 ?auto_1463427 ) ( not ( = ?auto_1463416 ?auto_1463423 ) ) ( OBJ-AT ?auto_1463422 ?auto_1463423 ) ( OBJ-AT ?auto_1463419 ?auto_1463425 ) ( OBJ-AT ?auto_1463418 ?auto_1463425 ) ( TRUCK-AT ?auto_1463424 ?auto_1463416 ) ( not ( = ?auto_1463418 ?auto_1463419 ) ) ( not ( = ?auto_1463418 ?auto_1463422 ) ) ( not ( = ?auto_1463419 ?auto_1463422 ) ) ( not ( = ?auto_1463423 ?auto_1463425 ) ) ( not ( = ?auto_1463418 ?auto_1463420 ) ) ( not ( = ?auto_1463419 ?auto_1463420 ) ) ( not ( = ?auto_1463422 ?auto_1463420 ) ) ( not ( = ?auto_1463418 ?auto_1463417 ) ) ( not ( = ?auto_1463419 ?auto_1463417 ) ) ( not ( = ?auto_1463422 ?auto_1463417 ) ) ( not ( = ?auto_1463420 ?auto_1463417 ) ) ( not ( = ?auto_1463426 ?auto_1463425 ) ) ( not ( = ?auto_1463426 ?auto_1463423 ) ) ( not ( = ?auto_1463418 ?auto_1463421 ) ) ( not ( = ?auto_1463419 ?auto_1463421 ) ) ( not ( = ?auto_1463422 ?auto_1463421 ) ) ( not ( = ?auto_1463420 ?auto_1463421 ) ) ( not ( = ?auto_1463417 ?auto_1463421 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1463418 ?auto_1463419 ?auto_1463422 ?auto_1463417 ?auto_1463420 ?auto_1463421 ?auto_1463416 )
      ( DELIVER-6PKG-VERIFY ?auto_1463417 ?auto_1463418 ?auto_1463419 ?auto_1463420 ?auto_1463421 ?auto_1463422 ?auto_1463416 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1463821 - OBJ
      ?auto_1463822 - OBJ
      ?auto_1463823 - OBJ
      ?auto_1463824 - OBJ
      ?auto_1463825 - OBJ
      ?auto_1463826 - OBJ
      ?auto_1463820 - LOCATION
    )
    :vars
    (
      ?auto_1463830 - LOCATION
      ?auto_1463831 - CITY
      ?auto_1463829 - LOCATION
      ?auto_1463827 - LOCATION
      ?auto_1463828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1463830 ?auto_1463831 ) ( IN-CITY ?auto_1463820 ?auto_1463831 ) ( not ( = ?auto_1463820 ?auto_1463830 ) ) ( OBJ-AT ?auto_1463824 ?auto_1463830 ) ( OBJ-AT ?auto_1463821 ?auto_1463830 ) ( IN-CITY ?auto_1463829 ?auto_1463831 ) ( not ( = ?auto_1463820 ?auto_1463829 ) ) ( OBJ-AT ?auto_1463826 ?auto_1463829 ) ( IN-CITY ?auto_1463827 ?auto_1463831 ) ( not ( = ?auto_1463820 ?auto_1463827 ) ) ( OBJ-AT ?auto_1463825 ?auto_1463827 ) ( OBJ-AT ?auto_1463823 ?auto_1463829 ) ( OBJ-AT ?auto_1463822 ?auto_1463829 ) ( TRUCK-AT ?auto_1463828 ?auto_1463820 ) ( not ( = ?auto_1463822 ?auto_1463823 ) ) ( not ( = ?auto_1463822 ?auto_1463825 ) ) ( not ( = ?auto_1463823 ?auto_1463825 ) ) ( not ( = ?auto_1463827 ?auto_1463829 ) ) ( not ( = ?auto_1463822 ?auto_1463826 ) ) ( not ( = ?auto_1463823 ?auto_1463826 ) ) ( not ( = ?auto_1463825 ?auto_1463826 ) ) ( not ( = ?auto_1463822 ?auto_1463821 ) ) ( not ( = ?auto_1463823 ?auto_1463821 ) ) ( not ( = ?auto_1463825 ?auto_1463821 ) ) ( not ( = ?auto_1463826 ?auto_1463821 ) ) ( not ( = ?auto_1463830 ?auto_1463829 ) ) ( not ( = ?auto_1463830 ?auto_1463827 ) ) ( not ( = ?auto_1463822 ?auto_1463824 ) ) ( not ( = ?auto_1463823 ?auto_1463824 ) ) ( not ( = ?auto_1463825 ?auto_1463824 ) ) ( not ( = ?auto_1463826 ?auto_1463824 ) ) ( not ( = ?auto_1463821 ?auto_1463824 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1463822 ?auto_1463823 ?auto_1463825 ?auto_1463821 ?auto_1463826 ?auto_1463824 ?auto_1463820 )
      ( DELIVER-6PKG-VERIFY ?auto_1463821 ?auto_1463822 ?auto_1463823 ?auto_1463824 ?auto_1463825 ?auto_1463826 ?auto_1463820 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1463885 - OBJ
      ?auto_1463886 - OBJ
      ?auto_1463887 - OBJ
      ?auto_1463888 - OBJ
      ?auto_1463889 - OBJ
      ?auto_1463890 - OBJ
      ?auto_1463884 - LOCATION
    )
    :vars
    (
      ?auto_1463894 - LOCATION
      ?auto_1463895 - CITY
      ?auto_1463893 - LOCATION
      ?auto_1463891 - LOCATION
      ?auto_1463892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1463894 ?auto_1463895 ) ( IN-CITY ?auto_1463884 ?auto_1463895 ) ( not ( = ?auto_1463884 ?auto_1463894 ) ) ( OBJ-AT ?auto_1463888 ?auto_1463894 ) ( OBJ-AT ?auto_1463885 ?auto_1463894 ) ( IN-CITY ?auto_1463893 ?auto_1463895 ) ( not ( = ?auto_1463884 ?auto_1463893 ) ) ( OBJ-AT ?auto_1463889 ?auto_1463893 ) ( IN-CITY ?auto_1463891 ?auto_1463895 ) ( not ( = ?auto_1463884 ?auto_1463891 ) ) ( OBJ-AT ?auto_1463890 ?auto_1463891 ) ( OBJ-AT ?auto_1463887 ?auto_1463893 ) ( OBJ-AT ?auto_1463886 ?auto_1463893 ) ( TRUCK-AT ?auto_1463892 ?auto_1463884 ) ( not ( = ?auto_1463886 ?auto_1463887 ) ) ( not ( = ?auto_1463886 ?auto_1463890 ) ) ( not ( = ?auto_1463887 ?auto_1463890 ) ) ( not ( = ?auto_1463891 ?auto_1463893 ) ) ( not ( = ?auto_1463886 ?auto_1463889 ) ) ( not ( = ?auto_1463887 ?auto_1463889 ) ) ( not ( = ?auto_1463890 ?auto_1463889 ) ) ( not ( = ?auto_1463886 ?auto_1463885 ) ) ( not ( = ?auto_1463887 ?auto_1463885 ) ) ( not ( = ?auto_1463890 ?auto_1463885 ) ) ( not ( = ?auto_1463889 ?auto_1463885 ) ) ( not ( = ?auto_1463894 ?auto_1463893 ) ) ( not ( = ?auto_1463894 ?auto_1463891 ) ) ( not ( = ?auto_1463886 ?auto_1463888 ) ) ( not ( = ?auto_1463887 ?auto_1463888 ) ) ( not ( = ?auto_1463890 ?auto_1463888 ) ) ( not ( = ?auto_1463889 ?auto_1463888 ) ) ( not ( = ?auto_1463885 ?auto_1463888 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1463886 ?auto_1463887 ?auto_1463890 ?auto_1463885 ?auto_1463889 ?auto_1463888 ?auto_1463884 )
      ( DELIVER-6PKG-VERIFY ?auto_1463885 ?auto_1463886 ?auto_1463887 ?auto_1463888 ?auto_1463889 ?auto_1463890 ?auto_1463884 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1464289 - OBJ
      ?auto_1464290 - OBJ
      ?auto_1464291 - OBJ
      ?auto_1464292 - OBJ
      ?auto_1464293 - OBJ
      ?auto_1464294 - OBJ
      ?auto_1464288 - LOCATION
    )
    :vars
    (
      ?auto_1464298 - LOCATION
      ?auto_1464299 - CITY
      ?auto_1464297 - LOCATION
      ?auto_1464295 - LOCATION
      ?auto_1464296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1464298 ?auto_1464299 ) ( IN-CITY ?auto_1464288 ?auto_1464299 ) ( not ( = ?auto_1464288 ?auto_1464298 ) ) ( OBJ-AT ?auto_1464294 ?auto_1464298 ) ( OBJ-AT ?auto_1464289 ?auto_1464298 ) ( IN-CITY ?auto_1464297 ?auto_1464299 ) ( not ( = ?auto_1464288 ?auto_1464297 ) ) ( OBJ-AT ?auto_1464293 ?auto_1464297 ) ( IN-CITY ?auto_1464295 ?auto_1464299 ) ( not ( = ?auto_1464288 ?auto_1464295 ) ) ( OBJ-AT ?auto_1464291 ?auto_1464295 ) ( OBJ-AT ?auto_1464292 ?auto_1464297 ) ( OBJ-AT ?auto_1464290 ?auto_1464297 ) ( TRUCK-AT ?auto_1464296 ?auto_1464288 ) ( not ( = ?auto_1464290 ?auto_1464292 ) ) ( not ( = ?auto_1464290 ?auto_1464291 ) ) ( not ( = ?auto_1464292 ?auto_1464291 ) ) ( not ( = ?auto_1464295 ?auto_1464297 ) ) ( not ( = ?auto_1464290 ?auto_1464293 ) ) ( not ( = ?auto_1464292 ?auto_1464293 ) ) ( not ( = ?auto_1464291 ?auto_1464293 ) ) ( not ( = ?auto_1464290 ?auto_1464289 ) ) ( not ( = ?auto_1464292 ?auto_1464289 ) ) ( not ( = ?auto_1464291 ?auto_1464289 ) ) ( not ( = ?auto_1464293 ?auto_1464289 ) ) ( not ( = ?auto_1464298 ?auto_1464297 ) ) ( not ( = ?auto_1464298 ?auto_1464295 ) ) ( not ( = ?auto_1464290 ?auto_1464294 ) ) ( not ( = ?auto_1464292 ?auto_1464294 ) ) ( not ( = ?auto_1464291 ?auto_1464294 ) ) ( not ( = ?auto_1464293 ?auto_1464294 ) ) ( not ( = ?auto_1464289 ?auto_1464294 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1464290 ?auto_1464292 ?auto_1464291 ?auto_1464289 ?auto_1464293 ?auto_1464294 ?auto_1464288 )
      ( DELIVER-6PKG-VERIFY ?auto_1464289 ?auto_1464290 ?auto_1464291 ?auto_1464292 ?auto_1464293 ?auto_1464294 ?auto_1464288 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1464353 - OBJ
      ?auto_1464354 - OBJ
      ?auto_1464355 - OBJ
      ?auto_1464356 - OBJ
      ?auto_1464357 - OBJ
      ?auto_1464358 - OBJ
      ?auto_1464352 - LOCATION
    )
    :vars
    (
      ?auto_1464362 - LOCATION
      ?auto_1464363 - CITY
      ?auto_1464361 - LOCATION
      ?auto_1464359 - LOCATION
      ?auto_1464360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1464362 ?auto_1464363 ) ( IN-CITY ?auto_1464352 ?auto_1464363 ) ( not ( = ?auto_1464352 ?auto_1464362 ) ) ( OBJ-AT ?auto_1464357 ?auto_1464362 ) ( OBJ-AT ?auto_1464353 ?auto_1464362 ) ( IN-CITY ?auto_1464361 ?auto_1464363 ) ( not ( = ?auto_1464352 ?auto_1464361 ) ) ( OBJ-AT ?auto_1464358 ?auto_1464361 ) ( IN-CITY ?auto_1464359 ?auto_1464363 ) ( not ( = ?auto_1464352 ?auto_1464359 ) ) ( OBJ-AT ?auto_1464355 ?auto_1464359 ) ( OBJ-AT ?auto_1464356 ?auto_1464361 ) ( OBJ-AT ?auto_1464354 ?auto_1464361 ) ( TRUCK-AT ?auto_1464360 ?auto_1464352 ) ( not ( = ?auto_1464354 ?auto_1464356 ) ) ( not ( = ?auto_1464354 ?auto_1464355 ) ) ( not ( = ?auto_1464356 ?auto_1464355 ) ) ( not ( = ?auto_1464359 ?auto_1464361 ) ) ( not ( = ?auto_1464354 ?auto_1464358 ) ) ( not ( = ?auto_1464356 ?auto_1464358 ) ) ( not ( = ?auto_1464355 ?auto_1464358 ) ) ( not ( = ?auto_1464354 ?auto_1464353 ) ) ( not ( = ?auto_1464356 ?auto_1464353 ) ) ( not ( = ?auto_1464355 ?auto_1464353 ) ) ( not ( = ?auto_1464358 ?auto_1464353 ) ) ( not ( = ?auto_1464362 ?auto_1464361 ) ) ( not ( = ?auto_1464362 ?auto_1464359 ) ) ( not ( = ?auto_1464354 ?auto_1464357 ) ) ( not ( = ?auto_1464356 ?auto_1464357 ) ) ( not ( = ?auto_1464355 ?auto_1464357 ) ) ( not ( = ?auto_1464358 ?auto_1464357 ) ) ( not ( = ?auto_1464353 ?auto_1464357 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1464354 ?auto_1464356 ?auto_1464355 ?auto_1464353 ?auto_1464358 ?auto_1464357 ?auto_1464352 )
      ( DELIVER-6PKG-VERIFY ?auto_1464353 ?auto_1464354 ?auto_1464355 ?auto_1464356 ?auto_1464357 ?auto_1464358 ?auto_1464352 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1464943 - OBJ
      ?auto_1464944 - OBJ
      ?auto_1464945 - OBJ
      ?auto_1464946 - OBJ
      ?auto_1464947 - OBJ
      ?auto_1464948 - OBJ
      ?auto_1464942 - LOCATION
    )
    :vars
    (
      ?auto_1464952 - LOCATION
      ?auto_1464953 - CITY
      ?auto_1464951 - LOCATION
      ?auto_1464949 - LOCATION
      ?auto_1464950 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1464952 ?auto_1464953 ) ( IN-CITY ?auto_1464942 ?auto_1464953 ) ( not ( = ?auto_1464942 ?auto_1464952 ) ) ( OBJ-AT ?auto_1464946 ?auto_1464952 ) ( OBJ-AT ?auto_1464943 ?auto_1464952 ) ( IN-CITY ?auto_1464951 ?auto_1464953 ) ( not ( = ?auto_1464942 ?auto_1464951 ) ) ( OBJ-AT ?auto_1464948 ?auto_1464951 ) ( IN-CITY ?auto_1464949 ?auto_1464953 ) ( not ( = ?auto_1464942 ?auto_1464949 ) ) ( OBJ-AT ?auto_1464945 ?auto_1464949 ) ( OBJ-AT ?auto_1464947 ?auto_1464951 ) ( OBJ-AT ?auto_1464944 ?auto_1464951 ) ( TRUCK-AT ?auto_1464950 ?auto_1464942 ) ( not ( = ?auto_1464944 ?auto_1464947 ) ) ( not ( = ?auto_1464944 ?auto_1464945 ) ) ( not ( = ?auto_1464947 ?auto_1464945 ) ) ( not ( = ?auto_1464949 ?auto_1464951 ) ) ( not ( = ?auto_1464944 ?auto_1464948 ) ) ( not ( = ?auto_1464947 ?auto_1464948 ) ) ( not ( = ?auto_1464945 ?auto_1464948 ) ) ( not ( = ?auto_1464944 ?auto_1464943 ) ) ( not ( = ?auto_1464947 ?auto_1464943 ) ) ( not ( = ?auto_1464945 ?auto_1464943 ) ) ( not ( = ?auto_1464948 ?auto_1464943 ) ) ( not ( = ?auto_1464952 ?auto_1464951 ) ) ( not ( = ?auto_1464952 ?auto_1464949 ) ) ( not ( = ?auto_1464944 ?auto_1464946 ) ) ( not ( = ?auto_1464947 ?auto_1464946 ) ) ( not ( = ?auto_1464945 ?auto_1464946 ) ) ( not ( = ?auto_1464948 ?auto_1464946 ) ) ( not ( = ?auto_1464943 ?auto_1464946 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1464944 ?auto_1464947 ?auto_1464945 ?auto_1464943 ?auto_1464948 ?auto_1464946 ?auto_1464942 )
      ( DELIVER-6PKG-VERIFY ?auto_1464943 ?auto_1464944 ?auto_1464945 ?auto_1464946 ?auto_1464947 ?auto_1464948 ?auto_1464942 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1468468 - OBJ
      ?auto_1468469 - OBJ
      ?auto_1468470 - OBJ
      ?auto_1468471 - OBJ
      ?auto_1468472 - OBJ
      ?auto_1468473 - OBJ
      ?auto_1468467 - LOCATION
    )
    :vars
    (
      ?auto_1468477 - LOCATION
      ?auto_1468478 - CITY
      ?auto_1468476 - LOCATION
      ?auto_1468474 - LOCATION
      ?auto_1468475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1468477 ?auto_1468478 ) ( IN-CITY ?auto_1468467 ?auto_1468478 ) ( not ( = ?auto_1468467 ?auto_1468477 ) ) ( OBJ-AT ?auto_1468470 ?auto_1468477 ) ( OBJ-AT ?auto_1468468 ?auto_1468477 ) ( IN-CITY ?auto_1468476 ?auto_1468478 ) ( not ( = ?auto_1468467 ?auto_1468476 ) ) ( OBJ-AT ?auto_1468473 ?auto_1468476 ) ( IN-CITY ?auto_1468474 ?auto_1468478 ) ( not ( = ?auto_1468467 ?auto_1468474 ) ) ( OBJ-AT ?auto_1468472 ?auto_1468474 ) ( OBJ-AT ?auto_1468471 ?auto_1468476 ) ( OBJ-AT ?auto_1468469 ?auto_1468476 ) ( TRUCK-AT ?auto_1468475 ?auto_1468467 ) ( not ( = ?auto_1468469 ?auto_1468471 ) ) ( not ( = ?auto_1468469 ?auto_1468472 ) ) ( not ( = ?auto_1468471 ?auto_1468472 ) ) ( not ( = ?auto_1468474 ?auto_1468476 ) ) ( not ( = ?auto_1468469 ?auto_1468473 ) ) ( not ( = ?auto_1468471 ?auto_1468473 ) ) ( not ( = ?auto_1468472 ?auto_1468473 ) ) ( not ( = ?auto_1468469 ?auto_1468468 ) ) ( not ( = ?auto_1468471 ?auto_1468468 ) ) ( not ( = ?auto_1468472 ?auto_1468468 ) ) ( not ( = ?auto_1468473 ?auto_1468468 ) ) ( not ( = ?auto_1468477 ?auto_1468476 ) ) ( not ( = ?auto_1468477 ?auto_1468474 ) ) ( not ( = ?auto_1468469 ?auto_1468470 ) ) ( not ( = ?auto_1468471 ?auto_1468470 ) ) ( not ( = ?auto_1468472 ?auto_1468470 ) ) ( not ( = ?auto_1468473 ?auto_1468470 ) ) ( not ( = ?auto_1468468 ?auto_1468470 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1468469 ?auto_1468471 ?auto_1468472 ?auto_1468468 ?auto_1468473 ?auto_1468470 ?auto_1468467 )
      ( DELIVER-6PKG-VERIFY ?auto_1468468 ?auto_1468469 ?auto_1468470 ?auto_1468471 ?auto_1468472 ?auto_1468473 ?auto_1468467 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1468532 - OBJ
      ?auto_1468533 - OBJ
      ?auto_1468534 - OBJ
      ?auto_1468535 - OBJ
      ?auto_1468536 - OBJ
      ?auto_1468537 - OBJ
      ?auto_1468531 - LOCATION
    )
    :vars
    (
      ?auto_1468541 - LOCATION
      ?auto_1468542 - CITY
      ?auto_1468540 - LOCATION
      ?auto_1468538 - LOCATION
      ?auto_1468539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1468541 ?auto_1468542 ) ( IN-CITY ?auto_1468531 ?auto_1468542 ) ( not ( = ?auto_1468531 ?auto_1468541 ) ) ( OBJ-AT ?auto_1468534 ?auto_1468541 ) ( OBJ-AT ?auto_1468532 ?auto_1468541 ) ( IN-CITY ?auto_1468540 ?auto_1468542 ) ( not ( = ?auto_1468531 ?auto_1468540 ) ) ( OBJ-AT ?auto_1468536 ?auto_1468540 ) ( IN-CITY ?auto_1468538 ?auto_1468542 ) ( not ( = ?auto_1468531 ?auto_1468538 ) ) ( OBJ-AT ?auto_1468537 ?auto_1468538 ) ( OBJ-AT ?auto_1468535 ?auto_1468540 ) ( OBJ-AT ?auto_1468533 ?auto_1468540 ) ( TRUCK-AT ?auto_1468539 ?auto_1468531 ) ( not ( = ?auto_1468533 ?auto_1468535 ) ) ( not ( = ?auto_1468533 ?auto_1468537 ) ) ( not ( = ?auto_1468535 ?auto_1468537 ) ) ( not ( = ?auto_1468538 ?auto_1468540 ) ) ( not ( = ?auto_1468533 ?auto_1468536 ) ) ( not ( = ?auto_1468535 ?auto_1468536 ) ) ( not ( = ?auto_1468537 ?auto_1468536 ) ) ( not ( = ?auto_1468533 ?auto_1468532 ) ) ( not ( = ?auto_1468535 ?auto_1468532 ) ) ( not ( = ?auto_1468537 ?auto_1468532 ) ) ( not ( = ?auto_1468536 ?auto_1468532 ) ) ( not ( = ?auto_1468541 ?auto_1468540 ) ) ( not ( = ?auto_1468541 ?auto_1468538 ) ) ( not ( = ?auto_1468533 ?auto_1468534 ) ) ( not ( = ?auto_1468535 ?auto_1468534 ) ) ( not ( = ?auto_1468537 ?auto_1468534 ) ) ( not ( = ?auto_1468536 ?auto_1468534 ) ) ( not ( = ?auto_1468532 ?auto_1468534 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1468533 ?auto_1468535 ?auto_1468537 ?auto_1468532 ?auto_1468536 ?auto_1468534 ?auto_1468531 )
      ( DELIVER-6PKG-VERIFY ?auto_1468532 ?auto_1468533 ?auto_1468534 ?auto_1468535 ?auto_1468536 ?auto_1468537 ?auto_1468531 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1468868 - OBJ
      ?auto_1468869 - OBJ
      ?auto_1468870 - OBJ
      ?auto_1468871 - OBJ
      ?auto_1468872 - OBJ
      ?auto_1468873 - OBJ
      ?auto_1468867 - LOCATION
    )
    :vars
    (
      ?auto_1468877 - LOCATION
      ?auto_1468878 - CITY
      ?auto_1468876 - LOCATION
      ?auto_1468874 - LOCATION
      ?auto_1468875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1468877 ?auto_1468878 ) ( IN-CITY ?auto_1468867 ?auto_1468878 ) ( not ( = ?auto_1468867 ?auto_1468877 ) ) ( OBJ-AT ?auto_1468870 ?auto_1468877 ) ( OBJ-AT ?auto_1468868 ?auto_1468877 ) ( IN-CITY ?auto_1468876 ?auto_1468878 ) ( not ( = ?auto_1468867 ?auto_1468876 ) ) ( OBJ-AT ?auto_1468873 ?auto_1468876 ) ( IN-CITY ?auto_1468874 ?auto_1468878 ) ( not ( = ?auto_1468867 ?auto_1468874 ) ) ( OBJ-AT ?auto_1468871 ?auto_1468874 ) ( OBJ-AT ?auto_1468872 ?auto_1468876 ) ( OBJ-AT ?auto_1468869 ?auto_1468876 ) ( TRUCK-AT ?auto_1468875 ?auto_1468867 ) ( not ( = ?auto_1468869 ?auto_1468872 ) ) ( not ( = ?auto_1468869 ?auto_1468871 ) ) ( not ( = ?auto_1468872 ?auto_1468871 ) ) ( not ( = ?auto_1468874 ?auto_1468876 ) ) ( not ( = ?auto_1468869 ?auto_1468873 ) ) ( not ( = ?auto_1468872 ?auto_1468873 ) ) ( not ( = ?auto_1468871 ?auto_1468873 ) ) ( not ( = ?auto_1468869 ?auto_1468868 ) ) ( not ( = ?auto_1468872 ?auto_1468868 ) ) ( not ( = ?auto_1468871 ?auto_1468868 ) ) ( not ( = ?auto_1468873 ?auto_1468868 ) ) ( not ( = ?auto_1468877 ?auto_1468876 ) ) ( not ( = ?auto_1468877 ?auto_1468874 ) ) ( not ( = ?auto_1468869 ?auto_1468870 ) ) ( not ( = ?auto_1468872 ?auto_1468870 ) ) ( not ( = ?auto_1468871 ?auto_1468870 ) ) ( not ( = ?auto_1468873 ?auto_1468870 ) ) ( not ( = ?auto_1468868 ?auto_1468870 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1468869 ?auto_1468872 ?auto_1468871 ?auto_1468868 ?auto_1468873 ?auto_1468870 ?auto_1468867 )
      ( DELIVER-6PKG-VERIFY ?auto_1468868 ?auto_1468869 ?auto_1468870 ?auto_1468871 ?auto_1468872 ?auto_1468873 ?auto_1468867 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1479938 - OBJ
      ?auto_1479939 - OBJ
      ?auto_1479940 - OBJ
      ?auto_1479941 - OBJ
      ?auto_1479942 - OBJ
      ?auto_1479943 - OBJ
      ?auto_1479937 - LOCATION
    )
    :vars
    (
      ?auto_1479947 - LOCATION
      ?auto_1479948 - CITY
      ?auto_1479946 - LOCATION
      ?auto_1479944 - LOCATION
      ?auto_1479945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1479947 ?auto_1479948 ) ( IN-CITY ?auto_1479937 ?auto_1479948 ) ( not ( = ?auto_1479937 ?auto_1479947 ) ) ( OBJ-AT ?auto_1479943 ?auto_1479947 ) ( OBJ-AT ?auto_1479938 ?auto_1479947 ) ( IN-CITY ?auto_1479946 ?auto_1479948 ) ( not ( = ?auto_1479937 ?auto_1479946 ) ) ( OBJ-AT ?auto_1479942 ?auto_1479946 ) ( IN-CITY ?auto_1479944 ?auto_1479948 ) ( not ( = ?auto_1479937 ?auto_1479944 ) ) ( OBJ-AT ?auto_1479939 ?auto_1479944 ) ( OBJ-AT ?auto_1479941 ?auto_1479946 ) ( OBJ-AT ?auto_1479940 ?auto_1479946 ) ( TRUCK-AT ?auto_1479945 ?auto_1479937 ) ( not ( = ?auto_1479940 ?auto_1479941 ) ) ( not ( = ?auto_1479940 ?auto_1479939 ) ) ( not ( = ?auto_1479941 ?auto_1479939 ) ) ( not ( = ?auto_1479944 ?auto_1479946 ) ) ( not ( = ?auto_1479940 ?auto_1479942 ) ) ( not ( = ?auto_1479941 ?auto_1479942 ) ) ( not ( = ?auto_1479939 ?auto_1479942 ) ) ( not ( = ?auto_1479940 ?auto_1479938 ) ) ( not ( = ?auto_1479941 ?auto_1479938 ) ) ( not ( = ?auto_1479939 ?auto_1479938 ) ) ( not ( = ?auto_1479942 ?auto_1479938 ) ) ( not ( = ?auto_1479947 ?auto_1479946 ) ) ( not ( = ?auto_1479947 ?auto_1479944 ) ) ( not ( = ?auto_1479940 ?auto_1479943 ) ) ( not ( = ?auto_1479941 ?auto_1479943 ) ) ( not ( = ?auto_1479939 ?auto_1479943 ) ) ( not ( = ?auto_1479942 ?auto_1479943 ) ) ( not ( = ?auto_1479938 ?auto_1479943 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1479940 ?auto_1479941 ?auto_1479939 ?auto_1479938 ?auto_1479942 ?auto_1479943 ?auto_1479937 )
      ( DELIVER-6PKG-VERIFY ?auto_1479938 ?auto_1479939 ?auto_1479940 ?auto_1479941 ?auto_1479942 ?auto_1479943 ?auto_1479937 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1480002 - OBJ
      ?auto_1480003 - OBJ
      ?auto_1480004 - OBJ
      ?auto_1480005 - OBJ
      ?auto_1480006 - OBJ
      ?auto_1480007 - OBJ
      ?auto_1480001 - LOCATION
    )
    :vars
    (
      ?auto_1480011 - LOCATION
      ?auto_1480012 - CITY
      ?auto_1480010 - LOCATION
      ?auto_1480008 - LOCATION
      ?auto_1480009 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1480011 ?auto_1480012 ) ( IN-CITY ?auto_1480001 ?auto_1480012 ) ( not ( = ?auto_1480001 ?auto_1480011 ) ) ( OBJ-AT ?auto_1480006 ?auto_1480011 ) ( OBJ-AT ?auto_1480002 ?auto_1480011 ) ( IN-CITY ?auto_1480010 ?auto_1480012 ) ( not ( = ?auto_1480001 ?auto_1480010 ) ) ( OBJ-AT ?auto_1480007 ?auto_1480010 ) ( IN-CITY ?auto_1480008 ?auto_1480012 ) ( not ( = ?auto_1480001 ?auto_1480008 ) ) ( OBJ-AT ?auto_1480003 ?auto_1480008 ) ( OBJ-AT ?auto_1480005 ?auto_1480010 ) ( OBJ-AT ?auto_1480004 ?auto_1480010 ) ( TRUCK-AT ?auto_1480009 ?auto_1480001 ) ( not ( = ?auto_1480004 ?auto_1480005 ) ) ( not ( = ?auto_1480004 ?auto_1480003 ) ) ( not ( = ?auto_1480005 ?auto_1480003 ) ) ( not ( = ?auto_1480008 ?auto_1480010 ) ) ( not ( = ?auto_1480004 ?auto_1480007 ) ) ( not ( = ?auto_1480005 ?auto_1480007 ) ) ( not ( = ?auto_1480003 ?auto_1480007 ) ) ( not ( = ?auto_1480004 ?auto_1480002 ) ) ( not ( = ?auto_1480005 ?auto_1480002 ) ) ( not ( = ?auto_1480003 ?auto_1480002 ) ) ( not ( = ?auto_1480007 ?auto_1480002 ) ) ( not ( = ?auto_1480011 ?auto_1480010 ) ) ( not ( = ?auto_1480011 ?auto_1480008 ) ) ( not ( = ?auto_1480004 ?auto_1480006 ) ) ( not ( = ?auto_1480005 ?auto_1480006 ) ) ( not ( = ?auto_1480003 ?auto_1480006 ) ) ( not ( = ?auto_1480007 ?auto_1480006 ) ) ( not ( = ?auto_1480002 ?auto_1480006 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1480004 ?auto_1480005 ?auto_1480003 ?auto_1480002 ?auto_1480007 ?auto_1480006 ?auto_1480001 )
      ( DELIVER-6PKG-VERIFY ?auto_1480002 ?auto_1480003 ?auto_1480004 ?auto_1480005 ?auto_1480006 ?auto_1480007 ?auto_1480001 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1480592 - OBJ
      ?auto_1480593 - OBJ
      ?auto_1480594 - OBJ
      ?auto_1480595 - OBJ
      ?auto_1480596 - OBJ
      ?auto_1480597 - OBJ
      ?auto_1480591 - LOCATION
    )
    :vars
    (
      ?auto_1480601 - LOCATION
      ?auto_1480602 - CITY
      ?auto_1480600 - LOCATION
      ?auto_1480598 - LOCATION
      ?auto_1480599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1480601 ?auto_1480602 ) ( IN-CITY ?auto_1480591 ?auto_1480602 ) ( not ( = ?auto_1480591 ?auto_1480601 ) ) ( OBJ-AT ?auto_1480595 ?auto_1480601 ) ( OBJ-AT ?auto_1480592 ?auto_1480601 ) ( IN-CITY ?auto_1480600 ?auto_1480602 ) ( not ( = ?auto_1480591 ?auto_1480600 ) ) ( OBJ-AT ?auto_1480597 ?auto_1480600 ) ( IN-CITY ?auto_1480598 ?auto_1480602 ) ( not ( = ?auto_1480591 ?auto_1480598 ) ) ( OBJ-AT ?auto_1480593 ?auto_1480598 ) ( OBJ-AT ?auto_1480596 ?auto_1480600 ) ( OBJ-AT ?auto_1480594 ?auto_1480600 ) ( TRUCK-AT ?auto_1480599 ?auto_1480591 ) ( not ( = ?auto_1480594 ?auto_1480596 ) ) ( not ( = ?auto_1480594 ?auto_1480593 ) ) ( not ( = ?auto_1480596 ?auto_1480593 ) ) ( not ( = ?auto_1480598 ?auto_1480600 ) ) ( not ( = ?auto_1480594 ?auto_1480597 ) ) ( not ( = ?auto_1480596 ?auto_1480597 ) ) ( not ( = ?auto_1480593 ?auto_1480597 ) ) ( not ( = ?auto_1480594 ?auto_1480592 ) ) ( not ( = ?auto_1480596 ?auto_1480592 ) ) ( not ( = ?auto_1480593 ?auto_1480592 ) ) ( not ( = ?auto_1480597 ?auto_1480592 ) ) ( not ( = ?auto_1480601 ?auto_1480600 ) ) ( not ( = ?auto_1480601 ?auto_1480598 ) ) ( not ( = ?auto_1480594 ?auto_1480595 ) ) ( not ( = ?auto_1480596 ?auto_1480595 ) ) ( not ( = ?auto_1480593 ?auto_1480595 ) ) ( not ( = ?auto_1480597 ?auto_1480595 ) ) ( not ( = ?auto_1480592 ?auto_1480595 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1480594 ?auto_1480596 ?auto_1480593 ?auto_1480592 ?auto_1480597 ?auto_1480595 ?auto_1480591 )
      ( DELIVER-6PKG-VERIFY ?auto_1480592 ?auto_1480593 ?auto_1480594 ?auto_1480595 ?auto_1480596 ?auto_1480597 ?auto_1480591 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1485987 - OBJ
      ?auto_1485988 - OBJ
      ?auto_1485989 - OBJ
      ?auto_1485990 - OBJ
      ?auto_1485991 - OBJ
      ?auto_1485992 - OBJ
      ?auto_1485986 - LOCATION
    )
    :vars
    (
      ?auto_1485996 - LOCATION
      ?auto_1485997 - CITY
      ?auto_1485995 - LOCATION
      ?auto_1485993 - LOCATION
      ?auto_1485994 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1485996 ?auto_1485997 ) ( IN-CITY ?auto_1485986 ?auto_1485997 ) ( not ( = ?auto_1485986 ?auto_1485996 ) ) ( OBJ-AT ?auto_1485989 ?auto_1485996 ) ( OBJ-AT ?auto_1485987 ?auto_1485996 ) ( IN-CITY ?auto_1485995 ?auto_1485997 ) ( not ( = ?auto_1485986 ?auto_1485995 ) ) ( OBJ-AT ?auto_1485992 ?auto_1485995 ) ( IN-CITY ?auto_1485993 ?auto_1485997 ) ( not ( = ?auto_1485986 ?auto_1485993 ) ) ( OBJ-AT ?auto_1485988 ?auto_1485993 ) ( OBJ-AT ?auto_1485991 ?auto_1485995 ) ( OBJ-AT ?auto_1485990 ?auto_1485995 ) ( TRUCK-AT ?auto_1485994 ?auto_1485986 ) ( not ( = ?auto_1485990 ?auto_1485991 ) ) ( not ( = ?auto_1485990 ?auto_1485988 ) ) ( not ( = ?auto_1485991 ?auto_1485988 ) ) ( not ( = ?auto_1485993 ?auto_1485995 ) ) ( not ( = ?auto_1485990 ?auto_1485992 ) ) ( not ( = ?auto_1485991 ?auto_1485992 ) ) ( not ( = ?auto_1485988 ?auto_1485992 ) ) ( not ( = ?auto_1485990 ?auto_1485987 ) ) ( not ( = ?auto_1485991 ?auto_1485987 ) ) ( not ( = ?auto_1485988 ?auto_1485987 ) ) ( not ( = ?auto_1485992 ?auto_1485987 ) ) ( not ( = ?auto_1485996 ?auto_1485995 ) ) ( not ( = ?auto_1485996 ?auto_1485993 ) ) ( not ( = ?auto_1485990 ?auto_1485989 ) ) ( not ( = ?auto_1485991 ?auto_1485989 ) ) ( not ( = ?auto_1485988 ?auto_1485989 ) ) ( not ( = ?auto_1485992 ?auto_1485989 ) ) ( not ( = ?auto_1485987 ?auto_1485989 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1485990 ?auto_1485991 ?auto_1485988 ?auto_1485987 ?auto_1485992 ?auto_1485989 ?auto_1485986 )
      ( DELIVER-6PKG-VERIFY ?auto_1485987 ?auto_1485988 ?auto_1485989 ?auto_1485990 ?auto_1485991 ?auto_1485992 ?auto_1485986 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1508085 - OBJ
      ?auto_1508086 - OBJ
      ?auto_1508087 - OBJ
      ?auto_1508088 - OBJ
      ?auto_1508089 - OBJ
      ?auto_1508090 - OBJ
      ?auto_1508084 - LOCATION
    )
    :vars
    (
      ?auto_1508094 - LOCATION
      ?auto_1508095 - CITY
      ?auto_1508093 - LOCATION
      ?auto_1508091 - LOCATION
      ?auto_1508092 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1508094 ?auto_1508095 ) ( IN-CITY ?auto_1508084 ?auto_1508095 ) ( not ( = ?auto_1508084 ?auto_1508094 ) ) ( OBJ-AT ?auto_1508086 ?auto_1508094 ) ( OBJ-AT ?auto_1508085 ?auto_1508094 ) ( IN-CITY ?auto_1508093 ?auto_1508095 ) ( not ( = ?auto_1508084 ?auto_1508093 ) ) ( OBJ-AT ?auto_1508090 ?auto_1508093 ) ( IN-CITY ?auto_1508091 ?auto_1508095 ) ( not ( = ?auto_1508084 ?auto_1508091 ) ) ( OBJ-AT ?auto_1508089 ?auto_1508091 ) ( OBJ-AT ?auto_1508088 ?auto_1508093 ) ( OBJ-AT ?auto_1508087 ?auto_1508093 ) ( TRUCK-AT ?auto_1508092 ?auto_1508084 ) ( not ( = ?auto_1508087 ?auto_1508088 ) ) ( not ( = ?auto_1508087 ?auto_1508089 ) ) ( not ( = ?auto_1508088 ?auto_1508089 ) ) ( not ( = ?auto_1508091 ?auto_1508093 ) ) ( not ( = ?auto_1508087 ?auto_1508090 ) ) ( not ( = ?auto_1508088 ?auto_1508090 ) ) ( not ( = ?auto_1508089 ?auto_1508090 ) ) ( not ( = ?auto_1508087 ?auto_1508085 ) ) ( not ( = ?auto_1508088 ?auto_1508085 ) ) ( not ( = ?auto_1508089 ?auto_1508085 ) ) ( not ( = ?auto_1508090 ?auto_1508085 ) ) ( not ( = ?auto_1508094 ?auto_1508093 ) ) ( not ( = ?auto_1508094 ?auto_1508091 ) ) ( not ( = ?auto_1508087 ?auto_1508086 ) ) ( not ( = ?auto_1508088 ?auto_1508086 ) ) ( not ( = ?auto_1508089 ?auto_1508086 ) ) ( not ( = ?auto_1508090 ?auto_1508086 ) ) ( not ( = ?auto_1508085 ?auto_1508086 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1508087 ?auto_1508088 ?auto_1508089 ?auto_1508085 ?auto_1508090 ?auto_1508086 ?auto_1508084 )
      ( DELIVER-6PKG-VERIFY ?auto_1508085 ?auto_1508086 ?auto_1508087 ?auto_1508088 ?auto_1508089 ?auto_1508090 ?auto_1508084 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1508149 - OBJ
      ?auto_1508150 - OBJ
      ?auto_1508151 - OBJ
      ?auto_1508152 - OBJ
      ?auto_1508153 - OBJ
      ?auto_1508154 - OBJ
      ?auto_1508148 - LOCATION
    )
    :vars
    (
      ?auto_1508158 - LOCATION
      ?auto_1508159 - CITY
      ?auto_1508157 - LOCATION
      ?auto_1508155 - LOCATION
      ?auto_1508156 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1508158 ?auto_1508159 ) ( IN-CITY ?auto_1508148 ?auto_1508159 ) ( not ( = ?auto_1508148 ?auto_1508158 ) ) ( OBJ-AT ?auto_1508150 ?auto_1508158 ) ( OBJ-AT ?auto_1508149 ?auto_1508158 ) ( IN-CITY ?auto_1508157 ?auto_1508159 ) ( not ( = ?auto_1508148 ?auto_1508157 ) ) ( OBJ-AT ?auto_1508153 ?auto_1508157 ) ( IN-CITY ?auto_1508155 ?auto_1508159 ) ( not ( = ?auto_1508148 ?auto_1508155 ) ) ( OBJ-AT ?auto_1508154 ?auto_1508155 ) ( OBJ-AT ?auto_1508152 ?auto_1508157 ) ( OBJ-AT ?auto_1508151 ?auto_1508157 ) ( TRUCK-AT ?auto_1508156 ?auto_1508148 ) ( not ( = ?auto_1508151 ?auto_1508152 ) ) ( not ( = ?auto_1508151 ?auto_1508154 ) ) ( not ( = ?auto_1508152 ?auto_1508154 ) ) ( not ( = ?auto_1508155 ?auto_1508157 ) ) ( not ( = ?auto_1508151 ?auto_1508153 ) ) ( not ( = ?auto_1508152 ?auto_1508153 ) ) ( not ( = ?auto_1508154 ?auto_1508153 ) ) ( not ( = ?auto_1508151 ?auto_1508149 ) ) ( not ( = ?auto_1508152 ?auto_1508149 ) ) ( not ( = ?auto_1508154 ?auto_1508149 ) ) ( not ( = ?auto_1508153 ?auto_1508149 ) ) ( not ( = ?auto_1508158 ?auto_1508157 ) ) ( not ( = ?auto_1508158 ?auto_1508155 ) ) ( not ( = ?auto_1508151 ?auto_1508150 ) ) ( not ( = ?auto_1508152 ?auto_1508150 ) ) ( not ( = ?auto_1508154 ?auto_1508150 ) ) ( not ( = ?auto_1508153 ?auto_1508150 ) ) ( not ( = ?auto_1508149 ?auto_1508150 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1508151 ?auto_1508152 ?auto_1508154 ?auto_1508149 ?auto_1508153 ?auto_1508150 ?auto_1508148 )
      ( DELIVER-6PKG-VERIFY ?auto_1508149 ?auto_1508150 ?auto_1508151 ?auto_1508152 ?auto_1508153 ?auto_1508154 ?auto_1508148 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1508485 - OBJ
      ?auto_1508486 - OBJ
      ?auto_1508487 - OBJ
      ?auto_1508488 - OBJ
      ?auto_1508489 - OBJ
      ?auto_1508490 - OBJ
      ?auto_1508484 - LOCATION
    )
    :vars
    (
      ?auto_1508494 - LOCATION
      ?auto_1508495 - CITY
      ?auto_1508493 - LOCATION
      ?auto_1508491 - LOCATION
      ?auto_1508492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1508494 ?auto_1508495 ) ( IN-CITY ?auto_1508484 ?auto_1508495 ) ( not ( = ?auto_1508484 ?auto_1508494 ) ) ( OBJ-AT ?auto_1508486 ?auto_1508494 ) ( OBJ-AT ?auto_1508485 ?auto_1508494 ) ( IN-CITY ?auto_1508493 ?auto_1508495 ) ( not ( = ?auto_1508484 ?auto_1508493 ) ) ( OBJ-AT ?auto_1508490 ?auto_1508493 ) ( IN-CITY ?auto_1508491 ?auto_1508495 ) ( not ( = ?auto_1508484 ?auto_1508491 ) ) ( OBJ-AT ?auto_1508488 ?auto_1508491 ) ( OBJ-AT ?auto_1508489 ?auto_1508493 ) ( OBJ-AT ?auto_1508487 ?auto_1508493 ) ( TRUCK-AT ?auto_1508492 ?auto_1508484 ) ( not ( = ?auto_1508487 ?auto_1508489 ) ) ( not ( = ?auto_1508487 ?auto_1508488 ) ) ( not ( = ?auto_1508489 ?auto_1508488 ) ) ( not ( = ?auto_1508491 ?auto_1508493 ) ) ( not ( = ?auto_1508487 ?auto_1508490 ) ) ( not ( = ?auto_1508489 ?auto_1508490 ) ) ( not ( = ?auto_1508488 ?auto_1508490 ) ) ( not ( = ?auto_1508487 ?auto_1508485 ) ) ( not ( = ?auto_1508489 ?auto_1508485 ) ) ( not ( = ?auto_1508488 ?auto_1508485 ) ) ( not ( = ?auto_1508490 ?auto_1508485 ) ) ( not ( = ?auto_1508494 ?auto_1508493 ) ) ( not ( = ?auto_1508494 ?auto_1508491 ) ) ( not ( = ?auto_1508487 ?auto_1508486 ) ) ( not ( = ?auto_1508489 ?auto_1508486 ) ) ( not ( = ?auto_1508488 ?auto_1508486 ) ) ( not ( = ?auto_1508490 ?auto_1508486 ) ) ( not ( = ?auto_1508485 ?auto_1508486 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1508487 ?auto_1508489 ?auto_1508488 ?auto_1508485 ?auto_1508490 ?auto_1508486 ?auto_1508484 )
      ( DELIVER-6PKG-VERIFY ?auto_1508485 ?auto_1508486 ?auto_1508487 ?auto_1508488 ?auto_1508489 ?auto_1508490 ?auto_1508484 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1513385 - OBJ
      ?auto_1513386 - OBJ
      ?auto_1513387 - OBJ
      ?auto_1513388 - OBJ
      ?auto_1513389 - OBJ
      ?auto_1513390 - OBJ
      ?auto_1513384 - LOCATION
    )
    :vars
    (
      ?auto_1513394 - LOCATION
      ?auto_1513395 - CITY
      ?auto_1513393 - LOCATION
      ?auto_1513391 - LOCATION
      ?auto_1513392 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1513394 ?auto_1513395 ) ( IN-CITY ?auto_1513384 ?auto_1513395 ) ( not ( = ?auto_1513384 ?auto_1513394 ) ) ( OBJ-AT ?auto_1513386 ?auto_1513394 ) ( OBJ-AT ?auto_1513385 ?auto_1513394 ) ( IN-CITY ?auto_1513393 ?auto_1513395 ) ( not ( = ?auto_1513384 ?auto_1513393 ) ) ( OBJ-AT ?auto_1513390 ?auto_1513393 ) ( IN-CITY ?auto_1513391 ?auto_1513395 ) ( not ( = ?auto_1513384 ?auto_1513391 ) ) ( OBJ-AT ?auto_1513387 ?auto_1513391 ) ( OBJ-AT ?auto_1513389 ?auto_1513393 ) ( OBJ-AT ?auto_1513388 ?auto_1513393 ) ( TRUCK-AT ?auto_1513392 ?auto_1513384 ) ( not ( = ?auto_1513388 ?auto_1513389 ) ) ( not ( = ?auto_1513388 ?auto_1513387 ) ) ( not ( = ?auto_1513389 ?auto_1513387 ) ) ( not ( = ?auto_1513391 ?auto_1513393 ) ) ( not ( = ?auto_1513388 ?auto_1513390 ) ) ( not ( = ?auto_1513389 ?auto_1513390 ) ) ( not ( = ?auto_1513387 ?auto_1513390 ) ) ( not ( = ?auto_1513388 ?auto_1513385 ) ) ( not ( = ?auto_1513389 ?auto_1513385 ) ) ( not ( = ?auto_1513387 ?auto_1513385 ) ) ( not ( = ?auto_1513390 ?auto_1513385 ) ) ( not ( = ?auto_1513394 ?auto_1513393 ) ) ( not ( = ?auto_1513394 ?auto_1513391 ) ) ( not ( = ?auto_1513388 ?auto_1513386 ) ) ( not ( = ?auto_1513389 ?auto_1513386 ) ) ( not ( = ?auto_1513387 ?auto_1513386 ) ) ( not ( = ?auto_1513390 ?auto_1513386 ) ) ( not ( = ?auto_1513385 ?auto_1513386 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1513388 ?auto_1513389 ?auto_1513387 ?auto_1513385 ?auto_1513390 ?auto_1513386 ?auto_1513384 )
      ( DELIVER-6PKG-VERIFY ?auto_1513385 ?auto_1513386 ?auto_1513387 ?auto_1513388 ?auto_1513389 ?auto_1513390 ?auto_1513384 ) )
  )

)

