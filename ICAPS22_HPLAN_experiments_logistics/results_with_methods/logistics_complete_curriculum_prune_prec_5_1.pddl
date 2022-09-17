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
      ?auto_5608 - OBJ
      ?auto_5609 - LOCATION
    )
    :vars
    (
      ?auto_5610 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5610 ?auto_5609 ) ( IN-TRUCK ?auto_5608 ?auto_5610 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_5608 ?auto_5610 ?auto_5609 )
      ( DELIVER-1PKG-VERIFY ?auto_5608 ?auto_5609 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5613 - OBJ
      ?auto_5614 - LOCATION
    )
    :vars
    (
      ?auto_5615 - TRUCK
      ?auto_5616 - LOCATION
      ?auto_5617 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5613 ?auto_5615 ) ( TRUCK-AT ?auto_5615 ?auto_5616 ) ( IN-CITY ?auto_5616 ?auto_5617 ) ( IN-CITY ?auto_5614 ?auto_5617 ) ( not ( = ?auto_5614 ?auto_5616 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5615 ?auto_5616 ?auto_5614 ?auto_5617 )
      ( DELIVER-1PKG ?auto_5613 ?auto_5614 )
      ( DELIVER-1PKG-VERIFY ?auto_5613 ?auto_5614 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5620 - OBJ
      ?auto_5621 - LOCATION
    )
    :vars
    (
      ?auto_5622 - TRUCK
      ?auto_5623 - LOCATION
      ?auto_5624 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5622 ?auto_5623 ) ( IN-CITY ?auto_5623 ?auto_5624 ) ( IN-CITY ?auto_5621 ?auto_5624 ) ( not ( = ?auto_5621 ?auto_5623 ) ) ( OBJ-AT ?auto_5620 ?auto_5623 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5620 ?auto_5622 ?auto_5623 )
      ( DELIVER-1PKG ?auto_5620 ?auto_5621 )
      ( DELIVER-1PKG-VERIFY ?auto_5620 ?auto_5621 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5627 - OBJ
      ?auto_5628 - LOCATION
    )
    :vars
    (
      ?auto_5631 - LOCATION
      ?auto_5630 - CITY
      ?auto_5629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5631 ?auto_5630 ) ( IN-CITY ?auto_5628 ?auto_5630 ) ( not ( = ?auto_5628 ?auto_5631 ) ) ( OBJ-AT ?auto_5627 ?auto_5631 ) ( TRUCK-AT ?auto_5629 ?auto_5628 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5629 ?auto_5628 ?auto_5631 ?auto_5630 )
      ( DELIVER-1PKG ?auto_5627 ?auto_5628 )
      ( DELIVER-1PKG-VERIFY ?auto_5627 ?auto_5628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5661 - OBJ
      ?auto_5663 - OBJ
      ?auto_5662 - LOCATION
    )
    :vars
    (
      ?auto_5664 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5663 ?auto_5661 ) ( TRUCK-AT ?auto_5664 ?auto_5662 ) ( IN-TRUCK ?auto_5663 ?auto_5664 ) ( OBJ-AT ?auto_5661 ?auto_5662 ) ( not ( = ?auto_5661 ?auto_5663 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5663 ?auto_5662 )
      ( DELIVER-2PKG-VERIFY ?auto_5661 ?auto_5663 ?auto_5662 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5668 - OBJ
      ?auto_5670 - OBJ
      ?auto_5669 - LOCATION
    )
    :vars
    (
      ?auto_5673 - TRUCK
      ?auto_5671 - LOCATION
      ?auto_5672 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5670 ?auto_5668 ) ( IN-TRUCK ?auto_5670 ?auto_5673 ) ( TRUCK-AT ?auto_5673 ?auto_5671 ) ( IN-CITY ?auto_5671 ?auto_5672 ) ( IN-CITY ?auto_5669 ?auto_5672 ) ( not ( = ?auto_5669 ?auto_5671 ) ) ( OBJ-AT ?auto_5668 ?auto_5669 ) ( not ( = ?auto_5668 ?auto_5670 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5670 ?auto_5669 )
      ( DELIVER-2PKG-VERIFY ?auto_5668 ?auto_5670 ?auto_5669 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5677 - OBJ
      ?auto_5679 - OBJ
      ?auto_5678 - LOCATION
    )
    :vars
    (
      ?auto_5681 - TRUCK
      ?auto_5680 - LOCATION
      ?auto_5682 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5679 ?auto_5677 ) ( TRUCK-AT ?auto_5681 ?auto_5680 ) ( IN-CITY ?auto_5680 ?auto_5682 ) ( IN-CITY ?auto_5678 ?auto_5682 ) ( not ( = ?auto_5678 ?auto_5680 ) ) ( OBJ-AT ?auto_5679 ?auto_5680 ) ( OBJ-AT ?auto_5677 ?auto_5678 ) ( not ( = ?auto_5677 ?auto_5679 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5679 ?auto_5678 )
      ( DELIVER-2PKG-VERIFY ?auto_5677 ?auto_5679 ?auto_5678 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5686 - OBJ
      ?auto_5688 - OBJ
      ?auto_5687 - LOCATION
    )
    :vars
    (
      ?auto_5691 - LOCATION
      ?auto_5690 - CITY
      ?auto_5689 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5688 ?auto_5686 ) ( IN-CITY ?auto_5691 ?auto_5690 ) ( IN-CITY ?auto_5687 ?auto_5690 ) ( not ( = ?auto_5687 ?auto_5691 ) ) ( OBJ-AT ?auto_5688 ?auto_5691 ) ( TRUCK-AT ?auto_5689 ?auto_5687 ) ( OBJ-AT ?auto_5686 ?auto_5687 ) ( not ( = ?auto_5686 ?auto_5688 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5688 ?auto_5687 )
      ( DELIVER-2PKG-VERIFY ?auto_5686 ?auto_5688 ?auto_5687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5695 - OBJ
      ?auto_5697 - OBJ
      ?auto_5696 - LOCATION
    )
    :vars
    (
      ?auto_5699 - LOCATION
      ?auto_5698 - CITY
      ?auto_5700 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5697 ?auto_5695 ) ( IN-CITY ?auto_5699 ?auto_5698 ) ( IN-CITY ?auto_5696 ?auto_5698 ) ( not ( = ?auto_5696 ?auto_5699 ) ) ( OBJ-AT ?auto_5697 ?auto_5699 ) ( TRUCK-AT ?auto_5700 ?auto_5696 ) ( not ( = ?auto_5695 ?auto_5697 ) ) ( IN-TRUCK ?auto_5695 ?auto_5700 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5695 ?auto_5696 )
      ( DELIVER-2PKG ?auto_5695 ?auto_5697 ?auto_5696 )
      ( DELIVER-2PKG-VERIFY ?auto_5695 ?auto_5697 ?auto_5696 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5704 - OBJ
      ?auto_5706 - OBJ
      ?auto_5705 - LOCATION
    )
    :vars
    (
      ?auto_5709 - LOCATION
      ?auto_5708 - CITY
      ?auto_5707 - TRUCK
      ?auto_5710 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5706 ?auto_5704 ) ( IN-CITY ?auto_5709 ?auto_5708 ) ( IN-CITY ?auto_5705 ?auto_5708 ) ( not ( = ?auto_5705 ?auto_5709 ) ) ( OBJ-AT ?auto_5706 ?auto_5709 ) ( not ( = ?auto_5704 ?auto_5706 ) ) ( IN-TRUCK ?auto_5704 ?auto_5707 ) ( TRUCK-AT ?auto_5707 ?auto_5710 ) ( IN-CITY ?auto_5710 ?auto_5708 ) ( not ( = ?auto_5705 ?auto_5710 ) ) ( not ( = ?auto_5709 ?auto_5710 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5707 ?auto_5710 ?auto_5705 ?auto_5708 )
      ( DELIVER-2PKG ?auto_5704 ?auto_5706 ?auto_5705 )
      ( DELIVER-2PKG-VERIFY ?auto_5704 ?auto_5706 ?auto_5705 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5714 - OBJ
      ?auto_5716 - OBJ
      ?auto_5715 - LOCATION
    )
    :vars
    (
      ?auto_5719 - LOCATION
      ?auto_5717 - CITY
      ?auto_5718 - TRUCK
      ?auto_5720 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5716 ?auto_5714 ) ( IN-CITY ?auto_5719 ?auto_5717 ) ( IN-CITY ?auto_5715 ?auto_5717 ) ( not ( = ?auto_5715 ?auto_5719 ) ) ( OBJ-AT ?auto_5716 ?auto_5719 ) ( not ( = ?auto_5714 ?auto_5716 ) ) ( TRUCK-AT ?auto_5718 ?auto_5720 ) ( IN-CITY ?auto_5720 ?auto_5717 ) ( not ( = ?auto_5715 ?auto_5720 ) ) ( not ( = ?auto_5719 ?auto_5720 ) ) ( OBJ-AT ?auto_5714 ?auto_5720 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5714 ?auto_5718 ?auto_5720 )
      ( DELIVER-2PKG ?auto_5714 ?auto_5716 ?auto_5715 )
      ( DELIVER-2PKG-VERIFY ?auto_5714 ?auto_5716 ?auto_5715 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5724 - OBJ
      ?auto_5726 - OBJ
      ?auto_5725 - LOCATION
    )
    :vars
    (
      ?auto_5728 - LOCATION
      ?auto_5730 - CITY
      ?auto_5727 - LOCATION
      ?auto_5729 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5726 ?auto_5724 ) ( IN-CITY ?auto_5728 ?auto_5730 ) ( IN-CITY ?auto_5725 ?auto_5730 ) ( not ( = ?auto_5725 ?auto_5728 ) ) ( OBJ-AT ?auto_5726 ?auto_5728 ) ( not ( = ?auto_5724 ?auto_5726 ) ) ( IN-CITY ?auto_5727 ?auto_5730 ) ( not ( = ?auto_5725 ?auto_5727 ) ) ( not ( = ?auto_5728 ?auto_5727 ) ) ( OBJ-AT ?auto_5724 ?auto_5727 ) ( TRUCK-AT ?auto_5729 ?auto_5725 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5729 ?auto_5725 ?auto_5727 ?auto_5730 )
      ( DELIVER-2PKG ?auto_5724 ?auto_5726 ?auto_5725 )
      ( DELIVER-2PKG-VERIFY ?auto_5724 ?auto_5726 ?auto_5725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5761 - OBJ
      ?auto_5763 - OBJ
      ?auto_5764 - OBJ
      ?auto_5762 - LOCATION
    )
    :vars
    (
      ?auto_5765 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5763 ?auto_5761 ) ( GREATER-THAN ?auto_5764 ?auto_5761 ) ( GREATER-THAN ?auto_5764 ?auto_5763 ) ( TRUCK-AT ?auto_5765 ?auto_5762 ) ( IN-TRUCK ?auto_5764 ?auto_5765 ) ( OBJ-AT ?auto_5761 ?auto_5762 ) ( OBJ-AT ?auto_5763 ?auto_5762 ) ( not ( = ?auto_5761 ?auto_5763 ) ) ( not ( = ?auto_5761 ?auto_5764 ) ) ( not ( = ?auto_5763 ?auto_5764 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5764 ?auto_5762 )
      ( DELIVER-3PKG-VERIFY ?auto_5761 ?auto_5763 ?auto_5764 ?auto_5762 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5770 - OBJ
      ?auto_5772 - OBJ
      ?auto_5773 - OBJ
      ?auto_5771 - LOCATION
    )
    :vars
    (
      ?auto_5776 - TRUCK
      ?auto_5774 - LOCATION
      ?auto_5775 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5772 ?auto_5770 ) ( GREATER-THAN ?auto_5773 ?auto_5770 ) ( GREATER-THAN ?auto_5773 ?auto_5772 ) ( IN-TRUCK ?auto_5773 ?auto_5776 ) ( TRUCK-AT ?auto_5776 ?auto_5774 ) ( IN-CITY ?auto_5774 ?auto_5775 ) ( IN-CITY ?auto_5771 ?auto_5775 ) ( not ( = ?auto_5771 ?auto_5774 ) ) ( OBJ-AT ?auto_5770 ?auto_5771 ) ( OBJ-AT ?auto_5772 ?auto_5771 ) ( not ( = ?auto_5770 ?auto_5772 ) ) ( not ( = ?auto_5770 ?auto_5773 ) ) ( not ( = ?auto_5772 ?auto_5773 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5773 ?auto_5771 )
      ( DELIVER-3PKG-VERIFY ?auto_5770 ?auto_5772 ?auto_5773 ?auto_5771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5781 - OBJ
      ?auto_5783 - OBJ
      ?auto_5784 - OBJ
      ?auto_5782 - LOCATION
    )
    :vars
    (
      ?auto_5785 - TRUCK
      ?auto_5786 - LOCATION
      ?auto_5787 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5783 ?auto_5781 ) ( GREATER-THAN ?auto_5784 ?auto_5781 ) ( GREATER-THAN ?auto_5784 ?auto_5783 ) ( TRUCK-AT ?auto_5785 ?auto_5786 ) ( IN-CITY ?auto_5786 ?auto_5787 ) ( IN-CITY ?auto_5782 ?auto_5787 ) ( not ( = ?auto_5782 ?auto_5786 ) ) ( OBJ-AT ?auto_5784 ?auto_5786 ) ( OBJ-AT ?auto_5781 ?auto_5782 ) ( OBJ-AT ?auto_5783 ?auto_5782 ) ( not ( = ?auto_5781 ?auto_5783 ) ) ( not ( = ?auto_5781 ?auto_5784 ) ) ( not ( = ?auto_5783 ?auto_5784 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5784 ?auto_5782 )
      ( DELIVER-3PKG-VERIFY ?auto_5781 ?auto_5783 ?auto_5784 ?auto_5782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5792 - OBJ
      ?auto_5794 - OBJ
      ?auto_5795 - OBJ
      ?auto_5793 - LOCATION
    )
    :vars
    (
      ?auto_5797 - LOCATION
      ?auto_5796 - CITY
      ?auto_5798 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5794 ?auto_5792 ) ( GREATER-THAN ?auto_5795 ?auto_5792 ) ( GREATER-THAN ?auto_5795 ?auto_5794 ) ( IN-CITY ?auto_5797 ?auto_5796 ) ( IN-CITY ?auto_5793 ?auto_5796 ) ( not ( = ?auto_5793 ?auto_5797 ) ) ( OBJ-AT ?auto_5795 ?auto_5797 ) ( TRUCK-AT ?auto_5798 ?auto_5793 ) ( OBJ-AT ?auto_5792 ?auto_5793 ) ( OBJ-AT ?auto_5794 ?auto_5793 ) ( not ( = ?auto_5792 ?auto_5794 ) ) ( not ( = ?auto_5792 ?auto_5795 ) ) ( not ( = ?auto_5794 ?auto_5795 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5795 ?auto_5793 )
      ( DELIVER-3PKG-VERIFY ?auto_5792 ?auto_5794 ?auto_5795 ?auto_5793 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5803 - OBJ
      ?auto_5805 - OBJ
      ?auto_5806 - OBJ
      ?auto_5804 - LOCATION
    )
    :vars
    (
      ?auto_5807 - LOCATION
      ?auto_5808 - CITY
      ?auto_5809 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5805 ?auto_5803 ) ( GREATER-THAN ?auto_5806 ?auto_5803 ) ( GREATER-THAN ?auto_5806 ?auto_5805 ) ( IN-CITY ?auto_5807 ?auto_5808 ) ( IN-CITY ?auto_5804 ?auto_5808 ) ( not ( = ?auto_5804 ?auto_5807 ) ) ( OBJ-AT ?auto_5806 ?auto_5807 ) ( TRUCK-AT ?auto_5809 ?auto_5804 ) ( OBJ-AT ?auto_5803 ?auto_5804 ) ( not ( = ?auto_5803 ?auto_5805 ) ) ( not ( = ?auto_5803 ?auto_5806 ) ) ( not ( = ?auto_5805 ?auto_5806 ) ) ( IN-TRUCK ?auto_5805 ?auto_5809 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5805 ?auto_5804 )
      ( DELIVER-3PKG ?auto_5803 ?auto_5805 ?auto_5806 ?auto_5804 )
      ( DELIVER-3PKG-VERIFY ?auto_5803 ?auto_5805 ?auto_5806 ?auto_5804 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5814 - OBJ
      ?auto_5816 - OBJ
      ?auto_5817 - OBJ
      ?auto_5815 - LOCATION
    )
    :vars
    (
      ?auto_5818 - LOCATION
      ?auto_5820 - CITY
      ?auto_5819 - TRUCK
      ?auto_5821 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5816 ?auto_5814 ) ( GREATER-THAN ?auto_5817 ?auto_5814 ) ( GREATER-THAN ?auto_5817 ?auto_5816 ) ( IN-CITY ?auto_5818 ?auto_5820 ) ( IN-CITY ?auto_5815 ?auto_5820 ) ( not ( = ?auto_5815 ?auto_5818 ) ) ( OBJ-AT ?auto_5817 ?auto_5818 ) ( OBJ-AT ?auto_5814 ?auto_5815 ) ( not ( = ?auto_5814 ?auto_5816 ) ) ( not ( = ?auto_5814 ?auto_5817 ) ) ( not ( = ?auto_5816 ?auto_5817 ) ) ( IN-TRUCK ?auto_5816 ?auto_5819 ) ( TRUCK-AT ?auto_5819 ?auto_5821 ) ( IN-CITY ?auto_5821 ?auto_5820 ) ( not ( = ?auto_5815 ?auto_5821 ) ) ( not ( = ?auto_5818 ?auto_5821 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5819 ?auto_5821 ?auto_5815 ?auto_5820 )
      ( DELIVER-3PKG ?auto_5814 ?auto_5816 ?auto_5817 ?auto_5815 )
      ( DELIVER-3PKG-VERIFY ?auto_5814 ?auto_5816 ?auto_5817 ?auto_5815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5826 - OBJ
      ?auto_5828 - OBJ
      ?auto_5829 - OBJ
      ?auto_5827 - LOCATION
    )
    :vars
    (
      ?auto_5832 - LOCATION
      ?auto_5833 - CITY
      ?auto_5830 - TRUCK
      ?auto_5831 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5828 ?auto_5826 ) ( GREATER-THAN ?auto_5829 ?auto_5826 ) ( GREATER-THAN ?auto_5829 ?auto_5828 ) ( IN-CITY ?auto_5832 ?auto_5833 ) ( IN-CITY ?auto_5827 ?auto_5833 ) ( not ( = ?auto_5827 ?auto_5832 ) ) ( OBJ-AT ?auto_5829 ?auto_5832 ) ( OBJ-AT ?auto_5826 ?auto_5827 ) ( not ( = ?auto_5826 ?auto_5828 ) ) ( not ( = ?auto_5826 ?auto_5829 ) ) ( not ( = ?auto_5828 ?auto_5829 ) ) ( TRUCK-AT ?auto_5830 ?auto_5831 ) ( IN-CITY ?auto_5831 ?auto_5833 ) ( not ( = ?auto_5827 ?auto_5831 ) ) ( not ( = ?auto_5832 ?auto_5831 ) ) ( OBJ-AT ?auto_5828 ?auto_5831 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5828 ?auto_5830 ?auto_5831 )
      ( DELIVER-3PKG ?auto_5826 ?auto_5828 ?auto_5829 ?auto_5827 )
      ( DELIVER-3PKG-VERIFY ?auto_5826 ?auto_5828 ?auto_5829 ?auto_5827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5838 - OBJ
      ?auto_5840 - OBJ
      ?auto_5841 - OBJ
      ?auto_5839 - LOCATION
    )
    :vars
    (
      ?auto_5845 - LOCATION
      ?auto_5844 - CITY
      ?auto_5843 - LOCATION
      ?auto_5842 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5840 ?auto_5838 ) ( GREATER-THAN ?auto_5841 ?auto_5838 ) ( GREATER-THAN ?auto_5841 ?auto_5840 ) ( IN-CITY ?auto_5845 ?auto_5844 ) ( IN-CITY ?auto_5839 ?auto_5844 ) ( not ( = ?auto_5839 ?auto_5845 ) ) ( OBJ-AT ?auto_5841 ?auto_5845 ) ( OBJ-AT ?auto_5838 ?auto_5839 ) ( not ( = ?auto_5838 ?auto_5840 ) ) ( not ( = ?auto_5838 ?auto_5841 ) ) ( not ( = ?auto_5840 ?auto_5841 ) ) ( IN-CITY ?auto_5843 ?auto_5844 ) ( not ( = ?auto_5839 ?auto_5843 ) ) ( not ( = ?auto_5845 ?auto_5843 ) ) ( OBJ-AT ?auto_5840 ?auto_5843 ) ( TRUCK-AT ?auto_5842 ?auto_5839 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5842 ?auto_5839 ?auto_5843 ?auto_5844 )
      ( DELIVER-3PKG ?auto_5838 ?auto_5840 ?auto_5841 ?auto_5839 )
      ( DELIVER-3PKG-VERIFY ?auto_5838 ?auto_5840 ?auto_5841 ?auto_5839 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5850 - OBJ
      ?auto_5852 - OBJ
      ?auto_5853 - OBJ
      ?auto_5851 - LOCATION
    )
    :vars
    (
      ?auto_5856 - LOCATION
      ?auto_5854 - CITY
      ?auto_5855 - LOCATION
      ?auto_5857 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5852 ?auto_5850 ) ( GREATER-THAN ?auto_5853 ?auto_5850 ) ( GREATER-THAN ?auto_5853 ?auto_5852 ) ( IN-CITY ?auto_5856 ?auto_5854 ) ( IN-CITY ?auto_5851 ?auto_5854 ) ( not ( = ?auto_5851 ?auto_5856 ) ) ( OBJ-AT ?auto_5853 ?auto_5856 ) ( not ( = ?auto_5850 ?auto_5852 ) ) ( not ( = ?auto_5850 ?auto_5853 ) ) ( not ( = ?auto_5852 ?auto_5853 ) ) ( IN-CITY ?auto_5855 ?auto_5854 ) ( not ( = ?auto_5851 ?auto_5855 ) ) ( not ( = ?auto_5856 ?auto_5855 ) ) ( OBJ-AT ?auto_5852 ?auto_5855 ) ( TRUCK-AT ?auto_5857 ?auto_5851 ) ( IN-TRUCK ?auto_5850 ?auto_5857 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5850 ?auto_5851 )
      ( DELIVER-3PKG ?auto_5850 ?auto_5852 ?auto_5853 ?auto_5851 )
      ( DELIVER-3PKG-VERIFY ?auto_5850 ?auto_5852 ?auto_5853 ?auto_5851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5862 - OBJ
      ?auto_5864 - OBJ
      ?auto_5865 - OBJ
      ?auto_5863 - LOCATION
    )
    :vars
    (
      ?auto_5866 - LOCATION
      ?auto_5869 - CITY
      ?auto_5868 - LOCATION
      ?auto_5867 - TRUCK
      ?auto_5870 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5864 ?auto_5862 ) ( GREATER-THAN ?auto_5865 ?auto_5862 ) ( GREATER-THAN ?auto_5865 ?auto_5864 ) ( IN-CITY ?auto_5866 ?auto_5869 ) ( IN-CITY ?auto_5863 ?auto_5869 ) ( not ( = ?auto_5863 ?auto_5866 ) ) ( OBJ-AT ?auto_5865 ?auto_5866 ) ( not ( = ?auto_5862 ?auto_5864 ) ) ( not ( = ?auto_5862 ?auto_5865 ) ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( IN-CITY ?auto_5868 ?auto_5869 ) ( not ( = ?auto_5863 ?auto_5868 ) ) ( not ( = ?auto_5866 ?auto_5868 ) ) ( OBJ-AT ?auto_5864 ?auto_5868 ) ( IN-TRUCK ?auto_5862 ?auto_5867 ) ( TRUCK-AT ?auto_5867 ?auto_5870 ) ( IN-CITY ?auto_5870 ?auto_5869 ) ( not ( = ?auto_5863 ?auto_5870 ) ) ( not ( = ?auto_5866 ?auto_5870 ) ) ( not ( = ?auto_5868 ?auto_5870 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5867 ?auto_5870 ?auto_5863 ?auto_5869 )
      ( DELIVER-3PKG ?auto_5862 ?auto_5864 ?auto_5865 ?auto_5863 )
      ( DELIVER-3PKG-VERIFY ?auto_5862 ?auto_5864 ?auto_5865 ?auto_5863 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5875 - OBJ
      ?auto_5877 - OBJ
      ?auto_5878 - OBJ
      ?auto_5876 - LOCATION
    )
    :vars
    (
      ?auto_5880 - LOCATION
      ?auto_5879 - CITY
      ?auto_5881 - LOCATION
      ?auto_5883 - TRUCK
      ?auto_5882 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5877 ?auto_5875 ) ( GREATER-THAN ?auto_5878 ?auto_5875 ) ( GREATER-THAN ?auto_5878 ?auto_5877 ) ( IN-CITY ?auto_5880 ?auto_5879 ) ( IN-CITY ?auto_5876 ?auto_5879 ) ( not ( = ?auto_5876 ?auto_5880 ) ) ( OBJ-AT ?auto_5878 ?auto_5880 ) ( not ( = ?auto_5875 ?auto_5877 ) ) ( not ( = ?auto_5875 ?auto_5878 ) ) ( not ( = ?auto_5877 ?auto_5878 ) ) ( IN-CITY ?auto_5881 ?auto_5879 ) ( not ( = ?auto_5876 ?auto_5881 ) ) ( not ( = ?auto_5880 ?auto_5881 ) ) ( OBJ-AT ?auto_5877 ?auto_5881 ) ( TRUCK-AT ?auto_5883 ?auto_5882 ) ( IN-CITY ?auto_5882 ?auto_5879 ) ( not ( = ?auto_5876 ?auto_5882 ) ) ( not ( = ?auto_5880 ?auto_5882 ) ) ( not ( = ?auto_5881 ?auto_5882 ) ) ( OBJ-AT ?auto_5875 ?auto_5882 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5875 ?auto_5883 ?auto_5882 )
      ( DELIVER-3PKG ?auto_5875 ?auto_5877 ?auto_5878 ?auto_5876 )
      ( DELIVER-3PKG-VERIFY ?auto_5875 ?auto_5877 ?auto_5878 ?auto_5876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5888 - OBJ
      ?auto_5890 - OBJ
      ?auto_5891 - OBJ
      ?auto_5889 - LOCATION
    )
    :vars
    (
      ?auto_5892 - LOCATION
      ?auto_5895 - CITY
      ?auto_5893 - LOCATION
      ?auto_5896 - LOCATION
      ?auto_5894 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5890 ?auto_5888 ) ( GREATER-THAN ?auto_5891 ?auto_5888 ) ( GREATER-THAN ?auto_5891 ?auto_5890 ) ( IN-CITY ?auto_5892 ?auto_5895 ) ( IN-CITY ?auto_5889 ?auto_5895 ) ( not ( = ?auto_5889 ?auto_5892 ) ) ( OBJ-AT ?auto_5891 ?auto_5892 ) ( not ( = ?auto_5888 ?auto_5890 ) ) ( not ( = ?auto_5888 ?auto_5891 ) ) ( not ( = ?auto_5890 ?auto_5891 ) ) ( IN-CITY ?auto_5893 ?auto_5895 ) ( not ( = ?auto_5889 ?auto_5893 ) ) ( not ( = ?auto_5892 ?auto_5893 ) ) ( OBJ-AT ?auto_5890 ?auto_5893 ) ( IN-CITY ?auto_5896 ?auto_5895 ) ( not ( = ?auto_5889 ?auto_5896 ) ) ( not ( = ?auto_5892 ?auto_5896 ) ) ( not ( = ?auto_5893 ?auto_5896 ) ) ( OBJ-AT ?auto_5888 ?auto_5896 ) ( TRUCK-AT ?auto_5894 ?auto_5889 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5894 ?auto_5889 ?auto_5896 ?auto_5895 )
      ( DELIVER-3PKG ?auto_5888 ?auto_5890 ?auto_5891 ?auto_5889 )
      ( DELIVER-3PKG-VERIFY ?auto_5888 ?auto_5890 ?auto_5891 ?auto_5889 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5928 - OBJ
      ?auto_5930 - OBJ
      ?auto_5931 - OBJ
      ?auto_5932 - OBJ
      ?auto_5929 - LOCATION
    )
    :vars
    (
      ?auto_5933 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5930 ?auto_5928 ) ( GREATER-THAN ?auto_5931 ?auto_5928 ) ( GREATER-THAN ?auto_5931 ?auto_5930 ) ( GREATER-THAN ?auto_5932 ?auto_5928 ) ( GREATER-THAN ?auto_5932 ?auto_5930 ) ( GREATER-THAN ?auto_5932 ?auto_5931 ) ( TRUCK-AT ?auto_5933 ?auto_5929 ) ( IN-TRUCK ?auto_5932 ?auto_5933 ) ( OBJ-AT ?auto_5928 ?auto_5929 ) ( OBJ-AT ?auto_5930 ?auto_5929 ) ( OBJ-AT ?auto_5931 ?auto_5929 ) ( not ( = ?auto_5928 ?auto_5930 ) ) ( not ( = ?auto_5928 ?auto_5931 ) ) ( not ( = ?auto_5928 ?auto_5932 ) ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5932 ) ) ( not ( = ?auto_5931 ?auto_5932 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5932 ?auto_5929 )
      ( DELIVER-4PKG-VERIFY ?auto_5928 ?auto_5930 ?auto_5931 ?auto_5932 ?auto_5929 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5939 - OBJ
      ?auto_5941 - OBJ
      ?auto_5942 - OBJ
      ?auto_5943 - OBJ
      ?auto_5940 - LOCATION
    )
    :vars
    (
      ?auto_5946 - TRUCK
      ?auto_5945 - LOCATION
      ?auto_5944 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5941 ?auto_5939 ) ( GREATER-THAN ?auto_5942 ?auto_5939 ) ( GREATER-THAN ?auto_5942 ?auto_5941 ) ( GREATER-THAN ?auto_5943 ?auto_5939 ) ( GREATER-THAN ?auto_5943 ?auto_5941 ) ( GREATER-THAN ?auto_5943 ?auto_5942 ) ( IN-TRUCK ?auto_5943 ?auto_5946 ) ( TRUCK-AT ?auto_5946 ?auto_5945 ) ( IN-CITY ?auto_5945 ?auto_5944 ) ( IN-CITY ?auto_5940 ?auto_5944 ) ( not ( = ?auto_5940 ?auto_5945 ) ) ( OBJ-AT ?auto_5939 ?auto_5940 ) ( OBJ-AT ?auto_5941 ?auto_5940 ) ( OBJ-AT ?auto_5942 ?auto_5940 ) ( not ( = ?auto_5939 ?auto_5941 ) ) ( not ( = ?auto_5939 ?auto_5942 ) ) ( not ( = ?auto_5939 ?auto_5943 ) ) ( not ( = ?auto_5941 ?auto_5942 ) ) ( not ( = ?auto_5941 ?auto_5943 ) ) ( not ( = ?auto_5942 ?auto_5943 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5943 ?auto_5940 )
      ( DELIVER-4PKG-VERIFY ?auto_5939 ?auto_5941 ?auto_5942 ?auto_5943 ?auto_5940 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5952 - OBJ
      ?auto_5954 - OBJ
      ?auto_5955 - OBJ
      ?auto_5956 - OBJ
      ?auto_5953 - LOCATION
    )
    :vars
    (
      ?auto_5958 - TRUCK
      ?auto_5957 - LOCATION
      ?auto_5959 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5954 ?auto_5952 ) ( GREATER-THAN ?auto_5955 ?auto_5952 ) ( GREATER-THAN ?auto_5955 ?auto_5954 ) ( GREATER-THAN ?auto_5956 ?auto_5952 ) ( GREATER-THAN ?auto_5956 ?auto_5954 ) ( GREATER-THAN ?auto_5956 ?auto_5955 ) ( TRUCK-AT ?auto_5958 ?auto_5957 ) ( IN-CITY ?auto_5957 ?auto_5959 ) ( IN-CITY ?auto_5953 ?auto_5959 ) ( not ( = ?auto_5953 ?auto_5957 ) ) ( OBJ-AT ?auto_5956 ?auto_5957 ) ( OBJ-AT ?auto_5952 ?auto_5953 ) ( OBJ-AT ?auto_5954 ?auto_5953 ) ( OBJ-AT ?auto_5955 ?auto_5953 ) ( not ( = ?auto_5952 ?auto_5954 ) ) ( not ( = ?auto_5952 ?auto_5955 ) ) ( not ( = ?auto_5952 ?auto_5956 ) ) ( not ( = ?auto_5954 ?auto_5955 ) ) ( not ( = ?auto_5954 ?auto_5956 ) ) ( not ( = ?auto_5955 ?auto_5956 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5956 ?auto_5953 )
      ( DELIVER-4PKG-VERIFY ?auto_5952 ?auto_5954 ?auto_5955 ?auto_5956 ?auto_5953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5965 - OBJ
      ?auto_5967 - OBJ
      ?auto_5968 - OBJ
      ?auto_5969 - OBJ
      ?auto_5966 - LOCATION
    )
    :vars
    (
      ?auto_5971 - LOCATION
      ?auto_5972 - CITY
      ?auto_5970 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5967 ?auto_5965 ) ( GREATER-THAN ?auto_5968 ?auto_5965 ) ( GREATER-THAN ?auto_5968 ?auto_5967 ) ( GREATER-THAN ?auto_5969 ?auto_5965 ) ( GREATER-THAN ?auto_5969 ?auto_5967 ) ( GREATER-THAN ?auto_5969 ?auto_5968 ) ( IN-CITY ?auto_5971 ?auto_5972 ) ( IN-CITY ?auto_5966 ?auto_5972 ) ( not ( = ?auto_5966 ?auto_5971 ) ) ( OBJ-AT ?auto_5969 ?auto_5971 ) ( TRUCK-AT ?auto_5970 ?auto_5966 ) ( OBJ-AT ?auto_5965 ?auto_5966 ) ( OBJ-AT ?auto_5967 ?auto_5966 ) ( OBJ-AT ?auto_5968 ?auto_5966 ) ( not ( = ?auto_5965 ?auto_5967 ) ) ( not ( = ?auto_5965 ?auto_5968 ) ) ( not ( = ?auto_5965 ?auto_5969 ) ) ( not ( = ?auto_5967 ?auto_5968 ) ) ( not ( = ?auto_5967 ?auto_5969 ) ) ( not ( = ?auto_5968 ?auto_5969 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5969 ?auto_5966 )
      ( DELIVER-4PKG-VERIFY ?auto_5965 ?auto_5967 ?auto_5968 ?auto_5969 ?auto_5966 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5978 - OBJ
      ?auto_5980 - OBJ
      ?auto_5981 - OBJ
      ?auto_5982 - OBJ
      ?auto_5979 - LOCATION
    )
    :vars
    (
      ?auto_5983 - LOCATION
      ?auto_5985 - CITY
      ?auto_5984 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5980 ?auto_5978 ) ( GREATER-THAN ?auto_5981 ?auto_5978 ) ( GREATER-THAN ?auto_5981 ?auto_5980 ) ( GREATER-THAN ?auto_5982 ?auto_5978 ) ( GREATER-THAN ?auto_5982 ?auto_5980 ) ( GREATER-THAN ?auto_5982 ?auto_5981 ) ( IN-CITY ?auto_5983 ?auto_5985 ) ( IN-CITY ?auto_5979 ?auto_5985 ) ( not ( = ?auto_5979 ?auto_5983 ) ) ( OBJ-AT ?auto_5982 ?auto_5983 ) ( TRUCK-AT ?auto_5984 ?auto_5979 ) ( OBJ-AT ?auto_5978 ?auto_5979 ) ( OBJ-AT ?auto_5980 ?auto_5979 ) ( not ( = ?auto_5978 ?auto_5980 ) ) ( not ( = ?auto_5978 ?auto_5981 ) ) ( not ( = ?auto_5978 ?auto_5982 ) ) ( not ( = ?auto_5980 ?auto_5981 ) ) ( not ( = ?auto_5980 ?auto_5982 ) ) ( not ( = ?auto_5981 ?auto_5982 ) ) ( IN-TRUCK ?auto_5981 ?auto_5984 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5981 ?auto_5979 )
      ( DELIVER-4PKG ?auto_5978 ?auto_5980 ?auto_5981 ?auto_5982 ?auto_5979 )
      ( DELIVER-4PKG-VERIFY ?auto_5978 ?auto_5980 ?auto_5981 ?auto_5982 ?auto_5979 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5991 - OBJ
      ?auto_5993 - OBJ
      ?auto_5994 - OBJ
      ?auto_5995 - OBJ
      ?auto_5992 - LOCATION
    )
    :vars
    (
      ?auto_5996 - LOCATION
      ?auto_5998 - CITY
      ?auto_5997 - TRUCK
      ?auto_5999 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5993 ?auto_5991 ) ( GREATER-THAN ?auto_5994 ?auto_5991 ) ( GREATER-THAN ?auto_5994 ?auto_5993 ) ( GREATER-THAN ?auto_5995 ?auto_5991 ) ( GREATER-THAN ?auto_5995 ?auto_5993 ) ( GREATER-THAN ?auto_5995 ?auto_5994 ) ( IN-CITY ?auto_5996 ?auto_5998 ) ( IN-CITY ?auto_5992 ?auto_5998 ) ( not ( = ?auto_5992 ?auto_5996 ) ) ( OBJ-AT ?auto_5995 ?auto_5996 ) ( OBJ-AT ?auto_5991 ?auto_5992 ) ( OBJ-AT ?auto_5993 ?auto_5992 ) ( not ( = ?auto_5991 ?auto_5993 ) ) ( not ( = ?auto_5991 ?auto_5994 ) ) ( not ( = ?auto_5991 ?auto_5995 ) ) ( not ( = ?auto_5993 ?auto_5994 ) ) ( not ( = ?auto_5993 ?auto_5995 ) ) ( not ( = ?auto_5994 ?auto_5995 ) ) ( IN-TRUCK ?auto_5994 ?auto_5997 ) ( TRUCK-AT ?auto_5997 ?auto_5999 ) ( IN-CITY ?auto_5999 ?auto_5998 ) ( not ( = ?auto_5992 ?auto_5999 ) ) ( not ( = ?auto_5996 ?auto_5999 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5997 ?auto_5999 ?auto_5992 ?auto_5998 )
      ( DELIVER-4PKG ?auto_5991 ?auto_5993 ?auto_5994 ?auto_5995 ?auto_5992 )
      ( DELIVER-4PKG-VERIFY ?auto_5991 ?auto_5993 ?auto_5994 ?auto_5995 ?auto_5992 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6005 - OBJ
      ?auto_6007 - OBJ
      ?auto_6008 - OBJ
      ?auto_6009 - OBJ
      ?auto_6006 - LOCATION
    )
    :vars
    (
      ?auto_6012 - LOCATION
      ?auto_6011 - CITY
      ?auto_6010 - TRUCK
      ?auto_6013 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6007 ?auto_6005 ) ( GREATER-THAN ?auto_6008 ?auto_6005 ) ( GREATER-THAN ?auto_6008 ?auto_6007 ) ( GREATER-THAN ?auto_6009 ?auto_6005 ) ( GREATER-THAN ?auto_6009 ?auto_6007 ) ( GREATER-THAN ?auto_6009 ?auto_6008 ) ( IN-CITY ?auto_6012 ?auto_6011 ) ( IN-CITY ?auto_6006 ?auto_6011 ) ( not ( = ?auto_6006 ?auto_6012 ) ) ( OBJ-AT ?auto_6009 ?auto_6012 ) ( OBJ-AT ?auto_6005 ?auto_6006 ) ( OBJ-AT ?auto_6007 ?auto_6006 ) ( not ( = ?auto_6005 ?auto_6007 ) ) ( not ( = ?auto_6005 ?auto_6008 ) ) ( not ( = ?auto_6005 ?auto_6009 ) ) ( not ( = ?auto_6007 ?auto_6008 ) ) ( not ( = ?auto_6007 ?auto_6009 ) ) ( not ( = ?auto_6008 ?auto_6009 ) ) ( TRUCK-AT ?auto_6010 ?auto_6013 ) ( IN-CITY ?auto_6013 ?auto_6011 ) ( not ( = ?auto_6006 ?auto_6013 ) ) ( not ( = ?auto_6012 ?auto_6013 ) ) ( OBJ-AT ?auto_6008 ?auto_6013 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6008 ?auto_6010 ?auto_6013 )
      ( DELIVER-4PKG ?auto_6005 ?auto_6007 ?auto_6008 ?auto_6009 ?auto_6006 )
      ( DELIVER-4PKG-VERIFY ?auto_6005 ?auto_6007 ?auto_6008 ?auto_6009 ?auto_6006 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6019 - OBJ
      ?auto_6021 - OBJ
      ?auto_6022 - OBJ
      ?auto_6023 - OBJ
      ?auto_6020 - LOCATION
    )
    :vars
    (
      ?auto_6026 - LOCATION
      ?auto_6024 - CITY
      ?auto_6027 - LOCATION
      ?auto_6025 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6021 ?auto_6019 ) ( GREATER-THAN ?auto_6022 ?auto_6019 ) ( GREATER-THAN ?auto_6022 ?auto_6021 ) ( GREATER-THAN ?auto_6023 ?auto_6019 ) ( GREATER-THAN ?auto_6023 ?auto_6021 ) ( GREATER-THAN ?auto_6023 ?auto_6022 ) ( IN-CITY ?auto_6026 ?auto_6024 ) ( IN-CITY ?auto_6020 ?auto_6024 ) ( not ( = ?auto_6020 ?auto_6026 ) ) ( OBJ-AT ?auto_6023 ?auto_6026 ) ( OBJ-AT ?auto_6019 ?auto_6020 ) ( OBJ-AT ?auto_6021 ?auto_6020 ) ( not ( = ?auto_6019 ?auto_6021 ) ) ( not ( = ?auto_6019 ?auto_6022 ) ) ( not ( = ?auto_6019 ?auto_6023 ) ) ( not ( = ?auto_6021 ?auto_6022 ) ) ( not ( = ?auto_6021 ?auto_6023 ) ) ( not ( = ?auto_6022 ?auto_6023 ) ) ( IN-CITY ?auto_6027 ?auto_6024 ) ( not ( = ?auto_6020 ?auto_6027 ) ) ( not ( = ?auto_6026 ?auto_6027 ) ) ( OBJ-AT ?auto_6022 ?auto_6027 ) ( TRUCK-AT ?auto_6025 ?auto_6020 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6025 ?auto_6020 ?auto_6027 ?auto_6024 )
      ( DELIVER-4PKG ?auto_6019 ?auto_6021 ?auto_6022 ?auto_6023 ?auto_6020 )
      ( DELIVER-4PKG-VERIFY ?auto_6019 ?auto_6021 ?auto_6022 ?auto_6023 ?auto_6020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6033 - OBJ
      ?auto_6035 - OBJ
      ?auto_6036 - OBJ
      ?auto_6037 - OBJ
      ?auto_6034 - LOCATION
    )
    :vars
    (
      ?auto_6039 - LOCATION
      ?auto_6038 - CITY
      ?auto_6040 - LOCATION
      ?auto_6041 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6035 ?auto_6033 ) ( GREATER-THAN ?auto_6036 ?auto_6033 ) ( GREATER-THAN ?auto_6036 ?auto_6035 ) ( GREATER-THAN ?auto_6037 ?auto_6033 ) ( GREATER-THAN ?auto_6037 ?auto_6035 ) ( GREATER-THAN ?auto_6037 ?auto_6036 ) ( IN-CITY ?auto_6039 ?auto_6038 ) ( IN-CITY ?auto_6034 ?auto_6038 ) ( not ( = ?auto_6034 ?auto_6039 ) ) ( OBJ-AT ?auto_6037 ?auto_6039 ) ( OBJ-AT ?auto_6033 ?auto_6034 ) ( not ( = ?auto_6033 ?auto_6035 ) ) ( not ( = ?auto_6033 ?auto_6036 ) ) ( not ( = ?auto_6033 ?auto_6037 ) ) ( not ( = ?auto_6035 ?auto_6036 ) ) ( not ( = ?auto_6035 ?auto_6037 ) ) ( not ( = ?auto_6036 ?auto_6037 ) ) ( IN-CITY ?auto_6040 ?auto_6038 ) ( not ( = ?auto_6034 ?auto_6040 ) ) ( not ( = ?auto_6039 ?auto_6040 ) ) ( OBJ-AT ?auto_6036 ?auto_6040 ) ( TRUCK-AT ?auto_6041 ?auto_6034 ) ( IN-TRUCK ?auto_6035 ?auto_6041 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6035 ?auto_6034 )
      ( DELIVER-4PKG ?auto_6033 ?auto_6035 ?auto_6036 ?auto_6037 ?auto_6034 )
      ( DELIVER-4PKG-VERIFY ?auto_6033 ?auto_6035 ?auto_6036 ?auto_6037 ?auto_6034 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6047 - OBJ
      ?auto_6049 - OBJ
      ?auto_6050 - OBJ
      ?auto_6051 - OBJ
      ?auto_6048 - LOCATION
    )
    :vars
    (
      ?auto_6053 - LOCATION
      ?auto_6054 - CITY
      ?auto_6052 - LOCATION
      ?auto_6055 - TRUCK
      ?auto_6056 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6049 ?auto_6047 ) ( GREATER-THAN ?auto_6050 ?auto_6047 ) ( GREATER-THAN ?auto_6050 ?auto_6049 ) ( GREATER-THAN ?auto_6051 ?auto_6047 ) ( GREATER-THAN ?auto_6051 ?auto_6049 ) ( GREATER-THAN ?auto_6051 ?auto_6050 ) ( IN-CITY ?auto_6053 ?auto_6054 ) ( IN-CITY ?auto_6048 ?auto_6054 ) ( not ( = ?auto_6048 ?auto_6053 ) ) ( OBJ-AT ?auto_6051 ?auto_6053 ) ( OBJ-AT ?auto_6047 ?auto_6048 ) ( not ( = ?auto_6047 ?auto_6049 ) ) ( not ( = ?auto_6047 ?auto_6050 ) ) ( not ( = ?auto_6047 ?auto_6051 ) ) ( not ( = ?auto_6049 ?auto_6050 ) ) ( not ( = ?auto_6049 ?auto_6051 ) ) ( not ( = ?auto_6050 ?auto_6051 ) ) ( IN-CITY ?auto_6052 ?auto_6054 ) ( not ( = ?auto_6048 ?auto_6052 ) ) ( not ( = ?auto_6053 ?auto_6052 ) ) ( OBJ-AT ?auto_6050 ?auto_6052 ) ( IN-TRUCK ?auto_6049 ?auto_6055 ) ( TRUCK-AT ?auto_6055 ?auto_6056 ) ( IN-CITY ?auto_6056 ?auto_6054 ) ( not ( = ?auto_6048 ?auto_6056 ) ) ( not ( = ?auto_6053 ?auto_6056 ) ) ( not ( = ?auto_6052 ?auto_6056 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6055 ?auto_6056 ?auto_6048 ?auto_6054 )
      ( DELIVER-4PKG ?auto_6047 ?auto_6049 ?auto_6050 ?auto_6051 ?auto_6048 )
      ( DELIVER-4PKG-VERIFY ?auto_6047 ?auto_6049 ?auto_6050 ?auto_6051 ?auto_6048 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6062 - OBJ
      ?auto_6064 - OBJ
      ?auto_6065 - OBJ
      ?auto_6066 - OBJ
      ?auto_6063 - LOCATION
    )
    :vars
    (
      ?auto_6070 - LOCATION
      ?auto_6068 - CITY
      ?auto_6067 - LOCATION
      ?auto_6071 - TRUCK
      ?auto_6069 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6064 ?auto_6062 ) ( GREATER-THAN ?auto_6065 ?auto_6062 ) ( GREATER-THAN ?auto_6065 ?auto_6064 ) ( GREATER-THAN ?auto_6066 ?auto_6062 ) ( GREATER-THAN ?auto_6066 ?auto_6064 ) ( GREATER-THAN ?auto_6066 ?auto_6065 ) ( IN-CITY ?auto_6070 ?auto_6068 ) ( IN-CITY ?auto_6063 ?auto_6068 ) ( not ( = ?auto_6063 ?auto_6070 ) ) ( OBJ-AT ?auto_6066 ?auto_6070 ) ( OBJ-AT ?auto_6062 ?auto_6063 ) ( not ( = ?auto_6062 ?auto_6064 ) ) ( not ( = ?auto_6062 ?auto_6065 ) ) ( not ( = ?auto_6062 ?auto_6066 ) ) ( not ( = ?auto_6064 ?auto_6065 ) ) ( not ( = ?auto_6064 ?auto_6066 ) ) ( not ( = ?auto_6065 ?auto_6066 ) ) ( IN-CITY ?auto_6067 ?auto_6068 ) ( not ( = ?auto_6063 ?auto_6067 ) ) ( not ( = ?auto_6070 ?auto_6067 ) ) ( OBJ-AT ?auto_6065 ?auto_6067 ) ( TRUCK-AT ?auto_6071 ?auto_6069 ) ( IN-CITY ?auto_6069 ?auto_6068 ) ( not ( = ?auto_6063 ?auto_6069 ) ) ( not ( = ?auto_6070 ?auto_6069 ) ) ( not ( = ?auto_6067 ?auto_6069 ) ) ( OBJ-AT ?auto_6064 ?auto_6069 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6064 ?auto_6071 ?auto_6069 )
      ( DELIVER-4PKG ?auto_6062 ?auto_6064 ?auto_6065 ?auto_6066 ?auto_6063 )
      ( DELIVER-4PKG-VERIFY ?auto_6062 ?auto_6064 ?auto_6065 ?auto_6066 ?auto_6063 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6077 - OBJ
      ?auto_6079 - OBJ
      ?auto_6080 - OBJ
      ?auto_6081 - OBJ
      ?auto_6078 - LOCATION
    )
    :vars
    (
      ?auto_6082 - LOCATION
      ?auto_6085 - CITY
      ?auto_6083 - LOCATION
      ?auto_6084 - LOCATION
      ?auto_6086 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6079 ?auto_6077 ) ( GREATER-THAN ?auto_6080 ?auto_6077 ) ( GREATER-THAN ?auto_6080 ?auto_6079 ) ( GREATER-THAN ?auto_6081 ?auto_6077 ) ( GREATER-THAN ?auto_6081 ?auto_6079 ) ( GREATER-THAN ?auto_6081 ?auto_6080 ) ( IN-CITY ?auto_6082 ?auto_6085 ) ( IN-CITY ?auto_6078 ?auto_6085 ) ( not ( = ?auto_6078 ?auto_6082 ) ) ( OBJ-AT ?auto_6081 ?auto_6082 ) ( OBJ-AT ?auto_6077 ?auto_6078 ) ( not ( = ?auto_6077 ?auto_6079 ) ) ( not ( = ?auto_6077 ?auto_6080 ) ) ( not ( = ?auto_6077 ?auto_6081 ) ) ( not ( = ?auto_6079 ?auto_6080 ) ) ( not ( = ?auto_6079 ?auto_6081 ) ) ( not ( = ?auto_6080 ?auto_6081 ) ) ( IN-CITY ?auto_6083 ?auto_6085 ) ( not ( = ?auto_6078 ?auto_6083 ) ) ( not ( = ?auto_6082 ?auto_6083 ) ) ( OBJ-AT ?auto_6080 ?auto_6083 ) ( IN-CITY ?auto_6084 ?auto_6085 ) ( not ( = ?auto_6078 ?auto_6084 ) ) ( not ( = ?auto_6082 ?auto_6084 ) ) ( not ( = ?auto_6083 ?auto_6084 ) ) ( OBJ-AT ?auto_6079 ?auto_6084 ) ( TRUCK-AT ?auto_6086 ?auto_6078 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6086 ?auto_6078 ?auto_6084 ?auto_6085 )
      ( DELIVER-4PKG ?auto_6077 ?auto_6079 ?auto_6080 ?auto_6081 ?auto_6078 )
      ( DELIVER-4PKG-VERIFY ?auto_6077 ?auto_6079 ?auto_6080 ?auto_6081 ?auto_6078 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6092 - OBJ
      ?auto_6094 - OBJ
      ?auto_6095 - OBJ
      ?auto_6096 - OBJ
      ?auto_6093 - LOCATION
    )
    :vars
    (
      ?auto_6097 - LOCATION
      ?auto_6101 - CITY
      ?auto_6098 - LOCATION
      ?auto_6099 - LOCATION
      ?auto_6100 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6094 ?auto_6092 ) ( GREATER-THAN ?auto_6095 ?auto_6092 ) ( GREATER-THAN ?auto_6095 ?auto_6094 ) ( GREATER-THAN ?auto_6096 ?auto_6092 ) ( GREATER-THAN ?auto_6096 ?auto_6094 ) ( GREATER-THAN ?auto_6096 ?auto_6095 ) ( IN-CITY ?auto_6097 ?auto_6101 ) ( IN-CITY ?auto_6093 ?auto_6101 ) ( not ( = ?auto_6093 ?auto_6097 ) ) ( OBJ-AT ?auto_6096 ?auto_6097 ) ( not ( = ?auto_6092 ?auto_6094 ) ) ( not ( = ?auto_6092 ?auto_6095 ) ) ( not ( = ?auto_6092 ?auto_6096 ) ) ( not ( = ?auto_6094 ?auto_6095 ) ) ( not ( = ?auto_6094 ?auto_6096 ) ) ( not ( = ?auto_6095 ?auto_6096 ) ) ( IN-CITY ?auto_6098 ?auto_6101 ) ( not ( = ?auto_6093 ?auto_6098 ) ) ( not ( = ?auto_6097 ?auto_6098 ) ) ( OBJ-AT ?auto_6095 ?auto_6098 ) ( IN-CITY ?auto_6099 ?auto_6101 ) ( not ( = ?auto_6093 ?auto_6099 ) ) ( not ( = ?auto_6097 ?auto_6099 ) ) ( not ( = ?auto_6098 ?auto_6099 ) ) ( OBJ-AT ?auto_6094 ?auto_6099 ) ( TRUCK-AT ?auto_6100 ?auto_6093 ) ( IN-TRUCK ?auto_6092 ?auto_6100 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6092 ?auto_6093 )
      ( DELIVER-4PKG ?auto_6092 ?auto_6094 ?auto_6095 ?auto_6096 ?auto_6093 )
      ( DELIVER-4PKG-VERIFY ?auto_6092 ?auto_6094 ?auto_6095 ?auto_6096 ?auto_6093 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6107 - OBJ
      ?auto_6109 - OBJ
      ?auto_6110 - OBJ
      ?auto_6111 - OBJ
      ?auto_6108 - LOCATION
    )
    :vars
    (
      ?auto_6115 - LOCATION
      ?auto_6112 - CITY
      ?auto_6116 - LOCATION
      ?auto_6114 - LOCATION
      ?auto_6113 - TRUCK
      ?auto_6117 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6109 ?auto_6107 ) ( GREATER-THAN ?auto_6110 ?auto_6107 ) ( GREATER-THAN ?auto_6110 ?auto_6109 ) ( GREATER-THAN ?auto_6111 ?auto_6107 ) ( GREATER-THAN ?auto_6111 ?auto_6109 ) ( GREATER-THAN ?auto_6111 ?auto_6110 ) ( IN-CITY ?auto_6115 ?auto_6112 ) ( IN-CITY ?auto_6108 ?auto_6112 ) ( not ( = ?auto_6108 ?auto_6115 ) ) ( OBJ-AT ?auto_6111 ?auto_6115 ) ( not ( = ?auto_6107 ?auto_6109 ) ) ( not ( = ?auto_6107 ?auto_6110 ) ) ( not ( = ?auto_6107 ?auto_6111 ) ) ( not ( = ?auto_6109 ?auto_6110 ) ) ( not ( = ?auto_6109 ?auto_6111 ) ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( IN-CITY ?auto_6116 ?auto_6112 ) ( not ( = ?auto_6108 ?auto_6116 ) ) ( not ( = ?auto_6115 ?auto_6116 ) ) ( OBJ-AT ?auto_6110 ?auto_6116 ) ( IN-CITY ?auto_6114 ?auto_6112 ) ( not ( = ?auto_6108 ?auto_6114 ) ) ( not ( = ?auto_6115 ?auto_6114 ) ) ( not ( = ?auto_6116 ?auto_6114 ) ) ( OBJ-AT ?auto_6109 ?auto_6114 ) ( IN-TRUCK ?auto_6107 ?auto_6113 ) ( TRUCK-AT ?auto_6113 ?auto_6117 ) ( IN-CITY ?auto_6117 ?auto_6112 ) ( not ( = ?auto_6108 ?auto_6117 ) ) ( not ( = ?auto_6115 ?auto_6117 ) ) ( not ( = ?auto_6116 ?auto_6117 ) ) ( not ( = ?auto_6114 ?auto_6117 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6113 ?auto_6117 ?auto_6108 ?auto_6112 )
      ( DELIVER-4PKG ?auto_6107 ?auto_6109 ?auto_6110 ?auto_6111 ?auto_6108 )
      ( DELIVER-4PKG-VERIFY ?auto_6107 ?auto_6109 ?auto_6110 ?auto_6111 ?auto_6108 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6123 - OBJ
      ?auto_6125 - OBJ
      ?auto_6126 - OBJ
      ?auto_6127 - OBJ
      ?auto_6124 - LOCATION
    )
    :vars
    (
      ?auto_6129 - LOCATION
      ?auto_6132 - CITY
      ?auto_6130 - LOCATION
      ?auto_6128 - LOCATION
      ?auto_6131 - TRUCK
      ?auto_6133 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6125 ?auto_6123 ) ( GREATER-THAN ?auto_6126 ?auto_6123 ) ( GREATER-THAN ?auto_6126 ?auto_6125 ) ( GREATER-THAN ?auto_6127 ?auto_6123 ) ( GREATER-THAN ?auto_6127 ?auto_6125 ) ( GREATER-THAN ?auto_6127 ?auto_6126 ) ( IN-CITY ?auto_6129 ?auto_6132 ) ( IN-CITY ?auto_6124 ?auto_6132 ) ( not ( = ?auto_6124 ?auto_6129 ) ) ( OBJ-AT ?auto_6127 ?auto_6129 ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6123 ?auto_6126 ) ) ( not ( = ?auto_6123 ?auto_6127 ) ) ( not ( = ?auto_6125 ?auto_6126 ) ) ( not ( = ?auto_6125 ?auto_6127 ) ) ( not ( = ?auto_6126 ?auto_6127 ) ) ( IN-CITY ?auto_6130 ?auto_6132 ) ( not ( = ?auto_6124 ?auto_6130 ) ) ( not ( = ?auto_6129 ?auto_6130 ) ) ( OBJ-AT ?auto_6126 ?auto_6130 ) ( IN-CITY ?auto_6128 ?auto_6132 ) ( not ( = ?auto_6124 ?auto_6128 ) ) ( not ( = ?auto_6129 ?auto_6128 ) ) ( not ( = ?auto_6130 ?auto_6128 ) ) ( OBJ-AT ?auto_6125 ?auto_6128 ) ( TRUCK-AT ?auto_6131 ?auto_6133 ) ( IN-CITY ?auto_6133 ?auto_6132 ) ( not ( = ?auto_6124 ?auto_6133 ) ) ( not ( = ?auto_6129 ?auto_6133 ) ) ( not ( = ?auto_6130 ?auto_6133 ) ) ( not ( = ?auto_6128 ?auto_6133 ) ) ( OBJ-AT ?auto_6123 ?auto_6133 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6123 ?auto_6131 ?auto_6133 )
      ( DELIVER-4PKG ?auto_6123 ?auto_6125 ?auto_6126 ?auto_6127 ?auto_6124 )
      ( DELIVER-4PKG-VERIFY ?auto_6123 ?auto_6125 ?auto_6126 ?auto_6127 ?auto_6124 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6139 - OBJ
      ?auto_6141 - OBJ
      ?auto_6142 - OBJ
      ?auto_6143 - OBJ
      ?auto_6140 - LOCATION
    )
    :vars
    (
      ?auto_6145 - LOCATION
      ?auto_6147 - CITY
      ?auto_6146 - LOCATION
      ?auto_6148 - LOCATION
      ?auto_6144 - LOCATION
      ?auto_6149 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6141 ?auto_6139 ) ( GREATER-THAN ?auto_6142 ?auto_6139 ) ( GREATER-THAN ?auto_6142 ?auto_6141 ) ( GREATER-THAN ?auto_6143 ?auto_6139 ) ( GREATER-THAN ?auto_6143 ?auto_6141 ) ( GREATER-THAN ?auto_6143 ?auto_6142 ) ( IN-CITY ?auto_6145 ?auto_6147 ) ( IN-CITY ?auto_6140 ?auto_6147 ) ( not ( = ?auto_6140 ?auto_6145 ) ) ( OBJ-AT ?auto_6143 ?auto_6145 ) ( not ( = ?auto_6139 ?auto_6141 ) ) ( not ( = ?auto_6139 ?auto_6142 ) ) ( not ( = ?auto_6139 ?auto_6143 ) ) ( not ( = ?auto_6141 ?auto_6142 ) ) ( not ( = ?auto_6141 ?auto_6143 ) ) ( not ( = ?auto_6142 ?auto_6143 ) ) ( IN-CITY ?auto_6146 ?auto_6147 ) ( not ( = ?auto_6140 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( OBJ-AT ?auto_6142 ?auto_6146 ) ( IN-CITY ?auto_6148 ?auto_6147 ) ( not ( = ?auto_6140 ?auto_6148 ) ) ( not ( = ?auto_6145 ?auto_6148 ) ) ( not ( = ?auto_6146 ?auto_6148 ) ) ( OBJ-AT ?auto_6141 ?auto_6148 ) ( IN-CITY ?auto_6144 ?auto_6147 ) ( not ( = ?auto_6140 ?auto_6144 ) ) ( not ( = ?auto_6145 ?auto_6144 ) ) ( not ( = ?auto_6146 ?auto_6144 ) ) ( not ( = ?auto_6148 ?auto_6144 ) ) ( OBJ-AT ?auto_6139 ?auto_6144 ) ( TRUCK-AT ?auto_6149 ?auto_6140 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6149 ?auto_6140 ?auto_6144 ?auto_6147 )
      ( DELIVER-4PKG ?auto_6139 ?auto_6141 ?auto_6142 ?auto_6143 ?auto_6140 )
      ( DELIVER-4PKG-VERIFY ?auto_6139 ?auto_6141 ?auto_6142 ?auto_6143 ?auto_6140 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6182 - OBJ
      ?auto_6184 - OBJ
      ?auto_6185 - OBJ
      ?auto_6186 - OBJ
      ?auto_6187 - OBJ
      ?auto_6183 - LOCATION
    )
    :vars
    (
      ?auto_6188 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6184 ?auto_6182 ) ( GREATER-THAN ?auto_6185 ?auto_6182 ) ( GREATER-THAN ?auto_6185 ?auto_6184 ) ( GREATER-THAN ?auto_6186 ?auto_6182 ) ( GREATER-THAN ?auto_6186 ?auto_6184 ) ( GREATER-THAN ?auto_6186 ?auto_6185 ) ( GREATER-THAN ?auto_6187 ?auto_6182 ) ( GREATER-THAN ?auto_6187 ?auto_6184 ) ( GREATER-THAN ?auto_6187 ?auto_6185 ) ( GREATER-THAN ?auto_6187 ?auto_6186 ) ( TRUCK-AT ?auto_6188 ?auto_6183 ) ( IN-TRUCK ?auto_6187 ?auto_6188 ) ( OBJ-AT ?auto_6182 ?auto_6183 ) ( OBJ-AT ?auto_6184 ?auto_6183 ) ( OBJ-AT ?auto_6185 ?auto_6183 ) ( OBJ-AT ?auto_6186 ?auto_6183 ) ( not ( = ?auto_6182 ?auto_6184 ) ) ( not ( = ?auto_6182 ?auto_6185 ) ) ( not ( = ?auto_6182 ?auto_6186 ) ) ( not ( = ?auto_6182 ?auto_6187 ) ) ( not ( = ?auto_6184 ?auto_6185 ) ) ( not ( = ?auto_6184 ?auto_6186 ) ) ( not ( = ?auto_6184 ?auto_6187 ) ) ( not ( = ?auto_6185 ?auto_6186 ) ) ( not ( = ?auto_6185 ?auto_6187 ) ) ( not ( = ?auto_6186 ?auto_6187 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6187 ?auto_6183 )
      ( DELIVER-5PKG-VERIFY ?auto_6182 ?auto_6184 ?auto_6185 ?auto_6186 ?auto_6187 ?auto_6183 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6195 - OBJ
      ?auto_6197 - OBJ
      ?auto_6198 - OBJ
      ?auto_6199 - OBJ
      ?auto_6200 - OBJ
      ?auto_6196 - LOCATION
    )
    :vars
    (
      ?auto_6201 - TRUCK
      ?auto_6203 - LOCATION
      ?auto_6202 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6197 ?auto_6195 ) ( GREATER-THAN ?auto_6198 ?auto_6195 ) ( GREATER-THAN ?auto_6198 ?auto_6197 ) ( GREATER-THAN ?auto_6199 ?auto_6195 ) ( GREATER-THAN ?auto_6199 ?auto_6197 ) ( GREATER-THAN ?auto_6199 ?auto_6198 ) ( GREATER-THAN ?auto_6200 ?auto_6195 ) ( GREATER-THAN ?auto_6200 ?auto_6197 ) ( GREATER-THAN ?auto_6200 ?auto_6198 ) ( GREATER-THAN ?auto_6200 ?auto_6199 ) ( IN-TRUCK ?auto_6200 ?auto_6201 ) ( TRUCK-AT ?auto_6201 ?auto_6203 ) ( IN-CITY ?auto_6203 ?auto_6202 ) ( IN-CITY ?auto_6196 ?auto_6202 ) ( not ( = ?auto_6196 ?auto_6203 ) ) ( OBJ-AT ?auto_6195 ?auto_6196 ) ( OBJ-AT ?auto_6197 ?auto_6196 ) ( OBJ-AT ?auto_6198 ?auto_6196 ) ( OBJ-AT ?auto_6199 ?auto_6196 ) ( not ( = ?auto_6195 ?auto_6197 ) ) ( not ( = ?auto_6195 ?auto_6198 ) ) ( not ( = ?auto_6195 ?auto_6199 ) ) ( not ( = ?auto_6195 ?auto_6200 ) ) ( not ( = ?auto_6197 ?auto_6198 ) ) ( not ( = ?auto_6197 ?auto_6199 ) ) ( not ( = ?auto_6197 ?auto_6200 ) ) ( not ( = ?auto_6198 ?auto_6199 ) ) ( not ( = ?auto_6198 ?auto_6200 ) ) ( not ( = ?auto_6199 ?auto_6200 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6200 ?auto_6196 )
      ( DELIVER-5PKG-VERIFY ?auto_6195 ?auto_6197 ?auto_6198 ?auto_6199 ?auto_6200 ?auto_6196 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6210 - OBJ
      ?auto_6212 - OBJ
      ?auto_6213 - OBJ
      ?auto_6214 - OBJ
      ?auto_6215 - OBJ
      ?auto_6211 - LOCATION
    )
    :vars
    (
      ?auto_6218 - TRUCK
      ?auto_6216 - LOCATION
      ?auto_6217 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6212 ?auto_6210 ) ( GREATER-THAN ?auto_6213 ?auto_6210 ) ( GREATER-THAN ?auto_6213 ?auto_6212 ) ( GREATER-THAN ?auto_6214 ?auto_6210 ) ( GREATER-THAN ?auto_6214 ?auto_6212 ) ( GREATER-THAN ?auto_6214 ?auto_6213 ) ( GREATER-THAN ?auto_6215 ?auto_6210 ) ( GREATER-THAN ?auto_6215 ?auto_6212 ) ( GREATER-THAN ?auto_6215 ?auto_6213 ) ( GREATER-THAN ?auto_6215 ?auto_6214 ) ( TRUCK-AT ?auto_6218 ?auto_6216 ) ( IN-CITY ?auto_6216 ?auto_6217 ) ( IN-CITY ?auto_6211 ?auto_6217 ) ( not ( = ?auto_6211 ?auto_6216 ) ) ( OBJ-AT ?auto_6215 ?auto_6216 ) ( OBJ-AT ?auto_6210 ?auto_6211 ) ( OBJ-AT ?auto_6212 ?auto_6211 ) ( OBJ-AT ?auto_6213 ?auto_6211 ) ( OBJ-AT ?auto_6214 ?auto_6211 ) ( not ( = ?auto_6210 ?auto_6212 ) ) ( not ( = ?auto_6210 ?auto_6213 ) ) ( not ( = ?auto_6210 ?auto_6214 ) ) ( not ( = ?auto_6210 ?auto_6215 ) ) ( not ( = ?auto_6212 ?auto_6213 ) ) ( not ( = ?auto_6212 ?auto_6214 ) ) ( not ( = ?auto_6212 ?auto_6215 ) ) ( not ( = ?auto_6213 ?auto_6214 ) ) ( not ( = ?auto_6213 ?auto_6215 ) ) ( not ( = ?auto_6214 ?auto_6215 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6215 ?auto_6211 )
      ( DELIVER-5PKG-VERIFY ?auto_6210 ?auto_6212 ?auto_6213 ?auto_6214 ?auto_6215 ?auto_6211 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6225 - OBJ
      ?auto_6227 - OBJ
      ?auto_6228 - OBJ
      ?auto_6229 - OBJ
      ?auto_6230 - OBJ
      ?auto_6226 - LOCATION
    )
    :vars
    (
      ?auto_6233 - LOCATION
      ?auto_6231 - CITY
      ?auto_6232 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6227 ?auto_6225 ) ( GREATER-THAN ?auto_6228 ?auto_6225 ) ( GREATER-THAN ?auto_6228 ?auto_6227 ) ( GREATER-THAN ?auto_6229 ?auto_6225 ) ( GREATER-THAN ?auto_6229 ?auto_6227 ) ( GREATER-THAN ?auto_6229 ?auto_6228 ) ( GREATER-THAN ?auto_6230 ?auto_6225 ) ( GREATER-THAN ?auto_6230 ?auto_6227 ) ( GREATER-THAN ?auto_6230 ?auto_6228 ) ( GREATER-THAN ?auto_6230 ?auto_6229 ) ( IN-CITY ?auto_6233 ?auto_6231 ) ( IN-CITY ?auto_6226 ?auto_6231 ) ( not ( = ?auto_6226 ?auto_6233 ) ) ( OBJ-AT ?auto_6230 ?auto_6233 ) ( TRUCK-AT ?auto_6232 ?auto_6226 ) ( OBJ-AT ?auto_6225 ?auto_6226 ) ( OBJ-AT ?auto_6227 ?auto_6226 ) ( OBJ-AT ?auto_6228 ?auto_6226 ) ( OBJ-AT ?auto_6229 ?auto_6226 ) ( not ( = ?auto_6225 ?auto_6227 ) ) ( not ( = ?auto_6225 ?auto_6228 ) ) ( not ( = ?auto_6225 ?auto_6229 ) ) ( not ( = ?auto_6225 ?auto_6230 ) ) ( not ( = ?auto_6227 ?auto_6228 ) ) ( not ( = ?auto_6227 ?auto_6229 ) ) ( not ( = ?auto_6227 ?auto_6230 ) ) ( not ( = ?auto_6228 ?auto_6229 ) ) ( not ( = ?auto_6228 ?auto_6230 ) ) ( not ( = ?auto_6229 ?auto_6230 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6230 ?auto_6226 )
      ( DELIVER-5PKG-VERIFY ?auto_6225 ?auto_6227 ?auto_6228 ?auto_6229 ?auto_6230 ?auto_6226 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6240 - OBJ
      ?auto_6242 - OBJ
      ?auto_6243 - OBJ
      ?auto_6244 - OBJ
      ?auto_6245 - OBJ
      ?auto_6241 - LOCATION
    )
    :vars
    (
      ?auto_6246 - LOCATION
      ?auto_6248 - CITY
      ?auto_6247 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6242 ?auto_6240 ) ( GREATER-THAN ?auto_6243 ?auto_6240 ) ( GREATER-THAN ?auto_6243 ?auto_6242 ) ( GREATER-THAN ?auto_6244 ?auto_6240 ) ( GREATER-THAN ?auto_6244 ?auto_6242 ) ( GREATER-THAN ?auto_6244 ?auto_6243 ) ( GREATER-THAN ?auto_6245 ?auto_6240 ) ( GREATER-THAN ?auto_6245 ?auto_6242 ) ( GREATER-THAN ?auto_6245 ?auto_6243 ) ( GREATER-THAN ?auto_6245 ?auto_6244 ) ( IN-CITY ?auto_6246 ?auto_6248 ) ( IN-CITY ?auto_6241 ?auto_6248 ) ( not ( = ?auto_6241 ?auto_6246 ) ) ( OBJ-AT ?auto_6245 ?auto_6246 ) ( TRUCK-AT ?auto_6247 ?auto_6241 ) ( OBJ-AT ?auto_6240 ?auto_6241 ) ( OBJ-AT ?auto_6242 ?auto_6241 ) ( OBJ-AT ?auto_6243 ?auto_6241 ) ( not ( = ?auto_6240 ?auto_6242 ) ) ( not ( = ?auto_6240 ?auto_6243 ) ) ( not ( = ?auto_6240 ?auto_6244 ) ) ( not ( = ?auto_6240 ?auto_6245 ) ) ( not ( = ?auto_6242 ?auto_6243 ) ) ( not ( = ?auto_6242 ?auto_6244 ) ) ( not ( = ?auto_6242 ?auto_6245 ) ) ( not ( = ?auto_6243 ?auto_6244 ) ) ( not ( = ?auto_6243 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( IN-TRUCK ?auto_6244 ?auto_6247 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6244 ?auto_6241 )
      ( DELIVER-5PKG ?auto_6240 ?auto_6242 ?auto_6243 ?auto_6244 ?auto_6245 ?auto_6241 )
      ( DELIVER-5PKG-VERIFY ?auto_6240 ?auto_6242 ?auto_6243 ?auto_6244 ?auto_6245 ?auto_6241 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6255 - OBJ
      ?auto_6257 - OBJ
      ?auto_6258 - OBJ
      ?auto_6259 - OBJ
      ?auto_6260 - OBJ
      ?auto_6256 - LOCATION
    )
    :vars
    (
      ?auto_6261 - LOCATION
      ?auto_6262 - CITY
      ?auto_6263 - TRUCK
      ?auto_6264 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6257 ?auto_6255 ) ( GREATER-THAN ?auto_6258 ?auto_6255 ) ( GREATER-THAN ?auto_6258 ?auto_6257 ) ( GREATER-THAN ?auto_6259 ?auto_6255 ) ( GREATER-THAN ?auto_6259 ?auto_6257 ) ( GREATER-THAN ?auto_6259 ?auto_6258 ) ( GREATER-THAN ?auto_6260 ?auto_6255 ) ( GREATER-THAN ?auto_6260 ?auto_6257 ) ( GREATER-THAN ?auto_6260 ?auto_6258 ) ( GREATER-THAN ?auto_6260 ?auto_6259 ) ( IN-CITY ?auto_6261 ?auto_6262 ) ( IN-CITY ?auto_6256 ?auto_6262 ) ( not ( = ?auto_6256 ?auto_6261 ) ) ( OBJ-AT ?auto_6260 ?auto_6261 ) ( OBJ-AT ?auto_6255 ?auto_6256 ) ( OBJ-AT ?auto_6257 ?auto_6256 ) ( OBJ-AT ?auto_6258 ?auto_6256 ) ( not ( = ?auto_6255 ?auto_6257 ) ) ( not ( = ?auto_6255 ?auto_6258 ) ) ( not ( = ?auto_6255 ?auto_6259 ) ) ( not ( = ?auto_6255 ?auto_6260 ) ) ( not ( = ?auto_6257 ?auto_6258 ) ) ( not ( = ?auto_6257 ?auto_6259 ) ) ( not ( = ?auto_6257 ?auto_6260 ) ) ( not ( = ?auto_6258 ?auto_6259 ) ) ( not ( = ?auto_6258 ?auto_6260 ) ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( IN-TRUCK ?auto_6259 ?auto_6263 ) ( TRUCK-AT ?auto_6263 ?auto_6264 ) ( IN-CITY ?auto_6264 ?auto_6262 ) ( not ( = ?auto_6256 ?auto_6264 ) ) ( not ( = ?auto_6261 ?auto_6264 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6263 ?auto_6264 ?auto_6256 ?auto_6262 )
      ( DELIVER-5PKG ?auto_6255 ?auto_6257 ?auto_6258 ?auto_6259 ?auto_6260 ?auto_6256 )
      ( DELIVER-5PKG-VERIFY ?auto_6255 ?auto_6257 ?auto_6258 ?auto_6259 ?auto_6260 ?auto_6256 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6271 - OBJ
      ?auto_6273 - OBJ
      ?auto_6274 - OBJ
      ?auto_6275 - OBJ
      ?auto_6276 - OBJ
      ?auto_6272 - LOCATION
    )
    :vars
    (
      ?auto_6280 - LOCATION
      ?auto_6279 - CITY
      ?auto_6277 - TRUCK
      ?auto_6278 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6273 ?auto_6271 ) ( GREATER-THAN ?auto_6274 ?auto_6271 ) ( GREATER-THAN ?auto_6274 ?auto_6273 ) ( GREATER-THAN ?auto_6275 ?auto_6271 ) ( GREATER-THAN ?auto_6275 ?auto_6273 ) ( GREATER-THAN ?auto_6275 ?auto_6274 ) ( GREATER-THAN ?auto_6276 ?auto_6271 ) ( GREATER-THAN ?auto_6276 ?auto_6273 ) ( GREATER-THAN ?auto_6276 ?auto_6274 ) ( GREATER-THAN ?auto_6276 ?auto_6275 ) ( IN-CITY ?auto_6280 ?auto_6279 ) ( IN-CITY ?auto_6272 ?auto_6279 ) ( not ( = ?auto_6272 ?auto_6280 ) ) ( OBJ-AT ?auto_6276 ?auto_6280 ) ( OBJ-AT ?auto_6271 ?auto_6272 ) ( OBJ-AT ?auto_6273 ?auto_6272 ) ( OBJ-AT ?auto_6274 ?auto_6272 ) ( not ( = ?auto_6271 ?auto_6273 ) ) ( not ( = ?auto_6271 ?auto_6274 ) ) ( not ( = ?auto_6271 ?auto_6275 ) ) ( not ( = ?auto_6271 ?auto_6276 ) ) ( not ( = ?auto_6273 ?auto_6274 ) ) ( not ( = ?auto_6273 ?auto_6275 ) ) ( not ( = ?auto_6273 ?auto_6276 ) ) ( not ( = ?auto_6274 ?auto_6275 ) ) ( not ( = ?auto_6274 ?auto_6276 ) ) ( not ( = ?auto_6275 ?auto_6276 ) ) ( TRUCK-AT ?auto_6277 ?auto_6278 ) ( IN-CITY ?auto_6278 ?auto_6279 ) ( not ( = ?auto_6272 ?auto_6278 ) ) ( not ( = ?auto_6280 ?auto_6278 ) ) ( OBJ-AT ?auto_6275 ?auto_6278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6275 ?auto_6277 ?auto_6278 )
      ( DELIVER-5PKG ?auto_6271 ?auto_6273 ?auto_6274 ?auto_6275 ?auto_6276 ?auto_6272 )
      ( DELIVER-5PKG-VERIFY ?auto_6271 ?auto_6273 ?auto_6274 ?auto_6275 ?auto_6276 ?auto_6272 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6287 - OBJ
      ?auto_6289 - OBJ
      ?auto_6290 - OBJ
      ?auto_6291 - OBJ
      ?auto_6292 - OBJ
      ?auto_6288 - LOCATION
    )
    :vars
    (
      ?auto_6294 - LOCATION
      ?auto_6293 - CITY
      ?auto_6295 - LOCATION
      ?auto_6296 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6289 ?auto_6287 ) ( GREATER-THAN ?auto_6290 ?auto_6287 ) ( GREATER-THAN ?auto_6290 ?auto_6289 ) ( GREATER-THAN ?auto_6291 ?auto_6287 ) ( GREATER-THAN ?auto_6291 ?auto_6289 ) ( GREATER-THAN ?auto_6291 ?auto_6290 ) ( GREATER-THAN ?auto_6292 ?auto_6287 ) ( GREATER-THAN ?auto_6292 ?auto_6289 ) ( GREATER-THAN ?auto_6292 ?auto_6290 ) ( GREATER-THAN ?auto_6292 ?auto_6291 ) ( IN-CITY ?auto_6294 ?auto_6293 ) ( IN-CITY ?auto_6288 ?auto_6293 ) ( not ( = ?auto_6288 ?auto_6294 ) ) ( OBJ-AT ?auto_6292 ?auto_6294 ) ( OBJ-AT ?auto_6287 ?auto_6288 ) ( OBJ-AT ?auto_6289 ?auto_6288 ) ( OBJ-AT ?auto_6290 ?auto_6288 ) ( not ( = ?auto_6287 ?auto_6289 ) ) ( not ( = ?auto_6287 ?auto_6290 ) ) ( not ( = ?auto_6287 ?auto_6291 ) ) ( not ( = ?auto_6287 ?auto_6292 ) ) ( not ( = ?auto_6289 ?auto_6290 ) ) ( not ( = ?auto_6289 ?auto_6291 ) ) ( not ( = ?auto_6289 ?auto_6292 ) ) ( not ( = ?auto_6290 ?auto_6291 ) ) ( not ( = ?auto_6290 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( IN-CITY ?auto_6295 ?auto_6293 ) ( not ( = ?auto_6288 ?auto_6295 ) ) ( not ( = ?auto_6294 ?auto_6295 ) ) ( OBJ-AT ?auto_6291 ?auto_6295 ) ( TRUCK-AT ?auto_6296 ?auto_6288 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6296 ?auto_6288 ?auto_6295 ?auto_6293 )
      ( DELIVER-5PKG ?auto_6287 ?auto_6289 ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6288 )
      ( DELIVER-5PKG-VERIFY ?auto_6287 ?auto_6289 ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6288 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6303 - OBJ
      ?auto_6305 - OBJ
      ?auto_6306 - OBJ
      ?auto_6307 - OBJ
      ?auto_6308 - OBJ
      ?auto_6304 - LOCATION
    )
    :vars
    (
      ?auto_6309 - LOCATION
      ?auto_6312 - CITY
      ?auto_6311 - LOCATION
      ?auto_6310 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6305 ?auto_6303 ) ( GREATER-THAN ?auto_6306 ?auto_6303 ) ( GREATER-THAN ?auto_6306 ?auto_6305 ) ( GREATER-THAN ?auto_6307 ?auto_6303 ) ( GREATER-THAN ?auto_6307 ?auto_6305 ) ( GREATER-THAN ?auto_6307 ?auto_6306 ) ( GREATER-THAN ?auto_6308 ?auto_6303 ) ( GREATER-THAN ?auto_6308 ?auto_6305 ) ( GREATER-THAN ?auto_6308 ?auto_6306 ) ( GREATER-THAN ?auto_6308 ?auto_6307 ) ( IN-CITY ?auto_6309 ?auto_6312 ) ( IN-CITY ?auto_6304 ?auto_6312 ) ( not ( = ?auto_6304 ?auto_6309 ) ) ( OBJ-AT ?auto_6308 ?auto_6309 ) ( OBJ-AT ?auto_6303 ?auto_6304 ) ( OBJ-AT ?auto_6305 ?auto_6304 ) ( not ( = ?auto_6303 ?auto_6305 ) ) ( not ( = ?auto_6303 ?auto_6306 ) ) ( not ( = ?auto_6303 ?auto_6307 ) ) ( not ( = ?auto_6303 ?auto_6308 ) ) ( not ( = ?auto_6305 ?auto_6306 ) ) ( not ( = ?auto_6305 ?auto_6307 ) ) ( not ( = ?auto_6305 ?auto_6308 ) ) ( not ( = ?auto_6306 ?auto_6307 ) ) ( not ( = ?auto_6306 ?auto_6308 ) ) ( not ( = ?auto_6307 ?auto_6308 ) ) ( IN-CITY ?auto_6311 ?auto_6312 ) ( not ( = ?auto_6304 ?auto_6311 ) ) ( not ( = ?auto_6309 ?auto_6311 ) ) ( OBJ-AT ?auto_6307 ?auto_6311 ) ( TRUCK-AT ?auto_6310 ?auto_6304 ) ( IN-TRUCK ?auto_6306 ?auto_6310 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6306 ?auto_6304 )
      ( DELIVER-5PKG ?auto_6303 ?auto_6305 ?auto_6306 ?auto_6307 ?auto_6308 ?auto_6304 )
      ( DELIVER-5PKG-VERIFY ?auto_6303 ?auto_6305 ?auto_6306 ?auto_6307 ?auto_6308 ?auto_6304 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6319 - OBJ
      ?auto_6321 - OBJ
      ?auto_6322 - OBJ
      ?auto_6323 - OBJ
      ?auto_6324 - OBJ
      ?auto_6320 - LOCATION
    )
    :vars
    (
      ?auto_6327 - LOCATION
      ?auto_6326 - CITY
      ?auto_6328 - LOCATION
      ?auto_6325 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6321 ?auto_6319 ) ( GREATER-THAN ?auto_6322 ?auto_6319 ) ( GREATER-THAN ?auto_6322 ?auto_6321 ) ( GREATER-THAN ?auto_6323 ?auto_6319 ) ( GREATER-THAN ?auto_6323 ?auto_6321 ) ( GREATER-THAN ?auto_6323 ?auto_6322 ) ( GREATER-THAN ?auto_6324 ?auto_6319 ) ( GREATER-THAN ?auto_6324 ?auto_6321 ) ( GREATER-THAN ?auto_6324 ?auto_6322 ) ( GREATER-THAN ?auto_6324 ?auto_6323 ) ( IN-CITY ?auto_6327 ?auto_6326 ) ( IN-CITY ?auto_6320 ?auto_6326 ) ( not ( = ?auto_6320 ?auto_6327 ) ) ( OBJ-AT ?auto_6324 ?auto_6327 ) ( OBJ-AT ?auto_6319 ?auto_6320 ) ( OBJ-AT ?auto_6321 ?auto_6320 ) ( not ( = ?auto_6319 ?auto_6321 ) ) ( not ( = ?auto_6319 ?auto_6322 ) ) ( not ( = ?auto_6319 ?auto_6323 ) ) ( not ( = ?auto_6319 ?auto_6324 ) ) ( not ( = ?auto_6321 ?auto_6322 ) ) ( not ( = ?auto_6321 ?auto_6323 ) ) ( not ( = ?auto_6321 ?auto_6324 ) ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( not ( = ?auto_6322 ?auto_6324 ) ) ( not ( = ?auto_6323 ?auto_6324 ) ) ( IN-CITY ?auto_6328 ?auto_6326 ) ( not ( = ?auto_6320 ?auto_6328 ) ) ( not ( = ?auto_6327 ?auto_6328 ) ) ( OBJ-AT ?auto_6323 ?auto_6328 ) ( IN-TRUCK ?auto_6322 ?auto_6325 ) ( TRUCK-AT ?auto_6325 ?auto_6327 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6325 ?auto_6327 ?auto_6320 ?auto_6326 )
      ( DELIVER-5PKG ?auto_6319 ?auto_6321 ?auto_6322 ?auto_6323 ?auto_6324 ?auto_6320 )
      ( DELIVER-5PKG-VERIFY ?auto_6319 ?auto_6321 ?auto_6322 ?auto_6323 ?auto_6324 ?auto_6320 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6335 - OBJ
      ?auto_6337 - OBJ
      ?auto_6338 - OBJ
      ?auto_6339 - OBJ
      ?auto_6340 - OBJ
      ?auto_6336 - LOCATION
    )
    :vars
    (
      ?auto_6342 - LOCATION
      ?auto_6343 - CITY
      ?auto_6344 - LOCATION
      ?auto_6341 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6337 ?auto_6335 ) ( GREATER-THAN ?auto_6338 ?auto_6335 ) ( GREATER-THAN ?auto_6338 ?auto_6337 ) ( GREATER-THAN ?auto_6339 ?auto_6335 ) ( GREATER-THAN ?auto_6339 ?auto_6337 ) ( GREATER-THAN ?auto_6339 ?auto_6338 ) ( GREATER-THAN ?auto_6340 ?auto_6335 ) ( GREATER-THAN ?auto_6340 ?auto_6337 ) ( GREATER-THAN ?auto_6340 ?auto_6338 ) ( GREATER-THAN ?auto_6340 ?auto_6339 ) ( IN-CITY ?auto_6342 ?auto_6343 ) ( IN-CITY ?auto_6336 ?auto_6343 ) ( not ( = ?auto_6336 ?auto_6342 ) ) ( OBJ-AT ?auto_6340 ?auto_6342 ) ( OBJ-AT ?auto_6335 ?auto_6336 ) ( OBJ-AT ?auto_6337 ?auto_6336 ) ( not ( = ?auto_6335 ?auto_6337 ) ) ( not ( = ?auto_6335 ?auto_6338 ) ) ( not ( = ?auto_6335 ?auto_6339 ) ) ( not ( = ?auto_6335 ?auto_6340 ) ) ( not ( = ?auto_6337 ?auto_6338 ) ) ( not ( = ?auto_6337 ?auto_6339 ) ) ( not ( = ?auto_6337 ?auto_6340 ) ) ( not ( = ?auto_6338 ?auto_6339 ) ) ( not ( = ?auto_6338 ?auto_6340 ) ) ( not ( = ?auto_6339 ?auto_6340 ) ) ( IN-CITY ?auto_6344 ?auto_6343 ) ( not ( = ?auto_6336 ?auto_6344 ) ) ( not ( = ?auto_6342 ?auto_6344 ) ) ( OBJ-AT ?auto_6339 ?auto_6344 ) ( TRUCK-AT ?auto_6341 ?auto_6342 ) ( OBJ-AT ?auto_6338 ?auto_6342 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6338 ?auto_6341 ?auto_6342 )
      ( DELIVER-5PKG ?auto_6335 ?auto_6337 ?auto_6338 ?auto_6339 ?auto_6340 ?auto_6336 )
      ( DELIVER-5PKG-VERIFY ?auto_6335 ?auto_6337 ?auto_6338 ?auto_6339 ?auto_6340 ?auto_6336 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6351 - OBJ
      ?auto_6353 - OBJ
      ?auto_6354 - OBJ
      ?auto_6355 - OBJ
      ?auto_6356 - OBJ
      ?auto_6352 - LOCATION
    )
    :vars
    (
      ?auto_6359 - LOCATION
      ?auto_6358 - CITY
      ?auto_6357 - LOCATION
      ?auto_6360 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6353 ?auto_6351 ) ( GREATER-THAN ?auto_6354 ?auto_6351 ) ( GREATER-THAN ?auto_6354 ?auto_6353 ) ( GREATER-THAN ?auto_6355 ?auto_6351 ) ( GREATER-THAN ?auto_6355 ?auto_6353 ) ( GREATER-THAN ?auto_6355 ?auto_6354 ) ( GREATER-THAN ?auto_6356 ?auto_6351 ) ( GREATER-THAN ?auto_6356 ?auto_6353 ) ( GREATER-THAN ?auto_6356 ?auto_6354 ) ( GREATER-THAN ?auto_6356 ?auto_6355 ) ( IN-CITY ?auto_6359 ?auto_6358 ) ( IN-CITY ?auto_6352 ?auto_6358 ) ( not ( = ?auto_6352 ?auto_6359 ) ) ( OBJ-AT ?auto_6356 ?auto_6359 ) ( OBJ-AT ?auto_6351 ?auto_6352 ) ( OBJ-AT ?auto_6353 ?auto_6352 ) ( not ( = ?auto_6351 ?auto_6353 ) ) ( not ( = ?auto_6351 ?auto_6354 ) ) ( not ( = ?auto_6351 ?auto_6355 ) ) ( not ( = ?auto_6351 ?auto_6356 ) ) ( not ( = ?auto_6353 ?auto_6354 ) ) ( not ( = ?auto_6353 ?auto_6355 ) ) ( not ( = ?auto_6353 ?auto_6356 ) ) ( not ( = ?auto_6354 ?auto_6355 ) ) ( not ( = ?auto_6354 ?auto_6356 ) ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( IN-CITY ?auto_6357 ?auto_6358 ) ( not ( = ?auto_6352 ?auto_6357 ) ) ( not ( = ?auto_6359 ?auto_6357 ) ) ( OBJ-AT ?auto_6355 ?auto_6357 ) ( OBJ-AT ?auto_6354 ?auto_6359 ) ( TRUCK-AT ?auto_6360 ?auto_6352 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6360 ?auto_6352 ?auto_6359 ?auto_6358 )
      ( DELIVER-5PKG ?auto_6351 ?auto_6353 ?auto_6354 ?auto_6355 ?auto_6356 ?auto_6352 )
      ( DELIVER-5PKG-VERIFY ?auto_6351 ?auto_6353 ?auto_6354 ?auto_6355 ?auto_6356 ?auto_6352 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6367 - OBJ
      ?auto_6369 - OBJ
      ?auto_6370 - OBJ
      ?auto_6371 - OBJ
      ?auto_6372 - OBJ
      ?auto_6368 - LOCATION
    )
    :vars
    (
      ?auto_6373 - LOCATION
      ?auto_6374 - CITY
      ?auto_6375 - LOCATION
      ?auto_6376 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6369 ?auto_6367 ) ( GREATER-THAN ?auto_6370 ?auto_6367 ) ( GREATER-THAN ?auto_6370 ?auto_6369 ) ( GREATER-THAN ?auto_6371 ?auto_6367 ) ( GREATER-THAN ?auto_6371 ?auto_6369 ) ( GREATER-THAN ?auto_6371 ?auto_6370 ) ( GREATER-THAN ?auto_6372 ?auto_6367 ) ( GREATER-THAN ?auto_6372 ?auto_6369 ) ( GREATER-THAN ?auto_6372 ?auto_6370 ) ( GREATER-THAN ?auto_6372 ?auto_6371 ) ( IN-CITY ?auto_6373 ?auto_6374 ) ( IN-CITY ?auto_6368 ?auto_6374 ) ( not ( = ?auto_6368 ?auto_6373 ) ) ( OBJ-AT ?auto_6372 ?auto_6373 ) ( OBJ-AT ?auto_6367 ?auto_6368 ) ( not ( = ?auto_6367 ?auto_6369 ) ) ( not ( = ?auto_6367 ?auto_6370 ) ) ( not ( = ?auto_6367 ?auto_6371 ) ) ( not ( = ?auto_6367 ?auto_6372 ) ) ( not ( = ?auto_6369 ?auto_6370 ) ) ( not ( = ?auto_6369 ?auto_6371 ) ) ( not ( = ?auto_6369 ?auto_6372 ) ) ( not ( = ?auto_6370 ?auto_6371 ) ) ( not ( = ?auto_6370 ?auto_6372 ) ) ( not ( = ?auto_6371 ?auto_6372 ) ) ( IN-CITY ?auto_6375 ?auto_6374 ) ( not ( = ?auto_6368 ?auto_6375 ) ) ( not ( = ?auto_6373 ?auto_6375 ) ) ( OBJ-AT ?auto_6371 ?auto_6375 ) ( OBJ-AT ?auto_6370 ?auto_6373 ) ( TRUCK-AT ?auto_6376 ?auto_6368 ) ( IN-TRUCK ?auto_6369 ?auto_6376 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6369 ?auto_6368 )
      ( DELIVER-5PKG ?auto_6367 ?auto_6369 ?auto_6370 ?auto_6371 ?auto_6372 ?auto_6368 )
      ( DELIVER-5PKG-VERIFY ?auto_6367 ?auto_6369 ?auto_6370 ?auto_6371 ?auto_6372 ?auto_6368 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6383 - OBJ
      ?auto_6385 - OBJ
      ?auto_6386 - OBJ
      ?auto_6387 - OBJ
      ?auto_6388 - OBJ
      ?auto_6384 - LOCATION
    )
    :vars
    (
      ?auto_6390 - LOCATION
      ?auto_6389 - CITY
      ?auto_6392 - LOCATION
      ?auto_6391 - TRUCK
      ?auto_6393 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6385 ?auto_6383 ) ( GREATER-THAN ?auto_6386 ?auto_6383 ) ( GREATER-THAN ?auto_6386 ?auto_6385 ) ( GREATER-THAN ?auto_6387 ?auto_6383 ) ( GREATER-THAN ?auto_6387 ?auto_6385 ) ( GREATER-THAN ?auto_6387 ?auto_6386 ) ( GREATER-THAN ?auto_6388 ?auto_6383 ) ( GREATER-THAN ?auto_6388 ?auto_6385 ) ( GREATER-THAN ?auto_6388 ?auto_6386 ) ( GREATER-THAN ?auto_6388 ?auto_6387 ) ( IN-CITY ?auto_6390 ?auto_6389 ) ( IN-CITY ?auto_6384 ?auto_6389 ) ( not ( = ?auto_6384 ?auto_6390 ) ) ( OBJ-AT ?auto_6388 ?auto_6390 ) ( OBJ-AT ?auto_6383 ?auto_6384 ) ( not ( = ?auto_6383 ?auto_6385 ) ) ( not ( = ?auto_6383 ?auto_6386 ) ) ( not ( = ?auto_6383 ?auto_6387 ) ) ( not ( = ?auto_6383 ?auto_6388 ) ) ( not ( = ?auto_6385 ?auto_6386 ) ) ( not ( = ?auto_6385 ?auto_6387 ) ) ( not ( = ?auto_6385 ?auto_6388 ) ) ( not ( = ?auto_6386 ?auto_6387 ) ) ( not ( = ?auto_6386 ?auto_6388 ) ) ( not ( = ?auto_6387 ?auto_6388 ) ) ( IN-CITY ?auto_6392 ?auto_6389 ) ( not ( = ?auto_6384 ?auto_6392 ) ) ( not ( = ?auto_6390 ?auto_6392 ) ) ( OBJ-AT ?auto_6387 ?auto_6392 ) ( OBJ-AT ?auto_6386 ?auto_6390 ) ( IN-TRUCK ?auto_6385 ?auto_6391 ) ( TRUCK-AT ?auto_6391 ?auto_6393 ) ( IN-CITY ?auto_6393 ?auto_6389 ) ( not ( = ?auto_6384 ?auto_6393 ) ) ( not ( = ?auto_6390 ?auto_6393 ) ) ( not ( = ?auto_6392 ?auto_6393 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6391 ?auto_6393 ?auto_6384 ?auto_6389 )
      ( DELIVER-5PKG ?auto_6383 ?auto_6385 ?auto_6386 ?auto_6387 ?auto_6388 ?auto_6384 )
      ( DELIVER-5PKG-VERIFY ?auto_6383 ?auto_6385 ?auto_6386 ?auto_6387 ?auto_6388 ?auto_6384 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6400 - OBJ
      ?auto_6402 - OBJ
      ?auto_6403 - OBJ
      ?auto_6404 - OBJ
      ?auto_6405 - OBJ
      ?auto_6401 - LOCATION
    )
    :vars
    (
      ?auto_6407 - LOCATION
      ?auto_6406 - CITY
      ?auto_6409 - LOCATION
      ?auto_6408 - TRUCK
      ?auto_6410 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6402 ?auto_6400 ) ( GREATER-THAN ?auto_6403 ?auto_6400 ) ( GREATER-THAN ?auto_6403 ?auto_6402 ) ( GREATER-THAN ?auto_6404 ?auto_6400 ) ( GREATER-THAN ?auto_6404 ?auto_6402 ) ( GREATER-THAN ?auto_6404 ?auto_6403 ) ( GREATER-THAN ?auto_6405 ?auto_6400 ) ( GREATER-THAN ?auto_6405 ?auto_6402 ) ( GREATER-THAN ?auto_6405 ?auto_6403 ) ( GREATER-THAN ?auto_6405 ?auto_6404 ) ( IN-CITY ?auto_6407 ?auto_6406 ) ( IN-CITY ?auto_6401 ?auto_6406 ) ( not ( = ?auto_6401 ?auto_6407 ) ) ( OBJ-AT ?auto_6405 ?auto_6407 ) ( OBJ-AT ?auto_6400 ?auto_6401 ) ( not ( = ?auto_6400 ?auto_6402 ) ) ( not ( = ?auto_6400 ?auto_6403 ) ) ( not ( = ?auto_6400 ?auto_6404 ) ) ( not ( = ?auto_6400 ?auto_6405 ) ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6404 ) ) ( not ( = ?auto_6402 ?auto_6405 ) ) ( not ( = ?auto_6403 ?auto_6404 ) ) ( not ( = ?auto_6403 ?auto_6405 ) ) ( not ( = ?auto_6404 ?auto_6405 ) ) ( IN-CITY ?auto_6409 ?auto_6406 ) ( not ( = ?auto_6401 ?auto_6409 ) ) ( not ( = ?auto_6407 ?auto_6409 ) ) ( OBJ-AT ?auto_6404 ?auto_6409 ) ( OBJ-AT ?auto_6403 ?auto_6407 ) ( TRUCK-AT ?auto_6408 ?auto_6410 ) ( IN-CITY ?auto_6410 ?auto_6406 ) ( not ( = ?auto_6401 ?auto_6410 ) ) ( not ( = ?auto_6407 ?auto_6410 ) ) ( not ( = ?auto_6409 ?auto_6410 ) ) ( OBJ-AT ?auto_6402 ?auto_6410 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6402 ?auto_6408 ?auto_6410 )
      ( DELIVER-5PKG ?auto_6400 ?auto_6402 ?auto_6403 ?auto_6404 ?auto_6405 ?auto_6401 )
      ( DELIVER-5PKG-VERIFY ?auto_6400 ?auto_6402 ?auto_6403 ?auto_6404 ?auto_6405 ?auto_6401 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6417 - OBJ
      ?auto_6419 - OBJ
      ?auto_6420 - OBJ
      ?auto_6421 - OBJ
      ?auto_6422 - OBJ
      ?auto_6418 - LOCATION
    )
    :vars
    (
      ?auto_6426 - LOCATION
      ?auto_6423 - CITY
      ?auto_6427 - LOCATION
      ?auto_6425 - LOCATION
      ?auto_6424 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6419 ?auto_6417 ) ( GREATER-THAN ?auto_6420 ?auto_6417 ) ( GREATER-THAN ?auto_6420 ?auto_6419 ) ( GREATER-THAN ?auto_6421 ?auto_6417 ) ( GREATER-THAN ?auto_6421 ?auto_6419 ) ( GREATER-THAN ?auto_6421 ?auto_6420 ) ( GREATER-THAN ?auto_6422 ?auto_6417 ) ( GREATER-THAN ?auto_6422 ?auto_6419 ) ( GREATER-THAN ?auto_6422 ?auto_6420 ) ( GREATER-THAN ?auto_6422 ?auto_6421 ) ( IN-CITY ?auto_6426 ?auto_6423 ) ( IN-CITY ?auto_6418 ?auto_6423 ) ( not ( = ?auto_6418 ?auto_6426 ) ) ( OBJ-AT ?auto_6422 ?auto_6426 ) ( OBJ-AT ?auto_6417 ?auto_6418 ) ( not ( = ?auto_6417 ?auto_6419 ) ) ( not ( = ?auto_6417 ?auto_6420 ) ) ( not ( = ?auto_6417 ?auto_6421 ) ) ( not ( = ?auto_6417 ?auto_6422 ) ) ( not ( = ?auto_6419 ?auto_6420 ) ) ( not ( = ?auto_6419 ?auto_6421 ) ) ( not ( = ?auto_6419 ?auto_6422 ) ) ( not ( = ?auto_6420 ?auto_6421 ) ) ( not ( = ?auto_6420 ?auto_6422 ) ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( IN-CITY ?auto_6427 ?auto_6423 ) ( not ( = ?auto_6418 ?auto_6427 ) ) ( not ( = ?auto_6426 ?auto_6427 ) ) ( OBJ-AT ?auto_6421 ?auto_6427 ) ( OBJ-AT ?auto_6420 ?auto_6426 ) ( IN-CITY ?auto_6425 ?auto_6423 ) ( not ( = ?auto_6418 ?auto_6425 ) ) ( not ( = ?auto_6426 ?auto_6425 ) ) ( not ( = ?auto_6427 ?auto_6425 ) ) ( OBJ-AT ?auto_6419 ?auto_6425 ) ( TRUCK-AT ?auto_6424 ?auto_6418 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6424 ?auto_6418 ?auto_6425 ?auto_6423 )
      ( DELIVER-5PKG ?auto_6417 ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6422 ?auto_6418 )
      ( DELIVER-5PKG-VERIFY ?auto_6417 ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6422 ?auto_6418 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6434 - OBJ
      ?auto_6436 - OBJ
      ?auto_6437 - OBJ
      ?auto_6438 - OBJ
      ?auto_6439 - OBJ
      ?auto_6435 - LOCATION
    )
    :vars
    (
      ?auto_6443 - LOCATION
      ?auto_6440 - CITY
      ?auto_6442 - LOCATION
      ?auto_6444 - LOCATION
      ?auto_6441 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6436 ?auto_6434 ) ( GREATER-THAN ?auto_6437 ?auto_6434 ) ( GREATER-THAN ?auto_6437 ?auto_6436 ) ( GREATER-THAN ?auto_6438 ?auto_6434 ) ( GREATER-THAN ?auto_6438 ?auto_6436 ) ( GREATER-THAN ?auto_6438 ?auto_6437 ) ( GREATER-THAN ?auto_6439 ?auto_6434 ) ( GREATER-THAN ?auto_6439 ?auto_6436 ) ( GREATER-THAN ?auto_6439 ?auto_6437 ) ( GREATER-THAN ?auto_6439 ?auto_6438 ) ( IN-CITY ?auto_6443 ?auto_6440 ) ( IN-CITY ?auto_6435 ?auto_6440 ) ( not ( = ?auto_6435 ?auto_6443 ) ) ( OBJ-AT ?auto_6439 ?auto_6443 ) ( not ( = ?auto_6434 ?auto_6436 ) ) ( not ( = ?auto_6434 ?auto_6437 ) ) ( not ( = ?auto_6434 ?auto_6438 ) ) ( not ( = ?auto_6434 ?auto_6439 ) ) ( not ( = ?auto_6436 ?auto_6437 ) ) ( not ( = ?auto_6436 ?auto_6438 ) ) ( not ( = ?auto_6436 ?auto_6439 ) ) ( not ( = ?auto_6437 ?auto_6438 ) ) ( not ( = ?auto_6437 ?auto_6439 ) ) ( not ( = ?auto_6438 ?auto_6439 ) ) ( IN-CITY ?auto_6442 ?auto_6440 ) ( not ( = ?auto_6435 ?auto_6442 ) ) ( not ( = ?auto_6443 ?auto_6442 ) ) ( OBJ-AT ?auto_6438 ?auto_6442 ) ( OBJ-AT ?auto_6437 ?auto_6443 ) ( IN-CITY ?auto_6444 ?auto_6440 ) ( not ( = ?auto_6435 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( OBJ-AT ?auto_6436 ?auto_6444 ) ( TRUCK-AT ?auto_6441 ?auto_6435 ) ( IN-TRUCK ?auto_6434 ?auto_6441 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6434 ?auto_6435 )
      ( DELIVER-5PKG ?auto_6434 ?auto_6436 ?auto_6437 ?auto_6438 ?auto_6439 ?auto_6435 )
      ( DELIVER-5PKG-VERIFY ?auto_6434 ?auto_6436 ?auto_6437 ?auto_6438 ?auto_6439 ?auto_6435 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6451 - OBJ
      ?auto_6453 - OBJ
      ?auto_6454 - OBJ
      ?auto_6455 - OBJ
      ?auto_6456 - OBJ
      ?auto_6452 - LOCATION
    )
    :vars
    (
      ?auto_6460 - LOCATION
      ?auto_6457 - CITY
      ?auto_6459 - LOCATION
      ?auto_6458 - LOCATION
      ?auto_6461 - TRUCK
      ?auto_6462 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6453 ?auto_6451 ) ( GREATER-THAN ?auto_6454 ?auto_6451 ) ( GREATER-THAN ?auto_6454 ?auto_6453 ) ( GREATER-THAN ?auto_6455 ?auto_6451 ) ( GREATER-THAN ?auto_6455 ?auto_6453 ) ( GREATER-THAN ?auto_6455 ?auto_6454 ) ( GREATER-THAN ?auto_6456 ?auto_6451 ) ( GREATER-THAN ?auto_6456 ?auto_6453 ) ( GREATER-THAN ?auto_6456 ?auto_6454 ) ( GREATER-THAN ?auto_6456 ?auto_6455 ) ( IN-CITY ?auto_6460 ?auto_6457 ) ( IN-CITY ?auto_6452 ?auto_6457 ) ( not ( = ?auto_6452 ?auto_6460 ) ) ( OBJ-AT ?auto_6456 ?auto_6460 ) ( not ( = ?auto_6451 ?auto_6453 ) ) ( not ( = ?auto_6451 ?auto_6454 ) ) ( not ( = ?auto_6451 ?auto_6455 ) ) ( not ( = ?auto_6451 ?auto_6456 ) ) ( not ( = ?auto_6453 ?auto_6454 ) ) ( not ( = ?auto_6453 ?auto_6455 ) ) ( not ( = ?auto_6453 ?auto_6456 ) ) ( not ( = ?auto_6454 ?auto_6455 ) ) ( not ( = ?auto_6454 ?auto_6456 ) ) ( not ( = ?auto_6455 ?auto_6456 ) ) ( IN-CITY ?auto_6459 ?auto_6457 ) ( not ( = ?auto_6452 ?auto_6459 ) ) ( not ( = ?auto_6460 ?auto_6459 ) ) ( OBJ-AT ?auto_6455 ?auto_6459 ) ( OBJ-AT ?auto_6454 ?auto_6460 ) ( IN-CITY ?auto_6458 ?auto_6457 ) ( not ( = ?auto_6452 ?auto_6458 ) ) ( not ( = ?auto_6460 ?auto_6458 ) ) ( not ( = ?auto_6459 ?auto_6458 ) ) ( OBJ-AT ?auto_6453 ?auto_6458 ) ( IN-TRUCK ?auto_6451 ?auto_6461 ) ( TRUCK-AT ?auto_6461 ?auto_6462 ) ( IN-CITY ?auto_6462 ?auto_6457 ) ( not ( = ?auto_6452 ?auto_6462 ) ) ( not ( = ?auto_6460 ?auto_6462 ) ) ( not ( = ?auto_6459 ?auto_6462 ) ) ( not ( = ?auto_6458 ?auto_6462 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6461 ?auto_6462 ?auto_6452 ?auto_6457 )
      ( DELIVER-5PKG ?auto_6451 ?auto_6453 ?auto_6454 ?auto_6455 ?auto_6456 ?auto_6452 )
      ( DELIVER-5PKG-VERIFY ?auto_6451 ?auto_6453 ?auto_6454 ?auto_6455 ?auto_6456 ?auto_6452 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6469 - OBJ
      ?auto_6471 - OBJ
      ?auto_6472 - OBJ
      ?auto_6473 - OBJ
      ?auto_6474 - OBJ
      ?auto_6470 - LOCATION
    )
    :vars
    (
      ?auto_6476 - LOCATION
      ?auto_6478 - CITY
      ?auto_6475 - LOCATION
      ?auto_6480 - LOCATION
      ?auto_6477 - TRUCK
      ?auto_6479 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6471 ?auto_6469 ) ( GREATER-THAN ?auto_6472 ?auto_6469 ) ( GREATER-THAN ?auto_6472 ?auto_6471 ) ( GREATER-THAN ?auto_6473 ?auto_6469 ) ( GREATER-THAN ?auto_6473 ?auto_6471 ) ( GREATER-THAN ?auto_6473 ?auto_6472 ) ( GREATER-THAN ?auto_6474 ?auto_6469 ) ( GREATER-THAN ?auto_6474 ?auto_6471 ) ( GREATER-THAN ?auto_6474 ?auto_6472 ) ( GREATER-THAN ?auto_6474 ?auto_6473 ) ( IN-CITY ?auto_6476 ?auto_6478 ) ( IN-CITY ?auto_6470 ?auto_6478 ) ( not ( = ?auto_6470 ?auto_6476 ) ) ( OBJ-AT ?auto_6474 ?auto_6476 ) ( not ( = ?auto_6469 ?auto_6471 ) ) ( not ( = ?auto_6469 ?auto_6472 ) ) ( not ( = ?auto_6469 ?auto_6473 ) ) ( not ( = ?auto_6469 ?auto_6474 ) ) ( not ( = ?auto_6471 ?auto_6472 ) ) ( not ( = ?auto_6471 ?auto_6473 ) ) ( not ( = ?auto_6471 ?auto_6474 ) ) ( not ( = ?auto_6472 ?auto_6473 ) ) ( not ( = ?auto_6472 ?auto_6474 ) ) ( not ( = ?auto_6473 ?auto_6474 ) ) ( IN-CITY ?auto_6475 ?auto_6478 ) ( not ( = ?auto_6470 ?auto_6475 ) ) ( not ( = ?auto_6476 ?auto_6475 ) ) ( OBJ-AT ?auto_6473 ?auto_6475 ) ( OBJ-AT ?auto_6472 ?auto_6476 ) ( IN-CITY ?auto_6480 ?auto_6478 ) ( not ( = ?auto_6470 ?auto_6480 ) ) ( not ( = ?auto_6476 ?auto_6480 ) ) ( not ( = ?auto_6475 ?auto_6480 ) ) ( OBJ-AT ?auto_6471 ?auto_6480 ) ( TRUCK-AT ?auto_6477 ?auto_6479 ) ( IN-CITY ?auto_6479 ?auto_6478 ) ( not ( = ?auto_6470 ?auto_6479 ) ) ( not ( = ?auto_6476 ?auto_6479 ) ) ( not ( = ?auto_6475 ?auto_6479 ) ) ( not ( = ?auto_6480 ?auto_6479 ) ) ( OBJ-AT ?auto_6469 ?auto_6479 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6469 ?auto_6477 ?auto_6479 )
      ( DELIVER-5PKG ?auto_6469 ?auto_6471 ?auto_6472 ?auto_6473 ?auto_6474 ?auto_6470 )
      ( DELIVER-5PKG-VERIFY ?auto_6469 ?auto_6471 ?auto_6472 ?auto_6473 ?auto_6474 ?auto_6470 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_6487 - OBJ
      ?auto_6489 - OBJ
      ?auto_6490 - OBJ
      ?auto_6491 - OBJ
      ?auto_6492 - OBJ
      ?auto_6488 - LOCATION
    )
    :vars
    (
      ?auto_6493 - LOCATION
      ?auto_6498 - CITY
      ?auto_6496 - LOCATION
      ?auto_6495 - LOCATION
      ?auto_6497 - LOCATION
      ?auto_6494 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_6489 ?auto_6487 ) ( GREATER-THAN ?auto_6490 ?auto_6487 ) ( GREATER-THAN ?auto_6490 ?auto_6489 ) ( GREATER-THAN ?auto_6491 ?auto_6487 ) ( GREATER-THAN ?auto_6491 ?auto_6489 ) ( GREATER-THAN ?auto_6491 ?auto_6490 ) ( GREATER-THAN ?auto_6492 ?auto_6487 ) ( GREATER-THAN ?auto_6492 ?auto_6489 ) ( GREATER-THAN ?auto_6492 ?auto_6490 ) ( GREATER-THAN ?auto_6492 ?auto_6491 ) ( IN-CITY ?auto_6493 ?auto_6498 ) ( IN-CITY ?auto_6488 ?auto_6498 ) ( not ( = ?auto_6488 ?auto_6493 ) ) ( OBJ-AT ?auto_6492 ?auto_6493 ) ( not ( = ?auto_6487 ?auto_6489 ) ) ( not ( = ?auto_6487 ?auto_6490 ) ) ( not ( = ?auto_6487 ?auto_6491 ) ) ( not ( = ?auto_6487 ?auto_6492 ) ) ( not ( = ?auto_6489 ?auto_6490 ) ) ( not ( = ?auto_6489 ?auto_6491 ) ) ( not ( = ?auto_6489 ?auto_6492 ) ) ( not ( = ?auto_6490 ?auto_6491 ) ) ( not ( = ?auto_6490 ?auto_6492 ) ) ( not ( = ?auto_6491 ?auto_6492 ) ) ( IN-CITY ?auto_6496 ?auto_6498 ) ( not ( = ?auto_6488 ?auto_6496 ) ) ( not ( = ?auto_6493 ?auto_6496 ) ) ( OBJ-AT ?auto_6491 ?auto_6496 ) ( OBJ-AT ?auto_6490 ?auto_6493 ) ( IN-CITY ?auto_6495 ?auto_6498 ) ( not ( = ?auto_6488 ?auto_6495 ) ) ( not ( = ?auto_6493 ?auto_6495 ) ) ( not ( = ?auto_6496 ?auto_6495 ) ) ( OBJ-AT ?auto_6489 ?auto_6495 ) ( IN-CITY ?auto_6497 ?auto_6498 ) ( not ( = ?auto_6488 ?auto_6497 ) ) ( not ( = ?auto_6493 ?auto_6497 ) ) ( not ( = ?auto_6496 ?auto_6497 ) ) ( not ( = ?auto_6495 ?auto_6497 ) ) ( OBJ-AT ?auto_6487 ?auto_6497 ) ( TRUCK-AT ?auto_6494 ?auto_6488 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6494 ?auto_6488 ?auto_6497 ?auto_6498 )
      ( DELIVER-5PKG ?auto_6487 ?auto_6489 ?auto_6490 ?auto_6491 ?auto_6492 ?auto_6488 )
      ( DELIVER-5PKG-VERIFY ?auto_6487 ?auto_6489 ?auto_6490 ?auto_6491 ?auto_6492 ?auto_6488 ) )
  )

)

