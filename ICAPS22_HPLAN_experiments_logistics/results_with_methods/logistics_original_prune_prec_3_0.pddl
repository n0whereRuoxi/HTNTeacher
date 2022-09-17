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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2038 - OBJ
      ?auto_2039 - LOCATION
    )
    :vars
    (
      ?auto_2040 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2040 ?auto_2039 ) ( IN-TRUCK ?auto_2038 ?auto_2040 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2038 ?auto_2040 ?auto_2039 )
      ( DELIVER-1PKG-VERIFY ?auto_2038 ?auto_2039 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2056 - OBJ
      ?auto_2057 - LOCATION
    )
    :vars
    (
      ?auto_2058 - TRUCK
      ?auto_2062 - LOCATION
      ?auto_2063 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2056 ?auto_2058 ) ( TRUCK-AT ?auto_2058 ?auto_2062 ) ( IN-CITY ?auto_2062 ?auto_2063 ) ( IN-CITY ?auto_2057 ?auto_2063 ) ( not ( = ?auto_2057 ?auto_2062 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2058 ?auto_2062 ?auto_2057 ?auto_2063 )
      ( DELIVER-1PKG ?auto_2056 ?auto_2057 )
      ( DELIVER-1PKG-VERIFY ?auto_2056 ?auto_2057 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2082 - OBJ
      ?auto_2083 - LOCATION
    )
    :vars
    (
      ?auto_2087 - TRUCK
      ?auto_2088 - LOCATION
      ?auto_2085 - CITY
      ?auto_2090 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2087 ?auto_2088 ) ( IN-CITY ?auto_2088 ?auto_2085 ) ( IN-CITY ?auto_2083 ?auto_2085 ) ( not ( = ?auto_2083 ?auto_2088 ) ) ( TRUCK-AT ?auto_2087 ?auto_2090 ) ( OBJ-AT ?auto_2082 ?auto_2090 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2082 ?auto_2087 ?auto_2090 )
      ( DELIVER-1PKG ?auto_2082 ?auto_2083 )
      ( DELIVER-1PKG-VERIFY ?auto_2082 ?auto_2083 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2111 - OBJ
      ?auto_2112 - LOCATION
    )
    :vars
    (
      ?auto_2117 - LOCATION
      ?auto_2114 - CITY
      ?auto_2113 - TRUCK
      ?auto_2120 - LOCATION
      ?auto_2121 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_2117 ?auto_2114 ) ( IN-CITY ?auto_2112 ?auto_2114 ) ( not ( = ?auto_2112 ?auto_2117 ) ) ( OBJ-AT ?auto_2111 ?auto_2117 ) ( TRUCK-AT ?auto_2113 ?auto_2120 ) ( IN-CITY ?auto_2120 ?auto_2121 ) ( IN-CITY ?auto_2117 ?auto_2121 ) ( not ( = ?auto_2117 ?auto_2120 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2113 ?auto_2120 ?auto_2117 ?auto_2121 )
      ( DELIVER-1PKG ?auto_2111 ?auto_2112 )
      ( DELIVER-1PKG-VERIFY ?auto_2111 ?auto_2112 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2188 - OBJ
      ?auto_2190 - OBJ
      ?auto_2189 - LOCATION
    )
    :vars
    (
      ?auto_2193 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2190 ?auto_2188 ) ( TRUCK-AT ?auto_2193 ?auto_2189 ) ( IN-TRUCK ?auto_2190 ?auto_2193 ) ( OBJ-AT ?auto_2188 ?auto_2189 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2190 ?auto_2189 )
      ( DELIVER-2PKG-VERIFY ?auto_2188 ?auto_2190 ?auto_2189 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2264 - OBJ
      ?auto_2266 - OBJ
      ?auto_2265 - LOCATION
    )
    :vars
    (
      ?auto_2268 - TRUCK
      ?auto_2270 - LOCATION
      ?auto_2271 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2266 ?auto_2264 ) ( IN-TRUCK ?auto_2266 ?auto_2268 ) ( TRUCK-AT ?auto_2268 ?auto_2270 ) ( IN-CITY ?auto_2270 ?auto_2271 ) ( IN-CITY ?auto_2265 ?auto_2271 ) ( not ( = ?auto_2265 ?auto_2270 ) ) ( OBJ-AT ?auto_2264 ?auto_2265 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2266 ?auto_2265 )
      ( DELIVER-2PKG-VERIFY ?auto_2264 ?auto_2266 ?auto_2265 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2360 - OBJ
      ?auto_2361 - LOCATION
    )
    :vars
    (
      ?auto_2364 - OBJ
      ?auto_2365 - TRUCK
      ?auto_2362 - LOCATION
      ?auto_2366 - CITY
      ?auto_2369 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2360 ?auto_2364 ) ( TRUCK-AT ?auto_2365 ?auto_2362 ) ( IN-CITY ?auto_2362 ?auto_2366 ) ( IN-CITY ?auto_2361 ?auto_2366 ) ( not ( = ?auto_2361 ?auto_2362 ) ) ( OBJ-AT ?auto_2364 ?auto_2361 ) ( TRUCK-AT ?auto_2365 ?auto_2369 ) ( OBJ-AT ?auto_2360 ?auto_2369 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2360 ?auto_2365 ?auto_2369 )
      ( DELIVER-2PKG ?auto_2364 ?auto_2360 ?auto_2361 )
      ( DELIVER-1PKG-VERIFY ?auto_2360 ?auto_2361 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2371 - OBJ
      ?auto_2373 - OBJ
      ?auto_2372 - LOCATION
    )
    :vars
    (
      ?auto_2379 - OBJ
      ?auto_2376 - TRUCK
      ?auto_2374 - LOCATION
      ?auto_2377 - CITY
      ?auto_2375 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2373 ?auto_2371 ) ( GREATER-THAN ?auto_2373 ?auto_2379 ) ( TRUCK-AT ?auto_2376 ?auto_2374 ) ( IN-CITY ?auto_2374 ?auto_2377 ) ( IN-CITY ?auto_2372 ?auto_2377 ) ( not ( = ?auto_2372 ?auto_2374 ) ) ( OBJ-AT ?auto_2379 ?auto_2372 ) ( TRUCK-AT ?auto_2376 ?auto_2375 ) ( OBJ-AT ?auto_2373 ?auto_2375 ) ( OBJ-AT ?auto_2371 ?auto_2372 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2373 ?auto_2372 )
      ( DELIVER-2PKG-VERIFY ?auto_2371 ?auto_2373 ?auto_2372 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2487 - OBJ
      ?auto_2488 - LOCATION
    )
    :vars
    (
      ?auto_2496 - OBJ
      ?auto_2491 - OBJ
      ?auto_2493 - LOCATION
      ?auto_2490 - CITY
      ?auto_2489 - TRUCK
      ?auto_2498 - LOCATION
      ?auto_2499 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2487 ?auto_2496 ) ( GREATER-THAN ?auto_2487 ?auto_2491 ) ( IN-CITY ?auto_2493 ?auto_2490 ) ( IN-CITY ?auto_2488 ?auto_2490 ) ( not ( = ?auto_2488 ?auto_2493 ) ) ( OBJ-AT ?auto_2491 ?auto_2488 ) ( OBJ-AT ?auto_2487 ?auto_2493 ) ( OBJ-AT ?auto_2496 ?auto_2488 ) ( TRUCK-AT ?auto_2489 ?auto_2498 ) ( IN-CITY ?auto_2498 ?auto_2499 ) ( IN-CITY ?auto_2493 ?auto_2499 ) ( not ( = ?auto_2493 ?auto_2498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2489 ?auto_2498 ?auto_2493 ?auto_2499 )
      ( DELIVER-2PKG ?auto_2496 ?auto_2487 ?auto_2488 )
      ( DELIVER-1PKG-VERIFY ?auto_2487 ?auto_2488 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2501 - OBJ
      ?auto_2503 - OBJ
      ?auto_2502 - LOCATION
    )
    :vars
    (
      ?auto_2512 - OBJ
      ?auto_2505 - OBJ
      ?auto_2504 - LOCATION
      ?auto_2510 - CITY
      ?auto_2508 - TRUCK
      ?auto_2506 - LOCATION
      ?auto_2509 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2503 ?auto_2501 ) ( GREATER-THAN ?auto_2503 ?auto_2512 ) ( GREATER-THAN ?auto_2503 ?auto_2505 ) ( IN-CITY ?auto_2504 ?auto_2510 ) ( IN-CITY ?auto_2502 ?auto_2510 ) ( not ( = ?auto_2502 ?auto_2504 ) ) ( OBJ-AT ?auto_2505 ?auto_2502 ) ( OBJ-AT ?auto_2503 ?auto_2504 ) ( OBJ-AT ?auto_2512 ?auto_2502 ) ( TRUCK-AT ?auto_2508 ?auto_2506 ) ( IN-CITY ?auto_2506 ?auto_2509 ) ( IN-CITY ?auto_2504 ?auto_2509 ) ( not ( = ?auto_2504 ?auto_2506 ) ) ( OBJ-AT ?auto_2501 ?auto_2502 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2503 ?auto_2502 )
      ( DELIVER-2PKG-VERIFY ?auto_2501 ?auto_2503 ?auto_2502 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2637 - OBJ
      ?auto_2638 - LOCATION
    )
    :vars
    (
      ?auto_2644 - OBJ
      ?auto_2643 - LOCATION
      ?auto_2648 - CITY
      ?auto_2647 - TRUCK
      ?auto_2646 - LOCATION
      ?auto_2645 - CITY
      ?auto_2649 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2637 ?auto_2644 ) ( IN-CITY ?auto_2643 ?auto_2648 ) ( IN-CITY ?auto_2638 ?auto_2648 ) ( not ( = ?auto_2638 ?auto_2643 ) ) ( OBJ-AT ?auto_2637 ?auto_2643 ) ( TRUCK-AT ?auto_2647 ?auto_2646 ) ( IN-CITY ?auto_2646 ?auto_2645 ) ( IN-CITY ?auto_2643 ?auto_2645 ) ( not ( = ?auto_2643 ?auto_2646 ) ) ( TRUCK-AT ?auto_2649 ?auto_2638 ) ( IN-TRUCK ?auto_2644 ?auto_2649 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2644 ?auto_2638 )
      ( DELIVER-2PKG ?auto_2644 ?auto_2637 ?auto_2638 )
      ( DELIVER-1PKG-VERIFY ?auto_2637 ?auto_2638 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2652 - OBJ
      ?auto_2654 - OBJ
      ?auto_2653 - LOCATION
    )
    :vars
    (
      ?auto_2658 - LOCATION
      ?auto_2655 - CITY
      ?auto_2659 - TRUCK
      ?auto_2660 - LOCATION
      ?auto_2657 - CITY
      ?auto_2662 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2654 ?auto_2652 ) ( IN-CITY ?auto_2658 ?auto_2655 ) ( IN-CITY ?auto_2653 ?auto_2655 ) ( not ( = ?auto_2653 ?auto_2658 ) ) ( OBJ-AT ?auto_2654 ?auto_2658 ) ( TRUCK-AT ?auto_2659 ?auto_2660 ) ( IN-CITY ?auto_2660 ?auto_2657 ) ( IN-CITY ?auto_2658 ?auto_2657 ) ( not ( = ?auto_2658 ?auto_2660 ) ) ( TRUCK-AT ?auto_2662 ?auto_2653 ) ( IN-TRUCK ?auto_2652 ?auto_2662 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2654 ?auto_2653 )
      ( DELIVER-2PKG-VERIFY ?auto_2652 ?auto_2654 ?auto_2653 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2779 - OBJ
      ?auto_2780 - LOCATION
    )
    :vars
    (
      ?auto_2789 - OBJ
      ?auto_2783 - LOCATION
      ?auto_2781 - CITY
      ?auto_2782 - CITY
      ?auto_2785 - TRUCK
      ?auto_2791 - LOCATION
      ?auto_2792 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2779 ?auto_2789 ) ( IN-CITY ?auto_2783 ?auto_2781 ) ( IN-CITY ?auto_2780 ?auto_2781 ) ( not ( = ?auto_2780 ?auto_2783 ) ) ( OBJ-AT ?auto_2779 ?auto_2783 ) ( IN-CITY ?auto_2780 ?auto_2782 ) ( IN-CITY ?auto_2783 ?auto_2782 ) ( IN-TRUCK ?auto_2789 ?auto_2785 ) ( TRUCK-AT ?auto_2785 ?auto_2791 ) ( IN-CITY ?auto_2791 ?auto_2792 ) ( IN-CITY ?auto_2780 ?auto_2792 ) ( not ( = ?auto_2780 ?auto_2791 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2785 ?auto_2791 ?auto_2780 ?auto_2792 )
      ( DELIVER-2PKG ?auto_2789 ?auto_2779 ?auto_2780 )
      ( DELIVER-1PKG-VERIFY ?auto_2779 ?auto_2780 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2794 - OBJ
      ?auto_2796 - OBJ
      ?auto_2795 - LOCATION
    )
    :vars
    (
      ?auto_2799 - LOCATION
      ?auto_2800 - CITY
      ?auto_2803 - CITY
      ?auto_2798 - TRUCK
      ?auto_2797 - LOCATION
      ?auto_2804 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2796 ?auto_2794 ) ( IN-CITY ?auto_2799 ?auto_2800 ) ( IN-CITY ?auto_2795 ?auto_2800 ) ( not ( = ?auto_2795 ?auto_2799 ) ) ( OBJ-AT ?auto_2796 ?auto_2799 ) ( IN-CITY ?auto_2795 ?auto_2803 ) ( IN-CITY ?auto_2799 ?auto_2803 ) ( IN-TRUCK ?auto_2794 ?auto_2798 ) ( TRUCK-AT ?auto_2798 ?auto_2797 ) ( IN-CITY ?auto_2797 ?auto_2804 ) ( IN-CITY ?auto_2795 ?auto_2804 ) ( not ( = ?auto_2795 ?auto_2797 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2796 ?auto_2795 )
      ( DELIVER-2PKG-VERIFY ?auto_2794 ?auto_2796 ?auto_2795 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2921 - OBJ
      ?auto_2922 - LOCATION
    )
    :vars
    (
      ?auto_2929 - OBJ
      ?auto_2923 - LOCATION
      ?auto_2925 - CITY
      ?auto_2926 - CITY
      ?auto_2927 - TRUCK
      ?auto_2924 - LOCATION
      ?auto_2928 - CITY
      ?auto_2933 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2921 ?auto_2929 ) ( IN-CITY ?auto_2923 ?auto_2925 ) ( IN-CITY ?auto_2922 ?auto_2925 ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( OBJ-AT ?auto_2921 ?auto_2923 ) ( IN-CITY ?auto_2922 ?auto_2926 ) ( IN-CITY ?auto_2923 ?auto_2926 ) ( TRUCK-AT ?auto_2927 ?auto_2924 ) ( IN-CITY ?auto_2924 ?auto_2928 ) ( IN-CITY ?auto_2922 ?auto_2928 ) ( not ( = ?auto_2922 ?auto_2924 ) ) ( TRUCK-AT ?auto_2927 ?auto_2933 ) ( OBJ-AT ?auto_2929 ?auto_2933 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2929 ?auto_2927 ?auto_2933 )
      ( DELIVER-2PKG ?auto_2929 ?auto_2921 ?auto_2922 )
      ( DELIVER-1PKG-VERIFY ?auto_2921 ?auto_2922 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2935 - OBJ
      ?auto_2937 - OBJ
      ?auto_2936 - LOCATION
    )
    :vars
    (
      ?auto_2943 - LOCATION
      ?auto_2941 - CITY
      ?auto_2942 - CITY
      ?auto_2939 - TRUCK
      ?auto_2938 - LOCATION
      ?auto_2944 - CITY
      ?auto_2945 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2937 ?auto_2935 ) ( IN-CITY ?auto_2943 ?auto_2941 ) ( IN-CITY ?auto_2936 ?auto_2941 ) ( not ( = ?auto_2936 ?auto_2943 ) ) ( OBJ-AT ?auto_2937 ?auto_2943 ) ( IN-CITY ?auto_2936 ?auto_2942 ) ( IN-CITY ?auto_2943 ?auto_2942 ) ( TRUCK-AT ?auto_2939 ?auto_2938 ) ( IN-CITY ?auto_2938 ?auto_2944 ) ( IN-CITY ?auto_2936 ?auto_2944 ) ( not ( = ?auto_2936 ?auto_2938 ) ) ( TRUCK-AT ?auto_2939 ?auto_2945 ) ( OBJ-AT ?auto_2935 ?auto_2945 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2937 ?auto_2936 )
      ( DELIVER-2PKG-VERIFY ?auto_2935 ?auto_2937 ?auto_2936 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3313 - OBJ
      ?auto_3315 - OBJ
      ?auto_3316 - OBJ
      ?auto_3314 - LOCATION
    )
    :vars
    (
      ?auto_3318 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3315 ?auto_3313 ) ( GREATER-THAN ?auto_3316 ?auto_3313 ) ( GREATER-THAN ?auto_3316 ?auto_3315 ) ( TRUCK-AT ?auto_3318 ?auto_3314 ) ( IN-TRUCK ?auto_3316 ?auto_3318 ) ( OBJ-AT ?auto_3313 ?auto_3314 ) ( OBJ-AT ?auto_3315 ?auto_3314 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3316 ?auto_3314 )
      ( DELIVER-3PKG-VERIFY ?auto_3313 ?auto_3315 ?auto_3316 ?auto_3314 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3496 - OBJ
      ?auto_3498 - OBJ
      ?auto_3499 - OBJ
      ?auto_3497 - LOCATION
    )
    :vars
    (
      ?auto_3502 - OBJ
      ?auto_3500 - TRUCK
      ?auto_3504 - LOCATION
      ?auto_3503 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3498 ?auto_3496 ) ( GREATER-THAN ?auto_3499 ?auto_3496 ) ( GREATER-THAN ?auto_3499 ?auto_3498 ) ( GREATER-THAN ?auto_3499 ?auto_3502 ) ( IN-TRUCK ?auto_3499 ?auto_3500 ) ( TRUCK-AT ?auto_3500 ?auto_3504 ) ( IN-CITY ?auto_3504 ?auto_3503 ) ( IN-CITY ?auto_3497 ?auto_3503 ) ( not ( = ?auto_3497 ?auto_3504 ) ) ( OBJ-AT ?auto_3502 ?auto_3497 ) ( OBJ-AT ?auto_3496 ?auto_3497 ) ( OBJ-AT ?auto_3498 ?auto_3497 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3502 ?auto_3499 ?auto_3497 )
      ( DELIVER-3PKG-VERIFY ?auto_3496 ?auto_3498 ?auto_3499 ?auto_3497 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3745 - OBJ
      ?auto_3747 - OBJ
      ?auto_3748 - OBJ
      ?auto_3746 - LOCATION
    )
    :vars
    (
      ?auto_3750 - OBJ
      ?auto_3751 - OBJ
      ?auto_3755 - TRUCK
      ?auto_3754 - LOCATION
      ?auto_3752 - CITY
      ?auto_3756 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3747 ?auto_3745 ) ( GREATER-THAN ?auto_3748 ?auto_3745 ) ( GREATER-THAN ?auto_3748 ?auto_3747 ) ( GREATER-THAN ?auto_3748 ?auto_3750 ) ( GREATER-THAN ?auto_3748 ?auto_3751 ) ( TRUCK-AT ?auto_3755 ?auto_3754 ) ( IN-CITY ?auto_3754 ?auto_3752 ) ( IN-CITY ?auto_3746 ?auto_3752 ) ( not ( = ?auto_3746 ?auto_3754 ) ) ( OBJ-AT ?auto_3751 ?auto_3746 ) ( TRUCK-AT ?auto_3755 ?auto_3756 ) ( OBJ-AT ?auto_3748 ?auto_3756 ) ( OBJ-AT ?auto_3750 ?auto_3746 ) ( OBJ-AT ?auto_3745 ?auto_3746 ) ( OBJ-AT ?auto_3747 ?auto_3746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3750 ?auto_3748 ?auto_3746 )
      ( DELIVER-3PKG-VERIFY ?auto_3745 ?auto_3747 ?auto_3748 ?auto_3746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4043 - OBJ
      ?auto_4045 - OBJ
      ?auto_4046 - OBJ
      ?auto_4044 - LOCATION
    )
    :vars
    (
      ?auto_4050 - OBJ
      ?auto_4055 - OBJ
      ?auto_4052 - OBJ
      ?auto_4047 - LOCATION
      ?auto_4056 - CITY
      ?auto_4053 - TRUCK
      ?auto_4048 - LOCATION
      ?auto_4054 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4045 ?auto_4043 ) ( GREATER-THAN ?auto_4046 ?auto_4043 ) ( GREATER-THAN ?auto_4046 ?auto_4045 ) ( GREATER-THAN ?auto_4046 ?auto_4050 ) ( GREATER-THAN ?auto_4046 ?auto_4055 ) ( GREATER-THAN ?auto_4046 ?auto_4052 ) ( IN-CITY ?auto_4047 ?auto_4056 ) ( IN-CITY ?auto_4044 ?auto_4056 ) ( not ( = ?auto_4044 ?auto_4047 ) ) ( OBJ-AT ?auto_4052 ?auto_4044 ) ( OBJ-AT ?auto_4046 ?auto_4047 ) ( OBJ-AT ?auto_4055 ?auto_4044 ) ( TRUCK-AT ?auto_4053 ?auto_4048 ) ( IN-CITY ?auto_4048 ?auto_4054 ) ( IN-CITY ?auto_4047 ?auto_4054 ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( OBJ-AT ?auto_4050 ?auto_4044 ) ( OBJ-AT ?auto_4043 ?auto_4044 ) ( OBJ-AT ?auto_4045 ?auto_4044 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4050 ?auto_4046 ?auto_4044 )
      ( DELIVER-3PKG-VERIFY ?auto_4043 ?auto_4045 ?auto_4046 ?auto_4044 ) )
  )

)

