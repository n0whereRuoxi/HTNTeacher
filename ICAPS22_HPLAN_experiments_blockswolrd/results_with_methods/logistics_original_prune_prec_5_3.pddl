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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2251499 - OBJ
      ?auto_2251498 - LOCATION
    )
    :vars
    (
      ?auto_2251500 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2251500 ?auto_2251498 ) ( IN-TRUCK ?auto_2251499 ?auto_2251500 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2251499 ?auto_2251500 ?auto_2251498 )
      ( DELIVER-1PKG-VERIFY ?auto_2251499 ?auto_2251498 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2251524 - OBJ
      ?auto_2251523 - LOCATION
    )
    :vars
    (
      ?auto_2251525 - TRUCK
      ?auto_2251526 - LOCATION
      ?auto_2251527 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2251524 ?auto_2251525 ) ( TRUCK-AT ?auto_2251525 ?auto_2251526 ) ( IN-CITY ?auto_2251526 ?auto_2251527 ) ( IN-CITY ?auto_2251523 ?auto_2251527 ) ( not ( = ?auto_2251523 ?auto_2251526 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2251525 ?auto_2251526 ?auto_2251523 ?auto_2251527 )
      ( DELIVER-1PKG ?auto_2251524 ?auto_2251523 )
      ( DELIVER-1PKG-VERIFY ?auto_2251524 ?auto_2251523 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2251559 - OBJ
      ?auto_2251558 - LOCATION
    )
    :vars
    (
      ?auto_2251560 - TRUCK
      ?auto_2251561 - LOCATION
      ?auto_2251562 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2251560 ?auto_2251561 ) ( IN-CITY ?auto_2251561 ?auto_2251562 ) ( IN-CITY ?auto_2251558 ?auto_2251562 ) ( not ( = ?auto_2251558 ?auto_2251561 ) ) ( OBJ-AT ?auto_2251559 ?auto_2251561 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2251559 ?auto_2251560 ?auto_2251561 )
      ( DELIVER-1PKG ?auto_2251559 ?auto_2251558 )
      ( DELIVER-1PKG-VERIFY ?auto_2251559 ?auto_2251558 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2251594 - OBJ
      ?auto_2251593 - LOCATION
    )
    :vars
    (
      ?auto_2251596 - LOCATION
      ?auto_2251597 - CITY
      ?auto_2251595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2251596 ?auto_2251597 ) ( IN-CITY ?auto_2251593 ?auto_2251597 ) ( not ( = ?auto_2251593 ?auto_2251596 ) ) ( OBJ-AT ?auto_2251594 ?auto_2251596 ) ( TRUCK-AT ?auto_2251595 ?auto_2251593 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2251595 ?auto_2251593 ?auto_2251596 ?auto_2251597 )
      ( DELIVER-1PKG ?auto_2251594 ?auto_2251593 )
      ( DELIVER-1PKG-VERIFY ?auto_2251594 ?auto_2251593 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2251932 - OBJ
      ?auto_2251933 - OBJ
      ?auto_2251931 - LOCATION
    )
    :vars
    (
      ?auto_2251934 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2251933 ?auto_2251932 ) ) ( TRUCK-AT ?auto_2251934 ?auto_2251931 ) ( IN-TRUCK ?auto_2251933 ?auto_2251934 ) ( OBJ-AT ?auto_2251932 ?auto_2251931 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2251933 ?auto_2251931 )
      ( DELIVER-2PKG-VERIFY ?auto_2251932 ?auto_2251933 ?auto_2251931 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2251936 - OBJ
      ?auto_2251937 - OBJ
      ?auto_2251935 - LOCATION
    )
    :vars
    (
      ?auto_2251938 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2251937 ?auto_2251936 ) ) ( TRUCK-AT ?auto_2251938 ?auto_2251935 ) ( IN-TRUCK ?auto_2251936 ?auto_2251938 ) ( OBJ-AT ?auto_2251937 ?auto_2251935 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2251936 ?auto_2251935 )
      ( DELIVER-2PKG-VERIFY ?auto_2251936 ?auto_2251937 ?auto_2251935 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2252291 - OBJ
      ?auto_2252292 - OBJ
      ?auto_2252290 - LOCATION
    )
    :vars
    (
      ?auto_2252293 - TRUCK
      ?auto_2252294 - LOCATION
      ?auto_2252295 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2252292 ?auto_2252291 ) ) ( IN-TRUCK ?auto_2252292 ?auto_2252293 ) ( TRUCK-AT ?auto_2252293 ?auto_2252294 ) ( IN-CITY ?auto_2252294 ?auto_2252295 ) ( IN-CITY ?auto_2252290 ?auto_2252295 ) ( not ( = ?auto_2252290 ?auto_2252294 ) ) ( OBJ-AT ?auto_2252291 ?auto_2252290 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2252292 ?auto_2252290 )
      ( DELIVER-2PKG-VERIFY ?auto_2252291 ?auto_2252292 ?auto_2252290 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2252297 - OBJ
      ?auto_2252298 - OBJ
      ?auto_2252296 - LOCATION
    )
    :vars
    (
      ?auto_2252300 - TRUCK
      ?auto_2252301 - LOCATION
      ?auto_2252299 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2252298 ?auto_2252297 ) ) ( IN-TRUCK ?auto_2252297 ?auto_2252300 ) ( TRUCK-AT ?auto_2252300 ?auto_2252301 ) ( IN-CITY ?auto_2252301 ?auto_2252299 ) ( IN-CITY ?auto_2252296 ?auto_2252299 ) ( not ( = ?auto_2252296 ?auto_2252301 ) ) ( OBJ-AT ?auto_2252298 ?auto_2252296 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2252298 ?auto_2252297 ?auto_2252296 )
      ( DELIVER-2PKG-VERIFY ?auto_2252297 ?auto_2252298 ?auto_2252296 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2252761 - OBJ
      ?auto_2252760 - LOCATION
    )
    :vars
    (
      ?auto_2252765 - OBJ
      ?auto_2252763 - TRUCK
      ?auto_2252764 - LOCATION
      ?auto_2252762 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2252761 ?auto_2252765 ) ) ( TRUCK-AT ?auto_2252763 ?auto_2252764 ) ( IN-CITY ?auto_2252764 ?auto_2252762 ) ( IN-CITY ?auto_2252760 ?auto_2252762 ) ( not ( = ?auto_2252760 ?auto_2252764 ) ) ( OBJ-AT ?auto_2252765 ?auto_2252760 ) ( OBJ-AT ?auto_2252761 ?auto_2252764 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2252761 ?auto_2252763 ?auto_2252764 )
      ( DELIVER-2PKG ?auto_2252765 ?auto_2252761 ?auto_2252760 )
      ( DELIVER-1PKG-VERIFY ?auto_2252761 ?auto_2252760 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2252767 - OBJ
      ?auto_2252768 - OBJ
      ?auto_2252766 - LOCATION
    )
    :vars
    (
      ?auto_2252771 - TRUCK
      ?auto_2252770 - LOCATION
      ?auto_2252769 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2252768 ?auto_2252767 ) ) ( TRUCK-AT ?auto_2252771 ?auto_2252770 ) ( IN-CITY ?auto_2252770 ?auto_2252769 ) ( IN-CITY ?auto_2252766 ?auto_2252769 ) ( not ( = ?auto_2252766 ?auto_2252770 ) ) ( OBJ-AT ?auto_2252767 ?auto_2252766 ) ( OBJ-AT ?auto_2252768 ?auto_2252770 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2252768 ?auto_2252766 )
      ( DELIVER-2PKG-VERIFY ?auto_2252767 ?auto_2252768 ?auto_2252766 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2252773 - OBJ
      ?auto_2252774 - OBJ
      ?auto_2252772 - LOCATION
    )
    :vars
    (
      ?auto_2252777 - TRUCK
      ?auto_2252775 - LOCATION
      ?auto_2252776 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2252774 ?auto_2252773 ) ) ( TRUCK-AT ?auto_2252777 ?auto_2252775 ) ( IN-CITY ?auto_2252775 ?auto_2252776 ) ( IN-CITY ?auto_2252772 ?auto_2252776 ) ( not ( = ?auto_2252772 ?auto_2252775 ) ) ( OBJ-AT ?auto_2252774 ?auto_2252772 ) ( OBJ-AT ?auto_2252773 ?auto_2252775 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2252774 ?auto_2252773 ?auto_2252772 )
      ( DELIVER-2PKG-VERIFY ?auto_2252773 ?auto_2252774 ?auto_2252772 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2253237 - OBJ
      ?auto_2253236 - LOCATION
    )
    :vars
    (
      ?auto_2253241 - OBJ
      ?auto_2253238 - LOCATION
      ?auto_2253239 - CITY
      ?auto_2253240 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2253237 ?auto_2253241 ) ) ( IN-CITY ?auto_2253238 ?auto_2253239 ) ( IN-CITY ?auto_2253236 ?auto_2253239 ) ( not ( = ?auto_2253236 ?auto_2253238 ) ) ( OBJ-AT ?auto_2253241 ?auto_2253236 ) ( OBJ-AT ?auto_2253237 ?auto_2253238 ) ( TRUCK-AT ?auto_2253240 ?auto_2253236 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2253240 ?auto_2253236 ?auto_2253238 ?auto_2253239 )
      ( DELIVER-2PKG ?auto_2253241 ?auto_2253237 ?auto_2253236 )
      ( DELIVER-1PKG-VERIFY ?auto_2253237 ?auto_2253236 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2253243 - OBJ
      ?auto_2253244 - OBJ
      ?auto_2253242 - LOCATION
    )
    :vars
    (
      ?auto_2253246 - LOCATION
      ?auto_2253245 - CITY
      ?auto_2253247 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2253244 ?auto_2253243 ) ) ( IN-CITY ?auto_2253246 ?auto_2253245 ) ( IN-CITY ?auto_2253242 ?auto_2253245 ) ( not ( = ?auto_2253242 ?auto_2253246 ) ) ( OBJ-AT ?auto_2253243 ?auto_2253242 ) ( OBJ-AT ?auto_2253244 ?auto_2253246 ) ( TRUCK-AT ?auto_2253247 ?auto_2253242 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2253244 ?auto_2253242 )
      ( DELIVER-2PKG-VERIFY ?auto_2253243 ?auto_2253244 ?auto_2253242 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2253249 - OBJ
      ?auto_2253250 - OBJ
      ?auto_2253248 - LOCATION
    )
    :vars
    (
      ?auto_2253253 - LOCATION
      ?auto_2253251 - CITY
      ?auto_2253252 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2253250 ?auto_2253249 ) ) ( IN-CITY ?auto_2253253 ?auto_2253251 ) ( IN-CITY ?auto_2253248 ?auto_2253251 ) ( not ( = ?auto_2253248 ?auto_2253253 ) ) ( OBJ-AT ?auto_2253250 ?auto_2253248 ) ( OBJ-AT ?auto_2253249 ?auto_2253253 ) ( TRUCK-AT ?auto_2253252 ?auto_2253248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2253250 ?auto_2253249 ?auto_2253248 )
      ( DELIVER-2PKG-VERIFY ?auto_2253249 ?auto_2253250 ?auto_2253248 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2253713 - OBJ
      ?auto_2253712 - LOCATION
    )
    :vars
    (
      ?auto_2253715 - OBJ
      ?auto_2253717 - LOCATION
      ?auto_2253714 - CITY
      ?auto_2253716 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2253713 ?auto_2253715 ) ) ( IN-CITY ?auto_2253717 ?auto_2253714 ) ( IN-CITY ?auto_2253712 ?auto_2253714 ) ( not ( = ?auto_2253712 ?auto_2253717 ) ) ( OBJ-AT ?auto_2253713 ?auto_2253717 ) ( TRUCK-AT ?auto_2253716 ?auto_2253712 ) ( IN-TRUCK ?auto_2253715 ?auto_2253716 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2253715 ?auto_2253712 )
      ( DELIVER-2PKG ?auto_2253715 ?auto_2253713 ?auto_2253712 )
      ( DELIVER-1PKG-VERIFY ?auto_2253713 ?auto_2253712 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2253719 - OBJ
      ?auto_2253720 - OBJ
      ?auto_2253718 - LOCATION
    )
    :vars
    (
      ?auto_2253723 - LOCATION
      ?auto_2253721 - CITY
      ?auto_2253722 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2253720 ?auto_2253719 ) ) ( IN-CITY ?auto_2253723 ?auto_2253721 ) ( IN-CITY ?auto_2253718 ?auto_2253721 ) ( not ( = ?auto_2253718 ?auto_2253723 ) ) ( OBJ-AT ?auto_2253720 ?auto_2253723 ) ( TRUCK-AT ?auto_2253722 ?auto_2253718 ) ( IN-TRUCK ?auto_2253719 ?auto_2253722 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2253720 ?auto_2253718 )
      ( DELIVER-2PKG-VERIFY ?auto_2253719 ?auto_2253720 ?auto_2253718 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2253725 - OBJ
      ?auto_2253726 - OBJ
      ?auto_2253724 - LOCATION
    )
    :vars
    (
      ?auto_2253727 - LOCATION
      ?auto_2253729 - CITY
      ?auto_2253728 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2253726 ?auto_2253725 ) ) ( IN-CITY ?auto_2253727 ?auto_2253729 ) ( IN-CITY ?auto_2253724 ?auto_2253729 ) ( not ( = ?auto_2253724 ?auto_2253727 ) ) ( OBJ-AT ?auto_2253725 ?auto_2253727 ) ( TRUCK-AT ?auto_2253728 ?auto_2253724 ) ( IN-TRUCK ?auto_2253726 ?auto_2253728 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2253726 ?auto_2253725 ?auto_2253724 )
      ( DELIVER-2PKG-VERIFY ?auto_2253725 ?auto_2253726 ?auto_2253724 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2254189 - OBJ
      ?auto_2254188 - LOCATION
    )
    :vars
    (
      ?auto_2254191 - OBJ
      ?auto_2254190 - LOCATION
      ?auto_2254193 - CITY
      ?auto_2254192 - TRUCK
      ?auto_2254194 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2254189 ?auto_2254191 ) ) ( IN-CITY ?auto_2254190 ?auto_2254193 ) ( IN-CITY ?auto_2254188 ?auto_2254193 ) ( not ( = ?auto_2254188 ?auto_2254190 ) ) ( OBJ-AT ?auto_2254189 ?auto_2254190 ) ( IN-TRUCK ?auto_2254191 ?auto_2254192 ) ( TRUCK-AT ?auto_2254192 ?auto_2254194 ) ( IN-CITY ?auto_2254194 ?auto_2254193 ) ( not ( = ?auto_2254188 ?auto_2254194 ) ) ( not ( = ?auto_2254190 ?auto_2254194 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2254192 ?auto_2254194 ?auto_2254188 ?auto_2254193 )
      ( DELIVER-2PKG ?auto_2254191 ?auto_2254189 ?auto_2254188 )
      ( DELIVER-1PKG-VERIFY ?auto_2254189 ?auto_2254188 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2254196 - OBJ
      ?auto_2254197 - OBJ
      ?auto_2254195 - LOCATION
    )
    :vars
    (
      ?auto_2254198 - LOCATION
      ?auto_2254199 - CITY
      ?auto_2254201 - TRUCK
      ?auto_2254200 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2254197 ?auto_2254196 ) ) ( IN-CITY ?auto_2254198 ?auto_2254199 ) ( IN-CITY ?auto_2254195 ?auto_2254199 ) ( not ( = ?auto_2254195 ?auto_2254198 ) ) ( OBJ-AT ?auto_2254197 ?auto_2254198 ) ( IN-TRUCK ?auto_2254196 ?auto_2254201 ) ( TRUCK-AT ?auto_2254201 ?auto_2254200 ) ( IN-CITY ?auto_2254200 ?auto_2254199 ) ( not ( = ?auto_2254195 ?auto_2254200 ) ) ( not ( = ?auto_2254198 ?auto_2254200 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2254197 ?auto_2254195 )
      ( DELIVER-2PKG-VERIFY ?auto_2254196 ?auto_2254197 ?auto_2254195 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2254203 - OBJ
      ?auto_2254204 - OBJ
      ?auto_2254202 - LOCATION
    )
    :vars
    (
      ?auto_2254207 - LOCATION
      ?auto_2254206 - CITY
      ?auto_2254208 - TRUCK
      ?auto_2254205 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2254204 ?auto_2254203 ) ) ( IN-CITY ?auto_2254207 ?auto_2254206 ) ( IN-CITY ?auto_2254202 ?auto_2254206 ) ( not ( = ?auto_2254202 ?auto_2254207 ) ) ( OBJ-AT ?auto_2254203 ?auto_2254207 ) ( IN-TRUCK ?auto_2254204 ?auto_2254208 ) ( TRUCK-AT ?auto_2254208 ?auto_2254205 ) ( IN-CITY ?auto_2254205 ?auto_2254206 ) ( not ( = ?auto_2254202 ?auto_2254205 ) ) ( not ( = ?auto_2254207 ?auto_2254205 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2254204 ?auto_2254203 ?auto_2254202 )
      ( DELIVER-2PKG-VERIFY ?auto_2254203 ?auto_2254204 ?auto_2254202 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2254722 - OBJ
      ?auto_2254721 - LOCATION
    )
    :vars
    (
      ?auto_2254727 - OBJ
      ?auto_2254725 - LOCATION
      ?auto_2254724 - CITY
      ?auto_2254726 - TRUCK
      ?auto_2254723 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2254722 ?auto_2254727 ) ) ( IN-CITY ?auto_2254725 ?auto_2254724 ) ( IN-CITY ?auto_2254721 ?auto_2254724 ) ( not ( = ?auto_2254721 ?auto_2254725 ) ) ( OBJ-AT ?auto_2254722 ?auto_2254725 ) ( TRUCK-AT ?auto_2254726 ?auto_2254723 ) ( IN-CITY ?auto_2254723 ?auto_2254724 ) ( not ( = ?auto_2254721 ?auto_2254723 ) ) ( not ( = ?auto_2254725 ?auto_2254723 ) ) ( OBJ-AT ?auto_2254727 ?auto_2254723 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2254727 ?auto_2254726 ?auto_2254723 )
      ( DELIVER-2PKG ?auto_2254727 ?auto_2254722 ?auto_2254721 )
      ( DELIVER-1PKG-VERIFY ?auto_2254722 ?auto_2254721 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2254729 - OBJ
      ?auto_2254730 - OBJ
      ?auto_2254728 - LOCATION
    )
    :vars
    (
      ?auto_2254734 - LOCATION
      ?auto_2254731 - CITY
      ?auto_2254733 - TRUCK
      ?auto_2254732 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2254730 ?auto_2254729 ) ) ( IN-CITY ?auto_2254734 ?auto_2254731 ) ( IN-CITY ?auto_2254728 ?auto_2254731 ) ( not ( = ?auto_2254728 ?auto_2254734 ) ) ( OBJ-AT ?auto_2254730 ?auto_2254734 ) ( TRUCK-AT ?auto_2254733 ?auto_2254732 ) ( IN-CITY ?auto_2254732 ?auto_2254731 ) ( not ( = ?auto_2254728 ?auto_2254732 ) ) ( not ( = ?auto_2254734 ?auto_2254732 ) ) ( OBJ-AT ?auto_2254729 ?auto_2254732 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2254730 ?auto_2254728 )
      ( DELIVER-2PKG-VERIFY ?auto_2254729 ?auto_2254730 ?auto_2254728 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2254736 - OBJ
      ?auto_2254737 - OBJ
      ?auto_2254735 - LOCATION
    )
    :vars
    (
      ?auto_2254739 - LOCATION
      ?auto_2254741 - CITY
      ?auto_2254740 - TRUCK
      ?auto_2254738 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2254737 ?auto_2254736 ) ) ( IN-CITY ?auto_2254739 ?auto_2254741 ) ( IN-CITY ?auto_2254735 ?auto_2254741 ) ( not ( = ?auto_2254735 ?auto_2254739 ) ) ( OBJ-AT ?auto_2254736 ?auto_2254739 ) ( TRUCK-AT ?auto_2254740 ?auto_2254738 ) ( IN-CITY ?auto_2254738 ?auto_2254741 ) ( not ( = ?auto_2254735 ?auto_2254738 ) ) ( not ( = ?auto_2254739 ?auto_2254738 ) ) ( OBJ-AT ?auto_2254737 ?auto_2254738 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2254737 ?auto_2254736 ?auto_2254735 )
      ( DELIVER-2PKG-VERIFY ?auto_2254736 ?auto_2254737 ?auto_2254735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2257433 - OBJ
      ?auto_2257434 - OBJ
      ?auto_2257435 - OBJ
      ?auto_2257432 - LOCATION
    )
    :vars
    (
      ?auto_2257436 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2257434 ?auto_2257433 ) ) ( not ( = ?auto_2257435 ?auto_2257433 ) ) ( not ( = ?auto_2257435 ?auto_2257434 ) ) ( TRUCK-AT ?auto_2257436 ?auto_2257432 ) ( IN-TRUCK ?auto_2257435 ?auto_2257436 ) ( OBJ-AT ?auto_2257433 ?auto_2257432 ) ( OBJ-AT ?auto_2257434 ?auto_2257432 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2257435 ?auto_2257432 )
      ( DELIVER-3PKG-VERIFY ?auto_2257433 ?auto_2257434 ?auto_2257435 ?auto_2257432 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2257443 - OBJ
      ?auto_2257444 - OBJ
      ?auto_2257445 - OBJ
      ?auto_2257442 - LOCATION
    )
    :vars
    (
      ?auto_2257446 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2257444 ?auto_2257443 ) ) ( not ( = ?auto_2257445 ?auto_2257443 ) ) ( not ( = ?auto_2257445 ?auto_2257444 ) ) ( TRUCK-AT ?auto_2257446 ?auto_2257442 ) ( IN-TRUCK ?auto_2257444 ?auto_2257446 ) ( OBJ-AT ?auto_2257443 ?auto_2257442 ) ( OBJ-AT ?auto_2257445 ?auto_2257442 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2257444 ?auto_2257442 )
      ( DELIVER-3PKG-VERIFY ?auto_2257443 ?auto_2257444 ?auto_2257445 ?auto_2257442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2257481 - OBJ
      ?auto_2257482 - OBJ
      ?auto_2257483 - OBJ
      ?auto_2257480 - LOCATION
    )
    :vars
    (
      ?auto_2257484 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2257482 ?auto_2257481 ) ) ( not ( = ?auto_2257483 ?auto_2257481 ) ) ( not ( = ?auto_2257483 ?auto_2257482 ) ) ( TRUCK-AT ?auto_2257484 ?auto_2257480 ) ( IN-TRUCK ?auto_2257481 ?auto_2257484 ) ( OBJ-AT ?auto_2257482 ?auto_2257480 ) ( OBJ-AT ?auto_2257483 ?auto_2257480 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2257481 ?auto_2257480 )
      ( DELIVER-3PKG-VERIFY ?auto_2257481 ?auto_2257482 ?auto_2257483 ?auto_2257480 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2259424 - OBJ
      ?auto_2259425 - OBJ
      ?auto_2259426 - OBJ
      ?auto_2259423 - LOCATION
    )
    :vars
    (
      ?auto_2259428 - TRUCK
      ?auto_2259429 - LOCATION
      ?auto_2259427 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2259425 ?auto_2259424 ) ) ( not ( = ?auto_2259426 ?auto_2259424 ) ) ( not ( = ?auto_2259426 ?auto_2259425 ) ) ( IN-TRUCK ?auto_2259426 ?auto_2259428 ) ( TRUCK-AT ?auto_2259428 ?auto_2259429 ) ( IN-CITY ?auto_2259429 ?auto_2259427 ) ( IN-CITY ?auto_2259423 ?auto_2259427 ) ( not ( = ?auto_2259423 ?auto_2259429 ) ) ( OBJ-AT ?auto_2259424 ?auto_2259423 ) ( OBJ-AT ?auto_2259425 ?auto_2259423 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2259424 ?auto_2259426 ?auto_2259423 )
      ( DELIVER-3PKG-VERIFY ?auto_2259424 ?auto_2259425 ?auto_2259426 ?auto_2259423 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2259438 - OBJ
      ?auto_2259439 - OBJ
      ?auto_2259440 - OBJ
      ?auto_2259437 - LOCATION
    )
    :vars
    (
      ?auto_2259442 - TRUCK
      ?auto_2259443 - LOCATION
      ?auto_2259441 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2259439 ?auto_2259438 ) ) ( not ( = ?auto_2259440 ?auto_2259438 ) ) ( not ( = ?auto_2259440 ?auto_2259439 ) ) ( IN-TRUCK ?auto_2259439 ?auto_2259442 ) ( TRUCK-AT ?auto_2259442 ?auto_2259443 ) ( IN-CITY ?auto_2259443 ?auto_2259441 ) ( IN-CITY ?auto_2259437 ?auto_2259441 ) ( not ( = ?auto_2259437 ?auto_2259443 ) ) ( OBJ-AT ?auto_2259438 ?auto_2259437 ) ( OBJ-AT ?auto_2259440 ?auto_2259437 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2259438 ?auto_2259439 ?auto_2259437 )
      ( DELIVER-3PKG-VERIFY ?auto_2259438 ?auto_2259439 ?auto_2259440 ?auto_2259437 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2259491 - OBJ
      ?auto_2259492 - OBJ
      ?auto_2259493 - OBJ
      ?auto_2259490 - LOCATION
    )
    :vars
    (
      ?auto_2259495 - TRUCK
      ?auto_2259496 - LOCATION
      ?auto_2259494 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2259492 ?auto_2259491 ) ) ( not ( = ?auto_2259493 ?auto_2259491 ) ) ( not ( = ?auto_2259493 ?auto_2259492 ) ) ( IN-TRUCK ?auto_2259491 ?auto_2259495 ) ( TRUCK-AT ?auto_2259495 ?auto_2259496 ) ( IN-CITY ?auto_2259496 ?auto_2259494 ) ( IN-CITY ?auto_2259490 ?auto_2259494 ) ( not ( = ?auto_2259490 ?auto_2259496 ) ) ( OBJ-AT ?auto_2259492 ?auto_2259490 ) ( OBJ-AT ?auto_2259493 ?auto_2259490 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2259492 ?auto_2259491 ?auto_2259490 )
      ( DELIVER-3PKG-VERIFY ?auto_2259491 ?auto_2259492 ?auto_2259493 ?auto_2259490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2262051 - OBJ
      ?auto_2262052 - OBJ
      ?auto_2262053 - OBJ
      ?auto_2262050 - LOCATION
    )
    :vars
    (
      ?auto_2262055 - TRUCK
      ?auto_2262054 - LOCATION
      ?auto_2262056 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2262052 ?auto_2262051 ) ) ( not ( = ?auto_2262053 ?auto_2262051 ) ) ( not ( = ?auto_2262053 ?auto_2262052 ) ) ( TRUCK-AT ?auto_2262055 ?auto_2262054 ) ( IN-CITY ?auto_2262054 ?auto_2262056 ) ( IN-CITY ?auto_2262050 ?auto_2262056 ) ( not ( = ?auto_2262050 ?auto_2262054 ) ) ( OBJ-AT ?auto_2262051 ?auto_2262050 ) ( OBJ-AT ?auto_2262053 ?auto_2262054 ) ( OBJ-AT ?auto_2262052 ?auto_2262050 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2262051 ?auto_2262053 ?auto_2262050 )
      ( DELIVER-3PKG-VERIFY ?auto_2262051 ?auto_2262052 ?auto_2262053 ?auto_2262050 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2262065 - OBJ
      ?auto_2262066 - OBJ
      ?auto_2262067 - OBJ
      ?auto_2262064 - LOCATION
    )
    :vars
    (
      ?auto_2262069 - TRUCK
      ?auto_2262068 - LOCATION
      ?auto_2262070 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2262066 ?auto_2262065 ) ) ( not ( = ?auto_2262067 ?auto_2262065 ) ) ( not ( = ?auto_2262067 ?auto_2262066 ) ) ( TRUCK-AT ?auto_2262069 ?auto_2262068 ) ( IN-CITY ?auto_2262068 ?auto_2262070 ) ( IN-CITY ?auto_2262064 ?auto_2262070 ) ( not ( = ?auto_2262064 ?auto_2262068 ) ) ( OBJ-AT ?auto_2262065 ?auto_2262064 ) ( OBJ-AT ?auto_2262066 ?auto_2262068 ) ( OBJ-AT ?auto_2262067 ?auto_2262064 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2262065 ?auto_2262066 ?auto_2262064 )
      ( DELIVER-3PKG-VERIFY ?auto_2262065 ?auto_2262066 ?auto_2262067 ?auto_2262064 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2262118 - OBJ
      ?auto_2262119 - OBJ
      ?auto_2262120 - OBJ
      ?auto_2262117 - LOCATION
    )
    :vars
    (
      ?auto_2262122 - TRUCK
      ?auto_2262121 - LOCATION
      ?auto_2262123 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2262119 ?auto_2262118 ) ) ( not ( = ?auto_2262120 ?auto_2262118 ) ) ( not ( = ?auto_2262120 ?auto_2262119 ) ) ( TRUCK-AT ?auto_2262122 ?auto_2262121 ) ( IN-CITY ?auto_2262121 ?auto_2262123 ) ( IN-CITY ?auto_2262117 ?auto_2262123 ) ( not ( = ?auto_2262117 ?auto_2262121 ) ) ( OBJ-AT ?auto_2262119 ?auto_2262117 ) ( OBJ-AT ?auto_2262118 ?auto_2262121 ) ( OBJ-AT ?auto_2262120 ?auto_2262117 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2262119 ?auto_2262118 ?auto_2262117 )
      ( DELIVER-3PKG-VERIFY ?auto_2262118 ?auto_2262119 ?auto_2262120 ?auto_2262117 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2264678 - OBJ
      ?auto_2264679 - OBJ
      ?auto_2264680 - OBJ
      ?auto_2264677 - LOCATION
    )
    :vars
    (
      ?auto_2264682 - LOCATION
      ?auto_2264683 - CITY
      ?auto_2264681 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2264679 ?auto_2264678 ) ) ( not ( = ?auto_2264680 ?auto_2264678 ) ) ( not ( = ?auto_2264680 ?auto_2264679 ) ) ( IN-CITY ?auto_2264682 ?auto_2264683 ) ( IN-CITY ?auto_2264677 ?auto_2264683 ) ( not ( = ?auto_2264677 ?auto_2264682 ) ) ( OBJ-AT ?auto_2264678 ?auto_2264677 ) ( OBJ-AT ?auto_2264680 ?auto_2264682 ) ( TRUCK-AT ?auto_2264681 ?auto_2264677 ) ( OBJ-AT ?auto_2264679 ?auto_2264677 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2264678 ?auto_2264680 ?auto_2264677 )
      ( DELIVER-3PKG-VERIFY ?auto_2264678 ?auto_2264679 ?auto_2264680 ?auto_2264677 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2264692 - OBJ
      ?auto_2264693 - OBJ
      ?auto_2264694 - OBJ
      ?auto_2264691 - LOCATION
    )
    :vars
    (
      ?auto_2264696 - LOCATION
      ?auto_2264697 - CITY
      ?auto_2264695 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2264693 ?auto_2264692 ) ) ( not ( = ?auto_2264694 ?auto_2264692 ) ) ( not ( = ?auto_2264694 ?auto_2264693 ) ) ( IN-CITY ?auto_2264696 ?auto_2264697 ) ( IN-CITY ?auto_2264691 ?auto_2264697 ) ( not ( = ?auto_2264691 ?auto_2264696 ) ) ( OBJ-AT ?auto_2264692 ?auto_2264691 ) ( OBJ-AT ?auto_2264693 ?auto_2264696 ) ( TRUCK-AT ?auto_2264695 ?auto_2264691 ) ( OBJ-AT ?auto_2264694 ?auto_2264691 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2264692 ?auto_2264693 ?auto_2264691 )
      ( DELIVER-3PKG-VERIFY ?auto_2264692 ?auto_2264693 ?auto_2264694 ?auto_2264691 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2264745 - OBJ
      ?auto_2264746 - OBJ
      ?auto_2264747 - OBJ
      ?auto_2264744 - LOCATION
    )
    :vars
    (
      ?auto_2264749 - LOCATION
      ?auto_2264750 - CITY
      ?auto_2264748 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2264746 ?auto_2264745 ) ) ( not ( = ?auto_2264747 ?auto_2264745 ) ) ( not ( = ?auto_2264747 ?auto_2264746 ) ) ( IN-CITY ?auto_2264749 ?auto_2264750 ) ( IN-CITY ?auto_2264744 ?auto_2264750 ) ( not ( = ?auto_2264744 ?auto_2264749 ) ) ( OBJ-AT ?auto_2264746 ?auto_2264744 ) ( OBJ-AT ?auto_2264745 ?auto_2264749 ) ( TRUCK-AT ?auto_2264748 ?auto_2264744 ) ( OBJ-AT ?auto_2264747 ?auto_2264744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2264746 ?auto_2264745 ?auto_2264744 )
      ( DELIVER-3PKG-VERIFY ?auto_2264745 ?auto_2264746 ?auto_2264747 ?auto_2264744 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2269901 - OBJ
      ?auto_2269900 - LOCATION
    )
    :vars
    (
      ?auto_2269904 - OBJ
      ?auto_2269905 - LOCATION
      ?auto_2269903 - CITY
      ?auto_2269902 - TRUCK
      ?auto_2269906 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2269901 ?auto_2269904 ) ) ( IN-CITY ?auto_2269905 ?auto_2269903 ) ( IN-CITY ?auto_2269900 ?auto_2269903 ) ( not ( = ?auto_2269900 ?auto_2269905 ) ) ( OBJ-AT ?auto_2269904 ?auto_2269900 ) ( OBJ-AT ?auto_2269901 ?auto_2269905 ) ( TRUCK-AT ?auto_2269902 ?auto_2269906 ) ( IN-CITY ?auto_2269906 ?auto_2269903 ) ( not ( = ?auto_2269900 ?auto_2269906 ) ) ( not ( = ?auto_2269905 ?auto_2269906 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2269902 ?auto_2269906 ?auto_2269900 ?auto_2269903 )
      ( DELIVER-2PKG ?auto_2269904 ?auto_2269901 ?auto_2269900 )
      ( DELIVER-1PKG-VERIFY ?auto_2269901 ?auto_2269900 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2269908 - OBJ
      ?auto_2269909 - OBJ
      ?auto_2269907 - LOCATION
    )
    :vars
    (
      ?auto_2269911 - LOCATION
      ?auto_2269913 - CITY
      ?auto_2269912 - TRUCK
      ?auto_2269910 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2269909 ?auto_2269908 ) ) ( IN-CITY ?auto_2269911 ?auto_2269913 ) ( IN-CITY ?auto_2269907 ?auto_2269913 ) ( not ( = ?auto_2269907 ?auto_2269911 ) ) ( OBJ-AT ?auto_2269908 ?auto_2269907 ) ( OBJ-AT ?auto_2269909 ?auto_2269911 ) ( TRUCK-AT ?auto_2269912 ?auto_2269910 ) ( IN-CITY ?auto_2269910 ?auto_2269913 ) ( not ( = ?auto_2269907 ?auto_2269910 ) ) ( not ( = ?auto_2269911 ?auto_2269910 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2269909 ?auto_2269907 )
      ( DELIVER-2PKG-VERIFY ?auto_2269908 ?auto_2269909 ?auto_2269907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2269923 - OBJ
      ?auto_2269924 - OBJ
      ?auto_2269922 - LOCATION
    )
    :vars
    (
      ?auto_2269928 - LOCATION
      ?auto_2269926 - CITY
      ?auto_2269927 - TRUCK
      ?auto_2269925 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2269924 ?auto_2269923 ) ) ( IN-CITY ?auto_2269928 ?auto_2269926 ) ( IN-CITY ?auto_2269922 ?auto_2269926 ) ( not ( = ?auto_2269922 ?auto_2269928 ) ) ( OBJ-AT ?auto_2269924 ?auto_2269922 ) ( OBJ-AT ?auto_2269923 ?auto_2269928 ) ( TRUCK-AT ?auto_2269927 ?auto_2269925 ) ( IN-CITY ?auto_2269925 ?auto_2269926 ) ( not ( = ?auto_2269922 ?auto_2269925 ) ) ( not ( = ?auto_2269928 ?auto_2269925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2269924 ?auto_2269923 ?auto_2269922 )
      ( DELIVER-2PKG-VERIFY ?auto_2269923 ?auto_2269924 ?auto_2269922 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2295477 - OBJ
      ?auto_2295478 - OBJ
      ?auto_2295479 - OBJ
      ?auto_2295480 - OBJ
      ?auto_2295476 - LOCATION
    )
    :vars
    (
      ?auto_2295481 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2295478 ?auto_2295477 ) ) ( not ( = ?auto_2295479 ?auto_2295477 ) ) ( not ( = ?auto_2295479 ?auto_2295478 ) ) ( not ( = ?auto_2295480 ?auto_2295477 ) ) ( not ( = ?auto_2295480 ?auto_2295478 ) ) ( not ( = ?auto_2295480 ?auto_2295479 ) ) ( TRUCK-AT ?auto_2295481 ?auto_2295476 ) ( IN-TRUCK ?auto_2295480 ?auto_2295481 ) ( OBJ-AT ?auto_2295477 ?auto_2295476 ) ( OBJ-AT ?auto_2295478 ?auto_2295476 ) ( OBJ-AT ?auto_2295479 ?auto_2295476 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2295480 ?auto_2295476 )
      ( DELIVER-4PKG-VERIFY ?auto_2295477 ?auto_2295478 ?auto_2295479 ?auto_2295480 ?auto_2295476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2295495 - OBJ
      ?auto_2295496 - OBJ
      ?auto_2295497 - OBJ
      ?auto_2295498 - OBJ
      ?auto_2295494 - LOCATION
    )
    :vars
    (
      ?auto_2295499 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2295496 ?auto_2295495 ) ) ( not ( = ?auto_2295497 ?auto_2295495 ) ) ( not ( = ?auto_2295497 ?auto_2295496 ) ) ( not ( = ?auto_2295498 ?auto_2295495 ) ) ( not ( = ?auto_2295498 ?auto_2295496 ) ) ( not ( = ?auto_2295498 ?auto_2295497 ) ) ( TRUCK-AT ?auto_2295499 ?auto_2295494 ) ( IN-TRUCK ?auto_2295497 ?auto_2295499 ) ( OBJ-AT ?auto_2295495 ?auto_2295494 ) ( OBJ-AT ?auto_2295496 ?auto_2295494 ) ( OBJ-AT ?auto_2295498 ?auto_2295494 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2295497 ?auto_2295494 )
      ( DELIVER-4PKG-VERIFY ?auto_2295495 ?auto_2295496 ?auto_2295497 ?auto_2295498 ?auto_2295494 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2295583 - OBJ
      ?auto_2295584 - OBJ
      ?auto_2295585 - OBJ
      ?auto_2295586 - OBJ
      ?auto_2295582 - LOCATION
    )
    :vars
    (
      ?auto_2295587 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2295584 ?auto_2295583 ) ) ( not ( = ?auto_2295585 ?auto_2295583 ) ) ( not ( = ?auto_2295585 ?auto_2295584 ) ) ( not ( = ?auto_2295586 ?auto_2295583 ) ) ( not ( = ?auto_2295586 ?auto_2295584 ) ) ( not ( = ?auto_2295586 ?auto_2295585 ) ) ( TRUCK-AT ?auto_2295587 ?auto_2295582 ) ( IN-TRUCK ?auto_2295584 ?auto_2295587 ) ( OBJ-AT ?auto_2295583 ?auto_2295582 ) ( OBJ-AT ?auto_2295585 ?auto_2295582 ) ( OBJ-AT ?auto_2295586 ?auto_2295582 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2295584 ?auto_2295582 )
      ( DELIVER-4PKG-VERIFY ?auto_2295583 ?auto_2295584 ?auto_2295585 ?auto_2295586 ?auto_2295582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2296110 - OBJ
      ?auto_2296111 - OBJ
      ?auto_2296112 - OBJ
      ?auto_2296113 - OBJ
      ?auto_2296109 - LOCATION
    )
    :vars
    (
      ?auto_2296114 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2296111 ?auto_2296110 ) ) ( not ( = ?auto_2296112 ?auto_2296110 ) ) ( not ( = ?auto_2296112 ?auto_2296111 ) ) ( not ( = ?auto_2296113 ?auto_2296110 ) ) ( not ( = ?auto_2296113 ?auto_2296111 ) ) ( not ( = ?auto_2296113 ?auto_2296112 ) ) ( TRUCK-AT ?auto_2296114 ?auto_2296109 ) ( IN-TRUCK ?auto_2296110 ?auto_2296114 ) ( OBJ-AT ?auto_2296111 ?auto_2296109 ) ( OBJ-AT ?auto_2296112 ?auto_2296109 ) ( OBJ-AT ?auto_2296113 ?auto_2296109 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2296110 ?auto_2296109 )
      ( DELIVER-4PKG-VERIFY ?auto_2296110 ?auto_2296111 ?auto_2296112 ?auto_2296113 ?auto_2296109 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2302255 - OBJ
      ?auto_2302256 - OBJ
      ?auto_2302257 - OBJ
      ?auto_2302258 - OBJ
      ?auto_2302254 - LOCATION
    )
    :vars
    (
      ?auto_2302261 - TRUCK
      ?auto_2302260 - LOCATION
      ?auto_2302259 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2302256 ?auto_2302255 ) ) ( not ( = ?auto_2302257 ?auto_2302255 ) ) ( not ( = ?auto_2302257 ?auto_2302256 ) ) ( not ( = ?auto_2302258 ?auto_2302255 ) ) ( not ( = ?auto_2302258 ?auto_2302256 ) ) ( not ( = ?auto_2302258 ?auto_2302257 ) ) ( IN-TRUCK ?auto_2302258 ?auto_2302261 ) ( TRUCK-AT ?auto_2302261 ?auto_2302260 ) ( IN-CITY ?auto_2302260 ?auto_2302259 ) ( IN-CITY ?auto_2302254 ?auto_2302259 ) ( not ( = ?auto_2302254 ?auto_2302260 ) ) ( OBJ-AT ?auto_2302255 ?auto_2302254 ) ( OBJ-AT ?auto_2302256 ?auto_2302254 ) ( OBJ-AT ?auto_2302257 ?auto_2302254 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2302255 ?auto_2302258 ?auto_2302254 )
      ( DELIVER-4PKG-VERIFY ?auto_2302255 ?auto_2302256 ?auto_2302257 ?auto_2302258 ?auto_2302254 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2302279 - OBJ
      ?auto_2302280 - OBJ
      ?auto_2302281 - OBJ
      ?auto_2302282 - OBJ
      ?auto_2302278 - LOCATION
    )
    :vars
    (
      ?auto_2302285 - TRUCK
      ?auto_2302284 - LOCATION
      ?auto_2302283 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2302280 ?auto_2302279 ) ) ( not ( = ?auto_2302281 ?auto_2302279 ) ) ( not ( = ?auto_2302281 ?auto_2302280 ) ) ( not ( = ?auto_2302282 ?auto_2302279 ) ) ( not ( = ?auto_2302282 ?auto_2302280 ) ) ( not ( = ?auto_2302282 ?auto_2302281 ) ) ( IN-TRUCK ?auto_2302281 ?auto_2302285 ) ( TRUCK-AT ?auto_2302285 ?auto_2302284 ) ( IN-CITY ?auto_2302284 ?auto_2302283 ) ( IN-CITY ?auto_2302278 ?auto_2302283 ) ( not ( = ?auto_2302278 ?auto_2302284 ) ) ( OBJ-AT ?auto_2302279 ?auto_2302278 ) ( OBJ-AT ?auto_2302280 ?auto_2302278 ) ( OBJ-AT ?auto_2302282 ?auto_2302278 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2302279 ?auto_2302281 ?auto_2302278 )
      ( DELIVER-4PKG-VERIFY ?auto_2302279 ?auto_2302280 ?auto_2302281 ?auto_2302282 ?auto_2302278 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2302393 - OBJ
      ?auto_2302394 - OBJ
      ?auto_2302395 - OBJ
      ?auto_2302396 - OBJ
      ?auto_2302392 - LOCATION
    )
    :vars
    (
      ?auto_2302399 - TRUCK
      ?auto_2302398 - LOCATION
      ?auto_2302397 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2302394 ?auto_2302393 ) ) ( not ( = ?auto_2302395 ?auto_2302393 ) ) ( not ( = ?auto_2302395 ?auto_2302394 ) ) ( not ( = ?auto_2302396 ?auto_2302393 ) ) ( not ( = ?auto_2302396 ?auto_2302394 ) ) ( not ( = ?auto_2302396 ?auto_2302395 ) ) ( IN-TRUCK ?auto_2302394 ?auto_2302399 ) ( TRUCK-AT ?auto_2302399 ?auto_2302398 ) ( IN-CITY ?auto_2302398 ?auto_2302397 ) ( IN-CITY ?auto_2302392 ?auto_2302397 ) ( not ( = ?auto_2302392 ?auto_2302398 ) ) ( OBJ-AT ?auto_2302393 ?auto_2302392 ) ( OBJ-AT ?auto_2302395 ?auto_2302392 ) ( OBJ-AT ?auto_2302396 ?auto_2302392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2302393 ?auto_2302394 ?auto_2302392 )
      ( DELIVER-4PKG-VERIFY ?auto_2302393 ?auto_2302394 ?auto_2302395 ?auto_2302396 ?auto_2302392 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2303112 - OBJ
      ?auto_2303113 - OBJ
      ?auto_2303114 - OBJ
      ?auto_2303115 - OBJ
      ?auto_2303111 - LOCATION
    )
    :vars
    (
      ?auto_2303118 - TRUCK
      ?auto_2303117 - LOCATION
      ?auto_2303116 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2303113 ?auto_2303112 ) ) ( not ( = ?auto_2303114 ?auto_2303112 ) ) ( not ( = ?auto_2303114 ?auto_2303113 ) ) ( not ( = ?auto_2303115 ?auto_2303112 ) ) ( not ( = ?auto_2303115 ?auto_2303113 ) ) ( not ( = ?auto_2303115 ?auto_2303114 ) ) ( IN-TRUCK ?auto_2303112 ?auto_2303118 ) ( TRUCK-AT ?auto_2303118 ?auto_2303117 ) ( IN-CITY ?auto_2303117 ?auto_2303116 ) ( IN-CITY ?auto_2303111 ?auto_2303116 ) ( not ( = ?auto_2303111 ?auto_2303117 ) ) ( OBJ-AT ?auto_2303113 ?auto_2303111 ) ( OBJ-AT ?auto_2303114 ?auto_2303111 ) ( OBJ-AT ?auto_2303115 ?auto_2303111 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2303113 ?auto_2303112 ?auto_2303111 )
      ( DELIVER-4PKG-VERIFY ?auto_2303112 ?auto_2303113 ?auto_2303114 ?auto_2303115 ?auto_2303111 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2311164 - OBJ
      ?auto_2311165 - OBJ
      ?auto_2311166 - OBJ
      ?auto_2311167 - OBJ
      ?auto_2311163 - LOCATION
    )
    :vars
    (
      ?auto_2311168 - TRUCK
      ?auto_2311169 - LOCATION
      ?auto_2311170 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2311165 ?auto_2311164 ) ) ( not ( = ?auto_2311166 ?auto_2311164 ) ) ( not ( = ?auto_2311166 ?auto_2311165 ) ) ( not ( = ?auto_2311167 ?auto_2311164 ) ) ( not ( = ?auto_2311167 ?auto_2311165 ) ) ( not ( = ?auto_2311167 ?auto_2311166 ) ) ( TRUCK-AT ?auto_2311168 ?auto_2311169 ) ( IN-CITY ?auto_2311169 ?auto_2311170 ) ( IN-CITY ?auto_2311163 ?auto_2311170 ) ( not ( = ?auto_2311163 ?auto_2311169 ) ) ( OBJ-AT ?auto_2311164 ?auto_2311163 ) ( OBJ-AT ?auto_2311167 ?auto_2311169 ) ( OBJ-AT ?auto_2311165 ?auto_2311163 ) ( OBJ-AT ?auto_2311166 ?auto_2311163 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2311164 ?auto_2311167 ?auto_2311163 )
      ( DELIVER-4PKG-VERIFY ?auto_2311164 ?auto_2311165 ?auto_2311166 ?auto_2311167 ?auto_2311163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2311188 - OBJ
      ?auto_2311189 - OBJ
      ?auto_2311190 - OBJ
      ?auto_2311191 - OBJ
      ?auto_2311187 - LOCATION
    )
    :vars
    (
      ?auto_2311192 - TRUCK
      ?auto_2311193 - LOCATION
      ?auto_2311194 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2311189 ?auto_2311188 ) ) ( not ( = ?auto_2311190 ?auto_2311188 ) ) ( not ( = ?auto_2311190 ?auto_2311189 ) ) ( not ( = ?auto_2311191 ?auto_2311188 ) ) ( not ( = ?auto_2311191 ?auto_2311189 ) ) ( not ( = ?auto_2311191 ?auto_2311190 ) ) ( TRUCK-AT ?auto_2311192 ?auto_2311193 ) ( IN-CITY ?auto_2311193 ?auto_2311194 ) ( IN-CITY ?auto_2311187 ?auto_2311194 ) ( not ( = ?auto_2311187 ?auto_2311193 ) ) ( OBJ-AT ?auto_2311188 ?auto_2311187 ) ( OBJ-AT ?auto_2311190 ?auto_2311193 ) ( OBJ-AT ?auto_2311189 ?auto_2311187 ) ( OBJ-AT ?auto_2311191 ?auto_2311187 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2311188 ?auto_2311190 ?auto_2311187 )
      ( DELIVER-4PKG-VERIFY ?auto_2311188 ?auto_2311189 ?auto_2311190 ?auto_2311191 ?auto_2311187 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2311302 - OBJ
      ?auto_2311303 - OBJ
      ?auto_2311304 - OBJ
      ?auto_2311305 - OBJ
      ?auto_2311301 - LOCATION
    )
    :vars
    (
      ?auto_2311306 - TRUCK
      ?auto_2311307 - LOCATION
      ?auto_2311308 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2311303 ?auto_2311302 ) ) ( not ( = ?auto_2311304 ?auto_2311302 ) ) ( not ( = ?auto_2311304 ?auto_2311303 ) ) ( not ( = ?auto_2311305 ?auto_2311302 ) ) ( not ( = ?auto_2311305 ?auto_2311303 ) ) ( not ( = ?auto_2311305 ?auto_2311304 ) ) ( TRUCK-AT ?auto_2311306 ?auto_2311307 ) ( IN-CITY ?auto_2311307 ?auto_2311308 ) ( IN-CITY ?auto_2311301 ?auto_2311308 ) ( not ( = ?auto_2311301 ?auto_2311307 ) ) ( OBJ-AT ?auto_2311302 ?auto_2311301 ) ( OBJ-AT ?auto_2311303 ?auto_2311307 ) ( OBJ-AT ?auto_2311304 ?auto_2311301 ) ( OBJ-AT ?auto_2311305 ?auto_2311301 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2311302 ?auto_2311303 ?auto_2311301 )
      ( DELIVER-4PKG-VERIFY ?auto_2311302 ?auto_2311303 ?auto_2311304 ?auto_2311305 ?auto_2311301 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2312021 - OBJ
      ?auto_2312022 - OBJ
      ?auto_2312023 - OBJ
      ?auto_2312024 - OBJ
      ?auto_2312020 - LOCATION
    )
    :vars
    (
      ?auto_2312025 - TRUCK
      ?auto_2312026 - LOCATION
      ?auto_2312027 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2312022 ?auto_2312021 ) ) ( not ( = ?auto_2312023 ?auto_2312021 ) ) ( not ( = ?auto_2312023 ?auto_2312022 ) ) ( not ( = ?auto_2312024 ?auto_2312021 ) ) ( not ( = ?auto_2312024 ?auto_2312022 ) ) ( not ( = ?auto_2312024 ?auto_2312023 ) ) ( TRUCK-AT ?auto_2312025 ?auto_2312026 ) ( IN-CITY ?auto_2312026 ?auto_2312027 ) ( IN-CITY ?auto_2312020 ?auto_2312027 ) ( not ( = ?auto_2312020 ?auto_2312026 ) ) ( OBJ-AT ?auto_2312022 ?auto_2312020 ) ( OBJ-AT ?auto_2312021 ?auto_2312026 ) ( OBJ-AT ?auto_2312023 ?auto_2312020 ) ( OBJ-AT ?auto_2312024 ?auto_2312020 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2312022 ?auto_2312021 ?auto_2312020 )
      ( DELIVER-4PKG-VERIFY ?auto_2312021 ?auto_2312022 ?auto_2312023 ?auto_2312024 ?auto_2312020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2320073 - OBJ
      ?auto_2320074 - OBJ
      ?auto_2320075 - OBJ
      ?auto_2320076 - OBJ
      ?auto_2320072 - LOCATION
    )
    :vars
    (
      ?auto_2320079 - LOCATION
      ?auto_2320078 - CITY
      ?auto_2320077 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2320074 ?auto_2320073 ) ) ( not ( = ?auto_2320075 ?auto_2320073 ) ) ( not ( = ?auto_2320075 ?auto_2320074 ) ) ( not ( = ?auto_2320076 ?auto_2320073 ) ) ( not ( = ?auto_2320076 ?auto_2320074 ) ) ( not ( = ?auto_2320076 ?auto_2320075 ) ) ( IN-CITY ?auto_2320079 ?auto_2320078 ) ( IN-CITY ?auto_2320072 ?auto_2320078 ) ( not ( = ?auto_2320072 ?auto_2320079 ) ) ( OBJ-AT ?auto_2320073 ?auto_2320072 ) ( OBJ-AT ?auto_2320076 ?auto_2320079 ) ( TRUCK-AT ?auto_2320077 ?auto_2320072 ) ( OBJ-AT ?auto_2320074 ?auto_2320072 ) ( OBJ-AT ?auto_2320075 ?auto_2320072 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2320073 ?auto_2320076 ?auto_2320072 )
      ( DELIVER-4PKG-VERIFY ?auto_2320073 ?auto_2320074 ?auto_2320075 ?auto_2320076 ?auto_2320072 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2320097 - OBJ
      ?auto_2320098 - OBJ
      ?auto_2320099 - OBJ
      ?auto_2320100 - OBJ
      ?auto_2320096 - LOCATION
    )
    :vars
    (
      ?auto_2320103 - LOCATION
      ?auto_2320102 - CITY
      ?auto_2320101 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2320098 ?auto_2320097 ) ) ( not ( = ?auto_2320099 ?auto_2320097 ) ) ( not ( = ?auto_2320099 ?auto_2320098 ) ) ( not ( = ?auto_2320100 ?auto_2320097 ) ) ( not ( = ?auto_2320100 ?auto_2320098 ) ) ( not ( = ?auto_2320100 ?auto_2320099 ) ) ( IN-CITY ?auto_2320103 ?auto_2320102 ) ( IN-CITY ?auto_2320096 ?auto_2320102 ) ( not ( = ?auto_2320096 ?auto_2320103 ) ) ( OBJ-AT ?auto_2320097 ?auto_2320096 ) ( OBJ-AT ?auto_2320099 ?auto_2320103 ) ( TRUCK-AT ?auto_2320101 ?auto_2320096 ) ( OBJ-AT ?auto_2320098 ?auto_2320096 ) ( OBJ-AT ?auto_2320100 ?auto_2320096 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2320097 ?auto_2320099 ?auto_2320096 )
      ( DELIVER-4PKG-VERIFY ?auto_2320097 ?auto_2320098 ?auto_2320099 ?auto_2320100 ?auto_2320096 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2320211 - OBJ
      ?auto_2320212 - OBJ
      ?auto_2320213 - OBJ
      ?auto_2320214 - OBJ
      ?auto_2320210 - LOCATION
    )
    :vars
    (
      ?auto_2320217 - LOCATION
      ?auto_2320216 - CITY
      ?auto_2320215 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2320212 ?auto_2320211 ) ) ( not ( = ?auto_2320213 ?auto_2320211 ) ) ( not ( = ?auto_2320213 ?auto_2320212 ) ) ( not ( = ?auto_2320214 ?auto_2320211 ) ) ( not ( = ?auto_2320214 ?auto_2320212 ) ) ( not ( = ?auto_2320214 ?auto_2320213 ) ) ( IN-CITY ?auto_2320217 ?auto_2320216 ) ( IN-CITY ?auto_2320210 ?auto_2320216 ) ( not ( = ?auto_2320210 ?auto_2320217 ) ) ( OBJ-AT ?auto_2320211 ?auto_2320210 ) ( OBJ-AT ?auto_2320212 ?auto_2320217 ) ( TRUCK-AT ?auto_2320215 ?auto_2320210 ) ( OBJ-AT ?auto_2320213 ?auto_2320210 ) ( OBJ-AT ?auto_2320214 ?auto_2320210 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2320211 ?auto_2320212 ?auto_2320210 )
      ( DELIVER-4PKG-VERIFY ?auto_2320211 ?auto_2320212 ?auto_2320213 ?auto_2320214 ?auto_2320210 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2320930 - OBJ
      ?auto_2320931 - OBJ
      ?auto_2320932 - OBJ
      ?auto_2320933 - OBJ
      ?auto_2320929 - LOCATION
    )
    :vars
    (
      ?auto_2320936 - LOCATION
      ?auto_2320935 - CITY
      ?auto_2320934 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2320931 ?auto_2320930 ) ) ( not ( = ?auto_2320932 ?auto_2320930 ) ) ( not ( = ?auto_2320932 ?auto_2320931 ) ) ( not ( = ?auto_2320933 ?auto_2320930 ) ) ( not ( = ?auto_2320933 ?auto_2320931 ) ) ( not ( = ?auto_2320933 ?auto_2320932 ) ) ( IN-CITY ?auto_2320936 ?auto_2320935 ) ( IN-CITY ?auto_2320929 ?auto_2320935 ) ( not ( = ?auto_2320929 ?auto_2320936 ) ) ( OBJ-AT ?auto_2320931 ?auto_2320929 ) ( OBJ-AT ?auto_2320930 ?auto_2320936 ) ( TRUCK-AT ?auto_2320934 ?auto_2320929 ) ( OBJ-AT ?auto_2320932 ?auto_2320929 ) ( OBJ-AT ?auto_2320933 ?auto_2320929 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2320931 ?auto_2320930 ?auto_2320929 )
      ( DELIVER-4PKG-VERIFY ?auto_2320930 ?auto_2320931 ?auto_2320932 ?auto_2320933 ?auto_2320929 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2337705 - OBJ
      ?auto_2337706 - OBJ
      ?auto_2337707 - OBJ
      ?auto_2337704 - LOCATION
    )
    :vars
    (
      ?auto_2337710 - LOCATION
      ?auto_2337709 - CITY
      ?auto_2337708 - TRUCK
      ?auto_2337711 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2337706 ?auto_2337705 ) ) ( not ( = ?auto_2337707 ?auto_2337705 ) ) ( not ( = ?auto_2337707 ?auto_2337706 ) ) ( IN-CITY ?auto_2337710 ?auto_2337709 ) ( IN-CITY ?auto_2337704 ?auto_2337709 ) ( not ( = ?auto_2337704 ?auto_2337710 ) ) ( OBJ-AT ?auto_2337705 ?auto_2337704 ) ( OBJ-AT ?auto_2337707 ?auto_2337710 ) ( TRUCK-AT ?auto_2337708 ?auto_2337711 ) ( IN-CITY ?auto_2337711 ?auto_2337709 ) ( not ( = ?auto_2337704 ?auto_2337711 ) ) ( not ( = ?auto_2337710 ?auto_2337711 ) ) ( OBJ-AT ?auto_2337706 ?auto_2337704 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2337705 ?auto_2337707 ?auto_2337704 )
      ( DELIVER-3PKG-VERIFY ?auto_2337705 ?auto_2337706 ?auto_2337707 ?auto_2337704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2337729 - OBJ
      ?auto_2337730 - OBJ
      ?auto_2337731 - OBJ
      ?auto_2337728 - LOCATION
    )
    :vars
    (
      ?auto_2337734 - LOCATION
      ?auto_2337733 - CITY
      ?auto_2337732 - TRUCK
      ?auto_2337735 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2337730 ?auto_2337729 ) ) ( not ( = ?auto_2337731 ?auto_2337729 ) ) ( not ( = ?auto_2337731 ?auto_2337730 ) ) ( IN-CITY ?auto_2337734 ?auto_2337733 ) ( IN-CITY ?auto_2337728 ?auto_2337733 ) ( not ( = ?auto_2337728 ?auto_2337734 ) ) ( OBJ-AT ?auto_2337729 ?auto_2337728 ) ( OBJ-AT ?auto_2337730 ?auto_2337734 ) ( TRUCK-AT ?auto_2337732 ?auto_2337735 ) ( IN-CITY ?auto_2337735 ?auto_2337733 ) ( not ( = ?auto_2337728 ?auto_2337735 ) ) ( not ( = ?auto_2337734 ?auto_2337735 ) ) ( OBJ-AT ?auto_2337731 ?auto_2337728 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2337729 ?auto_2337730 ?auto_2337728 )
      ( DELIVER-3PKG-VERIFY ?auto_2337729 ?auto_2337730 ?auto_2337731 ?auto_2337728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2337875 - OBJ
      ?auto_2337876 - OBJ
      ?auto_2337877 - OBJ
      ?auto_2337874 - LOCATION
    )
    :vars
    (
      ?auto_2337880 - LOCATION
      ?auto_2337879 - CITY
      ?auto_2337878 - TRUCK
      ?auto_2337881 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2337876 ?auto_2337875 ) ) ( not ( = ?auto_2337877 ?auto_2337875 ) ) ( not ( = ?auto_2337877 ?auto_2337876 ) ) ( IN-CITY ?auto_2337880 ?auto_2337879 ) ( IN-CITY ?auto_2337874 ?auto_2337879 ) ( not ( = ?auto_2337874 ?auto_2337880 ) ) ( OBJ-AT ?auto_2337876 ?auto_2337874 ) ( OBJ-AT ?auto_2337875 ?auto_2337880 ) ( TRUCK-AT ?auto_2337878 ?auto_2337881 ) ( IN-CITY ?auto_2337881 ?auto_2337879 ) ( not ( = ?auto_2337874 ?auto_2337881 ) ) ( not ( = ?auto_2337880 ?auto_2337881 ) ) ( OBJ-AT ?auto_2337877 ?auto_2337874 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2337876 ?auto_2337875 ?auto_2337874 )
      ( DELIVER-3PKG-VERIFY ?auto_2337875 ?auto_2337876 ?auto_2337877 ?auto_2337874 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2460282 - OBJ
      ?auto_2460283 - OBJ
      ?auto_2460284 - OBJ
      ?auto_2460285 - OBJ
      ?auto_2460286 - OBJ
      ?auto_2460281 - LOCATION
    )
    :vars
    (
      ?auto_2460287 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2460283 ?auto_2460282 ) ) ( not ( = ?auto_2460284 ?auto_2460282 ) ) ( not ( = ?auto_2460284 ?auto_2460283 ) ) ( not ( = ?auto_2460285 ?auto_2460282 ) ) ( not ( = ?auto_2460285 ?auto_2460283 ) ) ( not ( = ?auto_2460285 ?auto_2460284 ) ) ( not ( = ?auto_2460286 ?auto_2460282 ) ) ( not ( = ?auto_2460286 ?auto_2460283 ) ) ( not ( = ?auto_2460286 ?auto_2460284 ) ) ( not ( = ?auto_2460286 ?auto_2460285 ) ) ( TRUCK-AT ?auto_2460287 ?auto_2460281 ) ( IN-TRUCK ?auto_2460286 ?auto_2460287 ) ( OBJ-AT ?auto_2460282 ?auto_2460281 ) ( OBJ-AT ?auto_2460283 ?auto_2460281 ) ( OBJ-AT ?auto_2460284 ?auto_2460281 ) ( OBJ-AT ?auto_2460285 ?auto_2460281 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2460286 ?auto_2460281 )
      ( DELIVER-5PKG-VERIFY ?auto_2460282 ?auto_2460283 ?auto_2460284 ?auto_2460285 ?auto_2460286 ?auto_2460281 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2460310 - OBJ
      ?auto_2460311 - OBJ
      ?auto_2460312 - OBJ
      ?auto_2460313 - OBJ
      ?auto_2460314 - OBJ
      ?auto_2460309 - LOCATION
    )
    :vars
    (
      ?auto_2460315 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2460311 ?auto_2460310 ) ) ( not ( = ?auto_2460312 ?auto_2460310 ) ) ( not ( = ?auto_2460312 ?auto_2460311 ) ) ( not ( = ?auto_2460313 ?auto_2460310 ) ) ( not ( = ?auto_2460313 ?auto_2460311 ) ) ( not ( = ?auto_2460313 ?auto_2460312 ) ) ( not ( = ?auto_2460314 ?auto_2460310 ) ) ( not ( = ?auto_2460314 ?auto_2460311 ) ) ( not ( = ?auto_2460314 ?auto_2460312 ) ) ( not ( = ?auto_2460314 ?auto_2460313 ) ) ( TRUCK-AT ?auto_2460315 ?auto_2460309 ) ( IN-TRUCK ?auto_2460313 ?auto_2460315 ) ( OBJ-AT ?auto_2460310 ?auto_2460309 ) ( OBJ-AT ?auto_2460311 ?auto_2460309 ) ( OBJ-AT ?auto_2460312 ?auto_2460309 ) ( OBJ-AT ?auto_2460314 ?auto_2460309 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2460313 ?auto_2460309 )
      ( DELIVER-5PKG-VERIFY ?auto_2460310 ?auto_2460311 ?auto_2460312 ?auto_2460313 ?auto_2460314 ?auto_2460309 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2460476 - OBJ
      ?auto_2460477 - OBJ
      ?auto_2460478 - OBJ
      ?auto_2460479 - OBJ
      ?auto_2460480 - OBJ
      ?auto_2460475 - LOCATION
    )
    :vars
    (
      ?auto_2460481 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2460477 ?auto_2460476 ) ) ( not ( = ?auto_2460478 ?auto_2460476 ) ) ( not ( = ?auto_2460478 ?auto_2460477 ) ) ( not ( = ?auto_2460479 ?auto_2460476 ) ) ( not ( = ?auto_2460479 ?auto_2460477 ) ) ( not ( = ?auto_2460479 ?auto_2460478 ) ) ( not ( = ?auto_2460480 ?auto_2460476 ) ) ( not ( = ?auto_2460480 ?auto_2460477 ) ) ( not ( = ?auto_2460480 ?auto_2460478 ) ) ( not ( = ?auto_2460480 ?auto_2460479 ) ) ( TRUCK-AT ?auto_2460481 ?auto_2460475 ) ( IN-TRUCK ?auto_2460478 ?auto_2460481 ) ( OBJ-AT ?auto_2460476 ?auto_2460475 ) ( OBJ-AT ?auto_2460477 ?auto_2460475 ) ( OBJ-AT ?auto_2460479 ?auto_2460475 ) ( OBJ-AT ?auto_2460480 ?auto_2460475 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2460478 ?auto_2460475 )
      ( DELIVER-5PKG-VERIFY ?auto_2460476 ?auto_2460477 ?auto_2460478 ?auto_2460479 ?auto_2460480 ?auto_2460475 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2461667 - OBJ
      ?auto_2461668 - OBJ
      ?auto_2461669 - OBJ
      ?auto_2461670 - OBJ
      ?auto_2461671 - OBJ
      ?auto_2461666 - LOCATION
    )
    :vars
    (
      ?auto_2461672 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2461668 ?auto_2461667 ) ) ( not ( = ?auto_2461669 ?auto_2461667 ) ) ( not ( = ?auto_2461669 ?auto_2461668 ) ) ( not ( = ?auto_2461670 ?auto_2461667 ) ) ( not ( = ?auto_2461670 ?auto_2461668 ) ) ( not ( = ?auto_2461670 ?auto_2461669 ) ) ( not ( = ?auto_2461671 ?auto_2461667 ) ) ( not ( = ?auto_2461671 ?auto_2461668 ) ) ( not ( = ?auto_2461671 ?auto_2461669 ) ) ( not ( = ?auto_2461671 ?auto_2461670 ) ) ( TRUCK-AT ?auto_2461672 ?auto_2461666 ) ( IN-TRUCK ?auto_2461668 ?auto_2461672 ) ( OBJ-AT ?auto_2461667 ?auto_2461666 ) ( OBJ-AT ?auto_2461669 ?auto_2461666 ) ( OBJ-AT ?auto_2461670 ?auto_2461666 ) ( OBJ-AT ?auto_2461671 ?auto_2461666 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2461668 ?auto_2461666 )
      ( DELIVER-5PKG-VERIFY ?auto_2461667 ?auto_2461668 ?auto_2461669 ?auto_2461670 ?auto_2461671 ?auto_2461666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2470214 - OBJ
      ?auto_2470215 - OBJ
      ?auto_2470216 - OBJ
      ?auto_2470217 - OBJ
      ?auto_2470218 - OBJ
      ?auto_2470213 - LOCATION
    )
    :vars
    (
      ?auto_2470219 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2470215 ?auto_2470214 ) ) ( not ( = ?auto_2470216 ?auto_2470214 ) ) ( not ( = ?auto_2470216 ?auto_2470215 ) ) ( not ( = ?auto_2470217 ?auto_2470214 ) ) ( not ( = ?auto_2470217 ?auto_2470215 ) ) ( not ( = ?auto_2470217 ?auto_2470216 ) ) ( not ( = ?auto_2470218 ?auto_2470214 ) ) ( not ( = ?auto_2470218 ?auto_2470215 ) ) ( not ( = ?auto_2470218 ?auto_2470216 ) ) ( not ( = ?auto_2470218 ?auto_2470217 ) ) ( TRUCK-AT ?auto_2470219 ?auto_2470213 ) ( IN-TRUCK ?auto_2470214 ?auto_2470219 ) ( OBJ-AT ?auto_2470215 ?auto_2470213 ) ( OBJ-AT ?auto_2470216 ?auto_2470213 ) ( OBJ-AT ?auto_2470217 ?auto_2470213 ) ( OBJ-AT ?auto_2470218 ?auto_2470213 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2470214 ?auto_2470213 )
      ( DELIVER-5PKG-VERIFY ?auto_2470214 ?auto_2470215 ?auto_2470216 ?auto_2470217 ?auto_2470218 ?auto_2470213 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2478254 - OBJ
      ?auto_2478255 - OBJ
      ?auto_2478256 - OBJ
      ?auto_2478257 - OBJ
      ?auto_2478258 - OBJ
      ?auto_2478253 - LOCATION
    )
    :vars
    (
      ?auto_2478259 - TRUCK
      ?auto_2478260 - LOCATION
      ?auto_2478261 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2478255 ?auto_2478254 ) ) ( not ( = ?auto_2478256 ?auto_2478254 ) ) ( not ( = ?auto_2478256 ?auto_2478255 ) ) ( not ( = ?auto_2478257 ?auto_2478254 ) ) ( not ( = ?auto_2478257 ?auto_2478255 ) ) ( not ( = ?auto_2478257 ?auto_2478256 ) ) ( not ( = ?auto_2478258 ?auto_2478254 ) ) ( not ( = ?auto_2478258 ?auto_2478255 ) ) ( not ( = ?auto_2478258 ?auto_2478256 ) ) ( not ( = ?auto_2478258 ?auto_2478257 ) ) ( IN-TRUCK ?auto_2478258 ?auto_2478259 ) ( TRUCK-AT ?auto_2478259 ?auto_2478260 ) ( IN-CITY ?auto_2478260 ?auto_2478261 ) ( IN-CITY ?auto_2478253 ?auto_2478261 ) ( not ( = ?auto_2478253 ?auto_2478260 ) ) ( OBJ-AT ?auto_2478254 ?auto_2478253 ) ( OBJ-AT ?auto_2478255 ?auto_2478253 ) ( OBJ-AT ?auto_2478256 ?auto_2478253 ) ( OBJ-AT ?auto_2478257 ?auto_2478253 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2478254 ?auto_2478258 ?auto_2478253 )
      ( DELIVER-5PKG-VERIFY ?auto_2478254 ?auto_2478255 ?auto_2478256 ?auto_2478257 ?auto_2478258 ?auto_2478253 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2478290 - OBJ
      ?auto_2478291 - OBJ
      ?auto_2478292 - OBJ
      ?auto_2478293 - OBJ
      ?auto_2478294 - OBJ
      ?auto_2478289 - LOCATION
    )
    :vars
    (
      ?auto_2478295 - TRUCK
      ?auto_2478296 - LOCATION
      ?auto_2478297 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2478291 ?auto_2478290 ) ) ( not ( = ?auto_2478292 ?auto_2478290 ) ) ( not ( = ?auto_2478292 ?auto_2478291 ) ) ( not ( = ?auto_2478293 ?auto_2478290 ) ) ( not ( = ?auto_2478293 ?auto_2478291 ) ) ( not ( = ?auto_2478293 ?auto_2478292 ) ) ( not ( = ?auto_2478294 ?auto_2478290 ) ) ( not ( = ?auto_2478294 ?auto_2478291 ) ) ( not ( = ?auto_2478294 ?auto_2478292 ) ) ( not ( = ?auto_2478294 ?auto_2478293 ) ) ( IN-TRUCK ?auto_2478293 ?auto_2478295 ) ( TRUCK-AT ?auto_2478295 ?auto_2478296 ) ( IN-CITY ?auto_2478296 ?auto_2478297 ) ( IN-CITY ?auto_2478289 ?auto_2478297 ) ( not ( = ?auto_2478289 ?auto_2478296 ) ) ( OBJ-AT ?auto_2478290 ?auto_2478289 ) ( OBJ-AT ?auto_2478291 ?auto_2478289 ) ( OBJ-AT ?auto_2478292 ?auto_2478289 ) ( OBJ-AT ?auto_2478294 ?auto_2478289 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2478290 ?auto_2478293 ?auto_2478289 )
      ( DELIVER-5PKG-VERIFY ?auto_2478290 ?auto_2478291 ?auto_2478292 ?auto_2478293 ?auto_2478294 ?auto_2478289 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2478500 - OBJ
      ?auto_2478501 - OBJ
      ?auto_2478502 - OBJ
      ?auto_2478503 - OBJ
      ?auto_2478504 - OBJ
      ?auto_2478499 - LOCATION
    )
    :vars
    (
      ?auto_2478505 - TRUCK
      ?auto_2478506 - LOCATION
      ?auto_2478507 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2478501 ?auto_2478500 ) ) ( not ( = ?auto_2478502 ?auto_2478500 ) ) ( not ( = ?auto_2478502 ?auto_2478501 ) ) ( not ( = ?auto_2478503 ?auto_2478500 ) ) ( not ( = ?auto_2478503 ?auto_2478501 ) ) ( not ( = ?auto_2478503 ?auto_2478502 ) ) ( not ( = ?auto_2478504 ?auto_2478500 ) ) ( not ( = ?auto_2478504 ?auto_2478501 ) ) ( not ( = ?auto_2478504 ?auto_2478502 ) ) ( not ( = ?auto_2478504 ?auto_2478503 ) ) ( IN-TRUCK ?auto_2478502 ?auto_2478505 ) ( TRUCK-AT ?auto_2478505 ?auto_2478506 ) ( IN-CITY ?auto_2478506 ?auto_2478507 ) ( IN-CITY ?auto_2478499 ?auto_2478507 ) ( not ( = ?auto_2478499 ?auto_2478506 ) ) ( OBJ-AT ?auto_2478500 ?auto_2478499 ) ( OBJ-AT ?auto_2478501 ?auto_2478499 ) ( OBJ-AT ?auto_2478503 ?auto_2478499 ) ( OBJ-AT ?auto_2478504 ?auto_2478499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2478500 ?auto_2478502 ?auto_2478499 )
      ( DELIVER-5PKG-VERIFY ?auto_2478500 ?auto_2478501 ?auto_2478502 ?auto_2478503 ?auto_2478504 ?auto_2478499 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2480009 - OBJ
      ?auto_2480010 - OBJ
      ?auto_2480011 - OBJ
      ?auto_2480012 - OBJ
      ?auto_2480013 - OBJ
      ?auto_2480008 - LOCATION
    )
    :vars
    (
      ?auto_2480014 - TRUCK
      ?auto_2480015 - LOCATION
      ?auto_2480016 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2480010 ?auto_2480009 ) ) ( not ( = ?auto_2480011 ?auto_2480009 ) ) ( not ( = ?auto_2480011 ?auto_2480010 ) ) ( not ( = ?auto_2480012 ?auto_2480009 ) ) ( not ( = ?auto_2480012 ?auto_2480010 ) ) ( not ( = ?auto_2480012 ?auto_2480011 ) ) ( not ( = ?auto_2480013 ?auto_2480009 ) ) ( not ( = ?auto_2480013 ?auto_2480010 ) ) ( not ( = ?auto_2480013 ?auto_2480011 ) ) ( not ( = ?auto_2480013 ?auto_2480012 ) ) ( IN-TRUCK ?auto_2480010 ?auto_2480014 ) ( TRUCK-AT ?auto_2480014 ?auto_2480015 ) ( IN-CITY ?auto_2480015 ?auto_2480016 ) ( IN-CITY ?auto_2480008 ?auto_2480016 ) ( not ( = ?auto_2480008 ?auto_2480015 ) ) ( OBJ-AT ?auto_2480009 ?auto_2480008 ) ( OBJ-AT ?auto_2480011 ?auto_2480008 ) ( OBJ-AT ?auto_2480012 ?auto_2480008 ) ( OBJ-AT ?auto_2480013 ?auto_2480008 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2480009 ?auto_2480010 ?auto_2480008 )
      ( DELIVER-5PKG-VERIFY ?auto_2480009 ?auto_2480010 ?auto_2480011 ?auto_2480012 ?auto_2480013 ?auto_2480008 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2491391 - OBJ
      ?auto_2491392 - OBJ
      ?auto_2491393 - OBJ
      ?auto_2491394 - OBJ
      ?auto_2491395 - OBJ
      ?auto_2491390 - LOCATION
    )
    :vars
    (
      ?auto_2491396 - TRUCK
      ?auto_2491397 - LOCATION
      ?auto_2491398 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2491392 ?auto_2491391 ) ) ( not ( = ?auto_2491393 ?auto_2491391 ) ) ( not ( = ?auto_2491393 ?auto_2491392 ) ) ( not ( = ?auto_2491394 ?auto_2491391 ) ) ( not ( = ?auto_2491394 ?auto_2491392 ) ) ( not ( = ?auto_2491394 ?auto_2491393 ) ) ( not ( = ?auto_2491395 ?auto_2491391 ) ) ( not ( = ?auto_2491395 ?auto_2491392 ) ) ( not ( = ?auto_2491395 ?auto_2491393 ) ) ( not ( = ?auto_2491395 ?auto_2491394 ) ) ( IN-TRUCK ?auto_2491391 ?auto_2491396 ) ( TRUCK-AT ?auto_2491396 ?auto_2491397 ) ( IN-CITY ?auto_2491397 ?auto_2491398 ) ( IN-CITY ?auto_2491390 ?auto_2491398 ) ( not ( = ?auto_2491390 ?auto_2491397 ) ) ( OBJ-AT ?auto_2491392 ?auto_2491390 ) ( OBJ-AT ?auto_2491393 ?auto_2491390 ) ( OBJ-AT ?auto_2491394 ?auto_2491390 ) ( OBJ-AT ?auto_2491395 ?auto_2491390 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2491392 ?auto_2491391 ?auto_2491390 )
      ( DELIVER-5PKG-VERIFY ?auto_2491391 ?auto_2491392 ?auto_2491393 ?auto_2491394 ?auto_2491395 ?auto_2491390 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2500816 - OBJ
      ?auto_2500817 - OBJ
      ?auto_2500818 - OBJ
      ?auto_2500819 - OBJ
      ?auto_2500820 - OBJ
      ?auto_2500815 - LOCATION
    )
    :vars
    (
      ?auto_2500821 - TRUCK
      ?auto_2500822 - LOCATION
      ?auto_2500823 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2500817 ?auto_2500816 ) ) ( not ( = ?auto_2500818 ?auto_2500816 ) ) ( not ( = ?auto_2500818 ?auto_2500817 ) ) ( not ( = ?auto_2500819 ?auto_2500816 ) ) ( not ( = ?auto_2500819 ?auto_2500817 ) ) ( not ( = ?auto_2500819 ?auto_2500818 ) ) ( not ( = ?auto_2500820 ?auto_2500816 ) ) ( not ( = ?auto_2500820 ?auto_2500817 ) ) ( not ( = ?auto_2500820 ?auto_2500818 ) ) ( not ( = ?auto_2500820 ?auto_2500819 ) ) ( TRUCK-AT ?auto_2500821 ?auto_2500822 ) ( IN-CITY ?auto_2500822 ?auto_2500823 ) ( IN-CITY ?auto_2500815 ?auto_2500823 ) ( not ( = ?auto_2500815 ?auto_2500822 ) ) ( OBJ-AT ?auto_2500816 ?auto_2500815 ) ( OBJ-AT ?auto_2500820 ?auto_2500822 ) ( OBJ-AT ?auto_2500817 ?auto_2500815 ) ( OBJ-AT ?auto_2500818 ?auto_2500815 ) ( OBJ-AT ?auto_2500819 ?auto_2500815 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2500816 ?auto_2500820 ?auto_2500815 )
      ( DELIVER-5PKG-VERIFY ?auto_2500816 ?auto_2500817 ?auto_2500818 ?auto_2500819 ?auto_2500820 ?auto_2500815 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2500852 - OBJ
      ?auto_2500853 - OBJ
      ?auto_2500854 - OBJ
      ?auto_2500855 - OBJ
      ?auto_2500856 - OBJ
      ?auto_2500851 - LOCATION
    )
    :vars
    (
      ?auto_2500857 - TRUCK
      ?auto_2500858 - LOCATION
      ?auto_2500859 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2500853 ?auto_2500852 ) ) ( not ( = ?auto_2500854 ?auto_2500852 ) ) ( not ( = ?auto_2500854 ?auto_2500853 ) ) ( not ( = ?auto_2500855 ?auto_2500852 ) ) ( not ( = ?auto_2500855 ?auto_2500853 ) ) ( not ( = ?auto_2500855 ?auto_2500854 ) ) ( not ( = ?auto_2500856 ?auto_2500852 ) ) ( not ( = ?auto_2500856 ?auto_2500853 ) ) ( not ( = ?auto_2500856 ?auto_2500854 ) ) ( not ( = ?auto_2500856 ?auto_2500855 ) ) ( TRUCK-AT ?auto_2500857 ?auto_2500858 ) ( IN-CITY ?auto_2500858 ?auto_2500859 ) ( IN-CITY ?auto_2500851 ?auto_2500859 ) ( not ( = ?auto_2500851 ?auto_2500858 ) ) ( OBJ-AT ?auto_2500852 ?auto_2500851 ) ( OBJ-AT ?auto_2500855 ?auto_2500858 ) ( OBJ-AT ?auto_2500853 ?auto_2500851 ) ( OBJ-AT ?auto_2500854 ?auto_2500851 ) ( OBJ-AT ?auto_2500856 ?auto_2500851 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2500852 ?auto_2500855 ?auto_2500851 )
      ( DELIVER-5PKG-VERIFY ?auto_2500852 ?auto_2500853 ?auto_2500854 ?auto_2500855 ?auto_2500856 ?auto_2500851 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2501062 - OBJ
      ?auto_2501063 - OBJ
      ?auto_2501064 - OBJ
      ?auto_2501065 - OBJ
      ?auto_2501066 - OBJ
      ?auto_2501061 - LOCATION
    )
    :vars
    (
      ?auto_2501067 - TRUCK
      ?auto_2501068 - LOCATION
      ?auto_2501069 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2501063 ?auto_2501062 ) ) ( not ( = ?auto_2501064 ?auto_2501062 ) ) ( not ( = ?auto_2501064 ?auto_2501063 ) ) ( not ( = ?auto_2501065 ?auto_2501062 ) ) ( not ( = ?auto_2501065 ?auto_2501063 ) ) ( not ( = ?auto_2501065 ?auto_2501064 ) ) ( not ( = ?auto_2501066 ?auto_2501062 ) ) ( not ( = ?auto_2501066 ?auto_2501063 ) ) ( not ( = ?auto_2501066 ?auto_2501064 ) ) ( not ( = ?auto_2501066 ?auto_2501065 ) ) ( TRUCK-AT ?auto_2501067 ?auto_2501068 ) ( IN-CITY ?auto_2501068 ?auto_2501069 ) ( IN-CITY ?auto_2501061 ?auto_2501069 ) ( not ( = ?auto_2501061 ?auto_2501068 ) ) ( OBJ-AT ?auto_2501062 ?auto_2501061 ) ( OBJ-AT ?auto_2501064 ?auto_2501068 ) ( OBJ-AT ?auto_2501063 ?auto_2501061 ) ( OBJ-AT ?auto_2501065 ?auto_2501061 ) ( OBJ-AT ?auto_2501066 ?auto_2501061 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2501062 ?auto_2501064 ?auto_2501061 )
      ( DELIVER-5PKG-VERIFY ?auto_2501062 ?auto_2501063 ?auto_2501064 ?auto_2501065 ?auto_2501066 ?auto_2501061 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2502571 - OBJ
      ?auto_2502572 - OBJ
      ?auto_2502573 - OBJ
      ?auto_2502574 - OBJ
      ?auto_2502575 - OBJ
      ?auto_2502570 - LOCATION
    )
    :vars
    (
      ?auto_2502576 - TRUCK
      ?auto_2502577 - LOCATION
      ?auto_2502578 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2502572 ?auto_2502571 ) ) ( not ( = ?auto_2502573 ?auto_2502571 ) ) ( not ( = ?auto_2502573 ?auto_2502572 ) ) ( not ( = ?auto_2502574 ?auto_2502571 ) ) ( not ( = ?auto_2502574 ?auto_2502572 ) ) ( not ( = ?auto_2502574 ?auto_2502573 ) ) ( not ( = ?auto_2502575 ?auto_2502571 ) ) ( not ( = ?auto_2502575 ?auto_2502572 ) ) ( not ( = ?auto_2502575 ?auto_2502573 ) ) ( not ( = ?auto_2502575 ?auto_2502574 ) ) ( TRUCK-AT ?auto_2502576 ?auto_2502577 ) ( IN-CITY ?auto_2502577 ?auto_2502578 ) ( IN-CITY ?auto_2502570 ?auto_2502578 ) ( not ( = ?auto_2502570 ?auto_2502577 ) ) ( OBJ-AT ?auto_2502571 ?auto_2502570 ) ( OBJ-AT ?auto_2502572 ?auto_2502577 ) ( OBJ-AT ?auto_2502573 ?auto_2502570 ) ( OBJ-AT ?auto_2502574 ?auto_2502570 ) ( OBJ-AT ?auto_2502575 ?auto_2502570 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2502571 ?auto_2502572 ?auto_2502570 )
      ( DELIVER-5PKG-VERIFY ?auto_2502571 ?auto_2502572 ?auto_2502573 ?auto_2502574 ?auto_2502575 ?auto_2502570 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2513953 - OBJ
      ?auto_2513954 - OBJ
      ?auto_2513955 - OBJ
      ?auto_2513956 - OBJ
      ?auto_2513957 - OBJ
      ?auto_2513952 - LOCATION
    )
    :vars
    (
      ?auto_2513958 - TRUCK
      ?auto_2513959 - LOCATION
      ?auto_2513960 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2513954 ?auto_2513953 ) ) ( not ( = ?auto_2513955 ?auto_2513953 ) ) ( not ( = ?auto_2513955 ?auto_2513954 ) ) ( not ( = ?auto_2513956 ?auto_2513953 ) ) ( not ( = ?auto_2513956 ?auto_2513954 ) ) ( not ( = ?auto_2513956 ?auto_2513955 ) ) ( not ( = ?auto_2513957 ?auto_2513953 ) ) ( not ( = ?auto_2513957 ?auto_2513954 ) ) ( not ( = ?auto_2513957 ?auto_2513955 ) ) ( not ( = ?auto_2513957 ?auto_2513956 ) ) ( TRUCK-AT ?auto_2513958 ?auto_2513959 ) ( IN-CITY ?auto_2513959 ?auto_2513960 ) ( IN-CITY ?auto_2513952 ?auto_2513960 ) ( not ( = ?auto_2513952 ?auto_2513959 ) ) ( OBJ-AT ?auto_2513954 ?auto_2513952 ) ( OBJ-AT ?auto_2513953 ?auto_2513959 ) ( OBJ-AT ?auto_2513955 ?auto_2513952 ) ( OBJ-AT ?auto_2513956 ?auto_2513952 ) ( OBJ-AT ?auto_2513957 ?auto_2513952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2513954 ?auto_2513953 ?auto_2513952 )
      ( DELIVER-5PKG-VERIFY ?auto_2513953 ?auto_2513954 ?auto_2513955 ?auto_2513956 ?auto_2513957 ?auto_2513952 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2523378 - OBJ
      ?auto_2523379 - OBJ
      ?auto_2523380 - OBJ
      ?auto_2523381 - OBJ
      ?auto_2523382 - OBJ
      ?auto_2523377 - LOCATION
    )
    :vars
    (
      ?auto_2523384 - LOCATION
      ?auto_2523385 - CITY
      ?auto_2523383 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2523379 ?auto_2523378 ) ) ( not ( = ?auto_2523380 ?auto_2523378 ) ) ( not ( = ?auto_2523380 ?auto_2523379 ) ) ( not ( = ?auto_2523381 ?auto_2523378 ) ) ( not ( = ?auto_2523381 ?auto_2523379 ) ) ( not ( = ?auto_2523381 ?auto_2523380 ) ) ( not ( = ?auto_2523382 ?auto_2523378 ) ) ( not ( = ?auto_2523382 ?auto_2523379 ) ) ( not ( = ?auto_2523382 ?auto_2523380 ) ) ( not ( = ?auto_2523382 ?auto_2523381 ) ) ( IN-CITY ?auto_2523384 ?auto_2523385 ) ( IN-CITY ?auto_2523377 ?auto_2523385 ) ( not ( = ?auto_2523377 ?auto_2523384 ) ) ( OBJ-AT ?auto_2523378 ?auto_2523377 ) ( OBJ-AT ?auto_2523382 ?auto_2523384 ) ( TRUCK-AT ?auto_2523383 ?auto_2523377 ) ( OBJ-AT ?auto_2523379 ?auto_2523377 ) ( OBJ-AT ?auto_2523380 ?auto_2523377 ) ( OBJ-AT ?auto_2523381 ?auto_2523377 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2523378 ?auto_2523382 ?auto_2523377 )
      ( DELIVER-5PKG-VERIFY ?auto_2523378 ?auto_2523379 ?auto_2523380 ?auto_2523381 ?auto_2523382 ?auto_2523377 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2523414 - OBJ
      ?auto_2523415 - OBJ
      ?auto_2523416 - OBJ
      ?auto_2523417 - OBJ
      ?auto_2523418 - OBJ
      ?auto_2523413 - LOCATION
    )
    :vars
    (
      ?auto_2523420 - LOCATION
      ?auto_2523421 - CITY
      ?auto_2523419 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2523415 ?auto_2523414 ) ) ( not ( = ?auto_2523416 ?auto_2523414 ) ) ( not ( = ?auto_2523416 ?auto_2523415 ) ) ( not ( = ?auto_2523417 ?auto_2523414 ) ) ( not ( = ?auto_2523417 ?auto_2523415 ) ) ( not ( = ?auto_2523417 ?auto_2523416 ) ) ( not ( = ?auto_2523418 ?auto_2523414 ) ) ( not ( = ?auto_2523418 ?auto_2523415 ) ) ( not ( = ?auto_2523418 ?auto_2523416 ) ) ( not ( = ?auto_2523418 ?auto_2523417 ) ) ( IN-CITY ?auto_2523420 ?auto_2523421 ) ( IN-CITY ?auto_2523413 ?auto_2523421 ) ( not ( = ?auto_2523413 ?auto_2523420 ) ) ( OBJ-AT ?auto_2523414 ?auto_2523413 ) ( OBJ-AT ?auto_2523417 ?auto_2523420 ) ( TRUCK-AT ?auto_2523419 ?auto_2523413 ) ( OBJ-AT ?auto_2523415 ?auto_2523413 ) ( OBJ-AT ?auto_2523416 ?auto_2523413 ) ( OBJ-AT ?auto_2523418 ?auto_2523413 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2523414 ?auto_2523417 ?auto_2523413 )
      ( DELIVER-5PKG-VERIFY ?auto_2523414 ?auto_2523415 ?auto_2523416 ?auto_2523417 ?auto_2523418 ?auto_2523413 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2523624 - OBJ
      ?auto_2523625 - OBJ
      ?auto_2523626 - OBJ
      ?auto_2523627 - OBJ
      ?auto_2523628 - OBJ
      ?auto_2523623 - LOCATION
    )
    :vars
    (
      ?auto_2523630 - LOCATION
      ?auto_2523631 - CITY
      ?auto_2523629 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2523625 ?auto_2523624 ) ) ( not ( = ?auto_2523626 ?auto_2523624 ) ) ( not ( = ?auto_2523626 ?auto_2523625 ) ) ( not ( = ?auto_2523627 ?auto_2523624 ) ) ( not ( = ?auto_2523627 ?auto_2523625 ) ) ( not ( = ?auto_2523627 ?auto_2523626 ) ) ( not ( = ?auto_2523628 ?auto_2523624 ) ) ( not ( = ?auto_2523628 ?auto_2523625 ) ) ( not ( = ?auto_2523628 ?auto_2523626 ) ) ( not ( = ?auto_2523628 ?auto_2523627 ) ) ( IN-CITY ?auto_2523630 ?auto_2523631 ) ( IN-CITY ?auto_2523623 ?auto_2523631 ) ( not ( = ?auto_2523623 ?auto_2523630 ) ) ( OBJ-AT ?auto_2523624 ?auto_2523623 ) ( OBJ-AT ?auto_2523626 ?auto_2523630 ) ( TRUCK-AT ?auto_2523629 ?auto_2523623 ) ( OBJ-AT ?auto_2523625 ?auto_2523623 ) ( OBJ-AT ?auto_2523627 ?auto_2523623 ) ( OBJ-AT ?auto_2523628 ?auto_2523623 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2523624 ?auto_2523626 ?auto_2523623 )
      ( DELIVER-5PKG-VERIFY ?auto_2523624 ?auto_2523625 ?auto_2523626 ?auto_2523627 ?auto_2523628 ?auto_2523623 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2525133 - OBJ
      ?auto_2525134 - OBJ
      ?auto_2525135 - OBJ
      ?auto_2525136 - OBJ
      ?auto_2525137 - OBJ
      ?auto_2525132 - LOCATION
    )
    :vars
    (
      ?auto_2525139 - LOCATION
      ?auto_2525140 - CITY
      ?auto_2525138 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2525134 ?auto_2525133 ) ) ( not ( = ?auto_2525135 ?auto_2525133 ) ) ( not ( = ?auto_2525135 ?auto_2525134 ) ) ( not ( = ?auto_2525136 ?auto_2525133 ) ) ( not ( = ?auto_2525136 ?auto_2525134 ) ) ( not ( = ?auto_2525136 ?auto_2525135 ) ) ( not ( = ?auto_2525137 ?auto_2525133 ) ) ( not ( = ?auto_2525137 ?auto_2525134 ) ) ( not ( = ?auto_2525137 ?auto_2525135 ) ) ( not ( = ?auto_2525137 ?auto_2525136 ) ) ( IN-CITY ?auto_2525139 ?auto_2525140 ) ( IN-CITY ?auto_2525132 ?auto_2525140 ) ( not ( = ?auto_2525132 ?auto_2525139 ) ) ( OBJ-AT ?auto_2525133 ?auto_2525132 ) ( OBJ-AT ?auto_2525134 ?auto_2525139 ) ( TRUCK-AT ?auto_2525138 ?auto_2525132 ) ( OBJ-AT ?auto_2525135 ?auto_2525132 ) ( OBJ-AT ?auto_2525136 ?auto_2525132 ) ( OBJ-AT ?auto_2525137 ?auto_2525132 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2525133 ?auto_2525134 ?auto_2525132 )
      ( DELIVER-5PKG-VERIFY ?auto_2525133 ?auto_2525134 ?auto_2525135 ?auto_2525136 ?auto_2525137 ?auto_2525132 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2536515 - OBJ
      ?auto_2536516 - OBJ
      ?auto_2536517 - OBJ
      ?auto_2536518 - OBJ
      ?auto_2536519 - OBJ
      ?auto_2536514 - LOCATION
    )
    :vars
    (
      ?auto_2536521 - LOCATION
      ?auto_2536522 - CITY
      ?auto_2536520 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2536516 ?auto_2536515 ) ) ( not ( = ?auto_2536517 ?auto_2536515 ) ) ( not ( = ?auto_2536517 ?auto_2536516 ) ) ( not ( = ?auto_2536518 ?auto_2536515 ) ) ( not ( = ?auto_2536518 ?auto_2536516 ) ) ( not ( = ?auto_2536518 ?auto_2536517 ) ) ( not ( = ?auto_2536519 ?auto_2536515 ) ) ( not ( = ?auto_2536519 ?auto_2536516 ) ) ( not ( = ?auto_2536519 ?auto_2536517 ) ) ( not ( = ?auto_2536519 ?auto_2536518 ) ) ( IN-CITY ?auto_2536521 ?auto_2536522 ) ( IN-CITY ?auto_2536514 ?auto_2536522 ) ( not ( = ?auto_2536514 ?auto_2536521 ) ) ( OBJ-AT ?auto_2536516 ?auto_2536514 ) ( OBJ-AT ?auto_2536515 ?auto_2536521 ) ( TRUCK-AT ?auto_2536520 ?auto_2536514 ) ( OBJ-AT ?auto_2536517 ?auto_2536514 ) ( OBJ-AT ?auto_2536518 ?auto_2536514 ) ( OBJ-AT ?auto_2536519 ?auto_2536514 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2536516 ?auto_2536515 ?auto_2536514 )
      ( DELIVER-5PKG-VERIFY ?auto_2536515 ?auto_2536516 ?auto_2536517 ?auto_2536518 ?auto_2536519 ?auto_2536514 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2565790 - OBJ
      ?auto_2565791 - OBJ
      ?auto_2565792 - OBJ
      ?auto_2565793 - OBJ
      ?auto_2565789 - LOCATION
    )
    :vars
    (
      ?auto_2565794 - LOCATION
      ?auto_2565796 - CITY
      ?auto_2565797 - TRUCK
      ?auto_2565795 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2565791 ?auto_2565790 ) ) ( not ( = ?auto_2565792 ?auto_2565790 ) ) ( not ( = ?auto_2565792 ?auto_2565791 ) ) ( not ( = ?auto_2565793 ?auto_2565790 ) ) ( not ( = ?auto_2565793 ?auto_2565791 ) ) ( not ( = ?auto_2565793 ?auto_2565792 ) ) ( IN-CITY ?auto_2565794 ?auto_2565796 ) ( IN-CITY ?auto_2565789 ?auto_2565796 ) ( not ( = ?auto_2565789 ?auto_2565794 ) ) ( OBJ-AT ?auto_2565790 ?auto_2565789 ) ( OBJ-AT ?auto_2565793 ?auto_2565794 ) ( TRUCK-AT ?auto_2565797 ?auto_2565795 ) ( IN-CITY ?auto_2565795 ?auto_2565796 ) ( not ( = ?auto_2565789 ?auto_2565795 ) ) ( not ( = ?auto_2565794 ?auto_2565795 ) ) ( OBJ-AT ?auto_2565791 ?auto_2565789 ) ( OBJ-AT ?auto_2565792 ?auto_2565789 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2565790 ?auto_2565793 ?auto_2565789 )
      ( DELIVER-4PKG-VERIFY ?auto_2565790 ?auto_2565791 ?auto_2565792 ?auto_2565793 ?auto_2565789 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2565826 - OBJ
      ?auto_2565827 - OBJ
      ?auto_2565828 - OBJ
      ?auto_2565829 - OBJ
      ?auto_2565825 - LOCATION
    )
    :vars
    (
      ?auto_2565830 - LOCATION
      ?auto_2565832 - CITY
      ?auto_2565833 - TRUCK
      ?auto_2565831 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2565827 ?auto_2565826 ) ) ( not ( = ?auto_2565828 ?auto_2565826 ) ) ( not ( = ?auto_2565828 ?auto_2565827 ) ) ( not ( = ?auto_2565829 ?auto_2565826 ) ) ( not ( = ?auto_2565829 ?auto_2565827 ) ) ( not ( = ?auto_2565829 ?auto_2565828 ) ) ( IN-CITY ?auto_2565830 ?auto_2565832 ) ( IN-CITY ?auto_2565825 ?auto_2565832 ) ( not ( = ?auto_2565825 ?auto_2565830 ) ) ( OBJ-AT ?auto_2565826 ?auto_2565825 ) ( OBJ-AT ?auto_2565828 ?auto_2565830 ) ( TRUCK-AT ?auto_2565833 ?auto_2565831 ) ( IN-CITY ?auto_2565831 ?auto_2565832 ) ( not ( = ?auto_2565825 ?auto_2565831 ) ) ( not ( = ?auto_2565830 ?auto_2565831 ) ) ( OBJ-AT ?auto_2565827 ?auto_2565825 ) ( OBJ-AT ?auto_2565829 ?auto_2565825 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2565826 ?auto_2565828 ?auto_2565825 )
      ( DELIVER-4PKG-VERIFY ?auto_2565826 ?auto_2565827 ?auto_2565828 ?auto_2565829 ?auto_2565825 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2566070 - OBJ
      ?auto_2566071 - OBJ
      ?auto_2566072 - OBJ
      ?auto_2566073 - OBJ
      ?auto_2566069 - LOCATION
    )
    :vars
    (
      ?auto_2566074 - LOCATION
      ?auto_2566076 - CITY
      ?auto_2566077 - TRUCK
      ?auto_2566075 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2566071 ?auto_2566070 ) ) ( not ( = ?auto_2566072 ?auto_2566070 ) ) ( not ( = ?auto_2566072 ?auto_2566071 ) ) ( not ( = ?auto_2566073 ?auto_2566070 ) ) ( not ( = ?auto_2566073 ?auto_2566071 ) ) ( not ( = ?auto_2566073 ?auto_2566072 ) ) ( IN-CITY ?auto_2566074 ?auto_2566076 ) ( IN-CITY ?auto_2566069 ?auto_2566076 ) ( not ( = ?auto_2566069 ?auto_2566074 ) ) ( OBJ-AT ?auto_2566070 ?auto_2566069 ) ( OBJ-AT ?auto_2566071 ?auto_2566074 ) ( TRUCK-AT ?auto_2566077 ?auto_2566075 ) ( IN-CITY ?auto_2566075 ?auto_2566076 ) ( not ( = ?auto_2566069 ?auto_2566075 ) ) ( not ( = ?auto_2566074 ?auto_2566075 ) ) ( OBJ-AT ?auto_2566072 ?auto_2566069 ) ( OBJ-AT ?auto_2566073 ?auto_2566069 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2566070 ?auto_2566071 ?auto_2566069 )
      ( DELIVER-4PKG-VERIFY ?auto_2566070 ?auto_2566071 ?auto_2566072 ?auto_2566073 ?auto_2566069 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2568001 - OBJ
      ?auto_2568002 - OBJ
      ?auto_2568003 - OBJ
      ?auto_2568004 - OBJ
      ?auto_2568000 - LOCATION
    )
    :vars
    (
      ?auto_2568005 - LOCATION
      ?auto_2568007 - CITY
      ?auto_2568008 - TRUCK
      ?auto_2568006 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2568002 ?auto_2568001 ) ) ( not ( = ?auto_2568003 ?auto_2568001 ) ) ( not ( = ?auto_2568003 ?auto_2568002 ) ) ( not ( = ?auto_2568004 ?auto_2568001 ) ) ( not ( = ?auto_2568004 ?auto_2568002 ) ) ( not ( = ?auto_2568004 ?auto_2568003 ) ) ( IN-CITY ?auto_2568005 ?auto_2568007 ) ( IN-CITY ?auto_2568000 ?auto_2568007 ) ( not ( = ?auto_2568000 ?auto_2568005 ) ) ( OBJ-AT ?auto_2568002 ?auto_2568000 ) ( OBJ-AT ?auto_2568001 ?auto_2568005 ) ( TRUCK-AT ?auto_2568008 ?auto_2568006 ) ( IN-CITY ?auto_2568006 ?auto_2568007 ) ( not ( = ?auto_2568000 ?auto_2568006 ) ) ( not ( = ?auto_2568005 ?auto_2568006 ) ) ( OBJ-AT ?auto_2568003 ?auto_2568000 ) ( OBJ-AT ?auto_2568004 ?auto_2568000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2568002 ?auto_2568001 ?auto_2568000 )
      ( DELIVER-4PKG-VERIFY ?auto_2568001 ?auto_2568002 ?auto_2568003 ?auto_2568004 ?auto_2568000 ) )
  )

)

