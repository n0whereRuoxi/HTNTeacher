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
      ?auto_7578 - OBJ
      ?auto_7577 - LOCATION
    )
    :vars
    (
      ?auto_7580 - LOCATION
      ?auto_7581 - CITY
      ?auto_7579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7580 ?auto_7581 ) ( IN-CITY ?auto_7577 ?auto_7581 ) ( not ( = ?auto_7577 ?auto_7580 ) ) ( OBJ-AT ?auto_7578 ?auto_7580 ) ( TRUCK-AT ?auto_7579 ?auto_7577 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7579 ?auto_7577 ?auto_7580 ?auto_7581 )
      ( !LOAD-TRUCK ?auto_7578 ?auto_7579 ?auto_7580 )
      ( !DRIVE-TRUCK ?auto_7579 ?auto_7580 ?auto_7577 ?auto_7581 )
      ( !UNLOAD-TRUCK ?auto_7578 ?auto_7579 ?auto_7577 )
      ( DELIVER-1PKG-VERIFY ?auto_7578 ?auto_7577 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7599 - OBJ
      ?auto_7600 - OBJ
      ?auto_7598 - LOCATION
    )
    :vars
    (
      ?auto_7601 - LOCATION
      ?auto_7602 - CITY
      ?auto_7604 - LOCATION
      ?auto_7603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7601 ?auto_7602 ) ( IN-CITY ?auto_7598 ?auto_7602 ) ( not ( = ?auto_7598 ?auto_7601 ) ) ( OBJ-AT ?auto_7600 ?auto_7601 ) ( IN-CITY ?auto_7604 ?auto_7602 ) ( not ( = ?auto_7598 ?auto_7604 ) ) ( OBJ-AT ?auto_7599 ?auto_7604 ) ( TRUCK-AT ?auto_7603 ?auto_7598 ) ( not ( = ?auto_7599 ?auto_7600 ) ) ( not ( = ?auto_7601 ?auto_7604 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7599 ?auto_7598 )
      ( DELIVER-1PKG ?auto_7600 ?auto_7598 )
      ( DELIVER-2PKG-VERIFY ?auto_7599 ?auto_7600 ?auto_7598 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7709 - OBJ
      ?auto_7710 - OBJ
      ?auto_7711 - OBJ
      ?auto_7708 - LOCATION
    )
    :vars
    (
      ?auto_7712 - LOCATION
      ?auto_7714 - CITY
      ?auto_7715 - LOCATION
      ?auto_7713 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7712 ?auto_7714 ) ( IN-CITY ?auto_7708 ?auto_7714 ) ( not ( = ?auto_7708 ?auto_7712 ) ) ( OBJ-AT ?auto_7711 ?auto_7712 ) ( OBJ-AT ?auto_7710 ?auto_7712 ) ( IN-CITY ?auto_7715 ?auto_7714 ) ( not ( = ?auto_7708 ?auto_7715 ) ) ( OBJ-AT ?auto_7709 ?auto_7715 ) ( TRUCK-AT ?auto_7713 ?auto_7708 ) ( not ( = ?auto_7709 ?auto_7710 ) ) ( not ( = ?auto_7712 ?auto_7715 ) ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( not ( = ?auto_7710 ?auto_7711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7709 ?auto_7710 ?auto_7708 )
      ( DELIVER-1PKG ?auto_7711 ?auto_7708 )
      ( DELIVER-3PKG-VERIFY ?auto_7709 ?auto_7710 ?auto_7711 ?auto_7708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7739 - OBJ
      ?auto_7740 - OBJ
      ?auto_7741 - OBJ
      ?auto_7738 - LOCATION
    )
    :vars
    (
      ?auto_7745 - LOCATION
      ?auto_7744 - CITY
      ?auto_7742 - LOCATION
      ?auto_7743 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7745 ?auto_7744 ) ( IN-CITY ?auto_7738 ?auto_7744 ) ( not ( = ?auto_7738 ?auto_7745 ) ) ( OBJ-AT ?auto_7741 ?auto_7745 ) ( OBJ-AT ?auto_7739 ?auto_7745 ) ( IN-CITY ?auto_7742 ?auto_7744 ) ( not ( = ?auto_7738 ?auto_7742 ) ) ( OBJ-AT ?auto_7740 ?auto_7742 ) ( TRUCK-AT ?auto_7743 ?auto_7738 ) ( not ( = ?auto_7740 ?auto_7739 ) ) ( not ( = ?auto_7745 ?auto_7742 ) ) ( not ( = ?auto_7740 ?auto_7741 ) ) ( not ( = ?auto_7739 ?auto_7741 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7740 ?auto_7739 ?auto_7741 ?auto_7738 )
      ( DELIVER-3PKG-VERIFY ?auto_7739 ?auto_7740 ?auto_7741 ?auto_7738 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7756 - OBJ
      ?auto_7757 - OBJ
      ?auto_7758 - OBJ
      ?auto_7755 - LOCATION
    )
    :vars
    (
      ?auto_7761 - LOCATION
      ?auto_7760 - CITY
      ?auto_7759 - LOCATION
      ?auto_7762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7761 ?auto_7760 ) ( IN-CITY ?auto_7755 ?auto_7760 ) ( not ( = ?auto_7755 ?auto_7761 ) ) ( OBJ-AT ?auto_7757 ?auto_7761 ) ( OBJ-AT ?auto_7756 ?auto_7761 ) ( IN-CITY ?auto_7759 ?auto_7760 ) ( not ( = ?auto_7755 ?auto_7759 ) ) ( OBJ-AT ?auto_7758 ?auto_7759 ) ( TRUCK-AT ?auto_7762 ?auto_7755 ) ( not ( = ?auto_7758 ?auto_7756 ) ) ( not ( = ?auto_7761 ?auto_7759 ) ) ( not ( = ?auto_7758 ?auto_7757 ) ) ( not ( = ?auto_7756 ?auto_7757 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7756 ?auto_7758 ?auto_7757 ?auto_7755 )
      ( DELIVER-3PKG-VERIFY ?auto_7756 ?auto_7757 ?auto_7758 ?auto_7755 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8838 - OBJ
      ?auto_8839 - OBJ
      ?auto_8840 - OBJ
      ?auto_8841 - OBJ
      ?auto_8837 - LOCATION
    )
    :vars
    (
      ?auto_8842 - LOCATION
      ?auto_8844 - CITY
      ?auto_8846 - LOCATION
      ?auto_8845 - LOCATION
      ?auto_8843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8842 ?auto_8844 ) ( IN-CITY ?auto_8837 ?auto_8844 ) ( not ( = ?auto_8837 ?auto_8842 ) ) ( OBJ-AT ?auto_8841 ?auto_8842 ) ( IN-CITY ?auto_8846 ?auto_8844 ) ( not ( = ?auto_8837 ?auto_8846 ) ) ( OBJ-AT ?auto_8840 ?auto_8846 ) ( OBJ-AT ?auto_8839 ?auto_8846 ) ( IN-CITY ?auto_8845 ?auto_8844 ) ( not ( = ?auto_8837 ?auto_8845 ) ) ( OBJ-AT ?auto_8838 ?auto_8845 ) ( TRUCK-AT ?auto_8843 ?auto_8837 ) ( not ( = ?auto_8838 ?auto_8839 ) ) ( not ( = ?auto_8846 ?auto_8845 ) ) ( not ( = ?auto_8838 ?auto_8840 ) ) ( not ( = ?auto_8839 ?auto_8840 ) ) ( not ( = ?auto_8838 ?auto_8841 ) ) ( not ( = ?auto_8839 ?auto_8841 ) ) ( not ( = ?auto_8840 ?auto_8841 ) ) ( not ( = ?auto_8842 ?auto_8846 ) ) ( not ( = ?auto_8842 ?auto_8845 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8839 ?auto_8838 ?auto_8840 ?auto_8837 )
      ( DELIVER-1PKG ?auto_8841 ?auto_8837 )
      ( DELIVER-4PKG-VERIFY ?auto_8838 ?auto_8839 ?auto_8840 ?auto_8841 ?auto_8837 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8870 - OBJ
      ?auto_8871 - OBJ
      ?auto_8872 - OBJ
      ?auto_8873 - OBJ
      ?auto_8869 - LOCATION
    )
    :vars
    (
      ?auto_8878 - LOCATION
      ?auto_8876 - CITY
      ?auto_8877 - LOCATION
      ?auto_8874 - LOCATION
      ?auto_8875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8878 ?auto_8876 ) ( IN-CITY ?auto_8869 ?auto_8876 ) ( not ( = ?auto_8869 ?auto_8878 ) ) ( OBJ-AT ?auto_8872 ?auto_8878 ) ( IN-CITY ?auto_8877 ?auto_8876 ) ( not ( = ?auto_8869 ?auto_8877 ) ) ( OBJ-AT ?auto_8873 ?auto_8877 ) ( OBJ-AT ?auto_8871 ?auto_8877 ) ( IN-CITY ?auto_8874 ?auto_8876 ) ( not ( = ?auto_8869 ?auto_8874 ) ) ( OBJ-AT ?auto_8870 ?auto_8874 ) ( TRUCK-AT ?auto_8875 ?auto_8869 ) ( not ( = ?auto_8870 ?auto_8871 ) ) ( not ( = ?auto_8877 ?auto_8874 ) ) ( not ( = ?auto_8870 ?auto_8873 ) ) ( not ( = ?auto_8871 ?auto_8873 ) ) ( not ( = ?auto_8870 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8872 ) ) ( not ( = ?auto_8873 ?auto_8872 ) ) ( not ( = ?auto_8878 ?auto_8877 ) ) ( not ( = ?auto_8878 ?auto_8874 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_8870 ?auto_8871 ?auto_8873 ?auto_8872 ?auto_8869 )
      ( DELIVER-4PKG-VERIFY ?auto_8870 ?auto_8871 ?auto_8872 ?auto_8873 ?auto_8869 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9024 - OBJ
      ?auto_9025 - OBJ
      ?auto_9026 - OBJ
      ?auto_9027 - OBJ
      ?auto_9023 - LOCATION
    )
    :vars
    (
      ?auto_9028 - LOCATION
      ?auto_9030 - CITY
      ?auto_9029 - LOCATION
      ?auto_9032 - LOCATION
      ?auto_9031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9028 ?auto_9030 ) ( IN-CITY ?auto_9023 ?auto_9030 ) ( not ( = ?auto_9023 ?auto_9028 ) ) ( OBJ-AT ?auto_9025 ?auto_9028 ) ( IN-CITY ?auto_9029 ?auto_9030 ) ( not ( = ?auto_9023 ?auto_9029 ) ) ( OBJ-AT ?auto_9027 ?auto_9029 ) ( OBJ-AT ?auto_9026 ?auto_9029 ) ( IN-CITY ?auto_9032 ?auto_9030 ) ( not ( = ?auto_9023 ?auto_9032 ) ) ( OBJ-AT ?auto_9024 ?auto_9032 ) ( TRUCK-AT ?auto_9031 ?auto_9023 ) ( not ( = ?auto_9024 ?auto_9026 ) ) ( not ( = ?auto_9029 ?auto_9032 ) ) ( not ( = ?auto_9024 ?auto_9027 ) ) ( not ( = ?auto_9026 ?auto_9027 ) ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( not ( = ?auto_9026 ?auto_9025 ) ) ( not ( = ?auto_9027 ?auto_9025 ) ) ( not ( = ?auto_9028 ?auto_9029 ) ) ( not ( = ?auto_9028 ?auto_9032 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9024 ?auto_9026 ?auto_9025 ?auto_9027 ?auto_9023 )
      ( DELIVER-4PKG-VERIFY ?auto_9024 ?auto_9025 ?auto_9026 ?auto_9027 ?auto_9023 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9151 - OBJ
      ?auto_9152 - OBJ
      ?auto_9153 - OBJ
      ?auto_9154 - OBJ
      ?auto_9150 - LOCATION
    )
    :vars
    (
      ?auto_9155 - LOCATION
      ?auto_9157 - CITY
      ?auto_9156 - LOCATION
      ?auto_9159 - LOCATION
      ?auto_9158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9155 ?auto_9157 ) ( IN-CITY ?auto_9150 ?auto_9157 ) ( not ( = ?auto_9150 ?auto_9155 ) ) ( OBJ-AT ?auto_9154 ?auto_9155 ) ( IN-CITY ?auto_9156 ?auto_9157 ) ( not ( = ?auto_9150 ?auto_9156 ) ) ( OBJ-AT ?auto_9153 ?auto_9156 ) ( OBJ-AT ?auto_9151 ?auto_9156 ) ( IN-CITY ?auto_9159 ?auto_9157 ) ( not ( = ?auto_9150 ?auto_9159 ) ) ( OBJ-AT ?auto_9152 ?auto_9159 ) ( TRUCK-AT ?auto_9158 ?auto_9150 ) ( not ( = ?auto_9152 ?auto_9151 ) ) ( not ( = ?auto_9156 ?auto_9159 ) ) ( not ( = ?auto_9152 ?auto_9153 ) ) ( not ( = ?auto_9151 ?auto_9153 ) ) ( not ( = ?auto_9152 ?auto_9154 ) ) ( not ( = ?auto_9151 ?auto_9154 ) ) ( not ( = ?auto_9153 ?auto_9154 ) ) ( not ( = ?auto_9155 ?auto_9156 ) ) ( not ( = ?auto_9155 ?auto_9159 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9152 ?auto_9151 ?auto_9154 ?auto_9153 ?auto_9150 )
      ( DELIVER-4PKG-VERIFY ?auto_9151 ?auto_9152 ?auto_9153 ?auto_9154 ?auto_9150 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9183 - OBJ
      ?auto_9184 - OBJ
      ?auto_9185 - OBJ
      ?auto_9186 - OBJ
      ?auto_9182 - LOCATION
    )
    :vars
    (
      ?auto_9187 - LOCATION
      ?auto_9189 - CITY
      ?auto_9188 - LOCATION
      ?auto_9191 - LOCATION
      ?auto_9190 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9187 ?auto_9189 ) ( IN-CITY ?auto_9182 ?auto_9189 ) ( not ( = ?auto_9182 ?auto_9187 ) ) ( OBJ-AT ?auto_9185 ?auto_9187 ) ( IN-CITY ?auto_9188 ?auto_9189 ) ( not ( = ?auto_9182 ?auto_9188 ) ) ( OBJ-AT ?auto_9186 ?auto_9188 ) ( OBJ-AT ?auto_9183 ?auto_9188 ) ( IN-CITY ?auto_9191 ?auto_9189 ) ( not ( = ?auto_9182 ?auto_9191 ) ) ( OBJ-AT ?auto_9184 ?auto_9191 ) ( TRUCK-AT ?auto_9190 ?auto_9182 ) ( not ( = ?auto_9184 ?auto_9183 ) ) ( not ( = ?auto_9188 ?auto_9191 ) ) ( not ( = ?auto_9184 ?auto_9186 ) ) ( not ( = ?auto_9183 ?auto_9186 ) ) ( not ( = ?auto_9184 ?auto_9185 ) ) ( not ( = ?auto_9183 ?auto_9185 ) ) ( not ( = ?auto_9186 ?auto_9185 ) ) ( not ( = ?auto_9187 ?auto_9188 ) ) ( not ( = ?auto_9187 ?auto_9191 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9184 ?auto_9183 ?auto_9185 ?auto_9186 ?auto_9182 )
      ( DELIVER-4PKG-VERIFY ?auto_9183 ?auto_9184 ?auto_9185 ?auto_9186 ?auto_9182 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9284 - OBJ
      ?auto_9285 - OBJ
      ?auto_9286 - OBJ
      ?auto_9287 - OBJ
      ?auto_9283 - LOCATION
    )
    :vars
    (
      ?auto_9288 - LOCATION
      ?auto_9290 - CITY
      ?auto_9289 - LOCATION
      ?auto_9292 - LOCATION
      ?auto_9291 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9288 ?auto_9290 ) ( IN-CITY ?auto_9283 ?auto_9290 ) ( not ( = ?auto_9283 ?auto_9288 ) ) ( OBJ-AT ?auto_9287 ?auto_9288 ) ( IN-CITY ?auto_9289 ?auto_9290 ) ( not ( = ?auto_9283 ?auto_9289 ) ) ( OBJ-AT ?auto_9285 ?auto_9289 ) ( OBJ-AT ?auto_9284 ?auto_9289 ) ( IN-CITY ?auto_9292 ?auto_9290 ) ( not ( = ?auto_9283 ?auto_9292 ) ) ( OBJ-AT ?auto_9286 ?auto_9292 ) ( TRUCK-AT ?auto_9291 ?auto_9283 ) ( not ( = ?auto_9286 ?auto_9284 ) ) ( not ( = ?auto_9289 ?auto_9292 ) ) ( not ( = ?auto_9286 ?auto_9285 ) ) ( not ( = ?auto_9284 ?auto_9285 ) ) ( not ( = ?auto_9286 ?auto_9287 ) ) ( not ( = ?auto_9284 ?auto_9287 ) ) ( not ( = ?auto_9285 ?auto_9287 ) ) ( not ( = ?auto_9288 ?auto_9289 ) ) ( not ( = ?auto_9288 ?auto_9292 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9286 ?auto_9284 ?auto_9287 ?auto_9285 ?auto_9283 )
      ( DELIVER-4PKG-VERIFY ?auto_9284 ?auto_9285 ?auto_9286 ?auto_9287 ?auto_9283 ) )
  )

)

