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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10810 - OBJ
      ?auto_10809 - LOCATION
    )
    :vars
    (
      ?auto_10811 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10811 ?auto_10809 ) ( IN-TRUCK ?auto_10810 ?auto_10811 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10810 ?auto_10811 ?auto_10809 )
      ( DELIVER-1PKG-VERIFY ?auto_10810 ?auto_10809 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10822 - OBJ
      ?auto_10821 - LOCATION
    )
    :vars
    (
      ?auto_10823 - TRUCK
      ?auto_10824 - LOCATION
      ?auto_10825 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10822 ?auto_10823 ) ( TRUCK-AT ?auto_10823 ?auto_10824 ) ( IN-CITY ?auto_10824 ?auto_10825 ) ( IN-CITY ?auto_10821 ?auto_10825 ) ( not ( = ?auto_10821 ?auto_10824 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10823 ?auto_10824 ?auto_10821 ?auto_10825 )
      ( DELIVER-1PKG ?auto_10822 ?auto_10821 )
      ( DELIVER-1PKG-VERIFY ?auto_10822 ?auto_10821 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10840 - OBJ
      ?auto_10839 - LOCATION
    )
    :vars
    (
      ?auto_10843 - TRUCK
      ?auto_10842 - LOCATION
      ?auto_10841 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10843 ?auto_10842 ) ( IN-CITY ?auto_10842 ?auto_10841 ) ( IN-CITY ?auto_10839 ?auto_10841 ) ( not ( = ?auto_10839 ?auto_10842 ) ) ( OBJ-AT ?auto_10840 ?auto_10842 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10840 ?auto_10843 ?auto_10842 )
      ( DELIVER-1PKG ?auto_10840 ?auto_10839 )
      ( DELIVER-1PKG-VERIFY ?auto_10840 ?auto_10839 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10858 - OBJ
      ?auto_10857 - LOCATION
    )
    :vars
    (
      ?auto_10861 - LOCATION
      ?auto_10859 - CITY
      ?auto_10860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10861 ?auto_10859 ) ( IN-CITY ?auto_10857 ?auto_10859 ) ( not ( = ?auto_10857 ?auto_10861 ) ) ( OBJ-AT ?auto_10858 ?auto_10861 ) ( TRUCK-AT ?auto_10860 ?auto_10857 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10860 ?auto_10857 ?auto_10861 ?auto_10859 )
      ( DELIVER-1PKG ?auto_10858 ?auto_10857 )
      ( DELIVER-1PKG-VERIFY ?auto_10858 ?auto_10857 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10915 - OBJ
      ?auto_10914 - LOCATION
    )
    :vars
    (
      ?auto_10916 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10916 ?auto_10914 ) ( IN-TRUCK ?auto_10915 ?auto_10916 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10915 ?auto_10916 ?auto_10914 )
      ( DELIVER-1PKG-VERIFY ?auto_10915 ?auto_10914 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10918 - OBJ
      ?auto_10919 - OBJ
      ?auto_10917 - LOCATION
    )
    :vars
    (
      ?auto_10920 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10919 ?auto_10918 ) ) ( TRUCK-AT ?auto_10920 ?auto_10917 ) ( IN-TRUCK ?auto_10919 ?auto_10920 ) ( OBJ-AT ?auto_10918 ?auto_10917 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10919 ?auto_10917 )
      ( DELIVER-2PKG-VERIFY ?auto_10918 ?auto_10919 ?auto_10917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10922 - OBJ
      ?auto_10923 - OBJ
      ?auto_10921 - LOCATION
    )
    :vars
    (
      ?auto_10924 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10923 ?auto_10922 ) ) ( TRUCK-AT ?auto_10924 ?auto_10921 ) ( IN-TRUCK ?auto_10922 ?auto_10924 ) ( OBJ-AT ?auto_10923 ?auto_10921 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10922 ?auto_10921 )
      ( DELIVER-2PKG-VERIFY ?auto_10922 ?auto_10923 ?auto_10921 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10965 - OBJ
      ?auto_10964 - LOCATION
    )
    :vars
    (
      ?auto_10966 - TRUCK
      ?auto_10967 - LOCATION
      ?auto_10968 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10965 ?auto_10966 ) ( TRUCK-AT ?auto_10966 ?auto_10967 ) ( IN-CITY ?auto_10967 ?auto_10968 ) ( IN-CITY ?auto_10964 ?auto_10968 ) ( not ( = ?auto_10964 ?auto_10967 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10966 ?auto_10967 ?auto_10964 ?auto_10968 )
      ( DELIVER-1PKG ?auto_10965 ?auto_10964 )
      ( DELIVER-1PKG-VERIFY ?auto_10965 ?auto_10964 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10970 - OBJ
      ?auto_10971 - OBJ
      ?auto_10969 - LOCATION
    )
    :vars
    (
      ?auto_10972 - TRUCK
      ?auto_10974 - LOCATION
      ?auto_10973 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10971 ?auto_10970 ) ) ( IN-TRUCK ?auto_10971 ?auto_10972 ) ( TRUCK-AT ?auto_10972 ?auto_10974 ) ( IN-CITY ?auto_10974 ?auto_10973 ) ( IN-CITY ?auto_10969 ?auto_10973 ) ( not ( = ?auto_10969 ?auto_10974 ) ) ( OBJ-AT ?auto_10970 ?auto_10969 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10971 ?auto_10969 )
      ( DELIVER-2PKG-VERIFY ?auto_10970 ?auto_10971 ?auto_10969 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10976 - OBJ
      ?auto_10977 - OBJ
      ?auto_10975 - LOCATION
    )
    :vars
    (
      ?auto_10980 - TRUCK
      ?auto_10978 - LOCATION
      ?auto_10979 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10977 ?auto_10976 ) ) ( IN-TRUCK ?auto_10976 ?auto_10980 ) ( TRUCK-AT ?auto_10980 ?auto_10978 ) ( IN-CITY ?auto_10978 ?auto_10979 ) ( IN-CITY ?auto_10975 ?auto_10979 ) ( not ( = ?auto_10975 ?auto_10978 ) ) ( OBJ-AT ?auto_10977 ?auto_10975 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10977 ?auto_10976 ?auto_10975 )
      ( DELIVER-2PKG-VERIFY ?auto_10976 ?auto_10977 ?auto_10975 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11039 - OBJ
      ?auto_11038 - LOCATION
    )
    :vars
    (
      ?auto_11042 - OBJ
      ?auto_11043 - TRUCK
      ?auto_11040 - LOCATION
      ?auto_11041 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11039 ?auto_11042 ) ) ( TRUCK-AT ?auto_11043 ?auto_11040 ) ( IN-CITY ?auto_11040 ?auto_11041 ) ( IN-CITY ?auto_11038 ?auto_11041 ) ( not ( = ?auto_11038 ?auto_11040 ) ) ( OBJ-AT ?auto_11042 ?auto_11038 ) ( OBJ-AT ?auto_11039 ?auto_11040 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11039 ?auto_11043 ?auto_11040 )
      ( DELIVER-2PKG ?auto_11042 ?auto_11039 ?auto_11038 )
      ( DELIVER-1PKG-VERIFY ?auto_11039 ?auto_11038 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11045 - OBJ
      ?auto_11046 - OBJ
      ?auto_11044 - LOCATION
    )
    :vars
    (
      ?auto_11047 - TRUCK
      ?auto_11048 - LOCATION
      ?auto_11049 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11046 ?auto_11045 ) ) ( TRUCK-AT ?auto_11047 ?auto_11048 ) ( IN-CITY ?auto_11048 ?auto_11049 ) ( IN-CITY ?auto_11044 ?auto_11049 ) ( not ( = ?auto_11044 ?auto_11048 ) ) ( OBJ-AT ?auto_11045 ?auto_11044 ) ( OBJ-AT ?auto_11046 ?auto_11048 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11046 ?auto_11044 )
      ( DELIVER-2PKG-VERIFY ?auto_11045 ?auto_11046 ?auto_11044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11051 - OBJ
      ?auto_11052 - OBJ
      ?auto_11050 - LOCATION
    )
    :vars
    (
      ?auto_11054 - TRUCK
      ?auto_11053 - LOCATION
      ?auto_11055 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11052 ?auto_11051 ) ) ( TRUCK-AT ?auto_11054 ?auto_11053 ) ( IN-CITY ?auto_11053 ?auto_11055 ) ( IN-CITY ?auto_11050 ?auto_11055 ) ( not ( = ?auto_11050 ?auto_11053 ) ) ( OBJ-AT ?auto_11052 ?auto_11050 ) ( OBJ-AT ?auto_11051 ?auto_11053 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11052 ?auto_11051 ?auto_11050 )
      ( DELIVER-2PKG-VERIFY ?auto_11051 ?auto_11052 ?auto_11050 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11114 - OBJ
      ?auto_11113 - LOCATION
    )
    :vars
    (
      ?auto_11116 - OBJ
      ?auto_11115 - LOCATION
      ?auto_11118 - CITY
      ?auto_11117 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11114 ?auto_11116 ) ) ( IN-CITY ?auto_11115 ?auto_11118 ) ( IN-CITY ?auto_11113 ?auto_11118 ) ( not ( = ?auto_11113 ?auto_11115 ) ) ( OBJ-AT ?auto_11116 ?auto_11113 ) ( OBJ-AT ?auto_11114 ?auto_11115 ) ( TRUCK-AT ?auto_11117 ?auto_11113 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11117 ?auto_11113 ?auto_11115 ?auto_11118 )
      ( DELIVER-2PKG ?auto_11116 ?auto_11114 ?auto_11113 )
      ( DELIVER-1PKG-VERIFY ?auto_11114 ?auto_11113 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11120 - OBJ
      ?auto_11121 - OBJ
      ?auto_11119 - LOCATION
    )
    :vars
    (
      ?auto_11124 - LOCATION
      ?auto_11122 - CITY
      ?auto_11123 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11121 ?auto_11120 ) ) ( IN-CITY ?auto_11124 ?auto_11122 ) ( IN-CITY ?auto_11119 ?auto_11122 ) ( not ( = ?auto_11119 ?auto_11124 ) ) ( OBJ-AT ?auto_11120 ?auto_11119 ) ( OBJ-AT ?auto_11121 ?auto_11124 ) ( TRUCK-AT ?auto_11123 ?auto_11119 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11121 ?auto_11119 )
      ( DELIVER-2PKG-VERIFY ?auto_11120 ?auto_11121 ?auto_11119 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11126 - OBJ
      ?auto_11127 - OBJ
      ?auto_11125 - LOCATION
    )
    :vars
    (
      ?auto_11130 - LOCATION
      ?auto_11128 - CITY
      ?auto_11129 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11127 ?auto_11126 ) ) ( IN-CITY ?auto_11130 ?auto_11128 ) ( IN-CITY ?auto_11125 ?auto_11128 ) ( not ( = ?auto_11125 ?auto_11130 ) ) ( OBJ-AT ?auto_11127 ?auto_11125 ) ( OBJ-AT ?auto_11126 ?auto_11130 ) ( TRUCK-AT ?auto_11129 ?auto_11125 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11127 ?auto_11126 ?auto_11125 )
      ( DELIVER-2PKG-VERIFY ?auto_11126 ?auto_11127 ?auto_11125 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11189 - OBJ
      ?auto_11188 - LOCATION
    )
    :vars
    (
      ?auto_11191 - OBJ
      ?auto_11193 - LOCATION
      ?auto_11190 - CITY
      ?auto_11192 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11189 ?auto_11191 ) ) ( IN-CITY ?auto_11193 ?auto_11190 ) ( IN-CITY ?auto_11188 ?auto_11190 ) ( not ( = ?auto_11188 ?auto_11193 ) ) ( OBJ-AT ?auto_11189 ?auto_11193 ) ( TRUCK-AT ?auto_11192 ?auto_11188 ) ( IN-TRUCK ?auto_11191 ?auto_11192 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11191 ?auto_11188 )
      ( DELIVER-2PKG ?auto_11191 ?auto_11189 ?auto_11188 )
      ( DELIVER-1PKG-VERIFY ?auto_11189 ?auto_11188 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11195 - OBJ
      ?auto_11196 - OBJ
      ?auto_11194 - LOCATION
    )
    :vars
    (
      ?auto_11198 - LOCATION
      ?auto_11199 - CITY
      ?auto_11197 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11196 ?auto_11195 ) ) ( IN-CITY ?auto_11198 ?auto_11199 ) ( IN-CITY ?auto_11194 ?auto_11199 ) ( not ( = ?auto_11194 ?auto_11198 ) ) ( OBJ-AT ?auto_11196 ?auto_11198 ) ( TRUCK-AT ?auto_11197 ?auto_11194 ) ( IN-TRUCK ?auto_11195 ?auto_11197 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11196 ?auto_11194 )
      ( DELIVER-2PKG-VERIFY ?auto_11195 ?auto_11196 ?auto_11194 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11201 - OBJ
      ?auto_11202 - OBJ
      ?auto_11200 - LOCATION
    )
    :vars
    (
      ?auto_11204 - LOCATION
      ?auto_11205 - CITY
      ?auto_11203 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11202 ?auto_11201 ) ) ( IN-CITY ?auto_11204 ?auto_11205 ) ( IN-CITY ?auto_11200 ?auto_11205 ) ( not ( = ?auto_11200 ?auto_11204 ) ) ( OBJ-AT ?auto_11201 ?auto_11204 ) ( TRUCK-AT ?auto_11203 ?auto_11200 ) ( IN-TRUCK ?auto_11202 ?auto_11203 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11202 ?auto_11201 ?auto_11200 )
      ( DELIVER-2PKG-VERIFY ?auto_11201 ?auto_11202 ?auto_11200 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11264 - OBJ
      ?auto_11263 - LOCATION
    )
    :vars
    (
      ?auto_11268 - OBJ
      ?auto_11266 - LOCATION
      ?auto_11267 - CITY
      ?auto_11265 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11264 ?auto_11268 ) ) ( IN-CITY ?auto_11266 ?auto_11267 ) ( IN-CITY ?auto_11263 ?auto_11267 ) ( not ( = ?auto_11263 ?auto_11266 ) ) ( OBJ-AT ?auto_11264 ?auto_11266 ) ( IN-TRUCK ?auto_11268 ?auto_11265 ) ( TRUCK-AT ?auto_11265 ?auto_11266 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11265 ?auto_11266 ?auto_11263 ?auto_11267 )
      ( DELIVER-2PKG ?auto_11268 ?auto_11264 ?auto_11263 )
      ( DELIVER-1PKG-VERIFY ?auto_11264 ?auto_11263 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11270 - OBJ
      ?auto_11271 - OBJ
      ?auto_11269 - LOCATION
    )
    :vars
    (
      ?auto_11273 - LOCATION
      ?auto_11274 - CITY
      ?auto_11272 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11271 ?auto_11270 ) ) ( IN-CITY ?auto_11273 ?auto_11274 ) ( IN-CITY ?auto_11269 ?auto_11274 ) ( not ( = ?auto_11269 ?auto_11273 ) ) ( OBJ-AT ?auto_11271 ?auto_11273 ) ( IN-TRUCK ?auto_11270 ?auto_11272 ) ( TRUCK-AT ?auto_11272 ?auto_11273 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11271 ?auto_11269 )
      ( DELIVER-2PKG-VERIFY ?auto_11270 ?auto_11271 ?auto_11269 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11276 - OBJ
      ?auto_11277 - OBJ
      ?auto_11275 - LOCATION
    )
    :vars
    (
      ?auto_11280 - LOCATION
      ?auto_11278 - CITY
      ?auto_11279 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11277 ?auto_11276 ) ) ( IN-CITY ?auto_11280 ?auto_11278 ) ( IN-CITY ?auto_11275 ?auto_11278 ) ( not ( = ?auto_11275 ?auto_11280 ) ) ( OBJ-AT ?auto_11276 ?auto_11280 ) ( IN-TRUCK ?auto_11277 ?auto_11279 ) ( TRUCK-AT ?auto_11279 ?auto_11280 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11277 ?auto_11276 ?auto_11275 )
      ( DELIVER-2PKG-VERIFY ?auto_11276 ?auto_11277 ?auto_11275 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11339 - OBJ
      ?auto_11338 - LOCATION
    )
    :vars
    (
      ?auto_11342 - OBJ
      ?auto_11343 - LOCATION
      ?auto_11340 - CITY
      ?auto_11341 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11339 ?auto_11342 ) ) ( IN-CITY ?auto_11343 ?auto_11340 ) ( IN-CITY ?auto_11338 ?auto_11340 ) ( not ( = ?auto_11338 ?auto_11343 ) ) ( OBJ-AT ?auto_11339 ?auto_11343 ) ( TRUCK-AT ?auto_11341 ?auto_11343 ) ( OBJ-AT ?auto_11342 ?auto_11343 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11342 ?auto_11341 ?auto_11343 )
      ( DELIVER-2PKG ?auto_11342 ?auto_11339 ?auto_11338 )
      ( DELIVER-1PKG-VERIFY ?auto_11339 ?auto_11338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11345 - OBJ
      ?auto_11346 - OBJ
      ?auto_11344 - LOCATION
    )
    :vars
    (
      ?auto_11349 - LOCATION
      ?auto_11348 - CITY
      ?auto_11347 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11346 ?auto_11345 ) ) ( IN-CITY ?auto_11349 ?auto_11348 ) ( IN-CITY ?auto_11344 ?auto_11348 ) ( not ( = ?auto_11344 ?auto_11349 ) ) ( OBJ-AT ?auto_11346 ?auto_11349 ) ( TRUCK-AT ?auto_11347 ?auto_11349 ) ( OBJ-AT ?auto_11345 ?auto_11349 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11346 ?auto_11344 )
      ( DELIVER-2PKG-VERIFY ?auto_11345 ?auto_11346 ?auto_11344 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11351 - OBJ
      ?auto_11352 - OBJ
      ?auto_11350 - LOCATION
    )
    :vars
    (
      ?auto_11354 - LOCATION
      ?auto_11353 - CITY
      ?auto_11355 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11352 ?auto_11351 ) ) ( IN-CITY ?auto_11354 ?auto_11353 ) ( IN-CITY ?auto_11350 ?auto_11353 ) ( not ( = ?auto_11350 ?auto_11354 ) ) ( OBJ-AT ?auto_11351 ?auto_11354 ) ( TRUCK-AT ?auto_11355 ?auto_11354 ) ( OBJ-AT ?auto_11352 ?auto_11354 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11352 ?auto_11351 ?auto_11350 )
      ( DELIVER-2PKG-VERIFY ?auto_11351 ?auto_11352 ?auto_11350 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11414 - OBJ
      ?auto_11413 - LOCATION
    )
    :vars
    (
      ?auto_11417 - OBJ
      ?auto_11416 - LOCATION
      ?auto_11415 - CITY
      ?auto_11418 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11414 ?auto_11417 ) ) ( IN-CITY ?auto_11416 ?auto_11415 ) ( IN-CITY ?auto_11413 ?auto_11415 ) ( not ( = ?auto_11413 ?auto_11416 ) ) ( OBJ-AT ?auto_11414 ?auto_11416 ) ( OBJ-AT ?auto_11417 ?auto_11416 ) ( TRUCK-AT ?auto_11418 ?auto_11413 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11418 ?auto_11413 ?auto_11416 ?auto_11415 )
      ( DELIVER-2PKG ?auto_11417 ?auto_11414 ?auto_11413 )
      ( DELIVER-1PKG-VERIFY ?auto_11414 ?auto_11413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11420 - OBJ
      ?auto_11421 - OBJ
      ?auto_11419 - LOCATION
    )
    :vars
    (
      ?auto_11422 - LOCATION
      ?auto_11423 - CITY
      ?auto_11424 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11421 ?auto_11420 ) ) ( IN-CITY ?auto_11422 ?auto_11423 ) ( IN-CITY ?auto_11419 ?auto_11423 ) ( not ( = ?auto_11419 ?auto_11422 ) ) ( OBJ-AT ?auto_11421 ?auto_11422 ) ( OBJ-AT ?auto_11420 ?auto_11422 ) ( TRUCK-AT ?auto_11424 ?auto_11419 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11421 ?auto_11419 )
      ( DELIVER-2PKG-VERIFY ?auto_11420 ?auto_11421 ?auto_11419 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11426 - OBJ
      ?auto_11427 - OBJ
      ?auto_11425 - LOCATION
    )
    :vars
    (
      ?auto_11429 - LOCATION
      ?auto_11428 - CITY
      ?auto_11430 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11427 ?auto_11426 ) ) ( IN-CITY ?auto_11429 ?auto_11428 ) ( IN-CITY ?auto_11425 ?auto_11428 ) ( not ( = ?auto_11425 ?auto_11429 ) ) ( OBJ-AT ?auto_11426 ?auto_11429 ) ( OBJ-AT ?auto_11427 ?auto_11429 ) ( TRUCK-AT ?auto_11430 ?auto_11425 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11427 ?auto_11426 ?auto_11425 )
      ( DELIVER-2PKG-VERIFY ?auto_11426 ?auto_11427 ?auto_11425 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11582 - OBJ
      ?auto_11581 - LOCATION
    )
    :vars
    (
      ?auto_11583 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11583 ?auto_11581 ) ( IN-TRUCK ?auto_11582 ?auto_11583 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_11582 ?auto_11583 ?auto_11581 )
      ( DELIVER-1PKG-VERIFY ?auto_11582 ?auto_11581 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11585 - OBJ
      ?auto_11586 - OBJ
      ?auto_11584 - LOCATION
    )
    :vars
    (
      ?auto_11587 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11586 ?auto_11585 ) ) ( TRUCK-AT ?auto_11587 ?auto_11584 ) ( IN-TRUCK ?auto_11586 ?auto_11587 ) ( OBJ-AT ?auto_11585 ?auto_11584 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11586 ?auto_11584 )
      ( DELIVER-2PKG-VERIFY ?auto_11585 ?auto_11586 ?auto_11584 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11589 - OBJ
      ?auto_11590 - OBJ
      ?auto_11588 - LOCATION
    )
    :vars
    (
      ?auto_11591 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11590 ?auto_11589 ) ) ( TRUCK-AT ?auto_11591 ?auto_11588 ) ( IN-TRUCK ?auto_11590 ?auto_11591 ) ( OBJ-AT ?auto_11589 ?auto_11588 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11590 ?auto_11588 )
      ( DELIVER-2PKG-VERIFY ?auto_11589 ?auto_11590 ?auto_11588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11593 - OBJ
      ?auto_11594 - OBJ
      ?auto_11592 - LOCATION
    )
    :vars
    (
      ?auto_11595 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11594 ?auto_11593 ) ) ( TRUCK-AT ?auto_11595 ?auto_11592 ) ( IN-TRUCK ?auto_11593 ?auto_11595 ) ( OBJ-AT ?auto_11594 ?auto_11592 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11593 ?auto_11592 )
      ( DELIVER-2PKG-VERIFY ?auto_11593 ?auto_11594 ?auto_11592 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11597 - OBJ
      ?auto_11598 - OBJ
      ?auto_11596 - LOCATION
    )
    :vars
    (
      ?auto_11599 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11598 ?auto_11597 ) ) ( TRUCK-AT ?auto_11599 ?auto_11596 ) ( IN-TRUCK ?auto_11597 ?auto_11599 ) ( OBJ-AT ?auto_11598 ?auto_11596 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11597 ?auto_11596 )
      ( DELIVER-2PKG-VERIFY ?auto_11597 ?auto_11598 ?auto_11596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11610 - OBJ
      ?auto_11611 - OBJ
      ?auto_11612 - OBJ
      ?auto_11609 - LOCATION
    )
    :vars
    (
      ?auto_11613 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11611 ?auto_11610 ) ) ( not ( = ?auto_11612 ?auto_11610 ) ) ( not ( = ?auto_11612 ?auto_11611 ) ) ( TRUCK-AT ?auto_11613 ?auto_11609 ) ( IN-TRUCK ?auto_11612 ?auto_11613 ) ( OBJ-AT ?auto_11610 ?auto_11609 ) ( OBJ-AT ?auto_11611 ?auto_11609 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11612 ?auto_11609 )
      ( DELIVER-3PKG-VERIFY ?auto_11610 ?auto_11611 ?auto_11612 ?auto_11609 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11620 - OBJ
      ?auto_11621 - OBJ
      ?auto_11622 - OBJ
      ?auto_11619 - LOCATION
    )
    :vars
    (
      ?auto_11623 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11621 ?auto_11620 ) ) ( not ( = ?auto_11622 ?auto_11620 ) ) ( not ( = ?auto_11622 ?auto_11621 ) ) ( TRUCK-AT ?auto_11623 ?auto_11619 ) ( IN-TRUCK ?auto_11621 ?auto_11623 ) ( OBJ-AT ?auto_11620 ?auto_11619 ) ( OBJ-AT ?auto_11622 ?auto_11619 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11621 ?auto_11619 )
      ( DELIVER-3PKG-VERIFY ?auto_11620 ?auto_11621 ?auto_11622 ?auto_11619 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11630 - OBJ
      ?auto_11631 - OBJ
      ?auto_11632 - OBJ
      ?auto_11629 - LOCATION
    )
    :vars
    (
      ?auto_11633 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11631 ?auto_11630 ) ) ( not ( = ?auto_11632 ?auto_11630 ) ) ( not ( = ?auto_11632 ?auto_11631 ) ) ( TRUCK-AT ?auto_11633 ?auto_11629 ) ( IN-TRUCK ?auto_11632 ?auto_11633 ) ( OBJ-AT ?auto_11630 ?auto_11629 ) ( OBJ-AT ?auto_11631 ?auto_11629 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11632 ?auto_11629 )
      ( DELIVER-3PKG-VERIFY ?auto_11630 ?auto_11631 ?auto_11632 ?auto_11629 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11640 - OBJ
      ?auto_11641 - OBJ
      ?auto_11642 - OBJ
      ?auto_11639 - LOCATION
    )
    :vars
    (
      ?auto_11643 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11641 ?auto_11640 ) ) ( not ( = ?auto_11642 ?auto_11640 ) ) ( not ( = ?auto_11642 ?auto_11641 ) ) ( TRUCK-AT ?auto_11643 ?auto_11639 ) ( IN-TRUCK ?auto_11641 ?auto_11643 ) ( OBJ-AT ?auto_11640 ?auto_11639 ) ( OBJ-AT ?auto_11642 ?auto_11639 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11641 ?auto_11639 )
      ( DELIVER-3PKG-VERIFY ?auto_11640 ?auto_11641 ?auto_11642 ?auto_11639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11660 - OBJ
      ?auto_11661 - OBJ
      ?auto_11662 - OBJ
      ?auto_11659 - LOCATION
    )
    :vars
    (
      ?auto_11663 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11661 ?auto_11660 ) ) ( not ( = ?auto_11662 ?auto_11660 ) ) ( not ( = ?auto_11662 ?auto_11661 ) ) ( TRUCK-AT ?auto_11663 ?auto_11659 ) ( IN-TRUCK ?auto_11660 ?auto_11663 ) ( OBJ-AT ?auto_11661 ?auto_11659 ) ( OBJ-AT ?auto_11662 ?auto_11659 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11660 ?auto_11659 )
      ( DELIVER-3PKG-VERIFY ?auto_11660 ?auto_11661 ?auto_11662 ?auto_11659 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11670 - OBJ
      ?auto_11671 - OBJ
      ?auto_11672 - OBJ
      ?auto_11669 - LOCATION
    )
    :vars
    (
      ?auto_11673 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11671 ?auto_11670 ) ) ( not ( = ?auto_11672 ?auto_11670 ) ) ( not ( = ?auto_11672 ?auto_11671 ) ) ( TRUCK-AT ?auto_11673 ?auto_11669 ) ( IN-TRUCK ?auto_11670 ?auto_11673 ) ( OBJ-AT ?auto_11671 ?auto_11669 ) ( OBJ-AT ?auto_11672 ?auto_11669 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11670 ?auto_11669 )
      ( DELIVER-3PKG-VERIFY ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11669 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11700 - OBJ
      ?auto_11699 - LOCATION
    )
    :vars
    (
      ?auto_11701 - TRUCK
      ?auto_11702 - LOCATION
      ?auto_11703 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11700 ?auto_11701 ) ( TRUCK-AT ?auto_11701 ?auto_11702 ) ( IN-CITY ?auto_11702 ?auto_11703 ) ( IN-CITY ?auto_11699 ?auto_11703 ) ( not ( = ?auto_11699 ?auto_11702 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11701 ?auto_11702 ?auto_11699 ?auto_11703 )
      ( DELIVER-1PKG ?auto_11700 ?auto_11699 )
      ( DELIVER-1PKG-VERIFY ?auto_11700 ?auto_11699 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11705 - OBJ
      ?auto_11706 - OBJ
      ?auto_11704 - LOCATION
    )
    :vars
    (
      ?auto_11709 - TRUCK
      ?auto_11707 - LOCATION
      ?auto_11708 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11706 ?auto_11705 ) ) ( IN-TRUCK ?auto_11706 ?auto_11709 ) ( TRUCK-AT ?auto_11709 ?auto_11707 ) ( IN-CITY ?auto_11707 ?auto_11708 ) ( IN-CITY ?auto_11704 ?auto_11708 ) ( not ( = ?auto_11704 ?auto_11707 ) ) ( OBJ-AT ?auto_11705 ?auto_11704 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11706 ?auto_11704 )
      ( DELIVER-2PKG-VERIFY ?auto_11705 ?auto_11706 ?auto_11704 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11711 - OBJ
      ?auto_11712 - OBJ
      ?auto_11710 - LOCATION
    )
    :vars
    (
      ?auto_11714 - OBJ
      ?auto_11713 - TRUCK
      ?auto_11715 - LOCATION
      ?auto_11716 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11712 ?auto_11711 ) ) ( not ( = ?auto_11712 ?auto_11714 ) ) ( IN-TRUCK ?auto_11712 ?auto_11713 ) ( TRUCK-AT ?auto_11713 ?auto_11715 ) ( IN-CITY ?auto_11715 ?auto_11716 ) ( IN-CITY ?auto_11710 ?auto_11716 ) ( not ( = ?auto_11710 ?auto_11715 ) ) ( OBJ-AT ?auto_11714 ?auto_11710 ) ( OBJ-AT ?auto_11711 ?auto_11710 ) ( not ( = ?auto_11711 ?auto_11714 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11714 ?auto_11712 ?auto_11710 )
      ( DELIVER-2PKG-VERIFY ?auto_11711 ?auto_11712 ?auto_11710 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11718 - OBJ
      ?auto_11719 - OBJ
      ?auto_11717 - LOCATION
    )
    :vars
    (
      ?auto_11720 - TRUCK
      ?auto_11721 - LOCATION
      ?auto_11722 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11719 ?auto_11718 ) ) ( IN-TRUCK ?auto_11718 ?auto_11720 ) ( TRUCK-AT ?auto_11720 ?auto_11721 ) ( IN-CITY ?auto_11721 ?auto_11722 ) ( IN-CITY ?auto_11717 ?auto_11722 ) ( not ( = ?auto_11717 ?auto_11721 ) ) ( OBJ-AT ?auto_11719 ?auto_11717 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11719 ?auto_11718 ?auto_11717 )
      ( DELIVER-2PKG-VERIFY ?auto_11718 ?auto_11719 ?auto_11717 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11724 - OBJ
      ?auto_11725 - OBJ
      ?auto_11723 - LOCATION
    )
    :vars
    (
      ?auto_11727 - OBJ
      ?auto_11726 - TRUCK
      ?auto_11728 - LOCATION
      ?auto_11729 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11725 ?auto_11724 ) ) ( not ( = ?auto_11724 ?auto_11727 ) ) ( IN-TRUCK ?auto_11724 ?auto_11726 ) ( TRUCK-AT ?auto_11726 ?auto_11728 ) ( IN-CITY ?auto_11728 ?auto_11729 ) ( IN-CITY ?auto_11723 ?auto_11729 ) ( not ( = ?auto_11723 ?auto_11728 ) ) ( OBJ-AT ?auto_11727 ?auto_11723 ) ( OBJ-AT ?auto_11725 ?auto_11723 ) ( not ( = ?auto_11725 ?auto_11727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11727 ?auto_11724 ?auto_11723 )
      ( DELIVER-2PKG-VERIFY ?auto_11724 ?auto_11725 ?auto_11723 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11745 - OBJ
      ?auto_11746 - OBJ
      ?auto_11747 - OBJ
      ?auto_11744 - LOCATION
    )
    :vars
    (
      ?auto_11748 - TRUCK
      ?auto_11749 - LOCATION
      ?auto_11750 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11746 ?auto_11745 ) ) ( not ( = ?auto_11747 ?auto_11745 ) ) ( not ( = ?auto_11747 ?auto_11746 ) ) ( IN-TRUCK ?auto_11747 ?auto_11748 ) ( TRUCK-AT ?auto_11748 ?auto_11749 ) ( IN-CITY ?auto_11749 ?auto_11750 ) ( IN-CITY ?auto_11744 ?auto_11750 ) ( not ( = ?auto_11744 ?auto_11749 ) ) ( OBJ-AT ?auto_11745 ?auto_11744 ) ( OBJ-AT ?auto_11746 ?auto_11744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11745 ?auto_11747 ?auto_11744 )
      ( DELIVER-3PKG-VERIFY ?auto_11745 ?auto_11746 ?auto_11747 ?auto_11744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11759 - OBJ
      ?auto_11760 - OBJ
      ?auto_11761 - OBJ
      ?auto_11758 - LOCATION
    )
    :vars
    (
      ?auto_11762 - TRUCK
      ?auto_11763 - LOCATION
      ?auto_11764 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11760 ?auto_11759 ) ) ( not ( = ?auto_11761 ?auto_11759 ) ) ( not ( = ?auto_11761 ?auto_11760 ) ) ( IN-TRUCK ?auto_11760 ?auto_11762 ) ( TRUCK-AT ?auto_11762 ?auto_11763 ) ( IN-CITY ?auto_11763 ?auto_11764 ) ( IN-CITY ?auto_11758 ?auto_11764 ) ( not ( = ?auto_11758 ?auto_11763 ) ) ( OBJ-AT ?auto_11759 ?auto_11758 ) ( OBJ-AT ?auto_11761 ?auto_11758 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11759 ?auto_11760 ?auto_11758 )
      ( DELIVER-3PKG-VERIFY ?auto_11759 ?auto_11760 ?auto_11761 ?auto_11758 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11773 - OBJ
      ?auto_11774 - OBJ
      ?auto_11775 - OBJ
      ?auto_11772 - LOCATION
    )
    :vars
    (
      ?auto_11776 - TRUCK
      ?auto_11777 - LOCATION
      ?auto_11778 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11774 ?auto_11773 ) ) ( not ( = ?auto_11775 ?auto_11773 ) ) ( not ( = ?auto_11775 ?auto_11774 ) ) ( IN-TRUCK ?auto_11775 ?auto_11776 ) ( TRUCK-AT ?auto_11776 ?auto_11777 ) ( IN-CITY ?auto_11777 ?auto_11778 ) ( IN-CITY ?auto_11772 ?auto_11778 ) ( not ( = ?auto_11772 ?auto_11777 ) ) ( OBJ-AT ?auto_11774 ?auto_11772 ) ( OBJ-AT ?auto_11773 ?auto_11772 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11774 ?auto_11775 ?auto_11772 )
      ( DELIVER-3PKG-VERIFY ?auto_11773 ?auto_11774 ?auto_11775 ?auto_11772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11788 - OBJ
      ?auto_11789 - OBJ
      ?auto_11790 - OBJ
      ?auto_11787 - LOCATION
    )
    :vars
    (
      ?auto_11791 - TRUCK
      ?auto_11792 - LOCATION
      ?auto_11793 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11789 ?auto_11788 ) ) ( not ( = ?auto_11790 ?auto_11788 ) ) ( not ( = ?auto_11790 ?auto_11789 ) ) ( IN-TRUCK ?auto_11789 ?auto_11791 ) ( TRUCK-AT ?auto_11791 ?auto_11792 ) ( IN-CITY ?auto_11792 ?auto_11793 ) ( IN-CITY ?auto_11787 ?auto_11793 ) ( not ( = ?auto_11787 ?auto_11792 ) ) ( OBJ-AT ?auto_11790 ?auto_11787 ) ( OBJ-AT ?auto_11788 ?auto_11787 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11790 ?auto_11789 ?auto_11787 )
      ( DELIVER-3PKG-VERIFY ?auto_11788 ?auto_11789 ?auto_11790 ?auto_11787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11818 - OBJ
      ?auto_11819 - OBJ
      ?auto_11820 - OBJ
      ?auto_11817 - LOCATION
    )
    :vars
    (
      ?auto_11821 - TRUCK
      ?auto_11822 - LOCATION
      ?auto_11823 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11819 ?auto_11818 ) ) ( not ( = ?auto_11820 ?auto_11818 ) ) ( not ( = ?auto_11820 ?auto_11819 ) ) ( IN-TRUCK ?auto_11818 ?auto_11821 ) ( TRUCK-AT ?auto_11821 ?auto_11822 ) ( IN-CITY ?auto_11822 ?auto_11823 ) ( IN-CITY ?auto_11817 ?auto_11823 ) ( not ( = ?auto_11817 ?auto_11822 ) ) ( OBJ-AT ?auto_11819 ?auto_11817 ) ( OBJ-AT ?auto_11820 ?auto_11817 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11819 ?auto_11818 ?auto_11817 )
      ( DELIVER-3PKG-VERIFY ?auto_11818 ?auto_11819 ?auto_11820 ?auto_11817 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11832 - OBJ
      ?auto_11833 - OBJ
      ?auto_11834 - OBJ
      ?auto_11831 - LOCATION
    )
    :vars
    (
      ?auto_11835 - TRUCK
      ?auto_11836 - LOCATION
      ?auto_11837 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11833 ?auto_11832 ) ) ( not ( = ?auto_11834 ?auto_11832 ) ) ( not ( = ?auto_11834 ?auto_11833 ) ) ( IN-TRUCK ?auto_11832 ?auto_11835 ) ( TRUCK-AT ?auto_11835 ?auto_11836 ) ( IN-CITY ?auto_11836 ?auto_11837 ) ( IN-CITY ?auto_11831 ?auto_11837 ) ( not ( = ?auto_11831 ?auto_11836 ) ) ( OBJ-AT ?auto_11834 ?auto_11831 ) ( OBJ-AT ?auto_11833 ?auto_11831 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11834 ?auto_11832 ?auto_11831 )
      ( DELIVER-3PKG-VERIFY ?auto_11832 ?auto_11833 ?auto_11834 ?auto_11831 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11878 - OBJ
      ?auto_11877 - LOCATION
    )
    :vars
    (
      ?auto_11880 - OBJ
      ?auto_11879 - TRUCK
      ?auto_11881 - LOCATION
      ?auto_11882 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11878 ?auto_11880 ) ) ( TRUCK-AT ?auto_11879 ?auto_11881 ) ( IN-CITY ?auto_11881 ?auto_11882 ) ( IN-CITY ?auto_11877 ?auto_11882 ) ( not ( = ?auto_11877 ?auto_11881 ) ) ( OBJ-AT ?auto_11880 ?auto_11877 ) ( OBJ-AT ?auto_11878 ?auto_11881 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11878 ?auto_11879 ?auto_11881 )
      ( DELIVER-2PKG ?auto_11880 ?auto_11878 ?auto_11877 )
      ( DELIVER-1PKG-VERIFY ?auto_11878 ?auto_11877 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11884 - OBJ
      ?auto_11885 - OBJ
      ?auto_11883 - LOCATION
    )
    :vars
    (
      ?auto_11888 - TRUCK
      ?auto_11887 - LOCATION
      ?auto_11886 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11885 ?auto_11884 ) ) ( TRUCK-AT ?auto_11888 ?auto_11887 ) ( IN-CITY ?auto_11887 ?auto_11886 ) ( IN-CITY ?auto_11883 ?auto_11886 ) ( not ( = ?auto_11883 ?auto_11887 ) ) ( OBJ-AT ?auto_11884 ?auto_11883 ) ( OBJ-AT ?auto_11885 ?auto_11887 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11885 ?auto_11883 )
      ( DELIVER-2PKG-VERIFY ?auto_11884 ?auto_11885 ?auto_11883 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11890 - OBJ
      ?auto_11891 - OBJ
      ?auto_11889 - LOCATION
    )
    :vars
    (
      ?auto_11894 - OBJ
      ?auto_11893 - TRUCK
      ?auto_11892 - LOCATION
      ?auto_11895 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11891 ?auto_11890 ) ) ( not ( = ?auto_11891 ?auto_11894 ) ) ( TRUCK-AT ?auto_11893 ?auto_11892 ) ( IN-CITY ?auto_11892 ?auto_11895 ) ( IN-CITY ?auto_11889 ?auto_11895 ) ( not ( = ?auto_11889 ?auto_11892 ) ) ( OBJ-AT ?auto_11894 ?auto_11889 ) ( OBJ-AT ?auto_11891 ?auto_11892 ) ( OBJ-AT ?auto_11890 ?auto_11889 ) ( not ( = ?auto_11890 ?auto_11894 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11894 ?auto_11891 ?auto_11889 )
      ( DELIVER-2PKG-VERIFY ?auto_11890 ?auto_11891 ?auto_11889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11897 - OBJ
      ?auto_11898 - OBJ
      ?auto_11896 - LOCATION
    )
    :vars
    (
      ?auto_11900 - TRUCK
      ?auto_11899 - LOCATION
      ?auto_11901 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11898 ?auto_11897 ) ) ( TRUCK-AT ?auto_11900 ?auto_11899 ) ( IN-CITY ?auto_11899 ?auto_11901 ) ( IN-CITY ?auto_11896 ?auto_11901 ) ( not ( = ?auto_11896 ?auto_11899 ) ) ( OBJ-AT ?auto_11898 ?auto_11896 ) ( OBJ-AT ?auto_11897 ?auto_11899 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11898 ?auto_11897 ?auto_11896 )
      ( DELIVER-2PKG-VERIFY ?auto_11897 ?auto_11898 ?auto_11896 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11903 - OBJ
      ?auto_11904 - OBJ
      ?auto_11902 - LOCATION
    )
    :vars
    (
      ?auto_11907 - OBJ
      ?auto_11906 - TRUCK
      ?auto_11905 - LOCATION
      ?auto_11908 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11904 ?auto_11903 ) ) ( not ( = ?auto_11903 ?auto_11907 ) ) ( TRUCK-AT ?auto_11906 ?auto_11905 ) ( IN-CITY ?auto_11905 ?auto_11908 ) ( IN-CITY ?auto_11902 ?auto_11908 ) ( not ( = ?auto_11902 ?auto_11905 ) ) ( OBJ-AT ?auto_11907 ?auto_11902 ) ( OBJ-AT ?auto_11903 ?auto_11905 ) ( OBJ-AT ?auto_11904 ?auto_11902 ) ( not ( = ?auto_11904 ?auto_11907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11907 ?auto_11903 ?auto_11902 )
      ( DELIVER-2PKG-VERIFY ?auto_11903 ?auto_11904 ?auto_11902 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11924 - OBJ
      ?auto_11925 - OBJ
      ?auto_11926 - OBJ
      ?auto_11923 - LOCATION
    )
    :vars
    (
      ?auto_11928 - TRUCK
      ?auto_11927 - LOCATION
      ?auto_11929 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11925 ?auto_11924 ) ) ( not ( = ?auto_11926 ?auto_11924 ) ) ( not ( = ?auto_11926 ?auto_11925 ) ) ( TRUCK-AT ?auto_11928 ?auto_11927 ) ( IN-CITY ?auto_11927 ?auto_11929 ) ( IN-CITY ?auto_11923 ?auto_11929 ) ( not ( = ?auto_11923 ?auto_11927 ) ) ( OBJ-AT ?auto_11924 ?auto_11923 ) ( OBJ-AT ?auto_11926 ?auto_11927 ) ( OBJ-AT ?auto_11925 ?auto_11923 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11924 ?auto_11926 ?auto_11923 )
      ( DELIVER-3PKG-VERIFY ?auto_11924 ?auto_11925 ?auto_11926 ?auto_11923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11938 - OBJ
      ?auto_11939 - OBJ
      ?auto_11940 - OBJ
      ?auto_11937 - LOCATION
    )
    :vars
    (
      ?auto_11942 - TRUCK
      ?auto_11941 - LOCATION
      ?auto_11943 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11939 ?auto_11938 ) ) ( not ( = ?auto_11940 ?auto_11938 ) ) ( not ( = ?auto_11940 ?auto_11939 ) ) ( TRUCK-AT ?auto_11942 ?auto_11941 ) ( IN-CITY ?auto_11941 ?auto_11943 ) ( IN-CITY ?auto_11937 ?auto_11943 ) ( not ( = ?auto_11937 ?auto_11941 ) ) ( OBJ-AT ?auto_11938 ?auto_11937 ) ( OBJ-AT ?auto_11939 ?auto_11941 ) ( OBJ-AT ?auto_11940 ?auto_11937 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11938 ?auto_11939 ?auto_11937 )
      ( DELIVER-3PKG-VERIFY ?auto_11938 ?auto_11939 ?auto_11940 ?auto_11937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11952 - OBJ
      ?auto_11953 - OBJ
      ?auto_11954 - OBJ
      ?auto_11951 - LOCATION
    )
    :vars
    (
      ?auto_11956 - TRUCK
      ?auto_11955 - LOCATION
      ?auto_11957 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11953 ?auto_11952 ) ) ( not ( = ?auto_11954 ?auto_11952 ) ) ( not ( = ?auto_11954 ?auto_11953 ) ) ( TRUCK-AT ?auto_11956 ?auto_11955 ) ( IN-CITY ?auto_11955 ?auto_11957 ) ( IN-CITY ?auto_11951 ?auto_11957 ) ( not ( = ?auto_11951 ?auto_11955 ) ) ( OBJ-AT ?auto_11953 ?auto_11951 ) ( OBJ-AT ?auto_11954 ?auto_11955 ) ( OBJ-AT ?auto_11952 ?auto_11951 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11953 ?auto_11954 ?auto_11951 )
      ( DELIVER-3PKG-VERIFY ?auto_11952 ?auto_11953 ?auto_11954 ?auto_11951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11967 - OBJ
      ?auto_11968 - OBJ
      ?auto_11969 - OBJ
      ?auto_11966 - LOCATION
    )
    :vars
    (
      ?auto_11971 - TRUCK
      ?auto_11970 - LOCATION
      ?auto_11972 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11968 ?auto_11967 ) ) ( not ( = ?auto_11969 ?auto_11967 ) ) ( not ( = ?auto_11969 ?auto_11968 ) ) ( TRUCK-AT ?auto_11971 ?auto_11970 ) ( IN-CITY ?auto_11970 ?auto_11972 ) ( IN-CITY ?auto_11966 ?auto_11972 ) ( not ( = ?auto_11966 ?auto_11970 ) ) ( OBJ-AT ?auto_11969 ?auto_11966 ) ( OBJ-AT ?auto_11968 ?auto_11970 ) ( OBJ-AT ?auto_11967 ?auto_11966 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11969 ?auto_11968 ?auto_11966 )
      ( DELIVER-3PKG-VERIFY ?auto_11967 ?auto_11968 ?auto_11969 ?auto_11966 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11997 - OBJ
      ?auto_11998 - OBJ
      ?auto_11999 - OBJ
      ?auto_11996 - LOCATION
    )
    :vars
    (
      ?auto_12001 - TRUCK
      ?auto_12000 - LOCATION
      ?auto_12002 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_11998 ?auto_11997 ) ) ( not ( = ?auto_11999 ?auto_11997 ) ) ( not ( = ?auto_11999 ?auto_11998 ) ) ( TRUCK-AT ?auto_12001 ?auto_12000 ) ( IN-CITY ?auto_12000 ?auto_12002 ) ( IN-CITY ?auto_11996 ?auto_12002 ) ( not ( = ?auto_11996 ?auto_12000 ) ) ( OBJ-AT ?auto_11998 ?auto_11996 ) ( OBJ-AT ?auto_11997 ?auto_12000 ) ( OBJ-AT ?auto_11999 ?auto_11996 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11998 ?auto_11997 ?auto_11996 )
      ( DELIVER-3PKG-VERIFY ?auto_11997 ?auto_11998 ?auto_11999 ?auto_11996 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12011 - OBJ
      ?auto_12012 - OBJ
      ?auto_12013 - OBJ
      ?auto_12010 - LOCATION
    )
    :vars
    (
      ?auto_12015 - TRUCK
      ?auto_12014 - LOCATION
      ?auto_12016 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_12012 ?auto_12011 ) ) ( not ( = ?auto_12013 ?auto_12011 ) ) ( not ( = ?auto_12013 ?auto_12012 ) ) ( TRUCK-AT ?auto_12015 ?auto_12014 ) ( IN-CITY ?auto_12014 ?auto_12016 ) ( IN-CITY ?auto_12010 ?auto_12016 ) ( not ( = ?auto_12010 ?auto_12014 ) ) ( OBJ-AT ?auto_12013 ?auto_12010 ) ( OBJ-AT ?auto_12011 ?auto_12014 ) ( OBJ-AT ?auto_12012 ?auto_12010 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12013 ?auto_12011 ?auto_12010 )
      ( DELIVER-3PKG-VERIFY ?auto_12011 ?auto_12012 ?auto_12013 ?auto_12010 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12057 - OBJ
      ?auto_12056 - LOCATION
    )
    :vars
    (
      ?auto_12060 - OBJ
      ?auto_12058 - LOCATION
      ?auto_12061 - CITY
      ?auto_12059 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12057 ?auto_12060 ) ) ( IN-CITY ?auto_12058 ?auto_12061 ) ( IN-CITY ?auto_12056 ?auto_12061 ) ( not ( = ?auto_12056 ?auto_12058 ) ) ( OBJ-AT ?auto_12060 ?auto_12056 ) ( OBJ-AT ?auto_12057 ?auto_12058 ) ( TRUCK-AT ?auto_12059 ?auto_12056 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12059 ?auto_12056 ?auto_12058 ?auto_12061 )
      ( DELIVER-2PKG ?auto_12060 ?auto_12057 ?auto_12056 )
      ( DELIVER-1PKG-VERIFY ?auto_12057 ?auto_12056 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12063 - OBJ
      ?auto_12064 - OBJ
      ?auto_12062 - LOCATION
    )
    :vars
    (
      ?auto_12067 - LOCATION
      ?auto_12065 - CITY
      ?auto_12066 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12064 ?auto_12063 ) ) ( IN-CITY ?auto_12067 ?auto_12065 ) ( IN-CITY ?auto_12062 ?auto_12065 ) ( not ( = ?auto_12062 ?auto_12067 ) ) ( OBJ-AT ?auto_12063 ?auto_12062 ) ( OBJ-AT ?auto_12064 ?auto_12067 ) ( TRUCK-AT ?auto_12066 ?auto_12062 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12064 ?auto_12062 )
      ( DELIVER-2PKG-VERIFY ?auto_12063 ?auto_12064 ?auto_12062 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12069 - OBJ
      ?auto_12070 - OBJ
      ?auto_12068 - LOCATION
    )
    :vars
    (
      ?auto_12072 - OBJ
      ?auto_12071 - LOCATION
      ?auto_12073 - CITY
      ?auto_12074 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12070 ?auto_12069 ) ) ( not ( = ?auto_12070 ?auto_12072 ) ) ( IN-CITY ?auto_12071 ?auto_12073 ) ( IN-CITY ?auto_12068 ?auto_12073 ) ( not ( = ?auto_12068 ?auto_12071 ) ) ( OBJ-AT ?auto_12072 ?auto_12068 ) ( OBJ-AT ?auto_12070 ?auto_12071 ) ( TRUCK-AT ?auto_12074 ?auto_12068 ) ( OBJ-AT ?auto_12069 ?auto_12068 ) ( not ( = ?auto_12069 ?auto_12072 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12072 ?auto_12070 ?auto_12068 )
      ( DELIVER-2PKG-VERIFY ?auto_12069 ?auto_12070 ?auto_12068 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12076 - OBJ
      ?auto_12077 - OBJ
      ?auto_12075 - LOCATION
    )
    :vars
    (
      ?auto_12078 - LOCATION
      ?auto_12079 - CITY
      ?auto_12080 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12077 ?auto_12076 ) ) ( IN-CITY ?auto_12078 ?auto_12079 ) ( IN-CITY ?auto_12075 ?auto_12079 ) ( not ( = ?auto_12075 ?auto_12078 ) ) ( OBJ-AT ?auto_12077 ?auto_12075 ) ( OBJ-AT ?auto_12076 ?auto_12078 ) ( TRUCK-AT ?auto_12080 ?auto_12075 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12077 ?auto_12076 ?auto_12075 )
      ( DELIVER-2PKG-VERIFY ?auto_12076 ?auto_12077 ?auto_12075 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12082 - OBJ
      ?auto_12083 - OBJ
      ?auto_12081 - LOCATION
    )
    :vars
    (
      ?auto_12085 - OBJ
      ?auto_12084 - LOCATION
      ?auto_12086 - CITY
      ?auto_12087 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12083 ?auto_12082 ) ) ( not ( = ?auto_12082 ?auto_12085 ) ) ( IN-CITY ?auto_12084 ?auto_12086 ) ( IN-CITY ?auto_12081 ?auto_12086 ) ( not ( = ?auto_12081 ?auto_12084 ) ) ( OBJ-AT ?auto_12085 ?auto_12081 ) ( OBJ-AT ?auto_12082 ?auto_12084 ) ( TRUCK-AT ?auto_12087 ?auto_12081 ) ( OBJ-AT ?auto_12083 ?auto_12081 ) ( not ( = ?auto_12083 ?auto_12085 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12085 ?auto_12082 ?auto_12081 )
      ( DELIVER-2PKG-VERIFY ?auto_12082 ?auto_12083 ?auto_12081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12103 - OBJ
      ?auto_12104 - OBJ
      ?auto_12105 - OBJ
      ?auto_12102 - LOCATION
    )
    :vars
    (
      ?auto_12106 - LOCATION
      ?auto_12107 - CITY
      ?auto_12108 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12104 ?auto_12103 ) ) ( not ( = ?auto_12105 ?auto_12103 ) ) ( not ( = ?auto_12105 ?auto_12104 ) ) ( IN-CITY ?auto_12106 ?auto_12107 ) ( IN-CITY ?auto_12102 ?auto_12107 ) ( not ( = ?auto_12102 ?auto_12106 ) ) ( OBJ-AT ?auto_12103 ?auto_12102 ) ( OBJ-AT ?auto_12105 ?auto_12106 ) ( TRUCK-AT ?auto_12108 ?auto_12102 ) ( OBJ-AT ?auto_12104 ?auto_12102 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12103 ?auto_12105 ?auto_12102 )
      ( DELIVER-3PKG-VERIFY ?auto_12103 ?auto_12104 ?auto_12105 ?auto_12102 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12117 - OBJ
      ?auto_12118 - OBJ
      ?auto_12119 - OBJ
      ?auto_12116 - LOCATION
    )
    :vars
    (
      ?auto_12120 - LOCATION
      ?auto_12121 - CITY
      ?auto_12122 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12118 ?auto_12117 ) ) ( not ( = ?auto_12119 ?auto_12117 ) ) ( not ( = ?auto_12119 ?auto_12118 ) ) ( IN-CITY ?auto_12120 ?auto_12121 ) ( IN-CITY ?auto_12116 ?auto_12121 ) ( not ( = ?auto_12116 ?auto_12120 ) ) ( OBJ-AT ?auto_12117 ?auto_12116 ) ( OBJ-AT ?auto_12118 ?auto_12120 ) ( TRUCK-AT ?auto_12122 ?auto_12116 ) ( OBJ-AT ?auto_12119 ?auto_12116 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12117 ?auto_12118 ?auto_12116 )
      ( DELIVER-3PKG-VERIFY ?auto_12117 ?auto_12118 ?auto_12119 ?auto_12116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12131 - OBJ
      ?auto_12132 - OBJ
      ?auto_12133 - OBJ
      ?auto_12130 - LOCATION
    )
    :vars
    (
      ?auto_12134 - LOCATION
      ?auto_12135 - CITY
      ?auto_12136 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12132 ?auto_12131 ) ) ( not ( = ?auto_12133 ?auto_12131 ) ) ( not ( = ?auto_12133 ?auto_12132 ) ) ( IN-CITY ?auto_12134 ?auto_12135 ) ( IN-CITY ?auto_12130 ?auto_12135 ) ( not ( = ?auto_12130 ?auto_12134 ) ) ( OBJ-AT ?auto_12132 ?auto_12130 ) ( OBJ-AT ?auto_12133 ?auto_12134 ) ( TRUCK-AT ?auto_12136 ?auto_12130 ) ( OBJ-AT ?auto_12131 ?auto_12130 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12132 ?auto_12133 ?auto_12130 )
      ( DELIVER-3PKG-VERIFY ?auto_12131 ?auto_12132 ?auto_12133 ?auto_12130 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12146 - OBJ
      ?auto_12147 - OBJ
      ?auto_12148 - OBJ
      ?auto_12145 - LOCATION
    )
    :vars
    (
      ?auto_12149 - LOCATION
      ?auto_12150 - CITY
      ?auto_12151 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12147 ?auto_12146 ) ) ( not ( = ?auto_12148 ?auto_12146 ) ) ( not ( = ?auto_12148 ?auto_12147 ) ) ( IN-CITY ?auto_12149 ?auto_12150 ) ( IN-CITY ?auto_12145 ?auto_12150 ) ( not ( = ?auto_12145 ?auto_12149 ) ) ( OBJ-AT ?auto_12148 ?auto_12145 ) ( OBJ-AT ?auto_12147 ?auto_12149 ) ( TRUCK-AT ?auto_12151 ?auto_12145 ) ( OBJ-AT ?auto_12146 ?auto_12145 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12148 ?auto_12147 ?auto_12145 )
      ( DELIVER-3PKG-VERIFY ?auto_12146 ?auto_12147 ?auto_12148 ?auto_12145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12176 - OBJ
      ?auto_12177 - OBJ
      ?auto_12178 - OBJ
      ?auto_12175 - LOCATION
    )
    :vars
    (
      ?auto_12179 - LOCATION
      ?auto_12180 - CITY
      ?auto_12181 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12177 ?auto_12176 ) ) ( not ( = ?auto_12178 ?auto_12176 ) ) ( not ( = ?auto_12178 ?auto_12177 ) ) ( IN-CITY ?auto_12179 ?auto_12180 ) ( IN-CITY ?auto_12175 ?auto_12180 ) ( not ( = ?auto_12175 ?auto_12179 ) ) ( OBJ-AT ?auto_12177 ?auto_12175 ) ( OBJ-AT ?auto_12176 ?auto_12179 ) ( TRUCK-AT ?auto_12181 ?auto_12175 ) ( OBJ-AT ?auto_12178 ?auto_12175 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12177 ?auto_12176 ?auto_12175 )
      ( DELIVER-3PKG-VERIFY ?auto_12176 ?auto_12177 ?auto_12178 ?auto_12175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12190 - OBJ
      ?auto_12191 - OBJ
      ?auto_12192 - OBJ
      ?auto_12189 - LOCATION
    )
    :vars
    (
      ?auto_12193 - LOCATION
      ?auto_12194 - CITY
      ?auto_12195 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12191 ?auto_12190 ) ) ( not ( = ?auto_12192 ?auto_12190 ) ) ( not ( = ?auto_12192 ?auto_12191 ) ) ( IN-CITY ?auto_12193 ?auto_12194 ) ( IN-CITY ?auto_12189 ?auto_12194 ) ( not ( = ?auto_12189 ?auto_12193 ) ) ( OBJ-AT ?auto_12192 ?auto_12189 ) ( OBJ-AT ?auto_12190 ?auto_12193 ) ( TRUCK-AT ?auto_12195 ?auto_12189 ) ( OBJ-AT ?auto_12191 ?auto_12189 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12192 ?auto_12190 ?auto_12189 )
      ( DELIVER-3PKG-VERIFY ?auto_12190 ?auto_12191 ?auto_12192 ?auto_12189 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12236 - OBJ
      ?auto_12235 - LOCATION
    )
    :vars
    (
      ?auto_12238 - OBJ
      ?auto_12237 - LOCATION
      ?auto_12239 - CITY
      ?auto_12240 - TRUCK
      ?auto_12241 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_12236 ?auto_12238 ) ) ( IN-CITY ?auto_12237 ?auto_12239 ) ( IN-CITY ?auto_12235 ?auto_12239 ) ( not ( = ?auto_12235 ?auto_12237 ) ) ( OBJ-AT ?auto_12238 ?auto_12235 ) ( OBJ-AT ?auto_12236 ?auto_12237 ) ( TRUCK-AT ?auto_12240 ?auto_12235 ) ( not ( = ?auto_12241 ?auto_12238 ) ) ( IN-TRUCK ?auto_12241 ?auto_12240 ) ( not ( = ?auto_12236 ?auto_12241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12238 ?auto_12241 ?auto_12235 )
      ( DELIVER-2PKG ?auto_12238 ?auto_12236 ?auto_12235 )
      ( DELIVER-1PKG-VERIFY ?auto_12236 ?auto_12235 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12243 - OBJ
      ?auto_12244 - OBJ
      ?auto_12242 - LOCATION
    )
    :vars
    (
      ?auto_12247 - LOCATION
      ?auto_12248 - CITY
      ?auto_12245 - TRUCK
      ?auto_12246 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_12244 ?auto_12243 ) ) ( IN-CITY ?auto_12247 ?auto_12248 ) ( IN-CITY ?auto_12242 ?auto_12248 ) ( not ( = ?auto_12242 ?auto_12247 ) ) ( OBJ-AT ?auto_12243 ?auto_12242 ) ( OBJ-AT ?auto_12244 ?auto_12247 ) ( TRUCK-AT ?auto_12245 ?auto_12242 ) ( not ( = ?auto_12246 ?auto_12243 ) ) ( IN-TRUCK ?auto_12246 ?auto_12245 ) ( not ( = ?auto_12244 ?auto_12246 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12244 ?auto_12242 )
      ( DELIVER-2PKG-VERIFY ?auto_12243 ?auto_12244 ?auto_12242 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12250 - OBJ
      ?auto_12251 - OBJ
      ?auto_12249 - LOCATION
    )
    :vars
    (
      ?auto_12252 - OBJ
      ?auto_12254 - LOCATION
      ?auto_12253 - CITY
      ?auto_12255 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12251 ?auto_12250 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( IN-CITY ?auto_12254 ?auto_12253 ) ( IN-CITY ?auto_12249 ?auto_12253 ) ( not ( = ?auto_12249 ?auto_12254 ) ) ( OBJ-AT ?auto_12252 ?auto_12249 ) ( OBJ-AT ?auto_12251 ?auto_12254 ) ( TRUCK-AT ?auto_12255 ?auto_12249 ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( IN-TRUCK ?auto_12250 ?auto_12255 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12252 ?auto_12251 ?auto_12249 )
      ( DELIVER-2PKG-VERIFY ?auto_12250 ?auto_12251 ?auto_12249 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12257 - OBJ
      ?auto_12258 - OBJ
      ?auto_12256 - LOCATION
    )
    :vars
    (
      ?auto_12260 - LOCATION
      ?auto_12259 - CITY
      ?auto_12262 - TRUCK
      ?auto_12261 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_12258 ?auto_12257 ) ) ( IN-CITY ?auto_12260 ?auto_12259 ) ( IN-CITY ?auto_12256 ?auto_12259 ) ( not ( = ?auto_12256 ?auto_12260 ) ) ( OBJ-AT ?auto_12258 ?auto_12256 ) ( OBJ-AT ?auto_12257 ?auto_12260 ) ( TRUCK-AT ?auto_12262 ?auto_12256 ) ( not ( = ?auto_12261 ?auto_12258 ) ) ( IN-TRUCK ?auto_12261 ?auto_12262 ) ( not ( = ?auto_12257 ?auto_12261 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12258 ?auto_12257 ?auto_12256 )
      ( DELIVER-2PKG-VERIFY ?auto_12257 ?auto_12258 ?auto_12256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12264 - OBJ
      ?auto_12265 - OBJ
      ?auto_12263 - LOCATION
    )
    :vars
    (
      ?auto_12266 - OBJ
      ?auto_12268 - LOCATION
      ?auto_12267 - CITY
      ?auto_12269 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12265 ?auto_12264 ) ) ( not ( = ?auto_12264 ?auto_12266 ) ) ( IN-CITY ?auto_12268 ?auto_12267 ) ( IN-CITY ?auto_12263 ?auto_12267 ) ( not ( = ?auto_12263 ?auto_12268 ) ) ( OBJ-AT ?auto_12266 ?auto_12263 ) ( OBJ-AT ?auto_12264 ?auto_12268 ) ( TRUCK-AT ?auto_12269 ?auto_12263 ) ( not ( = ?auto_12265 ?auto_12266 ) ) ( IN-TRUCK ?auto_12265 ?auto_12269 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12266 ?auto_12264 ?auto_12263 )
      ( DELIVER-2PKG-VERIFY ?auto_12264 ?auto_12265 ?auto_12263 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12287 - OBJ
      ?auto_12288 - OBJ
      ?auto_12289 - OBJ
      ?auto_12286 - LOCATION
    )
    :vars
    (
      ?auto_12291 - LOCATION
      ?auto_12290 - CITY
      ?auto_12292 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12288 ?auto_12287 ) ) ( not ( = ?auto_12289 ?auto_12287 ) ) ( not ( = ?auto_12289 ?auto_12288 ) ) ( IN-CITY ?auto_12291 ?auto_12290 ) ( IN-CITY ?auto_12286 ?auto_12290 ) ( not ( = ?auto_12286 ?auto_12291 ) ) ( OBJ-AT ?auto_12287 ?auto_12286 ) ( OBJ-AT ?auto_12289 ?auto_12291 ) ( TRUCK-AT ?auto_12292 ?auto_12286 ) ( IN-TRUCK ?auto_12288 ?auto_12292 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12287 ?auto_12289 ?auto_12286 )
      ( DELIVER-3PKG-VERIFY ?auto_12287 ?auto_12288 ?auto_12289 ?auto_12286 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12302 - OBJ
      ?auto_12303 - OBJ
      ?auto_12304 - OBJ
      ?auto_12301 - LOCATION
    )
    :vars
    (
      ?auto_12306 - LOCATION
      ?auto_12305 - CITY
      ?auto_12307 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12303 ?auto_12302 ) ) ( not ( = ?auto_12304 ?auto_12302 ) ) ( not ( = ?auto_12304 ?auto_12303 ) ) ( IN-CITY ?auto_12306 ?auto_12305 ) ( IN-CITY ?auto_12301 ?auto_12305 ) ( not ( = ?auto_12301 ?auto_12306 ) ) ( OBJ-AT ?auto_12302 ?auto_12301 ) ( OBJ-AT ?auto_12303 ?auto_12306 ) ( TRUCK-AT ?auto_12307 ?auto_12301 ) ( IN-TRUCK ?auto_12304 ?auto_12307 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12302 ?auto_12303 ?auto_12301 )
      ( DELIVER-3PKG-VERIFY ?auto_12302 ?auto_12303 ?auto_12304 ?auto_12301 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12317 - OBJ
      ?auto_12318 - OBJ
      ?auto_12319 - OBJ
      ?auto_12316 - LOCATION
    )
    :vars
    (
      ?auto_12321 - LOCATION
      ?auto_12320 - CITY
      ?auto_12322 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12318 ?auto_12317 ) ) ( not ( = ?auto_12319 ?auto_12317 ) ) ( not ( = ?auto_12319 ?auto_12318 ) ) ( IN-CITY ?auto_12321 ?auto_12320 ) ( IN-CITY ?auto_12316 ?auto_12320 ) ( not ( = ?auto_12316 ?auto_12321 ) ) ( OBJ-AT ?auto_12318 ?auto_12316 ) ( OBJ-AT ?auto_12319 ?auto_12321 ) ( TRUCK-AT ?auto_12322 ?auto_12316 ) ( IN-TRUCK ?auto_12317 ?auto_12322 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12318 ?auto_12319 ?auto_12316 )
      ( DELIVER-3PKG-VERIFY ?auto_12317 ?auto_12318 ?auto_12319 ?auto_12316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12332 - OBJ
      ?auto_12333 - OBJ
      ?auto_12334 - OBJ
      ?auto_12331 - LOCATION
    )
    :vars
    (
      ?auto_12336 - LOCATION
      ?auto_12335 - CITY
      ?auto_12337 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12333 ?auto_12332 ) ) ( not ( = ?auto_12334 ?auto_12332 ) ) ( not ( = ?auto_12334 ?auto_12333 ) ) ( IN-CITY ?auto_12336 ?auto_12335 ) ( IN-CITY ?auto_12331 ?auto_12335 ) ( not ( = ?auto_12331 ?auto_12336 ) ) ( OBJ-AT ?auto_12334 ?auto_12331 ) ( OBJ-AT ?auto_12333 ?auto_12336 ) ( TRUCK-AT ?auto_12337 ?auto_12331 ) ( IN-TRUCK ?auto_12332 ?auto_12337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12334 ?auto_12333 ?auto_12331 )
      ( DELIVER-3PKG-VERIFY ?auto_12332 ?auto_12333 ?auto_12334 ?auto_12331 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12363 - OBJ
      ?auto_12364 - OBJ
      ?auto_12365 - OBJ
      ?auto_12362 - LOCATION
    )
    :vars
    (
      ?auto_12367 - LOCATION
      ?auto_12366 - CITY
      ?auto_12368 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12364 ?auto_12363 ) ) ( not ( = ?auto_12365 ?auto_12363 ) ) ( not ( = ?auto_12365 ?auto_12364 ) ) ( IN-CITY ?auto_12367 ?auto_12366 ) ( IN-CITY ?auto_12362 ?auto_12366 ) ( not ( = ?auto_12362 ?auto_12367 ) ) ( OBJ-AT ?auto_12364 ?auto_12362 ) ( OBJ-AT ?auto_12363 ?auto_12367 ) ( TRUCK-AT ?auto_12368 ?auto_12362 ) ( IN-TRUCK ?auto_12365 ?auto_12368 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12364 ?auto_12363 ?auto_12362 )
      ( DELIVER-3PKG-VERIFY ?auto_12363 ?auto_12364 ?auto_12365 ?auto_12362 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12378 - OBJ
      ?auto_12379 - OBJ
      ?auto_12380 - OBJ
      ?auto_12377 - LOCATION
    )
    :vars
    (
      ?auto_12382 - LOCATION
      ?auto_12381 - CITY
      ?auto_12383 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12379 ?auto_12378 ) ) ( not ( = ?auto_12380 ?auto_12378 ) ) ( not ( = ?auto_12380 ?auto_12379 ) ) ( IN-CITY ?auto_12382 ?auto_12381 ) ( IN-CITY ?auto_12377 ?auto_12381 ) ( not ( = ?auto_12377 ?auto_12382 ) ) ( OBJ-AT ?auto_12380 ?auto_12377 ) ( OBJ-AT ?auto_12378 ?auto_12382 ) ( TRUCK-AT ?auto_12383 ?auto_12377 ) ( IN-TRUCK ?auto_12379 ?auto_12383 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12380 ?auto_12378 ?auto_12377 )
      ( DELIVER-3PKG-VERIFY ?auto_12378 ?auto_12379 ?auto_12380 ?auto_12377 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12426 - OBJ
      ?auto_12425 - LOCATION
    )
    :vars
    (
      ?auto_12427 - OBJ
      ?auto_12429 - LOCATION
      ?auto_12428 - CITY
      ?auto_12430 - OBJ
      ?auto_12431 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12426 ?auto_12427 ) ) ( IN-CITY ?auto_12429 ?auto_12428 ) ( IN-CITY ?auto_12425 ?auto_12428 ) ( not ( = ?auto_12425 ?auto_12429 ) ) ( OBJ-AT ?auto_12427 ?auto_12425 ) ( OBJ-AT ?auto_12426 ?auto_12429 ) ( not ( = ?auto_12430 ?auto_12427 ) ) ( IN-TRUCK ?auto_12430 ?auto_12431 ) ( not ( = ?auto_12426 ?auto_12430 ) ) ( TRUCK-AT ?auto_12431 ?auto_12429 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12431 ?auto_12429 ?auto_12425 ?auto_12428 )
      ( DELIVER-2PKG ?auto_12427 ?auto_12426 ?auto_12425 )
      ( DELIVER-1PKG-VERIFY ?auto_12426 ?auto_12425 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12433 - OBJ
      ?auto_12434 - OBJ
      ?auto_12432 - LOCATION
    )
    :vars
    (
      ?auto_12438 - LOCATION
      ?auto_12435 - CITY
      ?auto_12437 - OBJ
      ?auto_12436 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12434 ?auto_12433 ) ) ( IN-CITY ?auto_12438 ?auto_12435 ) ( IN-CITY ?auto_12432 ?auto_12435 ) ( not ( = ?auto_12432 ?auto_12438 ) ) ( OBJ-AT ?auto_12433 ?auto_12432 ) ( OBJ-AT ?auto_12434 ?auto_12438 ) ( not ( = ?auto_12437 ?auto_12433 ) ) ( IN-TRUCK ?auto_12437 ?auto_12436 ) ( not ( = ?auto_12434 ?auto_12437 ) ) ( TRUCK-AT ?auto_12436 ?auto_12438 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12434 ?auto_12432 )
      ( DELIVER-2PKG-VERIFY ?auto_12433 ?auto_12434 ?auto_12432 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12440 - OBJ
      ?auto_12441 - OBJ
      ?auto_12439 - LOCATION
    )
    :vars
    (
      ?auto_12443 - OBJ
      ?auto_12442 - LOCATION
      ?auto_12444 - CITY
      ?auto_12445 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12441 ?auto_12440 ) ) ( not ( = ?auto_12441 ?auto_12443 ) ) ( IN-CITY ?auto_12442 ?auto_12444 ) ( IN-CITY ?auto_12439 ?auto_12444 ) ( not ( = ?auto_12439 ?auto_12442 ) ) ( OBJ-AT ?auto_12443 ?auto_12439 ) ( OBJ-AT ?auto_12441 ?auto_12442 ) ( not ( = ?auto_12440 ?auto_12443 ) ) ( IN-TRUCK ?auto_12440 ?auto_12445 ) ( TRUCK-AT ?auto_12445 ?auto_12442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12443 ?auto_12441 ?auto_12439 )
      ( DELIVER-2PKG-VERIFY ?auto_12440 ?auto_12441 ?auto_12439 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12447 - OBJ
      ?auto_12448 - OBJ
      ?auto_12446 - LOCATION
    )
    :vars
    (
      ?auto_12449 - LOCATION
      ?auto_12450 - CITY
      ?auto_12452 - OBJ
      ?auto_12451 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12448 ?auto_12447 ) ) ( IN-CITY ?auto_12449 ?auto_12450 ) ( IN-CITY ?auto_12446 ?auto_12450 ) ( not ( = ?auto_12446 ?auto_12449 ) ) ( OBJ-AT ?auto_12448 ?auto_12446 ) ( OBJ-AT ?auto_12447 ?auto_12449 ) ( not ( = ?auto_12452 ?auto_12448 ) ) ( IN-TRUCK ?auto_12452 ?auto_12451 ) ( not ( = ?auto_12447 ?auto_12452 ) ) ( TRUCK-AT ?auto_12451 ?auto_12449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12448 ?auto_12447 ?auto_12446 )
      ( DELIVER-2PKG-VERIFY ?auto_12447 ?auto_12448 ?auto_12446 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12454 - OBJ
      ?auto_12455 - OBJ
      ?auto_12453 - LOCATION
    )
    :vars
    (
      ?auto_12457 - OBJ
      ?auto_12456 - LOCATION
      ?auto_12458 - CITY
      ?auto_12459 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12455 ?auto_12454 ) ) ( not ( = ?auto_12454 ?auto_12457 ) ) ( IN-CITY ?auto_12456 ?auto_12458 ) ( IN-CITY ?auto_12453 ?auto_12458 ) ( not ( = ?auto_12453 ?auto_12456 ) ) ( OBJ-AT ?auto_12457 ?auto_12453 ) ( OBJ-AT ?auto_12454 ?auto_12456 ) ( not ( = ?auto_12455 ?auto_12457 ) ) ( IN-TRUCK ?auto_12455 ?auto_12459 ) ( TRUCK-AT ?auto_12459 ?auto_12456 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12457 ?auto_12454 ?auto_12453 )
      ( DELIVER-2PKG-VERIFY ?auto_12454 ?auto_12455 ?auto_12453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12477 - OBJ
      ?auto_12478 - OBJ
      ?auto_12479 - OBJ
      ?auto_12476 - LOCATION
    )
    :vars
    (
      ?auto_12480 - LOCATION
      ?auto_12481 - CITY
      ?auto_12482 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12478 ?auto_12477 ) ) ( not ( = ?auto_12479 ?auto_12477 ) ) ( not ( = ?auto_12479 ?auto_12478 ) ) ( IN-CITY ?auto_12480 ?auto_12481 ) ( IN-CITY ?auto_12476 ?auto_12481 ) ( not ( = ?auto_12476 ?auto_12480 ) ) ( OBJ-AT ?auto_12477 ?auto_12476 ) ( OBJ-AT ?auto_12479 ?auto_12480 ) ( IN-TRUCK ?auto_12478 ?auto_12482 ) ( TRUCK-AT ?auto_12482 ?auto_12480 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12477 ?auto_12479 ?auto_12476 )
      ( DELIVER-3PKG-VERIFY ?auto_12477 ?auto_12478 ?auto_12479 ?auto_12476 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12492 - OBJ
      ?auto_12493 - OBJ
      ?auto_12494 - OBJ
      ?auto_12491 - LOCATION
    )
    :vars
    (
      ?auto_12495 - LOCATION
      ?auto_12496 - CITY
      ?auto_12497 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12493 ?auto_12492 ) ) ( not ( = ?auto_12494 ?auto_12492 ) ) ( not ( = ?auto_12494 ?auto_12493 ) ) ( IN-CITY ?auto_12495 ?auto_12496 ) ( IN-CITY ?auto_12491 ?auto_12496 ) ( not ( = ?auto_12491 ?auto_12495 ) ) ( OBJ-AT ?auto_12492 ?auto_12491 ) ( OBJ-AT ?auto_12493 ?auto_12495 ) ( IN-TRUCK ?auto_12494 ?auto_12497 ) ( TRUCK-AT ?auto_12497 ?auto_12495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12492 ?auto_12493 ?auto_12491 )
      ( DELIVER-3PKG-VERIFY ?auto_12492 ?auto_12493 ?auto_12494 ?auto_12491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12507 - OBJ
      ?auto_12508 - OBJ
      ?auto_12509 - OBJ
      ?auto_12506 - LOCATION
    )
    :vars
    (
      ?auto_12510 - LOCATION
      ?auto_12511 - CITY
      ?auto_12512 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12508 ?auto_12507 ) ) ( not ( = ?auto_12509 ?auto_12507 ) ) ( not ( = ?auto_12509 ?auto_12508 ) ) ( IN-CITY ?auto_12510 ?auto_12511 ) ( IN-CITY ?auto_12506 ?auto_12511 ) ( not ( = ?auto_12506 ?auto_12510 ) ) ( OBJ-AT ?auto_12508 ?auto_12506 ) ( OBJ-AT ?auto_12509 ?auto_12510 ) ( IN-TRUCK ?auto_12507 ?auto_12512 ) ( TRUCK-AT ?auto_12512 ?auto_12510 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12508 ?auto_12509 ?auto_12506 )
      ( DELIVER-3PKG-VERIFY ?auto_12507 ?auto_12508 ?auto_12509 ?auto_12506 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12522 - OBJ
      ?auto_12523 - OBJ
      ?auto_12524 - OBJ
      ?auto_12521 - LOCATION
    )
    :vars
    (
      ?auto_12525 - LOCATION
      ?auto_12526 - CITY
      ?auto_12527 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12523 ?auto_12522 ) ) ( not ( = ?auto_12524 ?auto_12522 ) ) ( not ( = ?auto_12524 ?auto_12523 ) ) ( IN-CITY ?auto_12525 ?auto_12526 ) ( IN-CITY ?auto_12521 ?auto_12526 ) ( not ( = ?auto_12521 ?auto_12525 ) ) ( OBJ-AT ?auto_12524 ?auto_12521 ) ( OBJ-AT ?auto_12523 ?auto_12525 ) ( IN-TRUCK ?auto_12522 ?auto_12527 ) ( TRUCK-AT ?auto_12527 ?auto_12525 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12524 ?auto_12523 ?auto_12521 )
      ( DELIVER-3PKG-VERIFY ?auto_12522 ?auto_12523 ?auto_12524 ?auto_12521 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12553 - OBJ
      ?auto_12554 - OBJ
      ?auto_12555 - OBJ
      ?auto_12552 - LOCATION
    )
    :vars
    (
      ?auto_12556 - LOCATION
      ?auto_12557 - CITY
      ?auto_12558 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12554 ?auto_12553 ) ) ( not ( = ?auto_12555 ?auto_12553 ) ) ( not ( = ?auto_12555 ?auto_12554 ) ) ( IN-CITY ?auto_12556 ?auto_12557 ) ( IN-CITY ?auto_12552 ?auto_12557 ) ( not ( = ?auto_12552 ?auto_12556 ) ) ( OBJ-AT ?auto_12554 ?auto_12552 ) ( OBJ-AT ?auto_12553 ?auto_12556 ) ( IN-TRUCK ?auto_12555 ?auto_12558 ) ( TRUCK-AT ?auto_12558 ?auto_12556 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12554 ?auto_12553 ?auto_12552 )
      ( DELIVER-3PKG-VERIFY ?auto_12553 ?auto_12554 ?auto_12555 ?auto_12552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12568 - OBJ
      ?auto_12569 - OBJ
      ?auto_12570 - OBJ
      ?auto_12567 - LOCATION
    )
    :vars
    (
      ?auto_12571 - LOCATION
      ?auto_12572 - CITY
      ?auto_12573 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12569 ?auto_12568 ) ) ( not ( = ?auto_12570 ?auto_12568 ) ) ( not ( = ?auto_12570 ?auto_12569 ) ) ( IN-CITY ?auto_12571 ?auto_12572 ) ( IN-CITY ?auto_12567 ?auto_12572 ) ( not ( = ?auto_12567 ?auto_12571 ) ) ( OBJ-AT ?auto_12570 ?auto_12567 ) ( OBJ-AT ?auto_12568 ?auto_12571 ) ( IN-TRUCK ?auto_12569 ?auto_12573 ) ( TRUCK-AT ?auto_12573 ?auto_12571 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12570 ?auto_12568 ?auto_12567 )
      ( DELIVER-3PKG-VERIFY ?auto_12568 ?auto_12569 ?auto_12570 ?auto_12567 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12616 - OBJ
      ?auto_12615 - LOCATION
    )
    :vars
    (
      ?auto_12618 - OBJ
      ?auto_12617 - LOCATION
      ?auto_12619 - CITY
      ?auto_12621 - OBJ
      ?auto_12620 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12616 ?auto_12618 ) ) ( IN-CITY ?auto_12617 ?auto_12619 ) ( IN-CITY ?auto_12615 ?auto_12619 ) ( not ( = ?auto_12615 ?auto_12617 ) ) ( OBJ-AT ?auto_12618 ?auto_12615 ) ( OBJ-AT ?auto_12616 ?auto_12617 ) ( not ( = ?auto_12621 ?auto_12618 ) ) ( not ( = ?auto_12616 ?auto_12621 ) ) ( TRUCK-AT ?auto_12620 ?auto_12617 ) ( OBJ-AT ?auto_12621 ?auto_12617 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12621 ?auto_12620 ?auto_12617 )
      ( DELIVER-2PKG ?auto_12618 ?auto_12616 ?auto_12615 )
      ( DELIVER-1PKG-VERIFY ?auto_12616 ?auto_12615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12623 - OBJ
      ?auto_12624 - OBJ
      ?auto_12622 - LOCATION
    )
    :vars
    (
      ?auto_12625 - LOCATION
      ?auto_12627 - CITY
      ?auto_12628 - OBJ
      ?auto_12626 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12624 ?auto_12623 ) ) ( IN-CITY ?auto_12625 ?auto_12627 ) ( IN-CITY ?auto_12622 ?auto_12627 ) ( not ( = ?auto_12622 ?auto_12625 ) ) ( OBJ-AT ?auto_12623 ?auto_12622 ) ( OBJ-AT ?auto_12624 ?auto_12625 ) ( not ( = ?auto_12628 ?auto_12623 ) ) ( not ( = ?auto_12624 ?auto_12628 ) ) ( TRUCK-AT ?auto_12626 ?auto_12625 ) ( OBJ-AT ?auto_12628 ?auto_12625 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12624 ?auto_12622 )
      ( DELIVER-2PKG-VERIFY ?auto_12623 ?auto_12624 ?auto_12622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12630 - OBJ
      ?auto_12631 - OBJ
      ?auto_12629 - LOCATION
    )
    :vars
    (
      ?auto_12635 - OBJ
      ?auto_12633 - LOCATION
      ?auto_12634 - CITY
      ?auto_12632 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12631 ?auto_12630 ) ) ( not ( = ?auto_12631 ?auto_12635 ) ) ( IN-CITY ?auto_12633 ?auto_12634 ) ( IN-CITY ?auto_12629 ?auto_12634 ) ( not ( = ?auto_12629 ?auto_12633 ) ) ( OBJ-AT ?auto_12635 ?auto_12629 ) ( OBJ-AT ?auto_12631 ?auto_12633 ) ( not ( = ?auto_12630 ?auto_12635 ) ) ( TRUCK-AT ?auto_12632 ?auto_12633 ) ( OBJ-AT ?auto_12630 ?auto_12633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12635 ?auto_12631 ?auto_12629 )
      ( DELIVER-2PKG-VERIFY ?auto_12630 ?auto_12631 ?auto_12629 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12637 - OBJ
      ?auto_12638 - OBJ
      ?auto_12636 - LOCATION
    )
    :vars
    (
      ?auto_12641 - LOCATION
      ?auto_12642 - CITY
      ?auto_12640 - OBJ
      ?auto_12639 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12638 ?auto_12637 ) ) ( IN-CITY ?auto_12641 ?auto_12642 ) ( IN-CITY ?auto_12636 ?auto_12642 ) ( not ( = ?auto_12636 ?auto_12641 ) ) ( OBJ-AT ?auto_12638 ?auto_12636 ) ( OBJ-AT ?auto_12637 ?auto_12641 ) ( not ( = ?auto_12640 ?auto_12638 ) ) ( not ( = ?auto_12637 ?auto_12640 ) ) ( TRUCK-AT ?auto_12639 ?auto_12641 ) ( OBJ-AT ?auto_12640 ?auto_12641 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12638 ?auto_12637 ?auto_12636 )
      ( DELIVER-2PKG-VERIFY ?auto_12637 ?auto_12638 ?auto_12636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12644 - OBJ
      ?auto_12645 - OBJ
      ?auto_12643 - LOCATION
    )
    :vars
    (
      ?auto_12649 - OBJ
      ?auto_12647 - LOCATION
      ?auto_12648 - CITY
      ?auto_12646 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12645 ?auto_12644 ) ) ( not ( = ?auto_12644 ?auto_12649 ) ) ( IN-CITY ?auto_12647 ?auto_12648 ) ( IN-CITY ?auto_12643 ?auto_12648 ) ( not ( = ?auto_12643 ?auto_12647 ) ) ( OBJ-AT ?auto_12649 ?auto_12643 ) ( OBJ-AT ?auto_12644 ?auto_12647 ) ( not ( = ?auto_12645 ?auto_12649 ) ) ( TRUCK-AT ?auto_12646 ?auto_12647 ) ( OBJ-AT ?auto_12645 ?auto_12647 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12649 ?auto_12644 ?auto_12643 )
      ( DELIVER-2PKG-VERIFY ?auto_12644 ?auto_12645 ?auto_12643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12667 - OBJ
      ?auto_12668 - OBJ
      ?auto_12669 - OBJ
      ?auto_12666 - LOCATION
    )
    :vars
    (
      ?auto_12671 - LOCATION
      ?auto_12672 - CITY
      ?auto_12670 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12668 ?auto_12667 ) ) ( not ( = ?auto_12669 ?auto_12667 ) ) ( not ( = ?auto_12669 ?auto_12668 ) ) ( IN-CITY ?auto_12671 ?auto_12672 ) ( IN-CITY ?auto_12666 ?auto_12672 ) ( not ( = ?auto_12666 ?auto_12671 ) ) ( OBJ-AT ?auto_12667 ?auto_12666 ) ( OBJ-AT ?auto_12669 ?auto_12671 ) ( TRUCK-AT ?auto_12670 ?auto_12671 ) ( OBJ-AT ?auto_12668 ?auto_12671 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12667 ?auto_12669 ?auto_12666 )
      ( DELIVER-3PKG-VERIFY ?auto_12667 ?auto_12668 ?auto_12669 ?auto_12666 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12682 - OBJ
      ?auto_12683 - OBJ
      ?auto_12684 - OBJ
      ?auto_12681 - LOCATION
    )
    :vars
    (
      ?auto_12686 - LOCATION
      ?auto_12687 - CITY
      ?auto_12685 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12683 ?auto_12682 ) ) ( not ( = ?auto_12684 ?auto_12682 ) ) ( not ( = ?auto_12684 ?auto_12683 ) ) ( IN-CITY ?auto_12686 ?auto_12687 ) ( IN-CITY ?auto_12681 ?auto_12687 ) ( not ( = ?auto_12681 ?auto_12686 ) ) ( OBJ-AT ?auto_12682 ?auto_12681 ) ( OBJ-AT ?auto_12683 ?auto_12686 ) ( TRUCK-AT ?auto_12685 ?auto_12686 ) ( OBJ-AT ?auto_12684 ?auto_12686 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12682 ?auto_12683 ?auto_12681 )
      ( DELIVER-3PKG-VERIFY ?auto_12682 ?auto_12683 ?auto_12684 ?auto_12681 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12697 - OBJ
      ?auto_12698 - OBJ
      ?auto_12699 - OBJ
      ?auto_12696 - LOCATION
    )
    :vars
    (
      ?auto_12701 - LOCATION
      ?auto_12702 - CITY
      ?auto_12700 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12698 ?auto_12697 ) ) ( not ( = ?auto_12699 ?auto_12697 ) ) ( not ( = ?auto_12699 ?auto_12698 ) ) ( IN-CITY ?auto_12701 ?auto_12702 ) ( IN-CITY ?auto_12696 ?auto_12702 ) ( not ( = ?auto_12696 ?auto_12701 ) ) ( OBJ-AT ?auto_12698 ?auto_12696 ) ( OBJ-AT ?auto_12699 ?auto_12701 ) ( TRUCK-AT ?auto_12700 ?auto_12701 ) ( OBJ-AT ?auto_12697 ?auto_12701 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12698 ?auto_12699 ?auto_12696 )
      ( DELIVER-3PKG-VERIFY ?auto_12697 ?auto_12698 ?auto_12699 ?auto_12696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12712 - OBJ
      ?auto_12713 - OBJ
      ?auto_12714 - OBJ
      ?auto_12711 - LOCATION
    )
    :vars
    (
      ?auto_12716 - LOCATION
      ?auto_12717 - CITY
      ?auto_12715 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12713 ?auto_12712 ) ) ( not ( = ?auto_12714 ?auto_12712 ) ) ( not ( = ?auto_12714 ?auto_12713 ) ) ( IN-CITY ?auto_12716 ?auto_12717 ) ( IN-CITY ?auto_12711 ?auto_12717 ) ( not ( = ?auto_12711 ?auto_12716 ) ) ( OBJ-AT ?auto_12714 ?auto_12711 ) ( OBJ-AT ?auto_12713 ?auto_12716 ) ( TRUCK-AT ?auto_12715 ?auto_12716 ) ( OBJ-AT ?auto_12712 ?auto_12716 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12714 ?auto_12713 ?auto_12711 )
      ( DELIVER-3PKG-VERIFY ?auto_12712 ?auto_12713 ?auto_12714 ?auto_12711 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12743 - OBJ
      ?auto_12744 - OBJ
      ?auto_12745 - OBJ
      ?auto_12742 - LOCATION
    )
    :vars
    (
      ?auto_12747 - LOCATION
      ?auto_12748 - CITY
      ?auto_12746 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12744 ?auto_12743 ) ) ( not ( = ?auto_12745 ?auto_12743 ) ) ( not ( = ?auto_12745 ?auto_12744 ) ) ( IN-CITY ?auto_12747 ?auto_12748 ) ( IN-CITY ?auto_12742 ?auto_12748 ) ( not ( = ?auto_12742 ?auto_12747 ) ) ( OBJ-AT ?auto_12744 ?auto_12742 ) ( OBJ-AT ?auto_12743 ?auto_12747 ) ( TRUCK-AT ?auto_12746 ?auto_12747 ) ( OBJ-AT ?auto_12745 ?auto_12747 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12744 ?auto_12743 ?auto_12742 )
      ( DELIVER-3PKG-VERIFY ?auto_12743 ?auto_12744 ?auto_12745 ?auto_12742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12758 - OBJ
      ?auto_12759 - OBJ
      ?auto_12760 - OBJ
      ?auto_12757 - LOCATION
    )
    :vars
    (
      ?auto_12762 - LOCATION
      ?auto_12763 - CITY
      ?auto_12761 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12759 ?auto_12758 ) ) ( not ( = ?auto_12760 ?auto_12758 ) ) ( not ( = ?auto_12760 ?auto_12759 ) ) ( IN-CITY ?auto_12762 ?auto_12763 ) ( IN-CITY ?auto_12757 ?auto_12763 ) ( not ( = ?auto_12757 ?auto_12762 ) ) ( OBJ-AT ?auto_12760 ?auto_12757 ) ( OBJ-AT ?auto_12758 ?auto_12762 ) ( TRUCK-AT ?auto_12761 ?auto_12762 ) ( OBJ-AT ?auto_12759 ?auto_12762 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12760 ?auto_12758 ?auto_12757 )
      ( DELIVER-3PKG-VERIFY ?auto_12758 ?auto_12759 ?auto_12760 ?auto_12757 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12806 - OBJ
      ?auto_12805 - LOCATION
    )
    :vars
    (
      ?auto_12811 - OBJ
      ?auto_12809 - LOCATION
      ?auto_12810 - CITY
      ?auto_12808 - OBJ
      ?auto_12807 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12806 ?auto_12811 ) ) ( IN-CITY ?auto_12809 ?auto_12810 ) ( IN-CITY ?auto_12805 ?auto_12810 ) ( not ( = ?auto_12805 ?auto_12809 ) ) ( OBJ-AT ?auto_12811 ?auto_12805 ) ( OBJ-AT ?auto_12806 ?auto_12809 ) ( not ( = ?auto_12808 ?auto_12811 ) ) ( not ( = ?auto_12806 ?auto_12808 ) ) ( OBJ-AT ?auto_12808 ?auto_12809 ) ( TRUCK-AT ?auto_12807 ?auto_12805 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12807 ?auto_12805 ?auto_12809 ?auto_12810 )
      ( DELIVER-2PKG ?auto_12811 ?auto_12806 ?auto_12805 )
      ( DELIVER-1PKG-VERIFY ?auto_12806 ?auto_12805 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12813 - OBJ
      ?auto_12814 - OBJ
      ?auto_12812 - LOCATION
    )
    :vars
    (
      ?auto_12816 - LOCATION
      ?auto_12818 - CITY
      ?auto_12817 - OBJ
      ?auto_12815 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12814 ?auto_12813 ) ) ( IN-CITY ?auto_12816 ?auto_12818 ) ( IN-CITY ?auto_12812 ?auto_12818 ) ( not ( = ?auto_12812 ?auto_12816 ) ) ( OBJ-AT ?auto_12813 ?auto_12812 ) ( OBJ-AT ?auto_12814 ?auto_12816 ) ( not ( = ?auto_12817 ?auto_12813 ) ) ( not ( = ?auto_12814 ?auto_12817 ) ) ( OBJ-AT ?auto_12817 ?auto_12816 ) ( TRUCK-AT ?auto_12815 ?auto_12812 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12814 ?auto_12812 )
      ( DELIVER-2PKG-VERIFY ?auto_12813 ?auto_12814 ?auto_12812 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12820 - OBJ
      ?auto_12821 - OBJ
      ?auto_12819 - LOCATION
    )
    :vars
    (
      ?auto_12822 - OBJ
      ?auto_12823 - LOCATION
      ?auto_12825 - CITY
      ?auto_12824 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12821 ?auto_12820 ) ) ( not ( = ?auto_12821 ?auto_12822 ) ) ( IN-CITY ?auto_12823 ?auto_12825 ) ( IN-CITY ?auto_12819 ?auto_12825 ) ( not ( = ?auto_12819 ?auto_12823 ) ) ( OBJ-AT ?auto_12822 ?auto_12819 ) ( OBJ-AT ?auto_12821 ?auto_12823 ) ( not ( = ?auto_12820 ?auto_12822 ) ) ( OBJ-AT ?auto_12820 ?auto_12823 ) ( TRUCK-AT ?auto_12824 ?auto_12819 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12822 ?auto_12821 ?auto_12819 )
      ( DELIVER-2PKG-VERIFY ?auto_12820 ?auto_12821 ?auto_12819 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12827 - OBJ
      ?auto_12828 - OBJ
      ?auto_12826 - LOCATION
    )
    :vars
    (
      ?auto_12829 - LOCATION
      ?auto_12831 - CITY
      ?auto_12832 - OBJ
      ?auto_12830 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12828 ?auto_12827 ) ) ( IN-CITY ?auto_12829 ?auto_12831 ) ( IN-CITY ?auto_12826 ?auto_12831 ) ( not ( = ?auto_12826 ?auto_12829 ) ) ( OBJ-AT ?auto_12828 ?auto_12826 ) ( OBJ-AT ?auto_12827 ?auto_12829 ) ( not ( = ?auto_12832 ?auto_12828 ) ) ( not ( = ?auto_12827 ?auto_12832 ) ) ( OBJ-AT ?auto_12832 ?auto_12829 ) ( TRUCK-AT ?auto_12830 ?auto_12826 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12828 ?auto_12827 ?auto_12826 )
      ( DELIVER-2PKG-VERIFY ?auto_12827 ?auto_12828 ?auto_12826 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12834 - OBJ
      ?auto_12835 - OBJ
      ?auto_12833 - LOCATION
    )
    :vars
    (
      ?auto_12836 - OBJ
      ?auto_12837 - LOCATION
      ?auto_12839 - CITY
      ?auto_12838 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12835 ?auto_12834 ) ) ( not ( = ?auto_12834 ?auto_12836 ) ) ( IN-CITY ?auto_12837 ?auto_12839 ) ( IN-CITY ?auto_12833 ?auto_12839 ) ( not ( = ?auto_12833 ?auto_12837 ) ) ( OBJ-AT ?auto_12836 ?auto_12833 ) ( OBJ-AT ?auto_12834 ?auto_12837 ) ( not ( = ?auto_12835 ?auto_12836 ) ) ( OBJ-AT ?auto_12835 ?auto_12837 ) ( TRUCK-AT ?auto_12838 ?auto_12833 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12836 ?auto_12834 ?auto_12833 )
      ( DELIVER-2PKG-VERIFY ?auto_12834 ?auto_12835 ?auto_12833 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12857 - OBJ
      ?auto_12858 - OBJ
      ?auto_12859 - OBJ
      ?auto_12856 - LOCATION
    )
    :vars
    (
      ?auto_12860 - LOCATION
      ?auto_12862 - CITY
      ?auto_12861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12858 ?auto_12857 ) ) ( not ( = ?auto_12859 ?auto_12857 ) ) ( not ( = ?auto_12859 ?auto_12858 ) ) ( IN-CITY ?auto_12860 ?auto_12862 ) ( IN-CITY ?auto_12856 ?auto_12862 ) ( not ( = ?auto_12856 ?auto_12860 ) ) ( OBJ-AT ?auto_12857 ?auto_12856 ) ( OBJ-AT ?auto_12859 ?auto_12860 ) ( OBJ-AT ?auto_12858 ?auto_12860 ) ( TRUCK-AT ?auto_12861 ?auto_12856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12857 ?auto_12859 ?auto_12856 )
      ( DELIVER-3PKG-VERIFY ?auto_12857 ?auto_12858 ?auto_12859 ?auto_12856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12872 - OBJ
      ?auto_12873 - OBJ
      ?auto_12874 - OBJ
      ?auto_12871 - LOCATION
    )
    :vars
    (
      ?auto_12875 - LOCATION
      ?auto_12877 - CITY
      ?auto_12876 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12873 ?auto_12872 ) ) ( not ( = ?auto_12874 ?auto_12872 ) ) ( not ( = ?auto_12874 ?auto_12873 ) ) ( IN-CITY ?auto_12875 ?auto_12877 ) ( IN-CITY ?auto_12871 ?auto_12877 ) ( not ( = ?auto_12871 ?auto_12875 ) ) ( OBJ-AT ?auto_12872 ?auto_12871 ) ( OBJ-AT ?auto_12873 ?auto_12875 ) ( OBJ-AT ?auto_12874 ?auto_12875 ) ( TRUCK-AT ?auto_12876 ?auto_12871 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12872 ?auto_12873 ?auto_12871 )
      ( DELIVER-3PKG-VERIFY ?auto_12872 ?auto_12873 ?auto_12874 ?auto_12871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12887 - OBJ
      ?auto_12888 - OBJ
      ?auto_12889 - OBJ
      ?auto_12886 - LOCATION
    )
    :vars
    (
      ?auto_12890 - LOCATION
      ?auto_12892 - CITY
      ?auto_12891 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12888 ?auto_12887 ) ) ( not ( = ?auto_12889 ?auto_12887 ) ) ( not ( = ?auto_12889 ?auto_12888 ) ) ( IN-CITY ?auto_12890 ?auto_12892 ) ( IN-CITY ?auto_12886 ?auto_12892 ) ( not ( = ?auto_12886 ?auto_12890 ) ) ( OBJ-AT ?auto_12888 ?auto_12886 ) ( OBJ-AT ?auto_12889 ?auto_12890 ) ( OBJ-AT ?auto_12887 ?auto_12890 ) ( TRUCK-AT ?auto_12891 ?auto_12886 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12888 ?auto_12889 ?auto_12886 )
      ( DELIVER-3PKG-VERIFY ?auto_12887 ?auto_12888 ?auto_12889 ?auto_12886 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12902 - OBJ
      ?auto_12903 - OBJ
      ?auto_12904 - OBJ
      ?auto_12901 - LOCATION
    )
    :vars
    (
      ?auto_12905 - LOCATION
      ?auto_12907 - CITY
      ?auto_12906 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12903 ?auto_12902 ) ) ( not ( = ?auto_12904 ?auto_12902 ) ) ( not ( = ?auto_12904 ?auto_12903 ) ) ( IN-CITY ?auto_12905 ?auto_12907 ) ( IN-CITY ?auto_12901 ?auto_12907 ) ( not ( = ?auto_12901 ?auto_12905 ) ) ( OBJ-AT ?auto_12904 ?auto_12901 ) ( OBJ-AT ?auto_12903 ?auto_12905 ) ( OBJ-AT ?auto_12902 ?auto_12905 ) ( TRUCK-AT ?auto_12906 ?auto_12901 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12904 ?auto_12903 ?auto_12901 )
      ( DELIVER-3PKG-VERIFY ?auto_12902 ?auto_12903 ?auto_12904 ?auto_12901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12933 - OBJ
      ?auto_12934 - OBJ
      ?auto_12935 - OBJ
      ?auto_12932 - LOCATION
    )
    :vars
    (
      ?auto_12936 - LOCATION
      ?auto_12938 - CITY
      ?auto_12937 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12934 ?auto_12933 ) ) ( not ( = ?auto_12935 ?auto_12933 ) ) ( not ( = ?auto_12935 ?auto_12934 ) ) ( IN-CITY ?auto_12936 ?auto_12938 ) ( IN-CITY ?auto_12932 ?auto_12938 ) ( not ( = ?auto_12932 ?auto_12936 ) ) ( OBJ-AT ?auto_12934 ?auto_12932 ) ( OBJ-AT ?auto_12933 ?auto_12936 ) ( OBJ-AT ?auto_12935 ?auto_12936 ) ( TRUCK-AT ?auto_12937 ?auto_12932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12934 ?auto_12933 ?auto_12932 )
      ( DELIVER-3PKG-VERIFY ?auto_12933 ?auto_12934 ?auto_12935 ?auto_12932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12948 - OBJ
      ?auto_12949 - OBJ
      ?auto_12950 - OBJ
      ?auto_12947 - LOCATION
    )
    :vars
    (
      ?auto_12951 - LOCATION
      ?auto_12953 - CITY
      ?auto_12952 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12949 ?auto_12948 ) ) ( not ( = ?auto_12950 ?auto_12948 ) ) ( not ( = ?auto_12950 ?auto_12949 ) ) ( IN-CITY ?auto_12951 ?auto_12953 ) ( IN-CITY ?auto_12947 ?auto_12953 ) ( not ( = ?auto_12947 ?auto_12951 ) ) ( OBJ-AT ?auto_12950 ?auto_12947 ) ( OBJ-AT ?auto_12948 ?auto_12951 ) ( OBJ-AT ?auto_12949 ?auto_12951 ) ( TRUCK-AT ?auto_12952 ?auto_12947 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12950 ?auto_12948 ?auto_12947 )
      ( DELIVER-3PKG-VERIFY ?auto_12948 ?auto_12949 ?auto_12950 ?auto_12947 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12996 - OBJ
      ?auto_12995 - LOCATION
    )
    :vars
    (
      ?auto_12997 - OBJ
      ?auto_12998 - LOCATION
      ?auto_13000 - CITY
      ?auto_13001 - OBJ
      ?auto_12999 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12996 ?auto_12997 ) ) ( IN-CITY ?auto_12998 ?auto_13000 ) ( IN-CITY ?auto_12995 ?auto_13000 ) ( not ( = ?auto_12995 ?auto_12998 ) ) ( OBJ-AT ?auto_12996 ?auto_12998 ) ( not ( = ?auto_13001 ?auto_12997 ) ) ( not ( = ?auto_12996 ?auto_13001 ) ) ( OBJ-AT ?auto_13001 ?auto_12998 ) ( TRUCK-AT ?auto_12999 ?auto_12995 ) ( IN-TRUCK ?auto_12997 ?auto_12999 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12997 ?auto_12995 )
      ( DELIVER-2PKG ?auto_12997 ?auto_12996 ?auto_12995 )
      ( DELIVER-1PKG-VERIFY ?auto_12996 ?auto_12995 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13003 - OBJ
      ?auto_13004 - OBJ
      ?auto_13002 - LOCATION
    )
    :vars
    (
      ?auto_13008 - LOCATION
      ?auto_13006 - CITY
      ?auto_13005 - OBJ
      ?auto_13007 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13004 ?auto_13003 ) ) ( IN-CITY ?auto_13008 ?auto_13006 ) ( IN-CITY ?auto_13002 ?auto_13006 ) ( not ( = ?auto_13002 ?auto_13008 ) ) ( OBJ-AT ?auto_13004 ?auto_13008 ) ( not ( = ?auto_13005 ?auto_13003 ) ) ( not ( = ?auto_13004 ?auto_13005 ) ) ( OBJ-AT ?auto_13005 ?auto_13008 ) ( TRUCK-AT ?auto_13007 ?auto_13002 ) ( IN-TRUCK ?auto_13003 ?auto_13007 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13004 ?auto_13002 )
      ( DELIVER-2PKG-VERIFY ?auto_13003 ?auto_13004 ?auto_13002 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13010 - OBJ
      ?auto_13011 - OBJ
      ?auto_13009 - LOCATION
    )
    :vars
    (
      ?auto_13013 - OBJ
      ?auto_13015 - LOCATION
      ?auto_13012 - CITY
      ?auto_13014 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13011 ?auto_13010 ) ) ( not ( = ?auto_13011 ?auto_13013 ) ) ( IN-CITY ?auto_13015 ?auto_13012 ) ( IN-CITY ?auto_13009 ?auto_13012 ) ( not ( = ?auto_13009 ?auto_13015 ) ) ( OBJ-AT ?auto_13011 ?auto_13015 ) ( not ( = ?auto_13010 ?auto_13013 ) ) ( OBJ-AT ?auto_13010 ?auto_13015 ) ( TRUCK-AT ?auto_13014 ?auto_13009 ) ( IN-TRUCK ?auto_13013 ?auto_13014 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13013 ?auto_13011 ?auto_13009 )
      ( DELIVER-2PKG-VERIFY ?auto_13010 ?auto_13011 ?auto_13009 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13017 - OBJ
      ?auto_13018 - OBJ
      ?auto_13016 - LOCATION
    )
    :vars
    (
      ?auto_13022 - LOCATION
      ?auto_13019 - CITY
      ?auto_13021 - OBJ
      ?auto_13020 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13018 ?auto_13017 ) ) ( IN-CITY ?auto_13022 ?auto_13019 ) ( IN-CITY ?auto_13016 ?auto_13019 ) ( not ( = ?auto_13016 ?auto_13022 ) ) ( OBJ-AT ?auto_13017 ?auto_13022 ) ( not ( = ?auto_13021 ?auto_13018 ) ) ( not ( = ?auto_13017 ?auto_13021 ) ) ( OBJ-AT ?auto_13021 ?auto_13022 ) ( TRUCK-AT ?auto_13020 ?auto_13016 ) ( IN-TRUCK ?auto_13018 ?auto_13020 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13018 ?auto_13017 ?auto_13016 )
      ( DELIVER-2PKG-VERIFY ?auto_13017 ?auto_13018 ?auto_13016 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13024 - OBJ
      ?auto_13025 - OBJ
      ?auto_13023 - LOCATION
    )
    :vars
    (
      ?auto_13027 - OBJ
      ?auto_13029 - LOCATION
      ?auto_13026 - CITY
      ?auto_13028 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13025 ?auto_13024 ) ) ( not ( = ?auto_13024 ?auto_13027 ) ) ( IN-CITY ?auto_13029 ?auto_13026 ) ( IN-CITY ?auto_13023 ?auto_13026 ) ( not ( = ?auto_13023 ?auto_13029 ) ) ( OBJ-AT ?auto_13024 ?auto_13029 ) ( not ( = ?auto_13025 ?auto_13027 ) ) ( OBJ-AT ?auto_13025 ?auto_13029 ) ( TRUCK-AT ?auto_13028 ?auto_13023 ) ( IN-TRUCK ?auto_13027 ?auto_13028 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13027 ?auto_13024 ?auto_13023 )
      ( DELIVER-2PKG-VERIFY ?auto_13024 ?auto_13025 ?auto_13023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13047 - OBJ
      ?auto_13048 - OBJ
      ?auto_13049 - OBJ
      ?auto_13046 - LOCATION
    )
    :vars
    (
      ?auto_13052 - LOCATION
      ?auto_13050 - CITY
      ?auto_13051 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13048 ?auto_13047 ) ) ( not ( = ?auto_13049 ?auto_13047 ) ) ( not ( = ?auto_13049 ?auto_13048 ) ) ( IN-CITY ?auto_13052 ?auto_13050 ) ( IN-CITY ?auto_13046 ?auto_13050 ) ( not ( = ?auto_13046 ?auto_13052 ) ) ( OBJ-AT ?auto_13049 ?auto_13052 ) ( OBJ-AT ?auto_13048 ?auto_13052 ) ( TRUCK-AT ?auto_13051 ?auto_13046 ) ( IN-TRUCK ?auto_13047 ?auto_13051 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13047 ?auto_13049 ?auto_13046 )
      ( DELIVER-3PKG-VERIFY ?auto_13047 ?auto_13048 ?auto_13049 ?auto_13046 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13062 - OBJ
      ?auto_13063 - OBJ
      ?auto_13064 - OBJ
      ?auto_13061 - LOCATION
    )
    :vars
    (
      ?auto_13067 - LOCATION
      ?auto_13065 - CITY
      ?auto_13066 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13063 ?auto_13062 ) ) ( not ( = ?auto_13064 ?auto_13062 ) ) ( not ( = ?auto_13064 ?auto_13063 ) ) ( IN-CITY ?auto_13067 ?auto_13065 ) ( IN-CITY ?auto_13061 ?auto_13065 ) ( not ( = ?auto_13061 ?auto_13067 ) ) ( OBJ-AT ?auto_13063 ?auto_13067 ) ( OBJ-AT ?auto_13064 ?auto_13067 ) ( TRUCK-AT ?auto_13066 ?auto_13061 ) ( IN-TRUCK ?auto_13062 ?auto_13066 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13062 ?auto_13063 ?auto_13061 )
      ( DELIVER-3PKG-VERIFY ?auto_13062 ?auto_13063 ?auto_13064 ?auto_13061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13077 - OBJ
      ?auto_13078 - OBJ
      ?auto_13079 - OBJ
      ?auto_13076 - LOCATION
    )
    :vars
    (
      ?auto_13082 - LOCATION
      ?auto_13080 - CITY
      ?auto_13081 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13078 ?auto_13077 ) ) ( not ( = ?auto_13079 ?auto_13077 ) ) ( not ( = ?auto_13079 ?auto_13078 ) ) ( IN-CITY ?auto_13082 ?auto_13080 ) ( IN-CITY ?auto_13076 ?auto_13080 ) ( not ( = ?auto_13076 ?auto_13082 ) ) ( OBJ-AT ?auto_13079 ?auto_13082 ) ( OBJ-AT ?auto_13077 ?auto_13082 ) ( TRUCK-AT ?auto_13081 ?auto_13076 ) ( IN-TRUCK ?auto_13078 ?auto_13081 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13078 ?auto_13079 ?auto_13076 )
      ( DELIVER-3PKG-VERIFY ?auto_13077 ?auto_13078 ?auto_13079 ?auto_13076 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13092 - OBJ
      ?auto_13093 - OBJ
      ?auto_13094 - OBJ
      ?auto_13091 - LOCATION
    )
    :vars
    (
      ?auto_13097 - LOCATION
      ?auto_13095 - CITY
      ?auto_13096 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13093 ?auto_13092 ) ) ( not ( = ?auto_13094 ?auto_13092 ) ) ( not ( = ?auto_13094 ?auto_13093 ) ) ( IN-CITY ?auto_13097 ?auto_13095 ) ( IN-CITY ?auto_13091 ?auto_13095 ) ( not ( = ?auto_13091 ?auto_13097 ) ) ( OBJ-AT ?auto_13093 ?auto_13097 ) ( OBJ-AT ?auto_13092 ?auto_13097 ) ( TRUCK-AT ?auto_13096 ?auto_13091 ) ( IN-TRUCK ?auto_13094 ?auto_13096 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13094 ?auto_13093 ?auto_13091 )
      ( DELIVER-3PKG-VERIFY ?auto_13092 ?auto_13093 ?auto_13094 ?auto_13091 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13123 - OBJ
      ?auto_13124 - OBJ
      ?auto_13125 - OBJ
      ?auto_13122 - LOCATION
    )
    :vars
    (
      ?auto_13128 - LOCATION
      ?auto_13126 - CITY
      ?auto_13127 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13124 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13124 ) ) ( IN-CITY ?auto_13128 ?auto_13126 ) ( IN-CITY ?auto_13122 ?auto_13126 ) ( not ( = ?auto_13122 ?auto_13128 ) ) ( OBJ-AT ?auto_13123 ?auto_13128 ) ( OBJ-AT ?auto_13125 ?auto_13128 ) ( TRUCK-AT ?auto_13127 ?auto_13122 ) ( IN-TRUCK ?auto_13124 ?auto_13127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13124 ?auto_13123 ?auto_13122 )
      ( DELIVER-3PKG-VERIFY ?auto_13123 ?auto_13124 ?auto_13125 ?auto_13122 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13138 - OBJ
      ?auto_13139 - OBJ
      ?auto_13140 - OBJ
      ?auto_13137 - LOCATION
    )
    :vars
    (
      ?auto_13143 - LOCATION
      ?auto_13141 - CITY
      ?auto_13142 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13139 ?auto_13138 ) ) ( not ( = ?auto_13140 ?auto_13138 ) ) ( not ( = ?auto_13140 ?auto_13139 ) ) ( IN-CITY ?auto_13143 ?auto_13141 ) ( IN-CITY ?auto_13137 ?auto_13141 ) ( not ( = ?auto_13137 ?auto_13143 ) ) ( OBJ-AT ?auto_13138 ?auto_13143 ) ( OBJ-AT ?auto_13139 ?auto_13143 ) ( TRUCK-AT ?auto_13142 ?auto_13137 ) ( IN-TRUCK ?auto_13140 ?auto_13142 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13140 ?auto_13138 ?auto_13137 )
      ( DELIVER-3PKG-VERIFY ?auto_13138 ?auto_13139 ?auto_13140 ?auto_13137 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13186 - OBJ
      ?auto_13185 - LOCATION
    )
    :vars
    (
      ?auto_13188 - OBJ
      ?auto_13191 - LOCATION
      ?auto_13187 - CITY
      ?auto_13190 - OBJ
      ?auto_13189 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13186 ?auto_13188 ) ) ( IN-CITY ?auto_13191 ?auto_13187 ) ( IN-CITY ?auto_13185 ?auto_13187 ) ( not ( = ?auto_13185 ?auto_13191 ) ) ( OBJ-AT ?auto_13186 ?auto_13191 ) ( not ( = ?auto_13190 ?auto_13188 ) ) ( not ( = ?auto_13186 ?auto_13190 ) ) ( OBJ-AT ?auto_13190 ?auto_13191 ) ( IN-TRUCK ?auto_13188 ?auto_13189 ) ( TRUCK-AT ?auto_13189 ?auto_13191 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13189 ?auto_13191 ?auto_13185 ?auto_13187 )
      ( DELIVER-2PKG ?auto_13188 ?auto_13186 ?auto_13185 )
      ( DELIVER-1PKG-VERIFY ?auto_13186 ?auto_13185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13193 - OBJ
      ?auto_13194 - OBJ
      ?auto_13192 - LOCATION
    )
    :vars
    (
      ?auto_13196 - LOCATION
      ?auto_13198 - CITY
      ?auto_13197 - OBJ
      ?auto_13195 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13194 ?auto_13193 ) ) ( IN-CITY ?auto_13196 ?auto_13198 ) ( IN-CITY ?auto_13192 ?auto_13198 ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( OBJ-AT ?auto_13194 ?auto_13196 ) ( not ( = ?auto_13197 ?auto_13193 ) ) ( not ( = ?auto_13194 ?auto_13197 ) ) ( OBJ-AT ?auto_13197 ?auto_13196 ) ( IN-TRUCK ?auto_13193 ?auto_13195 ) ( TRUCK-AT ?auto_13195 ?auto_13196 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13194 ?auto_13192 )
      ( DELIVER-2PKG-VERIFY ?auto_13193 ?auto_13194 ?auto_13192 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13200 - OBJ
      ?auto_13201 - OBJ
      ?auto_13199 - LOCATION
    )
    :vars
    (
      ?auto_13205 - OBJ
      ?auto_13204 - LOCATION
      ?auto_13202 - CITY
      ?auto_13203 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13201 ?auto_13200 ) ) ( not ( = ?auto_13201 ?auto_13205 ) ) ( IN-CITY ?auto_13204 ?auto_13202 ) ( IN-CITY ?auto_13199 ?auto_13202 ) ( not ( = ?auto_13199 ?auto_13204 ) ) ( OBJ-AT ?auto_13201 ?auto_13204 ) ( not ( = ?auto_13200 ?auto_13205 ) ) ( OBJ-AT ?auto_13200 ?auto_13204 ) ( IN-TRUCK ?auto_13205 ?auto_13203 ) ( TRUCK-AT ?auto_13203 ?auto_13204 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13205 ?auto_13201 ?auto_13199 )
      ( DELIVER-2PKG-VERIFY ?auto_13200 ?auto_13201 ?auto_13199 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13207 - OBJ
      ?auto_13208 - OBJ
      ?auto_13206 - LOCATION
    )
    :vars
    (
      ?auto_13211 - LOCATION
      ?auto_13209 - CITY
      ?auto_13212 - OBJ
      ?auto_13210 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13208 ?auto_13207 ) ) ( IN-CITY ?auto_13211 ?auto_13209 ) ( IN-CITY ?auto_13206 ?auto_13209 ) ( not ( = ?auto_13206 ?auto_13211 ) ) ( OBJ-AT ?auto_13207 ?auto_13211 ) ( not ( = ?auto_13212 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13212 ) ) ( OBJ-AT ?auto_13212 ?auto_13211 ) ( IN-TRUCK ?auto_13208 ?auto_13210 ) ( TRUCK-AT ?auto_13210 ?auto_13211 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13208 ?auto_13207 ?auto_13206 )
      ( DELIVER-2PKG-VERIFY ?auto_13207 ?auto_13208 ?auto_13206 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13214 - OBJ
      ?auto_13215 - OBJ
      ?auto_13213 - LOCATION
    )
    :vars
    (
      ?auto_13219 - OBJ
      ?auto_13218 - LOCATION
      ?auto_13216 - CITY
      ?auto_13217 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13215 ?auto_13214 ) ) ( not ( = ?auto_13214 ?auto_13219 ) ) ( IN-CITY ?auto_13218 ?auto_13216 ) ( IN-CITY ?auto_13213 ?auto_13216 ) ( not ( = ?auto_13213 ?auto_13218 ) ) ( OBJ-AT ?auto_13214 ?auto_13218 ) ( not ( = ?auto_13215 ?auto_13219 ) ) ( OBJ-AT ?auto_13215 ?auto_13218 ) ( IN-TRUCK ?auto_13219 ?auto_13217 ) ( TRUCK-AT ?auto_13217 ?auto_13218 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13219 ?auto_13214 ?auto_13213 )
      ( DELIVER-2PKG-VERIFY ?auto_13214 ?auto_13215 ?auto_13213 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13237 - OBJ
      ?auto_13238 - OBJ
      ?auto_13239 - OBJ
      ?auto_13236 - LOCATION
    )
    :vars
    (
      ?auto_13242 - LOCATION
      ?auto_13240 - CITY
      ?auto_13241 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13238 ?auto_13237 ) ) ( not ( = ?auto_13239 ?auto_13237 ) ) ( not ( = ?auto_13239 ?auto_13238 ) ) ( IN-CITY ?auto_13242 ?auto_13240 ) ( IN-CITY ?auto_13236 ?auto_13240 ) ( not ( = ?auto_13236 ?auto_13242 ) ) ( OBJ-AT ?auto_13239 ?auto_13242 ) ( OBJ-AT ?auto_13238 ?auto_13242 ) ( IN-TRUCK ?auto_13237 ?auto_13241 ) ( TRUCK-AT ?auto_13241 ?auto_13242 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13237 ?auto_13239 ?auto_13236 )
      ( DELIVER-3PKG-VERIFY ?auto_13237 ?auto_13238 ?auto_13239 ?auto_13236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13252 - OBJ
      ?auto_13253 - OBJ
      ?auto_13254 - OBJ
      ?auto_13251 - LOCATION
    )
    :vars
    (
      ?auto_13257 - LOCATION
      ?auto_13255 - CITY
      ?auto_13256 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13253 ?auto_13252 ) ) ( not ( = ?auto_13254 ?auto_13252 ) ) ( not ( = ?auto_13254 ?auto_13253 ) ) ( IN-CITY ?auto_13257 ?auto_13255 ) ( IN-CITY ?auto_13251 ?auto_13255 ) ( not ( = ?auto_13251 ?auto_13257 ) ) ( OBJ-AT ?auto_13253 ?auto_13257 ) ( OBJ-AT ?auto_13254 ?auto_13257 ) ( IN-TRUCK ?auto_13252 ?auto_13256 ) ( TRUCK-AT ?auto_13256 ?auto_13257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13252 ?auto_13253 ?auto_13251 )
      ( DELIVER-3PKG-VERIFY ?auto_13252 ?auto_13253 ?auto_13254 ?auto_13251 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13267 - OBJ
      ?auto_13268 - OBJ
      ?auto_13269 - OBJ
      ?auto_13266 - LOCATION
    )
    :vars
    (
      ?auto_13272 - LOCATION
      ?auto_13270 - CITY
      ?auto_13271 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13268 ?auto_13267 ) ) ( not ( = ?auto_13269 ?auto_13267 ) ) ( not ( = ?auto_13269 ?auto_13268 ) ) ( IN-CITY ?auto_13272 ?auto_13270 ) ( IN-CITY ?auto_13266 ?auto_13270 ) ( not ( = ?auto_13266 ?auto_13272 ) ) ( OBJ-AT ?auto_13269 ?auto_13272 ) ( OBJ-AT ?auto_13267 ?auto_13272 ) ( IN-TRUCK ?auto_13268 ?auto_13271 ) ( TRUCK-AT ?auto_13271 ?auto_13272 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13268 ?auto_13269 ?auto_13266 )
      ( DELIVER-3PKG-VERIFY ?auto_13267 ?auto_13268 ?auto_13269 ?auto_13266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13282 - OBJ
      ?auto_13283 - OBJ
      ?auto_13284 - OBJ
      ?auto_13281 - LOCATION
    )
    :vars
    (
      ?auto_13287 - LOCATION
      ?auto_13285 - CITY
      ?auto_13286 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13283 ?auto_13282 ) ) ( not ( = ?auto_13284 ?auto_13282 ) ) ( not ( = ?auto_13284 ?auto_13283 ) ) ( IN-CITY ?auto_13287 ?auto_13285 ) ( IN-CITY ?auto_13281 ?auto_13285 ) ( not ( = ?auto_13281 ?auto_13287 ) ) ( OBJ-AT ?auto_13283 ?auto_13287 ) ( OBJ-AT ?auto_13282 ?auto_13287 ) ( IN-TRUCK ?auto_13284 ?auto_13286 ) ( TRUCK-AT ?auto_13286 ?auto_13287 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13284 ?auto_13283 ?auto_13281 )
      ( DELIVER-3PKG-VERIFY ?auto_13282 ?auto_13283 ?auto_13284 ?auto_13281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13313 - OBJ
      ?auto_13314 - OBJ
      ?auto_13315 - OBJ
      ?auto_13312 - LOCATION
    )
    :vars
    (
      ?auto_13318 - LOCATION
      ?auto_13316 - CITY
      ?auto_13317 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13314 ?auto_13313 ) ) ( not ( = ?auto_13315 ?auto_13313 ) ) ( not ( = ?auto_13315 ?auto_13314 ) ) ( IN-CITY ?auto_13318 ?auto_13316 ) ( IN-CITY ?auto_13312 ?auto_13316 ) ( not ( = ?auto_13312 ?auto_13318 ) ) ( OBJ-AT ?auto_13313 ?auto_13318 ) ( OBJ-AT ?auto_13315 ?auto_13318 ) ( IN-TRUCK ?auto_13314 ?auto_13317 ) ( TRUCK-AT ?auto_13317 ?auto_13318 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13314 ?auto_13313 ?auto_13312 )
      ( DELIVER-3PKG-VERIFY ?auto_13313 ?auto_13314 ?auto_13315 ?auto_13312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13328 - OBJ
      ?auto_13329 - OBJ
      ?auto_13330 - OBJ
      ?auto_13327 - LOCATION
    )
    :vars
    (
      ?auto_13333 - LOCATION
      ?auto_13331 - CITY
      ?auto_13332 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13329 ?auto_13328 ) ) ( not ( = ?auto_13330 ?auto_13328 ) ) ( not ( = ?auto_13330 ?auto_13329 ) ) ( IN-CITY ?auto_13333 ?auto_13331 ) ( IN-CITY ?auto_13327 ?auto_13331 ) ( not ( = ?auto_13327 ?auto_13333 ) ) ( OBJ-AT ?auto_13328 ?auto_13333 ) ( OBJ-AT ?auto_13329 ?auto_13333 ) ( IN-TRUCK ?auto_13330 ?auto_13332 ) ( TRUCK-AT ?auto_13332 ?auto_13333 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13330 ?auto_13328 ?auto_13327 )
      ( DELIVER-3PKG-VERIFY ?auto_13328 ?auto_13329 ?auto_13330 ?auto_13327 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13376 - OBJ
      ?auto_13375 - LOCATION
    )
    :vars
    (
      ?auto_13381 - OBJ
      ?auto_13379 - LOCATION
      ?auto_13377 - CITY
      ?auto_13380 - OBJ
      ?auto_13378 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13376 ?auto_13381 ) ) ( IN-CITY ?auto_13379 ?auto_13377 ) ( IN-CITY ?auto_13375 ?auto_13377 ) ( not ( = ?auto_13375 ?auto_13379 ) ) ( OBJ-AT ?auto_13376 ?auto_13379 ) ( not ( = ?auto_13380 ?auto_13381 ) ) ( not ( = ?auto_13376 ?auto_13380 ) ) ( OBJ-AT ?auto_13380 ?auto_13379 ) ( TRUCK-AT ?auto_13378 ?auto_13379 ) ( OBJ-AT ?auto_13381 ?auto_13379 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13381 ?auto_13378 ?auto_13379 )
      ( DELIVER-2PKG ?auto_13381 ?auto_13376 ?auto_13375 )
      ( DELIVER-1PKG-VERIFY ?auto_13376 ?auto_13375 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13383 - OBJ
      ?auto_13384 - OBJ
      ?auto_13382 - LOCATION
    )
    :vars
    (
      ?auto_13386 - LOCATION
      ?auto_13385 - CITY
      ?auto_13387 - OBJ
      ?auto_13388 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13384 ?auto_13383 ) ) ( IN-CITY ?auto_13386 ?auto_13385 ) ( IN-CITY ?auto_13382 ?auto_13385 ) ( not ( = ?auto_13382 ?auto_13386 ) ) ( OBJ-AT ?auto_13384 ?auto_13386 ) ( not ( = ?auto_13387 ?auto_13383 ) ) ( not ( = ?auto_13384 ?auto_13387 ) ) ( OBJ-AT ?auto_13387 ?auto_13386 ) ( TRUCK-AT ?auto_13388 ?auto_13386 ) ( OBJ-AT ?auto_13383 ?auto_13386 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13384 ?auto_13382 )
      ( DELIVER-2PKG-VERIFY ?auto_13383 ?auto_13384 ?auto_13382 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13390 - OBJ
      ?auto_13391 - OBJ
      ?auto_13389 - LOCATION
    )
    :vars
    (
      ?auto_13395 - OBJ
      ?auto_13393 - LOCATION
      ?auto_13392 - CITY
      ?auto_13394 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13391 ?auto_13390 ) ) ( not ( = ?auto_13391 ?auto_13395 ) ) ( IN-CITY ?auto_13393 ?auto_13392 ) ( IN-CITY ?auto_13389 ?auto_13392 ) ( not ( = ?auto_13389 ?auto_13393 ) ) ( OBJ-AT ?auto_13391 ?auto_13393 ) ( not ( = ?auto_13390 ?auto_13395 ) ) ( OBJ-AT ?auto_13390 ?auto_13393 ) ( TRUCK-AT ?auto_13394 ?auto_13393 ) ( OBJ-AT ?auto_13395 ?auto_13393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13395 ?auto_13391 ?auto_13389 )
      ( DELIVER-2PKG-VERIFY ?auto_13390 ?auto_13391 ?auto_13389 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13397 - OBJ
      ?auto_13398 - OBJ
      ?auto_13396 - LOCATION
    )
    :vars
    (
      ?auto_13401 - LOCATION
      ?auto_13399 - CITY
      ?auto_13400 - OBJ
      ?auto_13402 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13398 ?auto_13397 ) ) ( IN-CITY ?auto_13401 ?auto_13399 ) ( IN-CITY ?auto_13396 ?auto_13399 ) ( not ( = ?auto_13396 ?auto_13401 ) ) ( OBJ-AT ?auto_13397 ?auto_13401 ) ( not ( = ?auto_13400 ?auto_13398 ) ) ( not ( = ?auto_13397 ?auto_13400 ) ) ( OBJ-AT ?auto_13400 ?auto_13401 ) ( TRUCK-AT ?auto_13402 ?auto_13401 ) ( OBJ-AT ?auto_13398 ?auto_13401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13398 ?auto_13397 ?auto_13396 )
      ( DELIVER-2PKG-VERIFY ?auto_13397 ?auto_13398 ?auto_13396 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13404 - OBJ
      ?auto_13405 - OBJ
      ?auto_13403 - LOCATION
    )
    :vars
    (
      ?auto_13409 - OBJ
      ?auto_13407 - LOCATION
      ?auto_13406 - CITY
      ?auto_13408 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13405 ?auto_13404 ) ) ( not ( = ?auto_13404 ?auto_13409 ) ) ( IN-CITY ?auto_13407 ?auto_13406 ) ( IN-CITY ?auto_13403 ?auto_13406 ) ( not ( = ?auto_13403 ?auto_13407 ) ) ( OBJ-AT ?auto_13404 ?auto_13407 ) ( not ( = ?auto_13405 ?auto_13409 ) ) ( OBJ-AT ?auto_13405 ?auto_13407 ) ( TRUCK-AT ?auto_13408 ?auto_13407 ) ( OBJ-AT ?auto_13409 ?auto_13407 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13409 ?auto_13404 ?auto_13403 )
      ( DELIVER-2PKG-VERIFY ?auto_13404 ?auto_13405 ?auto_13403 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13427 - OBJ
      ?auto_13428 - OBJ
      ?auto_13429 - OBJ
      ?auto_13426 - LOCATION
    )
    :vars
    (
      ?auto_13431 - LOCATION
      ?auto_13430 - CITY
      ?auto_13432 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13428 ?auto_13427 ) ) ( not ( = ?auto_13429 ?auto_13427 ) ) ( not ( = ?auto_13429 ?auto_13428 ) ) ( IN-CITY ?auto_13431 ?auto_13430 ) ( IN-CITY ?auto_13426 ?auto_13430 ) ( not ( = ?auto_13426 ?auto_13431 ) ) ( OBJ-AT ?auto_13429 ?auto_13431 ) ( OBJ-AT ?auto_13428 ?auto_13431 ) ( TRUCK-AT ?auto_13432 ?auto_13431 ) ( OBJ-AT ?auto_13427 ?auto_13431 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13427 ?auto_13429 ?auto_13426 )
      ( DELIVER-3PKG-VERIFY ?auto_13427 ?auto_13428 ?auto_13429 ?auto_13426 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13442 - OBJ
      ?auto_13443 - OBJ
      ?auto_13444 - OBJ
      ?auto_13441 - LOCATION
    )
    :vars
    (
      ?auto_13446 - LOCATION
      ?auto_13445 - CITY
      ?auto_13447 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13443 ?auto_13442 ) ) ( not ( = ?auto_13444 ?auto_13442 ) ) ( not ( = ?auto_13444 ?auto_13443 ) ) ( IN-CITY ?auto_13446 ?auto_13445 ) ( IN-CITY ?auto_13441 ?auto_13445 ) ( not ( = ?auto_13441 ?auto_13446 ) ) ( OBJ-AT ?auto_13443 ?auto_13446 ) ( OBJ-AT ?auto_13444 ?auto_13446 ) ( TRUCK-AT ?auto_13447 ?auto_13446 ) ( OBJ-AT ?auto_13442 ?auto_13446 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13442 ?auto_13443 ?auto_13441 )
      ( DELIVER-3PKG-VERIFY ?auto_13442 ?auto_13443 ?auto_13444 ?auto_13441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13457 - OBJ
      ?auto_13458 - OBJ
      ?auto_13459 - OBJ
      ?auto_13456 - LOCATION
    )
    :vars
    (
      ?auto_13461 - LOCATION
      ?auto_13460 - CITY
      ?auto_13462 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13458 ?auto_13457 ) ) ( not ( = ?auto_13459 ?auto_13457 ) ) ( not ( = ?auto_13459 ?auto_13458 ) ) ( IN-CITY ?auto_13461 ?auto_13460 ) ( IN-CITY ?auto_13456 ?auto_13460 ) ( not ( = ?auto_13456 ?auto_13461 ) ) ( OBJ-AT ?auto_13459 ?auto_13461 ) ( OBJ-AT ?auto_13457 ?auto_13461 ) ( TRUCK-AT ?auto_13462 ?auto_13461 ) ( OBJ-AT ?auto_13458 ?auto_13461 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13458 ?auto_13459 ?auto_13456 )
      ( DELIVER-3PKG-VERIFY ?auto_13457 ?auto_13458 ?auto_13459 ?auto_13456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13472 - OBJ
      ?auto_13473 - OBJ
      ?auto_13474 - OBJ
      ?auto_13471 - LOCATION
    )
    :vars
    (
      ?auto_13476 - LOCATION
      ?auto_13475 - CITY
      ?auto_13477 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13473 ?auto_13472 ) ) ( not ( = ?auto_13474 ?auto_13472 ) ) ( not ( = ?auto_13474 ?auto_13473 ) ) ( IN-CITY ?auto_13476 ?auto_13475 ) ( IN-CITY ?auto_13471 ?auto_13475 ) ( not ( = ?auto_13471 ?auto_13476 ) ) ( OBJ-AT ?auto_13473 ?auto_13476 ) ( OBJ-AT ?auto_13472 ?auto_13476 ) ( TRUCK-AT ?auto_13477 ?auto_13476 ) ( OBJ-AT ?auto_13474 ?auto_13476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13474 ?auto_13473 ?auto_13471 )
      ( DELIVER-3PKG-VERIFY ?auto_13472 ?auto_13473 ?auto_13474 ?auto_13471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13503 - OBJ
      ?auto_13504 - OBJ
      ?auto_13505 - OBJ
      ?auto_13502 - LOCATION
    )
    :vars
    (
      ?auto_13507 - LOCATION
      ?auto_13506 - CITY
      ?auto_13508 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13504 ?auto_13503 ) ) ( not ( = ?auto_13505 ?auto_13503 ) ) ( not ( = ?auto_13505 ?auto_13504 ) ) ( IN-CITY ?auto_13507 ?auto_13506 ) ( IN-CITY ?auto_13502 ?auto_13506 ) ( not ( = ?auto_13502 ?auto_13507 ) ) ( OBJ-AT ?auto_13503 ?auto_13507 ) ( OBJ-AT ?auto_13505 ?auto_13507 ) ( TRUCK-AT ?auto_13508 ?auto_13507 ) ( OBJ-AT ?auto_13504 ?auto_13507 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13504 ?auto_13503 ?auto_13502 )
      ( DELIVER-3PKG-VERIFY ?auto_13503 ?auto_13504 ?auto_13505 ?auto_13502 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13518 - OBJ
      ?auto_13519 - OBJ
      ?auto_13520 - OBJ
      ?auto_13517 - LOCATION
    )
    :vars
    (
      ?auto_13522 - LOCATION
      ?auto_13521 - CITY
      ?auto_13523 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13519 ?auto_13518 ) ) ( not ( = ?auto_13520 ?auto_13518 ) ) ( not ( = ?auto_13520 ?auto_13519 ) ) ( IN-CITY ?auto_13522 ?auto_13521 ) ( IN-CITY ?auto_13517 ?auto_13521 ) ( not ( = ?auto_13517 ?auto_13522 ) ) ( OBJ-AT ?auto_13518 ?auto_13522 ) ( OBJ-AT ?auto_13519 ?auto_13522 ) ( TRUCK-AT ?auto_13523 ?auto_13522 ) ( OBJ-AT ?auto_13520 ?auto_13522 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13520 ?auto_13518 ?auto_13517 )
      ( DELIVER-3PKG-VERIFY ?auto_13518 ?auto_13519 ?auto_13520 ?auto_13517 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13566 - OBJ
      ?auto_13565 - LOCATION
    )
    :vars
    (
      ?auto_13571 - OBJ
      ?auto_13569 - LOCATION
      ?auto_13567 - CITY
      ?auto_13568 - OBJ
      ?auto_13570 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13566 ?auto_13571 ) ) ( IN-CITY ?auto_13569 ?auto_13567 ) ( IN-CITY ?auto_13565 ?auto_13567 ) ( not ( = ?auto_13565 ?auto_13569 ) ) ( OBJ-AT ?auto_13566 ?auto_13569 ) ( not ( = ?auto_13568 ?auto_13571 ) ) ( not ( = ?auto_13566 ?auto_13568 ) ) ( OBJ-AT ?auto_13568 ?auto_13569 ) ( OBJ-AT ?auto_13571 ?auto_13569 ) ( TRUCK-AT ?auto_13570 ?auto_13565 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13570 ?auto_13565 ?auto_13569 ?auto_13567 )
      ( DELIVER-2PKG ?auto_13571 ?auto_13566 ?auto_13565 )
      ( DELIVER-1PKG-VERIFY ?auto_13566 ?auto_13565 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13573 - OBJ
      ?auto_13574 - OBJ
      ?auto_13572 - LOCATION
    )
    :vars
    (
      ?auto_13578 - LOCATION
      ?auto_13577 - CITY
      ?auto_13576 - OBJ
      ?auto_13575 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13574 ?auto_13573 ) ) ( IN-CITY ?auto_13578 ?auto_13577 ) ( IN-CITY ?auto_13572 ?auto_13577 ) ( not ( = ?auto_13572 ?auto_13578 ) ) ( OBJ-AT ?auto_13574 ?auto_13578 ) ( not ( = ?auto_13576 ?auto_13573 ) ) ( not ( = ?auto_13574 ?auto_13576 ) ) ( OBJ-AT ?auto_13576 ?auto_13578 ) ( OBJ-AT ?auto_13573 ?auto_13578 ) ( TRUCK-AT ?auto_13575 ?auto_13572 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13574 ?auto_13572 )
      ( DELIVER-2PKG-VERIFY ?auto_13573 ?auto_13574 ?auto_13572 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13580 - OBJ
      ?auto_13581 - OBJ
      ?auto_13579 - LOCATION
    )
    :vars
    (
      ?auto_13585 - OBJ
      ?auto_13582 - LOCATION
      ?auto_13583 - CITY
      ?auto_13584 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13581 ?auto_13580 ) ) ( not ( = ?auto_13581 ?auto_13585 ) ) ( IN-CITY ?auto_13582 ?auto_13583 ) ( IN-CITY ?auto_13579 ?auto_13583 ) ( not ( = ?auto_13579 ?auto_13582 ) ) ( OBJ-AT ?auto_13581 ?auto_13582 ) ( not ( = ?auto_13580 ?auto_13585 ) ) ( OBJ-AT ?auto_13580 ?auto_13582 ) ( OBJ-AT ?auto_13585 ?auto_13582 ) ( TRUCK-AT ?auto_13584 ?auto_13579 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13585 ?auto_13581 ?auto_13579 )
      ( DELIVER-2PKG-VERIFY ?auto_13580 ?auto_13581 ?auto_13579 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13587 - OBJ
      ?auto_13588 - OBJ
      ?auto_13586 - LOCATION
    )
    :vars
    (
      ?auto_13589 - LOCATION
      ?auto_13590 - CITY
      ?auto_13592 - OBJ
      ?auto_13591 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13588 ?auto_13587 ) ) ( IN-CITY ?auto_13589 ?auto_13590 ) ( IN-CITY ?auto_13586 ?auto_13590 ) ( not ( = ?auto_13586 ?auto_13589 ) ) ( OBJ-AT ?auto_13587 ?auto_13589 ) ( not ( = ?auto_13592 ?auto_13588 ) ) ( not ( = ?auto_13587 ?auto_13592 ) ) ( OBJ-AT ?auto_13592 ?auto_13589 ) ( OBJ-AT ?auto_13588 ?auto_13589 ) ( TRUCK-AT ?auto_13591 ?auto_13586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13588 ?auto_13587 ?auto_13586 )
      ( DELIVER-2PKG-VERIFY ?auto_13587 ?auto_13588 ?auto_13586 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13594 - OBJ
      ?auto_13595 - OBJ
      ?auto_13593 - LOCATION
    )
    :vars
    (
      ?auto_13599 - OBJ
      ?auto_13596 - LOCATION
      ?auto_13597 - CITY
      ?auto_13598 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13595 ?auto_13594 ) ) ( not ( = ?auto_13594 ?auto_13599 ) ) ( IN-CITY ?auto_13596 ?auto_13597 ) ( IN-CITY ?auto_13593 ?auto_13597 ) ( not ( = ?auto_13593 ?auto_13596 ) ) ( OBJ-AT ?auto_13594 ?auto_13596 ) ( not ( = ?auto_13595 ?auto_13599 ) ) ( OBJ-AT ?auto_13595 ?auto_13596 ) ( OBJ-AT ?auto_13599 ?auto_13596 ) ( TRUCK-AT ?auto_13598 ?auto_13593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13599 ?auto_13594 ?auto_13593 )
      ( DELIVER-2PKG-VERIFY ?auto_13594 ?auto_13595 ?auto_13593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13617 - OBJ
      ?auto_13618 - OBJ
      ?auto_13619 - OBJ
      ?auto_13616 - LOCATION
    )
    :vars
    (
      ?auto_13620 - LOCATION
      ?auto_13621 - CITY
      ?auto_13622 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13618 ?auto_13617 ) ) ( not ( = ?auto_13619 ?auto_13617 ) ) ( not ( = ?auto_13619 ?auto_13618 ) ) ( IN-CITY ?auto_13620 ?auto_13621 ) ( IN-CITY ?auto_13616 ?auto_13621 ) ( not ( = ?auto_13616 ?auto_13620 ) ) ( OBJ-AT ?auto_13619 ?auto_13620 ) ( OBJ-AT ?auto_13618 ?auto_13620 ) ( OBJ-AT ?auto_13617 ?auto_13620 ) ( TRUCK-AT ?auto_13622 ?auto_13616 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13617 ?auto_13619 ?auto_13616 )
      ( DELIVER-3PKG-VERIFY ?auto_13617 ?auto_13618 ?auto_13619 ?auto_13616 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13632 - OBJ
      ?auto_13633 - OBJ
      ?auto_13634 - OBJ
      ?auto_13631 - LOCATION
    )
    :vars
    (
      ?auto_13635 - LOCATION
      ?auto_13636 - CITY
      ?auto_13637 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13633 ?auto_13632 ) ) ( not ( = ?auto_13634 ?auto_13632 ) ) ( not ( = ?auto_13634 ?auto_13633 ) ) ( IN-CITY ?auto_13635 ?auto_13636 ) ( IN-CITY ?auto_13631 ?auto_13636 ) ( not ( = ?auto_13631 ?auto_13635 ) ) ( OBJ-AT ?auto_13633 ?auto_13635 ) ( OBJ-AT ?auto_13634 ?auto_13635 ) ( OBJ-AT ?auto_13632 ?auto_13635 ) ( TRUCK-AT ?auto_13637 ?auto_13631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13632 ?auto_13633 ?auto_13631 )
      ( DELIVER-3PKG-VERIFY ?auto_13632 ?auto_13633 ?auto_13634 ?auto_13631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13647 - OBJ
      ?auto_13648 - OBJ
      ?auto_13649 - OBJ
      ?auto_13646 - LOCATION
    )
    :vars
    (
      ?auto_13650 - LOCATION
      ?auto_13651 - CITY
      ?auto_13652 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13648 ?auto_13647 ) ) ( not ( = ?auto_13649 ?auto_13647 ) ) ( not ( = ?auto_13649 ?auto_13648 ) ) ( IN-CITY ?auto_13650 ?auto_13651 ) ( IN-CITY ?auto_13646 ?auto_13651 ) ( not ( = ?auto_13646 ?auto_13650 ) ) ( OBJ-AT ?auto_13649 ?auto_13650 ) ( OBJ-AT ?auto_13647 ?auto_13650 ) ( OBJ-AT ?auto_13648 ?auto_13650 ) ( TRUCK-AT ?auto_13652 ?auto_13646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13648 ?auto_13649 ?auto_13646 )
      ( DELIVER-3PKG-VERIFY ?auto_13647 ?auto_13648 ?auto_13649 ?auto_13646 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13662 - OBJ
      ?auto_13663 - OBJ
      ?auto_13664 - OBJ
      ?auto_13661 - LOCATION
    )
    :vars
    (
      ?auto_13665 - LOCATION
      ?auto_13666 - CITY
      ?auto_13667 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13663 ?auto_13662 ) ) ( not ( = ?auto_13664 ?auto_13662 ) ) ( not ( = ?auto_13664 ?auto_13663 ) ) ( IN-CITY ?auto_13665 ?auto_13666 ) ( IN-CITY ?auto_13661 ?auto_13666 ) ( not ( = ?auto_13661 ?auto_13665 ) ) ( OBJ-AT ?auto_13663 ?auto_13665 ) ( OBJ-AT ?auto_13662 ?auto_13665 ) ( OBJ-AT ?auto_13664 ?auto_13665 ) ( TRUCK-AT ?auto_13667 ?auto_13661 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13664 ?auto_13663 ?auto_13661 )
      ( DELIVER-3PKG-VERIFY ?auto_13662 ?auto_13663 ?auto_13664 ?auto_13661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13693 - OBJ
      ?auto_13694 - OBJ
      ?auto_13695 - OBJ
      ?auto_13692 - LOCATION
    )
    :vars
    (
      ?auto_13696 - LOCATION
      ?auto_13697 - CITY
      ?auto_13698 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13694 ?auto_13693 ) ) ( not ( = ?auto_13695 ?auto_13693 ) ) ( not ( = ?auto_13695 ?auto_13694 ) ) ( IN-CITY ?auto_13696 ?auto_13697 ) ( IN-CITY ?auto_13692 ?auto_13697 ) ( not ( = ?auto_13692 ?auto_13696 ) ) ( OBJ-AT ?auto_13693 ?auto_13696 ) ( OBJ-AT ?auto_13695 ?auto_13696 ) ( OBJ-AT ?auto_13694 ?auto_13696 ) ( TRUCK-AT ?auto_13698 ?auto_13692 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13694 ?auto_13693 ?auto_13692 )
      ( DELIVER-3PKG-VERIFY ?auto_13693 ?auto_13694 ?auto_13695 ?auto_13692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13708 - OBJ
      ?auto_13709 - OBJ
      ?auto_13710 - OBJ
      ?auto_13707 - LOCATION
    )
    :vars
    (
      ?auto_13711 - LOCATION
      ?auto_13712 - CITY
      ?auto_13713 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13709 ?auto_13708 ) ) ( not ( = ?auto_13710 ?auto_13708 ) ) ( not ( = ?auto_13710 ?auto_13709 ) ) ( IN-CITY ?auto_13711 ?auto_13712 ) ( IN-CITY ?auto_13707 ?auto_13712 ) ( not ( = ?auto_13707 ?auto_13711 ) ) ( OBJ-AT ?auto_13708 ?auto_13711 ) ( OBJ-AT ?auto_13709 ?auto_13711 ) ( OBJ-AT ?auto_13710 ?auto_13711 ) ( TRUCK-AT ?auto_13713 ?auto_13707 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13710 ?auto_13708 ?auto_13707 )
      ( DELIVER-3PKG-VERIFY ?auto_13708 ?auto_13709 ?auto_13710 ?auto_13707 ) )
  )

)

