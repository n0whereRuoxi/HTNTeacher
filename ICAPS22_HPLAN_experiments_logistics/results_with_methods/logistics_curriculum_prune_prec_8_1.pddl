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

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-8PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?obj8 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) ( OBJ-AT ?obj8 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2611 - OBJ
      ?auto_2612 - LOCATION
    )
    :vars
    (
      ?auto_2614 - LOCATION
      ?auto_2615 - CITY
      ?auto_2613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2614 ?auto_2615 ) ( IN-CITY ?auto_2612 ?auto_2615 ) ( not ( = ?auto_2612 ?auto_2614 ) ) ( OBJ-AT ?auto_2611 ?auto_2614 ) ( TRUCK-AT ?auto_2613 ?auto_2612 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2613 ?auto_2612 ?auto_2614 ?auto_2615 )
      ( !LOAD-TRUCK ?auto_2611 ?auto_2613 ?auto_2614 )
      ( !DRIVE-TRUCK ?auto_2613 ?auto_2614 ?auto_2612 ?auto_2615 )
      ( !UNLOAD-TRUCK ?auto_2611 ?auto_2613 ?auto_2612 )
      ( DELIVER-1PKG-VERIFY ?auto_2611 ?auto_2612 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2626 - OBJ
      ?auto_2628 - OBJ
      ?auto_2627 - LOCATION
    )
    :vars
    (
      ?auto_2629 - LOCATION
      ?auto_2631 - CITY
      ?auto_2632 - LOCATION
      ?auto_2630 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2628 ?auto_2626 ) ( IN-CITY ?auto_2629 ?auto_2631 ) ( IN-CITY ?auto_2627 ?auto_2631 ) ( not ( = ?auto_2627 ?auto_2629 ) ) ( OBJ-AT ?auto_2628 ?auto_2629 ) ( IN-CITY ?auto_2632 ?auto_2631 ) ( not ( = ?auto_2627 ?auto_2632 ) ) ( OBJ-AT ?auto_2626 ?auto_2632 ) ( TRUCK-AT ?auto_2630 ?auto_2627 ) ( not ( = ?auto_2626 ?auto_2628 ) ) ( not ( = ?auto_2629 ?auto_2632 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2626 ?auto_2627 )
      ( DELIVER-1PKG ?auto_2628 ?auto_2627 )
      ( DELIVER-2PKG-VERIFY ?auto_2626 ?auto_2628 ?auto_2627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2644 - OBJ
      ?auto_2646 - OBJ
      ?auto_2647 - OBJ
      ?auto_2645 - LOCATION
    )
    :vars
    (
      ?auto_2648 - LOCATION
      ?auto_2649 - CITY
      ?auto_2651 - LOCATION
      ?auto_2652 - LOCATION
      ?auto_2650 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2646 ?auto_2644 ) ( GREATER-THAN ?auto_2647 ?auto_2644 ) ( GREATER-THAN ?auto_2647 ?auto_2646 ) ( IN-CITY ?auto_2648 ?auto_2649 ) ( IN-CITY ?auto_2645 ?auto_2649 ) ( not ( = ?auto_2645 ?auto_2648 ) ) ( OBJ-AT ?auto_2647 ?auto_2648 ) ( IN-CITY ?auto_2651 ?auto_2649 ) ( not ( = ?auto_2645 ?auto_2651 ) ) ( OBJ-AT ?auto_2646 ?auto_2651 ) ( IN-CITY ?auto_2652 ?auto_2649 ) ( not ( = ?auto_2645 ?auto_2652 ) ) ( OBJ-AT ?auto_2644 ?auto_2652 ) ( TRUCK-AT ?auto_2650 ?auto_2645 ) ( not ( = ?auto_2644 ?auto_2646 ) ) ( not ( = ?auto_2651 ?auto_2652 ) ) ( not ( = ?auto_2644 ?auto_2647 ) ) ( not ( = ?auto_2646 ?auto_2647 ) ) ( not ( = ?auto_2648 ?auto_2651 ) ) ( not ( = ?auto_2648 ?auto_2652 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2644 ?auto_2646 ?auto_2645 )
      ( DELIVER-1PKG ?auto_2647 ?auto_2645 )
      ( DELIVER-3PKG-VERIFY ?auto_2644 ?auto_2646 ?auto_2647 ?auto_2645 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2665 - OBJ
      ?auto_2667 - OBJ
      ?auto_2668 - OBJ
      ?auto_2669 - OBJ
      ?auto_2666 - LOCATION
    )
    :vars
    (
      ?auto_2672 - LOCATION
      ?auto_2671 - CITY
      ?auto_2674 - LOCATION
      ?auto_2675 - LOCATION
      ?auto_2673 - LOCATION
      ?auto_2670 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2667 ?auto_2665 ) ( GREATER-THAN ?auto_2668 ?auto_2665 ) ( GREATER-THAN ?auto_2668 ?auto_2667 ) ( GREATER-THAN ?auto_2669 ?auto_2665 ) ( GREATER-THAN ?auto_2669 ?auto_2667 ) ( GREATER-THAN ?auto_2669 ?auto_2668 ) ( IN-CITY ?auto_2672 ?auto_2671 ) ( IN-CITY ?auto_2666 ?auto_2671 ) ( not ( = ?auto_2666 ?auto_2672 ) ) ( OBJ-AT ?auto_2669 ?auto_2672 ) ( IN-CITY ?auto_2674 ?auto_2671 ) ( not ( = ?auto_2666 ?auto_2674 ) ) ( OBJ-AT ?auto_2668 ?auto_2674 ) ( IN-CITY ?auto_2675 ?auto_2671 ) ( not ( = ?auto_2666 ?auto_2675 ) ) ( OBJ-AT ?auto_2667 ?auto_2675 ) ( IN-CITY ?auto_2673 ?auto_2671 ) ( not ( = ?auto_2666 ?auto_2673 ) ) ( OBJ-AT ?auto_2665 ?auto_2673 ) ( TRUCK-AT ?auto_2670 ?auto_2666 ) ( not ( = ?auto_2665 ?auto_2667 ) ) ( not ( = ?auto_2675 ?auto_2673 ) ) ( not ( = ?auto_2665 ?auto_2668 ) ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( not ( = ?auto_2674 ?auto_2675 ) ) ( not ( = ?auto_2674 ?auto_2673 ) ) ( not ( = ?auto_2665 ?auto_2669 ) ) ( not ( = ?auto_2667 ?auto_2669 ) ) ( not ( = ?auto_2668 ?auto_2669 ) ) ( not ( = ?auto_2672 ?auto_2674 ) ) ( not ( = ?auto_2672 ?auto_2675 ) ) ( not ( = ?auto_2672 ?auto_2673 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2665 ?auto_2667 ?auto_2668 ?auto_2666 )
      ( DELIVER-1PKG ?auto_2669 ?auto_2666 )
      ( DELIVER-4PKG-VERIFY ?auto_2665 ?auto_2667 ?auto_2668 ?auto_2669 ?auto_2666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2689 - OBJ
      ?auto_2691 - OBJ
      ?auto_2692 - OBJ
      ?auto_2693 - OBJ
      ?auto_2694 - OBJ
      ?auto_2690 - LOCATION
    )
    :vars
    (
      ?auto_2695 - LOCATION
      ?auto_2697 - CITY
      ?auto_2698 - LOCATION
      ?auto_2699 - LOCATION
      ?auto_2700 - LOCATION
      ?auto_2696 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2691 ?auto_2689 ) ( GREATER-THAN ?auto_2692 ?auto_2689 ) ( GREATER-THAN ?auto_2692 ?auto_2691 ) ( GREATER-THAN ?auto_2693 ?auto_2689 ) ( GREATER-THAN ?auto_2693 ?auto_2691 ) ( GREATER-THAN ?auto_2693 ?auto_2692 ) ( GREATER-THAN ?auto_2694 ?auto_2689 ) ( GREATER-THAN ?auto_2694 ?auto_2691 ) ( GREATER-THAN ?auto_2694 ?auto_2692 ) ( GREATER-THAN ?auto_2694 ?auto_2693 ) ( IN-CITY ?auto_2695 ?auto_2697 ) ( IN-CITY ?auto_2690 ?auto_2697 ) ( not ( = ?auto_2690 ?auto_2695 ) ) ( OBJ-AT ?auto_2694 ?auto_2695 ) ( IN-CITY ?auto_2698 ?auto_2697 ) ( not ( = ?auto_2690 ?auto_2698 ) ) ( OBJ-AT ?auto_2693 ?auto_2698 ) ( IN-CITY ?auto_2699 ?auto_2697 ) ( not ( = ?auto_2690 ?auto_2699 ) ) ( OBJ-AT ?auto_2692 ?auto_2699 ) ( IN-CITY ?auto_2700 ?auto_2697 ) ( not ( = ?auto_2690 ?auto_2700 ) ) ( OBJ-AT ?auto_2691 ?auto_2700 ) ( OBJ-AT ?auto_2689 ?auto_2695 ) ( TRUCK-AT ?auto_2696 ?auto_2690 ) ( not ( = ?auto_2689 ?auto_2691 ) ) ( not ( = ?auto_2700 ?auto_2695 ) ) ( not ( = ?auto_2689 ?auto_2692 ) ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2699 ?auto_2700 ) ) ( not ( = ?auto_2699 ?auto_2695 ) ) ( not ( = ?auto_2689 ?auto_2693 ) ) ( not ( = ?auto_2691 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( not ( = ?auto_2698 ?auto_2699 ) ) ( not ( = ?auto_2698 ?auto_2700 ) ) ( not ( = ?auto_2698 ?auto_2695 ) ) ( not ( = ?auto_2689 ?auto_2694 ) ) ( not ( = ?auto_2691 ?auto_2694 ) ) ( not ( = ?auto_2692 ?auto_2694 ) ) ( not ( = ?auto_2693 ?auto_2694 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2689 ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2690 )
      ( DELIVER-1PKG ?auto_2694 ?auto_2690 )
      ( DELIVER-5PKG-VERIFY ?auto_2689 ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2694 ?auto_2690 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2715 - OBJ
      ?auto_2717 - OBJ
      ?auto_2718 - OBJ
      ?auto_2719 - OBJ
      ?auto_2720 - OBJ
      ?auto_2721 - OBJ
      ?auto_2716 - LOCATION
    )
    :vars
    (
      ?auto_2724 - LOCATION
      ?auto_2723 - CITY
      ?auto_2727 - LOCATION
      ?auto_2726 - LOCATION
      ?auto_2725 - LOCATION
      ?auto_2722 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2717 ?auto_2715 ) ( GREATER-THAN ?auto_2718 ?auto_2715 ) ( GREATER-THAN ?auto_2718 ?auto_2717 ) ( GREATER-THAN ?auto_2719 ?auto_2715 ) ( GREATER-THAN ?auto_2719 ?auto_2717 ) ( GREATER-THAN ?auto_2719 ?auto_2718 ) ( GREATER-THAN ?auto_2720 ?auto_2715 ) ( GREATER-THAN ?auto_2720 ?auto_2717 ) ( GREATER-THAN ?auto_2720 ?auto_2718 ) ( GREATER-THAN ?auto_2720 ?auto_2719 ) ( GREATER-THAN ?auto_2721 ?auto_2715 ) ( GREATER-THAN ?auto_2721 ?auto_2717 ) ( GREATER-THAN ?auto_2721 ?auto_2718 ) ( GREATER-THAN ?auto_2721 ?auto_2719 ) ( GREATER-THAN ?auto_2721 ?auto_2720 ) ( IN-CITY ?auto_2724 ?auto_2723 ) ( IN-CITY ?auto_2716 ?auto_2723 ) ( not ( = ?auto_2716 ?auto_2724 ) ) ( OBJ-AT ?auto_2721 ?auto_2724 ) ( IN-CITY ?auto_2727 ?auto_2723 ) ( not ( = ?auto_2716 ?auto_2727 ) ) ( OBJ-AT ?auto_2720 ?auto_2727 ) ( IN-CITY ?auto_2726 ?auto_2723 ) ( not ( = ?auto_2716 ?auto_2726 ) ) ( OBJ-AT ?auto_2719 ?auto_2726 ) ( IN-CITY ?auto_2725 ?auto_2723 ) ( not ( = ?auto_2716 ?auto_2725 ) ) ( OBJ-AT ?auto_2718 ?auto_2725 ) ( OBJ-AT ?auto_2717 ?auto_2724 ) ( OBJ-AT ?auto_2715 ?auto_2727 ) ( TRUCK-AT ?auto_2722 ?auto_2716 ) ( not ( = ?auto_2715 ?auto_2717 ) ) ( not ( = ?auto_2724 ?auto_2727 ) ) ( not ( = ?auto_2715 ?auto_2718 ) ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( not ( = ?auto_2725 ?auto_2724 ) ) ( not ( = ?auto_2725 ?auto_2727 ) ) ( not ( = ?auto_2715 ?auto_2719 ) ) ( not ( = ?auto_2717 ?auto_2719 ) ) ( not ( = ?auto_2718 ?auto_2719 ) ) ( not ( = ?auto_2726 ?auto_2725 ) ) ( not ( = ?auto_2726 ?auto_2724 ) ) ( not ( = ?auto_2726 ?auto_2727 ) ) ( not ( = ?auto_2715 ?auto_2720 ) ) ( not ( = ?auto_2717 ?auto_2720 ) ) ( not ( = ?auto_2718 ?auto_2720 ) ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( not ( = ?auto_2715 ?auto_2721 ) ) ( not ( = ?auto_2717 ?auto_2721 ) ) ( not ( = ?auto_2718 ?auto_2721 ) ) ( not ( = ?auto_2719 ?auto_2721 ) ) ( not ( = ?auto_2720 ?auto_2721 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2715 ?auto_2717 ?auto_2718 ?auto_2719 ?auto_2720 ?auto_2716 )
      ( DELIVER-1PKG ?auto_2721 ?auto_2716 )
      ( DELIVER-6PKG-VERIFY ?auto_2715 ?auto_2717 ?auto_2718 ?auto_2719 ?auto_2720 ?auto_2721 ?auto_2716 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_2743 - OBJ
      ?auto_2745 - OBJ
      ?auto_2746 - OBJ
      ?auto_2747 - OBJ
      ?auto_2748 - OBJ
      ?auto_2749 - OBJ
      ?auto_2750 - OBJ
      ?auto_2744 - LOCATION
    )
    :vars
    (
      ?auto_2753 - LOCATION
      ?auto_2751 - CITY
      ?auto_2756 - LOCATION
      ?auto_2755 - LOCATION
      ?auto_2754 - LOCATION
      ?auto_2757 - LOCATION
      ?auto_2752 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2745 ?auto_2743 ) ( GREATER-THAN ?auto_2746 ?auto_2743 ) ( GREATER-THAN ?auto_2746 ?auto_2745 ) ( GREATER-THAN ?auto_2747 ?auto_2743 ) ( GREATER-THAN ?auto_2747 ?auto_2745 ) ( GREATER-THAN ?auto_2747 ?auto_2746 ) ( GREATER-THAN ?auto_2748 ?auto_2743 ) ( GREATER-THAN ?auto_2748 ?auto_2745 ) ( GREATER-THAN ?auto_2748 ?auto_2746 ) ( GREATER-THAN ?auto_2748 ?auto_2747 ) ( GREATER-THAN ?auto_2749 ?auto_2743 ) ( GREATER-THAN ?auto_2749 ?auto_2745 ) ( GREATER-THAN ?auto_2749 ?auto_2746 ) ( GREATER-THAN ?auto_2749 ?auto_2747 ) ( GREATER-THAN ?auto_2749 ?auto_2748 ) ( GREATER-THAN ?auto_2750 ?auto_2743 ) ( GREATER-THAN ?auto_2750 ?auto_2745 ) ( GREATER-THAN ?auto_2750 ?auto_2746 ) ( GREATER-THAN ?auto_2750 ?auto_2747 ) ( GREATER-THAN ?auto_2750 ?auto_2748 ) ( GREATER-THAN ?auto_2750 ?auto_2749 ) ( IN-CITY ?auto_2753 ?auto_2751 ) ( IN-CITY ?auto_2744 ?auto_2751 ) ( not ( = ?auto_2744 ?auto_2753 ) ) ( OBJ-AT ?auto_2750 ?auto_2753 ) ( IN-CITY ?auto_2756 ?auto_2751 ) ( not ( = ?auto_2744 ?auto_2756 ) ) ( OBJ-AT ?auto_2749 ?auto_2756 ) ( IN-CITY ?auto_2755 ?auto_2751 ) ( not ( = ?auto_2744 ?auto_2755 ) ) ( OBJ-AT ?auto_2748 ?auto_2755 ) ( IN-CITY ?auto_2754 ?auto_2751 ) ( not ( = ?auto_2744 ?auto_2754 ) ) ( OBJ-AT ?auto_2747 ?auto_2754 ) ( IN-CITY ?auto_2757 ?auto_2751 ) ( not ( = ?auto_2744 ?auto_2757 ) ) ( OBJ-AT ?auto_2746 ?auto_2757 ) ( OBJ-AT ?auto_2745 ?auto_2756 ) ( OBJ-AT ?auto_2743 ?auto_2755 ) ( TRUCK-AT ?auto_2752 ?auto_2744 ) ( not ( = ?auto_2743 ?auto_2745 ) ) ( not ( = ?auto_2756 ?auto_2755 ) ) ( not ( = ?auto_2743 ?auto_2746 ) ) ( not ( = ?auto_2745 ?auto_2746 ) ) ( not ( = ?auto_2757 ?auto_2756 ) ) ( not ( = ?auto_2757 ?auto_2755 ) ) ( not ( = ?auto_2743 ?auto_2747 ) ) ( not ( = ?auto_2745 ?auto_2747 ) ) ( not ( = ?auto_2746 ?auto_2747 ) ) ( not ( = ?auto_2754 ?auto_2757 ) ) ( not ( = ?auto_2754 ?auto_2756 ) ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( not ( = ?auto_2743 ?auto_2748 ) ) ( not ( = ?auto_2745 ?auto_2748 ) ) ( not ( = ?auto_2746 ?auto_2748 ) ) ( not ( = ?auto_2747 ?auto_2748 ) ) ( not ( = ?auto_2743 ?auto_2749 ) ) ( not ( = ?auto_2745 ?auto_2749 ) ) ( not ( = ?auto_2746 ?auto_2749 ) ) ( not ( = ?auto_2747 ?auto_2749 ) ) ( not ( = ?auto_2748 ?auto_2749 ) ) ( not ( = ?auto_2743 ?auto_2750 ) ) ( not ( = ?auto_2745 ?auto_2750 ) ) ( not ( = ?auto_2746 ?auto_2750 ) ) ( not ( = ?auto_2747 ?auto_2750 ) ) ( not ( = ?auto_2748 ?auto_2750 ) ) ( not ( = ?auto_2749 ?auto_2750 ) ) ( not ( = ?auto_2753 ?auto_2756 ) ) ( not ( = ?auto_2753 ?auto_2755 ) ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( not ( = ?auto_2753 ?auto_2757 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2743 ?auto_2745 ?auto_2746 ?auto_2747 ?auto_2748 ?auto_2749 ?auto_2744 )
      ( DELIVER-1PKG ?auto_2750 ?auto_2744 )
      ( DELIVER-7PKG-VERIFY ?auto_2743 ?auto_2745 ?auto_2746 ?auto_2747 ?auto_2748 ?auto_2749 ?auto_2750 ?auto_2744 ) )
  )

  ( :method DELIVER-8PKG
    :parameters
    (
      ?auto_2774 - OBJ
      ?auto_2776 - OBJ
      ?auto_2777 - OBJ
      ?auto_2778 - OBJ
      ?auto_2779 - OBJ
      ?auto_2781 - OBJ
      ?auto_2782 - OBJ
      ?auto_2780 - OBJ
      ?auto_2775 - LOCATION
    )
    :vars
    (
      ?auto_2785 - LOCATION
      ?auto_2784 - CITY
      ?auto_2788 - LOCATION
      ?auto_2787 - LOCATION
      ?auto_2786 - LOCATION
      ?auto_2790 - LOCATION
      ?auto_2789 - LOCATION
      ?auto_2783 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2776 ?auto_2774 ) ( GREATER-THAN ?auto_2777 ?auto_2774 ) ( GREATER-THAN ?auto_2777 ?auto_2776 ) ( GREATER-THAN ?auto_2778 ?auto_2774 ) ( GREATER-THAN ?auto_2778 ?auto_2776 ) ( GREATER-THAN ?auto_2778 ?auto_2777 ) ( GREATER-THAN ?auto_2779 ?auto_2774 ) ( GREATER-THAN ?auto_2779 ?auto_2776 ) ( GREATER-THAN ?auto_2779 ?auto_2777 ) ( GREATER-THAN ?auto_2779 ?auto_2778 ) ( GREATER-THAN ?auto_2781 ?auto_2774 ) ( GREATER-THAN ?auto_2781 ?auto_2776 ) ( GREATER-THAN ?auto_2781 ?auto_2777 ) ( GREATER-THAN ?auto_2781 ?auto_2778 ) ( GREATER-THAN ?auto_2781 ?auto_2779 ) ( GREATER-THAN ?auto_2782 ?auto_2774 ) ( GREATER-THAN ?auto_2782 ?auto_2776 ) ( GREATER-THAN ?auto_2782 ?auto_2777 ) ( GREATER-THAN ?auto_2782 ?auto_2778 ) ( GREATER-THAN ?auto_2782 ?auto_2779 ) ( GREATER-THAN ?auto_2782 ?auto_2781 ) ( GREATER-THAN ?auto_2780 ?auto_2774 ) ( GREATER-THAN ?auto_2780 ?auto_2776 ) ( GREATER-THAN ?auto_2780 ?auto_2777 ) ( GREATER-THAN ?auto_2780 ?auto_2778 ) ( GREATER-THAN ?auto_2780 ?auto_2779 ) ( GREATER-THAN ?auto_2780 ?auto_2781 ) ( GREATER-THAN ?auto_2780 ?auto_2782 ) ( IN-CITY ?auto_2785 ?auto_2784 ) ( IN-CITY ?auto_2775 ?auto_2784 ) ( not ( = ?auto_2775 ?auto_2785 ) ) ( OBJ-AT ?auto_2780 ?auto_2785 ) ( IN-CITY ?auto_2788 ?auto_2784 ) ( not ( = ?auto_2775 ?auto_2788 ) ) ( OBJ-AT ?auto_2782 ?auto_2788 ) ( IN-CITY ?auto_2787 ?auto_2784 ) ( not ( = ?auto_2775 ?auto_2787 ) ) ( OBJ-AT ?auto_2781 ?auto_2787 ) ( IN-CITY ?auto_2786 ?auto_2784 ) ( not ( = ?auto_2775 ?auto_2786 ) ) ( OBJ-AT ?auto_2779 ?auto_2786 ) ( IN-CITY ?auto_2790 ?auto_2784 ) ( not ( = ?auto_2775 ?auto_2790 ) ) ( OBJ-AT ?auto_2778 ?auto_2790 ) ( IN-CITY ?auto_2789 ?auto_2784 ) ( not ( = ?auto_2775 ?auto_2789 ) ) ( OBJ-AT ?auto_2777 ?auto_2789 ) ( OBJ-AT ?auto_2776 ?auto_2787 ) ( OBJ-AT ?auto_2774 ?auto_2786 ) ( TRUCK-AT ?auto_2783 ?auto_2775 ) ( not ( = ?auto_2774 ?auto_2776 ) ) ( not ( = ?auto_2787 ?auto_2786 ) ) ( not ( = ?auto_2774 ?auto_2777 ) ) ( not ( = ?auto_2776 ?auto_2777 ) ) ( not ( = ?auto_2789 ?auto_2787 ) ) ( not ( = ?auto_2789 ?auto_2786 ) ) ( not ( = ?auto_2774 ?auto_2778 ) ) ( not ( = ?auto_2776 ?auto_2778 ) ) ( not ( = ?auto_2777 ?auto_2778 ) ) ( not ( = ?auto_2790 ?auto_2789 ) ) ( not ( = ?auto_2790 ?auto_2787 ) ) ( not ( = ?auto_2790 ?auto_2786 ) ) ( not ( = ?auto_2774 ?auto_2779 ) ) ( not ( = ?auto_2776 ?auto_2779 ) ) ( not ( = ?auto_2777 ?auto_2779 ) ) ( not ( = ?auto_2778 ?auto_2779 ) ) ( not ( = ?auto_2774 ?auto_2781 ) ) ( not ( = ?auto_2776 ?auto_2781 ) ) ( not ( = ?auto_2777 ?auto_2781 ) ) ( not ( = ?auto_2778 ?auto_2781 ) ) ( not ( = ?auto_2779 ?auto_2781 ) ) ( not ( = ?auto_2774 ?auto_2782 ) ) ( not ( = ?auto_2776 ?auto_2782 ) ) ( not ( = ?auto_2777 ?auto_2782 ) ) ( not ( = ?auto_2778 ?auto_2782 ) ) ( not ( = ?auto_2779 ?auto_2782 ) ) ( not ( = ?auto_2781 ?auto_2782 ) ) ( not ( = ?auto_2788 ?auto_2787 ) ) ( not ( = ?auto_2788 ?auto_2786 ) ) ( not ( = ?auto_2788 ?auto_2790 ) ) ( not ( = ?auto_2788 ?auto_2789 ) ) ( not ( = ?auto_2774 ?auto_2780 ) ) ( not ( = ?auto_2776 ?auto_2780 ) ) ( not ( = ?auto_2777 ?auto_2780 ) ) ( not ( = ?auto_2778 ?auto_2780 ) ) ( not ( = ?auto_2779 ?auto_2780 ) ) ( not ( = ?auto_2781 ?auto_2780 ) ) ( not ( = ?auto_2782 ?auto_2780 ) ) ( not ( = ?auto_2785 ?auto_2788 ) ) ( not ( = ?auto_2785 ?auto_2787 ) ) ( not ( = ?auto_2785 ?auto_2786 ) ) ( not ( = ?auto_2785 ?auto_2790 ) ) ( not ( = ?auto_2785 ?auto_2789 ) ) )
    :subtasks
    ( ( DELIVER-7PKG ?auto_2774 ?auto_2776 ?auto_2777 ?auto_2778 ?auto_2779 ?auto_2781 ?auto_2782 ?auto_2775 )
      ( DELIVER-1PKG ?auto_2780 ?auto_2775 )
      ( DELIVER-8PKG-VERIFY ?auto_2774 ?auto_2776 ?auto_2777 ?auto_2778 ?auto_2779 ?auto_2781 ?auto_2782 ?auto_2780 ?auto_2775 ) )
  )

)

