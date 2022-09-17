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
      ?auto_9559 - OBJ
      ?auto_9558 - LOCATION
    )
    :vars
    (
      ?auto_9560 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9560 ?auto_9558 ) ( IN-TRUCK ?auto_9559 ?auto_9560 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_9559 ?auto_9560 ?auto_9558 )
      ( DELIVER-1PKG-VERIFY ?auto_9559 ?auto_9558 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9571 - OBJ
      ?auto_9570 - LOCATION
    )
    :vars
    (
      ?auto_9572 - TRUCK
      ?auto_9573 - LOCATION
      ?auto_9574 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9571 ?auto_9572 ) ( TRUCK-AT ?auto_9572 ?auto_9573 ) ( IN-CITY ?auto_9573 ?auto_9574 ) ( IN-CITY ?auto_9570 ?auto_9574 ) ( not ( = ?auto_9570 ?auto_9573 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9572 ?auto_9573 ?auto_9570 ?auto_9574 )
      ( DELIVER-1PKG ?auto_9571 ?auto_9570 )
      ( DELIVER-1PKG-VERIFY ?auto_9571 ?auto_9570 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9589 - OBJ
      ?auto_9588 - LOCATION
    )
    :vars
    (
      ?auto_9591 - TRUCK
      ?auto_9592 - LOCATION
      ?auto_9590 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9591 ?auto_9592 ) ( IN-CITY ?auto_9592 ?auto_9590 ) ( IN-CITY ?auto_9588 ?auto_9590 ) ( not ( = ?auto_9588 ?auto_9592 ) ) ( OBJ-AT ?auto_9589 ?auto_9592 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9589 ?auto_9591 ?auto_9592 )
      ( DELIVER-1PKG ?auto_9589 ?auto_9588 )
      ( DELIVER-1PKG-VERIFY ?auto_9589 ?auto_9588 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9607 - OBJ
      ?auto_9606 - LOCATION
    )
    :vars
    (
      ?auto_9610 - LOCATION
      ?auto_9609 - CITY
      ?auto_9608 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9610 ?auto_9609 ) ( IN-CITY ?auto_9606 ?auto_9609 ) ( not ( = ?auto_9606 ?auto_9610 ) ) ( OBJ-AT ?auto_9607 ?auto_9610 ) ( TRUCK-AT ?auto_9608 ?auto_9606 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9608 ?auto_9606 ?auto_9610 ?auto_9609 )
      ( DELIVER-1PKG ?auto_9607 ?auto_9606 )
      ( DELIVER-1PKG-VERIFY ?auto_9607 ?auto_9606 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9667 - OBJ
      ?auto_9668 - OBJ
      ?auto_9666 - LOCATION
    )
    :vars
    (
      ?auto_9669 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9669 ?auto_9666 ) ( IN-TRUCK ?auto_9668 ?auto_9669 ) ( OBJ-AT ?auto_9667 ?auto_9666 ) ( not ( = ?auto_9667 ?auto_9668 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9668 ?auto_9666 )
      ( DELIVER-2PKG-VERIFY ?auto_9667 ?auto_9668 ?auto_9666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9671 - OBJ
      ?auto_9672 - OBJ
      ?auto_9670 - LOCATION
    )
    :vars
    (
      ?auto_9673 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9673 ?auto_9670 ) ( IN-TRUCK ?auto_9671 ?auto_9673 ) ( OBJ-AT ?auto_9672 ?auto_9670 ) ( not ( = ?auto_9671 ?auto_9672 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9671 ?auto_9670 )
      ( DELIVER-2PKG-VERIFY ?auto_9671 ?auto_9672 ?auto_9670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9679 - OBJ
      ?auto_9680 - OBJ
      ?auto_9681 - OBJ
      ?auto_9678 - LOCATION
    )
    :vars
    (
      ?auto_9682 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9682 ?auto_9678 ) ( IN-TRUCK ?auto_9681 ?auto_9682 ) ( OBJ-AT ?auto_9679 ?auto_9678 ) ( OBJ-AT ?auto_9680 ?auto_9678 ) ( not ( = ?auto_9679 ?auto_9680 ) ) ( not ( = ?auto_9679 ?auto_9681 ) ) ( not ( = ?auto_9680 ?auto_9681 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9681 ?auto_9678 )
      ( DELIVER-3PKG-VERIFY ?auto_9679 ?auto_9680 ?auto_9681 ?auto_9678 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9684 - OBJ
      ?auto_9685 - OBJ
      ?auto_9686 - OBJ
      ?auto_9683 - LOCATION
    )
    :vars
    (
      ?auto_9687 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9687 ?auto_9683 ) ( IN-TRUCK ?auto_9685 ?auto_9687 ) ( OBJ-AT ?auto_9684 ?auto_9683 ) ( OBJ-AT ?auto_9686 ?auto_9683 ) ( not ( = ?auto_9684 ?auto_9685 ) ) ( not ( = ?auto_9684 ?auto_9686 ) ) ( not ( = ?auto_9685 ?auto_9686 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9685 ?auto_9683 )
      ( DELIVER-3PKG-VERIFY ?auto_9684 ?auto_9685 ?auto_9686 ?auto_9683 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9694 - OBJ
      ?auto_9695 - OBJ
      ?auto_9696 - OBJ
      ?auto_9693 - LOCATION
    )
    :vars
    (
      ?auto_9697 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9697 ?auto_9693 ) ( IN-TRUCK ?auto_9694 ?auto_9697 ) ( OBJ-AT ?auto_9695 ?auto_9693 ) ( OBJ-AT ?auto_9696 ?auto_9693 ) ( not ( = ?auto_9694 ?auto_9695 ) ) ( not ( = ?auto_9694 ?auto_9696 ) ) ( not ( = ?auto_9695 ?auto_9696 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9694 ?auto_9693 )
      ( DELIVER-3PKG-VERIFY ?auto_9694 ?auto_9695 ?auto_9696 ?auto_9693 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9719 - OBJ
      ?auto_9720 - OBJ
      ?auto_9718 - LOCATION
    )
    :vars
    (
      ?auto_9723 - TRUCK
      ?auto_9722 - LOCATION
      ?auto_9721 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9720 ?auto_9723 ) ( TRUCK-AT ?auto_9723 ?auto_9722 ) ( IN-CITY ?auto_9722 ?auto_9721 ) ( IN-CITY ?auto_9718 ?auto_9721 ) ( not ( = ?auto_9718 ?auto_9722 ) ) ( OBJ-AT ?auto_9719 ?auto_9718 ) ( not ( = ?auto_9719 ?auto_9720 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9720 ?auto_9718 )
      ( DELIVER-2PKG-VERIFY ?auto_9719 ?auto_9720 ?auto_9718 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9725 - OBJ
      ?auto_9726 - OBJ
      ?auto_9724 - LOCATION
    )
    :vars
    (
      ?auto_9727 - TRUCK
      ?auto_9728 - LOCATION
      ?auto_9729 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9725 ?auto_9727 ) ( TRUCK-AT ?auto_9727 ?auto_9728 ) ( IN-CITY ?auto_9728 ?auto_9729 ) ( IN-CITY ?auto_9724 ?auto_9729 ) ( not ( = ?auto_9724 ?auto_9728 ) ) ( OBJ-AT ?auto_9726 ?auto_9724 ) ( not ( = ?auto_9726 ?auto_9725 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9726 ?auto_9725 ?auto_9724 )
      ( DELIVER-2PKG-VERIFY ?auto_9725 ?auto_9726 ?auto_9724 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9738 - OBJ
      ?auto_9739 - OBJ
      ?auto_9740 - OBJ
      ?auto_9737 - LOCATION
    )
    :vars
    (
      ?auto_9741 - TRUCK
      ?auto_9742 - LOCATION
      ?auto_9743 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9740 ?auto_9741 ) ( TRUCK-AT ?auto_9741 ?auto_9742 ) ( IN-CITY ?auto_9742 ?auto_9743 ) ( IN-CITY ?auto_9737 ?auto_9743 ) ( not ( = ?auto_9737 ?auto_9742 ) ) ( OBJ-AT ?auto_9738 ?auto_9737 ) ( not ( = ?auto_9738 ?auto_9740 ) ) ( OBJ-AT ?auto_9739 ?auto_9737 ) ( not ( = ?auto_9738 ?auto_9739 ) ) ( not ( = ?auto_9739 ?auto_9740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9738 ?auto_9740 ?auto_9737 )
      ( DELIVER-3PKG-VERIFY ?auto_9738 ?auto_9739 ?auto_9740 ?auto_9737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9745 - OBJ
      ?auto_9746 - OBJ
      ?auto_9747 - OBJ
      ?auto_9744 - LOCATION
    )
    :vars
    (
      ?auto_9748 - TRUCK
      ?auto_9749 - LOCATION
      ?auto_9750 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9746 ?auto_9748 ) ( TRUCK-AT ?auto_9748 ?auto_9749 ) ( IN-CITY ?auto_9749 ?auto_9750 ) ( IN-CITY ?auto_9744 ?auto_9750 ) ( not ( = ?auto_9744 ?auto_9749 ) ) ( OBJ-AT ?auto_9745 ?auto_9744 ) ( not ( = ?auto_9745 ?auto_9746 ) ) ( OBJ-AT ?auto_9747 ?auto_9744 ) ( not ( = ?auto_9745 ?auto_9747 ) ) ( not ( = ?auto_9746 ?auto_9747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9745 ?auto_9746 ?auto_9744 )
      ( DELIVER-3PKG-VERIFY ?auto_9745 ?auto_9746 ?auto_9747 ?auto_9744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9759 - OBJ
      ?auto_9760 - OBJ
      ?auto_9761 - OBJ
      ?auto_9758 - LOCATION
    )
    :vars
    (
      ?auto_9762 - TRUCK
      ?auto_9763 - LOCATION
      ?auto_9764 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9759 ?auto_9762 ) ( TRUCK-AT ?auto_9762 ?auto_9763 ) ( IN-CITY ?auto_9763 ?auto_9764 ) ( IN-CITY ?auto_9758 ?auto_9764 ) ( not ( = ?auto_9758 ?auto_9763 ) ) ( OBJ-AT ?auto_9760 ?auto_9758 ) ( not ( = ?auto_9760 ?auto_9759 ) ) ( OBJ-AT ?auto_9761 ?auto_9758 ) ( not ( = ?auto_9759 ?auto_9761 ) ) ( not ( = ?auto_9760 ?auto_9761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9760 ?auto_9759 ?auto_9758 )
      ( DELIVER-3PKG-VERIFY ?auto_9759 ?auto_9760 ?auto_9761 ?auto_9758 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9788 - OBJ
      ?auto_9787 - LOCATION
    )
    :vars
    (
      ?auto_9789 - TRUCK
      ?auto_9790 - LOCATION
      ?auto_9791 - CITY
      ?auto_9792 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9789 ?auto_9790 ) ( IN-CITY ?auto_9790 ?auto_9791 ) ( IN-CITY ?auto_9787 ?auto_9791 ) ( not ( = ?auto_9787 ?auto_9790 ) ) ( OBJ-AT ?auto_9792 ?auto_9787 ) ( not ( = ?auto_9792 ?auto_9788 ) ) ( OBJ-AT ?auto_9788 ?auto_9790 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9788 ?auto_9789 ?auto_9790 )
      ( DELIVER-2PKG ?auto_9792 ?auto_9788 ?auto_9787 )
      ( DELIVER-1PKG-VERIFY ?auto_9788 ?auto_9787 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9794 - OBJ
      ?auto_9795 - OBJ
      ?auto_9793 - LOCATION
    )
    :vars
    (
      ?auto_9797 - TRUCK
      ?auto_9796 - LOCATION
      ?auto_9798 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9797 ?auto_9796 ) ( IN-CITY ?auto_9796 ?auto_9798 ) ( IN-CITY ?auto_9793 ?auto_9798 ) ( not ( = ?auto_9793 ?auto_9796 ) ) ( OBJ-AT ?auto_9794 ?auto_9793 ) ( not ( = ?auto_9794 ?auto_9795 ) ) ( OBJ-AT ?auto_9795 ?auto_9796 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9795 ?auto_9793 )
      ( DELIVER-2PKG-VERIFY ?auto_9794 ?auto_9795 ?auto_9793 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9800 - OBJ
      ?auto_9801 - OBJ
      ?auto_9799 - LOCATION
    )
    :vars
    (
      ?auto_9803 - TRUCK
      ?auto_9804 - LOCATION
      ?auto_9802 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9803 ?auto_9804 ) ( IN-CITY ?auto_9804 ?auto_9802 ) ( IN-CITY ?auto_9799 ?auto_9802 ) ( not ( = ?auto_9799 ?auto_9804 ) ) ( OBJ-AT ?auto_9801 ?auto_9799 ) ( not ( = ?auto_9801 ?auto_9800 ) ) ( OBJ-AT ?auto_9800 ?auto_9804 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9801 ?auto_9800 ?auto_9799 )
      ( DELIVER-2PKG-VERIFY ?auto_9800 ?auto_9801 ?auto_9799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9813 - OBJ
      ?auto_9814 - OBJ
      ?auto_9815 - OBJ
      ?auto_9812 - LOCATION
    )
    :vars
    (
      ?auto_9817 - TRUCK
      ?auto_9818 - LOCATION
      ?auto_9816 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9817 ?auto_9818 ) ( IN-CITY ?auto_9818 ?auto_9816 ) ( IN-CITY ?auto_9812 ?auto_9816 ) ( not ( = ?auto_9812 ?auto_9818 ) ) ( OBJ-AT ?auto_9814 ?auto_9812 ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( OBJ-AT ?auto_9815 ?auto_9818 ) ( OBJ-AT ?auto_9813 ?auto_9812 ) ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9813 ?auto_9815 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9814 ?auto_9815 ?auto_9812 )
      ( DELIVER-3PKG-VERIFY ?auto_9813 ?auto_9814 ?auto_9815 ?auto_9812 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9820 - OBJ
      ?auto_9821 - OBJ
      ?auto_9822 - OBJ
      ?auto_9819 - LOCATION
    )
    :vars
    (
      ?auto_9824 - TRUCK
      ?auto_9825 - LOCATION
      ?auto_9823 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9824 ?auto_9825 ) ( IN-CITY ?auto_9825 ?auto_9823 ) ( IN-CITY ?auto_9819 ?auto_9823 ) ( not ( = ?auto_9819 ?auto_9825 ) ) ( OBJ-AT ?auto_9822 ?auto_9819 ) ( not ( = ?auto_9822 ?auto_9821 ) ) ( OBJ-AT ?auto_9821 ?auto_9825 ) ( OBJ-AT ?auto_9820 ?auto_9819 ) ( not ( = ?auto_9820 ?auto_9821 ) ) ( not ( = ?auto_9820 ?auto_9822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9822 ?auto_9821 ?auto_9819 )
      ( DELIVER-3PKG-VERIFY ?auto_9820 ?auto_9821 ?auto_9822 ?auto_9819 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9834 - OBJ
      ?auto_9835 - OBJ
      ?auto_9836 - OBJ
      ?auto_9833 - LOCATION
    )
    :vars
    (
      ?auto_9838 - TRUCK
      ?auto_9839 - LOCATION
      ?auto_9837 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9838 ?auto_9839 ) ( IN-CITY ?auto_9839 ?auto_9837 ) ( IN-CITY ?auto_9833 ?auto_9837 ) ( not ( = ?auto_9833 ?auto_9839 ) ) ( OBJ-AT ?auto_9836 ?auto_9833 ) ( not ( = ?auto_9836 ?auto_9834 ) ) ( OBJ-AT ?auto_9834 ?auto_9839 ) ( OBJ-AT ?auto_9835 ?auto_9833 ) ( not ( = ?auto_9834 ?auto_9835 ) ) ( not ( = ?auto_9835 ?auto_9836 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9836 ?auto_9834 ?auto_9833 )
      ( DELIVER-3PKG-VERIFY ?auto_9834 ?auto_9835 ?auto_9836 ?auto_9833 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9863 - OBJ
      ?auto_9862 - LOCATION
    )
    :vars
    (
      ?auto_9867 - LOCATION
      ?auto_9864 - CITY
      ?auto_9865 - OBJ
      ?auto_9866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9867 ?auto_9864 ) ( IN-CITY ?auto_9862 ?auto_9864 ) ( not ( = ?auto_9862 ?auto_9867 ) ) ( OBJ-AT ?auto_9865 ?auto_9862 ) ( not ( = ?auto_9865 ?auto_9863 ) ) ( OBJ-AT ?auto_9863 ?auto_9867 ) ( TRUCK-AT ?auto_9866 ?auto_9862 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9866 ?auto_9862 ?auto_9867 ?auto_9864 )
      ( DELIVER-2PKG ?auto_9865 ?auto_9863 ?auto_9862 )
      ( DELIVER-1PKG-VERIFY ?auto_9863 ?auto_9862 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9869 - OBJ
      ?auto_9870 - OBJ
      ?auto_9868 - LOCATION
    )
    :vars
    (
      ?auto_9871 - LOCATION
      ?auto_9872 - CITY
      ?auto_9873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9871 ?auto_9872 ) ( IN-CITY ?auto_9868 ?auto_9872 ) ( not ( = ?auto_9868 ?auto_9871 ) ) ( OBJ-AT ?auto_9869 ?auto_9868 ) ( not ( = ?auto_9869 ?auto_9870 ) ) ( OBJ-AT ?auto_9870 ?auto_9871 ) ( TRUCK-AT ?auto_9873 ?auto_9868 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9870 ?auto_9868 )
      ( DELIVER-2PKG-VERIFY ?auto_9869 ?auto_9870 ?auto_9868 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9875 - OBJ
      ?auto_9876 - OBJ
      ?auto_9874 - LOCATION
    )
    :vars
    (
      ?auto_9878 - LOCATION
      ?auto_9879 - CITY
      ?auto_9877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9878 ?auto_9879 ) ( IN-CITY ?auto_9874 ?auto_9879 ) ( not ( = ?auto_9874 ?auto_9878 ) ) ( OBJ-AT ?auto_9876 ?auto_9874 ) ( not ( = ?auto_9876 ?auto_9875 ) ) ( OBJ-AT ?auto_9875 ?auto_9878 ) ( TRUCK-AT ?auto_9877 ?auto_9874 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9876 ?auto_9875 ?auto_9874 )
      ( DELIVER-2PKG-VERIFY ?auto_9875 ?auto_9876 ?auto_9874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9888 - OBJ
      ?auto_9889 - OBJ
      ?auto_9890 - OBJ
      ?auto_9887 - LOCATION
    )
    :vars
    (
      ?auto_9892 - LOCATION
      ?auto_9893 - CITY
      ?auto_9891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9892 ?auto_9893 ) ( IN-CITY ?auto_9887 ?auto_9893 ) ( not ( = ?auto_9887 ?auto_9892 ) ) ( OBJ-AT ?auto_9889 ?auto_9887 ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( OBJ-AT ?auto_9890 ?auto_9892 ) ( TRUCK-AT ?auto_9891 ?auto_9887 ) ( OBJ-AT ?auto_9888 ?auto_9887 ) ( not ( = ?auto_9888 ?auto_9889 ) ) ( not ( = ?auto_9888 ?auto_9890 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9889 ?auto_9890 ?auto_9887 )
      ( DELIVER-3PKG-VERIFY ?auto_9888 ?auto_9889 ?auto_9890 ?auto_9887 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9895 - OBJ
      ?auto_9896 - OBJ
      ?auto_9897 - OBJ
      ?auto_9894 - LOCATION
    )
    :vars
    (
      ?auto_9899 - LOCATION
      ?auto_9900 - CITY
      ?auto_9898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9899 ?auto_9900 ) ( IN-CITY ?auto_9894 ?auto_9900 ) ( not ( = ?auto_9894 ?auto_9899 ) ) ( OBJ-AT ?auto_9897 ?auto_9894 ) ( not ( = ?auto_9897 ?auto_9896 ) ) ( OBJ-AT ?auto_9896 ?auto_9899 ) ( TRUCK-AT ?auto_9898 ?auto_9894 ) ( OBJ-AT ?auto_9895 ?auto_9894 ) ( not ( = ?auto_9895 ?auto_9896 ) ) ( not ( = ?auto_9895 ?auto_9897 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9897 ?auto_9896 ?auto_9894 )
      ( DELIVER-3PKG-VERIFY ?auto_9895 ?auto_9896 ?auto_9897 ?auto_9894 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9909 - OBJ
      ?auto_9910 - OBJ
      ?auto_9911 - OBJ
      ?auto_9908 - LOCATION
    )
    :vars
    (
      ?auto_9913 - LOCATION
      ?auto_9914 - CITY
      ?auto_9912 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9913 ?auto_9914 ) ( IN-CITY ?auto_9908 ?auto_9914 ) ( not ( = ?auto_9908 ?auto_9913 ) ) ( OBJ-AT ?auto_9910 ?auto_9908 ) ( not ( = ?auto_9910 ?auto_9909 ) ) ( OBJ-AT ?auto_9909 ?auto_9913 ) ( TRUCK-AT ?auto_9912 ?auto_9908 ) ( OBJ-AT ?auto_9911 ?auto_9908 ) ( not ( = ?auto_9909 ?auto_9911 ) ) ( not ( = ?auto_9910 ?auto_9911 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9910 ?auto_9909 ?auto_9908 )
      ( DELIVER-3PKG-VERIFY ?auto_9909 ?auto_9910 ?auto_9911 ?auto_9908 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9938 - OBJ
      ?auto_9937 - LOCATION
    )
    :vars
    (
      ?auto_9941 - LOCATION
      ?auto_9942 - CITY
      ?auto_9940 - OBJ
      ?auto_9939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9941 ?auto_9942 ) ( IN-CITY ?auto_9937 ?auto_9942 ) ( not ( = ?auto_9937 ?auto_9941 ) ) ( not ( = ?auto_9940 ?auto_9938 ) ) ( OBJ-AT ?auto_9938 ?auto_9941 ) ( TRUCK-AT ?auto_9939 ?auto_9937 ) ( IN-TRUCK ?auto_9940 ?auto_9939 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9940 ?auto_9937 )
      ( DELIVER-2PKG ?auto_9940 ?auto_9938 ?auto_9937 )
      ( DELIVER-1PKG-VERIFY ?auto_9938 ?auto_9937 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9944 - OBJ
      ?auto_9945 - OBJ
      ?auto_9943 - LOCATION
    )
    :vars
    (
      ?auto_9948 - LOCATION
      ?auto_9946 - CITY
      ?auto_9947 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9948 ?auto_9946 ) ( IN-CITY ?auto_9943 ?auto_9946 ) ( not ( = ?auto_9943 ?auto_9948 ) ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( OBJ-AT ?auto_9945 ?auto_9948 ) ( TRUCK-AT ?auto_9947 ?auto_9943 ) ( IN-TRUCK ?auto_9944 ?auto_9947 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9945 ?auto_9943 )
      ( DELIVER-2PKG-VERIFY ?auto_9944 ?auto_9945 ?auto_9943 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9950 - OBJ
      ?auto_9951 - OBJ
      ?auto_9949 - LOCATION
    )
    :vars
    (
      ?auto_9952 - LOCATION
      ?auto_9954 - CITY
      ?auto_9953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9952 ?auto_9954 ) ( IN-CITY ?auto_9949 ?auto_9954 ) ( not ( = ?auto_9949 ?auto_9952 ) ) ( not ( = ?auto_9951 ?auto_9950 ) ) ( OBJ-AT ?auto_9950 ?auto_9952 ) ( TRUCK-AT ?auto_9953 ?auto_9949 ) ( IN-TRUCK ?auto_9951 ?auto_9953 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9951 ?auto_9950 ?auto_9949 )
      ( DELIVER-2PKG-VERIFY ?auto_9950 ?auto_9951 ?auto_9949 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10013 - OBJ
      ?auto_10012 - LOCATION
    )
    :vars
    (
      ?auto_10014 - LOCATION
      ?auto_10017 - CITY
      ?auto_10015 - OBJ
      ?auto_10016 - TRUCK
      ?auto_10018 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10014 ?auto_10017 ) ( IN-CITY ?auto_10012 ?auto_10017 ) ( not ( = ?auto_10012 ?auto_10014 ) ) ( not ( = ?auto_10015 ?auto_10013 ) ) ( OBJ-AT ?auto_10013 ?auto_10014 ) ( IN-TRUCK ?auto_10015 ?auto_10016 ) ( TRUCK-AT ?auto_10016 ?auto_10018 ) ( IN-CITY ?auto_10018 ?auto_10017 ) ( not ( = ?auto_10012 ?auto_10018 ) ) ( not ( = ?auto_10014 ?auto_10018 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10016 ?auto_10018 ?auto_10012 ?auto_10017 )
      ( DELIVER-2PKG ?auto_10015 ?auto_10013 ?auto_10012 )
      ( DELIVER-1PKG-VERIFY ?auto_10013 ?auto_10012 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10020 - OBJ
      ?auto_10021 - OBJ
      ?auto_10019 - LOCATION
    )
    :vars
    (
      ?auto_10025 - LOCATION
      ?auto_10024 - CITY
      ?auto_10022 - TRUCK
      ?auto_10023 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10025 ?auto_10024 ) ( IN-CITY ?auto_10019 ?auto_10024 ) ( not ( = ?auto_10019 ?auto_10025 ) ) ( not ( = ?auto_10020 ?auto_10021 ) ) ( OBJ-AT ?auto_10021 ?auto_10025 ) ( IN-TRUCK ?auto_10020 ?auto_10022 ) ( TRUCK-AT ?auto_10022 ?auto_10023 ) ( IN-CITY ?auto_10023 ?auto_10024 ) ( not ( = ?auto_10019 ?auto_10023 ) ) ( not ( = ?auto_10025 ?auto_10023 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10021 ?auto_10019 )
      ( DELIVER-2PKG-VERIFY ?auto_10020 ?auto_10021 ?auto_10019 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10027 - OBJ
      ?auto_10028 - OBJ
      ?auto_10026 - LOCATION
    )
    :vars
    (
      ?auto_10030 - LOCATION
      ?auto_10029 - CITY
      ?auto_10031 - TRUCK
      ?auto_10032 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10030 ?auto_10029 ) ( IN-CITY ?auto_10026 ?auto_10029 ) ( not ( = ?auto_10026 ?auto_10030 ) ) ( not ( = ?auto_10028 ?auto_10027 ) ) ( OBJ-AT ?auto_10027 ?auto_10030 ) ( IN-TRUCK ?auto_10028 ?auto_10031 ) ( TRUCK-AT ?auto_10031 ?auto_10032 ) ( IN-CITY ?auto_10032 ?auto_10029 ) ( not ( = ?auto_10026 ?auto_10032 ) ) ( not ( = ?auto_10030 ?auto_10032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10028 ?auto_10027 ?auto_10026 )
      ( DELIVER-2PKG-VERIFY ?auto_10027 ?auto_10028 ?auto_10026 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10099 - OBJ
      ?auto_10098 - LOCATION
    )
    :vars
    (
      ?auto_10102 - LOCATION
      ?auto_10101 - CITY
      ?auto_10100 - OBJ
      ?auto_10103 - TRUCK
      ?auto_10104 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10102 ?auto_10101 ) ( IN-CITY ?auto_10098 ?auto_10101 ) ( not ( = ?auto_10098 ?auto_10102 ) ) ( not ( = ?auto_10100 ?auto_10099 ) ) ( OBJ-AT ?auto_10099 ?auto_10102 ) ( TRUCK-AT ?auto_10103 ?auto_10104 ) ( IN-CITY ?auto_10104 ?auto_10101 ) ( not ( = ?auto_10098 ?auto_10104 ) ) ( not ( = ?auto_10102 ?auto_10104 ) ) ( OBJ-AT ?auto_10100 ?auto_10104 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10100 ?auto_10103 ?auto_10104 )
      ( DELIVER-2PKG ?auto_10100 ?auto_10099 ?auto_10098 )
      ( DELIVER-1PKG-VERIFY ?auto_10099 ?auto_10098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10106 - OBJ
      ?auto_10107 - OBJ
      ?auto_10105 - LOCATION
    )
    :vars
    (
      ?auto_10109 - LOCATION
      ?auto_10111 - CITY
      ?auto_10108 - TRUCK
      ?auto_10110 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10109 ?auto_10111 ) ( IN-CITY ?auto_10105 ?auto_10111 ) ( not ( = ?auto_10105 ?auto_10109 ) ) ( not ( = ?auto_10106 ?auto_10107 ) ) ( OBJ-AT ?auto_10107 ?auto_10109 ) ( TRUCK-AT ?auto_10108 ?auto_10110 ) ( IN-CITY ?auto_10110 ?auto_10111 ) ( not ( = ?auto_10105 ?auto_10110 ) ) ( not ( = ?auto_10109 ?auto_10110 ) ) ( OBJ-AT ?auto_10106 ?auto_10110 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10107 ?auto_10105 )
      ( DELIVER-2PKG-VERIFY ?auto_10106 ?auto_10107 ?auto_10105 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10113 - OBJ
      ?auto_10114 - OBJ
      ?auto_10112 - LOCATION
    )
    :vars
    (
      ?auto_10115 - LOCATION
      ?auto_10117 - CITY
      ?auto_10116 - TRUCK
      ?auto_10118 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10115 ?auto_10117 ) ( IN-CITY ?auto_10112 ?auto_10117 ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10113 ) ) ( OBJ-AT ?auto_10113 ?auto_10115 ) ( TRUCK-AT ?auto_10116 ?auto_10118 ) ( IN-CITY ?auto_10118 ?auto_10117 ) ( not ( = ?auto_10112 ?auto_10118 ) ) ( not ( = ?auto_10115 ?auto_10118 ) ) ( OBJ-AT ?auto_10114 ?auto_10118 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10114 ?auto_10113 ?auto_10112 )
      ( DELIVER-2PKG-VERIFY ?auto_10113 ?auto_10114 ?auto_10112 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10487 - OBJ
      ?auto_10488 - OBJ
      ?auto_10489 - OBJ
      ?auto_10486 - LOCATION
    )
    :vars
    (
      ?auto_10492 - TRUCK
      ?auto_10490 - LOCATION
      ?auto_10491 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10489 ?auto_10492 ) ( TRUCK-AT ?auto_10492 ?auto_10490 ) ( IN-CITY ?auto_10490 ?auto_10491 ) ( IN-CITY ?auto_10486 ?auto_10491 ) ( not ( = ?auto_10486 ?auto_10490 ) ) ( OBJ-AT ?auto_10488 ?auto_10486 ) ( not ( = ?auto_10488 ?auto_10489 ) ) ( OBJ-AT ?auto_10487 ?auto_10486 ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( not ( = ?auto_10487 ?auto_10489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10488 ?auto_10489 ?auto_10486 )
      ( DELIVER-3PKG-VERIFY ?auto_10487 ?auto_10488 ?auto_10489 ?auto_10486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10520 - OBJ
      ?auto_10521 - OBJ
      ?auto_10522 - OBJ
      ?auto_10519 - LOCATION
    )
    :vars
    (
      ?auto_10526 - TRUCK
      ?auto_10524 - LOCATION
      ?auto_10525 - CITY
      ?auto_10523 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10522 ?auto_10526 ) ( TRUCK-AT ?auto_10526 ?auto_10524 ) ( IN-CITY ?auto_10524 ?auto_10525 ) ( IN-CITY ?auto_10519 ?auto_10525 ) ( not ( = ?auto_10519 ?auto_10524 ) ) ( OBJ-AT ?auto_10523 ?auto_10519 ) ( not ( = ?auto_10523 ?auto_10522 ) ) ( OBJ-AT ?auto_10520 ?auto_10519 ) ( OBJ-AT ?auto_10521 ?auto_10519 ) ( not ( = ?auto_10520 ?auto_10521 ) ) ( not ( = ?auto_10520 ?auto_10522 ) ) ( not ( = ?auto_10520 ?auto_10523 ) ) ( not ( = ?auto_10521 ?auto_10522 ) ) ( not ( = ?auto_10521 ?auto_10523 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10523 ?auto_10522 ?auto_10519 )
      ( DELIVER-3PKG-VERIFY ?auto_10520 ?auto_10521 ?auto_10522 ?auto_10519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10532 - OBJ
      ?auto_10533 - OBJ
      ?auto_10534 - OBJ
      ?auto_10531 - LOCATION
    )
    :vars
    (
      ?auto_10538 - TRUCK
      ?auto_10536 - LOCATION
      ?auto_10537 - CITY
      ?auto_10535 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10533 ?auto_10538 ) ( TRUCK-AT ?auto_10538 ?auto_10536 ) ( IN-CITY ?auto_10536 ?auto_10537 ) ( IN-CITY ?auto_10531 ?auto_10537 ) ( not ( = ?auto_10531 ?auto_10536 ) ) ( OBJ-AT ?auto_10535 ?auto_10531 ) ( not ( = ?auto_10535 ?auto_10533 ) ) ( OBJ-AT ?auto_10532 ?auto_10531 ) ( OBJ-AT ?auto_10534 ?auto_10531 ) ( not ( = ?auto_10532 ?auto_10533 ) ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( not ( = ?auto_10532 ?auto_10535 ) ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( not ( = ?auto_10534 ?auto_10535 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10535 ?auto_10533 ?auto_10531 )
      ( DELIVER-3PKG-VERIFY ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10531 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10570 - OBJ
      ?auto_10571 - OBJ
      ?auto_10572 - OBJ
      ?auto_10569 - LOCATION
    )
    :vars
    (
      ?auto_10576 - TRUCK
      ?auto_10574 - LOCATION
      ?auto_10575 - CITY
      ?auto_10573 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10570 ?auto_10576 ) ( TRUCK-AT ?auto_10576 ?auto_10574 ) ( IN-CITY ?auto_10574 ?auto_10575 ) ( IN-CITY ?auto_10569 ?auto_10575 ) ( not ( = ?auto_10569 ?auto_10574 ) ) ( OBJ-AT ?auto_10573 ?auto_10569 ) ( not ( = ?auto_10573 ?auto_10570 ) ) ( OBJ-AT ?auto_10571 ?auto_10569 ) ( OBJ-AT ?auto_10572 ?auto_10569 ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( not ( = ?auto_10570 ?auto_10572 ) ) ( not ( = ?auto_10571 ?auto_10572 ) ) ( not ( = ?auto_10571 ?auto_10573 ) ) ( not ( = ?auto_10572 ?auto_10573 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10573 ?auto_10570 ?auto_10569 )
      ( DELIVER-3PKG-VERIFY ?auto_10570 ?auto_10571 ?auto_10572 ?auto_10569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10640 - OBJ
      ?auto_10641 - OBJ
      ?auto_10642 - OBJ
      ?auto_10639 - LOCATION
    )
    :vars
    (
      ?auto_10645 - TRUCK
      ?auto_10644 - LOCATION
      ?auto_10643 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10645 ?auto_10644 ) ( IN-CITY ?auto_10644 ?auto_10643 ) ( IN-CITY ?auto_10639 ?auto_10643 ) ( not ( = ?auto_10639 ?auto_10644 ) ) ( OBJ-AT ?auto_10640 ?auto_10639 ) ( not ( = ?auto_10640 ?auto_10642 ) ) ( OBJ-AT ?auto_10642 ?auto_10644 ) ( OBJ-AT ?auto_10641 ?auto_10639 ) ( not ( = ?auto_10640 ?auto_10641 ) ) ( not ( = ?auto_10641 ?auto_10642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10640 ?auto_10642 ?auto_10639 )
      ( DELIVER-3PKG-VERIFY ?auto_10640 ?auto_10641 ?auto_10642 ?auto_10639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10673 - OBJ
      ?auto_10674 - OBJ
      ?auto_10675 - OBJ
      ?auto_10672 - LOCATION
    )
    :vars
    (
      ?auto_10678 - TRUCK
      ?auto_10677 - LOCATION
      ?auto_10676 - CITY
      ?auto_10679 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10678 ?auto_10677 ) ( IN-CITY ?auto_10677 ?auto_10676 ) ( IN-CITY ?auto_10672 ?auto_10676 ) ( not ( = ?auto_10672 ?auto_10677 ) ) ( OBJ-AT ?auto_10679 ?auto_10672 ) ( not ( = ?auto_10679 ?auto_10675 ) ) ( OBJ-AT ?auto_10675 ?auto_10677 ) ( OBJ-AT ?auto_10673 ?auto_10672 ) ( OBJ-AT ?auto_10674 ?auto_10672 ) ( not ( = ?auto_10673 ?auto_10674 ) ) ( not ( = ?auto_10673 ?auto_10675 ) ) ( not ( = ?auto_10673 ?auto_10679 ) ) ( not ( = ?auto_10674 ?auto_10675 ) ) ( not ( = ?auto_10674 ?auto_10679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10679 ?auto_10675 ?auto_10672 )
      ( DELIVER-3PKG-VERIFY ?auto_10673 ?auto_10674 ?auto_10675 ?auto_10672 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10685 - OBJ
      ?auto_10686 - OBJ
      ?auto_10687 - OBJ
      ?auto_10684 - LOCATION
    )
    :vars
    (
      ?auto_10690 - TRUCK
      ?auto_10689 - LOCATION
      ?auto_10688 - CITY
      ?auto_10691 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10690 ?auto_10689 ) ( IN-CITY ?auto_10689 ?auto_10688 ) ( IN-CITY ?auto_10684 ?auto_10688 ) ( not ( = ?auto_10684 ?auto_10689 ) ) ( OBJ-AT ?auto_10691 ?auto_10684 ) ( not ( = ?auto_10691 ?auto_10686 ) ) ( OBJ-AT ?auto_10686 ?auto_10689 ) ( OBJ-AT ?auto_10685 ?auto_10684 ) ( OBJ-AT ?auto_10687 ?auto_10684 ) ( not ( = ?auto_10685 ?auto_10686 ) ) ( not ( = ?auto_10685 ?auto_10687 ) ) ( not ( = ?auto_10685 ?auto_10691 ) ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10687 ?auto_10691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10691 ?auto_10686 ?auto_10684 )
      ( DELIVER-3PKG-VERIFY ?auto_10685 ?auto_10686 ?auto_10687 ?auto_10684 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10701 - OBJ
      ?auto_10702 - OBJ
      ?auto_10703 - OBJ
      ?auto_10700 - LOCATION
    )
    :vars
    (
      ?auto_10706 - TRUCK
      ?auto_10705 - LOCATION
      ?auto_10704 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10706 ?auto_10705 ) ( IN-CITY ?auto_10705 ?auto_10704 ) ( IN-CITY ?auto_10700 ?auto_10704 ) ( not ( = ?auto_10700 ?auto_10705 ) ) ( OBJ-AT ?auto_10702 ?auto_10700 ) ( not ( = ?auto_10702 ?auto_10701 ) ) ( OBJ-AT ?auto_10701 ?auto_10705 ) ( OBJ-AT ?auto_10703 ?auto_10700 ) ( not ( = ?auto_10701 ?auto_10703 ) ) ( not ( = ?auto_10702 ?auto_10703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10702 ?auto_10701 ?auto_10700 )
      ( DELIVER-3PKG-VERIFY ?auto_10701 ?auto_10702 ?auto_10703 ?auto_10700 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10723 - OBJ
      ?auto_10724 - OBJ
      ?auto_10725 - OBJ
      ?auto_10722 - LOCATION
    )
    :vars
    (
      ?auto_10728 - TRUCK
      ?auto_10727 - LOCATION
      ?auto_10726 - CITY
      ?auto_10729 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10728 ?auto_10727 ) ( IN-CITY ?auto_10727 ?auto_10726 ) ( IN-CITY ?auto_10722 ?auto_10726 ) ( not ( = ?auto_10722 ?auto_10727 ) ) ( OBJ-AT ?auto_10729 ?auto_10722 ) ( not ( = ?auto_10729 ?auto_10723 ) ) ( OBJ-AT ?auto_10723 ?auto_10727 ) ( OBJ-AT ?auto_10724 ?auto_10722 ) ( OBJ-AT ?auto_10725 ?auto_10722 ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10729 ) ) ( not ( = ?auto_10725 ?auto_10729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10729 ?auto_10723 ?auto_10722 )
      ( DELIVER-3PKG-VERIFY ?auto_10723 ?auto_10724 ?auto_10725 ?auto_10722 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10793 - OBJ
      ?auto_10794 - OBJ
      ?auto_10795 - OBJ
      ?auto_10792 - LOCATION
    )
    :vars
    (
      ?auto_10798 - LOCATION
      ?auto_10797 - CITY
      ?auto_10796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10798 ?auto_10797 ) ( IN-CITY ?auto_10792 ?auto_10797 ) ( not ( = ?auto_10792 ?auto_10798 ) ) ( OBJ-AT ?auto_10793 ?auto_10792 ) ( not ( = ?auto_10793 ?auto_10795 ) ) ( OBJ-AT ?auto_10795 ?auto_10798 ) ( TRUCK-AT ?auto_10796 ?auto_10792 ) ( OBJ-AT ?auto_10794 ?auto_10792 ) ( not ( = ?auto_10793 ?auto_10794 ) ) ( not ( = ?auto_10794 ?auto_10795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10793 ?auto_10795 ?auto_10792 )
      ( DELIVER-3PKG-VERIFY ?auto_10793 ?auto_10794 ?auto_10795 ?auto_10792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10826 - OBJ
      ?auto_10827 - OBJ
      ?auto_10828 - OBJ
      ?auto_10825 - LOCATION
    )
    :vars
    (
      ?auto_10831 - LOCATION
      ?auto_10830 - CITY
      ?auto_10832 - OBJ
      ?auto_10829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10831 ?auto_10830 ) ( IN-CITY ?auto_10825 ?auto_10830 ) ( not ( = ?auto_10825 ?auto_10831 ) ) ( OBJ-AT ?auto_10832 ?auto_10825 ) ( not ( = ?auto_10832 ?auto_10828 ) ) ( OBJ-AT ?auto_10828 ?auto_10831 ) ( TRUCK-AT ?auto_10829 ?auto_10825 ) ( OBJ-AT ?auto_10826 ?auto_10825 ) ( OBJ-AT ?auto_10827 ?auto_10825 ) ( not ( = ?auto_10826 ?auto_10827 ) ) ( not ( = ?auto_10826 ?auto_10828 ) ) ( not ( = ?auto_10826 ?auto_10832 ) ) ( not ( = ?auto_10827 ?auto_10828 ) ) ( not ( = ?auto_10827 ?auto_10832 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10832 ?auto_10828 ?auto_10825 )
      ( DELIVER-3PKG-VERIFY ?auto_10826 ?auto_10827 ?auto_10828 ?auto_10825 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10838 - OBJ
      ?auto_10839 - OBJ
      ?auto_10840 - OBJ
      ?auto_10837 - LOCATION
    )
    :vars
    (
      ?auto_10843 - LOCATION
      ?auto_10842 - CITY
      ?auto_10844 - OBJ
      ?auto_10841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10843 ?auto_10842 ) ( IN-CITY ?auto_10837 ?auto_10842 ) ( not ( = ?auto_10837 ?auto_10843 ) ) ( OBJ-AT ?auto_10844 ?auto_10837 ) ( not ( = ?auto_10844 ?auto_10839 ) ) ( OBJ-AT ?auto_10839 ?auto_10843 ) ( TRUCK-AT ?auto_10841 ?auto_10837 ) ( OBJ-AT ?auto_10838 ?auto_10837 ) ( OBJ-AT ?auto_10840 ?auto_10837 ) ( not ( = ?auto_10838 ?auto_10839 ) ) ( not ( = ?auto_10838 ?auto_10840 ) ) ( not ( = ?auto_10838 ?auto_10844 ) ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( not ( = ?auto_10840 ?auto_10844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10844 ?auto_10839 ?auto_10837 )
      ( DELIVER-3PKG-VERIFY ?auto_10838 ?auto_10839 ?auto_10840 ?auto_10837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10876 - OBJ
      ?auto_10877 - OBJ
      ?auto_10878 - OBJ
      ?auto_10875 - LOCATION
    )
    :vars
    (
      ?auto_10881 - LOCATION
      ?auto_10880 - CITY
      ?auto_10882 - OBJ
      ?auto_10879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10881 ?auto_10880 ) ( IN-CITY ?auto_10875 ?auto_10880 ) ( not ( = ?auto_10875 ?auto_10881 ) ) ( OBJ-AT ?auto_10882 ?auto_10875 ) ( not ( = ?auto_10882 ?auto_10876 ) ) ( OBJ-AT ?auto_10876 ?auto_10881 ) ( TRUCK-AT ?auto_10879 ?auto_10875 ) ( OBJ-AT ?auto_10877 ?auto_10875 ) ( OBJ-AT ?auto_10878 ?auto_10875 ) ( not ( = ?auto_10876 ?auto_10877 ) ) ( not ( = ?auto_10876 ?auto_10878 ) ) ( not ( = ?auto_10877 ?auto_10878 ) ) ( not ( = ?auto_10877 ?auto_10882 ) ) ( not ( = ?auto_10878 ?auto_10882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10882 ?auto_10876 ?auto_10875 )
      ( DELIVER-3PKG-VERIFY ?auto_10876 ?auto_10877 ?auto_10878 ?auto_10875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10958 - OBJ
      ?auto_10959 - OBJ
      ?auto_10960 - OBJ
      ?auto_10957 - LOCATION
    )
    :vars
    (
      ?auto_10963 - LOCATION
      ?auto_10961 - CITY
      ?auto_10962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10963 ?auto_10961 ) ( IN-CITY ?auto_10957 ?auto_10961 ) ( not ( = ?auto_10957 ?auto_10963 ) ) ( OBJ-AT ?auto_10958 ?auto_10957 ) ( not ( = ?auto_10958 ?auto_10959 ) ) ( OBJ-AT ?auto_10959 ?auto_10963 ) ( TRUCK-AT ?auto_10962 ?auto_10957 ) ( OBJ-AT ?auto_10960 ?auto_10957 ) ( not ( = ?auto_10958 ?auto_10960 ) ) ( not ( = ?auto_10959 ?auto_10960 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10958 ?auto_10959 ?auto_10957 )
      ( DELIVER-3PKG-VERIFY ?auto_10958 ?auto_10959 ?auto_10960 ?auto_10957 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11017 - OBJ
      ?auto_11018 - OBJ
      ?auto_11019 - OBJ
      ?auto_11016 - LOCATION
    )
    :vars
    (
      ?auto_11022 - LOCATION
      ?auto_11020 - CITY
      ?auto_11021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11022 ?auto_11020 ) ( IN-CITY ?auto_11016 ?auto_11020 ) ( not ( = ?auto_11016 ?auto_11022 ) ) ( OBJ-AT ?auto_11019 ?auto_11016 ) ( not ( = ?auto_11019 ?auto_11017 ) ) ( OBJ-AT ?auto_11017 ?auto_11022 ) ( TRUCK-AT ?auto_11021 ?auto_11016 ) ( OBJ-AT ?auto_11018 ?auto_11016 ) ( not ( = ?auto_11017 ?auto_11018 ) ) ( not ( = ?auto_11018 ?auto_11019 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11019 ?auto_11017 ?auto_11016 )
      ( DELIVER-3PKG-VERIFY ?auto_11017 ?auto_11018 ?auto_11019 ?auto_11016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11127 - OBJ
      ?auto_11128 - OBJ
      ?auto_11129 - OBJ
      ?auto_11126 - LOCATION
    )
    :vars
    (
      ?auto_11131 - TRUCK
      ?auto_11130 - LOCATION
      ?auto_11132 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11131 ?auto_11130 ) ( IN-CITY ?auto_11130 ?auto_11132 ) ( IN-CITY ?auto_11126 ?auto_11132 ) ( not ( = ?auto_11126 ?auto_11130 ) ) ( OBJ-AT ?auto_11127 ?auto_11126 ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( OBJ-AT ?auto_11128 ?auto_11130 ) ( OBJ-AT ?auto_11129 ?auto_11126 ) ( not ( = ?auto_11127 ?auto_11129 ) ) ( not ( = ?auto_11128 ?auto_11129 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11127 ?auto_11128 ?auto_11126 )
      ( DELIVER-3PKG-VERIFY ?auto_11127 ?auto_11128 ?auto_11129 ?auto_11126 ) )
  )

)

