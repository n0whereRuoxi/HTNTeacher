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
      ?auto_950751 - OBJ
      ?auto_950750 - LOCATION
    )
    :vars
    (
      ?auto_950753 - LOCATION
      ?auto_950754 - CITY
      ?auto_950752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950753 ?auto_950754 ) ( IN-CITY ?auto_950750 ?auto_950754 ) ( not ( = ?auto_950750 ?auto_950753 ) ) ( OBJ-AT ?auto_950751 ?auto_950753 ) ( TRUCK-AT ?auto_950752 ?auto_950750 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_950752 ?auto_950750 ?auto_950753 ?auto_950754 )
      ( !LOAD-TRUCK ?auto_950751 ?auto_950752 ?auto_950753 )
      ( !DRIVE-TRUCK ?auto_950752 ?auto_950753 ?auto_950750 ?auto_950754 )
      ( !UNLOAD-TRUCK ?auto_950751 ?auto_950752 ?auto_950750 )
      ( DELIVER-1PKG-VERIFY ?auto_950751 ?auto_950750 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_950772 - OBJ
      ?auto_950773 - OBJ
      ?auto_950771 - LOCATION
    )
    :vars
    (
      ?auto_950776 - LOCATION
      ?auto_950775 - CITY
      ?auto_950777 - LOCATION
      ?auto_950774 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950776 ?auto_950775 ) ( IN-CITY ?auto_950771 ?auto_950775 ) ( not ( = ?auto_950771 ?auto_950776 ) ) ( OBJ-AT ?auto_950773 ?auto_950776 ) ( IN-CITY ?auto_950777 ?auto_950775 ) ( not ( = ?auto_950771 ?auto_950777 ) ) ( OBJ-AT ?auto_950772 ?auto_950777 ) ( TRUCK-AT ?auto_950774 ?auto_950771 ) ( not ( = ?auto_950772 ?auto_950773 ) ) ( not ( = ?auto_950776 ?auto_950777 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_950772 ?auto_950771 )
      ( DELIVER-1PKG ?auto_950773 ?auto_950771 )
      ( DELIVER-2PKG-VERIFY ?auto_950772 ?auto_950773 ?auto_950771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_950882 - OBJ
      ?auto_950883 - OBJ
      ?auto_950884 - OBJ
      ?auto_950881 - LOCATION
    )
    :vars
    (
      ?auto_950885 - LOCATION
      ?auto_950887 - CITY
      ?auto_950888 - LOCATION
      ?auto_950886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950885 ?auto_950887 ) ( IN-CITY ?auto_950881 ?auto_950887 ) ( not ( = ?auto_950881 ?auto_950885 ) ) ( OBJ-AT ?auto_950884 ?auto_950885 ) ( OBJ-AT ?auto_950883 ?auto_950885 ) ( IN-CITY ?auto_950888 ?auto_950887 ) ( not ( = ?auto_950881 ?auto_950888 ) ) ( OBJ-AT ?auto_950882 ?auto_950888 ) ( TRUCK-AT ?auto_950886 ?auto_950881 ) ( not ( = ?auto_950882 ?auto_950883 ) ) ( not ( = ?auto_950885 ?auto_950888 ) ) ( not ( = ?auto_950882 ?auto_950884 ) ) ( not ( = ?auto_950883 ?auto_950884 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_950882 ?auto_950883 ?auto_950881 )
      ( DELIVER-1PKG ?auto_950884 ?auto_950881 )
      ( DELIVER-3PKG-VERIFY ?auto_950882 ?auto_950883 ?auto_950884 ?auto_950881 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_950912 - OBJ
      ?auto_950913 - OBJ
      ?auto_950914 - OBJ
      ?auto_950911 - LOCATION
    )
    :vars
    (
      ?auto_950918 - LOCATION
      ?auto_950915 - CITY
      ?auto_950916 - LOCATION
      ?auto_950917 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950918 ?auto_950915 ) ( IN-CITY ?auto_950911 ?auto_950915 ) ( not ( = ?auto_950911 ?auto_950918 ) ) ( OBJ-AT ?auto_950914 ?auto_950918 ) ( OBJ-AT ?auto_950912 ?auto_950918 ) ( IN-CITY ?auto_950916 ?auto_950915 ) ( not ( = ?auto_950911 ?auto_950916 ) ) ( OBJ-AT ?auto_950913 ?auto_950916 ) ( TRUCK-AT ?auto_950917 ?auto_950911 ) ( not ( = ?auto_950913 ?auto_950912 ) ) ( not ( = ?auto_950918 ?auto_950916 ) ) ( not ( = ?auto_950913 ?auto_950914 ) ) ( not ( = ?auto_950912 ?auto_950914 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_950913 ?auto_950912 ?auto_950914 ?auto_950911 )
      ( DELIVER-3PKG-VERIFY ?auto_950912 ?auto_950913 ?auto_950914 ?auto_950911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_950929 - OBJ
      ?auto_950930 - OBJ
      ?auto_950931 - OBJ
      ?auto_950928 - LOCATION
    )
    :vars
    (
      ?auto_950932 - LOCATION
      ?auto_950934 - CITY
      ?auto_950933 - LOCATION
      ?auto_950935 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950932 ?auto_950934 ) ( IN-CITY ?auto_950928 ?auto_950934 ) ( not ( = ?auto_950928 ?auto_950932 ) ) ( OBJ-AT ?auto_950930 ?auto_950932 ) ( OBJ-AT ?auto_950929 ?auto_950932 ) ( IN-CITY ?auto_950933 ?auto_950934 ) ( not ( = ?auto_950928 ?auto_950933 ) ) ( OBJ-AT ?auto_950931 ?auto_950933 ) ( TRUCK-AT ?auto_950935 ?auto_950928 ) ( not ( = ?auto_950931 ?auto_950929 ) ) ( not ( = ?auto_950932 ?auto_950933 ) ) ( not ( = ?auto_950931 ?auto_950930 ) ) ( not ( = ?auto_950929 ?auto_950930 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_950929 ?auto_950931 ?auto_950930 ?auto_950928 )
      ( DELIVER-3PKG-VERIFY ?auto_950929 ?auto_950930 ?auto_950931 ?auto_950928 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_952011 - OBJ
      ?auto_952012 - OBJ
      ?auto_952013 - OBJ
      ?auto_952014 - OBJ
      ?auto_952010 - LOCATION
    )
    :vars
    (
      ?auto_952017 - LOCATION
      ?auto_952015 - CITY
      ?auto_952018 - LOCATION
      ?auto_952019 - LOCATION
      ?auto_952016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_952017 ?auto_952015 ) ( IN-CITY ?auto_952010 ?auto_952015 ) ( not ( = ?auto_952010 ?auto_952017 ) ) ( OBJ-AT ?auto_952014 ?auto_952017 ) ( IN-CITY ?auto_952018 ?auto_952015 ) ( not ( = ?auto_952010 ?auto_952018 ) ) ( OBJ-AT ?auto_952013 ?auto_952018 ) ( OBJ-AT ?auto_952012 ?auto_952018 ) ( IN-CITY ?auto_952019 ?auto_952015 ) ( not ( = ?auto_952010 ?auto_952019 ) ) ( OBJ-AT ?auto_952011 ?auto_952019 ) ( TRUCK-AT ?auto_952016 ?auto_952010 ) ( not ( = ?auto_952011 ?auto_952012 ) ) ( not ( = ?auto_952018 ?auto_952019 ) ) ( not ( = ?auto_952011 ?auto_952013 ) ) ( not ( = ?auto_952012 ?auto_952013 ) ) ( not ( = ?auto_952011 ?auto_952014 ) ) ( not ( = ?auto_952012 ?auto_952014 ) ) ( not ( = ?auto_952013 ?auto_952014 ) ) ( not ( = ?auto_952017 ?auto_952018 ) ) ( not ( = ?auto_952017 ?auto_952019 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_952012 ?auto_952011 ?auto_952013 ?auto_952010 )
      ( DELIVER-1PKG ?auto_952014 ?auto_952010 )
      ( DELIVER-4PKG-VERIFY ?auto_952011 ?auto_952012 ?auto_952013 ?auto_952014 ?auto_952010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_952043 - OBJ
      ?auto_952044 - OBJ
      ?auto_952045 - OBJ
      ?auto_952046 - OBJ
      ?auto_952042 - LOCATION
    )
    :vars
    (
      ?auto_952050 - LOCATION
      ?auto_952048 - CITY
      ?auto_952047 - LOCATION
      ?auto_952049 - LOCATION
      ?auto_952051 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_952050 ?auto_952048 ) ( IN-CITY ?auto_952042 ?auto_952048 ) ( not ( = ?auto_952042 ?auto_952050 ) ) ( OBJ-AT ?auto_952045 ?auto_952050 ) ( IN-CITY ?auto_952047 ?auto_952048 ) ( not ( = ?auto_952042 ?auto_952047 ) ) ( OBJ-AT ?auto_952046 ?auto_952047 ) ( OBJ-AT ?auto_952044 ?auto_952047 ) ( IN-CITY ?auto_952049 ?auto_952048 ) ( not ( = ?auto_952042 ?auto_952049 ) ) ( OBJ-AT ?auto_952043 ?auto_952049 ) ( TRUCK-AT ?auto_952051 ?auto_952042 ) ( not ( = ?auto_952043 ?auto_952044 ) ) ( not ( = ?auto_952047 ?auto_952049 ) ) ( not ( = ?auto_952043 ?auto_952046 ) ) ( not ( = ?auto_952044 ?auto_952046 ) ) ( not ( = ?auto_952043 ?auto_952045 ) ) ( not ( = ?auto_952044 ?auto_952045 ) ) ( not ( = ?auto_952046 ?auto_952045 ) ) ( not ( = ?auto_952050 ?auto_952047 ) ) ( not ( = ?auto_952050 ?auto_952049 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_952043 ?auto_952044 ?auto_952046 ?auto_952045 ?auto_952042 )
      ( DELIVER-4PKG-VERIFY ?auto_952043 ?auto_952044 ?auto_952045 ?auto_952046 ?auto_952042 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_952197 - OBJ
      ?auto_952198 - OBJ
      ?auto_952199 - OBJ
      ?auto_952200 - OBJ
      ?auto_952196 - LOCATION
    )
    :vars
    (
      ?auto_952202 - LOCATION
      ?auto_952205 - CITY
      ?auto_952201 - LOCATION
      ?auto_952203 - LOCATION
      ?auto_952204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_952202 ?auto_952205 ) ( IN-CITY ?auto_952196 ?auto_952205 ) ( not ( = ?auto_952196 ?auto_952202 ) ) ( OBJ-AT ?auto_952198 ?auto_952202 ) ( IN-CITY ?auto_952201 ?auto_952205 ) ( not ( = ?auto_952196 ?auto_952201 ) ) ( OBJ-AT ?auto_952200 ?auto_952201 ) ( OBJ-AT ?auto_952199 ?auto_952201 ) ( IN-CITY ?auto_952203 ?auto_952205 ) ( not ( = ?auto_952196 ?auto_952203 ) ) ( OBJ-AT ?auto_952197 ?auto_952203 ) ( TRUCK-AT ?auto_952204 ?auto_952196 ) ( not ( = ?auto_952197 ?auto_952199 ) ) ( not ( = ?auto_952201 ?auto_952203 ) ) ( not ( = ?auto_952197 ?auto_952200 ) ) ( not ( = ?auto_952199 ?auto_952200 ) ) ( not ( = ?auto_952197 ?auto_952198 ) ) ( not ( = ?auto_952199 ?auto_952198 ) ) ( not ( = ?auto_952200 ?auto_952198 ) ) ( not ( = ?auto_952202 ?auto_952201 ) ) ( not ( = ?auto_952202 ?auto_952203 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_952197 ?auto_952199 ?auto_952198 ?auto_952200 ?auto_952196 )
      ( DELIVER-4PKG-VERIFY ?auto_952197 ?auto_952198 ?auto_952199 ?auto_952200 ?auto_952196 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_952324 - OBJ
      ?auto_952325 - OBJ
      ?auto_952326 - OBJ
      ?auto_952327 - OBJ
      ?auto_952323 - LOCATION
    )
    :vars
    (
      ?auto_952329 - LOCATION
      ?auto_952332 - CITY
      ?auto_952328 - LOCATION
      ?auto_952330 - LOCATION
      ?auto_952331 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_952329 ?auto_952332 ) ( IN-CITY ?auto_952323 ?auto_952332 ) ( not ( = ?auto_952323 ?auto_952329 ) ) ( OBJ-AT ?auto_952327 ?auto_952329 ) ( IN-CITY ?auto_952328 ?auto_952332 ) ( not ( = ?auto_952323 ?auto_952328 ) ) ( OBJ-AT ?auto_952326 ?auto_952328 ) ( OBJ-AT ?auto_952324 ?auto_952328 ) ( IN-CITY ?auto_952330 ?auto_952332 ) ( not ( = ?auto_952323 ?auto_952330 ) ) ( OBJ-AT ?auto_952325 ?auto_952330 ) ( TRUCK-AT ?auto_952331 ?auto_952323 ) ( not ( = ?auto_952325 ?auto_952324 ) ) ( not ( = ?auto_952328 ?auto_952330 ) ) ( not ( = ?auto_952325 ?auto_952326 ) ) ( not ( = ?auto_952324 ?auto_952326 ) ) ( not ( = ?auto_952325 ?auto_952327 ) ) ( not ( = ?auto_952324 ?auto_952327 ) ) ( not ( = ?auto_952326 ?auto_952327 ) ) ( not ( = ?auto_952329 ?auto_952328 ) ) ( not ( = ?auto_952329 ?auto_952330 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_952325 ?auto_952324 ?auto_952327 ?auto_952326 ?auto_952323 )
      ( DELIVER-4PKG-VERIFY ?auto_952324 ?auto_952325 ?auto_952326 ?auto_952327 ?auto_952323 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_952356 - OBJ
      ?auto_952357 - OBJ
      ?auto_952358 - OBJ
      ?auto_952359 - OBJ
      ?auto_952355 - LOCATION
    )
    :vars
    (
      ?auto_952361 - LOCATION
      ?auto_952364 - CITY
      ?auto_952360 - LOCATION
      ?auto_952362 - LOCATION
      ?auto_952363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_952361 ?auto_952364 ) ( IN-CITY ?auto_952355 ?auto_952364 ) ( not ( = ?auto_952355 ?auto_952361 ) ) ( OBJ-AT ?auto_952358 ?auto_952361 ) ( IN-CITY ?auto_952360 ?auto_952364 ) ( not ( = ?auto_952355 ?auto_952360 ) ) ( OBJ-AT ?auto_952359 ?auto_952360 ) ( OBJ-AT ?auto_952356 ?auto_952360 ) ( IN-CITY ?auto_952362 ?auto_952364 ) ( not ( = ?auto_952355 ?auto_952362 ) ) ( OBJ-AT ?auto_952357 ?auto_952362 ) ( TRUCK-AT ?auto_952363 ?auto_952355 ) ( not ( = ?auto_952357 ?auto_952356 ) ) ( not ( = ?auto_952360 ?auto_952362 ) ) ( not ( = ?auto_952357 ?auto_952359 ) ) ( not ( = ?auto_952356 ?auto_952359 ) ) ( not ( = ?auto_952357 ?auto_952358 ) ) ( not ( = ?auto_952356 ?auto_952358 ) ) ( not ( = ?auto_952359 ?auto_952358 ) ) ( not ( = ?auto_952361 ?auto_952360 ) ) ( not ( = ?auto_952361 ?auto_952362 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_952357 ?auto_952356 ?auto_952358 ?auto_952359 ?auto_952355 )
      ( DELIVER-4PKG-VERIFY ?auto_952356 ?auto_952357 ?auto_952358 ?auto_952359 ?auto_952355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_952457 - OBJ
      ?auto_952458 - OBJ
      ?auto_952459 - OBJ
      ?auto_952460 - OBJ
      ?auto_952456 - LOCATION
    )
    :vars
    (
      ?auto_952462 - LOCATION
      ?auto_952465 - CITY
      ?auto_952461 - LOCATION
      ?auto_952463 - LOCATION
      ?auto_952464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_952462 ?auto_952465 ) ( IN-CITY ?auto_952456 ?auto_952465 ) ( not ( = ?auto_952456 ?auto_952462 ) ) ( OBJ-AT ?auto_952460 ?auto_952462 ) ( IN-CITY ?auto_952461 ?auto_952465 ) ( not ( = ?auto_952456 ?auto_952461 ) ) ( OBJ-AT ?auto_952458 ?auto_952461 ) ( OBJ-AT ?auto_952457 ?auto_952461 ) ( IN-CITY ?auto_952463 ?auto_952465 ) ( not ( = ?auto_952456 ?auto_952463 ) ) ( OBJ-AT ?auto_952459 ?auto_952463 ) ( TRUCK-AT ?auto_952464 ?auto_952456 ) ( not ( = ?auto_952459 ?auto_952457 ) ) ( not ( = ?auto_952461 ?auto_952463 ) ) ( not ( = ?auto_952459 ?auto_952458 ) ) ( not ( = ?auto_952457 ?auto_952458 ) ) ( not ( = ?auto_952459 ?auto_952460 ) ) ( not ( = ?auto_952457 ?auto_952460 ) ) ( not ( = ?auto_952458 ?auto_952460 ) ) ( not ( = ?auto_952462 ?auto_952461 ) ) ( not ( = ?auto_952462 ?auto_952463 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_952459 ?auto_952457 ?auto_952460 ?auto_952458 ?auto_952456 )
      ( DELIVER-4PKG-VERIFY ?auto_952457 ?auto_952458 ?auto_952459 ?auto_952460 ?auto_952456 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_967503 - OBJ
      ?auto_967504 - OBJ
      ?auto_967505 - OBJ
      ?auto_967506 - OBJ
      ?auto_967507 - OBJ
      ?auto_967502 - LOCATION
    )
    :vars
    (
      ?auto_967508 - LOCATION
      ?auto_967510 - CITY
      ?auto_967512 - LOCATION
      ?auto_967511 - LOCATION
      ?auto_967513 - LOCATION
      ?auto_967509 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_967508 ?auto_967510 ) ( IN-CITY ?auto_967502 ?auto_967510 ) ( not ( = ?auto_967502 ?auto_967508 ) ) ( OBJ-AT ?auto_967507 ?auto_967508 ) ( IN-CITY ?auto_967512 ?auto_967510 ) ( not ( = ?auto_967502 ?auto_967512 ) ) ( OBJ-AT ?auto_967506 ?auto_967512 ) ( IN-CITY ?auto_967511 ?auto_967510 ) ( not ( = ?auto_967502 ?auto_967511 ) ) ( OBJ-AT ?auto_967505 ?auto_967511 ) ( OBJ-AT ?auto_967504 ?auto_967511 ) ( IN-CITY ?auto_967513 ?auto_967510 ) ( not ( = ?auto_967502 ?auto_967513 ) ) ( OBJ-AT ?auto_967503 ?auto_967513 ) ( TRUCK-AT ?auto_967509 ?auto_967502 ) ( not ( = ?auto_967503 ?auto_967504 ) ) ( not ( = ?auto_967511 ?auto_967513 ) ) ( not ( = ?auto_967503 ?auto_967505 ) ) ( not ( = ?auto_967504 ?auto_967505 ) ) ( not ( = ?auto_967503 ?auto_967506 ) ) ( not ( = ?auto_967504 ?auto_967506 ) ) ( not ( = ?auto_967505 ?auto_967506 ) ) ( not ( = ?auto_967512 ?auto_967511 ) ) ( not ( = ?auto_967512 ?auto_967513 ) ) ( not ( = ?auto_967503 ?auto_967507 ) ) ( not ( = ?auto_967504 ?auto_967507 ) ) ( not ( = ?auto_967505 ?auto_967507 ) ) ( not ( = ?auto_967506 ?auto_967507 ) ) ( not ( = ?auto_967508 ?auto_967512 ) ) ( not ( = ?auto_967508 ?auto_967511 ) ) ( not ( = ?auto_967508 ?auto_967513 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_967503 ?auto_967504 ?auto_967506 ?auto_967505 ?auto_967502 )
      ( DELIVER-1PKG ?auto_967507 ?auto_967502 )
      ( DELIVER-5PKG-VERIFY ?auto_967503 ?auto_967504 ?auto_967505 ?auto_967506 ?auto_967507 ?auto_967502 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_967599 - OBJ
      ?auto_967600 - OBJ
      ?auto_967601 - OBJ
      ?auto_967602 - OBJ
      ?auto_967603 - OBJ
      ?auto_967598 - LOCATION
    )
    :vars
    (
      ?auto_967606 - LOCATION
      ?auto_967604 - CITY
      ?auto_967607 - LOCATION
      ?auto_967609 - LOCATION
      ?auto_967605 - LOCATION
      ?auto_967608 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_967606 ?auto_967604 ) ( IN-CITY ?auto_967598 ?auto_967604 ) ( not ( = ?auto_967598 ?auto_967606 ) ) ( OBJ-AT ?auto_967603 ?auto_967606 ) ( IN-CITY ?auto_967607 ?auto_967604 ) ( not ( = ?auto_967598 ?auto_967607 ) ) ( OBJ-AT ?auto_967601 ?auto_967607 ) ( IN-CITY ?auto_967609 ?auto_967604 ) ( not ( = ?auto_967598 ?auto_967609 ) ) ( OBJ-AT ?auto_967602 ?auto_967609 ) ( OBJ-AT ?auto_967600 ?auto_967609 ) ( IN-CITY ?auto_967605 ?auto_967604 ) ( not ( = ?auto_967598 ?auto_967605 ) ) ( OBJ-AT ?auto_967599 ?auto_967605 ) ( TRUCK-AT ?auto_967608 ?auto_967598 ) ( not ( = ?auto_967599 ?auto_967600 ) ) ( not ( = ?auto_967609 ?auto_967605 ) ) ( not ( = ?auto_967599 ?auto_967602 ) ) ( not ( = ?auto_967600 ?auto_967602 ) ) ( not ( = ?auto_967599 ?auto_967601 ) ) ( not ( = ?auto_967600 ?auto_967601 ) ) ( not ( = ?auto_967602 ?auto_967601 ) ) ( not ( = ?auto_967607 ?auto_967609 ) ) ( not ( = ?auto_967607 ?auto_967605 ) ) ( not ( = ?auto_967599 ?auto_967603 ) ) ( not ( = ?auto_967600 ?auto_967603 ) ) ( not ( = ?auto_967602 ?auto_967603 ) ) ( not ( = ?auto_967601 ?auto_967603 ) ) ( not ( = ?auto_967606 ?auto_967607 ) ) ( not ( = ?auto_967606 ?auto_967609 ) ) ( not ( = ?auto_967606 ?auto_967605 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_967599 ?auto_967600 ?auto_967602 ?auto_967601 ?auto_967603 ?auto_967598 )
      ( DELIVER-5PKG-VERIFY ?auto_967599 ?auto_967600 ?auto_967601 ?auto_967602 ?auto_967603 ?auto_967598 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_967650 - OBJ
      ?auto_967651 - OBJ
      ?auto_967652 - OBJ
      ?auto_967653 - OBJ
      ?auto_967654 - OBJ
      ?auto_967649 - LOCATION
    )
    :vars
    (
      ?auto_967658 - LOCATION
      ?auto_967657 - CITY
      ?auto_967656 - LOCATION
      ?auto_967659 - LOCATION
      ?auto_967655 - LOCATION
      ?auto_967660 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_967658 ?auto_967657 ) ( IN-CITY ?auto_967649 ?auto_967657 ) ( not ( = ?auto_967649 ?auto_967658 ) ) ( OBJ-AT ?auto_967653 ?auto_967658 ) ( IN-CITY ?auto_967656 ?auto_967657 ) ( not ( = ?auto_967649 ?auto_967656 ) ) ( OBJ-AT ?auto_967652 ?auto_967656 ) ( IN-CITY ?auto_967659 ?auto_967657 ) ( not ( = ?auto_967649 ?auto_967659 ) ) ( OBJ-AT ?auto_967654 ?auto_967659 ) ( OBJ-AT ?auto_967651 ?auto_967659 ) ( IN-CITY ?auto_967655 ?auto_967657 ) ( not ( = ?auto_967649 ?auto_967655 ) ) ( OBJ-AT ?auto_967650 ?auto_967655 ) ( TRUCK-AT ?auto_967660 ?auto_967649 ) ( not ( = ?auto_967650 ?auto_967651 ) ) ( not ( = ?auto_967659 ?auto_967655 ) ) ( not ( = ?auto_967650 ?auto_967654 ) ) ( not ( = ?auto_967651 ?auto_967654 ) ) ( not ( = ?auto_967650 ?auto_967652 ) ) ( not ( = ?auto_967651 ?auto_967652 ) ) ( not ( = ?auto_967654 ?auto_967652 ) ) ( not ( = ?auto_967656 ?auto_967659 ) ) ( not ( = ?auto_967656 ?auto_967655 ) ) ( not ( = ?auto_967650 ?auto_967653 ) ) ( not ( = ?auto_967651 ?auto_967653 ) ) ( not ( = ?auto_967654 ?auto_967653 ) ) ( not ( = ?auto_967652 ?auto_967653 ) ) ( not ( = ?auto_967658 ?auto_967656 ) ) ( not ( = ?auto_967658 ?auto_967659 ) ) ( not ( = ?auto_967658 ?auto_967655 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_967650 ?auto_967651 ?auto_967652 ?auto_967654 ?auto_967653 ?auto_967649 )
      ( DELIVER-5PKG-VERIFY ?auto_967650 ?auto_967651 ?auto_967652 ?auto_967653 ?auto_967654 ?auto_967649 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_968926 - OBJ
      ?auto_968927 - OBJ
      ?auto_968928 - OBJ
      ?auto_968929 - OBJ
      ?auto_968930 - OBJ
      ?auto_968925 - LOCATION
    )
    :vars
    (
      ?auto_968934 - LOCATION
      ?auto_968933 - CITY
      ?auto_968932 - LOCATION
      ?auto_968935 - LOCATION
      ?auto_968931 - LOCATION
      ?auto_968936 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_968934 ?auto_968933 ) ( IN-CITY ?auto_968925 ?auto_968933 ) ( not ( = ?auto_968925 ?auto_968934 ) ) ( OBJ-AT ?auto_968930 ?auto_968934 ) ( IN-CITY ?auto_968932 ?auto_968933 ) ( not ( = ?auto_968925 ?auto_968932 ) ) ( OBJ-AT ?auto_968927 ?auto_968932 ) ( IN-CITY ?auto_968935 ?auto_968933 ) ( not ( = ?auto_968925 ?auto_968935 ) ) ( OBJ-AT ?auto_968929 ?auto_968935 ) ( OBJ-AT ?auto_968928 ?auto_968935 ) ( IN-CITY ?auto_968931 ?auto_968933 ) ( not ( = ?auto_968925 ?auto_968931 ) ) ( OBJ-AT ?auto_968926 ?auto_968931 ) ( TRUCK-AT ?auto_968936 ?auto_968925 ) ( not ( = ?auto_968926 ?auto_968928 ) ) ( not ( = ?auto_968935 ?auto_968931 ) ) ( not ( = ?auto_968926 ?auto_968929 ) ) ( not ( = ?auto_968928 ?auto_968929 ) ) ( not ( = ?auto_968926 ?auto_968927 ) ) ( not ( = ?auto_968928 ?auto_968927 ) ) ( not ( = ?auto_968929 ?auto_968927 ) ) ( not ( = ?auto_968932 ?auto_968935 ) ) ( not ( = ?auto_968932 ?auto_968931 ) ) ( not ( = ?auto_968926 ?auto_968930 ) ) ( not ( = ?auto_968928 ?auto_968930 ) ) ( not ( = ?auto_968929 ?auto_968930 ) ) ( not ( = ?auto_968927 ?auto_968930 ) ) ( not ( = ?auto_968934 ?auto_968932 ) ) ( not ( = ?auto_968934 ?auto_968935 ) ) ( not ( = ?auto_968934 ?auto_968931 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_968926 ?auto_968928 ?auto_968927 ?auto_968929 ?auto_968930 ?auto_968925 )
      ( DELIVER-5PKG-VERIFY ?auto_968926 ?auto_968927 ?auto_968928 ?auto_968929 ?auto_968930 ?auto_968925 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_968977 - OBJ
      ?auto_968978 - OBJ
      ?auto_968979 - OBJ
      ?auto_968980 - OBJ
      ?auto_968981 - OBJ
      ?auto_968976 - LOCATION
    )
    :vars
    (
      ?auto_968985 - LOCATION
      ?auto_968984 - CITY
      ?auto_968983 - LOCATION
      ?auto_968986 - LOCATION
      ?auto_968982 - LOCATION
      ?auto_968987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_968985 ?auto_968984 ) ( IN-CITY ?auto_968976 ?auto_968984 ) ( not ( = ?auto_968976 ?auto_968985 ) ) ( OBJ-AT ?auto_968980 ?auto_968985 ) ( IN-CITY ?auto_968983 ?auto_968984 ) ( not ( = ?auto_968976 ?auto_968983 ) ) ( OBJ-AT ?auto_968978 ?auto_968983 ) ( IN-CITY ?auto_968986 ?auto_968984 ) ( not ( = ?auto_968976 ?auto_968986 ) ) ( OBJ-AT ?auto_968981 ?auto_968986 ) ( OBJ-AT ?auto_968979 ?auto_968986 ) ( IN-CITY ?auto_968982 ?auto_968984 ) ( not ( = ?auto_968976 ?auto_968982 ) ) ( OBJ-AT ?auto_968977 ?auto_968982 ) ( TRUCK-AT ?auto_968987 ?auto_968976 ) ( not ( = ?auto_968977 ?auto_968979 ) ) ( not ( = ?auto_968986 ?auto_968982 ) ) ( not ( = ?auto_968977 ?auto_968981 ) ) ( not ( = ?auto_968979 ?auto_968981 ) ) ( not ( = ?auto_968977 ?auto_968978 ) ) ( not ( = ?auto_968979 ?auto_968978 ) ) ( not ( = ?auto_968981 ?auto_968978 ) ) ( not ( = ?auto_968983 ?auto_968986 ) ) ( not ( = ?auto_968983 ?auto_968982 ) ) ( not ( = ?auto_968977 ?auto_968980 ) ) ( not ( = ?auto_968979 ?auto_968980 ) ) ( not ( = ?auto_968981 ?auto_968980 ) ) ( not ( = ?auto_968978 ?auto_968980 ) ) ( not ( = ?auto_968985 ?auto_968983 ) ) ( not ( = ?auto_968985 ?auto_968986 ) ) ( not ( = ?auto_968985 ?auto_968982 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_968977 ?auto_968979 ?auto_968978 ?auto_968981 ?auto_968980 ?auto_968976 )
      ( DELIVER-5PKG-VERIFY ?auto_968977 ?auto_968978 ?auto_968979 ?auto_968980 ?auto_968981 ?auto_968976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_969334 - OBJ
      ?auto_969335 - OBJ
      ?auto_969336 - OBJ
      ?auto_969337 - OBJ
      ?auto_969338 - OBJ
      ?auto_969333 - LOCATION
    )
    :vars
    (
      ?auto_969342 - LOCATION
      ?auto_969341 - CITY
      ?auto_969340 - LOCATION
      ?auto_969343 - LOCATION
      ?auto_969339 - LOCATION
      ?auto_969344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_969342 ?auto_969341 ) ( IN-CITY ?auto_969333 ?auto_969341 ) ( not ( = ?auto_969333 ?auto_969342 ) ) ( OBJ-AT ?auto_969336 ?auto_969342 ) ( IN-CITY ?auto_969340 ?auto_969341 ) ( not ( = ?auto_969333 ?auto_969340 ) ) ( OBJ-AT ?auto_969335 ?auto_969340 ) ( IN-CITY ?auto_969343 ?auto_969341 ) ( not ( = ?auto_969333 ?auto_969343 ) ) ( OBJ-AT ?auto_969338 ?auto_969343 ) ( OBJ-AT ?auto_969337 ?auto_969343 ) ( IN-CITY ?auto_969339 ?auto_969341 ) ( not ( = ?auto_969333 ?auto_969339 ) ) ( OBJ-AT ?auto_969334 ?auto_969339 ) ( TRUCK-AT ?auto_969344 ?auto_969333 ) ( not ( = ?auto_969334 ?auto_969337 ) ) ( not ( = ?auto_969343 ?auto_969339 ) ) ( not ( = ?auto_969334 ?auto_969338 ) ) ( not ( = ?auto_969337 ?auto_969338 ) ) ( not ( = ?auto_969334 ?auto_969335 ) ) ( not ( = ?auto_969337 ?auto_969335 ) ) ( not ( = ?auto_969338 ?auto_969335 ) ) ( not ( = ?auto_969340 ?auto_969343 ) ) ( not ( = ?auto_969340 ?auto_969339 ) ) ( not ( = ?auto_969334 ?auto_969336 ) ) ( not ( = ?auto_969337 ?auto_969336 ) ) ( not ( = ?auto_969338 ?auto_969336 ) ) ( not ( = ?auto_969335 ?auto_969336 ) ) ( not ( = ?auto_969342 ?auto_969340 ) ) ( not ( = ?auto_969342 ?auto_969343 ) ) ( not ( = ?auto_969342 ?auto_969339 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_969334 ?auto_969337 ?auto_969335 ?auto_969338 ?auto_969336 ?auto_969333 )
      ( DELIVER-5PKG-VERIFY ?auto_969334 ?auto_969335 ?auto_969336 ?auto_969337 ?auto_969338 ?auto_969333 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_971505 - OBJ
      ?auto_971506 - OBJ
      ?auto_971507 - OBJ
      ?auto_971508 - OBJ
      ?auto_971509 - OBJ
      ?auto_971504 - LOCATION
    )
    :vars
    (
      ?auto_971513 - LOCATION
      ?auto_971512 - CITY
      ?auto_971511 - LOCATION
      ?auto_971514 - LOCATION
      ?auto_971510 - LOCATION
      ?auto_971515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_971513 ?auto_971512 ) ( IN-CITY ?auto_971504 ?auto_971512 ) ( not ( = ?auto_971504 ?auto_971513 ) ) ( OBJ-AT ?auto_971509 ?auto_971513 ) ( IN-CITY ?auto_971511 ?auto_971512 ) ( not ( = ?auto_971504 ?auto_971511 ) ) ( OBJ-AT ?auto_971508 ?auto_971511 ) ( IN-CITY ?auto_971514 ?auto_971512 ) ( not ( = ?auto_971504 ?auto_971514 ) ) ( OBJ-AT ?auto_971507 ?auto_971514 ) ( OBJ-AT ?auto_971505 ?auto_971514 ) ( IN-CITY ?auto_971510 ?auto_971512 ) ( not ( = ?auto_971504 ?auto_971510 ) ) ( OBJ-AT ?auto_971506 ?auto_971510 ) ( TRUCK-AT ?auto_971515 ?auto_971504 ) ( not ( = ?auto_971506 ?auto_971505 ) ) ( not ( = ?auto_971514 ?auto_971510 ) ) ( not ( = ?auto_971506 ?auto_971507 ) ) ( not ( = ?auto_971505 ?auto_971507 ) ) ( not ( = ?auto_971506 ?auto_971508 ) ) ( not ( = ?auto_971505 ?auto_971508 ) ) ( not ( = ?auto_971507 ?auto_971508 ) ) ( not ( = ?auto_971511 ?auto_971514 ) ) ( not ( = ?auto_971511 ?auto_971510 ) ) ( not ( = ?auto_971506 ?auto_971509 ) ) ( not ( = ?auto_971505 ?auto_971509 ) ) ( not ( = ?auto_971507 ?auto_971509 ) ) ( not ( = ?auto_971508 ?auto_971509 ) ) ( not ( = ?auto_971513 ?auto_971511 ) ) ( not ( = ?auto_971513 ?auto_971514 ) ) ( not ( = ?auto_971513 ?auto_971510 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_971506 ?auto_971505 ?auto_971508 ?auto_971507 ?auto_971509 ?auto_971504 )
      ( DELIVER-5PKG-VERIFY ?auto_971505 ?auto_971506 ?auto_971507 ?auto_971508 ?auto_971509 ?auto_971504 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_971601 - OBJ
      ?auto_971602 - OBJ
      ?auto_971603 - OBJ
      ?auto_971604 - OBJ
      ?auto_971605 - OBJ
      ?auto_971600 - LOCATION
    )
    :vars
    (
      ?auto_971609 - LOCATION
      ?auto_971608 - CITY
      ?auto_971607 - LOCATION
      ?auto_971610 - LOCATION
      ?auto_971606 - LOCATION
      ?auto_971611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_971609 ?auto_971608 ) ( IN-CITY ?auto_971600 ?auto_971608 ) ( not ( = ?auto_971600 ?auto_971609 ) ) ( OBJ-AT ?auto_971605 ?auto_971609 ) ( IN-CITY ?auto_971607 ?auto_971608 ) ( not ( = ?auto_971600 ?auto_971607 ) ) ( OBJ-AT ?auto_971603 ?auto_971607 ) ( IN-CITY ?auto_971610 ?auto_971608 ) ( not ( = ?auto_971600 ?auto_971610 ) ) ( OBJ-AT ?auto_971604 ?auto_971610 ) ( OBJ-AT ?auto_971601 ?auto_971610 ) ( IN-CITY ?auto_971606 ?auto_971608 ) ( not ( = ?auto_971600 ?auto_971606 ) ) ( OBJ-AT ?auto_971602 ?auto_971606 ) ( TRUCK-AT ?auto_971611 ?auto_971600 ) ( not ( = ?auto_971602 ?auto_971601 ) ) ( not ( = ?auto_971610 ?auto_971606 ) ) ( not ( = ?auto_971602 ?auto_971604 ) ) ( not ( = ?auto_971601 ?auto_971604 ) ) ( not ( = ?auto_971602 ?auto_971603 ) ) ( not ( = ?auto_971601 ?auto_971603 ) ) ( not ( = ?auto_971604 ?auto_971603 ) ) ( not ( = ?auto_971607 ?auto_971610 ) ) ( not ( = ?auto_971607 ?auto_971606 ) ) ( not ( = ?auto_971602 ?auto_971605 ) ) ( not ( = ?auto_971601 ?auto_971605 ) ) ( not ( = ?auto_971604 ?auto_971605 ) ) ( not ( = ?auto_971603 ?auto_971605 ) ) ( not ( = ?auto_971609 ?auto_971607 ) ) ( not ( = ?auto_971609 ?auto_971610 ) ) ( not ( = ?auto_971609 ?auto_971606 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_971602 ?auto_971601 ?auto_971603 ?auto_971604 ?auto_971605 ?auto_971600 )
      ( DELIVER-5PKG-VERIFY ?auto_971601 ?auto_971602 ?auto_971603 ?auto_971604 ?auto_971605 ?auto_971600 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_971652 - OBJ
      ?auto_971653 - OBJ
      ?auto_971654 - OBJ
      ?auto_971655 - OBJ
      ?auto_971656 - OBJ
      ?auto_971651 - LOCATION
    )
    :vars
    (
      ?auto_971660 - LOCATION
      ?auto_971659 - CITY
      ?auto_971658 - LOCATION
      ?auto_971661 - LOCATION
      ?auto_971657 - LOCATION
      ?auto_971662 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_971660 ?auto_971659 ) ( IN-CITY ?auto_971651 ?auto_971659 ) ( not ( = ?auto_971651 ?auto_971660 ) ) ( OBJ-AT ?auto_971655 ?auto_971660 ) ( IN-CITY ?auto_971658 ?auto_971659 ) ( not ( = ?auto_971651 ?auto_971658 ) ) ( OBJ-AT ?auto_971654 ?auto_971658 ) ( IN-CITY ?auto_971661 ?auto_971659 ) ( not ( = ?auto_971651 ?auto_971661 ) ) ( OBJ-AT ?auto_971656 ?auto_971661 ) ( OBJ-AT ?auto_971652 ?auto_971661 ) ( IN-CITY ?auto_971657 ?auto_971659 ) ( not ( = ?auto_971651 ?auto_971657 ) ) ( OBJ-AT ?auto_971653 ?auto_971657 ) ( TRUCK-AT ?auto_971662 ?auto_971651 ) ( not ( = ?auto_971653 ?auto_971652 ) ) ( not ( = ?auto_971661 ?auto_971657 ) ) ( not ( = ?auto_971653 ?auto_971656 ) ) ( not ( = ?auto_971652 ?auto_971656 ) ) ( not ( = ?auto_971653 ?auto_971654 ) ) ( not ( = ?auto_971652 ?auto_971654 ) ) ( not ( = ?auto_971656 ?auto_971654 ) ) ( not ( = ?auto_971658 ?auto_971661 ) ) ( not ( = ?auto_971658 ?auto_971657 ) ) ( not ( = ?auto_971653 ?auto_971655 ) ) ( not ( = ?auto_971652 ?auto_971655 ) ) ( not ( = ?auto_971656 ?auto_971655 ) ) ( not ( = ?auto_971654 ?auto_971655 ) ) ( not ( = ?auto_971660 ?auto_971658 ) ) ( not ( = ?auto_971660 ?auto_971661 ) ) ( not ( = ?auto_971660 ?auto_971657 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_971653 ?auto_971652 ?auto_971654 ?auto_971656 ?auto_971655 ?auto_971651 )
      ( DELIVER-5PKG-VERIFY ?auto_971652 ?auto_971653 ?auto_971654 ?auto_971655 ?auto_971656 ?auto_971651 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_972892 - OBJ
      ?auto_972893 - OBJ
      ?auto_972894 - OBJ
      ?auto_972895 - OBJ
      ?auto_972896 - OBJ
      ?auto_972891 - LOCATION
    )
    :vars
    (
      ?auto_972900 - LOCATION
      ?auto_972899 - CITY
      ?auto_972898 - LOCATION
      ?auto_972901 - LOCATION
      ?auto_972897 - LOCATION
      ?auto_972902 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_972900 ?auto_972899 ) ( IN-CITY ?auto_972891 ?auto_972899 ) ( not ( = ?auto_972891 ?auto_972900 ) ) ( OBJ-AT ?auto_972896 ?auto_972900 ) ( IN-CITY ?auto_972898 ?auto_972899 ) ( not ( = ?auto_972891 ?auto_972898 ) ) ( OBJ-AT ?auto_972895 ?auto_972898 ) ( IN-CITY ?auto_972901 ?auto_972899 ) ( not ( = ?auto_972891 ?auto_972901 ) ) ( OBJ-AT ?auto_972893 ?auto_972901 ) ( OBJ-AT ?auto_972892 ?auto_972901 ) ( IN-CITY ?auto_972897 ?auto_972899 ) ( not ( = ?auto_972891 ?auto_972897 ) ) ( OBJ-AT ?auto_972894 ?auto_972897 ) ( TRUCK-AT ?auto_972902 ?auto_972891 ) ( not ( = ?auto_972894 ?auto_972892 ) ) ( not ( = ?auto_972901 ?auto_972897 ) ) ( not ( = ?auto_972894 ?auto_972893 ) ) ( not ( = ?auto_972892 ?auto_972893 ) ) ( not ( = ?auto_972894 ?auto_972895 ) ) ( not ( = ?auto_972892 ?auto_972895 ) ) ( not ( = ?auto_972893 ?auto_972895 ) ) ( not ( = ?auto_972898 ?auto_972901 ) ) ( not ( = ?auto_972898 ?auto_972897 ) ) ( not ( = ?auto_972894 ?auto_972896 ) ) ( not ( = ?auto_972892 ?auto_972896 ) ) ( not ( = ?auto_972893 ?auto_972896 ) ) ( not ( = ?auto_972895 ?auto_972896 ) ) ( not ( = ?auto_972900 ?auto_972898 ) ) ( not ( = ?auto_972900 ?auto_972901 ) ) ( not ( = ?auto_972900 ?auto_972897 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_972894 ?auto_972892 ?auto_972895 ?auto_972893 ?auto_972896 ?auto_972891 )
      ( DELIVER-5PKG-VERIFY ?auto_972892 ?auto_972893 ?auto_972894 ?auto_972895 ?auto_972896 ?auto_972891 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1224747 - OBJ
      ?auto_1224748 - OBJ
      ?auto_1224749 - OBJ
      ?auto_1224750 - OBJ
      ?auto_1224751 - OBJ
      ?auto_1224752 - OBJ
      ?auto_1224746 - LOCATION
    )
    :vars
    (
      ?auto_1224753 - LOCATION
      ?auto_1224754 - CITY
      ?auto_1224758 - LOCATION
      ?auto_1224757 - LOCATION
      ?auto_1224756 - LOCATION
      ?auto_1224755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1224753 ?auto_1224754 ) ( IN-CITY ?auto_1224746 ?auto_1224754 ) ( not ( = ?auto_1224746 ?auto_1224753 ) ) ( OBJ-AT ?auto_1224752 ?auto_1224753 ) ( IN-CITY ?auto_1224758 ?auto_1224754 ) ( not ( = ?auto_1224746 ?auto_1224758 ) ) ( OBJ-AT ?auto_1224751 ?auto_1224758 ) ( IN-CITY ?auto_1224757 ?auto_1224754 ) ( not ( = ?auto_1224746 ?auto_1224757 ) ) ( OBJ-AT ?auto_1224750 ?auto_1224757 ) ( OBJ-AT ?auto_1224749 ?auto_1224753 ) ( OBJ-AT ?auto_1224748 ?auto_1224753 ) ( IN-CITY ?auto_1224756 ?auto_1224754 ) ( not ( = ?auto_1224746 ?auto_1224756 ) ) ( OBJ-AT ?auto_1224747 ?auto_1224756 ) ( TRUCK-AT ?auto_1224755 ?auto_1224746 ) ( not ( = ?auto_1224747 ?auto_1224748 ) ) ( not ( = ?auto_1224753 ?auto_1224756 ) ) ( not ( = ?auto_1224747 ?auto_1224749 ) ) ( not ( = ?auto_1224748 ?auto_1224749 ) ) ( not ( = ?auto_1224747 ?auto_1224750 ) ) ( not ( = ?auto_1224748 ?auto_1224750 ) ) ( not ( = ?auto_1224749 ?auto_1224750 ) ) ( not ( = ?auto_1224757 ?auto_1224753 ) ) ( not ( = ?auto_1224757 ?auto_1224756 ) ) ( not ( = ?auto_1224747 ?auto_1224751 ) ) ( not ( = ?auto_1224748 ?auto_1224751 ) ) ( not ( = ?auto_1224749 ?auto_1224751 ) ) ( not ( = ?auto_1224750 ?auto_1224751 ) ) ( not ( = ?auto_1224758 ?auto_1224757 ) ) ( not ( = ?auto_1224758 ?auto_1224753 ) ) ( not ( = ?auto_1224758 ?auto_1224756 ) ) ( not ( = ?auto_1224747 ?auto_1224752 ) ) ( not ( = ?auto_1224748 ?auto_1224752 ) ) ( not ( = ?auto_1224749 ?auto_1224752 ) ) ( not ( = ?auto_1224750 ?auto_1224752 ) ) ( not ( = ?auto_1224751 ?auto_1224752 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1224747 ?auto_1224748 ?auto_1224750 ?auto_1224749 ?auto_1224751 ?auto_1224746 )
      ( DELIVER-1PKG ?auto_1224752 ?auto_1224746 )
      ( DELIVER-6PKG-VERIFY ?auto_1224747 ?auto_1224748 ?auto_1224749 ?auto_1224750 ?auto_1224751 ?auto_1224752 ?auto_1224746 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1224816 - OBJ
      ?auto_1224817 - OBJ
      ?auto_1224818 - OBJ
      ?auto_1224819 - OBJ
      ?auto_1224820 - OBJ
      ?auto_1224821 - OBJ
      ?auto_1224815 - LOCATION
    )
    :vars
    (
      ?auto_1224822 - LOCATION
      ?auto_1224823 - CITY
      ?auto_1224824 - LOCATION
      ?auto_1224825 - LOCATION
      ?auto_1224826 - LOCATION
      ?auto_1224827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1224822 ?auto_1224823 ) ( IN-CITY ?auto_1224815 ?auto_1224823 ) ( not ( = ?auto_1224815 ?auto_1224822 ) ) ( OBJ-AT ?auto_1224820 ?auto_1224822 ) ( IN-CITY ?auto_1224824 ?auto_1224823 ) ( not ( = ?auto_1224815 ?auto_1224824 ) ) ( OBJ-AT ?auto_1224821 ?auto_1224824 ) ( IN-CITY ?auto_1224825 ?auto_1224823 ) ( not ( = ?auto_1224815 ?auto_1224825 ) ) ( OBJ-AT ?auto_1224819 ?auto_1224825 ) ( OBJ-AT ?auto_1224818 ?auto_1224822 ) ( OBJ-AT ?auto_1224817 ?auto_1224822 ) ( IN-CITY ?auto_1224826 ?auto_1224823 ) ( not ( = ?auto_1224815 ?auto_1224826 ) ) ( OBJ-AT ?auto_1224816 ?auto_1224826 ) ( TRUCK-AT ?auto_1224827 ?auto_1224815 ) ( not ( = ?auto_1224816 ?auto_1224817 ) ) ( not ( = ?auto_1224822 ?auto_1224826 ) ) ( not ( = ?auto_1224816 ?auto_1224818 ) ) ( not ( = ?auto_1224817 ?auto_1224818 ) ) ( not ( = ?auto_1224816 ?auto_1224819 ) ) ( not ( = ?auto_1224817 ?auto_1224819 ) ) ( not ( = ?auto_1224818 ?auto_1224819 ) ) ( not ( = ?auto_1224825 ?auto_1224822 ) ) ( not ( = ?auto_1224825 ?auto_1224826 ) ) ( not ( = ?auto_1224816 ?auto_1224821 ) ) ( not ( = ?auto_1224817 ?auto_1224821 ) ) ( not ( = ?auto_1224818 ?auto_1224821 ) ) ( not ( = ?auto_1224819 ?auto_1224821 ) ) ( not ( = ?auto_1224824 ?auto_1224825 ) ) ( not ( = ?auto_1224824 ?auto_1224822 ) ) ( not ( = ?auto_1224824 ?auto_1224826 ) ) ( not ( = ?auto_1224816 ?auto_1224820 ) ) ( not ( = ?auto_1224817 ?auto_1224820 ) ) ( not ( = ?auto_1224818 ?auto_1224820 ) ) ( not ( = ?auto_1224819 ?auto_1224820 ) ) ( not ( = ?auto_1224821 ?auto_1224820 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1224816 ?auto_1224817 ?auto_1224818 ?auto_1224819 ?auto_1224821 ?auto_1224820 ?auto_1224815 )
      ( DELIVER-6PKG-VERIFY ?auto_1224816 ?auto_1224817 ?auto_1224818 ?auto_1224819 ?auto_1224820 ?auto_1224821 ?auto_1224815 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1225303 - OBJ
      ?auto_1225304 - OBJ
      ?auto_1225305 - OBJ
      ?auto_1225306 - OBJ
      ?auto_1225307 - OBJ
      ?auto_1225308 - OBJ
      ?auto_1225302 - LOCATION
    )
    :vars
    (
      ?auto_1225311 - LOCATION
      ?auto_1225312 - CITY
      ?auto_1225309 - LOCATION
      ?auto_1225314 - LOCATION
      ?auto_1225310 - LOCATION
      ?auto_1225313 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1225311 ?auto_1225312 ) ( IN-CITY ?auto_1225302 ?auto_1225312 ) ( not ( = ?auto_1225302 ?auto_1225311 ) ) ( OBJ-AT ?auto_1225306 ?auto_1225311 ) ( IN-CITY ?auto_1225309 ?auto_1225312 ) ( not ( = ?auto_1225302 ?auto_1225309 ) ) ( OBJ-AT ?auto_1225308 ?auto_1225309 ) ( IN-CITY ?auto_1225314 ?auto_1225312 ) ( not ( = ?auto_1225302 ?auto_1225314 ) ) ( OBJ-AT ?auto_1225307 ?auto_1225314 ) ( OBJ-AT ?auto_1225305 ?auto_1225311 ) ( OBJ-AT ?auto_1225304 ?auto_1225311 ) ( IN-CITY ?auto_1225310 ?auto_1225312 ) ( not ( = ?auto_1225302 ?auto_1225310 ) ) ( OBJ-AT ?auto_1225303 ?auto_1225310 ) ( TRUCK-AT ?auto_1225313 ?auto_1225302 ) ( not ( = ?auto_1225303 ?auto_1225304 ) ) ( not ( = ?auto_1225311 ?auto_1225310 ) ) ( not ( = ?auto_1225303 ?auto_1225305 ) ) ( not ( = ?auto_1225304 ?auto_1225305 ) ) ( not ( = ?auto_1225303 ?auto_1225307 ) ) ( not ( = ?auto_1225304 ?auto_1225307 ) ) ( not ( = ?auto_1225305 ?auto_1225307 ) ) ( not ( = ?auto_1225314 ?auto_1225311 ) ) ( not ( = ?auto_1225314 ?auto_1225310 ) ) ( not ( = ?auto_1225303 ?auto_1225308 ) ) ( not ( = ?auto_1225304 ?auto_1225308 ) ) ( not ( = ?auto_1225305 ?auto_1225308 ) ) ( not ( = ?auto_1225307 ?auto_1225308 ) ) ( not ( = ?auto_1225309 ?auto_1225314 ) ) ( not ( = ?auto_1225309 ?auto_1225311 ) ) ( not ( = ?auto_1225309 ?auto_1225310 ) ) ( not ( = ?auto_1225303 ?auto_1225306 ) ) ( not ( = ?auto_1225304 ?auto_1225306 ) ) ( not ( = ?auto_1225305 ?auto_1225306 ) ) ( not ( = ?auto_1225307 ?auto_1225306 ) ) ( not ( = ?auto_1225308 ?auto_1225306 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1225303 ?auto_1225304 ?auto_1225305 ?auto_1225307 ?auto_1225306 ?auto_1225308 ?auto_1225302 )
      ( DELIVER-6PKG-VERIFY ?auto_1225303 ?auto_1225304 ?auto_1225305 ?auto_1225306 ?auto_1225307 ?auto_1225308 ?auto_1225302 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1225873 - OBJ
      ?auto_1225874 - OBJ
      ?auto_1225875 - OBJ
      ?auto_1225876 - OBJ
      ?auto_1225877 - OBJ
      ?auto_1225878 - OBJ
      ?auto_1225872 - LOCATION
    )
    :vars
    (
      ?auto_1225881 - LOCATION
      ?auto_1225882 - CITY
      ?auto_1225879 - LOCATION
      ?auto_1225884 - LOCATION
      ?auto_1225880 - LOCATION
      ?auto_1225883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1225881 ?auto_1225882 ) ( IN-CITY ?auto_1225872 ?auto_1225882 ) ( not ( = ?auto_1225872 ?auto_1225881 ) ) ( OBJ-AT ?auto_1225878 ?auto_1225881 ) ( IN-CITY ?auto_1225879 ?auto_1225882 ) ( not ( = ?auto_1225872 ?auto_1225879 ) ) ( OBJ-AT ?auto_1225877 ?auto_1225879 ) ( IN-CITY ?auto_1225884 ?auto_1225882 ) ( not ( = ?auto_1225872 ?auto_1225884 ) ) ( OBJ-AT ?auto_1225875 ?auto_1225884 ) ( OBJ-AT ?auto_1225876 ?auto_1225881 ) ( OBJ-AT ?auto_1225874 ?auto_1225881 ) ( IN-CITY ?auto_1225880 ?auto_1225882 ) ( not ( = ?auto_1225872 ?auto_1225880 ) ) ( OBJ-AT ?auto_1225873 ?auto_1225880 ) ( TRUCK-AT ?auto_1225883 ?auto_1225872 ) ( not ( = ?auto_1225873 ?auto_1225874 ) ) ( not ( = ?auto_1225881 ?auto_1225880 ) ) ( not ( = ?auto_1225873 ?auto_1225876 ) ) ( not ( = ?auto_1225874 ?auto_1225876 ) ) ( not ( = ?auto_1225873 ?auto_1225875 ) ) ( not ( = ?auto_1225874 ?auto_1225875 ) ) ( not ( = ?auto_1225876 ?auto_1225875 ) ) ( not ( = ?auto_1225884 ?auto_1225881 ) ) ( not ( = ?auto_1225884 ?auto_1225880 ) ) ( not ( = ?auto_1225873 ?auto_1225877 ) ) ( not ( = ?auto_1225874 ?auto_1225877 ) ) ( not ( = ?auto_1225876 ?auto_1225877 ) ) ( not ( = ?auto_1225875 ?auto_1225877 ) ) ( not ( = ?auto_1225879 ?auto_1225884 ) ) ( not ( = ?auto_1225879 ?auto_1225881 ) ) ( not ( = ?auto_1225879 ?auto_1225880 ) ) ( not ( = ?auto_1225873 ?auto_1225878 ) ) ( not ( = ?auto_1225874 ?auto_1225878 ) ) ( not ( = ?auto_1225876 ?auto_1225878 ) ) ( not ( = ?auto_1225875 ?auto_1225878 ) ) ( not ( = ?auto_1225877 ?auto_1225878 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1225873 ?auto_1225874 ?auto_1225876 ?auto_1225875 ?auto_1225878 ?auto_1225877 ?auto_1225872 )
      ( DELIVER-6PKG-VERIFY ?auto_1225873 ?auto_1225874 ?auto_1225875 ?auto_1225876 ?auto_1225877 ?auto_1225878 ?auto_1225872 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1225942 - OBJ
      ?auto_1225943 - OBJ
      ?auto_1225944 - OBJ
      ?auto_1225945 - OBJ
      ?auto_1225946 - OBJ
      ?auto_1225947 - OBJ
      ?auto_1225941 - LOCATION
    )
    :vars
    (
      ?auto_1225950 - LOCATION
      ?auto_1225951 - CITY
      ?auto_1225948 - LOCATION
      ?auto_1225953 - LOCATION
      ?auto_1225949 - LOCATION
      ?auto_1225952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1225950 ?auto_1225951 ) ( IN-CITY ?auto_1225941 ?auto_1225951 ) ( not ( = ?auto_1225941 ?auto_1225950 ) ) ( OBJ-AT ?auto_1225946 ?auto_1225950 ) ( IN-CITY ?auto_1225948 ?auto_1225951 ) ( not ( = ?auto_1225941 ?auto_1225948 ) ) ( OBJ-AT ?auto_1225947 ?auto_1225948 ) ( IN-CITY ?auto_1225953 ?auto_1225951 ) ( not ( = ?auto_1225941 ?auto_1225953 ) ) ( OBJ-AT ?auto_1225944 ?auto_1225953 ) ( OBJ-AT ?auto_1225945 ?auto_1225950 ) ( OBJ-AT ?auto_1225943 ?auto_1225950 ) ( IN-CITY ?auto_1225949 ?auto_1225951 ) ( not ( = ?auto_1225941 ?auto_1225949 ) ) ( OBJ-AT ?auto_1225942 ?auto_1225949 ) ( TRUCK-AT ?auto_1225952 ?auto_1225941 ) ( not ( = ?auto_1225942 ?auto_1225943 ) ) ( not ( = ?auto_1225950 ?auto_1225949 ) ) ( not ( = ?auto_1225942 ?auto_1225945 ) ) ( not ( = ?auto_1225943 ?auto_1225945 ) ) ( not ( = ?auto_1225942 ?auto_1225944 ) ) ( not ( = ?auto_1225943 ?auto_1225944 ) ) ( not ( = ?auto_1225945 ?auto_1225944 ) ) ( not ( = ?auto_1225953 ?auto_1225950 ) ) ( not ( = ?auto_1225953 ?auto_1225949 ) ) ( not ( = ?auto_1225942 ?auto_1225947 ) ) ( not ( = ?auto_1225943 ?auto_1225947 ) ) ( not ( = ?auto_1225945 ?auto_1225947 ) ) ( not ( = ?auto_1225944 ?auto_1225947 ) ) ( not ( = ?auto_1225948 ?auto_1225953 ) ) ( not ( = ?auto_1225948 ?auto_1225950 ) ) ( not ( = ?auto_1225948 ?auto_1225949 ) ) ( not ( = ?auto_1225942 ?auto_1225946 ) ) ( not ( = ?auto_1225943 ?auto_1225946 ) ) ( not ( = ?auto_1225945 ?auto_1225946 ) ) ( not ( = ?auto_1225944 ?auto_1225946 ) ) ( not ( = ?auto_1225947 ?auto_1225946 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1225942 ?auto_1225943 ?auto_1225945 ?auto_1225944 ?auto_1225946 ?auto_1225947 ?auto_1225941 )
      ( DELIVER-6PKG-VERIFY ?auto_1225942 ?auto_1225943 ?auto_1225944 ?auto_1225945 ?auto_1225946 ?auto_1225947 ?auto_1225941 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1226158 - OBJ
      ?auto_1226159 - OBJ
      ?auto_1226160 - OBJ
      ?auto_1226161 - OBJ
      ?auto_1226162 - OBJ
      ?auto_1226163 - OBJ
      ?auto_1226157 - LOCATION
    )
    :vars
    (
      ?auto_1226166 - LOCATION
      ?auto_1226167 - CITY
      ?auto_1226164 - LOCATION
      ?auto_1226169 - LOCATION
      ?auto_1226165 - LOCATION
      ?auto_1226168 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1226166 ?auto_1226167 ) ( IN-CITY ?auto_1226157 ?auto_1226167 ) ( not ( = ?auto_1226157 ?auto_1226166 ) ) ( OBJ-AT ?auto_1226163 ?auto_1226166 ) ( IN-CITY ?auto_1226164 ?auto_1226167 ) ( not ( = ?auto_1226157 ?auto_1226164 ) ) ( OBJ-AT ?auto_1226161 ?auto_1226164 ) ( IN-CITY ?auto_1226169 ?auto_1226167 ) ( not ( = ?auto_1226157 ?auto_1226169 ) ) ( OBJ-AT ?auto_1226160 ?auto_1226169 ) ( OBJ-AT ?auto_1226162 ?auto_1226166 ) ( OBJ-AT ?auto_1226159 ?auto_1226166 ) ( IN-CITY ?auto_1226165 ?auto_1226167 ) ( not ( = ?auto_1226157 ?auto_1226165 ) ) ( OBJ-AT ?auto_1226158 ?auto_1226165 ) ( TRUCK-AT ?auto_1226168 ?auto_1226157 ) ( not ( = ?auto_1226158 ?auto_1226159 ) ) ( not ( = ?auto_1226166 ?auto_1226165 ) ) ( not ( = ?auto_1226158 ?auto_1226162 ) ) ( not ( = ?auto_1226159 ?auto_1226162 ) ) ( not ( = ?auto_1226158 ?auto_1226160 ) ) ( not ( = ?auto_1226159 ?auto_1226160 ) ) ( not ( = ?auto_1226162 ?auto_1226160 ) ) ( not ( = ?auto_1226169 ?auto_1226166 ) ) ( not ( = ?auto_1226169 ?auto_1226165 ) ) ( not ( = ?auto_1226158 ?auto_1226161 ) ) ( not ( = ?auto_1226159 ?auto_1226161 ) ) ( not ( = ?auto_1226162 ?auto_1226161 ) ) ( not ( = ?auto_1226160 ?auto_1226161 ) ) ( not ( = ?auto_1226164 ?auto_1226169 ) ) ( not ( = ?auto_1226164 ?auto_1226166 ) ) ( not ( = ?auto_1226164 ?auto_1226165 ) ) ( not ( = ?auto_1226158 ?auto_1226163 ) ) ( not ( = ?auto_1226159 ?auto_1226163 ) ) ( not ( = ?auto_1226162 ?auto_1226163 ) ) ( not ( = ?auto_1226160 ?auto_1226163 ) ) ( not ( = ?auto_1226161 ?auto_1226163 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1226158 ?auto_1226159 ?auto_1226162 ?auto_1226160 ?auto_1226163 ?auto_1226161 ?auto_1226157 )
      ( DELIVER-6PKG-VERIFY ?auto_1226158 ?auto_1226159 ?auto_1226160 ?auto_1226161 ?auto_1226162 ?auto_1226163 ?auto_1226157 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1242628 - OBJ
      ?auto_1242629 - OBJ
      ?auto_1242630 - OBJ
      ?auto_1242631 - OBJ
      ?auto_1242632 - OBJ
      ?auto_1242633 - OBJ
      ?auto_1242627 - LOCATION
    )
    :vars
    (
      ?auto_1242636 - LOCATION
      ?auto_1242637 - CITY
      ?auto_1242634 - LOCATION
      ?auto_1242639 - LOCATION
      ?auto_1242635 - LOCATION
      ?auto_1242638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1242636 ?auto_1242637 ) ( IN-CITY ?auto_1242627 ?auto_1242637 ) ( not ( = ?auto_1242627 ?auto_1242636 ) ) ( OBJ-AT ?auto_1242633 ?auto_1242636 ) ( IN-CITY ?auto_1242634 ?auto_1242637 ) ( not ( = ?auto_1242627 ?auto_1242634 ) ) ( OBJ-AT ?auto_1242632 ?auto_1242634 ) ( IN-CITY ?auto_1242639 ?auto_1242637 ) ( not ( = ?auto_1242627 ?auto_1242639 ) ) ( OBJ-AT ?auto_1242629 ?auto_1242639 ) ( OBJ-AT ?auto_1242631 ?auto_1242636 ) ( OBJ-AT ?auto_1242630 ?auto_1242636 ) ( IN-CITY ?auto_1242635 ?auto_1242637 ) ( not ( = ?auto_1242627 ?auto_1242635 ) ) ( OBJ-AT ?auto_1242628 ?auto_1242635 ) ( TRUCK-AT ?auto_1242638 ?auto_1242627 ) ( not ( = ?auto_1242628 ?auto_1242630 ) ) ( not ( = ?auto_1242636 ?auto_1242635 ) ) ( not ( = ?auto_1242628 ?auto_1242631 ) ) ( not ( = ?auto_1242630 ?auto_1242631 ) ) ( not ( = ?auto_1242628 ?auto_1242629 ) ) ( not ( = ?auto_1242630 ?auto_1242629 ) ) ( not ( = ?auto_1242631 ?auto_1242629 ) ) ( not ( = ?auto_1242639 ?auto_1242636 ) ) ( not ( = ?auto_1242639 ?auto_1242635 ) ) ( not ( = ?auto_1242628 ?auto_1242632 ) ) ( not ( = ?auto_1242630 ?auto_1242632 ) ) ( not ( = ?auto_1242631 ?auto_1242632 ) ) ( not ( = ?auto_1242629 ?auto_1242632 ) ) ( not ( = ?auto_1242634 ?auto_1242639 ) ) ( not ( = ?auto_1242634 ?auto_1242636 ) ) ( not ( = ?auto_1242634 ?auto_1242635 ) ) ( not ( = ?auto_1242628 ?auto_1242633 ) ) ( not ( = ?auto_1242630 ?auto_1242633 ) ) ( not ( = ?auto_1242631 ?auto_1242633 ) ) ( not ( = ?auto_1242629 ?auto_1242633 ) ) ( not ( = ?auto_1242632 ?auto_1242633 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1242628 ?auto_1242630 ?auto_1242631 ?auto_1242629 ?auto_1242633 ?auto_1242632 ?auto_1242627 )
      ( DELIVER-6PKG-VERIFY ?auto_1242628 ?auto_1242629 ?auto_1242630 ?auto_1242631 ?auto_1242632 ?auto_1242633 ?auto_1242627 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1242697 - OBJ
      ?auto_1242698 - OBJ
      ?auto_1242699 - OBJ
      ?auto_1242700 - OBJ
      ?auto_1242701 - OBJ
      ?auto_1242702 - OBJ
      ?auto_1242696 - LOCATION
    )
    :vars
    (
      ?auto_1242705 - LOCATION
      ?auto_1242706 - CITY
      ?auto_1242703 - LOCATION
      ?auto_1242708 - LOCATION
      ?auto_1242704 - LOCATION
      ?auto_1242707 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1242705 ?auto_1242706 ) ( IN-CITY ?auto_1242696 ?auto_1242706 ) ( not ( = ?auto_1242696 ?auto_1242705 ) ) ( OBJ-AT ?auto_1242701 ?auto_1242705 ) ( IN-CITY ?auto_1242703 ?auto_1242706 ) ( not ( = ?auto_1242696 ?auto_1242703 ) ) ( OBJ-AT ?auto_1242702 ?auto_1242703 ) ( IN-CITY ?auto_1242708 ?auto_1242706 ) ( not ( = ?auto_1242696 ?auto_1242708 ) ) ( OBJ-AT ?auto_1242698 ?auto_1242708 ) ( OBJ-AT ?auto_1242700 ?auto_1242705 ) ( OBJ-AT ?auto_1242699 ?auto_1242705 ) ( IN-CITY ?auto_1242704 ?auto_1242706 ) ( not ( = ?auto_1242696 ?auto_1242704 ) ) ( OBJ-AT ?auto_1242697 ?auto_1242704 ) ( TRUCK-AT ?auto_1242707 ?auto_1242696 ) ( not ( = ?auto_1242697 ?auto_1242699 ) ) ( not ( = ?auto_1242705 ?auto_1242704 ) ) ( not ( = ?auto_1242697 ?auto_1242700 ) ) ( not ( = ?auto_1242699 ?auto_1242700 ) ) ( not ( = ?auto_1242697 ?auto_1242698 ) ) ( not ( = ?auto_1242699 ?auto_1242698 ) ) ( not ( = ?auto_1242700 ?auto_1242698 ) ) ( not ( = ?auto_1242708 ?auto_1242705 ) ) ( not ( = ?auto_1242708 ?auto_1242704 ) ) ( not ( = ?auto_1242697 ?auto_1242702 ) ) ( not ( = ?auto_1242699 ?auto_1242702 ) ) ( not ( = ?auto_1242700 ?auto_1242702 ) ) ( not ( = ?auto_1242698 ?auto_1242702 ) ) ( not ( = ?auto_1242703 ?auto_1242708 ) ) ( not ( = ?auto_1242703 ?auto_1242705 ) ) ( not ( = ?auto_1242703 ?auto_1242704 ) ) ( not ( = ?auto_1242697 ?auto_1242701 ) ) ( not ( = ?auto_1242699 ?auto_1242701 ) ) ( not ( = ?auto_1242700 ?auto_1242701 ) ) ( not ( = ?auto_1242698 ?auto_1242701 ) ) ( not ( = ?auto_1242702 ?auto_1242701 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1242697 ?auto_1242699 ?auto_1242700 ?auto_1242698 ?auto_1242701 ?auto_1242702 ?auto_1242696 )
      ( DELIVER-6PKG-VERIFY ?auto_1242697 ?auto_1242698 ?auto_1242699 ?auto_1242700 ?auto_1242701 ?auto_1242702 ?auto_1242696 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1242913 - OBJ
      ?auto_1242914 - OBJ
      ?auto_1242915 - OBJ
      ?auto_1242916 - OBJ
      ?auto_1242917 - OBJ
      ?auto_1242918 - OBJ
      ?auto_1242912 - LOCATION
    )
    :vars
    (
      ?auto_1242921 - LOCATION
      ?auto_1242922 - CITY
      ?auto_1242919 - LOCATION
      ?auto_1242924 - LOCATION
      ?auto_1242920 - LOCATION
      ?auto_1242923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1242921 ?auto_1242922 ) ( IN-CITY ?auto_1242912 ?auto_1242922 ) ( not ( = ?auto_1242912 ?auto_1242921 ) ) ( OBJ-AT ?auto_1242918 ?auto_1242921 ) ( IN-CITY ?auto_1242919 ?auto_1242922 ) ( not ( = ?auto_1242912 ?auto_1242919 ) ) ( OBJ-AT ?auto_1242916 ?auto_1242919 ) ( IN-CITY ?auto_1242924 ?auto_1242922 ) ( not ( = ?auto_1242912 ?auto_1242924 ) ) ( OBJ-AT ?auto_1242914 ?auto_1242924 ) ( OBJ-AT ?auto_1242917 ?auto_1242921 ) ( OBJ-AT ?auto_1242915 ?auto_1242921 ) ( IN-CITY ?auto_1242920 ?auto_1242922 ) ( not ( = ?auto_1242912 ?auto_1242920 ) ) ( OBJ-AT ?auto_1242913 ?auto_1242920 ) ( TRUCK-AT ?auto_1242923 ?auto_1242912 ) ( not ( = ?auto_1242913 ?auto_1242915 ) ) ( not ( = ?auto_1242921 ?auto_1242920 ) ) ( not ( = ?auto_1242913 ?auto_1242917 ) ) ( not ( = ?auto_1242915 ?auto_1242917 ) ) ( not ( = ?auto_1242913 ?auto_1242914 ) ) ( not ( = ?auto_1242915 ?auto_1242914 ) ) ( not ( = ?auto_1242917 ?auto_1242914 ) ) ( not ( = ?auto_1242924 ?auto_1242921 ) ) ( not ( = ?auto_1242924 ?auto_1242920 ) ) ( not ( = ?auto_1242913 ?auto_1242916 ) ) ( not ( = ?auto_1242915 ?auto_1242916 ) ) ( not ( = ?auto_1242917 ?auto_1242916 ) ) ( not ( = ?auto_1242914 ?auto_1242916 ) ) ( not ( = ?auto_1242919 ?auto_1242924 ) ) ( not ( = ?auto_1242919 ?auto_1242921 ) ) ( not ( = ?auto_1242919 ?auto_1242920 ) ) ( not ( = ?auto_1242913 ?auto_1242918 ) ) ( not ( = ?auto_1242915 ?auto_1242918 ) ) ( not ( = ?auto_1242917 ?auto_1242918 ) ) ( not ( = ?auto_1242914 ?auto_1242918 ) ) ( not ( = ?auto_1242916 ?auto_1242918 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1242913 ?auto_1242915 ?auto_1242917 ?auto_1242914 ?auto_1242918 ?auto_1242916 ?auto_1242912 )
      ( DELIVER-6PKG-VERIFY ?auto_1242913 ?auto_1242914 ?auto_1242915 ?auto_1242916 ?auto_1242917 ?auto_1242918 ?auto_1242912 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1246361 - OBJ
      ?auto_1246362 - OBJ
      ?auto_1246363 - OBJ
      ?auto_1246364 - OBJ
      ?auto_1246365 - OBJ
      ?auto_1246366 - OBJ
      ?auto_1246360 - LOCATION
    )
    :vars
    (
      ?auto_1246369 - LOCATION
      ?auto_1246370 - CITY
      ?auto_1246367 - LOCATION
      ?auto_1246372 - LOCATION
      ?auto_1246368 - LOCATION
      ?auto_1246371 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1246369 ?auto_1246370 ) ( IN-CITY ?auto_1246360 ?auto_1246370 ) ( not ( = ?auto_1246360 ?auto_1246369 ) ) ( OBJ-AT ?auto_1246366 ?auto_1246369 ) ( IN-CITY ?auto_1246367 ?auto_1246370 ) ( not ( = ?auto_1246360 ?auto_1246367 ) ) ( OBJ-AT ?auto_1246363 ?auto_1246367 ) ( IN-CITY ?auto_1246372 ?auto_1246370 ) ( not ( = ?auto_1246360 ?auto_1246372 ) ) ( OBJ-AT ?auto_1246362 ?auto_1246372 ) ( OBJ-AT ?auto_1246365 ?auto_1246369 ) ( OBJ-AT ?auto_1246364 ?auto_1246369 ) ( IN-CITY ?auto_1246368 ?auto_1246370 ) ( not ( = ?auto_1246360 ?auto_1246368 ) ) ( OBJ-AT ?auto_1246361 ?auto_1246368 ) ( TRUCK-AT ?auto_1246371 ?auto_1246360 ) ( not ( = ?auto_1246361 ?auto_1246364 ) ) ( not ( = ?auto_1246369 ?auto_1246368 ) ) ( not ( = ?auto_1246361 ?auto_1246365 ) ) ( not ( = ?auto_1246364 ?auto_1246365 ) ) ( not ( = ?auto_1246361 ?auto_1246362 ) ) ( not ( = ?auto_1246364 ?auto_1246362 ) ) ( not ( = ?auto_1246365 ?auto_1246362 ) ) ( not ( = ?auto_1246372 ?auto_1246369 ) ) ( not ( = ?auto_1246372 ?auto_1246368 ) ) ( not ( = ?auto_1246361 ?auto_1246363 ) ) ( not ( = ?auto_1246364 ?auto_1246363 ) ) ( not ( = ?auto_1246365 ?auto_1246363 ) ) ( not ( = ?auto_1246362 ?auto_1246363 ) ) ( not ( = ?auto_1246367 ?auto_1246372 ) ) ( not ( = ?auto_1246367 ?auto_1246369 ) ) ( not ( = ?auto_1246367 ?auto_1246368 ) ) ( not ( = ?auto_1246361 ?auto_1246366 ) ) ( not ( = ?auto_1246364 ?auto_1246366 ) ) ( not ( = ?auto_1246365 ?auto_1246366 ) ) ( not ( = ?auto_1246362 ?auto_1246366 ) ) ( not ( = ?auto_1246363 ?auto_1246366 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1246361 ?auto_1246364 ?auto_1246365 ?auto_1246362 ?auto_1246366 ?auto_1246363 ?auto_1246360 )
      ( DELIVER-6PKG-VERIFY ?auto_1246361 ?auto_1246362 ?auto_1246363 ?auto_1246364 ?auto_1246365 ?auto_1246366 ?auto_1246360 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1282755 - OBJ
      ?auto_1282756 - OBJ
      ?auto_1282757 - OBJ
      ?auto_1282758 - OBJ
      ?auto_1282759 - OBJ
      ?auto_1282760 - OBJ
      ?auto_1282754 - LOCATION
    )
    :vars
    (
      ?auto_1282763 - LOCATION
      ?auto_1282764 - CITY
      ?auto_1282761 - LOCATION
      ?auto_1282766 - LOCATION
      ?auto_1282762 - LOCATION
      ?auto_1282765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1282763 ?auto_1282764 ) ( IN-CITY ?auto_1282754 ?auto_1282764 ) ( not ( = ?auto_1282754 ?auto_1282763 ) ) ( OBJ-AT ?auto_1282760 ?auto_1282763 ) ( IN-CITY ?auto_1282761 ?auto_1282764 ) ( not ( = ?auto_1282754 ?auto_1282761 ) ) ( OBJ-AT ?auto_1282759 ?auto_1282761 ) ( IN-CITY ?auto_1282766 ?auto_1282764 ) ( not ( = ?auto_1282754 ?auto_1282766 ) ) ( OBJ-AT ?auto_1282758 ?auto_1282766 ) ( OBJ-AT ?auto_1282757 ?auto_1282763 ) ( OBJ-AT ?auto_1282755 ?auto_1282763 ) ( IN-CITY ?auto_1282762 ?auto_1282764 ) ( not ( = ?auto_1282754 ?auto_1282762 ) ) ( OBJ-AT ?auto_1282756 ?auto_1282762 ) ( TRUCK-AT ?auto_1282765 ?auto_1282754 ) ( not ( = ?auto_1282756 ?auto_1282755 ) ) ( not ( = ?auto_1282763 ?auto_1282762 ) ) ( not ( = ?auto_1282756 ?auto_1282757 ) ) ( not ( = ?auto_1282755 ?auto_1282757 ) ) ( not ( = ?auto_1282756 ?auto_1282758 ) ) ( not ( = ?auto_1282755 ?auto_1282758 ) ) ( not ( = ?auto_1282757 ?auto_1282758 ) ) ( not ( = ?auto_1282766 ?auto_1282763 ) ) ( not ( = ?auto_1282766 ?auto_1282762 ) ) ( not ( = ?auto_1282756 ?auto_1282759 ) ) ( not ( = ?auto_1282755 ?auto_1282759 ) ) ( not ( = ?auto_1282757 ?auto_1282759 ) ) ( not ( = ?auto_1282758 ?auto_1282759 ) ) ( not ( = ?auto_1282761 ?auto_1282766 ) ) ( not ( = ?auto_1282761 ?auto_1282763 ) ) ( not ( = ?auto_1282761 ?auto_1282762 ) ) ( not ( = ?auto_1282756 ?auto_1282760 ) ) ( not ( = ?auto_1282755 ?auto_1282760 ) ) ( not ( = ?auto_1282757 ?auto_1282760 ) ) ( not ( = ?auto_1282758 ?auto_1282760 ) ) ( not ( = ?auto_1282759 ?auto_1282760 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1282756 ?auto_1282755 ?auto_1282757 ?auto_1282758 ?auto_1282760 ?auto_1282759 ?auto_1282754 )
      ( DELIVER-6PKG-VERIFY ?auto_1282755 ?auto_1282756 ?auto_1282757 ?auto_1282758 ?auto_1282759 ?auto_1282760 ?auto_1282754 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1282824 - OBJ
      ?auto_1282825 - OBJ
      ?auto_1282826 - OBJ
      ?auto_1282827 - OBJ
      ?auto_1282828 - OBJ
      ?auto_1282829 - OBJ
      ?auto_1282823 - LOCATION
    )
    :vars
    (
      ?auto_1282832 - LOCATION
      ?auto_1282833 - CITY
      ?auto_1282830 - LOCATION
      ?auto_1282835 - LOCATION
      ?auto_1282831 - LOCATION
      ?auto_1282834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1282832 ?auto_1282833 ) ( IN-CITY ?auto_1282823 ?auto_1282833 ) ( not ( = ?auto_1282823 ?auto_1282832 ) ) ( OBJ-AT ?auto_1282828 ?auto_1282832 ) ( IN-CITY ?auto_1282830 ?auto_1282833 ) ( not ( = ?auto_1282823 ?auto_1282830 ) ) ( OBJ-AT ?auto_1282829 ?auto_1282830 ) ( IN-CITY ?auto_1282835 ?auto_1282833 ) ( not ( = ?auto_1282823 ?auto_1282835 ) ) ( OBJ-AT ?auto_1282827 ?auto_1282835 ) ( OBJ-AT ?auto_1282826 ?auto_1282832 ) ( OBJ-AT ?auto_1282824 ?auto_1282832 ) ( IN-CITY ?auto_1282831 ?auto_1282833 ) ( not ( = ?auto_1282823 ?auto_1282831 ) ) ( OBJ-AT ?auto_1282825 ?auto_1282831 ) ( TRUCK-AT ?auto_1282834 ?auto_1282823 ) ( not ( = ?auto_1282825 ?auto_1282824 ) ) ( not ( = ?auto_1282832 ?auto_1282831 ) ) ( not ( = ?auto_1282825 ?auto_1282826 ) ) ( not ( = ?auto_1282824 ?auto_1282826 ) ) ( not ( = ?auto_1282825 ?auto_1282827 ) ) ( not ( = ?auto_1282824 ?auto_1282827 ) ) ( not ( = ?auto_1282826 ?auto_1282827 ) ) ( not ( = ?auto_1282835 ?auto_1282832 ) ) ( not ( = ?auto_1282835 ?auto_1282831 ) ) ( not ( = ?auto_1282825 ?auto_1282829 ) ) ( not ( = ?auto_1282824 ?auto_1282829 ) ) ( not ( = ?auto_1282826 ?auto_1282829 ) ) ( not ( = ?auto_1282827 ?auto_1282829 ) ) ( not ( = ?auto_1282830 ?auto_1282835 ) ) ( not ( = ?auto_1282830 ?auto_1282832 ) ) ( not ( = ?auto_1282830 ?auto_1282831 ) ) ( not ( = ?auto_1282825 ?auto_1282828 ) ) ( not ( = ?auto_1282824 ?auto_1282828 ) ) ( not ( = ?auto_1282826 ?auto_1282828 ) ) ( not ( = ?auto_1282827 ?auto_1282828 ) ) ( not ( = ?auto_1282829 ?auto_1282828 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1282825 ?auto_1282824 ?auto_1282826 ?auto_1282827 ?auto_1282828 ?auto_1282829 ?auto_1282823 )
      ( DELIVER-6PKG-VERIFY ?auto_1282824 ?auto_1282825 ?auto_1282826 ?auto_1282827 ?auto_1282828 ?auto_1282829 ?auto_1282823 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1283311 - OBJ
      ?auto_1283312 - OBJ
      ?auto_1283313 - OBJ
      ?auto_1283314 - OBJ
      ?auto_1283315 - OBJ
      ?auto_1283316 - OBJ
      ?auto_1283310 - LOCATION
    )
    :vars
    (
      ?auto_1283319 - LOCATION
      ?auto_1283320 - CITY
      ?auto_1283317 - LOCATION
      ?auto_1283322 - LOCATION
      ?auto_1283318 - LOCATION
      ?auto_1283321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1283319 ?auto_1283320 ) ( IN-CITY ?auto_1283310 ?auto_1283320 ) ( not ( = ?auto_1283310 ?auto_1283319 ) ) ( OBJ-AT ?auto_1283314 ?auto_1283319 ) ( IN-CITY ?auto_1283317 ?auto_1283320 ) ( not ( = ?auto_1283310 ?auto_1283317 ) ) ( OBJ-AT ?auto_1283316 ?auto_1283317 ) ( IN-CITY ?auto_1283322 ?auto_1283320 ) ( not ( = ?auto_1283310 ?auto_1283322 ) ) ( OBJ-AT ?auto_1283315 ?auto_1283322 ) ( OBJ-AT ?auto_1283313 ?auto_1283319 ) ( OBJ-AT ?auto_1283311 ?auto_1283319 ) ( IN-CITY ?auto_1283318 ?auto_1283320 ) ( not ( = ?auto_1283310 ?auto_1283318 ) ) ( OBJ-AT ?auto_1283312 ?auto_1283318 ) ( TRUCK-AT ?auto_1283321 ?auto_1283310 ) ( not ( = ?auto_1283312 ?auto_1283311 ) ) ( not ( = ?auto_1283319 ?auto_1283318 ) ) ( not ( = ?auto_1283312 ?auto_1283313 ) ) ( not ( = ?auto_1283311 ?auto_1283313 ) ) ( not ( = ?auto_1283312 ?auto_1283315 ) ) ( not ( = ?auto_1283311 ?auto_1283315 ) ) ( not ( = ?auto_1283313 ?auto_1283315 ) ) ( not ( = ?auto_1283322 ?auto_1283319 ) ) ( not ( = ?auto_1283322 ?auto_1283318 ) ) ( not ( = ?auto_1283312 ?auto_1283316 ) ) ( not ( = ?auto_1283311 ?auto_1283316 ) ) ( not ( = ?auto_1283313 ?auto_1283316 ) ) ( not ( = ?auto_1283315 ?auto_1283316 ) ) ( not ( = ?auto_1283317 ?auto_1283322 ) ) ( not ( = ?auto_1283317 ?auto_1283319 ) ) ( not ( = ?auto_1283317 ?auto_1283318 ) ) ( not ( = ?auto_1283312 ?auto_1283314 ) ) ( not ( = ?auto_1283311 ?auto_1283314 ) ) ( not ( = ?auto_1283313 ?auto_1283314 ) ) ( not ( = ?auto_1283315 ?auto_1283314 ) ) ( not ( = ?auto_1283316 ?auto_1283314 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1283312 ?auto_1283311 ?auto_1283313 ?auto_1283315 ?auto_1283314 ?auto_1283316 ?auto_1283310 )
      ( DELIVER-6PKG-VERIFY ?auto_1283311 ?auto_1283312 ?auto_1283313 ?auto_1283314 ?auto_1283315 ?auto_1283316 ?auto_1283310 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1283881 - OBJ
      ?auto_1283882 - OBJ
      ?auto_1283883 - OBJ
      ?auto_1283884 - OBJ
      ?auto_1283885 - OBJ
      ?auto_1283886 - OBJ
      ?auto_1283880 - LOCATION
    )
    :vars
    (
      ?auto_1283889 - LOCATION
      ?auto_1283890 - CITY
      ?auto_1283887 - LOCATION
      ?auto_1283892 - LOCATION
      ?auto_1283888 - LOCATION
      ?auto_1283891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1283889 ?auto_1283890 ) ( IN-CITY ?auto_1283880 ?auto_1283890 ) ( not ( = ?auto_1283880 ?auto_1283889 ) ) ( OBJ-AT ?auto_1283886 ?auto_1283889 ) ( IN-CITY ?auto_1283887 ?auto_1283890 ) ( not ( = ?auto_1283880 ?auto_1283887 ) ) ( OBJ-AT ?auto_1283885 ?auto_1283887 ) ( IN-CITY ?auto_1283892 ?auto_1283890 ) ( not ( = ?auto_1283880 ?auto_1283892 ) ) ( OBJ-AT ?auto_1283883 ?auto_1283892 ) ( OBJ-AT ?auto_1283884 ?auto_1283889 ) ( OBJ-AT ?auto_1283881 ?auto_1283889 ) ( IN-CITY ?auto_1283888 ?auto_1283890 ) ( not ( = ?auto_1283880 ?auto_1283888 ) ) ( OBJ-AT ?auto_1283882 ?auto_1283888 ) ( TRUCK-AT ?auto_1283891 ?auto_1283880 ) ( not ( = ?auto_1283882 ?auto_1283881 ) ) ( not ( = ?auto_1283889 ?auto_1283888 ) ) ( not ( = ?auto_1283882 ?auto_1283884 ) ) ( not ( = ?auto_1283881 ?auto_1283884 ) ) ( not ( = ?auto_1283882 ?auto_1283883 ) ) ( not ( = ?auto_1283881 ?auto_1283883 ) ) ( not ( = ?auto_1283884 ?auto_1283883 ) ) ( not ( = ?auto_1283892 ?auto_1283889 ) ) ( not ( = ?auto_1283892 ?auto_1283888 ) ) ( not ( = ?auto_1283882 ?auto_1283885 ) ) ( not ( = ?auto_1283881 ?auto_1283885 ) ) ( not ( = ?auto_1283884 ?auto_1283885 ) ) ( not ( = ?auto_1283883 ?auto_1283885 ) ) ( not ( = ?auto_1283887 ?auto_1283892 ) ) ( not ( = ?auto_1283887 ?auto_1283889 ) ) ( not ( = ?auto_1283887 ?auto_1283888 ) ) ( not ( = ?auto_1283882 ?auto_1283886 ) ) ( not ( = ?auto_1283881 ?auto_1283886 ) ) ( not ( = ?auto_1283884 ?auto_1283886 ) ) ( not ( = ?auto_1283883 ?auto_1283886 ) ) ( not ( = ?auto_1283885 ?auto_1283886 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1283882 ?auto_1283881 ?auto_1283884 ?auto_1283883 ?auto_1283886 ?auto_1283885 ?auto_1283880 )
      ( DELIVER-6PKG-VERIFY ?auto_1283881 ?auto_1283882 ?auto_1283883 ?auto_1283884 ?auto_1283885 ?auto_1283886 ?auto_1283880 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1283950 - OBJ
      ?auto_1283951 - OBJ
      ?auto_1283952 - OBJ
      ?auto_1283953 - OBJ
      ?auto_1283954 - OBJ
      ?auto_1283955 - OBJ
      ?auto_1283949 - LOCATION
    )
    :vars
    (
      ?auto_1283958 - LOCATION
      ?auto_1283959 - CITY
      ?auto_1283956 - LOCATION
      ?auto_1283961 - LOCATION
      ?auto_1283957 - LOCATION
      ?auto_1283960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1283958 ?auto_1283959 ) ( IN-CITY ?auto_1283949 ?auto_1283959 ) ( not ( = ?auto_1283949 ?auto_1283958 ) ) ( OBJ-AT ?auto_1283954 ?auto_1283958 ) ( IN-CITY ?auto_1283956 ?auto_1283959 ) ( not ( = ?auto_1283949 ?auto_1283956 ) ) ( OBJ-AT ?auto_1283955 ?auto_1283956 ) ( IN-CITY ?auto_1283961 ?auto_1283959 ) ( not ( = ?auto_1283949 ?auto_1283961 ) ) ( OBJ-AT ?auto_1283952 ?auto_1283961 ) ( OBJ-AT ?auto_1283953 ?auto_1283958 ) ( OBJ-AT ?auto_1283950 ?auto_1283958 ) ( IN-CITY ?auto_1283957 ?auto_1283959 ) ( not ( = ?auto_1283949 ?auto_1283957 ) ) ( OBJ-AT ?auto_1283951 ?auto_1283957 ) ( TRUCK-AT ?auto_1283960 ?auto_1283949 ) ( not ( = ?auto_1283951 ?auto_1283950 ) ) ( not ( = ?auto_1283958 ?auto_1283957 ) ) ( not ( = ?auto_1283951 ?auto_1283953 ) ) ( not ( = ?auto_1283950 ?auto_1283953 ) ) ( not ( = ?auto_1283951 ?auto_1283952 ) ) ( not ( = ?auto_1283950 ?auto_1283952 ) ) ( not ( = ?auto_1283953 ?auto_1283952 ) ) ( not ( = ?auto_1283961 ?auto_1283958 ) ) ( not ( = ?auto_1283961 ?auto_1283957 ) ) ( not ( = ?auto_1283951 ?auto_1283955 ) ) ( not ( = ?auto_1283950 ?auto_1283955 ) ) ( not ( = ?auto_1283953 ?auto_1283955 ) ) ( not ( = ?auto_1283952 ?auto_1283955 ) ) ( not ( = ?auto_1283956 ?auto_1283961 ) ) ( not ( = ?auto_1283956 ?auto_1283958 ) ) ( not ( = ?auto_1283956 ?auto_1283957 ) ) ( not ( = ?auto_1283951 ?auto_1283954 ) ) ( not ( = ?auto_1283950 ?auto_1283954 ) ) ( not ( = ?auto_1283953 ?auto_1283954 ) ) ( not ( = ?auto_1283952 ?auto_1283954 ) ) ( not ( = ?auto_1283955 ?auto_1283954 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1283951 ?auto_1283950 ?auto_1283953 ?auto_1283952 ?auto_1283954 ?auto_1283955 ?auto_1283949 )
      ( DELIVER-6PKG-VERIFY ?auto_1283950 ?auto_1283951 ?auto_1283952 ?auto_1283953 ?auto_1283954 ?auto_1283955 ?auto_1283949 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1284166 - OBJ
      ?auto_1284167 - OBJ
      ?auto_1284168 - OBJ
      ?auto_1284169 - OBJ
      ?auto_1284170 - OBJ
      ?auto_1284171 - OBJ
      ?auto_1284165 - LOCATION
    )
    :vars
    (
      ?auto_1284174 - LOCATION
      ?auto_1284175 - CITY
      ?auto_1284172 - LOCATION
      ?auto_1284177 - LOCATION
      ?auto_1284173 - LOCATION
      ?auto_1284176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1284174 ?auto_1284175 ) ( IN-CITY ?auto_1284165 ?auto_1284175 ) ( not ( = ?auto_1284165 ?auto_1284174 ) ) ( OBJ-AT ?auto_1284171 ?auto_1284174 ) ( IN-CITY ?auto_1284172 ?auto_1284175 ) ( not ( = ?auto_1284165 ?auto_1284172 ) ) ( OBJ-AT ?auto_1284169 ?auto_1284172 ) ( IN-CITY ?auto_1284177 ?auto_1284175 ) ( not ( = ?auto_1284165 ?auto_1284177 ) ) ( OBJ-AT ?auto_1284168 ?auto_1284177 ) ( OBJ-AT ?auto_1284170 ?auto_1284174 ) ( OBJ-AT ?auto_1284166 ?auto_1284174 ) ( IN-CITY ?auto_1284173 ?auto_1284175 ) ( not ( = ?auto_1284165 ?auto_1284173 ) ) ( OBJ-AT ?auto_1284167 ?auto_1284173 ) ( TRUCK-AT ?auto_1284176 ?auto_1284165 ) ( not ( = ?auto_1284167 ?auto_1284166 ) ) ( not ( = ?auto_1284174 ?auto_1284173 ) ) ( not ( = ?auto_1284167 ?auto_1284170 ) ) ( not ( = ?auto_1284166 ?auto_1284170 ) ) ( not ( = ?auto_1284167 ?auto_1284168 ) ) ( not ( = ?auto_1284166 ?auto_1284168 ) ) ( not ( = ?auto_1284170 ?auto_1284168 ) ) ( not ( = ?auto_1284177 ?auto_1284174 ) ) ( not ( = ?auto_1284177 ?auto_1284173 ) ) ( not ( = ?auto_1284167 ?auto_1284169 ) ) ( not ( = ?auto_1284166 ?auto_1284169 ) ) ( not ( = ?auto_1284170 ?auto_1284169 ) ) ( not ( = ?auto_1284168 ?auto_1284169 ) ) ( not ( = ?auto_1284172 ?auto_1284177 ) ) ( not ( = ?auto_1284172 ?auto_1284174 ) ) ( not ( = ?auto_1284172 ?auto_1284173 ) ) ( not ( = ?auto_1284167 ?auto_1284171 ) ) ( not ( = ?auto_1284166 ?auto_1284171 ) ) ( not ( = ?auto_1284170 ?auto_1284171 ) ) ( not ( = ?auto_1284168 ?auto_1284171 ) ) ( not ( = ?auto_1284169 ?auto_1284171 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1284167 ?auto_1284166 ?auto_1284170 ?auto_1284168 ?auto_1284171 ?auto_1284169 ?auto_1284165 )
      ( DELIVER-6PKG-VERIFY ?auto_1284166 ?auto_1284167 ?auto_1284168 ?auto_1284169 ?auto_1284170 ?auto_1284171 ?auto_1284165 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1299944 - OBJ
      ?auto_1299945 - OBJ
      ?auto_1299946 - OBJ
      ?auto_1299947 - OBJ
      ?auto_1299948 - OBJ
      ?auto_1299949 - OBJ
      ?auto_1299943 - LOCATION
    )
    :vars
    (
      ?auto_1299952 - LOCATION
      ?auto_1299953 - CITY
      ?auto_1299950 - LOCATION
      ?auto_1299955 - LOCATION
      ?auto_1299951 - LOCATION
      ?auto_1299954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1299952 ?auto_1299953 ) ( IN-CITY ?auto_1299943 ?auto_1299953 ) ( not ( = ?auto_1299943 ?auto_1299952 ) ) ( OBJ-AT ?auto_1299949 ?auto_1299952 ) ( IN-CITY ?auto_1299950 ?auto_1299953 ) ( not ( = ?auto_1299943 ?auto_1299950 ) ) ( OBJ-AT ?auto_1299948 ?auto_1299950 ) ( IN-CITY ?auto_1299955 ?auto_1299953 ) ( not ( = ?auto_1299943 ?auto_1299955 ) ) ( OBJ-AT ?auto_1299947 ?auto_1299955 ) ( OBJ-AT ?auto_1299945 ?auto_1299952 ) ( OBJ-AT ?auto_1299944 ?auto_1299952 ) ( IN-CITY ?auto_1299951 ?auto_1299953 ) ( not ( = ?auto_1299943 ?auto_1299951 ) ) ( OBJ-AT ?auto_1299946 ?auto_1299951 ) ( TRUCK-AT ?auto_1299954 ?auto_1299943 ) ( not ( = ?auto_1299946 ?auto_1299944 ) ) ( not ( = ?auto_1299952 ?auto_1299951 ) ) ( not ( = ?auto_1299946 ?auto_1299945 ) ) ( not ( = ?auto_1299944 ?auto_1299945 ) ) ( not ( = ?auto_1299946 ?auto_1299947 ) ) ( not ( = ?auto_1299944 ?auto_1299947 ) ) ( not ( = ?auto_1299945 ?auto_1299947 ) ) ( not ( = ?auto_1299955 ?auto_1299952 ) ) ( not ( = ?auto_1299955 ?auto_1299951 ) ) ( not ( = ?auto_1299946 ?auto_1299948 ) ) ( not ( = ?auto_1299944 ?auto_1299948 ) ) ( not ( = ?auto_1299945 ?auto_1299948 ) ) ( not ( = ?auto_1299947 ?auto_1299948 ) ) ( not ( = ?auto_1299950 ?auto_1299955 ) ) ( not ( = ?auto_1299950 ?auto_1299952 ) ) ( not ( = ?auto_1299950 ?auto_1299951 ) ) ( not ( = ?auto_1299946 ?auto_1299949 ) ) ( not ( = ?auto_1299944 ?auto_1299949 ) ) ( not ( = ?auto_1299945 ?auto_1299949 ) ) ( not ( = ?auto_1299947 ?auto_1299949 ) ) ( not ( = ?auto_1299948 ?auto_1299949 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1299946 ?auto_1299944 ?auto_1299945 ?auto_1299947 ?auto_1299949 ?auto_1299948 ?auto_1299943 )
      ( DELIVER-6PKG-VERIFY ?auto_1299944 ?auto_1299945 ?auto_1299946 ?auto_1299947 ?auto_1299948 ?auto_1299949 ?auto_1299943 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1300013 - OBJ
      ?auto_1300014 - OBJ
      ?auto_1300015 - OBJ
      ?auto_1300016 - OBJ
      ?auto_1300017 - OBJ
      ?auto_1300018 - OBJ
      ?auto_1300012 - LOCATION
    )
    :vars
    (
      ?auto_1300021 - LOCATION
      ?auto_1300022 - CITY
      ?auto_1300019 - LOCATION
      ?auto_1300024 - LOCATION
      ?auto_1300020 - LOCATION
      ?auto_1300023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1300021 ?auto_1300022 ) ( IN-CITY ?auto_1300012 ?auto_1300022 ) ( not ( = ?auto_1300012 ?auto_1300021 ) ) ( OBJ-AT ?auto_1300017 ?auto_1300021 ) ( IN-CITY ?auto_1300019 ?auto_1300022 ) ( not ( = ?auto_1300012 ?auto_1300019 ) ) ( OBJ-AT ?auto_1300018 ?auto_1300019 ) ( IN-CITY ?auto_1300024 ?auto_1300022 ) ( not ( = ?auto_1300012 ?auto_1300024 ) ) ( OBJ-AT ?auto_1300016 ?auto_1300024 ) ( OBJ-AT ?auto_1300014 ?auto_1300021 ) ( OBJ-AT ?auto_1300013 ?auto_1300021 ) ( IN-CITY ?auto_1300020 ?auto_1300022 ) ( not ( = ?auto_1300012 ?auto_1300020 ) ) ( OBJ-AT ?auto_1300015 ?auto_1300020 ) ( TRUCK-AT ?auto_1300023 ?auto_1300012 ) ( not ( = ?auto_1300015 ?auto_1300013 ) ) ( not ( = ?auto_1300021 ?auto_1300020 ) ) ( not ( = ?auto_1300015 ?auto_1300014 ) ) ( not ( = ?auto_1300013 ?auto_1300014 ) ) ( not ( = ?auto_1300015 ?auto_1300016 ) ) ( not ( = ?auto_1300013 ?auto_1300016 ) ) ( not ( = ?auto_1300014 ?auto_1300016 ) ) ( not ( = ?auto_1300024 ?auto_1300021 ) ) ( not ( = ?auto_1300024 ?auto_1300020 ) ) ( not ( = ?auto_1300015 ?auto_1300018 ) ) ( not ( = ?auto_1300013 ?auto_1300018 ) ) ( not ( = ?auto_1300014 ?auto_1300018 ) ) ( not ( = ?auto_1300016 ?auto_1300018 ) ) ( not ( = ?auto_1300019 ?auto_1300024 ) ) ( not ( = ?auto_1300019 ?auto_1300021 ) ) ( not ( = ?auto_1300019 ?auto_1300020 ) ) ( not ( = ?auto_1300015 ?auto_1300017 ) ) ( not ( = ?auto_1300013 ?auto_1300017 ) ) ( not ( = ?auto_1300014 ?auto_1300017 ) ) ( not ( = ?auto_1300016 ?auto_1300017 ) ) ( not ( = ?auto_1300018 ?auto_1300017 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1300015 ?auto_1300013 ?auto_1300014 ?auto_1300016 ?auto_1300017 ?auto_1300018 ?auto_1300012 )
      ( DELIVER-6PKG-VERIFY ?auto_1300013 ?auto_1300014 ?auto_1300015 ?auto_1300016 ?auto_1300017 ?auto_1300018 ?auto_1300012 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1300500 - OBJ
      ?auto_1300501 - OBJ
      ?auto_1300502 - OBJ
      ?auto_1300503 - OBJ
      ?auto_1300504 - OBJ
      ?auto_1300505 - OBJ
      ?auto_1300499 - LOCATION
    )
    :vars
    (
      ?auto_1300508 - LOCATION
      ?auto_1300509 - CITY
      ?auto_1300506 - LOCATION
      ?auto_1300511 - LOCATION
      ?auto_1300507 - LOCATION
      ?auto_1300510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1300508 ?auto_1300509 ) ( IN-CITY ?auto_1300499 ?auto_1300509 ) ( not ( = ?auto_1300499 ?auto_1300508 ) ) ( OBJ-AT ?auto_1300503 ?auto_1300508 ) ( IN-CITY ?auto_1300506 ?auto_1300509 ) ( not ( = ?auto_1300499 ?auto_1300506 ) ) ( OBJ-AT ?auto_1300505 ?auto_1300506 ) ( IN-CITY ?auto_1300511 ?auto_1300509 ) ( not ( = ?auto_1300499 ?auto_1300511 ) ) ( OBJ-AT ?auto_1300504 ?auto_1300511 ) ( OBJ-AT ?auto_1300501 ?auto_1300508 ) ( OBJ-AT ?auto_1300500 ?auto_1300508 ) ( IN-CITY ?auto_1300507 ?auto_1300509 ) ( not ( = ?auto_1300499 ?auto_1300507 ) ) ( OBJ-AT ?auto_1300502 ?auto_1300507 ) ( TRUCK-AT ?auto_1300510 ?auto_1300499 ) ( not ( = ?auto_1300502 ?auto_1300500 ) ) ( not ( = ?auto_1300508 ?auto_1300507 ) ) ( not ( = ?auto_1300502 ?auto_1300501 ) ) ( not ( = ?auto_1300500 ?auto_1300501 ) ) ( not ( = ?auto_1300502 ?auto_1300504 ) ) ( not ( = ?auto_1300500 ?auto_1300504 ) ) ( not ( = ?auto_1300501 ?auto_1300504 ) ) ( not ( = ?auto_1300511 ?auto_1300508 ) ) ( not ( = ?auto_1300511 ?auto_1300507 ) ) ( not ( = ?auto_1300502 ?auto_1300505 ) ) ( not ( = ?auto_1300500 ?auto_1300505 ) ) ( not ( = ?auto_1300501 ?auto_1300505 ) ) ( not ( = ?auto_1300504 ?auto_1300505 ) ) ( not ( = ?auto_1300506 ?auto_1300511 ) ) ( not ( = ?auto_1300506 ?auto_1300508 ) ) ( not ( = ?auto_1300506 ?auto_1300507 ) ) ( not ( = ?auto_1300502 ?auto_1300503 ) ) ( not ( = ?auto_1300500 ?auto_1300503 ) ) ( not ( = ?auto_1300501 ?auto_1300503 ) ) ( not ( = ?auto_1300504 ?auto_1300503 ) ) ( not ( = ?auto_1300505 ?auto_1300503 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1300502 ?auto_1300500 ?auto_1300501 ?auto_1300504 ?auto_1300503 ?auto_1300505 ?auto_1300499 )
      ( DELIVER-6PKG-VERIFY ?auto_1300500 ?auto_1300501 ?auto_1300502 ?auto_1300503 ?auto_1300504 ?auto_1300505 ?auto_1300499 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1306282 - OBJ
      ?auto_1306283 - OBJ
      ?auto_1306284 - OBJ
      ?auto_1306285 - OBJ
      ?auto_1306286 - OBJ
      ?auto_1306287 - OBJ
      ?auto_1306281 - LOCATION
    )
    :vars
    (
      ?auto_1306290 - LOCATION
      ?auto_1306291 - CITY
      ?auto_1306288 - LOCATION
      ?auto_1306293 - LOCATION
      ?auto_1306289 - LOCATION
      ?auto_1306292 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1306290 ?auto_1306291 ) ( IN-CITY ?auto_1306281 ?auto_1306291 ) ( not ( = ?auto_1306281 ?auto_1306290 ) ) ( OBJ-AT ?auto_1306284 ?auto_1306290 ) ( IN-CITY ?auto_1306288 ?auto_1306291 ) ( not ( = ?auto_1306281 ?auto_1306288 ) ) ( OBJ-AT ?auto_1306287 ?auto_1306288 ) ( IN-CITY ?auto_1306293 ?auto_1306291 ) ( not ( = ?auto_1306281 ?auto_1306293 ) ) ( OBJ-AT ?auto_1306286 ?auto_1306293 ) ( OBJ-AT ?auto_1306283 ?auto_1306290 ) ( OBJ-AT ?auto_1306282 ?auto_1306290 ) ( IN-CITY ?auto_1306289 ?auto_1306291 ) ( not ( = ?auto_1306281 ?auto_1306289 ) ) ( OBJ-AT ?auto_1306285 ?auto_1306289 ) ( TRUCK-AT ?auto_1306292 ?auto_1306281 ) ( not ( = ?auto_1306285 ?auto_1306282 ) ) ( not ( = ?auto_1306290 ?auto_1306289 ) ) ( not ( = ?auto_1306285 ?auto_1306283 ) ) ( not ( = ?auto_1306282 ?auto_1306283 ) ) ( not ( = ?auto_1306285 ?auto_1306286 ) ) ( not ( = ?auto_1306282 ?auto_1306286 ) ) ( not ( = ?auto_1306283 ?auto_1306286 ) ) ( not ( = ?auto_1306293 ?auto_1306290 ) ) ( not ( = ?auto_1306293 ?auto_1306289 ) ) ( not ( = ?auto_1306285 ?auto_1306287 ) ) ( not ( = ?auto_1306282 ?auto_1306287 ) ) ( not ( = ?auto_1306283 ?auto_1306287 ) ) ( not ( = ?auto_1306286 ?auto_1306287 ) ) ( not ( = ?auto_1306288 ?auto_1306293 ) ) ( not ( = ?auto_1306288 ?auto_1306290 ) ) ( not ( = ?auto_1306288 ?auto_1306289 ) ) ( not ( = ?auto_1306285 ?auto_1306284 ) ) ( not ( = ?auto_1306282 ?auto_1306284 ) ) ( not ( = ?auto_1306283 ?auto_1306284 ) ) ( not ( = ?auto_1306286 ?auto_1306284 ) ) ( not ( = ?auto_1306287 ?auto_1306284 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1306285 ?auto_1306282 ?auto_1306283 ?auto_1306286 ?auto_1306284 ?auto_1306287 ?auto_1306281 )
      ( DELIVER-6PKG-VERIFY ?auto_1306282 ?auto_1306283 ?auto_1306284 ?auto_1306285 ?auto_1306286 ?auto_1306287 ?auto_1306281 ) )
  )

)

