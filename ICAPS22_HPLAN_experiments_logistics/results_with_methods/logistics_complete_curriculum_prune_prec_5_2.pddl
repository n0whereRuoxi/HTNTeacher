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
      ?auto_6501 - OBJ
      ?auto_6502 - LOCATION
    )
    :vars
    (
      ?auto_6503 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6503 ?auto_6502 ) ( IN-TRUCK ?auto_6501 ?auto_6503 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6501 ?auto_6503 ?auto_6502 )
      ( DELIVER-1PKG-VERIFY ?auto_6501 ?auto_6502 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6506 - OBJ
      ?auto_6507 - LOCATION
    )
    :vars
    (
      ?auto_6508 - TRUCK
      ?auto_6509 - LOCATION
      ?auto_6510 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6506 ?auto_6508 ) ( TRUCK-AT ?auto_6508 ?auto_6509 ) ( IN-CITY ?auto_6509 ?auto_6510 ) ( IN-CITY ?auto_6507 ?auto_6510 ) ( not ( = ?auto_6507 ?auto_6509 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6508 ?auto_6509 ?auto_6507 ?auto_6510 )
      ( DELIVER-1PKG ?auto_6506 ?auto_6507 )
      ( DELIVER-1PKG-VERIFY ?auto_6506 ?auto_6507 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6513 - OBJ
      ?auto_6514 - LOCATION
    )
    :vars
    (
      ?auto_6516 - TRUCK
      ?auto_6517 - LOCATION
      ?auto_6515 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6516 ?auto_6517 ) ( IN-CITY ?auto_6517 ?auto_6515 ) ( IN-CITY ?auto_6514 ?auto_6515 ) ( not ( = ?auto_6514 ?auto_6517 ) ) ( OBJ-AT ?auto_6513 ?auto_6517 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6513 ?auto_6516 ?auto_6517 )
      ( DELIVER-1PKG ?auto_6513 ?auto_6514 )
      ( DELIVER-1PKG-VERIFY ?auto_6513 ?auto_6514 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6520 - OBJ
      ?auto_6521 - LOCATION
    )
    :vars
    (
      ?auto_6524 - LOCATION
      ?auto_6523 - CITY
      ?auto_6522 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6524 ?auto_6523 ) ( IN-CITY ?auto_6521 ?auto_6523 ) ( not ( = ?auto_6521 ?auto_6524 ) ) ( OBJ-AT ?auto_6520 ?auto_6524 ) ( TRUCK-AT ?auto_6522 ?auto_6521 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6522 ?auto_6521 ?auto_6524 ?auto_6523 )
      ( DELIVER-1PKG ?auto_6520 ?auto_6521 )
      ( DELIVER-1PKG-VERIFY ?auto_6520 ?auto_6521 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6554 - OBJ
      ?auto_6556 - OBJ
      ?auto_6555 - LOCATION
    )
    :vars
    (
      ?auto_6557 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6556 ?auto_6554 ) ( TRUCK-AT ?auto_6557 ?auto_6555 ) ( IN-TRUCK ?auto_6556 ?auto_6557 ) ( OBJ-AT ?auto_6554 ?auto_6555 ) ( not ( = ?auto_6554 ?auto_6556 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6556 ?auto_6555 )
      ( DELIVER-2PKG-VERIFY ?auto_6554 ?auto_6556 ?auto_6555 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6561 - OBJ
      ?auto_6563 - OBJ
      ?auto_6562 - LOCATION
    )
    :vars
    (
      ?auto_6564 - TRUCK
      ?auto_6565 - LOCATION
      ?auto_6566 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6563 ?auto_6561 ) ( IN-TRUCK ?auto_6563 ?auto_6564 ) ( TRUCK-AT ?auto_6564 ?auto_6565 ) ( IN-CITY ?auto_6565 ?auto_6566 ) ( IN-CITY ?auto_6562 ?auto_6566 ) ( not ( = ?auto_6562 ?auto_6565 ) ) ( OBJ-AT ?auto_6561 ?auto_6562 ) ( not ( = ?auto_6561 ?auto_6563 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6563 ?auto_6562 )
      ( DELIVER-2PKG-VERIFY ?auto_6561 ?auto_6563 ?auto_6562 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6570 - OBJ
      ?auto_6572 - OBJ
      ?auto_6571 - LOCATION
    )
    :vars
    (
      ?auto_6575 - TRUCK
      ?auto_6573 - LOCATION
      ?auto_6574 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6572 ?auto_6570 ) ( TRUCK-AT ?auto_6575 ?auto_6573 ) ( IN-CITY ?auto_6573 ?auto_6574 ) ( IN-CITY ?auto_6571 ?auto_6574 ) ( not ( = ?auto_6571 ?auto_6573 ) ) ( OBJ-AT ?auto_6572 ?auto_6573 ) ( OBJ-AT ?auto_6570 ?auto_6571 ) ( not ( = ?auto_6570 ?auto_6572 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6572 ?auto_6571 )
      ( DELIVER-2PKG-VERIFY ?auto_6570 ?auto_6572 ?auto_6571 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6579 - OBJ
      ?auto_6581 - OBJ
      ?auto_6580 - LOCATION
    )
    :vars
    (
      ?auto_6584 - LOCATION
      ?auto_6583 - CITY
      ?auto_6582 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6581 ?auto_6579 ) ( IN-CITY ?auto_6584 ?auto_6583 ) ( IN-CITY ?auto_6580 ?auto_6583 ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( OBJ-AT ?auto_6581 ?auto_6584 ) ( TRUCK-AT ?auto_6582 ?auto_6580 ) ( OBJ-AT ?auto_6579 ?auto_6580 ) ( not ( = ?auto_6579 ?auto_6581 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6581 ?auto_6580 )
      ( DELIVER-2PKG-VERIFY ?auto_6579 ?auto_6581 ?auto_6580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6588 - OBJ
      ?auto_6590 - OBJ
      ?auto_6589 - LOCATION
    )
    :vars
    (
      ?auto_6593 - LOCATION
      ?auto_6592 - CITY
      ?auto_6591 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6590 ?auto_6588 ) ( IN-CITY ?auto_6593 ?auto_6592 ) ( IN-CITY ?auto_6589 ?auto_6592 ) ( not ( = ?auto_6589 ?auto_6593 ) ) ( OBJ-AT ?auto_6590 ?auto_6593 ) ( TRUCK-AT ?auto_6591 ?auto_6589 ) ( not ( = ?auto_6588 ?auto_6590 ) ) ( IN-TRUCK ?auto_6588 ?auto_6591 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6588 ?auto_6589 )
      ( DELIVER-2PKG ?auto_6588 ?auto_6590 ?auto_6589 )
      ( DELIVER-2PKG-VERIFY ?auto_6588 ?auto_6590 ?auto_6589 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6597 - OBJ
      ?auto_6599 - OBJ
      ?auto_6598 - LOCATION
    )
    :vars
    (
      ?auto_6601 - LOCATION
      ?auto_6602 - CITY
      ?auto_6600 - TRUCK
      ?auto_6603 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6599 ?auto_6597 ) ( IN-CITY ?auto_6601 ?auto_6602 ) ( IN-CITY ?auto_6598 ?auto_6602 ) ( not ( = ?auto_6598 ?auto_6601 ) ) ( OBJ-AT ?auto_6599 ?auto_6601 ) ( not ( = ?auto_6597 ?auto_6599 ) ) ( IN-TRUCK ?auto_6597 ?auto_6600 ) ( TRUCK-AT ?auto_6600 ?auto_6603 ) ( IN-CITY ?auto_6603 ?auto_6602 ) ( not ( = ?auto_6598 ?auto_6603 ) ) ( not ( = ?auto_6601 ?auto_6603 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6600 ?auto_6603 ?auto_6598 ?auto_6602 )
      ( DELIVER-2PKG ?auto_6597 ?auto_6599 ?auto_6598 )
      ( DELIVER-2PKG-VERIFY ?auto_6597 ?auto_6599 ?auto_6598 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6607 - OBJ
      ?auto_6609 - OBJ
      ?auto_6608 - LOCATION
    )
    :vars
    (
      ?auto_6613 - LOCATION
      ?auto_6611 - CITY
      ?auto_6610 - TRUCK
      ?auto_6612 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6609 ?auto_6607 ) ( IN-CITY ?auto_6613 ?auto_6611 ) ( IN-CITY ?auto_6608 ?auto_6611 ) ( not ( = ?auto_6608 ?auto_6613 ) ) ( OBJ-AT ?auto_6609 ?auto_6613 ) ( not ( = ?auto_6607 ?auto_6609 ) ) ( TRUCK-AT ?auto_6610 ?auto_6612 ) ( IN-CITY ?auto_6612 ?auto_6611 ) ( not ( = ?auto_6608 ?auto_6612 ) ) ( not ( = ?auto_6613 ?auto_6612 ) ) ( OBJ-AT ?auto_6607 ?auto_6612 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6607 ?auto_6610 ?auto_6612 )
      ( DELIVER-2PKG ?auto_6607 ?auto_6609 ?auto_6608 )
      ( DELIVER-2PKG-VERIFY ?auto_6607 ?auto_6609 ?auto_6608 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6617 - OBJ
      ?auto_6619 - OBJ
      ?auto_6618 - LOCATION
    )
    :vars
    (
      ?auto_6621 - LOCATION
      ?auto_6620 - CITY
      ?auto_6623 - LOCATION
      ?auto_6622 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6619 ?auto_6617 ) ( IN-CITY ?auto_6621 ?auto_6620 ) ( IN-CITY ?auto_6618 ?auto_6620 ) ( not ( = ?auto_6618 ?auto_6621 ) ) ( OBJ-AT ?auto_6619 ?auto_6621 ) ( not ( = ?auto_6617 ?auto_6619 ) ) ( IN-CITY ?auto_6623 ?auto_6620 ) ( not ( = ?auto_6618 ?auto_6623 ) ) ( not ( = ?auto_6621 ?auto_6623 ) ) ( OBJ-AT ?auto_6617 ?auto_6623 ) ( TRUCK-AT ?auto_6622 ?auto_6618 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6622 ?auto_6618 ?auto_6623 ?auto_6620 )
      ( DELIVER-2PKG ?auto_6617 ?auto_6619 ?auto_6618 )
      ( DELIVER-2PKG-VERIFY ?auto_6617 ?auto_6619 ?auto_6618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6654 - OBJ
      ?auto_6656 - OBJ
      ?auto_6657 - OBJ
      ?auto_6655 - LOCATION
    )
    :vars
    (
      ?auto_6658 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6656 ?auto_6654 ) ( GREATER-THAN ?auto_6657 ?auto_6654 ) ( GREATER-THAN ?auto_6657 ?auto_6656 ) ( TRUCK-AT ?auto_6658 ?auto_6655 ) ( IN-TRUCK ?auto_6657 ?auto_6658 ) ( OBJ-AT ?auto_6654 ?auto_6655 ) ( OBJ-AT ?auto_6656 ?auto_6655 ) ( not ( = ?auto_6654 ?auto_6656 ) ) ( not ( = ?auto_6654 ?auto_6657 ) ) ( not ( = ?auto_6656 ?auto_6657 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6657 ?auto_6655 )
      ( DELIVER-3PKG-VERIFY ?auto_6654 ?auto_6656 ?auto_6657 ?auto_6655 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6663 - OBJ
      ?auto_6665 - OBJ
      ?auto_6666 - OBJ
      ?auto_6664 - LOCATION
    )
    :vars
    (
      ?auto_6667 - TRUCK
      ?auto_6668 - LOCATION
      ?auto_6669 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6665 ?auto_6663 ) ( GREATER-THAN ?auto_6666 ?auto_6663 ) ( GREATER-THAN ?auto_6666 ?auto_6665 ) ( IN-TRUCK ?auto_6666 ?auto_6667 ) ( TRUCK-AT ?auto_6667 ?auto_6668 ) ( IN-CITY ?auto_6668 ?auto_6669 ) ( IN-CITY ?auto_6664 ?auto_6669 ) ( not ( = ?auto_6664 ?auto_6668 ) ) ( OBJ-AT ?auto_6663 ?auto_6664 ) ( OBJ-AT ?auto_6665 ?auto_6664 ) ( not ( = ?auto_6663 ?auto_6665 ) ) ( not ( = ?auto_6663 ?auto_6666 ) ) ( not ( = ?auto_6665 ?auto_6666 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6666 ?auto_6664 )
      ( DELIVER-3PKG-VERIFY ?auto_6663 ?auto_6665 ?auto_6666 ?auto_6664 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6674 - OBJ
      ?auto_6676 - OBJ
      ?auto_6677 - OBJ
      ?auto_6675 - LOCATION
    )
    :vars
    (
      ?auto_6678 - TRUCK
      ?auto_6680 - LOCATION
      ?auto_6679 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6676 ?auto_6674 ) ( GREATER-THAN ?auto_6677 ?auto_6674 ) ( GREATER-THAN ?auto_6677 ?auto_6676 ) ( TRUCK-AT ?auto_6678 ?auto_6680 ) ( IN-CITY ?auto_6680 ?auto_6679 ) ( IN-CITY ?auto_6675 ?auto_6679 ) ( not ( = ?auto_6675 ?auto_6680 ) ) ( OBJ-AT ?auto_6677 ?auto_6680 ) ( OBJ-AT ?auto_6674 ?auto_6675 ) ( OBJ-AT ?auto_6676 ?auto_6675 ) ( not ( = ?auto_6674 ?auto_6676 ) ) ( not ( = ?auto_6674 ?auto_6677 ) ) ( not ( = ?auto_6676 ?auto_6677 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6677 ?auto_6675 )
      ( DELIVER-3PKG-VERIFY ?auto_6674 ?auto_6676 ?auto_6677 ?auto_6675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6685 - OBJ
      ?auto_6687 - OBJ
      ?auto_6688 - OBJ
      ?auto_6686 - LOCATION
    )
    :vars
    (
      ?auto_6690 - LOCATION
      ?auto_6691 - CITY
      ?auto_6689 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6687 ?auto_6685 ) ( GREATER-THAN ?auto_6688 ?auto_6685 ) ( GREATER-THAN ?auto_6688 ?auto_6687 ) ( IN-CITY ?auto_6690 ?auto_6691 ) ( IN-CITY ?auto_6686 ?auto_6691 ) ( not ( = ?auto_6686 ?auto_6690 ) ) ( OBJ-AT ?auto_6688 ?auto_6690 ) ( TRUCK-AT ?auto_6689 ?auto_6686 ) ( OBJ-AT ?auto_6685 ?auto_6686 ) ( OBJ-AT ?auto_6687 ?auto_6686 ) ( not ( = ?auto_6685 ?auto_6687 ) ) ( not ( = ?auto_6685 ?auto_6688 ) ) ( not ( = ?auto_6687 ?auto_6688 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6688 ?auto_6686 )
      ( DELIVER-3PKG-VERIFY ?auto_6685 ?auto_6687 ?auto_6688 ?auto_6686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6696 - OBJ
      ?auto_6698 - OBJ
      ?auto_6699 - OBJ
      ?auto_6697 - LOCATION
    )
    :vars
    (
      ?auto_6701 - LOCATION
      ?auto_6700 - CITY
      ?auto_6702 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6698 ?auto_6696 ) ( GREATER-THAN ?auto_6699 ?auto_6696 ) ( GREATER-THAN ?auto_6699 ?auto_6698 ) ( IN-CITY ?auto_6701 ?auto_6700 ) ( IN-CITY ?auto_6697 ?auto_6700 ) ( not ( = ?auto_6697 ?auto_6701 ) ) ( OBJ-AT ?auto_6699 ?auto_6701 ) ( TRUCK-AT ?auto_6702 ?auto_6697 ) ( OBJ-AT ?auto_6696 ?auto_6697 ) ( not ( = ?auto_6696 ?auto_6698 ) ) ( not ( = ?auto_6696 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( IN-TRUCK ?auto_6698 ?auto_6702 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6698 ?auto_6697 )
      ( DELIVER-3PKG ?auto_6696 ?auto_6698 ?auto_6699 ?auto_6697 )
      ( DELIVER-3PKG-VERIFY ?auto_6696 ?auto_6698 ?auto_6699 ?auto_6697 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6707 - OBJ
      ?auto_6709 - OBJ
      ?auto_6710 - OBJ
      ?auto_6708 - LOCATION
    )
    :vars
    (
      ?auto_6713 - LOCATION
      ?auto_6711 - CITY
      ?auto_6712 - TRUCK
      ?auto_6714 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6709 ?auto_6707 ) ( GREATER-THAN ?auto_6710 ?auto_6707 ) ( GREATER-THAN ?auto_6710 ?auto_6709 ) ( IN-CITY ?auto_6713 ?auto_6711 ) ( IN-CITY ?auto_6708 ?auto_6711 ) ( not ( = ?auto_6708 ?auto_6713 ) ) ( OBJ-AT ?auto_6710 ?auto_6713 ) ( OBJ-AT ?auto_6707 ?auto_6708 ) ( not ( = ?auto_6707 ?auto_6709 ) ) ( not ( = ?auto_6707 ?auto_6710 ) ) ( not ( = ?auto_6709 ?auto_6710 ) ) ( IN-TRUCK ?auto_6709 ?auto_6712 ) ( TRUCK-AT ?auto_6712 ?auto_6714 ) ( IN-CITY ?auto_6714 ?auto_6711 ) ( not ( = ?auto_6708 ?auto_6714 ) ) ( not ( = ?auto_6713 ?auto_6714 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6712 ?auto_6714 ?auto_6708 ?auto_6711 )
      ( DELIVER-3PKG ?auto_6707 ?auto_6709 ?auto_6710 ?auto_6708 )
      ( DELIVER-3PKG-VERIFY ?auto_6707 ?auto_6709 ?auto_6710 ?auto_6708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6719 - OBJ
      ?auto_6721 - OBJ
      ?auto_6722 - OBJ
      ?auto_6720 - LOCATION
    )
    :vars
    (
      ?auto_6723 - LOCATION
      ?auto_6725 - CITY
      ?auto_6726 - TRUCK
      ?auto_6724 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6721 ?auto_6719 ) ( GREATER-THAN ?auto_6722 ?auto_6719 ) ( GREATER-THAN ?auto_6722 ?auto_6721 ) ( IN-CITY ?auto_6723 ?auto_6725 ) ( IN-CITY ?auto_6720 ?auto_6725 ) ( not ( = ?auto_6720 ?auto_6723 ) ) ( OBJ-AT ?auto_6722 ?auto_6723 ) ( OBJ-AT ?auto_6719 ?auto_6720 ) ( not ( = ?auto_6719 ?auto_6721 ) ) ( not ( = ?auto_6719 ?auto_6722 ) ) ( not ( = ?auto_6721 ?auto_6722 ) ) ( TRUCK-AT ?auto_6726 ?auto_6724 ) ( IN-CITY ?auto_6724 ?auto_6725 ) ( not ( = ?auto_6720 ?auto_6724 ) ) ( not ( = ?auto_6723 ?auto_6724 ) ) ( OBJ-AT ?auto_6721 ?auto_6724 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6721 ?auto_6726 ?auto_6724 )
      ( DELIVER-3PKG ?auto_6719 ?auto_6721 ?auto_6722 ?auto_6720 )
      ( DELIVER-3PKG-VERIFY ?auto_6719 ?auto_6721 ?auto_6722 ?auto_6720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6731 - OBJ
      ?auto_6733 - OBJ
      ?auto_6734 - OBJ
      ?auto_6732 - LOCATION
    )
    :vars
    (
      ?auto_6738 - LOCATION
      ?auto_6736 - CITY
      ?auto_6737 - LOCATION
      ?auto_6735 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6733 ?auto_6731 ) ( GREATER-THAN ?auto_6734 ?auto_6731 ) ( GREATER-THAN ?auto_6734 ?auto_6733 ) ( IN-CITY ?auto_6738 ?auto_6736 ) ( IN-CITY ?auto_6732 ?auto_6736 ) ( not ( = ?auto_6732 ?auto_6738 ) ) ( OBJ-AT ?auto_6734 ?auto_6738 ) ( OBJ-AT ?auto_6731 ?auto_6732 ) ( not ( = ?auto_6731 ?auto_6733 ) ) ( not ( = ?auto_6731 ?auto_6734 ) ) ( not ( = ?auto_6733 ?auto_6734 ) ) ( IN-CITY ?auto_6737 ?auto_6736 ) ( not ( = ?auto_6732 ?auto_6737 ) ) ( not ( = ?auto_6738 ?auto_6737 ) ) ( OBJ-AT ?auto_6733 ?auto_6737 ) ( TRUCK-AT ?auto_6735 ?auto_6732 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6735 ?auto_6732 ?auto_6737 ?auto_6736 )
      ( DELIVER-3PKG ?auto_6731 ?auto_6733 ?auto_6734 ?auto_6732 )
      ( DELIVER-3PKG-VERIFY ?auto_6731 ?auto_6733 ?auto_6734 ?auto_6732 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6743 - OBJ
      ?auto_6745 - OBJ
      ?auto_6746 - OBJ
      ?auto_6744 - LOCATION
    )
    :vars
    (
      ?auto_6749 - LOCATION
      ?auto_6747 - CITY
      ?auto_6750 - LOCATION
      ?auto_6748 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6745 ?auto_6743 ) ( GREATER-THAN ?auto_6746 ?auto_6743 ) ( GREATER-THAN ?auto_6746 ?auto_6745 ) ( IN-CITY ?auto_6749 ?auto_6747 ) ( IN-CITY ?auto_6744 ?auto_6747 ) ( not ( = ?auto_6744 ?auto_6749 ) ) ( OBJ-AT ?auto_6746 ?auto_6749 ) ( not ( = ?auto_6743 ?auto_6745 ) ) ( not ( = ?auto_6743 ?auto_6746 ) ) ( not ( = ?auto_6745 ?auto_6746 ) ) ( IN-CITY ?auto_6750 ?auto_6747 ) ( not ( = ?auto_6744 ?auto_6750 ) ) ( not ( = ?auto_6749 ?auto_6750 ) ) ( OBJ-AT ?auto_6745 ?auto_6750 ) ( TRUCK-AT ?auto_6748 ?auto_6744 ) ( IN-TRUCK ?auto_6743 ?auto_6748 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6743 ?auto_6744 )
      ( DELIVER-3PKG ?auto_6743 ?auto_6745 ?auto_6746 ?auto_6744 )
      ( DELIVER-3PKG-VERIFY ?auto_6743 ?auto_6745 ?auto_6746 ?auto_6744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6755 - OBJ
      ?auto_6757 - OBJ
      ?auto_6758 - OBJ
      ?auto_6756 - LOCATION
    )
    :vars
    (
      ?auto_6760 - LOCATION
      ?auto_6762 - CITY
      ?auto_6759 - LOCATION
      ?auto_6761 - TRUCK
      ?auto_6763 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6757 ?auto_6755 ) ( GREATER-THAN ?auto_6758 ?auto_6755 ) ( GREATER-THAN ?auto_6758 ?auto_6757 ) ( IN-CITY ?auto_6760 ?auto_6762 ) ( IN-CITY ?auto_6756 ?auto_6762 ) ( not ( = ?auto_6756 ?auto_6760 ) ) ( OBJ-AT ?auto_6758 ?auto_6760 ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( not ( = ?auto_6755 ?auto_6758 ) ) ( not ( = ?auto_6757 ?auto_6758 ) ) ( IN-CITY ?auto_6759 ?auto_6762 ) ( not ( = ?auto_6756 ?auto_6759 ) ) ( not ( = ?auto_6760 ?auto_6759 ) ) ( OBJ-AT ?auto_6757 ?auto_6759 ) ( IN-TRUCK ?auto_6755 ?auto_6761 ) ( TRUCK-AT ?auto_6761 ?auto_6763 ) ( IN-CITY ?auto_6763 ?auto_6762 ) ( not ( = ?auto_6756 ?auto_6763 ) ) ( not ( = ?auto_6760 ?auto_6763 ) ) ( not ( = ?auto_6759 ?auto_6763 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6761 ?auto_6763 ?auto_6756 ?auto_6762 )
      ( DELIVER-3PKG ?auto_6755 ?auto_6757 ?auto_6758 ?auto_6756 )
      ( DELIVER-3PKG-VERIFY ?auto_6755 ?auto_6757 ?auto_6758 ?auto_6756 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6768 - OBJ
      ?auto_6770 - OBJ
      ?auto_6771 - OBJ
      ?auto_6769 - LOCATION
    )
    :vars
    (
      ?auto_6774 - LOCATION
      ?auto_6773 - CITY
      ?auto_6776 - LOCATION
      ?auto_6775 - TRUCK
      ?auto_6772 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6770 ?auto_6768 ) ( GREATER-THAN ?auto_6771 ?auto_6768 ) ( GREATER-THAN ?auto_6771 ?auto_6770 ) ( IN-CITY ?auto_6774 ?auto_6773 ) ( IN-CITY ?auto_6769 ?auto_6773 ) ( not ( = ?auto_6769 ?auto_6774 ) ) ( OBJ-AT ?auto_6771 ?auto_6774 ) ( not ( = ?auto_6768 ?auto_6770 ) ) ( not ( = ?auto_6768 ?auto_6771 ) ) ( not ( = ?auto_6770 ?auto_6771 ) ) ( IN-CITY ?auto_6776 ?auto_6773 ) ( not ( = ?auto_6769 ?auto_6776 ) ) ( not ( = ?auto_6774 ?auto_6776 ) ) ( OBJ-AT ?auto_6770 ?auto_6776 ) ( TRUCK-AT ?auto_6775 ?auto_6772 ) ( IN-CITY ?auto_6772 ?auto_6773 ) ( not ( = ?auto_6769 ?auto_6772 ) ) ( not ( = ?auto_6774 ?auto_6772 ) ) ( not ( = ?auto_6776 ?auto_6772 ) ) ( OBJ-AT ?auto_6768 ?auto_6772 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6768 ?auto_6775 ?auto_6772 )
      ( DELIVER-3PKG ?auto_6768 ?auto_6770 ?auto_6771 ?auto_6769 )
      ( DELIVER-3PKG-VERIFY ?auto_6768 ?auto_6770 ?auto_6771 ?auto_6769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6781 - OBJ
      ?auto_6783 - OBJ
      ?auto_6784 - OBJ
      ?auto_6782 - LOCATION
    )
    :vars
    (
      ?auto_6788 - LOCATION
      ?auto_6787 - CITY
      ?auto_6786 - LOCATION
      ?auto_6785 - LOCATION
      ?auto_6789 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6783 ?auto_6781 ) ( GREATER-THAN ?auto_6784 ?auto_6781 ) ( GREATER-THAN ?auto_6784 ?auto_6783 ) ( IN-CITY ?auto_6788 ?auto_6787 ) ( IN-CITY ?auto_6782 ?auto_6787 ) ( not ( = ?auto_6782 ?auto_6788 ) ) ( OBJ-AT ?auto_6784 ?auto_6788 ) ( not ( = ?auto_6781 ?auto_6783 ) ) ( not ( = ?auto_6781 ?auto_6784 ) ) ( not ( = ?auto_6783 ?auto_6784 ) ) ( IN-CITY ?auto_6786 ?auto_6787 ) ( not ( = ?auto_6782 ?auto_6786 ) ) ( not ( = ?auto_6788 ?auto_6786 ) ) ( OBJ-AT ?auto_6783 ?auto_6786 ) ( IN-CITY ?auto_6785 ?auto_6787 ) ( not ( = ?auto_6782 ?auto_6785 ) ) ( not ( = ?auto_6788 ?auto_6785 ) ) ( not ( = ?auto_6786 ?auto_6785 ) ) ( OBJ-AT ?auto_6781 ?auto_6785 ) ( TRUCK-AT ?auto_6789 ?auto_6782 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6789 ?auto_6782 ?auto_6785 ?auto_6787 )
      ( DELIVER-3PKG ?auto_6781 ?auto_6783 ?auto_6784 ?auto_6782 )
      ( DELIVER-3PKG-VERIFY ?auto_6781 ?auto_6783 ?auto_6784 ?auto_6782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6821 - OBJ
      ?auto_6823 - OBJ
      ?auto_6824 - OBJ
      ?auto_6825 - OBJ
      ?auto_6822 - LOCATION
    )
    :vars
    (
      ?auto_6826 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6823 ?auto_6821 ) ( GREATER-THAN ?auto_6824 ?auto_6821 ) ( GREATER-THAN ?auto_6824 ?auto_6823 ) ( GREATER-THAN ?auto_6825 ?auto_6821 ) ( GREATER-THAN ?auto_6825 ?auto_6823 ) ( GREATER-THAN ?auto_6825 ?auto_6824 ) ( TRUCK-AT ?auto_6826 ?auto_6822 ) ( IN-TRUCK ?auto_6825 ?auto_6826 ) ( OBJ-AT ?auto_6821 ?auto_6822 ) ( OBJ-AT ?auto_6823 ?auto_6822 ) ( OBJ-AT ?auto_6824 ?auto_6822 ) ( not ( = ?auto_6821 ?auto_6823 ) ) ( not ( = ?auto_6821 ?auto_6824 ) ) ( not ( = ?auto_6821 ?auto_6825 ) ) ( not ( = ?auto_6823 ?auto_6824 ) ) ( not ( = ?auto_6823 ?auto_6825 ) ) ( not ( = ?auto_6824 ?auto_6825 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6825 ?auto_6822 )
      ( DELIVER-4PKG-VERIFY ?auto_6821 ?auto_6823 ?auto_6824 ?auto_6825 ?auto_6822 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6832 - OBJ
      ?auto_6834 - OBJ
      ?auto_6835 - OBJ
      ?auto_6836 - OBJ
      ?auto_6833 - LOCATION
    )
    :vars
    (
      ?auto_6837 - TRUCK
      ?auto_6838 - LOCATION
      ?auto_6839 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6834 ?auto_6832 ) ( GREATER-THAN ?auto_6835 ?auto_6832 ) ( GREATER-THAN ?auto_6835 ?auto_6834 ) ( GREATER-THAN ?auto_6836 ?auto_6832 ) ( GREATER-THAN ?auto_6836 ?auto_6834 ) ( GREATER-THAN ?auto_6836 ?auto_6835 ) ( IN-TRUCK ?auto_6836 ?auto_6837 ) ( TRUCK-AT ?auto_6837 ?auto_6838 ) ( IN-CITY ?auto_6838 ?auto_6839 ) ( IN-CITY ?auto_6833 ?auto_6839 ) ( not ( = ?auto_6833 ?auto_6838 ) ) ( OBJ-AT ?auto_6832 ?auto_6833 ) ( OBJ-AT ?auto_6834 ?auto_6833 ) ( OBJ-AT ?auto_6835 ?auto_6833 ) ( not ( = ?auto_6832 ?auto_6834 ) ) ( not ( = ?auto_6832 ?auto_6835 ) ) ( not ( = ?auto_6832 ?auto_6836 ) ) ( not ( = ?auto_6834 ?auto_6835 ) ) ( not ( = ?auto_6834 ?auto_6836 ) ) ( not ( = ?auto_6835 ?auto_6836 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6836 ?auto_6833 )
      ( DELIVER-4PKG-VERIFY ?auto_6832 ?auto_6834 ?auto_6835 ?auto_6836 ?auto_6833 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6845 - OBJ
      ?auto_6847 - OBJ
      ?auto_6848 - OBJ
      ?auto_6849 - OBJ
      ?auto_6846 - LOCATION
    )
    :vars
    (
      ?auto_6851 - TRUCK
      ?auto_6850 - LOCATION
      ?auto_6852 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6847 ?auto_6845 ) ( GREATER-THAN ?auto_6848 ?auto_6845 ) ( GREATER-THAN ?auto_6848 ?auto_6847 ) ( GREATER-THAN ?auto_6849 ?auto_6845 ) ( GREATER-THAN ?auto_6849 ?auto_6847 ) ( GREATER-THAN ?auto_6849 ?auto_6848 ) ( TRUCK-AT ?auto_6851 ?auto_6850 ) ( IN-CITY ?auto_6850 ?auto_6852 ) ( IN-CITY ?auto_6846 ?auto_6852 ) ( not ( = ?auto_6846 ?auto_6850 ) ) ( OBJ-AT ?auto_6849 ?auto_6850 ) ( OBJ-AT ?auto_6845 ?auto_6846 ) ( OBJ-AT ?auto_6847 ?auto_6846 ) ( OBJ-AT ?auto_6848 ?auto_6846 ) ( not ( = ?auto_6845 ?auto_6847 ) ) ( not ( = ?auto_6845 ?auto_6848 ) ) ( not ( = ?auto_6845 ?auto_6849 ) ) ( not ( = ?auto_6847 ?auto_6848 ) ) ( not ( = ?auto_6847 ?auto_6849 ) ) ( not ( = ?auto_6848 ?auto_6849 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6849 ?auto_6846 )
      ( DELIVER-4PKG-VERIFY ?auto_6845 ?auto_6847 ?auto_6848 ?auto_6849 ?auto_6846 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6858 - OBJ
      ?auto_6860 - OBJ
      ?auto_6861 - OBJ
      ?auto_6862 - OBJ
      ?auto_6859 - LOCATION
    )
    :vars
    (
      ?auto_6863 - LOCATION
      ?auto_6864 - CITY
      ?auto_6865 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6860 ?auto_6858 ) ( GREATER-THAN ?auto_6861 ?auto_6858 ) ( GREATER-THAN ?auto_6861 ?auto_6860 ) ( GREATER-THAN ?auto_6862 ?auto_6858 ) ( GREATER-THAN ?auto_6862 ?auto_6860 ) ( GREATER-THAN ?auto_6862 ?auto_6861 ) ( IN-CITY ?auto_6863 ?auto_6864 ) ( IN-CITY ?auto_6859 ?auto_6864 ) ( not ( = ?auto_6859 ?auto_6863 ) ) ( OBJ-AT ?auto_6862 ?auto_6863 ) ( TRUCK-AT ?auto_6865 ?auto_6859 ) ( OBJ-AT ?auto_6858 ?auto_6859 ) ( OBJ-AT ?auto_6860 ?auto_6859 ) ( OBJ-AT ?auto_6861 ?auto_6859 ) ( not ( = ?auto_6858 ?auto_6860 ) ) ( not ( = ?auto_6858 ?auto_6861 ) ) ( not ( = ?auto_6858 ?auto_6862 ) ) ( not ( = ?auto_6860 ?auto_6861 ) ) ( not ( = ?auto_6860 ?auto_6862 ) ) ( not ( = ?auto_6861 ?auto_6862 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6862 ?auto_6859 )
      ( DELIVER-4PKG-VERIFY ?auto_6858 ?auto_6860 ?auto_6861 ?auto_6862 ?auto_6859 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6871 - OBJ
      ?auto_6873 - OBJ
      ?auto_6874 - OBJ
      ?auto_6875 - OBJ
      ?auto_6872 - LOCATION
    )
    :vars
    (
      ?auto_6876 - LOCATION
      ?auto_6877 - CITY
      ?auto_6878 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6873 ?auto_6871 ) ( GREATER-THAN ?auto_6874 ?auto_6871 ) ( GREATER-THAN ?auto_6874 ?auto_6873 ) ( GREATER-THAN ?auto_6875 ?auto_6871 ) ( GREATER-THAN ?auto_6875 ?auto_6873 ) ( GREATER-THAN ?auto_6875 ?auto_6874 ) ( IN-CITY ?auto_6876 ?auto_6877 ) ( IN-CITY ?auto_6872 ?auto_6877 ) ( not ( = ?auto_6872 ?auto_6876 ) ) ( OBJ-AT ?auto_6875 ?auto_6876 ) ( TRUCK-AT ?auto_6878 ?auto_6872 ) ( OBJ-AT ?auto_6871 ?auto_6872 ) ( OBJ-AT ?auto_6873 ?auto_6872 ) ( not ( = ?auto_6871 ?auto_6873 ) ) ( not ( = ?auto_6871 ?auto_6874 ) ) ( not ( = ?auto_6871 ?auto_6875 ) ) ( not ( = ?auto_6873 ?auto_6874 ) ) ( not ( = ?auto_6873 ?auto_6875 ) ) ( not ( = ?auto_6874 ?auto_6875 ) ) ( IN-TRUCK ?auto_6874 ?auto_6878 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6874 ?auto_6872 )
      ( DELIVER-4PKG ?auto_6871 ?auto_6873 ?auto_6874 ?auto_6875 ?auto_6872 )
      ( DELIVER-4PKG-VERIFY ?auto_6871 ?auto_6873 ?auto_6874 ?auto_6875 ?auto_6872 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6884 - OBJ
      ?auto_6886 - OBJ
      ?auto_6887 - OBJ
      ?auto_6888 - OBJ
      ?auto_6885 - LOCATION
    )
    :vars
    (
      ?auto_6890 - LOCATION
      ?auto_6891 - CITY
      ?auto_6889 - TRUCK
      ?auto_6892 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6886 ?auto_6884 ) ( GREATER-THAN ?auto_6887 ?auto_6884 ) ( GREATER-THAN ?auto_6887 ?auto_6886 ) ( GREATER-THAN ?auto_6888 ?auto_6884 ) ( GREATER-THAN ?auto_6888 ?auto_6886 ) ( GREATER-THAN ?auto_6888 ?auto_6887 ) ( IN-CITY ?auto_6890 ?auto_6891 ) ( IN-CITY ?auto_6885 ?auto_6891 ) ( not ( = ?auto_6885 ?auto_6890 ) ) ( OBJ-AT ?auto_6888 ?auto_6890 ) ( OBJ-AT ?auto_6884 ?auto_6885 ) ( OBJ-AT ?auto_6886 ?auto_6885 ) ( not ( = ?auto_6884 ?auto_6886 ) ) ( not ( = ?auto_6884 ?auto_6887 ) ) ( not ( = ?auto_6884 ?auto_6888 ) ) ( not ( = ?auto_6886 ?auto_6887 ) ) ( not ( = ?auto_6886 ?auto_6888 ) ) ( not ( = ?auto_6887 ?auto_6888 ) ) ( IN-TRUCK ?auto_6887 ?auto_6889 ) ( TRUCK-AT ?auto_6889 ?auto_6892 ) ( IN-CITY ?auto_6892 ?auto_6891 ) ( not ( = ?auto_6885 ?auto_6892 ) ) ( not ( = ?auto_6890 ?auto_6892 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6889 ?auto_6892 ?auto_6885 ?auto_6891 )
      ( DELIVER-4PKG ?auto_6884 ?auto_6886 ?auto_6887 ?auto_6888 ?auto_6885 )
      ( DELIVER-4PKG-VERIFY ?auto_6884 ?auto_6886 ?auto_6887 ?auto_6888 ?auto_6885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6898 - OBJ
      ?auto_6900 - OBJ
      ?auto_6901 - OBJ
      ?auto_6902 - OBJ
      ?auto_6899 - LOCATION
    )
    :vars
    (
      ?auto_6903 - LOCATION
      ?auto_6905 - CITY
      ?auto_6904 - TRUCK
      ?auto_6906 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6900 ?auto_6898 ) ( GREATER-THAN ?auto_6901 ?auto_6898 ) ( GREATER-THAN ?auto_6901 ?auto_6900 ) ( GREATER-THAN ?auto_6902 ?auto_6898 ) ( GREATER-THAN ?auto_6902 ?auto_6900 ) ( GREATER-THAN ?auto_6902 ?auto_6901 ) ( IN-CITY ?auto_6903 ?auto_6905 ) ( IN-CITY ?auto_6899 ?auto_6905 ) ( not ( = ?auto_6899 ?auto_6903 ) ) ( OBJ-AT ?auto_6902 ?auto_6903 ) ( OBJ-AT ?auto_6898 ?auto_6899 ) ( OBJ-AT ?auto_6900 ?auto_6899 ) ( not ( = ?auto_6898 ?auto_6900 ) ) ( not ( = ?auto_6898 ?auto_6901 ) ) ( not ( = ?auto_6898 ?auto_6902 ) ) ( not ( = ?auto_6900 ?auto_6901 ) ) ( not ( = ?auto_6900 ?auto_6902 ) ) ( not ( = ?auto_6901 ?auto_6902 ) ) ( TRUCK-AT ?auto_6904 ?auto_6906 ) ( IN-CITY ?auto_6906 ?auto_6905 ) ( not ( = ?auto_6899 ?auto_6906 ) ) ( not ( = ?auto_6903 ?auto_6906 ) ) ( OBJ-AT ?auto_6901 ?auto_6906 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6901 ?auto_6904 ?auto_6906 )
      ( DELIVER-4PKG ?auto_6898 ?auto_6900 ?auto_6901 ?auto_6902 ?auto_6899 )
      ( DELIVER-4PKG-VERIFY ?auto_6898 ?auto_6900 ?auto_6901 ?auto_6902 ?auto_6899 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6912 - OBJ
      ?auto_6914 - OBJ
      ?auto_6915 - OBJ
      ?auto_6916 - OBJ
      ?auto_6913 - LOCATION
    )
    :vars
    (
      ?auto_6917 - LOCATION
      ?auto_6920 - CITY
      ?auto_6918 - LOCATION
      ?auto_6919 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6914 ?auto_6912 ) ( GREATER-THAN ?auto_6915 ?auto_6912 ) ( GREATER-THAN ?auto_6915 ?auto_6914 ) ( GREATER-THAN ?auto_6916 ?auto_6912 ) ( GREATER-THAN ?auto_6916 ?auto_6914 ) ( GREATER-THAN ?auto_6916 ?auto_6915 ) ( IN-CITY ?auto_6917 ?auto_6920 ) ( IN-CITY ?auto_6913 ?auto_6920 ) ( not ( = ?auto_6913 ?auto_6917 ) ) ( OBJ-AT ?auto_6916 ?auto_6917 ) ( OBJ-AT ?auto_6912 ?auto_6913 ) ( OBJ-AT ?auto_6914 ?auto_6913 ) ( not ( = ?auto_6912 ?auto_6914 ) ) ( not ( = ?auto_6912 ?auto_6915 ) ) ( not ( = ?auto_6912 ?auto_6916 ) ) ( not ( = ?auto_6914 ?auto_6915 ) ) ( not ( = ?auto_6914 ?auto_6916 ) ) ( not ( = ?auto_6915 ?auto_6916 ) ) ( IN-CITY ?auto_6918 ?auto_6920 ) ( not ( = ?auto_6913 ?auto_6918 ) ) ( not ( = ?auto_6917 ?auto_6918 ) ) ( OBJ-AT ?auto_6915 ?auto_6918 ) ( TRUCK-AT ?auto_6919 ?auto_6913 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6919 ?auto_6913 ?auto_6918 ?auto_6920 )
      ( DELIVER-4PKG ?auto_6912 ?auto_6914 ?auto_6915 ?auto_6916 ?auto_6913 )
      ( DELIVER-4PKG-VERIFY ?auto_6912 ?auto_6914 ?auto_6915 ?auto_6916 ?auto_6913 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6926 - OBJ
      ?auto_6928 - OBJ
      ?auto_6929 - OBJ
      ?auto_6930 - OBJ
      ?auto_6927 - LOCATION
    )
    :vars
    (
      ?auto_6931 - LOCATION
      ?auto_6933 - CITY
      ?auto_6932 - LOCATION
      ?auto_6934 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6928 ?auto_6926 ) ( GREATER-THAN ?auto_6929 ?auto_6926 ) ( GREATER-THAN ?auto_6929 ?auto_6928 ) ( GREATER-THAN ?auto_6930 ?auto_6926 ) ( GREATER-THAN ?auto_6930 ?auto_6928 ) ( GREATER-THAN ?auto_6930 ?auto_6929 ) ( IN-CITY ?auto_6931 ?auto_6933 ) ( IN-CITY ?auto_6927 ?auto_6933 ) ( not ( = ?auto_6927 ?auto_6931 ) ) ( OBJ-AT ?auto_6930 ?auto_6931 ) ( OBJ-AT ?auto_6926 ?auto_6927 ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( not ( = ?auto_6926 ?auto_6929 ) ) ( not ( = ?auto_6926 ?auto_6930 ) ) ( not ( = ?auto_6928 ?auto_6929 ) ) ( not ( = ?auto_6928 ?auto_6930 ) ) ( not ( = ?auto_6929 ?auto_6930 ) ) ( IN-CITY ?auto_6932 ?auto_6933 ) ( not ( = ?auto_6927 ?auto_6932 ) ) ( not ( = ?auto_6931 ?auto_6932 ) ) ( OBJ-AT ?auto_6929 ?auto_6932 ) ( TRUCK-AT ?auto_6934 ?auto_6927 ) ( IN-TRUCK ?auto_6928 ?auto_6934 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6928 ?auto_6927 )
      ( DELIVER-4PKG ?auto_6926 ?auto_6928 ?auto_6929 ?auto_6930 ?auto_6927 )
      ( DELIVER-4PKG-VERIFY ?auto_6926 ?auto_6928 ?auto_6929 ?auto_6930 ?auto_6927 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6940 - OBJ
      ?auto_6942 - OBJ
      ?auto_6943 - OBJ
      ?auto_6944 - OBJ
      ?auto_6941 - LOCATION
    )
    :vars
    (
      ?auto_6946 - LOCATION
      ?auto_6945 - CITY
      ?auto_6948 - LOCATION
      ?auto_6947 - TRUCK
      ?auto_6949 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6942 ?auto_6940 ) ( GREATER-THAN ?auto_6943 ?auto_6940 ) ( GREATER-THAN ?auto_6943 ?auto_6942 ) ( GREATER-THAN ?auto_6944 ?auto_6940 ) ( GREATER-THAN ?auto_6944 ?auto_6942 ) ( GREATER-THAN ?auto_6944 ?auto_6943 ) ( IN-CITY ?auto_6946 ?auto_6945 ) ( IN-CITY ?auto_6941 ?auto_6945 ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( OBJ-AT ?auto_6944 ?auto_6946 ) ( OBJ-AT ?auto_6940 ?auto_6941 ) ( not ( = ?auto_6940 ?auto_6942 ) ) ( not ( = ?auto_6940 ?auto_6943 ) ) ( not ( = ?auto_6940 ?auto_6944 ) ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6944 ) ) ( not ( = ?auto_6943 ?auto_6944 ) ) ( IN-CITY ?auto_6948 ?auto_6945 ) ( not ( = ?auto_6941 ?auto_6948 ) ) ( not ( = ?auto_6946 ?auto_6948 ) ) ( OBJ-AT ?auto_6943 ?auto_6948 ) ( IN-TRUCK ?auto_6942 ?auto_6947 ) ( TRUCK-AT ?auto_6947 ?auto_6949 ) ( IN-CITY ?auto_6949 ?auto_6945 ) ( not ( = ?auto_6941 ?auto_6949 ) ) ( not ( = ?auto_6946 ?auto_6949 ) ) ( not ( = ?auto_6948 ?auto_6949 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6947 ?auto_6949 ?auto_6941 ?auto_6945 )
      ( DELIVER-4PKG ?auto_6940 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6941 )
      ( DELIVER-4PKG-VERIFY ?auto_6940 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6955 - OBJ
      ?auto_6957 - OBJ
      ?auto_6958 - OBJ
      ?auto_6959 - OBJ
      ?auto_6956 - LOCATION
    )
    :vars
    (
      ?auto_6960 - LOCATION
      ?auto_6963 - CITY
      ?auto_6961 - LOCATION
      ?auto_6964 - TRUCK
      ?auto_6962 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6957 ?auto_6955 ) ( GREATER-THAN ?auto_6958 ?auto_6955 ) ( GREATER-THAN ?auto_6958 ?auto_6957 ) ( GREATER-THAN ?auto_6959 ?auto_6955 ) ( GREATER-THAN ?auto_6959 ?auto_6957 ) ( GREATER-THAN ?auto_6959 ?auto_6958 ) ( IN-CITY ?auto_6960 ?auto_6963 ) ( IN-CITY ?auto_6956 ?auto_6963 ) ( not ( = ?auto_6956 ?auto_6960 ) ) ( OBJ-AT ?auto_6959 ?auto_6960 ) ( OBJ-AT ?auto_6955 ?auto_6956 ) ( not ( = ?auto_6955 ?auto_6957 ) ) ( not ( = ?auto_6955 ?auto_6958 ) ) ( not ( = ?auto_6955 ?auto_6959 ) ) ( not ( = ?auto_6957 ?auto_6958 ) ) ( not ( = ?auto_6957 ?auto_6959 ) ) ( not ( = ?auto_6958 ?auto_6959 ) ) ( IN-CITY ?auto_6961 ?auto_6963 ) ( not ( = ?auto_6956 ?auto_6961 ) ) ( not ( = ?auto_6960 ?auto_6961 ) ) ( OBJ-AT ?auto_6958 ?auto_6961 ) ( TRUCK-AT ?auto_6964 ?auto_6962 ) ( IN-CITY ?auto_6962 ?auto_6963 ) ( not ( = ?auto_6956 ?auto_6962 ) ) ( not ( = ?auto_6960 ?auto_6962 ) ) ( not ( = ?auto_6961 ?auto_6962 ) ) ( OBJ-AT ?auto_6957 ?auto_6962 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6957 ?auto_6964 ?auto_6962 )
      ( DELIVER-4PKG ?auto_6955 ?auto_6957 ?auto_6958 ?auto_6959 ?auto_6956 )
      ( DELIVER-4PKG-VERIFY ?auto_6955 ?auto_6957 ?auto_6958 ?auto_6959 ?auto_6956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6970 - OBJ
      ?auto_6972 - OBJ
      ?auto_6973 - OBJ
      ?auto_6974 - OBJ
      ?auto_6971 - LOCATION
    )
    :vars
    (
      ?auto_6977 - LOCATION
      ?auto_6975 - CITY
      ?auto_6978 - LOCATION
      ?auto_6976 - LOCATION
      ?auto_6979 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6972 ?auto_6970 ) ( GREATER-THAN ?auto_6973 ?auto_6970 ) ( GREATER-THAN ?auto_6973 ?auto_6972 ) ( GREATER-THAN ?auto_6974 ?auto_6970 ) ( GREATER-THAN ?auto_6974 ?auto_6972 ) ( GREATER-THAN ?auto_6974 ?auto_6973 ) ( IN-CITY ?auto_6977 ?auto_6975 ) ( IN-CITY ?auto_6971 ?auto_6975 ) ( not ( = ?auto_6971 ?auto_6977 ) ) ( OBJ-AT ?auto_6974 ?auto_6977 ) ( OBJ-AT ?auto_6970 ?auto_6971 ) ( not ( = ?auto_6970 ?auto_6972 ) ) ( not ( = ?auto_6970 ?auto_6973 ) ) ( not ( = ?auto_6970 ?auto_6974 ) ) ( not ( = ?auto_6972 ?auto_6973 ) ) ( not ( = ?auto_6972 ?auto_6974 ) ) ( not ( = ?auto_6973 ?auto_6974 ) ) ( IN-CITY ?auto_6978 ?auto_6975 ) ( not ( = ?auto_6971 ?auto_6978 ) ) ( not ( = ?auto_6977 ?auto_6978 ) ) ( OBJ-AT ?auto_6973 ?auto_6978 ) ( IN-CITY ?auto_6976 ?auto_6975 ) ( not ( = ?auto_6971 ?auto_6976 ) ) ( not ( = ?auto_6977 ?auto_6976 ) ) ( not ( = ?auto_6978 ?auto_6976 ) ) ( OBJ-AT ?auto_6972 ?auto_6976 ) ( TRUCK-AT ?auto_6979 ?auto_6971 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6979 ?auto_6971 ?auto_6976 ?auto_6975 )
      ( DELIVER-4PKG ?auto_6970 ?auto_6972 ?auto_6973 ?auto_6974 ?auto_6971 )
      ( DELIVER-4PKG-VERIFY ?auto_6970 ?auto_6972 ?auto_6973 ?auto_6974 ?auto_6971 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6985 - OBJ
      ?auto_6987 - OBJ
      ?auto_6988 - OBJ
      ?auto_6989 - OBJ
      ?auto_6986 - LOCATION
    )
    :vars
    (
      ?auto_6990 - LOCATION
      ?auto_6994 - CITY
      ?auto_6992 - LOCATION
      ?auto_6993 - LOCATION
      ?auto_6991 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6987 ?auto_6985 ) ( GREATER-THAN ?auto_6988 ?auto_6985 ) ( GREATER-THAN ?auto_6988 ?auto_6987 ) ( GREATER-THAN ?auto_6989 ?auto_6985 ) ( GREATER-THAN ?auto_6989 ?auto_6987 ) ( GREATER-THAN ?auto_6989 ?auto_6988 ) ( IN-CITY ?auto_6990 ?auto_6994 ) ( IN-CITY ?auto_6986 ?auto_6994 ) ( not ( = ?auto_6986 ?auto_6990 ) ) ( OBJ-AT ?auto_6989 ?auto_6990 ) ( not ( = ?auto_6985 ?auto_6987 ) ) ( not ( = ?auto_6985 ?auto_6988 ) ) ( not ( = ?auto_6985 ?auto_6989 ) ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_6989 ) ) ( not ( = ?auto_6988 ?auto_6989 ) ) ( IN-CITY ?auto_6992 ?auto_6994 ) ( not ( = ?auto_6986 ?auto_6992 ) ) ( not ( = ?auto_6990 ?auto_6992 ) ) ( OBJ-AT ?auto_6988 ?auto_6992 ) ( IN-CITY ?auto_6993 ?auto_6994 ) ( not ( = ?auto_6986 ?auto_6993 ) ) ( not ( = ?auto_6990 ?auto_6993 ) ) ( not ( = ?auto_6992 ?auto_6993 ) ) ( OBJ-AT ?auto_6987 ?auto_6993 ) ( TRUCK-AT ?auto_6991 ?auto_6986 ) ( IN-TRUCK ?auto_6985 ?auto_6991 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6985 ?auto_6986 )
      ( DELIVER-4PKG ?auto_6985 ?auto_6987 ?auto_6988 ?auto_6989 ?auto_6986 )
      ( DELIVER-4PKG-VERIFY ?auto_6985 ?auto_6987 ?auto_6988 ?auto_6989 ?auto_6986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7000 - OBJ
      ?auto_7002 - OBJ
      ?auto_7003 - OBJ
      ?auto_7004 - OBJ
      ?auto_7001 - LOCATION
    )
    :vars
    (
      ?auto_7006 - LOCATION
      ?auto_7008 - CITY
      ?auto_7007 - LOCATION
      ?auto_7005 - LOCATION
      ?auto_7009 - TRUCK
      ?auto_7010 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7002 ?auto_7000 ) ( GREATER-THAN ?auto_7003 ?auto_7000 ) ( GREATER-THAN ?auto_7003 ?auto_7002 ) ( GREATER-THAN ?auto_7004 ?auto_7000 ) ( GREATER-THAN ?auto_7004 ?auto_7002 ) ( GREATER-THAN ?auto_7004 ?auto_7003 ) ( IN-CITY ?auto_7006 ?auto_7008 ) ( IN-CITY ?auto_7001 ?auto_7008 ) ( not ( = ?auto_7001 ?auto_7006 ) ) ( OBJ-AT ?auto_7004 ?auto_7006 ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7003 ) ) ( not ( = ?auto_7000 ?auto_7004 ) ) ( not ( = ?auto_7002 ?auto_7003 ) ) ( not ( = ?auto_7002 ?auto_7004 ) ) ( not ( = ?auto_7003 ?auto_7004 ) ) ( IN-CITY ?auto_7007 ?auto_7008 ) ( not ( = ?auto_7001 ?auto_7007 ) ) ( not ( = ?auto_7006 ?auto_7007 ) ) ( OBJ-AT ?auto_7003 ?auto_7007 ) ( IN-CITY ?auto_7005 ?auto_7008 ) ( not ( = ?auto_7001 ?auto_7005 ) ) ( not ( = ?auto_7006 ?auto_7005 ) ) ( not ( = ?auto_7007 ?auto_7005 ) ) ( OBJ-AT ?auto_7002 ?auto_7005 ) ( IN-TRUCK ?auto_7000 ?auto_7009 ) ( TRUCK-AT ?auto_7009 ?auto_7010 ) ( IN-CITY ?auto_7010 ?auto_7008 ) ( not ( = ?auto_7001 ?auto_7010 ) ) ( not ( = ?auto_7006 ?auto_7010 ) ) ( not ( = ?auto_7007 ?auto_7010 ) ) ( not ( = ?auto_7005 ?auto_7010 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7009 ?auto_7010 ?auto_7001 ?auto_7008 )
      ( DELIVER-4PKG ?auto_7000 ?auto_7002 ?auto_7003 ?auto_7004 ?auto_7001 )
      ( DELIVER-4PKG-VERIFY ?auto_7000 ?auto_7002 ?auto_7003 ?auto_7004 ?auto_7001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7016 - OBJ
      ?auto_7018 - OBJ
      ?auto_7019 - OBJ
      ?auto_7020 - OBJ
      ?auto_7017 - LOCATION
    )
    :vars
    (
      ?auto_7023 - LOCATION
      ?auto_7025 - CITY
      ?auto_7026 - LOCATION
      ?auto_7021 - LOCATION
      ?auto_7022 - TRUCK
      ?auto_7024 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7018 ?auto_7016 ) ( GREATER-THAN ?auto_7019 ?auto_7016 ) ( GREATER-THAN ?auto_7019 ?auto_7018 ) ( GREATER-THAN ?auto_7020 ?auto_7016 ) ( GREATER-THAN ?auto_7020 ?auto_7018 ) ( GREATER-THAN ?auto_7020 ?auto_7019 ) ( IN-CITY ?auto_7023 ?auto_7025 ) ( IN-CITY ?auto_7017 ?auto_7025 ) ( not ( = ?auto_7017 ?auto_7023 ) ) ( OBJ-AT ?auto_7020 ?auto_7023 ) ( not ( = ?auto_7016 ?auto_7018 ) ) ( not ( = ?auto_7016 ?auto_7019 ) ) ( not ( = ?auto_7016 ?auto_7020 ) ) ( not ( = ?auto_7018 ?auto_7019 ) ) ( not ( = ?auto_7018 ?auto_7020 ) ) ( not ( = ?auto_7019 ?auto_7020 ) ) ( IN-CITY ?auto_7026 ?auto_7025 ) ( not ( = ?auto_7017 ?auto_7026 ) ) ( not ( = ?auto_7023 ?auto_7026 ) ) ( OBJ-AT ?auto_7019 ?auto_7026 ) ( IN-CITY ?auto_7021 ?auto_7025 ) ( not ( = ?auto_7017 ?auto_7021 ) ) ( not ( = ?auto_7023 ?auto_7021 ) ) ( not ( = ?auto_7026 ?auto_7021 ) ) ( OBJ-AT ?auto_7018 ?auto_7021 ) ( TRUCK-AT ?auto_7022 ?auto_7024 ) ( IN-CITY ?auto_7024 ?auto_7025 ) ( not ( = ?auto_7017 ?auto_7024 ) ) ( not ( = ?auto_7023 ?auto_7024 ) ) ( not ( = ?auto_7026 ?auto_7024 ) ) ( not ( = ?auto_7021 ?auto_7024 ) ) ( OBJ-AT ?auto_7016 ?auto_7024 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7016 ?auto_7022 ?auto_7024 )
      ( DELIVER-4PKG ?auto_7016 ?auto_7018 ?auto_7019 ?auto_7020 ?auto_7017 )
      ( DELIVER-4PKG-VERIFY ?auto_7016 ?auto_7018 ?auto_7019 ?auto_7020 ?auto_7017 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7032 - OBJ
      ?auto_7034 - OBJ
      ?auto_7035 - OBJ
      ?auto_7036 - OBJ
      ?auto_7033 - LOCATION
    )
    :vars
    (
      ?auto_7040 - LOCATION
      ?auto_7037 - CITY
      ?auto_7041 - LOCATION
      ?auto_7039 - LOCATION
      ?auto_7042 - LOCATION
      ?auto_7038 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7034 ?auto_7032 ) ( GREATER-THAN ?auto_7035 ?auto_7032 ) ( GREATER-THAN ?auto_7035 ?auto_7034 ) ( GREATER-THAN ?auto_7036 ?auto_7032 ) ( GREATER-THAN ?auto_7036 ?auto_7034 ) ( GREATER-THAN ?auto_7036 ?auto_7035 ) ( IN-CITY ?auto_7040 ?auto_7037 ) ( IN-CITY ?auto_7033 ?auto_7037 ) ( not ( = ?auto_7033 ?auto_7040 ) ) ( OBJ-AT ?auto_7036 ?auto_7040 ) ( not ( = ?auto_7032 ?auto_7034 ) ) ( not ( = ?auto_7032 ?auto_7035 ) ) ( not ( = ?auto_7032 ?auto_7036 ) ) ( not ( = ?auto_7034 ?auto_7035 ) ) ( not ( = ?auto_7034 ?auto_7036 ) ) ( not ( = ?auto_7035 ?auto_7036 ) ) ( IN-CITY ?auto_7041 ?auto_7037 ) ( not ( = ?auto_7033 ?auto_7041 ) ) ( not ( = ?auto_7040 ?auto_7041 ) ) ( OBJ-AT ?auto_7035 ?auto_7041 ) ( IN-CITY ?auto_7039 ?auto_7037 ) ( not ( = ?auto_7033 ?auto_7039 ) ) ( not ( = ?auto_7040 ?auto_7039 ) ) ( not ( = ?auto_7041 ?auto_7039 ) ) ( OBJ-AT ?auto_7034 ?auto_7039 ) ( IN-CITY ?auto_7042 ?auto_7037 ) ( not ( = ?auto_7033 ?auto_7042 ) ) ( not ( = ?auto_7040 ?auto_7042 ) ) ( not ( = ?auto_7041 ?auto_7042 ) ) ( not ( = ?auto_7039 ?auto_7042 ) ) ( OBJ-AT ?auto_7032 ?auto_7042 ) ( TRUCK-AT ?auto_7038 ?auto_7033 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7038 ?auto_7033 ?auto_7042 ?auto_7037 )
      ( DELIVER-4PKG ?auto_7032 ?auto_7034 ?auto_7035 ?auto_7036 ?auto_7033 )
      ( DELIVER-4PKG-VERIFY ?auto_7032 ?auto_7034 ?auto_7035 ?auto_7036 ?auto_7033 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7075 - OBJ
      ?auto_7077 - OBJ
      ?auto_7078 - OBJ
      ?auto_7079 - OBJ
      ?auto_7080 - OBJ
      ?auto_7076 - LOCATION
    )
    :vars
    (
      ?auto_7081 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7077 ?auto_7075 ) ( GREATER-THAN ?auto_7078 ?auto_7075 ) ( GREATER-THAN ?auto_7078 ?auto_7077 ) ( GREATER-THAN ?auto_7079 ?auto_7075 ) ( GREATER-THAN ?auto_7079 ?auto_7077 ) ( GREATER-THAN ?auto_7079 ?auto_7078 ) ( GREATER-THAN ?auto_7080 ?auto_7075 ) ( GREATER-THAN ?auto_7080 ?auto_7077 ) ( GREATER-THAN ?auto_7080 ?auto_7078 ) ( GREATER-THAN ?auto_7080 ?auto_7079 ) ( TRUCK-AT ?auto_7081 ?auto_7076 ) ( IN-TRUCK ?auto_7080 ?auto_7081 ) ( OBJ-AT ?auto_7075 ?auto_7076 ) ( OBJ-AT ?auto_7077 ?auto_7076 ) ( OBJ-AT ?auto_7078 ?auto_7076 ) ( OBJ-AT ?auto_7079 ?auto_7076 ) ( not ( = ?auto_7075 ?auto_7077 ) ) ( not ( = ?auto_7075 ?auto_7078 ) ) ( not ( = ?auto_7075 ?auto_7079 ) ) ( not ( = ?auto_7075 ?auto_7080 ) ) ( not ( = ?auto_7077 ?auto_7078 ) ) ( not ( = ?auto_7077 ?auto_7079 ) ) ( not ( = ?auto_7077 ?auto_7080 ) ) ( not ( = ?auto_7078 ?auto_7079 ) ) ( not ( = ?auto_7078 ?auto_7080 ) ) ( not ( = ?auto_7079 ?auto_7080 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7080 ?auto_7076 )
      ( DELIVER-5PKG-VERIFY ?auto_7075 ?auto_7077 ?auto_7078 ?auto_7079 ?auto_7080 ?auto_7076 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7088 - OBJ
      ?auto_7090 - OBJ
      ?auto_7091 - OBJ
      ?auto_7092 - OBJ
      ?auto_7093 - OBJ
      ?auto_7089 - LOCATION
    )
    :vars
    (
      ?auto_7096 - TRUCK
      ?auto_7094 - LOCATION
      ?auto_7095 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7090 ?auto_7088 ) ( GREATER-THAN ?auto_7091 ?auto_7088 ) ( GREATER-THAN ?auto_7091 ?auto_7090 ) ( GREATER-THAN ?auto_7092 ?auto_7088 ) ( GREATER-THAN ?auto_7092 ?auto_7090 ) ( GREATER-THAN ?auto_7092 ?auto_7091 ) ( GREATER-THAN ?auto_7093 ?auto_7088 ) ( GREATER-THAN ?auto_7093 ?auto_7090 ) ( GREATER-THAN ?auto_7093 ?auto_7091 ) ( GREATER-THAN ?auto_7093 ?auto_7092 ) ( IN-TRUCK ?auto_7093 ?auto_7096 ) ( TRUCK-AT ?auto_7096 ?auto_7094 ) ( IN-CITY ?auto_7094 ?auto_7095 ) ( IN-CITY ?auto_7089 ?auto_7095 ) ( not ( = ?auto_7089 ?auto_7094 ) ) ( OBJ-AT ?auto_7088 ?auto_7089 ) ( OBJ-AT ?auto_7090 ?auto_7089 ) ( OBJ-AT ?auto_7091 ?auto_7089 ) ( OBJ-AT ?auto_7092 ?auto_7089 ) ( not ( = ?auto_7088 ?auto_7090 ) ) ( not ( = ?auto_7088 ?auto_7091 ) ) ( not ( = ?auto_7088 ?auto_7092 ) ) ( not ( = ?auto_7088 ?auto_7093 ) ) ( not ( = ?auto_7090 ?auto_7091 ) ) ( not ( = ?auto_7090 ?auto_7092 ) ) ( not ( = ?auto_7090 ?auto_7093 ) ) ( not ( = ?auto_7091 ?auto_7092 ) ) ( not ( = ?auto_7091 ?auto_7093 ) ) ( not ( = ?auto_7092 ?auto_7093 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7093 ?auto_7089 )
      ( DELIVER-5PKG-VERIFY ?auto_7088 ?auto_7090 ?auto_7091 ?auto_7092 ?auto_7093 ?auto_7089 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7103 - OBJ
      ?auto_7105 - OBJ
      ?auto_7106 - OBJ
      ?auto_7107 - OBJ
      ?auto_7108 - OBJ
      ?auto_7104 - LOCATION
    )
    :vars
    (
      ?auto_7109 - TRUCK
      ?auto_7110 - LOCATION
      ?auto_7111 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7105 ?auto_7103 ) ( GREATER-THAN ?auto_7106 ?auto_7103 ) ( GREATER-THAN ?auto_7106 ?auto_7105 ) ( GREATER-THAN ?auto_7107 ?auto_7103 ) ( GREATER-THAN ?auto_7107 ?auto_7105 ) ( GREATER-THAN ?auto_7107 ?auto_7106 ) ( GREATER-THAN ?auto_7108 ?auto_7103 ) ( GREATER-THAN ?auto_7108 ?auto_7105 ) ( GREATER-THAN ?auto_7108 ?auto_7106 ) ( GREATER-THAN ?auto_7108 ?auto_7107 ) ( TRUCK-AT ?auto_7109 ?auto_7110 ) ( IN-CITY ?auto_7110 ?auto_7111 ) ( IN-CITY ?auto_7104 ?auto_7111 ) ( not ( = ?auto_7104 ?auto_7110 ) ) ( OBJ-AT ?auto_7108 ?auto_7110 ) ( OBJ-AT ?auto_7103 ?auto_7104 ) ( OBJ-AT ?auto_7105 ?auto_7104 ) ( OBJ-AT ?auto_7106 ?auto_7104 ) ( OBJ-AT ?auto_7107 ?auto_7104 ) ( not ( = ?auto_7103 ?auto_7105 ) ) ( not ( = ?auto_7103 ?auto_7106 ) ) ( not ( = ?auto_7103 ?auto_7107 ) ) ( not ( = ?auto_7103 ?auto_7108 ) ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7108 ) ) ( not ( = ?auto_7106 ?auto_7107 ) ) ( not ( = ?auto_7106 ?auto_7108 ) ) ( not ( = ?auto_7107 ?auto_7108 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7108 ?auto_7104 )
      ( DELIVER-5PKG-VERIFY ?auto_7103 ?auto_7105 ?auto_7106 ?auto_7107 ?auto_7108 ?auto_7104 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7118 - OBJ
      ?auto_7120 - OBJ
      ?auto_7121 - OBJ
      ?auto_7122 - OBJ
      ?auto_7123 - OBJ
      ?auto_7119 - LOCATION
    )
    :vars
    (
      ?auto_7126 - LOCATION
      ?auto_7124 - CITY
      ?auto_7125 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7120 ?auto_7118 ) ( GREATER-THAN ?auto_7121 ?auto_7118 ) ( GREATER-THAN ?auto_7121 ?auto_7120 ) ( GREATER-THAN ?auto_7122 ?auto_7118 ) ( GREATER-THAN ?auto_7122 ?auto_7120 ) ( GREATER-THAN ?auto_7122 ?auto_7121 ) ( GREATER-THAN ?auto_7123 ?auto_7118 ) ( GREATER-THAN ?auto_7123 ?auto_7120 ) ( GREATER-THAN ?auto_7123 ?auto_7121 ) ( GREATER-THAN ?auto_7123 ?auto_7122 ) ( IN-CITY ?auto_7126 ?auto_7124 ) ( IN-CITY ?auto_7119 ?auto_7124 ) ( not ( = ?auto_7119 ?auto_7126 ) ) ( OBJ-AT ?auto_7123 ?auto_7126 ) ( TRUCK-AT ?auto_7125 ?auto_7119 ) ( OBJ-AT ?auto_7118 ?auto_7119 ) ( OBJ-AT ?auto_7120 ?auto_7119 ) ( OBJ-AT ?auto_7121 ?auto_7119 ) ( OBJ-AT ?auto_7122 ?auto_7119 ) ( not ( = ?auto_7118 ?auto_7120 ) ) ( not ( = ?auto_7118 ?auto_7121 ) ) ( not ( = ?auto_7118 ?auto_7122 ) ) ( not ( = ?auto_7118 ?auto_7123 ) ) ( not ( = ?auto_7120 ?auto_7121 ) ) ( not ( = ?auto_7120 ?auto_7122 ) ) ( not ( = ?auto_7120 ?auto_7123 ) ) ( not ( = ?auto_7121 ?auto_7122 ) ) ( not ( = ?auto_7121 ?auto_7123 ) ) ( not ( = ?auto_7122 ?auto_7123 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7123 ?auto_7119 )
      ( DELIVER-5PKG-VERIFY ?auto_7118 ?auto_7120 ?auto_7121 ?auto_7122 ?auto_7123 ?auto_7119 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7133 - OBJ
      ?auto_7135 - OBJ
      ?auto_7136 - OBJ
      ?auto_7137 - OBJ
      ?auto_7138 - OBJ
      ?auto_7134 - LOCATION
    )
    :vars
    (
      ?auto_7140 - LOCATION
      ?auto_7139 - CITY
      ?auto_7141 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7135 ?auto_7133 ) ( GREATER-THAN ?auto_7136 ?auto_7133 ) ( GREATER-THAN ?auto_7136 ?auto_7135 ) ( GREATER-THAN ?auto_7137 ?auto_7133 ) ( GREATER-THAN ?auto_7137 ?auto_7135 ) ( GREATER-THAN ?auto_7137 ?auto_7136 ) ( GREATER-THAN ?auto_7138 ?auto_7133 ) ( GREATER-THAN ?auto_7138 ?auto_7135 ) ( GREATER-THAN ?auto_7138 ?auto_7136 ) ( GREATER-THAN ?auto_7138 ?auto_7137 ) ( IN-CITY ?auto_7140 ?auto_7139 ) ( IN-CITY ?auto_7134 ?auto_7139 ) ( not ( = ?auto_7134 ?auto_7140 ) ) ( OBJ-AT ?auto_7138 ?auto_7140 ) ( TRUCK-AT ?auto_7141 ?auto_7134 ) ( OBJ-AT ?auto_7133 ?auto_7134 ) ( OBJ-AT ?auto_7135 ?auto_7134 ) ( OBJ-AT ?auto_7136 ?auto_7134 ) ( not ( = ?auto_7133 ?auto_7135 ) ) ( not ( = ?auto_7133 ?auto_7136 ) ) ( not ( = ?auto_7133 ?auto_7137 ) ) ( not ( = ?auto_7133 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7137 ) ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( not ( = ?auto_7136 ?auto_7137 ) ) ( not ( = ?auto_7136 ?auto_7138 ) ) ( not ( = ?auto_7137 ?auto_7138 ) ) ( IN-TRUCK ?auto_7137 ?auto_7141 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7137 ?auto_7134 )
      ( DELIVER-5PKG ?auto_7133 ?auto_7135 ?auto_7136 ?auto_7137 ?auto_7138 ?auto_7134 )
      ( DELIVER-5PKG-VERIFY ?auto_7133 ?auto_7135 ?auto_7136 ?auto_7137 ?auto_7138 ?auto_7134 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7148 - OBJ
      ?auto_7150 - OBJ
      ?auto_7151 - OBJ
      ?auto_7152 - OBJ
      ?auto_7153 - OBJ
      ?auto_7149 - LOCATION
    )
    :vars
    (
      ?auto_7156 - LOCATION
      ?auto_7154 - CITY
      ?auto_7155 - TRUCK
      ?auto_7157 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7150 ?auto_7148 ) ( GREATER-THAN ?auto_7151 ?auto_7148 ) ( GREATER-THAN ?auto_7151 ?auto_7150 ) ( GREATER-THAN ?auto_7152 ?auto_7148 ) ( GREATER-THAN ?auto_7152 ?auto_7150 ) ( GREATER-THAN ?auto_7152 ?auto_7151 ) ( GREATER-THAN ?auto_7153 ?auto_7148 ) ( GREATER-THAN ?auto_7153 ?auto_7150 ) ( GREATER-THAN ?auto_7153 ?auto_7151 ) ( GREATER-THAN ?auto_7153 ?auto_7152 ) ( IN-CITY ?auto_7156 ?auto_7154 ) ( IN-CITY ?auto_7149 ?auto_7154 ) ( not ( = ?auto_7149 ?auto_7156 ) ) ( OBJ-AT ?auto_7153 ?auto_7156 ) ( OBJ-AT ?auto_7148 ?auto_7149 ) ( OBJ-AT ?auto_7150 ?auto_7149 ) ( OBJ-AT ?auto_7151 ?auto_7149 ) ( not ( = ?auto_7148 ?auto_7150 ) ) ( not ( = ?auto_7148 ?auto_7151 ) ) ( not ( = ?auto_7148 ?auto_7152 ) ) ( not ( = ?auto_7148 ?auto_7153 ) ) ( not ( = ?auto_7150 ?auto_7151 ) ) ( not ( = ?auto_7150 ?auto_7152 ) ) ( not ( = ?auto_7150 ?auto_7153 ) ) ( not ( = ?auto_7151 ?auto_7152 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7153 ) ) ( IN-TRUCK ?auto_7152 ?auto_7155 ) ( TRUCK-AT ?auto_7155 ?auto_7157 ) ( IN-CITY ?auto_7157 ?auto_7154 ) ( not ( = ?auto_7149 ?auto_7157 ) ) ( not ( = ?auto_7156 ?auto_7157 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7155 ?auto_7157 ?auto_7149 ?auto_7154 )
      ( DELIVER-5PKG ?auto_7148 ?auto_7150 ?auto_7151 ?auto_7152 ?auto_7153 ?auto_7149 )
      ( DELIVER-5PKG-VERIFY ?auto_7148 ?auto_7150 ?auto_7151 ?auto_7152 ?auto_7153 ?auto_7149 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7164 - OBJ
      ?auto_7166 - OBJ
      ?auto_7167 - OBJ
      ?auto_7168 - OBJ
      ?auto_7169 - OBJ
      ?auto_7165 - LOCATION
    )
    :vars
    (
      ?auto_7172 - LOCATION
      ?auto_7171 - CITY
      ?auto_7170 - TRUCK
      ?auto_7173 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7166 ?auto_7164 ) ( GREATER-THAN ?auto_7167 ?auto_7164 ) ( GREATER-THAN ?auto_7167 ?auto_7166 ) ( GREATER-THAN ?auto_7168 ?auto_7164 ) ( GREATER-THAN ?auto_7168 ?auto_7166 ) ( GREATER-THAN ?auto_7168 ?auto_7167 ) ( GREATER-THAN ?auto_7169 ?auto_7164 ) ( GREATER-THAN ?auto_7169 ?auto_7166 ) ( GREATER-THAN ?auto_7169 ?auto_7167 ) ( GREATER-THAN ?auto_7169 ?auto_7168 ) ( IN-CITY ?auto_7172 ?auto_7171 ) ( IN-CITY ?auto_7165 ?auto_7171 ) ( not ( = ?auto_7165 ?auto_7172 ) ) ( OBJ-AT ?auto_7169 ?auto_7172 ) ( OBJ-AT ?auto_7164 ?auto_7165 ) ( OBJ-AT ?auto_7166 ?auto_7165 ) ( OBJ-AT ?auto_7167 ?auto_7165 ) ( not ( = ?auto_7164 ?auto_7166 ) ) ( not ( = ?auto_7164 ?auto_7167 ) ) ( not ( = ?auto_7164 ?auto_7168 ) ) ( not ( = ?auto_7164 ?auto_7169 ) ) ( not ( = ?auto_7166 ?auto_7167 ) ) ( not ( = ?auto_7166 ?auto_7168 ) ) ( not ( = ?auto_7166 ?auto_7169 ) ) ( not ( = ?auto_7167 ?auto_7168 ) ) ( not ( = ?auto_7167 ?auto_7169 ) ) ( not ( = ?auto_7168 ?auto_7169 ) ) ( TRUCK-AT ?auto_7170 ?auto_7173 ) ( IN-CITY ?auto_7173 ?auto_7171 ) ( not ( = ?auto_7165 ?auto_7173 ) ) ( not ( = ?auto_7172 ?auto_7173 ) ) ( OBJ-AT ?auto_7168 ?auto_7173 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7168 ?auto_7170 ?auto_7173 )
      ( DELIVER-5PKG ?auto_7164 ?auto_7166 ?auto_7167 ?auto_7168 ?auto_7169 ?auto_7165 )
      ( DELIVER-5PKG-VERIFY ?auto_7164 ?auto_7166 ?auto_7167 ?auto_7168 ?auto_7169 ?auto_7165 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7180 - OBJ
      ?auto_7182 - OBJ
      ?auto_7183 - OBJ
      ?auto_7184 - OBJ
      ?auto_7185 - OBJ
      ?auto_7181 - LOCATION
    )
    :vars
    (
      ?auto_7188 - LOCATION
      ?auto_7189 - CITY
      ?auto_7187 - LOCATION
      ?auto_7186 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7182 ?auto_7180 ) ( GREATER-THAN ?auto_7183 ?auto_7180 ) ( GREATER-THAN ?auto_7183 ?auto_7182 ) ( GREATER-THAN ?auto_7184 ?auto_7180 ) ( GREATER-THAN ?auto_7184 ?auto_7182 ) ( GREATER-THAN ?auto_7184 ?auto_7183 ) ( GREATER-THAN ?auto_7185 ?auto_7180 ) ( GREATER-THAN ?auto_7185 ?auto_7182 ) ( GREATER-THAN ?auto_7185 ?auto_7183 ) ( GREATER-THAN ?auto_7185 ?auto_7184 ) ( IN-CITY ?auto_7188 ?auto_7189 ) ( IN-CITY ?auto_7181 ?auto_7189 ) ( not ( = ?auto_7181 ?auto_7188 ) ) ( OBJ-AT ?auto_7185 ?auto_7188 ) ( OBJ-AT ?auto_7180 ?auto_7181 ) ( OBJ-AT ?auto_7182 ?auto_7181 ) ( OBJ-AT ?auto_7183 ?auto_7181 ) ( not ( = ?auto_7180 ?auto_7182 ) ) ( not ( = ?auto_7180 ?auto_7183 ) ) ( not ( = ?auto_7180 ?auto_7184 ) ) ( not ( = ?auto_7180 ?auto_7185 ) ) ( not ( = ?auto_7182 ?auto_7183 ) ) ( not ( = ?auto_7182 ?auto_7184 ) ) ( not ( = ?auto_7182 ?auto_7185 ) ) ( not ( = ?auto_7183 ?auto_7184 ) ) ( not ( = ?auto_7183 ?auto_7185 ) ) ( not ( = ?auto_7184 ?auto_7185 ) ) ( IN-CITY ?auto_7187 ?auto_7189 ) ( not ( = ?auto_7181 ?auto_7187 ) ) ( not ( = ?auto_7188 ?auto_7187 ) ) ( OBJ-AT ?auto_7184 ?auto_7187 ) ( TRUCK-AT ?auto_7186 ?auto_7181 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7186 ?auto_7181 ?auto_7187 ?auto_7189 )
      ( DELIVER-5PKG ?auto_7180 ?auto_7182 ?auto_7183 ?auto_7184 ?auto_7185 ?auto_7181 )
      ( DELIVER-5PKG-VERIFY ?auto_7180 ?auto_7182 ?auto_7183 ?auto_7184 ?auto_7185 ?auto_7181 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7196 - OBJ
      ?auto_7198 - OBJ
      ?auto_7199 - OBJ
      ?auto_7200 - OBJ
      ?auto_7201 - OBJ
      ?auto_7197 - LOCATION
    )
    :vars
    (
      ?auto_7204 - LOCATION
      ?auto_7202 - CITY
      ?auto_7203 - LOCATION
      ?auto_7205 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7198 ?auto_7196 ) ( GREATER-THAN ?auto_7199 ?auto_7196 ) ( GREATER-THAN ?auto_7199 ?auto_7198 ) ( GREATER-THAN ?auto_7200 ?auto_7196 ) ( GREATER-THAN ?auto_7200 ?auto_7198 ) ( GREATER-THAN ?auto_7200 ?auto_7199 ) ( GREATER-THAN ?auto_7201 ?auto_7196 ) ( GREATER-THAN ?auto_7201 ?auto_7198 ) ( GREATER-THAN ?auto_7201 ?auto_7199 ) ( GREATER-THAN ?auto_7201 ?auto_7200 ) ( IN-CITY ?auto_7204 ?auto_7202 ) ( IN-CITY ?auto_7197 ?auto_7202 ) ( not ( = ?auto_7197 ?auto_7204 ) ) ( OBJ-AT ?auto_7201 ?auto_7204 ) ( OBJ-AT ?auto_7196 ?auto_7197 ) ( OBJ-AT ?auto_7198 ?auto_7197 ) ( not ( = ?auto_7196 ?auto_7198 ) ) ( not ( = ?auto_7196 ?auto_7199 ) ) ( not ( = ?auto_7196 ?auto_7200 ) ) ( not ( = ?auto_7196 ?auto_7201 ) ) ( not ( = ?auto_7198 ?auto_7199 ) ) ( not ( = ?auto_7198 ?auto_7200 ) ) ( not ( = ?auto_7198 ?auto_7201 ) ) ( not ( = ?auto_7199 ?auto_7200 ) ) ( not ( = ?auto_7199 ?auto_7201 ) ) ( not ( = ?auto_7200 ?auto_7201 ) ) ( IN-CITY ?auto_7203 ?auto_7202 ) ( not ( = ?auto_7197 ?auto_7203 ) ) ( not ( = ?auto_7204 ?auto_7203 ) ) ( OBJ-AT ?auto_7200 ?auto_7203 ) ( TRUCK-AT ?auto_7205 ?auto_7197 ) ( IN-TRUCK ?auto_7199 ?auto_7205 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7199 ?auto_7197 )
      ( DELIVER-5PKG ?auto_7196 ?auto_7198 ?auto_7199 ?auto_7200 ?auto_7201 ?auto_7197 )
      ( DELIVER-5PKG-VERIFY ?auto_7196 ?auto_7198 ?auto_7199 ?auto_7200 ?auto_7201 ?auto_7197 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7212 - OBJ
      ?auto_7214 - OBJ
      ?auto_7215 - OBJ
      ?auto_7216 - OBJ
      ?auto_7217 - OBJ
      ?auto_7213 - LOCATION
    )
    :vars
    (
      ?auto_7221 - LOCATION
      ?auto_7219 - CITY
      ?auto_7220 - LOCATION
      ?auto_7218 - TRUCK
      ?auto_7222 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7214 ?auto_7212 ) ( GREATER-THAN ?auto_7215 ?auto_7212 ) ( GREATER-THAN ?auto_7215 ?auto_7214 ) ( GREATER-THAN ?auto_7216 ?auto_7212 ) ( GREATER-THAN ?auto_7216 ?auto_7214 ) ( GREATER-THAN ?auto_7216 ?auto_7215 ) ( GREATER-THAN ?auto_7217 ?auto_7212 ) ( GREATER-THAN ?auto_7217 ?auto_7214 ) ( GREATER-THAN ?auto_7217 ?auto_7215 ) ( GREATER-THAN ?auto_7217 ?auto_7216 ) ( IN-CITY ?auto_7221 ?auto_7219 ) ( IN-CITY ?auto_7213 ?auto_7219 ) ( not ( = ?auto_7213 ?auto_7221 ) ) ( OBJ-AT ?auto_7217 ?auto_7221 ) ( OBJ-AT ?auto_7212 ?auto_7213 ) ( OBJ-AT ?auto_7214 ?auto_7213 ) ( not ( = ?auto_7212 ?auto_7214 ) ) ( not ( = ?auto_7212 ?auto_7215 ) ) ( not ( = ?auto_7212 ?auto_7216 ) ) ( not ( = ?auto_7212 ?auto_7217 ) ) ( not ( = ?auto_7214 ?auto_7215 ) ) ( not ( = ?auto_7214 ?auto_7216 ) ) ( not ( = ?auto_7214 ?auto_7217 ) ) ( not ( = ?auto_7215 ?auto_7216 ) ) ( not ( = ?auto_7215 ?auto_7217 ) ) ( not ( = ?auto_7216 ?auto_7217 ) ) ( IN-CITY ?auto_7220 ?auto_7219 ) ( not ( = ?auto_7213 ?auto_7220 ) ) ( not ( = ?auto_7221 ?auto_7220 ) ) ( OBJ-AT ?auto_7216 ?auto_7220 ) ( IN-TRUCK ?auto_7215 ?auto_7218 ) ( TRUCK-AT ?auto_7218 ?auto_7222 ) ( IN-CITY ?auto_7222 ?auto_7219 ) ( not ( = ?auto_7213 ?auto_7222 ) ) ( not ( = ?auto_7221 ?auto_7222 ) ) ( not ( = ?auto_7220 ?auto_7222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7218 ?auto_7222 ?auto_7213 ?auto_7219 )
      ( DELIVER-5PKG ?auto_7212 ?auto_7214 ?auto_7215 ?auto_7216 ?auto_7217 ?auto_7213 )
      ( DELIVER-5PKG-VERIFY ?auto_7212 ?auto_7214 ?auto_7215 ?auto_7216 ?auto_7217 ?auto_7213 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7229 - OBJ
      ?auto_7231 - OBJ
      ?auto_7232 - OBJ
      ?auto_7233 - OBJ
      ?auto_7234 - OBJ
      ?auto_7230 - LOCATION
    )
    :vars
    (
      ?auto_7237 - LOCATION
      ?auto_7235 - CITY
      ?auto_7238 - LOCATION
      ?auto_7236 - TRUCK
      ?auto_7239 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7231 ?auto_7229 ) ( GREATER-THAN ?auto_7232 ?auto_7229 ) ( GREATER-THAN ?auto_7232 ?auto_7231 ) ( GREATER-THAN ?auto_7233 ?auto_7229 ) ( GREATER-THAN ?auto_7233 ?auto_7231 ) ( GREATER-THAN ?auto_7233 ?auto_7232 ) ( GREATER-THAN ?auto_7234 ?auto_7229 ) ( GREATER-THAN ?auto_7234 ?auto_7231 ) ( GREATER-THAN ?auto_7234 ?auto_7232 ) ( GREATER-THAN ?auto_7234 ?auto_7233 ) ( IN-CITY ?auto_7237 ?auto_7235 ) ( IN-CITY ?auto_7230 ?auto_7235 ) ( not ( = ?auto_7230 ?auto_7237 ) ) ( OBJ-AT ?auto_7234 ?auto_7237 ) ( OBJ-AT ?auto_7229 ?auto_7230 ) ( OBJ-AT ?auto_7231 ?auto_7230 ) ( not ( = ?auto_7229 ?auto_7231 ) ) ( not ( = ?auto_7229 ?auto_7232 ) ) ( not ( = ?auto_7229 ?auto_7233 ) ) ( not ( = ?auto_7229 ?auto_7234 ) ) ( not ( = ?auto_7231 ?auto_7232 ) ) ( not ( = ?auto_7231 ?auto_7233 ) ) ( not ( = ?auto_7231 ?auto_7234 ) ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7234 ) ) ( IN-CITY ?auto_7238 ?auto_7235 ) ( not ( = ?auto_7230 ?auto_7238 ) ) ( not ( = ?auto_7237 ?auto_7238 ) ) ( OBJ-AT ?auto_7233 ?auto_7238 ) ( TRUCK-AT ?auto_7236 ?auto_7239 ) ( IN-CITY ?auto_7239 ?auto_7235 ) ( not ( = ?auto_7230 ?auto_7239 ) ) ( not ( = ?auto_7237 ?auto_7239 ) ) ( not ( = ?auto_7238 ?auto_7239 ) ) ( OBJ-AT ?auto_7232 ?auto_7239 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7232 ?auto_7236 ?auto_7239 )
      ( DELIVER-5PKG ?auto_7229 ?auto_7231 ?auto_7232 ?auto_7233 ?auto_7234 ?auto_7230 )
      ( DELIVER-5PKG-VERIFY ?auto_7229 ?auto_7231 ?auto_7232 ?auto_7233 ?auto_7234 ?auto_7230 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7246 - OBJ
      ?auto_7248 - OBJ
      ?auto_7249 - OBJ
      ?auto_7250 - OBJ
      ?auto_7251 - OBJ
      ?auto_7247 - LOCATION
    )
    :vars
    (
      ?auto_7254 - LOCATION
      ?auto_7252 - CITY
      ?auto_7255 - LOCATION
      ?auto_7256 - LOCATION
      ?auto_7253 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7248 ?auto_7246 ) ( GREATER-THAN ?auto_7249 ?auto_7246 ) ( GREATER-THAN ?auto_7249 ?auto_7248 ) ( GREATER-THAN ?auto_7250 ?auto_7246 ) ( GREATER-THAN ?auto_7250 ?auto_7248 ) ( GREATER-THAN ?auto_7250 ?auto_7249 ) ( GREATER-THAN ?auto_7251 ?auto_7246 ) ( GREATER-THAN ?auto_7251 ?auto_7248 ) ( GREATER-THAN ?auto_7251 ?auto_7249 ) ( GREATER-THAN ?auto_7251 ?auto_7250 ) ( IN-CITY ?auto_7254 ?auto_7252 ) ( IN-CITY ?auto_7247 ?auto_7252 ) ( not ( = ?auto_7247 ?auto_7254 ) ) ( OBJ-AT ?auto_7251 ?auto_7254 ) ( OBJ-AT ?auto_7246 ?auto_7247 ) ( OBJ-AT ?auto_7248 ?auto_7247 ) ( not ( = ?auto_7246 ?auto_7248 ) ) ( not ( = ?auto_7246 ?auto_7249 ) ) ( not ( = ?auto_7246 ?auto_7250 ) ) ( not ( = ?auto_7246 ?auto_7251 ) ) ( not ( = ?auto_7248 ?auto_7249 ) ) ( not ( = ?auto_7248 ?auto_7250 ) ) ( not ( = ?auto_7248 ?auto_7251 ) ) ( not ( = ?auto_7249 ?auto_7250 ) ) ( not ( = ?auto_7249 ?auto_7251 ) ) ( not ( = ?auto_7250 ?auto_7251 ) ) ( IN-CITY ?auto_7255 ?auto_7252 ) ( not ( = ?auto_7247 ?auto_7255 ) ) ( not ( = ?auto_7254 ?auto_7255 ) ) ( OBJ-AT ?auto_7250 ?auto_7255 ) ( IN-CITY ?auto_7256 ?auto_7252 ) ( not ( = ?auto_7247 ?auto_7256 ) ) ( not ( = ?auto_7254 ?auto_7256 ) ) ( not ( = ?auto_7255 ?auto_7256 ) ) ( OBJ-AT ?auto_7249 ?auto_7256 ) ( TRUCK-AT ?auto_7253 ?auto_7247 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7253 ?auto_7247 ?auto_7256 ?auto_7252 )
      ( DELIVER-5PKG ?auto_7246 ?auto_7248 ?auto_7249 ?auto_7250 ?auto_7251 ?auto_7247 )
      ( DELIVER-5PKG-VERIFY ?auto_7246 ?auto_7248 ?auto_7249 ?auto_7250 ?auto_7251 ?auto_7247 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7263 - OBJ
      ?auto_7265 - OBJ
      ?auto_7266 - OBJ
      ?auto_7267 - OBJ
      ?auto_7268 - OBJ
      ?auto_7264 - LOCATION
    )
    :vars
    (
      ?auto_7271 - LOCATION
      ?auto_7269 - CITY
      ?auto_7272 - LOCATION
      ?auto_7273 - LOCATION
      ?auto_7270 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7265 ?auto_7263 ) ( GREATER-THAN ?auto_7266 ?auto_7263 ) ( GREATER-THAN ?auto_7266 ?auto_7265 ) ( GREATER-THAN ?auto_7267 ?auto_7263 ) ( GREATER-THAN ?auto_7267 ?auto_7265 ) ( GREATER-THAN ?auto_7267 ?auto_7266 ) ( GREATER-THAN ?auto_7268 ?auto_7263 ) ( GREATER-THAN ?auto_7268 ?auto_7265 ) ( GREATER-THAN ?auto_7268 ?auto_7266 ) ( GREATER-THAN ?auto_7268 ?auto_7267 ) ( IN-CITY ?auto_7271 ?auto_7269 ) ( IN-CITY ?auto_7264 ?auto_7269 ) ( not ( = ?auto_7264 ?auto_7271 ) ) ( OBJ-AT ?auto_7268 ?auto_7271 ) ( OBJ-AT ?auto_7263 ?auto_7264 ) ( not ( = ?auto_7263 ?auto_7265 ) ) ( not ( = ?auto_7263 ?auto_7266 ) ) ( not ( = ?auto_7263 ?auto_7267 ) ) ( not ( = ?auto_7263 ?auto_7268 ) ) ( not ( = ?auto_7265 ?auto_7266 ) ) ( not ( = ?auto_7265 ?auto_7267 ) ) ( not ( = ?auto_7265 ?auto_7268 ) ) ( not ( = ?auto_7266 ?auto_7267 ) ) ( not ( = ?auto_7266 ?auto_7268 ) ) ( not ( = ?auto_7267 ?auto_7268 ) ) ( IN-CITY ?auto_7272 ?auto_7269 ) ( not ( = ?auto_7264 ?auto_7272 ) ) ( not ( = ?auto_7271 ?auto_7272 ) ) ( OBJ-AT ?auto_7267 ?auto_7272 ) ( IN-CITY ?auto_7273 ?auto_7269 ) ( not ( = ?auto_7264 ?auto_7273 ) ) ( not ( = ?auto_7271 ?auto_7273 ) ) ( not ( = ?auto_7272 ?auto_7273 ) ) ( OBJ-AT ?auto_7266 ?auto_7273 ) ( TRUCK-AT ?auto_7270 ?auto_7264 ) ( IN-TRUCK ?auto_7265 ?auto_7270 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7265 ?auto_7264 )
      ( DELIVER-5PKG ?auto_7263 ?auto_7265 ?auto_7266 ?auto_7267 ?auto_7268 ?auto_7264 )
      ( DELIVER-5PKG-VERIFY ?auto_7263 ?auto_7265 ?auto_7266 ?auto_7267 ?auto_7268 ?auto_7264 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7280 - OBJ
      ?auto_7282 - OBJ
      ?auto_7283 - OBJ
      ?auto_7284 - OBJ
      ?auto_7285 - OBJ
      ?auto_7281 - LOCATION
    )
    :vars
    (
      ?auto_7288 - LOCATION
      ?auto_7290 - CITY
      ?auto_7289 - LOCATION
      ?auto_7286 - LOCATION
      ?auto_7287 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7282 ?auto_7280 ) ( GREATER-THAN ?auto_7283 ?auto_7280 ) ( GREATER-THAN ?auto_7283 ?auto_7282 ) ( GREATER-THAN ?auto_7284 ?auto_7280 ) ( GREATER-THAN ?auto_7284 ?auto_7282 ) ( GREATER-THAN ?auto_7284 ?auto_7283 ) ( GREATER-THAN ?auto_7285 ?auto_7280 ) ( GREATER-THAN ?auto_7285 ?auto_7282 ) ( GREATER-THAN ?auto_7285 ?auto_7283 ) ( GREATER-THAN ?auto_7285 ?auto_7284 ) ( IN-CITY ?auto_7288 ?auto_7290 ) ( IN-CITY ?auto_7281 ?auto_7290 ) ( not ( = ?auto_7281 ?auto_7288 ) ) ( OBJ-AT ?auto_7285 ?auto_7288 ) ( OBJ-AT ?auto_7280 ?auto_7281 ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7283 ) ) ( not ( = ?auto_7280 ?auto_7284 ) ) ( not ( = ?auto_7280 ?auto_7285 ) ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7284 ) ) ( not ( = ?auto_7282 ?auto_7285 ) ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( not ( = ?auto_7283 ?auto_7285 ) ) ( not ( = ?auto_7284 ?auto_7285 ) ) ( IN-CITY ?auto_7289 ?auto_7290 ) ( not ( = ?auto_7281 ?auto_7289 ) ) ( not ( = ?auto_7288 ?auto_7289 ) ) ( OBJ-AT ?auto_7284 ?auto_7289 ) ( IN-CITY ?auto_7286 ?auto_7290 ) ( not ( = ?auto_7281 ?auto_7286 ) ) ( not ( = ?auto_7288 ?auto_7286 ) ) ( not ( = ?auto_7289 ?auto_7286 ) ) ( OBJ-AT ?auto_7283 ?auto_7286 ) ( IN-TRUCK ?auto_7282 ?auto_7287 ) ( TRUCK-AT ?auto_7287 ?auto_7288 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7287 ?auto_7288 ?auto_7281 ?auto_7290 )
      ( DELIVER-5PKG ?auto_7280 ?auto_7282 ?auto_7283 ?auto_7284 ?auto_7285 ?auto_7281 )
      ( DELIVER-5PKG-VERIFY ?auto_7280 ?auto_7282 ?auto_7283 ?auto_7284 ?auto_7285 ?auto_7281 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7297 - OBJ
      ?auto_7299 - OBJ
      ?auto_7300 - OBJ
      ?auto_7301 - OBJ
      ?auto_7302 - OBJ
      ?auto_7298 - LOCATION
    )
    :vars
    (
      ?auto_7305 - LOCATION
      ?auto_7303 - CITY
      ?auto_7304 - LOCATION
      ?auto_7307 - LOCATION
      ?auto_7306 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7299 ?auto_7297 ) ( GREATER-THAN ?auto_7300 ?auto_7297 ) ( GREATER-THAN ?auto_7300 ?auto_7299 ) ( GREATER-THAN ?auto_7301 ?auto_7297 ) ( GREATER-THAN ?auto_7301 ?auto_7299 ) ( GREATER-THAN ?auto_7301 ?auto_7300 ) ( GREATER-THAN ?auto_7302 ?auto_7297 ) ( GREATER-THAN ?auto_7302 ?auto_7299 ) ( GREATER-THAN ?auto_7302 ?auto_7300 ) ( GREATER-THAN ?auto_7302 ?auto_7301 ) ( IN-CITY ?auto_7305 ?auto_7303 ) ( IN-CITY ?auto_7298 ?auto_7303 ) ( not ( = ?auto_7298 ?auto_7305 ) ) ( OBJ-AT ?auto_7302 ?auto_7305 ) ( OBJ-AT ?auto_7297 ?auto_7298 ) ( not ( = ?auto_7297 ?auto_7299 ) ) ( not ( = ?auto_7297 ?auto_7300 ) ) ( not ( = ?auto_7297 ?auto_7301 ) ) ( not ( = ?auto_7297 ?auto_7302 ) ) ( not ( = ?auto_7299 ?auto_7300 ) ) ( not ( = ?auto_7299 ?auto_7301 ) ) ( not ( = ?auto_7299 ?auto_7302 ) ) ( not ( = ?auto_7300 ?auto_7301 ) ) ( not ( = ?auto_7300 ?auto_7302 ) ) ( not ( = ?auto_7301 ?auto_7302 ) ) ( IN-CITY ?auto_7304 ?auto_7303 ) ( not ( = ?auto_7298 ?auto_7304 ) ) ( not ( = ?auto_7305 ?auto_7304 ) ) ( OBJ-AT ?auto_7301 ?auto_7304 ) ( IN-CITY ?auto_7307 ?auto_7303 ) ( not ( = ?auto_7298 ?auto_7307 ) ) ( not ( = ?auto_7305 ?auto_7307 ) ) ( not ( = ?auto_7304 ?auto_7307 ) ) ( OBJ-AT ?auto_7300 ?auto_7307 ) ( TRUCK-AT ?auto_7306 ?auto_7305 ) ( OBJ-AT ?auto_7299 ?auto_7305 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7299 ?auto_7306 ?auto_7305 )
      ( DELIVER-5PKG ?auto_7297 ?auto_7299 ?auto_7300 ?auto_7301 ?auto_7302 ?auto_7298 )
      ( DELIVER-5PKG-VERIFY ?auto_7297 ?auto_7299 ?auto_7300 ?auto_7301 ?auto_7302 ?auto_7298 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7314 - OBJ
      ?auto_7316 - OBJ
      ?auto_7317 - OBJ
      ?auto_7318 - OBJ
      ?auto_7319 - OBJ
      ?auto_7315 - LOCATION
    )
    :vars
    (
      ?auto_7322 - LOCATION
      ?auto_7320 - CITY
      ?auto_7321 - LOCATION
      ?auto_7324 - LOCATION
      ?auto_7323 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7316 ?auto_7314 ) ( GREATER-THAN ?auto_7317 ?auto_7314 ) ( GREATER-THAN ?auto_7317 ?auto_7316 ) ( GREATER-THAN ?auto_7318 ?auto_7314 ) ( GREATER-THAN ?auto_7318 ?auto_7316 ) ( GREATER-THAN ?auto_7318 ?auto_7317 ) ( GREATER-THAN ?auto_7319 ?auto_7314 ) ( GREATER-THAN ?auto_7319 ?auto_7316 ) ( GREATER-THAN ?auto_7319 ?auto_7317 ) ( GREATER-THAN ?auto_7319 ?auto_7318 ) ( IN-CITY ?auto_7322 ?auto_7320 ) ( IN-CITY ?auto_7315 ?auto_7320 ) ( not ( = ?auto_7315 ?auto_7322 ) ) ( OBJ-AT ?auto_7319 ?auto_7322 ) ( OBJ-AT ?auto_7314 ?auto_7315 ) ( not ( = ?auto_7314 ?auto_7316 ) ) ( not ( = ?auto_7314 ?auto_7317 ) ) ( not ( = ?auto_7314 ?auto_7318 ) ) ( not ( = ?auto_7314 ?auto_7319 ) ) ( not ( = ?auto_7316 ?auto_7317 ) ) ( not ( = ?auto_7316 ?auto_7318 ) ) ( not ( = ?auto_7316 ?auto_7319 ) ) ( not ( = ?auto_7317 ?auto_7318 ) ) ( not ( = ?auto_7317 ?auto_7319 ) ) ( not ( = ?auto_7318 ?auto_7319 ) ) ( IN-CITY ?auto_7321 ?auto_7320 ) ( not ( = ?auto_7315 ?auto_7321 ) ) ( not ( = ?auto_7322 ?auto_7321 ) ) ( OBJ-AT ?auto_7318 ?auto_7321 ) ( IN-CITY ?auto_7324 ?auto_7320 ) ( not ( = ?auto_7315 ?auto_7324 ) ) ( not ( = ?auto_7322 ?auto_7324 ) ) ( not ( = ?auto_7321 ?auto_7324 ) ) ( OBJ-AT ?auto_7317 ?auto_7324 ) ( OBJ-AT ?auto_7316 ?auto_7322 ) ( TRUCK-AT ?auto_7323 ?auto_7315 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7323 ?auto_7315 ?auto_7322 ?auto_7320 )
      ( DELIVER-5PKG ?auto_7314 ?auto_7316 ?auto_7317 ?auto_7318 ?auto_7319 ?auto_7315 )
      ( DELIVER-5PKG-VERIFY ?auto_7314 ?auto_7316 ?auto_7317 ?auto_7318 ?auto_7319 ?auto_7315 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7331 - OBJ
      ?auto_7333 - OBJ
      ?auto_7334 - OBJ
      ?auto_7335 - OBJ
      ?auto_7336 - OBJ
      ?auto_7332 - LOCATION
    )
    :vars
    (
      ?auto_7341 - LOCATION
      ?auto_7338 - CITY
      ?auto_7337 - LOCATION
      ?auto_7339 - LOCATION
      ?auto_7340 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7333 ?auto_7331 ) ( GREATER-THAN ?auto_7334 ?auto_7331 ) ( GREATER-THAN ?auto_7334 ?auto_7333 ) ( GREATER-THAN ?auto_7335 ?auto_7331 ) ( GREATER-THAN ?auto_7335 ?auto_7333 ) ( GREATER-THAN ?auto_7335 ?auto_7334 ) ( GREATER-THAN ?auto_7336 ?auto_7331 ) ( GREATER-THAN ?auto_7336 ?auto_7333 ) ( GREATER-THAN ?auto_7336 ?auto_7334 ) ( GREATER-THAN ?auto_7336 ?auto_7335 ) ( IN-CITY ?auto_7341 ?auto_7338 ) ( IN-CITY ?auto_7332 ?auto_7338 ) ( not ( = ?auto_7332 ?auto_7341 ) ) ( OBJ-AT ?auto_7336 ?auto_7341 ) ( not ( = ?auto_7331 ?auto_7333 ) ) ( not ( = ?auto_7331 ?auto_7334 ) ) ( not ( = ?auto_7331 ?auto_7335 ) ) ( not ( = ?auto_7331 ?auto_7336 ) ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( IN-CITY ?auto_7337 ?auto_7338 ) ( not ( = ?auto_7332 ?auto_7337 ) ) ( not ( = ?auto_7341 ?auto_7337 ) ) ( OBJ-AT ?auto_7335 ?auto_7337 ) ( IN-CITY ?auto_7339 ?auto_7338 ) ( not ( = ?auto_7332 ?auto_7339 ) ) ( not ( = ?auto_7341 ?auto_7339 ) ) ( not ( = ?auto_7337 ?auto_7339 ) ) ( OBJ-AT ?auto_7334 ?auto_7339 ) ( OBJ-AT ?auto_7333 ?auto_7341 ) ( TRUCK-AT ?auto_7340 ?auto_7332 ) ( IN-TRUCK ?auto_7331 ?auto_7340 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7331 ?auto_7332 )
      ( DELIVER-5PKG ?auto_7331 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7332 )
      ( DELIVER-5PKG-VERIFY ?auto_7331 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7332 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7348 - OBJ
      ?auto_7350 - OBJ
      ?auto_7351 - OBJ
      ?auto_7352 - OBJ
      ?auto_7353 - OBJ
      ?auto_7349 - LOCATION
    )
    :vars
    (
      ?auto_7357 - LOCATION
      ?auto_7355 - CITY
      ?auto_7356 - LOCATION
      ?auto_7354 - LOCATION
      ?auto_7358 - TRUCK
      ?auto_7359 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7350 ?auto_7348 ) ( GREATER-THAN ?auto_7351 ?auto_7348 ) ( GREATER-THAN ?auto_7351 ?auto_7350 ) ( GREATER-THAN ?auto_7352 ?auto_7348 ) ( GREATER-THAN ?auto_7352 ?auto_7350 ) ( GREATER-THAN ?auto_7352 ?auto_7351 ) ( GREATER-THAN ?auto_7353 ?auto_7348 ) ( GREATER-THAN ?auto_7353 ?auto_7350 ) ( GREATER-THAN ?auto_7353 ?auto_7351 ) ( GREATER-THAN ?auto_7353 ?auto_7352 ) ( IN-CITY ?auto_7357 ?auto_7355 ) ( IN-CITY ?auto_7349 ?auto_7355 ) ( not ( = ?auto_7349 ?auto_7357 ) ) ( OBJ-AT ?auto_7353 ?auto_7357 ) ( not ( = ?auto_7348 ?auto_7350 ) ) ( not ( = ?auto_7348 ?auto_7351 ) ) ( not ( = ?auto_7348 ?auto_7352 ) ) ( not ( = ?auto_7348 ?auto_7353 ) ) ( not ( = ?auto_7350 ?auto_7351 ) ) ( not ( = ?auto_7350 ?auto_7352 ) ) ( not ( = ?auto_7350 ?auto_7353 ) ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( not ( = ?auto_7351 ?auto_7353 ) ) ( not ( = ?auto_7352 ?auto_7353 ) ) ( IN-CITY ?auto_7356 ?auto_7355 ) ( not ( = ?auto_7349 ?auto_7356 ) ) ( not ( = ?auto_7357 ?auto_7356 ) ) ( OBJ-AT ?auto_7352 ?auto_7356 ) ( IN-CITY ?auto_7354 ?auto_7355 ) ( not ( = ?auto_7349 ?auto_7354 ) ) ( not ( = ?auto_7357 ?auto_7354 ) ) ( not ( = ?auto_7356 ?auto_7354 ) ) ( OBJ-AT ?auto_7351 ?auto_7354 ) ( OBJ-AT ?auto_7350 ?auto_7357 ) ( IN-TRUCK ?auto_7348 ?auto_7358 ) ( TRUCK-AT ?auto_7358 ?auto_7359 ) ( IN-CITY ?auto_7359 ?auto_7355 ) ( not ( = ?auto_7349 ?auto_7359 ) ) ( not ( = ?auto_7357 ?auto_7359 ) ) ( not ( = ?auto_7356 ?auto_7359 ) ) ( not ( = ?auto_7354 ?auto_7359 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7358 ?auto_7359 ?auto_7349 ?auto_7355 )
      ( DELIVER-5PKG ?auto_7348 ?auto_7350 ?auto_7351 ?auto_7352 ?auto_7353 ?auto_7349 )
      ( DELIVER-5PKG-VERIFY ?auto_7348 ?auto_7350 ?auto_7351 ?auto_7352 ?auto_7353 ?auto_7349 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7366 - OBJ
      ?auto_7368 - OBJ
      ?auto_7369 - OBJ
      ?auto_7370 - OBJ
      ?auto_7371 - OBJ
      ?auto_7367 - LOCATION
    )
    :vars
    (
      ?auto_7372 - LOCATION
      ?auto_7376 - CITY
      ?auto_7373 - LOCATION
      ?auto_7375 - LOCATION
      ?auto_7377 - TRUCK
      ?auto_7374 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7368 ?auto_7366 ) ( GREATER-THAN ?auto_7369 ?auto_7366 ) ( GREATER-THAN ?auto_7369 ?auto_7368 ) ( GREATER-THAN ?auto_7370 ?auto_7366 ) ( GREATER-THAN ?auto_7370 ?auto_7368 ) ( GREATER-THAN ?auto_7370 ?auto_7369 ) ( GREATER-THAN ?auto_7371 ?auto_7366 ) ( GREATER-THAN ?auto_7371 ?auto_7368 ) ( GREATER-THAN ?auto_7371 ?auto_7369 ) ( GREATER-THAN ?auto_7371 ?auto_7370 ) ( IN-CITY ?auto_7372 ?auto_7376 ) ( IN-CITY ?auto_7367 ?auto_7376 ) ( not ( = ?auto_7367 ?auto_7372 ) ) ( OBJ-AT ?auto_7371 ?auto_7372 ) ( not ( = ?auto_7366 ?auto_7368 ) ) ( not ( = ?auto_7366 ?auto_7369 ) ) ( not ( = ?auto_7366 ?auto_7370 ) ) ( not ( = ?auto_7366 ?auto_7371 ) ) ( not ( = ?auto_7368 ?auto_7369 ) ) ( not ( = ?auto_7368 ?auto_7370 ) ) ( not ( = ?auto_7368 ?auto_7371 ) ) ( not ( = ?auto_7369 ?auto_7370 ) ) ( not ( = ?auto_7369 ?auto_7371 ) ) ( not ( = ?auto_7370 ?auto_7371 ) ) ( IN-CITY ?auto_7373 ?auto_7376 ) ( not ( = ?auto_7367 ?auto_7373 ) ) ( not ( = ?auto_7372 ?auto_7373 ) ) ( OBJ-AT ?auto_7370 ?auto_7373 ) ( IN-CITY ?auto_7375 ?auto_7376 ) ( not ( = ?auto_7367 ?auto_7375 ) ) ( not ( = ?auto_7372 ?auto_7375 ) ) ( not ( = ?auto_7373 ?auto_7375 ) ) ( OBJ-AT ?auto_7369 ?auto_7375 ) ( OBJ-AT ?auto_7368 ?auto_7372 ) ( TRUCK-AT ?auto_7377 ?auto_7374 ) ( IN-CITY ?auto_7374 ?auto_7376 ) ( not ( = ?auto_7367 ?auto_7374 ) ) ( not ( = ?auto_7372 ?auto_7374 ) ) ( not ( = ?auto_7373 ?auto_7374 ) ) ( not ( = ?auto_7375 ?auto_7374 ) ) ( OBJ-AT ?auto_7366 ?auto_7374 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7366 ?auto_7377 ?auto_7374 )
      ( DELIVER-5PKG ?auto_7366 ?auto_7368 ?auto_7369 ?auto_7370 ?auto_7371 ?auto_7367 )
      ( DELIVER-5PKG-VERIFY ?auto_7366 ?auto_7368 ?auto_7369 ?auto_7370 ?auto_7371 ?auto_7367 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7384 - OBJ
      ?auto_7386 - OBJ
      ?auto_7387 - OBJ
      ?auto_7388 - OBJ
      ?auto_7389 - OBJ
      ?auto_7385 - LOCATION
    )
    :vars
    (
      ?auto_7395 - LOCATION
      ?auto_7390 - CITY
      ?auto_7394 - LOCATION
      ?auto_7393 - LOCATION
      ?auto_7391 - LOCATION
      ?auto_7392 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7386 ?auto_7384 ) ( GREATER-THAN ?auto_7387 ?auto_7384 ) ( GREATER-THAN ?auto_7387 ?auto_7386 ) ( GREATER-THAN ?auto_7388 ?auto_7384 ) ( GREATER-THAN ?auto_7388 ?auto_7386 ) ( GREATER-THAN ?auto_7388 ?auto_7387 ) ( GREATER-THAN ?auto_7389 ?auto_7384 ) ( GREATER-THAN ?auto_7389 ?auto_7386 ) ( GREATER-THAN ?auto_7389 ?auto_7387 ) ( GREATER-THAN ?auto_7389 ?auto_7388 ) ( IN-CITY ?auto_7395 ?auto_7390 ) ( IN-CITY ?auto_7385 ?auto_7390 ) ( not ( = ?auto_7385 ?auto_7395 ) ) ( OBJ-AT ?auto_7389 ?auto_7395 ) ( not ( = ?auto_7384 ?auto_7386 ) ) ( not ( = ?auto_7384 ?auto_7387 ) ) ( not ( = ?auto_7384 ?auto_7388 ) ) ( not ( = ?auto_7384 ?auto_7389 ) ) ( not ( = ?auto_7386 ?auto_7387 ) ) ( not ( = ?auto_7386 ?auto_7388 ) ) ( not ( = ?auto_7386 ?auto_7389 ) ) ( not ( = ?auto_7387 ?auto_7388 ) ) ( not ( = ?auto_7387 ?auto_7389 ) ) ( not ( = ?auto_7388 ?auto_7389 ) ) ( IN-CITY ?auto_7394 ?auto_7390 ) ( not ( = ?auto_7385 ?auto_7394 ) ) ( not ( = ?auto_7395 ?auto_7394 ) ) ( OBJ-AT ?auto_7388 ?auto_7394 ) ( IN-CITY ?auto_7393 ?auto_7390 ) ( not ( = ?auto_7385 ?auto_7393 ) ) ( not ( = ?auto_7395 ?auto_7393 ) ) ( not ( = ?auto_7394 ?auto_7393 ) ) ( OBJ-AT ?auto_7387 ?auto_7393 ) ( OBJ-AT ?auto_7386 ?auto_7395 ) ( IN-CITY ?auto_7391 ?auto_7390 ) ( not ( = ?auto_7385 ?auto_7391 ) ) ( not ( = ?auto_7395 ?auto_7391 ) ) ( not ( = ?auto_7394 ?auto_7391 ) ) ( not ( = ?auto_7393 ?auto_7391 ) ) ( OBJ-AT ?auto_7384 ?auto_7391 ) ( TRUCK-AT ?auto_7392 ?auto_7385 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7392 ?auto_7385 ?auto_7391 ?auto_7390 )
      ( DELIVER-5PKG ?auto_7384 ?auto_7386 ?auto_7387 ?auto_7388 ?auto_7389 ?auto_7385 )
      ( DELIVER-5PKG-VERIFY ?auto_7384 ?auto_7386 ?auto_7387 ?auto_7388 ?auto_7389 ?auto_7385 ) )
  )

)

