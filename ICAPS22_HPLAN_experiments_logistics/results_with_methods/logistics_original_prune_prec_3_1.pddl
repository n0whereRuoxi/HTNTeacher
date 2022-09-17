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
      ?auto_6688 - OBJ
      ?auto_6689 - LOCATION
    )
    :vars
    (
      ?auto_6690 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6690 ?auto_6689 ) ( IN-TRUCK ?auto_6688 ?auto_6690 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6688 ?auto_6690 ?auto_6689 )
      ( DELIVER-1PKG-VERIFY ?auto_6688 ?auto_6689 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6706 - OBJ
      ?auto_6707 - LOCATION
    )
    :vars
    (
      ?auto_6708 - TRUCK
      ?auto_6712 - LOCATION
      ?auto_6713 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6706 ?auto_6708 ) ( TRUCK-AT ?auto_6708 ?auto_6712 ) ( IN-CITY ?auto_6712 ?auto_6713 ) ( IN-CITY ?auto_6707 ?auto_6713 ) ( not ( = ?auto_6707 ?auto_6712 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6708 ?auto_6712 ?auto_6707 ?auto_6713 )
      ( DELIVER-1PKG ?auto_6706 ?auto_6707 )
      ( DELIVER-1PKG-VERIFY ?auto_6706 ?auto_6707 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6732 - OBJ
      ?auto_6733 - LOCATION
    )
    :vars
    (
      ?auto_6736 - TRUCK
      ?auto_6738 - LOCATION
      ?auto_6737 - CITY
      ?auto_6740 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6736 ?auto_6738 ) ( IN-CITY ?auto_6738 ?auto_6737 ) ( IN-CITY ?auto_6733 ?auto_6737 ) ( not ( = ?auto_6733 ?auto_6738 ) ) ( TRUCK-AT ?auto_6736 ?auto_6740 ) ( OBJ-AT ?auto_6732 ?auto_6740 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6732 ?auto_6736 ?auto_6740 )
      ( DELIVER-1PKG ?auto_6732 ?auto_6733 )
      ( DELIVER-1PKG-VERIFY ?auto_6732 ?auto_6733 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6761 - OBJ
      ?auto_6762 - LOCATION
    )
    :vars
    (
      ?auto_6765 - LOCATION
      ?auto_6764 - CITY
      ?auto_6763 - TRUCK
      ?auto_6770 - LOCATION
      ?auto_6771 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_6765 ?auto_6764 ) ( IN-CITY ?auto_6762 ?auto_6764 ) ( not ( = ?auto_6762 ?auto_6765 ) ) ( OBJ-AT ?auto_6761 ?auto_6765 ) ( TRUCK-AT ?auto_6763 ?auto_6770 ) ( IN-CITY ?auto_6770 ?auto_6771 ) ( IN-CITY ?auto_6765 ?auto_6771 ) ( not ( = ?auto_6765 ?auto_6770 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6763 ?auto_6770 ?auto_6765 ?auto_6771 )
      ( DELIVER-1PKG ?auto_6761 ?auto_6762 )
      ( DELIVER-1PKG-VERIFY ?auto_6761 ?auto_6762 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6838 - OBJ
      ?auto_6840 - OBJ
      ?auto_6839 - LOCATION
    )
    :vars
    (
      ?auto_6841 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6840 ?auto_6838 ) ( TRUCK-AT ?auto_6841 ?auto_6839 ) ( IN-TRUCK ?auto_6840 ?auto_6841 ) ( OBJ-AT ?auto_6838 ?auto_6839 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6840 ?auto_6839 )
      ( DELIVER-2PKG-VERIFY ?auto_6838 ?auto_6840 ?auto_6839 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6914 - OBJ
      ?auto_6916 - OBJ
      ?auto_6915 - LOCATION
    )
    :vars
    (
      ?auto_6917 - TRUCK
      ?auto_6921 - LOCATION
      ?auto_6918 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6916 ?auto_6914 ) ( IN-TRUCK ?auto_6916 ?auto_6917 ) ( TRUCK-AT ?auto_6917 ?auto_6921 ) ( IN-CITY ?auto_6921 ?auto_6918 ) ( IN-CITY ?auto_6915 ?auto_6918 ) ( not ( = ?auto_6915 ?auto_6921 ) ) ( OBJ-AT ?auto_6914 ?auto_6915 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6916 ?auto_6915 )
      ( DELIVER-2PKG-VERIFY ?auto_6914 ?auto_6916 ?auto_6915 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7010 - OBJ
      ?auto_7011 - LOCATION
    )
    :vars
    (
      ?auto_7014 - OBJ
      ?auto_7012 - TRUCK
      ?auto_7016 - LOCATION
      ?auto_7013 - CITY
      ?auto_7019 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7010 ?auto_7014 ) ( TRUCK-AT ?auto_7012 ?auto_7016 ) ( IN-CITY ?auto_7016 ?auto_7013 ) ( IN-CITY ?auto_7011 ?auto_7013 ) ( not ( = ?auto_7011 ?auto_7016 ) ) ( OBJ-AT ?auto_7014 ?auto_7011 ) ( TRUCK-AT ?auto_7012 ?auto_7019 ) ( OBJ-AT ?auto_7010 ?auto_7019 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7010 ?auto_7012 ?auto_7019 )
      ( DELIVER-2PKG ?auto_7014 ?auto_7010 ?auto_7011 )
      ( DELIVER-1PKG-VERIFY ?auto_7010 ?auto_7011 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7021 - OBJ
      ?auto_7023 - OBJ
      ?auto_7022 - LOCATION
    )
    :vars
    (
      ?auto_7024 - OBJ
      ?auto_7027 - TRUCK
      ?auto_7026 - LOCATION
      ?auto_7025 - CITY
      ?auto_7029 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7023 ?auto_7021 ) ( GREATER-THAN ?auto_7023 ?auto_7024 ) ( TRUCK-AT ?auto_7027 ?auto_7026 ) ( IN-CITY ?auto_7026 ?auto_7025 ) ( IN-CITY ?auto_7022 ?auto_7025 ) ( not ( = ?auto_7022 ?auto_7026 ) ) ( OBJ-AT ?auto_7024 ?auto_7022 ) ( TRUCK-AT ?auto_7027 ?auto_7029 ) ( OBJ-AT ?auto_7023 ?auto_7029 ) ( OBJ-AT ?auto_7021 ?auto_7022 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7023 ?auto_7022 )
      ( DELIVER-2PKG-VERIFY ?auto_7021 ?auto_7023 ?auto_7022 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7137 - OBJ
      ?auto_7138 - LOCATION
    )
    :vars
    (
      ?auto_7144 - OBJ
      ?auto_7143 - OBJ
      ?auto_7139 - LOCATION
      ?auto_7142 - CITY
      ?auto_7141 - TRUCK
      ?auto_7148 - LOCATION
      ?auto_7149 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7137 ?auto_7144 ) ( GREATER-THAN ?auto_7137 ?auto_7143 ) ( IN-CITY ?auto_7139 ?auto_7142 ) ( IN-CITY ?auto_7138 ?auto_7142 ) ( not ( = ?auto_7138 ?auto_7139 ) ) ( OBJ-AT ?auto_7143 ?auto_7138 ) ( OBJ-AT ?auto_7137 ?auto_7139 ) ( OBJ-AT ?auto_7144 ?auto_7138 ) ( TRUCK-AT ?auto_7141 ?auto_7148 ) ( IN-CITY ?auto_7148 ?auto_7149 ) ( IN-CITY ?auto_7139 ?auto_7149 ) ( not ( = ?auto_7139 ?auto_7148 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7141 ?auto_7148 ?auto_7139 ?auto_7149 )
      ( DELIVER-2PKG ?auto_7144 ?auto_7137 ?auto_7138 )
      ( DELIVER-1PKG-VERIFY ?auto_7137 ?auto_7138 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7151 - OBJ
      ?auto_7153 - OBJ
      ?auto_7152 - LOCATION
    )
    :vars
    (
      ?auto_7157 - OBJ
      ?auto_7158 - OBJ
      ?auto_7161 - LOCATION
      ?auto_7162 - CITY
      ?auto_7155 - TRUCK
      ?auto_7159 - LOCATION
      ?auto_7156 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7153 ?auto_7151 ) ( GREATER-THAN ?auto_7153 ?auto_7157 ) ( GREATER-THAN ?auto_7153 ?auto_7158 ) ( IN-CITY ?auto_7161 ?auto_7162 ) ( IN-CITY ?auto_7152 ?auto_7162 ) ( not ( = ?auto_7152 ?auto_7161 ) ) ( OBJ-AT ?auto_7158 ?auto_7152 ) ( OBJ-AT ?auto_7153 ?auto_7161 ) ( OBJ-AT ?auto_7157 ?auto_7152 ) ( TRUCK-AT ?auto_7155 ?auto_7159 ) ( IN-CITY ?auto_7159 ?auto_7156 ) ( IN-CITY ?auto_7161 ?auto_7156 ) ( not ( = ?auto_7161 ?auto_7159 ) ) ( OBJ-AT ?auto_7151 ?auto_7152 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7153 ?auto_7152 )
      ( DELIVER-2PKG-VERIFY ?auto_7151 ?auto_7153 ?auto_7152 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7287 - OBJ
      ?auto_7288 - LOCATION
    )
    :vars
    (
      ?auto_7293 - OBJ
      ?auto_7292 - LOCATION
      ?auto_7294 - CITY
      ?auto_7291 - TRUCK
      ?auto_7296 - LOCATION
      ?auto_7297 - CITY
      ?auto_7299 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7287 ?auto_7293 ) ( IN-CITY ?auto_7292 ?auto_7294 ) ( IN-CITY ?auto_7288 ?auto_7294 ) ( not ( = ?auto_7288 ?auto_7292 ) ) ( OBJ-AT ?auto_7287 ?auto_7292 ) ( TRUCK-AT ?auto_7291 ?auto_7296 ) ( IN-CITY ?auto_7296 ?auto_7297 ) ( IN-CITY ?auto_7292 ?auto_7297 ) ( not ( = ?auto_7292 ?auto_7296 ) ) ( TRUCK-AT ?auto_7299 ?auto_7288 ) ( IN-TRUCK ?auto_7293 ?auto_7299 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7293 ?auto_7288 )
      ( DELIVER-2PKG ?auto_7293 ?auto_7287 ?auto_7288 )
      ( DELIVER-1PKG-VERIFY ?auto_7287 ?auto_7288 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7302 - OBJ
      ?auto_7304 - OBJ
      ?auto_7303 - LOCATION
    )
    :vars
    (
      ?auto_7305 - LOCATION
      ?auto_7312 - CITY
      ?auto_7307 - TRUCK
      ?auto_7308 - LOCATION
      ?auto_7306 - CITY
      ?auto_7310 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7304 ?auto_7302 ) ( IN-CITY ?auto_7305 ?auto_7312 ) ( IN-CITY ?auto_7303 ?auto_7312 ) ( not ( = ?auto_7303 ?auto_7305 ) ) ( OBJ-AT ?auto_7304 ?auto_7305 ) ( TRUCK-AT ?auto_7307 ?auto_7308 ) ( IN-CITY ?auto_7308 ?auto_7306 ) ( IN-CITY ?auto_7305 ?auto_7306 ) ( not ( = ?auto_7305 ?auto_7308 ) ) ( TRUCK-AT ?auto_7310 ?auto_7303 ) ( IN-TRUCK ?auto_7302 ?auto_7310 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7304 ?auto_7303 )
      ( DELIVER-2PKG-VERIFY ?auto_7302 ?auto_7304 ?auto_7303 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7429 - OBJ
      ?auto_7430 - LOCATION
    )
    :vars
    (
      ?auto_7434 - OBJ
      ?auto_7439 - LOCATION
      ?auto_7437 - CITY
      ?auto_7432 - CITY
      ?auto_7436 - TRUCK
      ?auto_7441 - LOCATION
      ?auto_7442 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7429 ?auto_7434 ) ( IN-CITY ?auto_7439 ?auto_7437 ) ( IN-CITY ?auto_7430 ?auto_7437 ) ( not ( = ?auto_7430 ?auto_7439 ) ) ( OBJ-AT ?auto_7429 ?auto_7439 ) ( IN-CITY ?auto_7430 ?auto_7432 ) ( IN-CITY ?auto_7439 ?auto_7432 ) ( IN-TRUCK ?auto_7434 ?auto_7436 ) ( TRUCK-AT ?auto_7436 ?auto_7441 ) ( IN-CITY ?auto_7441 ?auto_7442 ) ( IN-CITY ?auto_7430 ?auto_7442 ) ( not ( = ?auto_7430 ?auto_7441 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7436 ?auto_7441 ?auto_7430 ?auto_7442 )
      ( DELIVER-2PKG ?auto_7434 ?auto_7429 ?auto_7430 )
      ( DELIVER-1PKG-VERIFY ?auto_7429 ?auto_7430 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7444 - OBJ
      ?auto_7446 - OBJ
      ?auto_7445 - LOCATION
    )
    :vars
    (
      ?auto_7450 - LOCATION
      ?auto_7449 - CITY
      ?auto_7448 - CITY
      ?auto_7455 - TRUCK
      ?auto_7447 - LOCATION
      ?auto_7451 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7446 ?auto_7444 ) ( IN-CITY ?auto_7450 ?auto_7449 ) ( IN-CITY ?auto_7445 ?auto_7449 ) ( not ( = ?auto_7445 ?auto_7450 ) ) ( OBJ-AT ?auto_7446 ?auto_7450 ) ( IN-CITY ?auto_7445 ?auto_7448 ) ( IN-CITY ?auto_7450 ?auto_7448 ) ( IN-TRUCK ?auto_7444 ?auto_7455 ) ( TRUCK-AT ?auto_7455 ?auto_7447 ) ( IN-CITY ?auto_7447 ?auto_7451 ) ( IN-CITY ?auto_7445 ?auto_7451 ) ( not ( = ?auto_7445 ?auto_7447 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7446 ?auto_7445 )
      ( DELIVER-2PKG-VERIFY ?auto_7444 ?auto_7446 ?auto_7445 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7911 - OBJ
      ?auto_7913 - OBJ
      ?auto_7914 - OBJ
      ?auto_7912 - LOCATION
    )
    :vars
    (
      ?auto_7916 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7913 ?auto_7911 ) ( GREATER-THAN ?auto_7914 ?auto_7911 ) ( GREATER-THAN ?auto_7914 ?auto_7913 ) ( TRUCK-AT ?auto_7916 ?auto_7912 ) ( IN-TRUCK ?auto_7914 ?auto_7916 ) ( OBJ-AT ?auto_7911 ?auto_7912 ) ( OBJ-AT ?auto_7913 ?auto_7912 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7914 ?auto_7912 )
      ( DELIVER-3PKG-VERIFY ?auto_7911 ?auto_7913 ?auto_7914 ?auto_7912 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8094 - OBJ
      ?auto_8096 - OBJ
      ?auto_8097 - OBJ
      ?auto_8095 - LOCATION
    )
    :vars
    (
      ?auto_8100 - OBJ
      ?auto_8098 - TRUCK
      ?auto_8102 - LOCATION
      ?auto_8101 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8096 ?auto_8094 ) ( GREATER-THAN ?auto_8097 ?auto_8094 ) ( GREATER-THAN ?auto_8097 ?auto_8096 ) ( GREATER-THAN ?auto_8097 ?auto_8100 ) ( IN-TRUCK ?auto_8097 ?auto_8098 ) ( TRUCK-AT ?auto_8098 ?auto_8102 ) ( IN-CITY ?auto_8102 ?auto_8101 ) ( IN-CITY ?auto_8095 ?auto_8101 ) ( not ( = ?auto_8095 ?auto_8102 ) ) ( OBJ-AT ?auto_8100 ?auto_8095 ) ( OBJ-AT ?auto_8094 ?auto_8095 ) ( OBJ-AT ?auto_8096 ?auto_8095 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8100 ?auto_8097 ?auto_8095 )
      ( DELIVER-3PKG-VERIFY ?auto_8094 ?auto_8096 ?auto_8097 ?auto_8095 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8343 - OBJ
      ?auto_8345 - OBJ
      ?auto_8346 - OBJ
      ?auto_8344 - LOCATION
    )
    :vars
    (
      ?auto_8348 - OBJ
      ?auto_8349 - OBJ
      ?auto_8353 - TRUCK
      ?auto_8352 - LOCATION
      ?auto_8350 - CITY
      ?auto_8354 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8345 ?auto_8343 ) ( GREATER-THAN ?auto_8346 ?auto_8343 ) ( GREATER-THAN ?auto_8346 ?auto_8345 ) ( GREATER-THAN ?auto_8346 ?auto_8348 ) ( GREATER-THAN ?auto_8346 ?auto_8349 ) ( TRUCK-AT ?auto_8353 ?auto_8352 ) ( IN-CITY ?auto_8352 ?auto_8350 ) ( IN-CITY ?auto_8344 ?auto_8350 ) ( not ( = ?auto_8344 ?auto_8352 ) ) ( OBJ-AT ?auto_8349 ?auto_8344 ) ( TRUCK-AT ?auto_8353 ?auto_8354 ) ( OBJ-AT ?auto_8346 ?auto_8354 ) ( OBJ-AT ?auto_8348 ?auto_8344 ) ( OBJ-AT ?auto_8343 ?auto_8344 ) ( OBJ-AT ?auto_8345 ?auto_8344 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8348 ?auto_8346 ?auto_8344 )
      ( DELIVER-3PKG-VERIFY ?auto_8343 ?auto_8345 ?auto_8346 ?auto_8344 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8641 - OBJ
      ?auto_8643 - OBJ
      ?auto_8644 - OBJ
      ?auto_8642 - LOCATION
    )
    :vars
    (
      ?auto_8648 - OBJ
      ?auto_8653 - OBJ
      ?auto_8646 - OBJ
      ?auto_8650 - LOCATION
      ?auto_8645 - CITY
      ?auto_8652 - TRUCK
      ?auto_8651 - LOCATION
      ?auto_8654 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8643 ?auto_8641 ) ( GREATER-THAN ?auto_8644 ?auto_8641 ) ( GREATER-THAN ?auto_8644 ?auto_8643 ) ( GREATER-THAN ?auto_8644 ?auto_8648 ) ( GREATER-THAN ?auto_8644 ?auto_8653 ) ( GREATER-THAN ?auto_8644 ?auto_8646 ) ( IN-CITY ?auto_8650 ?auto_8645 ) ( IN-CITY ?auto_8642 ?auto_8645 ) ( not ( = ?auto_8642 ?auto_8650 ) ) ( OBJ-AT ?auto_8646 ?auto_8642 ) ( OBJ-AT ?auto_8644 ?auto_8650 ) ( OBJ-AT ?auto_8653 ?auto_8642 ) ( TRUCK-AT ?auto_8652 ?auto_8651 ) ( IN-CITY ?auto_8651 ?auto_8654 ) ( IN-CITY ?auto_8650 ?auto_8654 ) ( not ( = ?auto_8650 ?auto_8651 ) ) ( OBJ-AT ?auto_8648 ?auto_8642 ) ( OBJ-AT ?auto_8641 ?auto_8642 ) ( OBJ-AT ?auto_8643 ?auto_8642 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8648 ?auto_8644 ?auto_8642 )
      ( DELIVER-3PKG-VERIFY ?auto_8641 ?auto_8643 ?auto_8644 ?auto_8642 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10785 - OBJ
      ?auto_10786 - LOCATION
    )
    :vars
    (
      ?auto_10792 - OBJ
      ?auto_10789 - LOCATION
      ?auto_10794 - CITY
      ?auto_10793 - CITY
      ?auto_10795 - TRUCK
      ?auto_10787 - LOCATION
      ?auto_10788 - CITY
      ?auto_10797 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10785 ?auto_10792 ) ( IN-CITY ?auto_10789 ?auto_10794 ) ( IN-CITY ?auto_10786 ?auto_10794 ) ( not ( = ?auto_10786 ?auto_10789 ) ) ( OBJ-AT ?auto_10785 ?auto_10789 ) ( IN-CITY ?auto_10786 ?auto_10793 ) ( IN-CITY ?auto_10789 ?auto_10793 ) ( TRUCK-AT ?auto_10795 ?auto_10787 ) ( IN-CITY ?auto_10787 ?auto_10788 ) ( IN-CITY ?auto_10786 ?auto_10788 ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( TRUCK-AT ?auto_10795 ?auto_10797 ) ( OBJ-AT ?auto_10792 ?auto_10797 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10792 ?auto_10795 ?auto_10797 )
      ( DELIVER-2PKG ?auto_10792 ?auto_10785 ?auto_10786 )
      ( DELIVER-1PKG-VERIFY ?auto_10785 ?auto_10786 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10799 - OBJ
      ?auto_10801 - OBJ
      ?auto_10800 - LOCATION
    )
    :vars
    (
      ?auto_10807 - LOCATION
      ?auto_10806 - CITY
      ?auto_10805 - CITY
      ?auto_10810 - TRUCK
      ?auto_10804 - LOCATION
      ?auto_10808 - CITY
      ?auto_10811 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10801 ?auto_10799 ) ( IN-CITY ?auto_10807 ?auto_10806 ) ( IN-CITY ?auto_10800 ?auto_10806 ) ( not ( = ?auto_10800 ?auto_10807 ) ) ( OBJ-AT ?auto_10801 ?auto_10807 ) ( IN-CITY ?auto_10800 ?auto_10805 ) ( IN-CITY ?auto_10807 ?auto_10805 ) ( TRUCK-AT ?auto_10810 ?auto_10804 ) ( IN-CITY ?auto_10804 ?auto_10808 ) ( IN-CITY ?auto_10800 ?auto_10808 ) ( not ( = ?auto_10800 ?auto_10804 ) ) ( TRUCK-AT ?auto_10810 ?auto_10811 ) ( OBJ-AT ?auto_10799 ?auto_10811 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10801 ?auto_10800 )
      ( DELIVER-2PKG-VERIFY ?auto_10799 ?auto_10801 ?auto_10800 ) )
  )

)

