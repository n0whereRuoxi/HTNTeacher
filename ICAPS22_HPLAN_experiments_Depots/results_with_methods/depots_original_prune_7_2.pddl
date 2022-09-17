( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9663 - SURFACE
      ?auto_9664 - SURFACE
    )
    :vars
    (
      ?auto_9665 - HOIST
      ?auto_9666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9665 ?auto_9666 ) ( SURFACE-AT ?auto_9664 ?auto_9666 ) ( CLEAR ?auto_9664 ) ( LIFTING ?auto_9665 ?auto_9663 ) ( IS-CRATE ?auto_9663 ) ( not ( = ?auto_9663 ?auto_9664 ) ) )
    :subtasks
    ( ( !DROP ?auto_9665 ?auto_9663 ?auto_9664 ?auto_9666 )
      ( MAKE-ON-VERIFY ?auto_9663 ?auto_9664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9667 - SURFACE
      ?auto_9668 - SURFACE
    )
    :vars
    (
      ?auto_9670 - HOIST
      ?auto_9669 - PLACE
      ?auto_9671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9670 ?auto_9669 ) ( SURFACE-AT ?auto_9668 ?auto_9669 ) ( CLEAR ?auto_9668 ) ( IS-CRATE ?auto_9667 ) ( not ( = ?auto_9667 ?auto_9668 ) ) ( TRUCK-AT ?auto_9671 ?auto_9669 ) ( AVAILABLE ?auto_9670 ) ( IN ?auto_9667 ?auto_9671 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9670 ?auto_9667 ?auto_9671 ?auto_9669 )
      ( MAKE-ON ?auto_9667 ?auto_9668 )
      ( MAKE-ON-VERIFY ?auto_9667 ?auto_9668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9672 - SURFACE
      ?auto_9673 - SURFACE
    )
    :vars
    (
      ?auto_9675 - HOIST
      ?auto_9674 - PLACE
      ?auto_9676 - TRUCK
      ?auto_9677 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9675 ?auto_9674 ) ( SURFACE-AT ?auto_9673 ?auto_9674 ) ( CLEAR ?auto_9673 ) ( IS-CRATE ?auto_9672 ) ( not ( = ?auto_9672 ?auto_9673 ) ) ( AVAILABLE ?auto_9675 ) ( IN ?auto_9672 ?auto_9676 ) ( TRUCK-AT ?auto_9676 ?auto_9677 ) ( not ( = ?auto_9677 ?auto_9674 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9676 ?auto_9677 ?auto_9674 )
      ( MAKE-ON ?auto_9672 ?auto_9673 )
      ( MAKE-ON-VERIFY ?auto_9672 ?auto_9673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9678 - SURFACE
      ?auto_9679 - SURFACE
    )
    :vars
    (
      ?auto_9680 - HOIST
      ?auto_9683 - PLACE
      ?auto_9681 - TRUCK
      ?auto_9682 - PLACE
      ?auto_9684 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9680 ?auto_9683 ) ( SURFACE-AT ?auto_9679 ?auto_9683 ) ( CLEAR ?auto_9679 ) ( IS-CRATE ?auto_9678 ) ( not ( = ?auto_9678 ?auto_9679 ) ) ( AVAILABLE ?auto_9680 ) ( TRUCK-AT ?auto_9681 ?auto_9682 ) ( not ( = ?auto_9682 ?auto_9683 ) ) ( HOIST-AT ?auto_9684 ?auto_9682 ) ( LIFTING ?auto_9684 ?auto_9678 ) ( not ( = ?auto_9680 ?auto_9684 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9684 ?auto_9678 ?auto_9681 ?auto_9682 )
      ( MAKE-ON ?auto_9678 ?auto_9679 )
      ( MAKE-ON-VERIFY ?auto_9678 ?auto_9679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9685 - SURFACE
      ?auto_9686 - SURFACE
    )
    :vars
    (
      ?auto_9690 - HOIST
      ?auto_9691 - PLACE
      ?auto_9689 - TRUCK
      ?auto_9688 - PLACE
      ?auto_9687 - HOIST
      ?auto_9692 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9690 ?auto_9691 ) ( SURFACE-AT ?auto_9686 ?auto_9691 ) ( CLEAR ?auto_9686 ) ( IS-CRATE ?auto_9685 ) ( not ( = ?auto_9685 ?auto_9686 ) ) ( AVAILABLE ?auto_9690 ) ( TRUCK-AT ?auto_9689 ?auto_9688 ) ( not ( = ?auto_9688 ?auto_9691 ) ) ( HOIST-AT ?auto_9687 ?auto_9688 ) ( not ( = ?auto_9690 ?auto_9687 ) ) ( AVAILABLE ?auto_9687 ) ( SURFACE-AT ?auto_9685 ?auto_9688 ) ( ON ?auto_9685 ?auto_9692 ) ( CLEAR ?auto_9685 ) ( not ( = ?auto_9685 ?auto_9692 ) ) ( not ( = ?auto_9686 ?auto_9692 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9687 ?auto_9685 ?auto_9692 ?auto_9688 )
      ( MAKE-ON ?auto_9685 ?auto_9686 )
      ( MAKE-ON-VERIFY ?auto_9685 ?auto_9686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9693 - SURFACE
      ?auto_9694 - SURFACE
    )
    :vars
    (
      ?auto_9698 - HOIST
      ?auto_9695 - PLACE
      ?auto_9696 - PLACE
      ?auto_9697 - HOIST
      ?auto_9700 - SURFACE
      ?auto_9699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9698 ?auto_9695 ) ( SURFACE-AT ?auto_9694 ?auto_9695 ) ( CLEAR ?auto_9694 ) ( IS-CRATE ?auto_9693 ) ( not ( = ?auto_9693 ?auto_9694 ) ) ( AVAILABLE ?auto_9698 ) ( not ( = ?auto_9696 ?auto_9695 ) ) ( HOIST-AT ?auto_9697 ?auto_9696 ) ( not ( = ?auto_9698 ?auto_9697 ) ) ( AVAILABLE ?auto_9697 ) ( SURFACE-AT ?auto_9693 ?auto_9696 ) ( ON ?auto_9693 ?auto_9700 ) ( CLEAR ?auto_9693 ) ( not ( = ?auto_9693 ?auto_9700 ) ) ( not ( = ?auto_9694 ?auto_9700 ) ) ( TRUCK-AT ?auto_9699 ?auto_9695 ) )
    :subtasks
    ( ( !DRIVE ?auto_9699 ?auto_9695 ?auto_9696 )
      ( MAKE-ON ?auto_9693 ?auto_9694 )
      ( MAKE-ON-VERIFY ?auto_9693 ?auto_9694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9741 - SURFACE
      ?auto_9742 - SURFACE
    )
    :vars
    (
      ?auto_9744 - HOIST
      ?auto_9746 - PLACE
      ?auto_9747 - PLACE
      ?auto_9743 - HOIST
      ?auto_9748 - SURFACE
      ?auto_9745 - TRUCK
      ?auto_9749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9744 ?auto_9746 ) ( IS-CRATE ?auto_9741 ) ( not ( = ?auto_9741 ?auto_9742 ) ) ( not ( = ?auto_9747 ?auto_9746 ) ) ( HOIST-AT ?auto_9743 ?auto_9747 ) ( not ( = ?auto_9744 ?auto_9743 ) ) ( AVAILABLE ?auto_9743 ) ( SURFACE-AT ?auto_9741 ?auto_9747 ) ( ON ?auto_9741 ?auto_9748 ) ( CLEAR ?auto_9741 ) ( not ( = ?auto_9741 ?auto_9748 ) ) ( not ( = ?auto_9742 ?auto_9748 ) ) ( TRUCK-AT ?auto_9745 ?auto_9746 ) ( SURFACE-AT ?auto_9749 ?auto_9746 ) ( CLEAR ?auto_9749 ) ( LIFTING ?auto_9744 ?auto_9742 ) ( IS-CRATE ?auto_9742 ) ( not ( = ?auto_9741 ?auto_9749 ) ) ( not ( = ?auto_9742 ?auto_9749 ) ) ( not ( = ?auto_9748 ?auto_9749 ) ) )
    :subtasks
    ( ( !DROP ?auto_9744 ?auto_9742 ?auto_9749 ?auto_9746 )
      ( MAKE-ON ?auto_9741 ?auto_9742 )
      ( MAKE-ON-VERIFY ?auto_9741 ?auto_9742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9750 - SURFACE
      ?auto_9751 - SURFACE
    )
    :vars
    (
      ?auto_9754 - HOIST
      ?auto_9757 - PLACE
      ?auto_9752 - PLACE
      ?auto_9753 - HOIST
      ?auto_9755 - SURFACE
      ?auto_9756 - TRUCK
      ?auto_9758 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9754 ?auto_9757 ) ( IS-CRATE ?auto_9750 ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9752 ?auto_9757 ) ) ( HOIST-AT ?auto_9753 ?auto_9752 ) ( not ( = ?auto_9754 ?auto_9753 ) ) ( AVAILABLE ?auto_9753 ) ( SURFACE-AT ?auto_9750 ?auto_9752 ) ( ON ?auto_9750 ?auto_9755 ) ( CLEAR ?auto_9750 ) ( not ( = ?auto_9750 ?auto_9755 ) ) ( not ( = ?auto_9751 ?auto_9755 ) ) ( TRUCK-AT ?auto_9756 ?auto_9757 ) ( SURFACE-AT ?auto_9758 ?auto_9757 ) ( CLEAR ?auto_9758 ) ( IS-CRATE ?auto_9751 ) ( not ( = ?auto_9750 ?auto_9758 ) ) ( not ( = ?auto_9751 ?auto_9758 ) ) ( not ( = ?auto_9755 ?auto_9758 ) ) ( AVAILABLE ?auto_9754 ) ( IN ?auto_9751 ?auto_9756 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9754 ?auto_9751 ?auto_9756 ?auto_9757 )
      ( MAKE-ON ?auto_9750 ?auto_9751 )
      ( MAKE-ON-VERIFY ?auto_9750 ?auto_9751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9759 - SURFACE
      ?auto_9760 - SURFACE
    )
    :vars
    (
      ?auto_9762 - HOIST
      ?auto_9766 - PLACE
      ?auto_9767 - PLACE
      ?auto_9761 - HOIST
      ?auto_9765 - SURFACE
      ?auto_9763 - SURFACE
      ?auto_9764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9762 ?auto_9766 ) ( IS-CRATE ?auto_9759 ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9767 ?auto_9766 ) ) ( HOIST-AT ?auto_9761 ?auto_9767 ) ( not ( = ?auto_9762 ?auto_9761 ) ) ( AVAILABLE ?auto_9761 ) ( SURFACE-AT ?auto_9759 ?auto_9767 ) ( ON ?auto_9759 ?auto_9765 ) ( CLEAR ?auto_9759 ) ( not ( = ?auto_9759 ?auto_9765 ) ) ( not ( = ?auto_9760 ?auto_9765 ) ) ( SURFACE-AT ?auto_9763 ?auto_9766 ) ( CLEAR ?auto_9763 ) ( IS-CRATE ?auto_9760 ) ( not ( = ?auto_9759 ?auto_9763 ) ) ( not ( = ?auto_9760 ?auto_9763 ) ) ( not ( = ?auto_9765 ?auto_9763 ) ) ( AVAILABLE ?auto_9762 ) ( IN ?auto_9760 ?auto_9764 ) ( TRUCK-AT ?auto_9764 ?auto_9767 ) )
    :subtasks
    ( ( !DRIVE ?auto_9764 ?auto_9767 ?auto_9766 )
      ( MAKE-ON ?auto_9759 ?auto_9760 )
      ( MAKE-ON-VERIFY ?auto_9759 ?auto_9760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9768 - SURFACE
      ?auto_9769 - SURFACE
    )
    :vars
    (
      ?auto_9770 - HOIST
      ?auto_9773 - PLACE
      ?auto_9776 - PLACE
      ?auto_9775 - HOIST
      ?auto_9774 - SURFACE
      ?auto_9771 - SURFACE
      ?auto_9772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9770 ?auto_9773 ) ( IS-CRATE ?auto_9768 ) ( not ( = ?auto_9768 ?auto_9769 ) ) ( not ( = ?auto_9776 ?auto_9773 ) ) ( HOIST-AT ?auto_9775 ?auto_9776 ) ( not ( = ?auto_9770 ?auto_9775 ) ) ( SURFACE-AT ?auto_9768 ?auto_9776 ) ( ON ?auto_9768 ?auto_9774 ) ( CLEAR ?auto_9768 ) ( not ( = ?auto_9768 ?auto_9774 ) ) ( not ( = ?auto_9769 ?auto_9774 ) ) ( SURFACE-AT ?auto_9771 ?auto_9773 ) ( CLEAR ?auto_9771 ) ( IS-CRATE ?auto_9769 ) ( not ( = ?auto_9768 ?auto_9771 ) ) ( not ( = ?auto_9769 ?auto_9771 ) ) ( not ( = ?auto_9774 ?auto_9771 ) ) ( AVAILABLE ?auto_9770 ) ( TRUCK-AT ?auto_9772 ?auto_9776 ) ( LIFTING ?auto_9775 ?auto_9769 ) )
    :subtasks
    ( ( !LOAD ?auto_9775 ?auto_9769 ?auto_9772 ?auto_9776 )
      ( MAKE-ON ?auto_9768 ?auto_9769 )
      ( MAKE-ON-VERIFY ?auto_9768 ?auto_9769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9777 - SURFACE
      ?auto_9778 - SURFACE
    )
    :vars
    (
      ?auto_9785 - HOIST
      ?auto_9783 - PLACE
      ?auto_9779 - PLACE
      ?auto_9780 - HOIST
      ?auto_9781 - SURFACE
      ?auto_9782 - SURFACE
      ?auto_9784 - TRUCK
      ?auto_9786 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9785 ?auto_9783 ) ( IS-CRATE ?auto_9777 ) ( not ( = ?auto_9777 ?auto_9778 ) ) ( not ( = ?auto_9779 ?auto_9783 ) ) ( HOIST-AT ?auto_9780 ?auto_9779 ) ( not ( = ?auto_9785 ?auto_9780 ) ) ( SURFACE-AT ?auto_9777 ?auto_9779 ) ( ON ?auto_9777 ?auto_9781 ) ( CLEAR ?auto_9777 ) ( not ( = ?auto_9777 ?auto_9781 ) ) ( not ( = ?auto_9778 ?auto_9781 ) ) ( SURFACE-AT ?auto_9782 ?auto_9783 ) ( CLEAR ?auto_9782 ) ( IS-CRATE ?auto_9778 ) ( not ( = ?auto_9777 ?auto_9782 ) ) ( not ( = ?auto_9778 ?auto_9782 ) ) ( not ( = ?auto_9781 ?auto_9782 ) ) ( AVAILABLE ?auto_9785 ) ( TRUCK-AT ?auto_9784 ?auto_9779 ) ( AVAILABLE ?auto_9780 ) ( SURFACE-AT ?auto_9778 ?auto_9779 ) ( ON ?auto_9778 ?auto_9786 ) ( CLEAR ?auto_9778 ) ( not ( = ?auto_9777 ?auto_9786 ) ) ( not ( = ?auto_9778 ?auto_9786 ) ) ( not ( = ?auto_9781 ?auto_9786 ) ) ( not ( = ?auto_9782 ?auto_9786 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9780 ?auto_9778 ?auto_9786 ?auto_9779 )
      ( MAKE-ON ?auto_9777 ?auto_9778 )
      ( MAKE-ON-VERIFY ?auto_9777 ?auto_9778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9787 - SURFACE
      ?auto_9788 - SURFACE
    )
    :vars
    (
      ?auto_9791 - HOIST
      ?auto_9793 - PLACE
      ?auto_9795 - PLACE
      ?auto_9794 - HOIST
      ?auto_9792 - SURFACE
      ?auto_9790 - SURFACE
      ?auto_9796 - SURFACE
      ?auto_9789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9791 ?auto_9793 ) ( IS-CRATE ?auto_9787 ) ( not ( = ?auto_9787 ?auto_9788 ) ) ( not ( = ?auto_9795 ?auto_9793 ) ) ( HOIST-AT ?auto_9794 ?auto_9795 ) ( not ( = ?auto_9791 ?auto_9794 ) ) ( SURFACE-AT ?auto_9787 ?auto_9795 ) ( ON ?auto_9787 ?auto_9792 ) ( CLEAR ?auto_9787 ) ( not ( = ?auto_9787 ?auto_9792 ) ) ( not ( = ?auto_9788 ?auto_9792 ) ) ( SURFACE-AT ?auto_9790 ?auto_9793 ) ( CLEAR ?auto_9790 ) ( IS-CRATE ?auto_9788 ) ( not ( = ?auto_9787 ?auto_9790 ) ) ( not ( = ?auto_9788 ?auto_9790 ) ) ( not ( = ?auto_9792 ?auto_9790 ) ) ( AVAILABLE ?auto_9791 ) ( AVAILABLE ?auto_9794 ) ( SURFACE-AT ?auto_9788 ?auto_9795 ) ( ON ?auto_9788 ?auto_9796 ) ( CLEAR ?auto_9788 ) ( not ( = ?auto_9787 ?auto_9796 ) ) ( not ( = ?auto_9788 ?auto_9796 ) ) ( not ( = ?auto_9792 ?auto_9796 ) ) ( not ( = ?auto_9790 ?auto_9796 ) ) ( TRUCK-AT ?auto_9789 ?auto_9793 ) )
    :subtasks
    ( ( !DRIVE ?auto_9789 ?auto_9793 ?auto_9795 )
      ( MAKE-ON ?auto_9787 ?auto_9788 )
      ( MAKE-ON-VERIFY ?auto_9787 ?auto_9788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9861 - SURFACE
      ?auto_9862 - SURFACE
    )
    :vars
    (
      ?auto_9867 - HOIST
      ?auto_9868 - PLACE
      ?auto_9866 - PLACE
      ?auto_9864 - HOIST
      ?auto_9863 - SURFACE
      ?auto_9865 - TRUCK
      ?auto_9869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9867 ?auto_9868 ) ( SURFACE-AT ?auto_9862 ?auto_9868 ) ( CLEAR ?auto_9862 ) ( IS-CRATE ?auto_9861 ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( AVAILABLE ?auto_9867 ) ( not ( = ?auto_9866 ?auto_9868 ) ) ( HOIST-AT ?auto_9864 ?auto_9866 ) ( not ( = ?auto_9867 ?auto_9864 ) ) ( AVAILABLE ?auto_9864 ) ( SURFACE-AT ?auto_9861 ?auto_9866 ) ( ON ?auto_9861 ?auto_9863 ) ( CLEAR ?auto_9861 ) ( not ( = ?auto_9861 ?auto_9863 ) ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( TRUCK-AT ?auto_9865 ?auto_9869 ) ( not ( = ?auto_9869 ?auto_9868 ) ) ( not ( = ?auto_9866 ?auto_9869 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9865 ?auto_9869 ?auto_9868 )
      ( MAKE-ON ?auto_9861 ?auto_9862 )
      ( MAKE-ON-VERIFY ?auto_9861 ?auto_9862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9876 - SURFACE
      ?auto_9877 - SURFACE
    )
    :vars
    (
      ?auto_9880 - HOIST
      ?auto_9879 - PLACE
      ?auto_9878 - PLACE
      ?auto_9883 - HOIST
      ?auto_9881 - SURFACE
      ?auto_9882 - TRUCK
      ?auto_9884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9880 ?auto_9879 ) ( SURFACE-AT ?auto_9877 ?auto_9879 ) ( CLEAR ?auto_9877 ) ( IS-CRATE ?auto_9876 ) ( not ( = ?auto_9876 ?auto_9877 ) ) ( not ( = ?auto_9878 ?auto_9879 ) ) ( HOIST-AT ?auto_9883 ?auto_9878 ) ( not ( = ?auto_9880 ?auto_9883 ) ) ( AVAILABLE ?auto_9883 ) ( SURFACE-AT ?auto_9876 ?auto_9878 ) ( ON ?auto_9876 ?auto_9881 ) ( CLEAR ?auto_9876 ) ( not ( = ?auto_9876 ?auto_9881 ) ) ( not ( = ?auto_9877 ?auto_9881 ) ) ( TRUCK-AT ?auto_9882 ?auto_9879 ) ( LIFTING ?auto_9880 ?auto_9884 ) ( IS-CRATE ?auto_9884 ) ( not ( = ?auto_9876 ?auto_9884 ) ) ( not ( = ?auto_9877 ?auto_9884 ) ) ( not ( = ?auto_9881 ?auto_9884 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9880 ?auto_9884 ?auto_9882 ?auto_9879 )
      ( MAKE-ON ?auto_9876 ?auto_9877 )
      ( MAKE-ON-VERIFY ?auto_9876 ?auto_9877 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9968 - SURFACE
      ?auto_9969 - SURFACE
    )
    :vars
    (
      ?auto_9972 - HOIST
      ?auto_9974 - PLACE
      ?auto_9973 - TRUCK
      ?auto_9970 - PLACE
      ?auto_9975 - HOIST
      ?auto_9971 - SURFACE
      ?auto_9976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9972 ?auto_9974 ) ( SURFACE-AT ?auto_9969 ?auto_9974 ) ( CLEAR ?auto_9969 ) ( IS-CRATE ?auto_9968 ) ( not ( = ?auto_9968 ?auto_9969 ) ) ( AVAILABLE ?auto_9972 ) ( TRUCK-AT ?auto_9973 ?auto_9970 ) ( not ( = ?auto_9970 ?auto_9974 ) ) ( HOIST-AT ?auto_9975 ?auto_9970 ) ( not ( = ?auto_9972 ?auto_9975 ) ) ( SURFACE-AT ?auto_9968 ?auto_9970 ) ( ON ?auto_9968 ?auto_9971 ) ( CLEAR ?auto_9968 ) ( not ( = ?auto_9968 ?auto_9971 ) ) ( not ( = ?auto_9969 ?auto_9971 ) ) ( LIFTING ?auto_9975 ?auto_9976 ) ( IS-CRATE ?auto_9976 ) ( not ( = ?auto_9968 ?auto_9976 ) ) ( not ( = ?auto_9969 ?auto_9976 ) ) ( not ( = ?auto_9971 ?auto_9976 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9975 ?auto_9976 ?auto_9973 ?auto_9970 )
      ( MAKE-ON ?auto_9968 ?auto_9969 )
      ( MAKE-ON-VERIFY ?auto_9968 ?auto_9969 ) )
  )

)

