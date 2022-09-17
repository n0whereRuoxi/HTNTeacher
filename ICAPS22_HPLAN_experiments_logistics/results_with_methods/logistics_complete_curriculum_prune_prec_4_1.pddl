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
      ?auto_2561 - OBJ
      ?auto_2562 - LOCATION
    )
    :vars
    (
      ?auto_2563 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2563 ?auto_2562 ) ( IN-TRUCK ?auto_2561 ?auto_2563 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2561 ?auto_2563 ?auto_2562 )
      ( DELIVER-1PKG-VERIFY ?auto_2561 ?auto_2562 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2566 - OBJ
      ?auto_2567 - LOCATION
    )
    :vars
    (
      ?auto_2568 - TRUCK
      ?auto_2569 - LOCATION
      ?auto_2570 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2566 ?auto_2568 ) ( TRUCK-AT ?auto_2568 ?auto_2569 ) ( IN-CITY ?auto_2569 ?auto_2570 ) ( IN-CITY ?auto_2567 ?auto_2570 ) ( not ( = ?auto_2567 ?auto_2569 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2568 ?auto_2569 ?auto_2567 ?auto_2570 )
      ( DELIVER-1PKG ?auto_2566 ?auto_2567 )
      ( DELIVER-1PKG-VERIFY ?auto_2566 ?auto_2567 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2573 - OBJ
      ?auto_2574 - LOCATION
    )
    :vars
    (
      ?auto_2577 - TRUCK
      ?auto_2575 - LOCATION
      ?auto_2576 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2577 ?auto_2575 ) ( IN-CITY ?auto_2575 ?auto_2576 ) ( IN-CITY ?auto_2574 ?auto_2576 ) ( not ( = ?auto_2574 ?auto_2575 ) ) ( OBJ-AT ?auto_2573 ?auto_2575 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2573 ?auto_2577 ?auto_2575 )
      ( DELIVER-1PKG ?auto_2573 ?auto_2574 )
      ( DELIVER-1PKG-VERIFY ?auto_2573 ?auto_2574 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2580 - OBJ
      ?auto_2581 - LOCATION
    )
    :vars
    (
      ?auto_2583 - LOCATION
      ?auto_2584 - CITY
      ?auto_2582 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2583 ?auto_2584 ) ( IN-CITY ?auto_2581 ?auto_2584 ) ( not ( = ?auto_2581 ?auto_2583 ) ) ( OBJ-AT ?auto_2580 ?auto_2583 ) ( TRUCK-AT ?auto_2582 ?auto_2581 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2582 ?auto_2581 ?auto_2583 ?auto_2584 )
      ( DELIVER-1PKG ?auto_2580 ?auto_2581 )
      ( DELIVER-1PKG-VERIFY ?auto_2580 ?auto_2581 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2614 - OBJ
      ?auto_2616 - OBJ
      ?auto_2615 - LOCATION
    )
    :vars
    (
      ?auto_2617 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2616 ?auto_2614 ) ( TRUCK-AT ?auto_2617 ?auto_2615 ) ( IN-TRUCK ?auto_2616 ?auto_2617 ) ( OBJ-AT ?auto_2614 ?auto_2615 ) ( not ( = ?auto_2614 ?auto_2616 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2616 ?auto_2615 )
      ( DELIVER-2PKG-VERIFY ?auto_2614 ?auto_2616 ?auto_2615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2621 - OBJ
      ?auto_2623 - OBJ
      ?auto_2622 - LOCATION
    )
    :vars
    (
      ?auto_2625 - TRUCK
      ?auto_2624 - LOCATION
      ?auto_2626 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2623 ?auto_2621 ) ( IN-TRUCK ?auto_2623 ?auto_2625 ) ( TRUCK-AT ?auto_2625 ?auto_2624 ) ( IN-CITY ?auto_2624 ?auto_2626 ) ( IN-CITY ?auto_2622 ?auto_2626 ) ( not ( = ?auto_2622 ?auto_2624 ) ) ( OBJ-AT ?auto_2621 ?auto_2622 ) ( not ( = ?auto_2621 ?auto_2623 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2623 ?auto_2622 )
      ( DELIVER-2PKG-VERIFY ?auto_2621 ?auto_2623 ?auto_2622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2630 - OBJ
      ?auto_2632 - OBJ
      ?auto_2631 - LOCATION
    )
    :vars
    (
      ?auto_2633 - TRUCK
      ?auto_2635 - LOCATION
      ?auto_2634 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2632 ?auto_2630 ) ( TRUCK-AT ?auto_2633 ?auto_2635 ) ( IN-CITY ?auto_2635 ?auto_2634 ) ( IN-CITY ?auto_2631 ?auto_2634 ) ( not ( = ?auto_2631 ?auto_2635 ) ) ( OBJ-AT ?auto_2632 ?auto_2635 ) ( OBJ-AT ?auto_2630 ?auto_2631 ) ( not ( = ?auto_2630 ?auto_2632 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2632 ?auto_2631 )
      ( DELIVER-2PKG-VERIFY ?auto_2630 ?auto_2632 ?auto_2631 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2639 - OBJ
      ?auto_2641 - OBJ
      ?auto_2640 - LOCATION
    )
    :vars
    (
      ?auto_2642 - LOCATION
      ?auto_2644 - CITY
      ?auto_2643 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2641 ?auto_2639 ) ( IN-CITY ?auto_2642 ?auto_2644 ) ( IN-CITY ?auto_2640 ?auto_2644 ) ( not ( = ?auto_2640 ?auto_2642 ) ) ( OBJ-AT ?auto_2641 ?auto_2642 ) ( TRUCK-AT ?auto_2643 ?auto_2640 ) ( OBJ-AT ?auto_2639 ?auto_2640 ) ( not ( = ?auto_2639 ?auto_2641 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2641 ?auto_2640 )
      ( DELIVER-2PKG-VERIFY ?auto_2639 ?auto_2641 ?auto_2640 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2648 - OBJ
      ?auto_2650 - OBJ
      ?auto_2649 - LOCATION
    )
    :vars
    (
      ?auto_2651 - LOCATION
      ?auto_2652 - CITY
      ?auto_2653 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2650 ?auto_2648 ) ( IN-CITY ?auto_2651 ?auto_2652 ) ( IN-CITY ?auto_2649 ?auto_2652 ) ( not ( = ?auto_2649 ?auto_2651 ) ) ( OBJ-AT ?auto_2650 ?auto_2651 ) ( TRUCK-AT ?auto_2653 ?auto_2649 ) ( not ( = ?auto_2648 ?auto_2650 ) ) ( IN-TRUCK ?auto_2648 ?auto_2653 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2648 ?auto_2649 )
      ( DELIVER-2PKG ?auto_2648 ?auto_2650 ?auto_2649 )
      ( DELIVER-2PKG-VERIFY ?auto_2648 ?auto_2650 ?auto_2649 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2657 - OBJ
      ?auto_2659 - OBJ
      ?auto_2658 - LOCATION
    )
    :vars
    (
      ?auto_2662 - LOCATION
      ?auto_2660 - CITY
      ?auto_2661 - TRUCK
      ?auto_2663 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2659 ?auto_2657 ) ( IN-CITY ?auto_2662 ?auto_2660 ) ( IN-CITY ?auto_2658 ?auto_2660 ) ( not ( = ?auto_2658 ?auto_2662 ) ) ( OBJ-AT ?auto_2659 ?auto_2662 ) ( not ( = ?auto_2657 ?auto_2659 ) ) ( IN-TRUCK ?auto_2657 ?auto_2661 ) ( TRUCK-AT ?auto_2661 ?auto_2663 ) ( IN-CITY ?auto_2663 ?auto_2660 ) ( not ( = ?auto_2658 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2663 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2661 ?auto_2663 ?auto_2658 ?auto_2660 )
      ( DELIVER-2PKG ?auto_2657 ?auto_2659 ?auto_2658 )
      ( DELIVER-2PKG-VERIFY ?auto_2657 ?auto_2659 ?auto_2658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2667 - OBJ
      ?auto_2669 - OBJ
      ?auto_2668 - LOCATION
    )
    :vars
    (
      ?auto_2671 - LOCATION
      ?auto_2672 - CITY
      ?auto_2673 - TRUCK
      ?auto_2670 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2669 ?auto_2667 ) ( IN-CITY ?auto_2671 ?auto_2672 ) ( IN-CITY ?auto_2668 ?auto_2672 ) ( not ( = ?auto_2668 ?auto_2671 ) ) ( OBJ-AT ?auto_2669 ?auto_2671 ) ( not ( = ?auto_2667 ?auto_2669 ) ) ( TRUCK-AT ?auto_2673 ?auto_2670 ) ( IN-CITY ?auto_2670 ?auto_2672 ) ( not ( = ?auto_2668 ?auto_2670 ) ) ( not ( = ?auto_2671 ?auto_2670 ) ) ( OBJ-AT ?auto_2667 ?auto_2670 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2667 ?auto_2673 ?auto_2670 )
      ( DELIVER-2PKG ?auto_2667 ?auto_2669 ?auto_2668 )
      ( DELIVER-2PKG-VERIFY ?auto_2667 ?auto_2669 ?auto_2668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2677 - OBJ
      ?auto_2679 - OBJ
      ?auto_2678 - LOCATION
    )
    :vars
    (
      ?auto_2683 - LOCATION
      ?auto_2682 - CITY
      ?auto_2681 - LOCATION
      ?auto_2680 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2679 ?auto_2677 ) ( IN-CITY ?auto_2683 ?auto_2682 ) ( IN-CITY ?auto_2678 ?auto_2682 ) ( not ( = ?auto_2678 ?auto_2683 ) ) ( OBJ-AT ?auto_2679 ?auto_2683 ) ( not ( = ?auto_2677 ?auto_2679 ) ) ( IN-CITY ?auto_2681 ?auto_2682 ) ( not ( = ?auto_2678 ?auto_2681 ) ) ( not ( = ?auto_2683 ?auto_2681 ) ) ( OBJ-AT ?auto_2677 ?auto_2681 ) ( TRUCK-AT ?auto_2680 ?auto_2678 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2680 ?auto_2678 ?auto_2681 ?auto_2682 )
      ( DELIVER-2PKG ?auto_2677 ?auto_2679 ?auto_2678 )
      ( DELIVER-2PKG-VERIFY ?auto_2677 ?auto_2679 ?auto_2678 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2714 - OBJ
      ?auto_2716 - OBJ
      ?auto_2717 - OBJ
      ?auto_2715 - LOCATION
    )
    :vars
    (
      ?auto_2718 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2716 ?auto_2714 ) ( GREATER-THAN ?auto_2717 ?auto_2714 ) ( GREATER-THAN ?auto_2717 ?auto_2716 ) ( TRUCK-AT ?auto_2718 ?auto_2715 ) ( IN-TRUCK ?auto_2717 ?auto_2718 ) ( OBJ-AT ?auto_2714 ?auto_2715 ) ( OBJ-AT ?auto_2716 ?auto_2715 ) ( not ( = ?auto_2714 ?auto_2716 ) ) ( not ( = ?auto_2714 ?auto_2717 ) ) ( not ( = ?auto_2716 ?auto_2717 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2717 ?auto_2715 )
      ( DELIVER-3PKG-VERIFY ?auto_2714 ?auto_2716 ?auto_2717 ?auto_2715 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2723 - OBJ
      ?auto_2725 - OBJ
      ?auto_2726 - OBJ
      ?auto_2724 - LOCATION
    )
    :vars
    (
      ?auto_2729 - TRUCK
      ?auto_2727 - LOCATION
      ?auto_2728 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2725 ?auto_2723 ) ( GREATER-THAN ?auto_2726 ?auto_2723 ) ( GREATER-THAN ?auto_2726 ?auto_2725 ) ( IN-TRUCK ?auto_2726 ?auto_2729 ) ( TRUCK-AT ?auto_2729 ?auto_2727 ) ( IN-CITY ?auto_2727 ?auto_2728 ) ( IN-CITY ?auto_2724 ?auto_2728 ) ( not ( = ?auto_2724 ?auto_2727 ) ) ( OBJ-AT ?auto_2723 ?auto_2724 ) ( OBJ-AT ?auto_2725 ?auto_2724 ) ( not ( = ?auto_2723 ?auto_2725 ) ) ( not ( = ?auto_2723 ?auto_2726 ) ) ( not ( = ?auto_2725 ?auto_2726 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2726 ?auto_2724 )
      ( DELIVER-3PKG-VERIFY ?auto_2723 ?auto_2725 ?auto_2726 ?auto_2724 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2734 - OBJ
      ?auto_2736 - OBJ
      ?auto_2737 - OBJ
      ?auto_2735 - LOCATION
    )
    :vars
    (
      ?auto_2738 - TRUCK
      ?auto_2740 - LOCATION
      ?auto_2739 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2736 ?auto_2734 ) ( GREATER-THAN ?auto_2737 ?auto_2734 ) ( GREATER-THAN ?auto_2737 ?auto_2736 ) ( TRUCK-AT ?auto_2738 ?auto_2740 ) ( IN-CITY ?auto_2740 ?auto_2739 ) ( IN-CITY ?auto_2735 ?auto_2739 ) ( not ( = ?auto_2735 ?auto_2740 ) ) ( OBJ-AT ?auto_2737 ?auto_2740 ) ( OBJ-AT ?auto_2734 ?auto_2735 ) ( OBJ-AT ?auto_2736 ?auto_2735 ) ( not ( = ?auto_2734 ?auto_2736 ) ) ( not ( = ?auto_2734 ?auto_2737 ) ) ( not ( = ?auto_2736 ?auto_2737 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2737 ?auto_2735 )
      ( DELIVER-3PKG-VERIFY ?auto_2734 ?auto_2736 ?auto_2737 ?auto_2735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2745 - OBJ
      ?auto_2747 - OBJ
      ?auto_2748 - OBJ
      ?auto_2746 - LOCATION
    )
    :vars
    (
      ?auto_2751 - LOCATION
      ?auto_2750 - CITY
      ?auto_2749 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2747 ?auto_2745 ) ( GREATER-THAN ?auto_2748 ?auto_2745 ) ( GREATER-THAN ?auto_2748 ?auto_2747 ) ( IN-CITY ?auto_2751 ?auto_2750 ) ( IN-CITY ?auto_2746 ?auto_2750 ) ( not ( = ?auto_2746 ?auto_2751 ) ) ( OBJ-AT ?auto_2748 ?auto_2751 ) ( TRUCK-AT ?auto_2749 ?auto_2746 ) ( OBJ-AT ?auto_2745 ?auto_2746 ) ( OBJ-AT ?auto_2747 ?auto_2746 ) ( not ( = ?auto_2745 ?auto_2747 ) ) ( not ( = ?auto_2745 ?auto_2748 ) ) ( not ( = ?auto_2747 ?auto_2748 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2748 ?auto_2746 )
      ( DELIVER-3PKG-VERIFY ?auto_2745 ?auto_2747 ?auto_2748 ?auto_2746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2756 - OBJ
      ?auto_2758 - OBJ
      ?auto_2759 - OBJ
      ?auto_2757 - LOCATION
    )
    :vars
    (
      ?auto_2761 - LOCATION
      ?auto_2762 - CITY
      ?auto_2760 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2758 ?auto_2756 ) ( GREATER-THAN ?auto_2759 ?auto_2756 ) ( GREATER-THAN ?auto_2759 ?auto_2758 ) ( IN-CITY ?auto_2761 ?auto_2762 ) ( IN-CITY ?auto_2757 ?auto_2762 ) ( not ( = ?auto_2757 ?auto_2761 ) ) ( OBJ-AT ?auto_2759 ?auto_2761 ) ( TRUCK-AT ?auto_2760 ?auto_2757 ) ( OBJ-AT ?auto_2756 ?auto_2757 ) ( not ( = ?auto_2756 ?auto_2758 ) ) ( not ( = ?auto_2756 ?auto_2759 ) ) ( not ( = ?auto_2758 ?auto_2759 ) ) ( IN-TRUCK ?auto_2758 ?auto_2760 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2758 ?auto_2757 )
      ( DELIVER-3PKG ?auto_2756 ?auto_2758 ?auto_2759 ?auto_2757 )
      ( DELIVER-3PKG-VERIFY ?auto_2756 ?auto_2758 ?auto_2759 ?auto_2757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2767 - OBJ
      ?auto_2769 - OBJ
      ?auto_2770 - OBJ
      ?auto_2768 - LOCATION
    )
    :vars
    (
      ?auto_2773 - LOCATION
      ?auto_2772 - CITY
      ?auto_2771 - TRUCK
      ?auto_2774 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2769 ?auto_2767 ) ( GREATER-THAN ?auto_2770 ?auto_2767 ) ( GREATER-THAN ?auto_2770 ?auto_2769 ) ( IN-CITY ?auto_2773 ?auto_2772 ) ( IN-CITY ?auto_2768 ?auto_2772 ) ( not ( = ?auto_2768 ?auto_2773 ) ) ( OBJ-AT ?auto_2770 ?auto_2773 ) ( OBJ-AT ?auto_2767 ?auto_2768 ) ( not ( = ?auto_2767 ?auto_2769 ) ) ( not ( = ?auto_2767 ?auto_2770 ) ) ( not ( = ?auto_2769 ?auto_2770 ) ) ( IN-TRUCK ?auto_2769 ?auto_2771 ) ( TRUCK-AT ?auto_2771 ?auto_2774 ) ( IN-CITY ?auto_2774 ?auto_2772 ) ( not ( = ?auto_2768 ?auto_2774 ) ) ( not ( = ?auto_2773 ?auto_2774 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2771 ?auto_2774 ?auto_2768 ?auto_2772 )
      ( DELIVER-3PKG ?auto_2767 ?auto_2769 ?auto_2770 ?auto_2768 )
      ( DELIVER-3PKG-VERIFY ?auto_2767 ?auto_2769 ?auto_2770 ?auto_2768 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2779 - OBJ
      ?auto_2781 - OBJ
      ?auto_2782 - OBJ
      ?auto_2780 - LOCATION
    )
    :vars
    (
      ?auto_2785 - LOCATION
      ?auto_2783 - CITY
      ?auto_2786 - TRUCK
      ?auto_2784 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2781 ?auto_2779 ) ( GREATER-THAN ?auto_2782 ?auto_2779 ) ( GREATER-THAN ?auto_2782 ?auto_2781 ) ( IN-CITY ?auto_2785 ?auto_2783 ) ( IN-CITY ?auto_2780 ?auto_2783 ) ( not ( = ?auto_2780 ?auto_2785 ) ) ( OBJ-AT ?auto_2782 ?auto_2785 ) ( OBJ-AT ?auto_2779 ?auto_2780 ) ( not ( = ?auto_2779 ?auto_2781 ) ) ( not ( = ?auto_2779 ?auto_2782 ) ) ( not ( = ?auto_2781 ?auto_2782 ) ) ( TRUCK-AT ?auto_2786 ?auto_2784 ) ( IN-CITY ?auto_2784 ?auto_2783 ) ( not ( = ?auto_2780 ?auto_2784 ) ) ( not ( = ?auto_2785 ?auto_2784 ) ) ( OBJ-AT ?auto_2781 ?auto_2784 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2781 ?auto_2786 ?auto_2784 )
      ( DELIVER-3PKG ?auto_2779 ?auto_2781 ?auto_2782 ?auto_2780 )
      ( DELIVER-3PKG-VERIFY ?auto_2779 ?auto_2781 ?auto_2782 ?auto_2780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2791 - OBJ
      ?auto_2793 - OBJ
      ?auto_2794 - OBJ
      ?auto_2792 - LOCATION
    )
    :vars
    (
      ?auto_2796 - LOCATION
      ?auto_2797 - CITY
      ?auto_2795 - LOCATION
      ?auto_2798 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2793 ?auto_2791 ) ( GREATER-THAN ?auto_2794 ?auto_2791 ) ( GREATER-THAN ?auto_2794 ?auto_2793 ) ( IN-CITY ?auto_2796 ?auto_2797 ) ( IN-CITY ?auto_2792 ?auto_2797 ) ( not ( = ?auto_2792 ?auto_2796 ) ) ( OBJ-AT ?auto_2794 ?auto_2796 ) ( OBJ-AT ?auto_2791 ?auto_2792 ) ( not ( = ?auto_2791 ?auto_2793 ) ) ( not ( = ?auto_2791 ?auto_2794 ) ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( IN-CITY ?auto_2795 ?auto_2797 ) ( not ( = ?auto_2792 ?auto_2795 ) ) ( not ( = ?auto_2796 ?auto_2795 ) ) ( OBJ-AT ?auto_2793 ?auto_2795 ) ( TRUCK-AT ?auto_2798 ?auto_2792 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2798 ?auto_2792 ?auto_2795 ?auto_2797 )
      ( DELIVER-3PKG ?auto_2791 ?auto_2793 ?auto_2794 ?auto_2792 )
      ( DELIVER-3PKG-VERIFY ?auto_2791 ?auto_2793 ?auto_2794 ?auto_2792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2803 - OBJ
      ?auto_2805 - OBJ
      ?auto_2806 - OBJ
      ?auto_2804 - LOCATION
    )
    :vars
    (
      ?auto_2807 - LOCATION
      ?auto_2808 - CITY
      ?auto_2809 - LOCATION
      ?auto_2810 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2805 ?auto_2803 ) ( GREATER-THAN ?auto_2806 ?auto_2803 ) ( GREATER-THAN ?auto_2806 ?auto_2805 ) ( IN-CITY ?auto_2807 ?auto_2808 ) ( IN-CITY ?auto_2804 ?auto_2808 ) ( not ( = ?auto_2804 ?auto_2807 ) ) ( OBJ-AT ?auto_2806 ?auto_2807 ) ( not ( = ?auto_2803 ?auto_2805 ) ) ( not ( = ?auto_2803 ?auto_2806 ) ) ( not ( = ?auto_2805 ?auto_2806 ) ) ( IN-CITY ?auto_2809 ?auto_2808 ) ( not ( = ?auto_2804 ?auto_2809 ) ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( OBJ-AT ?auto_2805 ?auto_2809 ) ( TRUCK-AT ?auto_2810 ?auto_2804 ) ( IN-TRUCK ?auto_2803 ?auto_2810 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2803 ?auto_2804 )
      ( DELIVER-3PKG ?auto_2803 ?auto_2805 ?auto_2806 ?auto_2804 )
      ( DELIVER-3PKG-VERIFY ?auto_2803 ?auto_2805 ?auto_2806 ?auto_2804 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2815 - OBJ
      ?auto_2817 - OBJ
      ?auto_2818 - OBJ
      ?auto_2816 - LOCATION
    )
    :vars
    (
      ?auto_2822 - LOCATION
      ?auto_2819 - CITY
      ?auto_2820 - LOCATION
      ?auto_2821 - TRUCK
      ?auto_2823 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2817 ?auto_2815 ) ( GREATER-THAN ?auto_2818 ?auto_2815 ) ( GREATER-THAN ?auto_2818 ?auto_2817 ) ( IN-CITY ?auto_2822 ?auto_2819 ) ( IN-CITY ?auto_2816 ?auto_2819 ) ( not ( = ?auto_2816 ?auto_2822 ) ) ( OBJ-AT ?auto_2818 ?auto_2822 ) ( not ( = ?auto_2815 ?auto_2817 ) ) ( not ( = ?auto_2815 ?auto_2818 ) ) ( not ( = ?auto_2817 ?auto_2818 ) ) ( IN-CITY ?auto_2820 ?auto_2819 ) ( not ( = ?auto_2816 ?auto_2820 ) ) ( not ( = ?auto_2822 ?auto_2820 ) ) ( OBJ-AT ?auto_2817 ?auto_2820 ) ( IN-TRUCK ?auto_2815 ?auto_2821 ) ( TRUCK-AT ?auto_2821 ?auto_2823 ) ( IN-CITY ?auto_2823 ?auto_2819 ) ( not ( = ?auto_2816 ?auto_2823 ) ) ( not ( = ?auto_2822 ?auto_2823 ) ) ( not ( = ?auto_2820 ?auto_2823 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2821 ?auto_2823 ?auto_2816 ?auto_2819 )
      ( DELIVER-3PKG ?auto_2815 ?auto_2817 ?auto_2818 ?auto_2816 )
      ( DELIVER-3PKG-VERIFY ?auto_2815 ?auto_2817 ?auto_2818 ?auto_2816 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2828 - OBJ
      ?auto_2830 - OBJ
      ?auto_2831 - OBJ
      ?auto_2829 - LOCATION
    )
    :vars
    (
      ?auto_2833 - LOCATION
      ?auto_2835 - CITY
      ?auto_2832 - LOCATION
      ?auto_2834 - TRUCK
      ?auto_2836 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2830 ?auto_2828 ) ( GREATER-THAN ?auto_2831 ?auto_2828 ) ( GREATER-THAN ?auto_2831 ?auto_2830 ) ( IN-CITY ?auto_2833 ?auto_2835 ) ( IN-CITY ?auto_2829 ?auto_2835 ) ( not ( = ?auto_2829 ?auto_2833 ) ) ( OBJ-AT ?auto_2831 ?auto_2833 ) ( not ( = ?auto_2828 ?auto_2830 ) ) ( not ( = ?auto_2828 ?auto_2831 ) ) ( not ( = ?auto_2830 ?auto_2831 ) ) ( IN-CITY ?auto_2832 ?auto_2835 ) ( not ( = ?auto_2829 ?auto_2832 ) ) ( not ( = ?auto_2833 ?auto_2832 ) ) ( OBJ-AT ?auto_2830 ?auto_2832 ) ( TRUCK-AT ?auto_2834 ?auto_2836 ) ( IN-CITY ?auto_2836 ?auto_2835 ) ( not ( = ?auto_2829 ?auto_2836 ) ) ( not ( = ?auto_2833 ?auto_2836 ) ) ( not ( = ?auto_2832 ?auto_2836 ) ) ( OBJ-AT ?auto_2828 ?auto_2836 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2828 ?auto_2834 ?auto_2836 )
      ( DELIVER-3PKG ?auto_2828 ?auto_2830 ?auto_2831 ?auto_2829 )
      ( DELIVER-3PKG-VERIFY ?auto_2828 ?auto_2830 ?auto_2831 ?auto_2829 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2841 - OBJ
      ?auto_2843 - OBJ
      ?auto_2844 - OBJ
      ?auto_2842 - LOCATION
    )
    :vars
    (
      ?auto_2845 - LOCATION
      ?auto_2849 - CITY
      ?auto_2846 - LOCATION
      ?auto_2848 - LOCATION
      ?auto_2847 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2843 ?auto_2841 ) ( GREATER-THAN ?auto_2844 ?auto_2841 ) ( GREATER-THAN ?auto_2844 ?auto_2843 ) ( IN-CITY ?auto_2845 ?auto_2849 ) ( IN-CITY ?auto_2842 ?auto_2849 ) ( not ( = ?auto_2842 ?auto_2845 ) ) ( OBJ-AT ?auto_2844 ?auto_2845 ) ( not ( = ?auto_2841 ?auto_2843 ) ) ( not ( = ?auto_2841 ?auto_2844 ) ) ( not ( = ?auto_2843 ?auto_2844 ) ) ( IN-CITY ?auto_2846 ?auto_2849 ) ( not ( = ?auto_2842 ?auto_2846 ) ) ( not ( = ?auto_2845 ?auto_2846 ) ) ( OBJ-AT ?auto_2843 ?auto_2846 ) ( IN-CITY ?auto_2848 ?auto_2849 ) ( not ( = ?auto_2842 ?auto_2848 ) ) ( not ( = ?auto_2845 ?auto_2848 ) ) ( not ( = ?auto_2846 ?auto_2848 ) ) ( OBJ-AT ?auto_2841 ?auto_2848 ) ( TRUCK-AT ?auto_2847 ?auto_2842 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2847 ?auto_2842 ?auto_2848 ?auto_2849 )
      ( DELIVER-3PKG ?auto_2841 ?auto_2843 ?auto_2844 ?auto_2842 )
      ( DELIVER-3PKG-VERIFY ?auto_2841 ?auto_2843 ?auto_2844 ?auto_2842 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2881 - OBJ
      ?auto_2883 - OBJ
      ?auto_2884 - OBJ
      ?auto_2885 - OBJ
      ?auto_2882 - LOCATION
    )
    :vars
    (
      ?auto_2886 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2883 ?auto_2881 ) ( GREATER-THAN ?auto_2884 ?auto_2881 ) ( GREATER-THAN ?auto_2884 ?auto_2883 ) ( GREATER-THAN ?auto_2885 ?auto_2881 ) ( GREATER-THAN ?auto_2885 ?auto_2883 ) ( GREATER-THAN ?auto_2885 ?auto_2884 ) ( TRUCK-AT ?auto_2886 ?auto_2882 ) ( IN-TRUCK ?auto_2885 ?auto_2886 ) ( OBJ-AT ?auto_2881 ?auto_2882 ) ( OBJ-AT ?auto_2883 ?auto_2882 ) ( OBJ-AT ?auto_2884 ?auto_2882 ) ( not ( = ?auto_2881 ?auto_2883 ) ) ( not ( = ?auto_2881 ?auto_2884 ) ) ( not ( = ?auto_2881 ?auto_2885 ) ) ( not ( = ?auto_2883 ?auto_2884 ) ) ( not ( = ?auto_2883 ?auto_2885 ) ) ( not ( = ?auto_2884 ?auto_2885 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2885 ?auto_2882 )
      ( DELIVER-4PKG-VERIFY ?auto_2881 ?auto_2883 ?auto_2884 ?auto_2885 ?auto_2882 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2892 - OBJ
      ?auto_2894 - OBJ
      ?auto_2895 - OBJ
      ?auto_2896 - OBJ
      ?auto_2893 - LOCATION
    )
    :vars
    (
      ?auto_2898 - TRUCK
      ?auto_2897 - LOCATION
      ?auto_2899 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2894 ?auto_2892 ) ( GREATER-THAN ?auto_2895 ?auto_2892 ) ( GREATER-THAN ?auto_2895 ?auto_2894 ) ( GREATER-THAN ?auto_2896 ?auto_2892 ) ( GREATER-THAN ?auto_2896 ?auto_2894 ) ( GREATER-THAN ?auto_2896 ?auto_2895 ) ( IN-TRUCK ?auto_2896 ?auto_2898 ) ( TRUCK-AT ?auto_2898 ?auto_2897 ) ( IN-CITY ?auto_2897 ?auto_2899 ) ( IN-CITY ?auto_2893 ?auto_2899 ) ( not ( = ?auto_2893 ?auto_2897 ) ) ( OBJ-AT ?auto_2892 ?auto_2893 ) ( OBJ-AT ?auto_2894 ?auto_2893 ) ( OBJ-AT ?auto_2895 ?auto_2893 ) ( not ( = ?auto_2892 ?auto_2894 ) ) ( not ( = ?auto_2892 ?auto_2895 ) ) ( not ( = ?auto_2892 ?auto_2896 ) ) ( not ( = ?auto_2894 ?auto_2895 ) ) ( not ( = ?auto_2894 ?auto_2896 ) ) ( not ( = ?auto_2895 ?auto_2896 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2896 ?auto_2893 )
      ( DELIVER-4PKG-VERIFY ?auto_2892 ?auto_2894 ?auto_2895 ?auto_2896 ?auto_2893 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2905 - OBJ
      ?auto_2907 - OBJ
      ?auto_2908 - OBJ
      ?auto_2909 - OBJ
      ?auto_2906 - LOCATION
    )
    :vars
    (
      ?auto_2910 - TRUCK
      ?auto_2912 - LOCATION
      ?auto_2911 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2907 ?auto_2905 ) ( GREATER-THAN ?auto_2908 ?auto_2905 ) ( GREATER-THAN ?auto_2908 ?auto_2907 ) ( GREATER-THAN ?auto_2909 ?auto_2905 ) ( GREATER-THAN ?auto_2909 ?auto_2907 ) ( GREATER-THAN ?auto_2909 ?auto_2908 ) ( TRUCK-AT ?auto_2910 ?auto_2912 ) ( IN-CITY ?auto_2912 ?auto_2911 ) ( IN-CITY ?auto_2906 ?auto_2911 ) ( not ( = ?auto_2906 ?auto_2912 ) ) ( OBJ-AT ?auto_2909 ?auto_2912 ) ( OBJ-AT ?auto_2905 ?auto_2906 ) ( OBJ-AT ?auto_2907 ?auto_2906 ) ( OBJ-AT ?auto_2908 ?auto_2906 ) ( not ( = ?auto_2905 ?auto_2907 ) ) ( not ( = ?auto_2905 ?auto_2908 ) ) ( not ( = ?auto_2905 ?auto_2909 ) ) ( not ( = ?auto_2907 ?auto_2908 ) ) ( not ( = ?auto_2907 ?auto_2909 ) ) ( not ( = ?auto_2908 ?auto_2909 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2909 ?auto_2906 )
      ( DELIVER-4PKG-VERIFY ?auto_2905 ?auto_2907 ?auto_2908 ?auto_2909 ?auto_2906 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2918 - OBJ
      ?auto_2920 - OBJ
      ?auto_2921 - OBJ
      ?auto_2922 - OBJ
      ?auto_2919 - LOCATION
    )
    :vars
    (
      ?auto_2925 - LOCATION
      ?auto_2923 - CITY
      ?auto_2924 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2920 ?auto_2918 ) ( GREATER-THAN ?auto_2921 ?auto_2918 ) ( GREATER-THAN ?auto_2921 ?auto_2920 ) ( GREATER-THAN ?auto_2922 ?auto_2918 ) ( GREATER-THAN ?auto_2922 ?auto_2920 ) ( GREATER-THAN ?auto_2922 ?auto_2921 ) ( IN-CITY ?auto_2925 ?auto_2923 ) ( IN-CITY ?auto_2919 ?auto_2923 ) ( not ( = ?auto_2919 ?auto_2925 ) ) ( OBJ-AT ?auto_2922 ?auto_2925 ) ( TRUCK-AT ?auto_2924 ?auto_2919 ) ( OBJ-AT ?auto_2918 ?auto_2919 ) ( OBJ-AT ?auto_2920 ?auto_2919 ) ( OBJ-AT ?auto_2921 ?auto_2919 ) ( not ( = ?auto_2918 ?auto_2920 ) ) ( not ( = ?auto_2918 ?auto_2921 ) ) ( not ( = ?auto_2918 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( not ( = ?auto_2921 ?auto_2922 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2922 ?auto_2919 )
      ( DELIVER-4PKG-VERIFY ?auto_2918 ?auto_2920 ?auto_2921 ?auto_2922 ?auto_2919 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2931 - OBJ
      ?auto_2933 - OBJ
      ?auto_2934 - OBJ
      ?auto_2935 - OBJ
      ?auto_2932 - LOCATION
    )
    :vars
    (
      ?auto_2936 - LOCATION
      ?auto_2937 - CITY
      ?auto_2938 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2933 ?auto_2931 ) ( GREATER-THAN ?auto_2934 ?auto_2931 ) ( GREATER-THAN ?auto_2934 ?auto_2933 ) ( GREATER-THAN ?auto_2935 ?auto_2931 ) ( GREATER-THAN ?auto_2935 ?auto_2933 ) ( GREATER-THAN ?auto_2935 ?auto_2934 ) ( IN-CITY ?auto_2936 ?auto_2937 ) ( IN-CITY ?auto_2932 ?auto_2937 ) ( not ( = ?auto_2932 ?auto_2936 ) ) ( OBJ-AT ?auto_2935 ?auto_2936 ) ( TRUCK-AT ?auto_2938 ?auto_2932 ) ( OBJ-AT ?auto_2931 ?auto_2932 ) ( OBJ-AT ?auto_2933 ?auto_2932 ) ( not ( = ?auto_2931 ?auto_2933 ) ) ( not ( = ?auto_2931 ?auto_2934 ) ) ( not ( = ?auto_2931 ?auto_2935 ) ) ( not ( = ?auto_2933 ?auto_2934 ) ) ( not ( = ?auto_2933 ?auto_2935 ) ) ( not ( = ?auto_2934 ?auto_2935 ) ) ( IN-TRUCK ?auto_2934 ?auto_2938 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2934 ?auto_2932 )
      ( DELIVER-4PKG ?auto_2931 ?auto_2933 ?auto_2934 ?auto_2935 ?auto_2932 )
      ( DELIVER-4PKG-VERIFY ?auto_2931 ?auto_2933 ?auto_2934 ?auto_2935 ?auto_2932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2944 - OBJ
      ?auto_2946 - OBJ
      ?auto_2947 - OBJ
      ?auto_2948 - OBJ
      ?auto_2945 - LOCATION
    )
    :vars
    (
      ?auto_2951 - LOCATION
      ?auto_2949 - CITY
      ?auto_2950 - TRUCK
      ?auto_2952 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2946 ?auto_2944 ) ( GREATER-THAN ?auto_2947 ?auto_2944 ) ( GREATER-THAN ?auto_2947 ?auto_2946 ) ( GREATER-THAN ?auto_2948 ?auto_2944 ) ( GREATER-THAN ?auto_2948 ?auto_2946 ) ( GREATER-THAN ?auto_2948 ?auto_2947 ) ( IN-CITY ?auto_2951 ?auto_2949 ) ( IN-CITY ?auto_2945 ?auto_2949 ) ( not ( = ?auto_2945 ?auto_2951 ) ) ( OBJ-AT ?auto_2948 ?auto_2951 ) ( OBJ-AT ?auto_2944 ?auto_2945 ) ( OBJ-AT ?auto_2946 ?auto_2945 ) ( not ( = ?auto_2944 ?auto_2946 ) ) ( not ( = ?auto_2944 ?auto_2947 ) ) ( not ( = ?auto_2944 ?auto_2948 ) ) ( not ( = ?auto_2946 ?auto_2947 ) ) ( not ( = ?auto_2946 ?auto_2948 ) ) ( not ( = ?auto_2947 ?auto_2948 ) ) ( IN-TRUCK ?auto_2947 ?auto_2950 ) ( TRUCK-AT ?auto_2950 ?auto_2952 ) ( IN-CITY ?auto_2952 ?auto_2949 ) ( not ( = ?auto_2945 ?auto_2952 ) ) ( not ( = ?auto_2951 ?auto_2952 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2950 ?auto_2952 ?auto_2945 ?auto_2949 )
      ( DELIVER-4PKG ?auto_2944 ?auto_2946 ?auto_2947 ?auto_2948 ?auto_2945 )
      ( DELIVER-4PKG-VERIFY ?auto_2944 ?auto_2946 ?auto_2947 ?auto_2948 ?auto_2945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2958 - OBJ
      ?auto_2960 - OBJ
      ?auto_2961 - OBJ
      ?auto_2962 - OBJ
      ?auto_2959 - LOCATION
    )
    :vars
    (
      ?auto_2964 - LOCATION
      ?auto_2966 - CITY
      ?auto_2965 - TRUCK
      ?auto_2963 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2960 ?auto_2958 ) ( GREATER-THAN ?auto_2961 ?auto_2958 ) ( GREATER-THAN ?auto_2961 ?auto_2960 ) ( GREATER-THAN ?auto_2962 ?auto_2958 ) ( GREATER-THAN ?auto_2962 ?auto_2960 ) ( GREATER-THAN ?auto_2962 ?auto_2961 ) ( IN-CITY ?auto_2964 ?auto_2966 ) ( IN-CITY ?auto_2959 ?auto_2966 ) ( not ( = ?auto_2959 ?auto_2964 ) ) ( OBJ-AT ?auto_2962 ?auto_2964 ) ( OBJ-AT ?auto_2958 ?auto_2959 ) ( OBJ-AT ?auto_2960 ?auto_2959 ) ( not ( = ?auto_2958 ?auto_2960 ) ) ( not ( = ?auto_2958 ?auto_2961 ) ) ( not ( = ?auto_2958 ?auto_2962 ) ) ( not ( = ?auto_2960 ?auto_2961 ) ) ( not ( = ?auto_2960 ?auto_2962 ) ) ( not ( = ?auto_2961 ?auto_2962 ) ) ( TRUCK-AT ?auto_2965 ?auto_2963 ) ( IN-CITY ?auto_2963 ?auto_2966 ) ( not ( = ?auto_2959 ?auto_2963 ) ) ( not ( = ?auto_2964 ?auto_2963 ) ) ( OBJ-AT ?auto_2961 ?auto_2963 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2961 ?auto_2965 ?auto_2963 )
      ( DELIVER-4PKG ?auto_2958 ?auto_2960 ?auto_2961 ?auto_2962 ?auto_2959 )
      ( DELIVER-4PKG-VERIFY ?auto_2958 ?auto_2960 ?auto_2961 ?auto_2962 ?auto_2959 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2972 - OBJ
      ?auto_2974 - OBJ
      ?auto_2975 - OBJ
      ?auto_2976 - OBJ
      ?auto_2973 - LOCATION
    )
    :vars
    (
      ?auto_2980 - LOCATION
      ?auto_2979 - CITY
      ?auto_2978 - LOCATION
      ?auto_2977 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2974 ?auto_2972 ) ( GREATER-THAN ?auto_2975 ?auto_2972 ) ( GREATER-THAN ?auto_2975 ?auto_2974 ) ( GREATER-THAN ?auto_2976 ?auto_2972 ) ( GREATER-THAN ?auto_2976 ?auto_2974 ) ( GREATER-THAN ?auto_2976 ?auto_2975 ) ( IN-CITY ?auto_2980 ?auto_2979 ) ( IN-CITY ?auto_2973 ?auto_2979 ) ( not ( = ?auto_2973 ?auto_2980 ) ) ( OBJ-AT ?auto_2976 ?auto_2980 ) ( OBJ-AT ?auto_2972 ?auto_2973 ) ( OBJ-AT ?auto_2974 ?auto_2973 ) ( not ( = ?auto_2972 ?auto_2974 ) ) ( not ( = ?auto_2972 ?auto_2975 ) ) ( not ( = ?auto_2972 ?auto_2976 ) ) ( not ( = ?auto_2974 ?auto_2975 ) ) ( not ( = ?auto_2974 ?auto_2976 ) ) ( not ( = ?auto_2975 ?auto_2976 ) ) ( IN-CITY ?auto_2978 ?auto_2979 ) ( not ( = ?auto_2973 ?auto_2978 ) ) ( not ( = ?auto_2980 ?auto_2978 ) ) ( OBJ-AT ?auto_2975 ?auto_2978 ) ( TRUCK-AT ?auto_2977 ?auto_2973 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2977 ?auto_2973 ?auto_2978 ?auto_2979 )
      ( DELIVER-4PKG ?auto_2972 ?auto_2974 ?auto_2975 ?auto_2976 ?auto_2973 )
      ( DELIVER-4PKG-VERIFY ?auto_2972 ?auto_2974 ?auto_2975 ?auto_2976 ?auto_2973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2986 - OBJ
      ?auto_2988 - OBJ
      ?auto_2989 - OBJ
      ?auto_2990 - OBJ
      ?auto_2987 - LOCATION
    )
    :vars
    (
      ?auto_2993 - LOCATION
      ?auto_2994 - CITY
      ?auto_2992 - LOCATION
      ?auto_2991 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2988 ?auto_2986 ) ( GREATER-THAN ?auto_2989 ?auto_2986 ) ( GREATER-THAN ?auto_2989 ?auto_2988 ) ( GREATER-THAN ?auto_2990 ?auto_2986 ) ( GREATER-THAN ?auto_2990 ?auto_2988 ) ( GREATER-THAN ?auto_2990 ?auto_2989 ) ( IN-CITY ?auto_2993 ?auto_2994 ) ( IN-CITY ?auto_2987 ?auto_2994 ) ( not ( = ?auto_2987 ?auto_2993 ) ) ( OBJ-AT ?auto_2990 ?auto_2993 ) ( OBJ-AT ?auto_2986 ?auto_2987 ) ( not ( = ?auto_2986 ?auto_2988 ) ) ( not ( = ?auto_2986 ?auto_2989 ) ) ( not ( = ?auto_2986 ?auto_2990 ) ) ( not ( = ?auto_2988 ?auto_2989 ) ) ( not ( = ?auto_2988 ?auto_2990 ) ) ( not ( = ?auto_2989 ?auto_2990 ) ) ( IN-CITY ?auto_2992 ?auto_2994 ) ( not ( = ?auto_2987 ?auto_2992 ) ) ( not ( = ?auto_2993 ?auto_2992 ) ) ( OBJ-AT ?auto_2989 ?auto_2992 ) ( TRUCK-AT ?auto_2991 ?auto_2987 ) ( IN-TRUCK ?auto_2988 ?auto_2991 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2988 ?auto_2987 )
      ( DELIVER-4PKG ?auto_2986 ?auto_2988 ?auto_2989 ?auto_2990 ?auto_2987 )
      ( DELIVER-4PKG-VERIFY ?auto_2986 ?auto_2988 ?auto_2989 ?auto_2990 ?auto_2987 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3000 - OBJ
      ?auto_3002 - OBJ
      ?auto_3003 - OBJ
      ?auto_3004 - OBJ
      ?auto_3001 - LOCATION
    )
    :vars
    (
      ?auto_3008 - LOCATION
      ?auto_3005 - CITY
      ?auto_3006 - LOCATION
      ?auto_3007 - TRUCK
      ?auto_3009 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3002 ?auto_3000 ) ( GREATER-THAN ?auto_3003 ?auto_3000 ) ( GREATER-THAN ?auto_3003 ?auto_3002 ) ( GREATER-THAN ?auto_3004 ?auto_3000 ) ( GREATER-THAN ?auto_3004 ?auto_3002 ) ( GREATER-THAN ?auto_3004 ?auto_3003 ) ( IN-CITY ?auto_3008 ?auto_3005 ) ( IN-CITY ?auto_3001 ?auto_3005 ) ( not ( = ?auto_3001 ?auto_3008 ) ) ( OBJ-AT ?auto_3004 ?auto_3008 ) ( OBJ-AT ?auto_3000 ?auto_3001 ) ( not ( = ?auto_3000 ?auto_3002 ) ) ( not ( = ?auto_3000 ?auto_3003 ) ) ( not ( = ?auto_3000 ?auto_3004 ) ) ( not ( = ?auto_3002 ?auto_3003 ) ) ( not ( = ?auto_3002 ?auto_3004 ) ) ( not ( = ?auto_3003 ?auto_3004 ) ) ( IN-CITY ?auto_3006 ?auto_3005 ) ( not ( = ?auto_3001 ?auto_3006 ) ) ( not ( = ?auto_3008 ?auto_3006 ) ) ( OBJ-AT ?auto_3003 ?auto_3006 ) ( IN-TRUCK ?auto_3002 ?auto_3007 ) ( TRUCK-AT ?auto_3007 ?auto_3009 ) ( IN-CITY ?auto_3009 ?auto_3005 ) ( not ( = ?auto_3001 ?auto_3009 ) ) ( not ( = ?auto_3008 ?auto_3009 ) ) ( not ( = ?auto_3006 ?auto_3009 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3007 ?auto_3009 ?auto_3001 ?auto_3005 )
      ( DELIVER-4PKG ?auto_3000 ?auto_3002 ?auto_3003 ?auto_3004 ?auto_3001 )
      ( DELIVER-4PKG-VERIFY ?auto_3000 ?auto_3002 ?auto_3003 ?auto_3004 ?auto_3001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3015 - OBJ
      ?auto_3017 - OBJ
      ?auto_3018 - OBJ
      ?auto_3019 - OBJ
      ?auto_3016 - LOCATION
    )
    :vars
    (
      ?auto_3023 - LOCATION
      ?auto_3024 - CITY
      ?auto_3022 - LOCATION
      ?auto_3021 - TRUCK
      ?auto_3020 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3017 ?auto_3015 ) ( GREATER-THAN ?auto_3018 ?auto_3015 ) ( GREATER-THAN ?auto_3018 ?auto_3017 ) ( GREATER-THAN ?auto_3019 ?auto_3015 ) ( GREATER-THAN ?auto_3019 ?auto_3017 ) ( GREATER-THAN ?auto_3019 ?auto_3018 ) ( IN-CITY ?auto_3023 ?auto_3024 ) ( IN-CITY ?auto_3016 ?auto_3024 ) ( not ( = ?auto_3016 ?auto_3023 ) ) ( OBJ-AT ?auto_3019 ?auto_3023 ) ( OBJ-AT ?auto_3015 ?auto_3016 ) ( not ( = ?auto_3015 ?auto_3017 ) ) ( not ( = ?auto_3015 ?auto_3018 ) ) ( not ( = ?auto_3015 ?auto_3019 ) ) ( not ( = ?auto_3017 ?auto_3018 ) ) ( not ( = ?auto_3017 ?auto_3019 ) ) ( not ( = ?auto_3018 ?auto_3019 ) ) ( IN-CITY ?auto_3022 ?auto_3024 ) ( not ( = ?auto_3016 ?auto_3022 ) ) ( not ( = ?auto_3023 ?auto_3022 ) ) ( OBJ-AT ?auto_3018 ?auto_3022 ) ( TRUCK-AT ?auto_3021 ?auto_3020 ) ( IN-CITY ?auto_3020 ?auto_3024 ) ( not ( = ?auto_3016 ?auto_3020 ) ) ( not ( = ?auto_3023 ?auto_3020 ) ) ( not ( = ?auto_3022 ?auto_3020 ) ) ( OBJ-AT ?auto_3017 ?auto_3020 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3017 ?auto_3021 ?auto_3020 )
      ( DELIVER-4PKG ?auto_3015 ?auto_3017 ?auto_3018 ?auto_3019 ?auto_3016 )
      ( DELIVER-4PKG-VERIFY ?auto_3015 ?auto_3017 ?auto_3018 ?auto_3019 ?auto_3016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3030 - OBJ
      ?auto_3032 - OBJ
      ?auto_3033 - OBJ
      ?auto_3034 - OBJ
      ?auto_3031 - LOCATION
    )
    :vars
    (
      ?auto_3035 - LOCATION
      ?auto_3036 - CITY
      ?auto_3038 - LOCATION
      ?auto_3039 - LOCATION
      ?auto_3037 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3032 ?auto_3030 ) ( GREATER-THAN ?auto_3033 ?auto_3030 ) ( GREATER-THAN ?auto_3033 ?auto_3032 ) ( GREATER-THAN ?auto_3034 ?auto_3030 ) ( GREATER-THAN ?auto_3034 ?auto_3032 ) ( GREATER-THAN ?auto_3034 ?auto_3033 ) ( IN-CITY ?auto_3035 ?auto_3036 ) ( IN-CITY ?auto_3031 ?auto_3036 ) ( not ( = ?auto_3031 ?auto_3035 ) ) ( OBJ-AT ?auto_3034 ?auto_3035 ) ( OBJ-AT ?auto_3030 ?auto_3031 ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( not ( = ?auto_3030 ?auto_3033 ) ) ( not ( = ?auto_3030 ?auto_3034 ) ) ( not ( = ?auto_3032 ?auto_3033 ) ) ( not ( = ?auto_3032 ?auto_3034 ) ) ( not ( = ?auto_3033 ?auto_3034 ) ) ( IN-CITY ?auto_3038 ?auto_3036 ) ( not ( = ?auto_3031 ?auto_3038 ) ) ( not ( = ?auto_3035 ?auto_3038 ) ) ( OBJ-AT ?auto_3033 ?auto_3038 ) ( IN-CITY ?auto_3039 ?auto_3036 ) ( not ( = ?auto_3031 ?auto_3039 ) ) ( not ( = ?auto_3035 ?auto_3039 ) ) ( not ( = ?auto_3038 ?auto_3039 ) ) ( OBJ-AT ?auto_3032 ?auto_3039 ) ( TRUCK-AT ?auto_3037 ?auto_3031 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3037 ?auto_3031 ?auto_3039 ?auto_3036 )
      ( DELIVER-4PKG ?auto_3030 ?auto_3032 ?auto_3033 ?auto_3034 ?auto_3031 )
      ( DELIVER-4PKG-VERIFY ?auto_3030 ?auto_3032 ?auto_3033 ?auto_3034 ?auto_3031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3045 - OBJ
      ?auto_3047 - OBJ
      ?auto_3048 - OBJ
      ?auto_3049 - OBJ
      ?auto_3046 - LOCATION
    )
    :vars
    (
      ?auto_3054 - LOCATION
      ?auto_3050 - CITY
      ?auto_3051 - LOCATION
      ?auto_3052 - LOCATION
      ?auto_3053 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3047 ?auto_3045 ) ( GREATER-THAN ?auto_3048 ?auto_3045 ) ( GREATER-THAN ?auto_3048 ?auto_3047 ) ( GREATER-THAN ?auto_3049 ?auto_3045 ) ( GREATER-THAN ?auto_3049 ?auto_3047 ) ( GREATER-THAN ?auto_3049 ?auto_3048 ) ( IN-CITY ?auto_3054 ?auto_3050 ) ( IN-CITY ?auto_3046 ?auto_3050 ) ( not ( = ?auto_3046 ?auto_3054 ) ) ( OBJ-AT ?auto_3049 ?auto_3054 ) ( not ( = ?auto_3045 ?auto_3047 ) ) ( not ( = ?auto_3045 ?auto_3048 ) ) ( not ( = ?auto_3045 ?auto_3049 ) ) ( not ( = ?auto_3047 ?auto_3048 ) ) ( not ( = ?auto_3047 ?auto_3049 ) ) ( not ( = ?auto_3048 ?auto_3049 ) ) ( IN-CITY ?auto_3051 ?auto_3050 ) ( not ( = ?auto_3046 ?auto_3051 ) ) ( not ( = ?auto_3054 ?auto_3051 ) ) ( OBJ-AT ?auto_3048 ?auto_3051 ) ( IN-CITY ?auto_3052 ?auto_3050 ) ( not ( = ?auto_3046 ?auto_3052 ) ) ( not ( = ?auto_3054 ?auto_3052 ) ) ( not ( = ?auto_3051 ?auto_3052 ) ) ( OBJ-AT ?auto_3047 ?auto_3052 ) ( TRUCK-AT ?auto_3053 ?auto_3046 ) ( IN-TRUCK ?auto_3045 ?auto_3053 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3045 ?auto_3046 )
      ( DELIVER-4PKG ?auto_3045 ?auto_3047 ?auto_3048 ?auto_3049 ?auto_3046 )
      ( DELIVER-4PKG-VERIFY ?auto_3045 ?auto_3047 ?auto_3048 ?auto_3049 ?auto_3046 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3060 - OBJ
      ?auto_3062 - OBJ
      ?auto_3063 - OBJ
      ?auto_3064 - OBJ
      ?auto_3061 - LOCATION
    )
    :vars
    (
      ?auto_3069 - LOCATION
      ?auto_3068 - CITY
      ?auto_3066 - LOCATION
      ?auto_3065 - LOCATION
      ?auto_3067 - TRUCK
      ?auto_3070 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3062 ?auto_3060 ) ( GREATER-THAN ?auto_3063 ?auto_3060 ) ( GREATER-THAN ?auto_3063 ?auto_3062 ) ( GREATER-THAN ?auto_3064 ?auto_3060 ) ( GREATER-THAN ?auto_3064 ?auto_3062 ) ( GREATER-THAN ?auto_3064 ?auto_3063 ) ( IN-CITY ?auto_3069 ?auto_3068 ) ( IN-CITY ?auto_3061 ?auto_3068 ) ( not ( = ?auto_3061 ?auto_3069 ) ) ( OBJ-AT ?auto_3064 ?auto_3069 ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( not ( = ?auto_3060 ?auto_3063 ) ) ( not ( = ?auto_3060 ?auto_3064 ) ) ( not ( = ?auto_3062 ?auto_3063 ) ) ( not ( = ?auto_3062 ?auto_3064 ) ) ( not ( = ?auto_3063 ?auto_3064 ) ) ( IN-CITY ?auto_3066 ?auto_3068 ) ( not ( = ?auto_3061 ?auto_3066 ) ) ( not ( = ?auto_3069 ?auto_3066 ) ) ( OBJ-AT ?auto_3063 ?auto_3066 ) ( IN-CITY ?auto_3065 ?auto_3068 ) ( not ( = ?auto_3061 ?auto_3065 ) ) ( not ( = ?auto_3069 ?auto_3065 ) ) ( not ( = ?auto_3066 ?auto_3065 ) ) ( OBJ-AT ?auto_3062 ?auto_3065 ) ( IN-TRUCK ?auto_3060 ?auto_3067 ) ( TRUCK-AT ?auto_3067 ?auto_3070 ) ( IN-CITY ?auto_3070 ?auto_3068 ) ( not ( = ?auto_3061 ?auto_3070 ) ) ( not ( = ?auto_3069 ?auto_3070 ) ) ( not ( = ?auto_3066 ?auto_3070 ) ) ( not ( = ?auto_3065 ?auto_3070 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3067 ?auto_3070 ?auto_3061 ?auto_3068 )
      ( DELIVER-4PKG ?auto_3060 ?auto_3062 ?auto_3063 ?auto_3064 ?auto_3061 )
      ( DELIVER-4PKG-VERIFY ?auto_3060 ?auto_3062 ?auto_3063 ?auto_3064 ?auto_3061 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3076 - OBJ
      ?auto_3078 - OBJ
      ?auto_3079 - OBJ
      ?auto_3080 - OBJ
      ?auto_3077 - LOCATION
    )
    :vars
    (
      ?auto_3086 - LOCATION
      ?auto_3085 - CITY
      ?auto_3081 - LOCATION
      ?auto_3083 - LOCATION
      ?auto_3082 - TRUCK
      ?auto_3084 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3078 ?auto_3076 ) ( GREATER-THAN ?auto_3079 ?auto_3076 ) ( GREATER-THAN ?auto_3079 ?auto_3078 ) ( GREATER-THAN ?auto_3080 ?auto_3076 ) ( GREATER-THAN ?auto_3080 ?auto_3078 ) ( GREATER-THAN ?auto_3080 ?auto_3079 ) ( IN-CITY ?auto_3086 ?auto_3085 ) ( IN-CITY ?auto_3077 ?auto_3085 ) ( not ( = ?auto_3077 ?auto_3086 ) ) ( OBJ-AT ?auto_3080 ?auto_3086 ) ( not ( = ?auto_3076 ?auto_3078 ) ) ( not ( = ?auto_3076 ?auto_3079 ) ) ( not ( = ?auto_3076 ?auto_3080 ) ) ( not ( = ?auto_3078 ?auto_3079 ) ) ( not ( = ?auto_3078 ?auto_3080 ) ) ( not ( = ?auto_3079 ?auto_3080 ) ) ( IN-CITY ?auto_3081 ?auto_3085 ) ( not ( = ?auto_3077 ?auto_3081 ) ) ( not ( = ?auto_3086 ?auto_3081 ) ) ( OBJ-AT ?auto_3079 ?auto_3081 ) ( IN-CITY ?auto_3083 ?auto_3085 ) ( not ( = ?auto_3077 ?auto_3083 ) ) ( not ( = ?auto_3086 ?auto_3083 ) ) ( not ( = ?auto_3081 ?auto_3083 ) ) ( OBJ-AT ?auto_3078 ?auto_3083 ) ( TRUCK-AT ?auto_3082 ?auto_3084 ) ( IN-CITY ?auto_3084 ?auto_3085 ) ( not ( = ?auto_3077 ?auto_3084 ) ) ( not ( = ?auto_3086 ?auto_3084 ) ) ( not ( = ?auto_3081 ?auto_3084 ) ) ( not ( = ?auto_3083 ?auto_3084 ) ) ( OBJ-AT ?auto_3076 ?auto_3084 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3076 ?auto_3082 ?auto_3084 )
      ( DELIVER-4PKG ?auto_3076 ?auto_3078 ?auto_3079 ?auto_3080 ?auto_3077 )
      ( DELIVER-4PKG-VERIFY ?auto_3076 ?auto_3078 ?auto_3079 ?auto_3080 ?auto_3077 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3092 - OBJ
      ?auto_3094 - OBJ
      ?auto_3095 - OBJ
      ?auto_3096 - OBJ
      ?auto_3093 - LOCATION
    )
    :vars
    (
      ?auto_3099 - LOCATION
      ?auto_3100 - CITY
      ?auto_3101 - LOCATION
      ?auto_3098 - LOCATION
      ?auto_3097 - LOCATION
      ?auto_3102 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3094 ?auto_3092 ) ( GREATER-THAN ?auto_3095 ?auto_3092 ) ( GREATER-THAN ?auto_3095 ?auto_3094 ) ( GREATER-THAN ?auto_3096 ?auto_3092 ) ( GREATER-THAN ?auto_3096 ?auto_3094 ) ( GREATER-THAN ?auto_3096 ?auto_3095 ) ( IN-CITY ?auto_3099 ?auto_3100 ) ( IN-CITY ?auto_3093 ?auto_3100 ) ( not ( = ?auto_3093 ?auto_3099 ) ) ( OBJ-AT ?auto_3096 ?auto_3099 ) ( not ( = ?auto_3092 ?auto_3094 ) ) ( not ( = ?auto_3092 ?auto_3095 ) ) ( not ( = ?auto_3092 ?auto_3096 ) ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3096 ) ) ( not ( = ?auto_3095 ?auto_3096 ) ) ( IN-CITY ?auto_3101 ?auto_3100 ) ( not ( = ?auto_3093 ?auto_3101 ) ) ( not ( = ?auto_3099 ?auto_3101 ) ) ( OBJ-AT ?auto_3095 ?auto_3101 ) ( IN-CITY ?auto_3098 ?auto_3100 ) ( not ( = ?auto_3093 ?auto_3098 ) ) ( not ( = ?auto_3099 ?auto_3098 ) ) ( not ( = ?auto_3101 ?auto_3098 ) ) ( OBJ-AT ?auto_3094 ?auto_3098 ) ( IN-CITY ?auto_3097 ?auto_3100 ) ( not ( = ?auto_3093 ?auto_3097 ) ) ( not ( = ?auto_3099 ?auto_3097 ) ) ( not ( = ?auto_3101 ?auto_3097 ) ) ( not ( = ?auto_3098 ?auto_3097 ) ) ( OBJ-AT ?auto_3092 ?auto_3097 ) ( TRUCK-AT ?auto_3102 ?auto_3093 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3102 ?auto_3093 ?auto_3097 ?auto_3100 )
      ( DELIVER-4PKG ?auto_3092 ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3093 )
      ( DELIVER-4PKG-VERIFY ?auto_3092 ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3093 ) )
  )

)

