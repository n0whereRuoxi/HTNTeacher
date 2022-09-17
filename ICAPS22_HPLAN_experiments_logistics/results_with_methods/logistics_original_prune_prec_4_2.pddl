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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_156143 - OBJ
      ?auto_156144 - LOCATION
    )
    :vars
    (
      ?auto_156145 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_156145 ?auto_156144 ) ( IN-TRUCK ?auto_156143 ?auto_156145 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_156143 ?auto_156145 ?auto_156144 )
      ( DELIVER-1PKG-VERIFY ?auto_156143 ?auto_156144 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_156169 - OBJ
      ?auto_156170 - LOCATION
    )
    :vars
    (
      ?auto_156173 - TRUCK
      ?auto_156175 - LOCATION
      ?auto_156176 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_156169 ?auto_156173 ) ( TRUCK-AT ?auto_156173 ?auto_156175 ) ( IN-CITY ?auto_156175 ?auto_156176 ) ( IN-CITY ?auto_156170 ?auto_156176 ) ( not ( = ?auto_156170 ?auto_156175 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_156173 ?auto_156175 ?auto_156170 ?auto_156176 )
      ( DELIVER-1PKG ?auto_156169 ?auto_156170 )
      ( DELIVER-1PKG-VERIFY ?auto_156169 ?auto_156170 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_156205 - OBJ
      ?auto_156206 - LOCATION
    )
    :vars
    (
      ?auto_156210 - TRUCK
      ?auto_156209 - LOCATION
      ?auto_156211 - CITY
      ?auto_156213 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_156210 ?auto_156209 ) ( IN-CITY ?auto_156209 ?auto_156211 ) ( IN-CITY ?auto_156206 ?auto_156211 ) ( not ( = ?auto_156206 ?auto_156209 ) ) ( TRUCK-AT ?auto_156210 ?auto_156213 ) ( OBJ-AT ?auto_156205 ?auto_156213 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_156205 ?auto_156210 ?auto_156213 )
      ( DELIVER-1PKG ?auto_156205 ?auto_156206 )
      ( DELIVER-1PKG-VERIFY ?auto_156205 ?auto_156206 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_156245 - OBJ
      ?auto_156246 - LOCATION
    )
    :vars
    (
      ?auto_156251 - LOCATION
      ?auto_156247 - CITY
      ?auto_156249 - TRUCK
      ?auto_156254 - LOCATION
      ?auto_156255 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_156251 ?auto_156247 ) ( IN-CITY ?auto_156246 ?auto_156247 ) ( not ( = ?auto_156246 ?auto_156251 ) ) ( OBJ-AT ?auto_156245 ?auto_156251 ) ( TRUCK-AT ?auto_156249 ?auto_156254 ) ( IN-CITY ?auto_156254 ?auto_156255 ) ( IN-CITY ?auto_156251 ?auto_156255 ) ( not ( = ?auto_156251 ?auto_156254 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_156249 ?auto_156254 ?auto_156251 ?auto_156255 )
      ( DELIVER-1PKG ?auto_156245 ?auto_156246 )
      ( DELIVER-1PKG-VERIFY ?auto_156245 ?auto_156246 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156409 - OBJ
      ?auto_156411 - OBJ
      ?auto_156410 - LOCATION
    )
    :vars
    (
      ?auto_156412 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_156411 ?auto_156409 ) ( TRUCK-AT ?auto_156412 ?auto_156410 ) ( IN-TRUCK ?auto_156411 ?auto_156412 ) ( OBJ-AT ?auto_156409 ?auto_156410 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156411 ?auto_156410 )
      ( DELIVER-2PKG-VERIFY ?auto_156409 ?auto_156411 ?auto_156410 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156605 - OBJ
      ?auto_156607 - OBJ
      ?auto_156606 - LOCATION
    )
    :vars
    (
      ?auto_156610 - TRUCK
      ?auto_156612 - LOCATION
      ?auto_156611 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_156607 ?auto_156605 ) ( IN-TRUCK ?auto_156607 ?auto_156610 ) ( TRUCK-AT ?auto_156610 ?auto_156612 ) ( IN-CITY ?auto_156612 ?auto_156611 ) ( IN-CITY ?auto_156606 ?auto_156611 ) ( not ( = ?auto_156606 ?auto_156612 ) ) ( OBJ-AT ?auto_156605 ?auto_156606 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156607 ?auto_156606 )
      ( DELIVER-2PKG-VERIFY ?auto_156605 ?auto_156607 ?auto_156606 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_156866 - OBJ
      ?auto_156867 - LOCATION
    )
    :vars
    (
      ?auto_156873 - OBJ
      ?auto_156872 - TRUCK
      ?auto_156868 - LOCATION
      ?auto_156870 - CITY
      ?auto_156875 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_156866 ?auto_156873 ) ( TRUCK-AT ?auto_156872 ?auto_156868 ) ( IN-CITY ?auto_156868 ?auto_156870 ) ( IN-CITY ?auto_156867 ?auto_156870 ) ( not ( = ?auto_156867 ?auto_156868 ) ) ( OBJ-AT ?auto_156873 ?auto_156867 ) ( TRUCK-AT ?auto_156872 ?auto_156875 ) ( OBJ-AT ?auto_156866 ?auto_156875 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_156866 ?auto_156872 ?auto_156875 )
      ( DELIVER-2PKG ?auto_156873 ?auto_156866 ?auto_156867 )
      ( DELIVER-1PKG-VERIFY ?auto_156866 ?auto_156867 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156877 - OBJ
      ?auto_156879 - OBJ
      ?auto_156878 - LOCATION
    )
    :vars
    (
      ?auto_156885 - OBJ
      ?auto_156886 - TRUCK
      ?auto_156883 - LOCATION
      ?auto_156884 - CITY
      ?auto_156881 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_156879 ?auto_156877 ) ( GREATER-THAN ?auto_156879 ?auto_156885 ) ( TRUCK-AT ?auto_156886 ?auto_156883 ) ( IN-CITY ?auto_156883 ?auto_156884 ) ( IN-CITY ?auto_156878 ?auto_156884 ) ( not ( = ?auto_156878 ?auto_156883 ) ) ( OBJ-AT ?auto_156885 ?auto_156878 ) ( TRUCK-AT ?auto_156886 ?auto_156881 ) ( OBJ-AT ?auto_156879 ?auto_156881 ) ( OBJ-AT ?auto_156877 ?auto_156878 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156879 ?auto_156878 )
      ( DELIVER-2PKG-VERIFY ?auto_156877 ?auto_156879 ?auto_156878 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_157188 - OBJ
      ?auto_157189 - LOCATION
    )
    :vars
    (
      ?auto_157193 - OBJ
      ?auto_157197 - OBJ
      ?auto_157196 - LOCATION
      ?auto_157191 - CITY
      ?auto_157190 - TRUCK
      ?auto_157199 - LOCATION
      ?auto_157200 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_157188 ?auto_157193 ) ( GREATER-THAN ?auto_157188 ?auto_157197 ) ( IN-CITY ?auto_157196 ?auto_157191 ) ( IN-CITY ?auto_157189 ?auto_157191 ) ( not ( = ?auto_157189 ?auto_157196 ) ) ( OBJ-AT ?auto_157197 ?auto_157189 ) ( OBJ-AT ?auto_157188 ?auto_157196 ) ( OBJ-AT ?auto_157193 ?auto_157189 ) ( TRUCK-AT ?auto_157190 ?auto_157199 ) ( IN-CITY ?auto_157199 ?auto_157200 ) ( IN-CITY ?auto_157196 ?auto_157200 ) ( not ( = ?auto_157196 ?auto_157199 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_157190 ?auto_157199 ?auto_157196 ?auto_157200 )
      ( DELIVER-2PKG ?auto_157193 ?auto_157188 ?auto_157189 )
      ( DELIVER-1PKG-VERIFY ?auto_157188 ?auto_157189 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_157202 - OBJ
      ?auto_157204 - OBJ
      ?auto_157203 - LOCATION
    )
    :vars
    (
      ?auto_157210 - OBJ
      ?auto_157209 - OBJ
      ?auto_157212 - LOCATION
      ?auto_157205 - CITY
      ?auto_157206 - TRUCK
      ?auto_157208 - LOCATION
      ?auto_157207 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_157204 ?auto_157202 ) ( GREATER-THAN ?auto_157204 ?auto_157210 ) ( GREATER-THAN ?auto_157204 ?auto_157209 ) ( IN-CITY ?auto_157212 ?auto_157205 ) ( IN-CITY ?auto_157203 ?auto_157205 ) ( not ( = ?auto_157203 ?auto_157212 ) ) ( OBJ-AT ?auto_157209 ?auto_157203 ) ( OBJ-AT ?auto_157204 ?auto_157212 ) ( OBJ-AT ?auto_157210 ?auto_157203 ) ( TRUCK-AT ?auto_157206 ?auto_157208 ) ( IN-CITY ?auto_157208 ?auto_157207 ) ( IN-CITY ?auto_157212 ?auto_157207 ) ( not ( = ?auto_157212 ?auto_157208 ) ) ( OBJ-AT ?auto_157202 ?auto_157203 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_157204 ?auto_157203 )
      ( DELIVER-2PKG-VERIFY ?auto_157202 ?auto_157204 ?auto_157203 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_157563 - OBJ
      ?auto_157564 - LOCATION
    )
    :vars
    (
      ?auto_157566 - OBJ
      ?auto_157567 - LOCATION
      ?auto_157571 - CITY
      ?auto_157569 - TRUCK
      ?auto_157573 - LOCATION
      ?auto_157568 - CITY
      ?auto_157577 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_157563 ?auto_157566 ) ( IN-CITY ?auto_157567 ?auto_157571 ) ( IN-CITY ?auto_157564 ?auto_157571 ) ( not ( = ?auto_157564 ?auto_157567 ) ) ( OBJ-AT ?auto_157563 ?auto_157567 ) ( TRUCK-AT ?auto_157569 ?auto_157573 ) ( IN-CITY ?auto_157573 ?auto_157568 ) ( IN-CITY ?auto_157567 ?auto_157568 ) ( not ( = ?auto_157567 ?auto_157573 ) ) ( TRUCK-AT ?auto_157577 ?auto_157564 ) ( IN-TRUCK ?auto_157566 ?auto_157577 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_157566 ?auto_157564 )
      ( DELIVER-2PKG ?auto_157566 ?auto_157563 ?auto_157564 )
      ( DELIVER-1PKG-VERIFY ?auto_157563 ?auto_157564 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_157578 - OBJ
      ?auto_157580 - OBJ
      ?auto_157579 - LOCATION
    )
    :vars
    (
      ?auto_157585 - LOCATION
      ?auto_157588 - CITY
      ?auto_157587 - TRUCK
      ?auto_157589 - LOCATION
      ?auto_157586 - CITY
      ?auto_157584 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_157580 ?auto_157578 ) ( IN-CITY ?auto_157585 ?auto_157588 ) ( IN-CITY ?auto_157579 ?auto_157588 ) ( not ( = ?auto_157579 ?auto_157585 ) ) ( OBJ-AT ?auto_157580 ?auto_157585 ) ( TRUCK-AT ?auto_157587 ?auto_157589 ) ( IN-CITY ?auto_157589 ?auto_157586 ) ( IN-CITY ?auto_157585 ?auto_157586 ) ( not ( = ?auto_157585 ?auto_157589 ) ) ( TRUCK-AT ?auto_157584 ?auto_157579 ) ( IN-TRUCK ?auto_157578 ?auto_157584 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_157580 ?auto_157579 )
      ( DELIVER-2PKG-VERIFY ?auto_157578 ?auto_157580 ?auto_157579 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_157915 - OBJ
      ?auto_157916 - LOCATION
    )
    :vars
    (
      ?auto_157923 - OBJ
      ?auto_157921 - LOCATION
      ?auto_157920 - CITY
      ?auto_157924 - CITY
      ?auto_157918 - TRUCK
      ?auto_157927 - LOCATION
      ?auto_157928 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_157915 ?auto_157923 ) ( IN-CITY ?auto_157921 ?auto_157920 ) ( IN-CITY ?auto_157916 ?auto_157920 ) ( not ( = ?auto_157916 ?auto_157921 ) ) ( OBJ-AT ?auto_157915 ?auto_157921 ) ( IN-CITY ?auto_157916 ?auto_157924 ) ( IN-CITY ?auto_157921 ?auto_157924 ) ( IN-TRUCK ?auto_157923 ?auto_157918 ) ( TRUCK-AT ?auto_157918 ?auto_157927 ) ( IN-CITY ?auto_157927 ?auto_157928 ) ( IN-CITY ?auto_157916 ?auto_157928 ) ( not ( = ?auto_157916 ?auto_157927 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_157918 ?auto_157927 ?auto_157916 ?auto_157928 )
      ( DELIVER-2PKG ?auto_157923 ?auto_157915 ?auto_157916 )
      ( DELIVER-1PKG-VERIFY ?auto_157915 ?auto_157916 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_157930 - OBJ
      ?auto_157932 - OBJ
      ?auto_157931 - LOCATION
    )
    :vars
    (
      ?auto_157937 - LOCATION
      ?auto_157933 - CITY
      ?auto_157941 - CITY
      ?auto_157935 - TRUCK
      ?auto_157940 - LOCATION
      ?auto_157939 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_157932 ?auto_157930 ) ( IN-CITY ?auto_157937 ?auto_157933 ) ( IN-CITY ?auto_157931 ?auto_157933 ) ( not ( = ?auto_157931 ?auto_157937 ) ) ( OBJ-AT ?auto_157932 ?auto_157937 ) ( IN-CITY ?auto_157931 ?auto_157941 ) ( IN-CITY ?auto_157937 ?auto_157941 ) ( IN-TRUCK ?auto_157930 ?auto_157935 ) ( TRUCK-AT ?auto_157935 ?auto_157940 ) ( IN-CITY ?auto_157940 ?auto_157939 ) ( IN-CITY ?auto_157931 ?auto_157939 ) ( not ( = ?auto_157931 ?auto_157940 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_157932 ?auto_157931 )
      ( DELIVER-2PKG-VERIFY ?auto_157930 ?auto_157932 ?auto_157931 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_158267 - OBJ
      ?auto_158268 - LOCATION
    )
    :vars
    (
      ?auto_158274 - OBJ
      ?auto_158273 - LOCATION
      ?auto_158275 - CITY
      ?auto_158269 - CITY
      ?auto_158271 - TRUCK
      ?auto_158276 - LOCATION
      ?auto_158270 - CITY
      ?auto_158279 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_158267 ?auto_158274 ) ( IN-CITY ?auto_158273 ?auto_158275 ) ( IN-CITY ?auto_158268 ?auto_158275 ) ( not ( = ?auto_158268 ?auto_158273 ) ) ( OBJ-AT ?auto_158267 ?auto_158273 ) ( IN-CITY ?auto_158268 ?auto_158269 ) ( IN-CITY ?auto_158273 ?auto_158269 ) ( TRUCK-AT ?auto_158271 ?auto_158276 ) ( IN-CITY ?auto_158276 ?auto_158270 ) ( IN-CITY ?auto_158268 ?auto_158270 ) ( not ( = ?auto_158268 ?auto_158276 ) ) ( TRUCK-AT ?auto_158271 ?auto_158279 ) ( OBJ-AT ?auto_158274 ?auto_158279 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_158274 ?auto_158271 ?auto_158279 )
      ( DELIVER-2PKG ?auto_158274 ?auto_158267 ?auto_158268 )
      ( DELIVER-1PKG-VERIFY ?auto_158267 ?auto_158268 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_158281 - OBJ
      ?auto_158283 - OBJ
      ?auto_158282 - LOCATION
    )
    :vars
    (
      ?auto_158293 - LOCATION
      ?auto_158290 - CITY
      ?auto_158284 - CITY
      ?auto_158289 - TRUCK
      ?auto_158292 - LOCATION
      ?auto_158285 - CITY
      ?auto_158286 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_158283 ?auto_158281 ) ( IN-CITY ?auto_158293 ?auto_158290 ) ( IN-CITY ?auto_158282 ?auto_158290 ) ( not ( = ?auto_158282 ?auto_158293 ) ) ( OBJ-AT ?auto_158283 ?auto_158293 ) ( IN-CITY ?auto_158282 ?auto_158284 ) ( IN-CITY ?auto_158293 ?auto_158284 ) ( TRUCK-AT ?auto_158289 ?auto_158292 ) ( IN-CITY ?auto_158292 ?auto_158285 ) ( IN-CITY ?auto_158282 ?auto_158285 ) ( not ( = ?auto_158282 ?auto_158292 ) ) ( TRUCK-AT ?auto_158289 ?auto_158286 ) ( OBJ-AT ?auto_158281 ?auto_158286 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_158283 ?auto_158282 )
      ( DELIVER-2PKG-VERIFY ?auto_158281 ?auto_158283 ?auto_158282 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159389 - OBJ
      ?auto_159391 - OBJ
      ?auto_159392 - OBJ
      ?auto_159390 - LOCATION
    )
    :vars
    (
      ?auto_159394 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_159391 ?auto_159389 ) ( GREATER-THAN ?auto_159392 ?auto_159389 ) ( GREATER-THAN ?auto_159392 ?auto_159391 ) ( TRUCK-AT ?auto_159394 ?auto_159390 ) ( IN-TRUCK ?auto_159392 ?auto_159394 ) ( OBJ-AT ?auto_159389 ?auto_159390 ) ( OBJ-AT ?auto_159391 ?auto_159390 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_159392 ?auto_159390 )
      ( DELIVER-3PKG-VERIFY ?auto_159389 ?auto_159391 ?auto_159392 ?auto_159390 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_160092 - OBJ
      ?auto_160094 - OBJ
      ?auto_160095 - OBJ
      ?auto_160093 - LOCATION
    )
    :vars
    (
      ?auto_160096 - OBJ
      ?auto_160098 - TRUCK
      ?auto_160100 - LOCATION
      ?auto_160099 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_160094 ?auto_160092 ) ( GREATER-THAN ?auto_160095 ?auto_160092 ) ( GREATER-THAN ?auto_160095 ?auto_160094 ) ( GREATER-THAN ?auto_160095 ?auto_160096 ) ( IN-TRUCK ?auto_160095 ?auto_160098 ) ( TRUCK-AT ?auto_160098 ?auto_160100 ) ( IN-CITY ?auto_160100 ?auto_160099 ) ( IN-CITY ?auto_160093 ?auto_160099 ) ( not ( = ?auto_160093 ?auto_160100 ) ) ( OBJ-AT ?auto_160096 ?auto_160093 ) ( OBJ-AT ?auto_160092 ?auto_160093 ) ( OBJ-AT ?auto_160094 ?auto_160093 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160096 ?auto_160095 ?auto_160093 )
      ( DELIVER-3PKG-VERIFY ?auto_160092 ?auto_160094 ?auto_160095 ?auto_160093 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161056 - OBJ
      ?auto_161058 - OBJ
      ?auto_161059 - OBJ
      ?auto_161057 - LOCATION
    )
    :vars
    (
      ?auto_161065 - OBJ
      ?auto_161060 - OBJ
      ?auto_161061 - TRUCK
      ?auto_161067 - LOCATION
      ?auto_161063 - CITY
      ?auto_161064 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_161058 ?auto_161056 ) ( GREATER-THAN ?auto_161059 ?auto_161056 ) ( GREATER-THAN ?auto_161059 ?auto_161058 ) ( GREATER-THAN ?auto_161059 ?auto_161065 ) ( GREATER-THAN ?auto_161059 ?auto_161060 ) ( TRUCK-AT ?auto_161061 ?auto_161067 ) ( IN-CITY ?auto_161067 ?auto_161063 ) ( IN-CITY ?auto_161057 ?auto_161063 ) ( not ( = ?auto_161057 ?auto_161067 ) ) ( OBJ-AT ?auto_161060 ?auto_161057 ) ( TRUCK-AT ?auto_161061 ?auto_161064 ) ( OBJ-AT ?auto_161059 ?auto_161064 ) ( OBJ-AT ?auto_161065 ?auto_161057 ) ( OBJ-AT ?auto_161056 ?auto_161057 ) ( OBJ-AT ?auto_161058 ?auto_161057 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161065 ?auto_161059 ?auto_161057 )
      ( DELIVER-3PKG-VERIFY ?auto_161056 ?auto_161058 ?auto_161059 ?auto_161057 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_162199 - OBJ
      ?auto_162201 - OBJ
      ?auto_162202 - OBJ
      ?auto_162200 - LOCATION
    )
    :vars
    (
      ?auto_162204 - OBJ
      ?auto_162206 - OBJ
      ?auto_162208 - OBJ
      ?auto_162207 - LOCATION
      ?auto_162212 - CITY
      ?auto_162211 - TRUCK
      ?auto_162210 - LOCATION
      ?auto_162209 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_162201 ?auto_162199 ) ( GREATER-THAN ?auto_162202 ?auto_162199 ) ( GREATER-THAN ?auto_162202 ?auto_162201 ) ( GREATER-THAN ?auto_162202 ?auto_162204 ) ( GREATER-THAN ?auto_162202 ?auto_162206 ) ( GREATER-THAN ?auto_162202 ?auto_162208 ) ( IN-CITY ?auto_162207 ?auto_162212 ) ( IN-CITY ?auto_162200 ?auto_162212 ) ( not ( = ?auto_162200 ?auto_162207 ) ) ( OBJ-AT ?auto_162208 ?auto_162200 ) ( OBJ-AT ?auto_162202 ?auto_162207 ) ( OBJ-AT ?auto_162206 ?auto_162200 ) ( TRUCK-AT ?auto_162211 ?auto_162210 ) ( IN-CITY ?auto_162210 ?auto_162209 ) ( IN-CITY ?auto_162207 ?auto_162209 ) ( not ( = ?auto_162207 ?auto_162210 ) ) ( OBJ-AT ?auto_162204 ?auto_162200 ) ( OBJ-AT ?auto_162199 ?auto_162200 ) ( OBJ-AT ?auto_162201 ?auto_162200 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162204 ?auto_162202 ?auto_162200 )
      ( DELIVER-3PKG-VERIFY ?auto_162199 ?auto_162201 ?auto_162202 ?auto_162200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174437 - OBJ
      ?auto_174439 - OBJ
      ?auto_174440 - OBJ
      ?auto_174441 - OBJ
      ?auto_174438 - LOCATION
    )
    :vars
    (
      ?auto_174443 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_174439 ?auto_174437 ) ( GREATER-THAN ?auto_174440 ?auto_174437 ) ( GREATER-THAN ?auto_174440 ?auto_174439 ) ( GREATER-THAN ?auto_174441 ?auto_174437 ) ( GREATER-THAN ?auto_174441 ?auto_174439 ) ( GREATER-THAN ?auto_174441 ?auto_174440 ) ( TRUCK-AT ?auto_174443 ?auto_174438 ) ( IN-TRUCK ?auto_174441 ?auto_174443 ) ( OBJ-AT ?auto_174437 ?auto_174438 ) ( OBJ-AT ?auto_174439 ?auto_174438 ) ( OBJ-AT ?auto_174440 ?auto_174438 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174441 ?auto_174438 )
      ( DELIVER-4PKG-VERIFY ?auto_174437 ?auto_174439 ?auto_174440 ?auto_174441 ?auto_174438 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176281 - OBJ
      ?auto_176283 - OBJ
      ?auto_176284 - OBJ
      ?auto_176285 - OBJ
      ?auto_176282 - LOCATION
    )
    :vars
    (
      ?auto_176289 - OBJ
      ?auto_176287 - TRUCK
      ?auto_176286 - LOCATION
      ?auto_176291 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_176283 ?auto_176281 ) ( GREATER-THAN ?auto_176284 ?auto_176281 ) ( GREATER-THAN ?auto_176284 ?auto_176283 ) ( GREATER-THAN ?auto_176285 ?auto_176281 ) ( GREATER-THAN ?auto_176285 ?auto_176283 ) ( GREATER-THAN ?auto_176285 ?auto_176284 ) ( GREATER-THAN ?auto_176285 ?auto_176289 ) ( IN-TRUCK ?auto_176285 ?auto_176287 ) ( TRUCK-AT ?auto_176287 ?auto_176286 ) ( IN-CITY ?auto_176286 ?auto_176291 ) ( IN-CITY ?auto_176282 ?auto_176291 ) ( not ( = ?auto_176282 ?auto_176286 ) ) ( OBJ-AT ?auto_176289 ?auto_176282 ) ( OBJ-AT ?auto_176281 ?auto_176282 ) ( OBJ-AT ?auto_176283 ?auto_176282 ) ( OBJ-AT ?auto_176284 ?auto_176282 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176289 ?auto_176285 ?auto_176282 )
      ( DELIVER-4PKG-VERIFY ?auto_176281 ?auto_176283 ?auto_176284 ?auto_176285 ?auto_176282 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178723 - OBJ
      ?auto_178725 - OBJ
      ?auto_178726 - OBJ
      ?auto_178727 - OBJ
      ?auto_178724 - LOCATION
    )
    :vars
    (
      ?auto_178729 - OBJ
      ?auto_178731 - OBJ
      ?auto_178730 - TRUCK
      ?auto_178734 - LOCATION
      ?auto_178735 - CITY
      ?auto_178733 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_178725 ?auto_178723 ) ( GREATER-THAN ?auto_178726 ?auto_178723 ) ( GREATER-THAN ?auto_178726 ?auto_178725 ) ( GREATER-THAN ?auto_178727 ?auto_178723 ) ( GREATER-THAN ?auto_178727 ?auto_178725 ) ( GREATER-THAN ?auto_178727 ?auto_178726 ) ( GREATER-THAN ?auto_178727 ?auto_178729 ) ( GREATER-THAN ?auto_178727 ?auto_178731 ) ( TRUCK-AT ?auto_178730 ?auto_178734 ) ( IN-CITY ?auto_178734 ?auto_178735 ) ( IN-CITY ?auto_178724 ?auto_178735 ) ( not ( = ?auto_178724 ?auto_178734 ) ) ( OBJ-AT ?auto_178731 ?auto_178724 ) ( TRUCK-AT ?auto_178730 ?auto_178733 ) ( OBJ-AT ?auto_178727 ?auto_178733 ) ( OBJ-AT ?auto_178729 ?auto_178724 ) ( OBJ-AT ?auto_178723 ?auto_178724 ) ( OBJ-AT ?auto_178725 ?auto_178724 ) ( OBJ-AT ?auto_178726 ?auto_178724 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178729 ?auto_178727 ?auto_178724 )
      ( DELIVER-4PKG-VERIFY ?auto_178723 ?auto_178725 ?auto_178726 ?auto_178727 ?auto_178724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181598 - OBJ
      ?auto_181600 - OBJ
      ?auto_181601 - OBJ
      ?auto_181602 - OBJ
      ?auto_181599 - LOCATION
    )
    :vars
    (
      ?auto_181607 - OBJ
      ?auto_181610 - OBJ
      ?auto_181603 - OBJ
      ?auto_181609 - LOCATION
      ?auto_181612 - CITY
      ?auto_181605 - TRUCK
      ?auto_181604 - LOCATION
      ?auto_181611 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_181600 ?auto_181598 ) ( GREATER-THAN ?auto_181601 ?auto_181598 ) ( GREATER-THAN ?auto_181601 ?auto_181600 ) ( GREATER-THAN ?auto_181602 ?auto_181598 ) ( GREATER-THAN ?auto_181602 ?auto_181600 ) ( GREATER-THAN ?auto_181602 ?auto_181601 ) ( GREATER-THAN ?auto_181602 ?auto_181607 ) ( GREATER-THAN ?auto_181602 ?auto_181610 ) ( GREATER-THAN ?auto_181602 ?auto_181603 ) ( IN-CITY ?auto_181609 ?auto_181612 ) ( IN-CITY ?auto_181599 ?auto_181612 ) ( not ( = ?auto_181599 ?auto_181609 ) ) ( OBJ-AT ?auto_181603 ?auto_181599 ) ( OBJ-AT ?auto_181602 ?auto_181609 ) ( OBJ-AT ?auto_181610 ?auto_181599 ) ( TRUCK-AT ?auto_181605 ?auto_181604 ) ( IN-CITY ?auto_181604 ?auto_181611 ) ( IN-CITY ?auto_181609 ?auto_181611 ) ( not ( = ?auto_181609 ?auto_181604 ) ) ( OBJ-AT ?auto_181607 ?auto_181599 ) ( OBJ-AT ?auto_181598 ?auto_181599 ) ( OBJ-AT ?auto_181600 ?auto_181599 ) ( OBJ-AT ?auto_181601 ?auto_181599 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181607 ?auto_181602 ?auto_181599 )
      ( DELIVER-4PKG-VERIFY ?auto_181598 ?auto_181600 ?auto_181601 ?auto_181602 ?auto_181599 ) )
  )

)

