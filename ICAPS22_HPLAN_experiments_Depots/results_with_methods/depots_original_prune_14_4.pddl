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
      ?auto_58755 - SURFACE
      ?auto_58756 - SURFACE
    )
    :vars
    (
      ?auto_58757 - HOIST
      ?auto_58758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58757 ?auto_58758 ) ( SURFACE-AT ?auto_58756 ?auto_58758 ) ( CLEAR ?auto_58756 ) ( LIFTING ?auto_58757 ?auto_58755 ) ( IS-CRATE ?auto_58755 ) ( not ( = ?auto_58755 ?auto_58756 ) ) )
    :subtasks
    ( ( !DROP ?auto_58757 ?auto_58755 ?auto_58756 ?auto_58758 )
      ( MAKE-ON-VERIFY ?auto_58755 ?auto_58756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58759 - SURFACE
      ?auto_58760 - SURFACE
    )
    :vars
    (
      ?auto_58762 - HOIST
      ?auto_58761 - PLACE
      ?auto_58763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58762 ?auto_58761 ) ( SURFACE-AT ?auto_58760 ?auto_58761 ) ( CLEAR ?auto_58760 ) ( IS-CRATE ?auto_58759 ) ( not ( = ?auto_58759 ?auto_58760 ) ) ( TRUCK-AT ?auto_58763 ?auto_58761 ) ( AVAILABLE ?auto_58762 ) ( IN ?auto_58759 ?auto_58763 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58762 ?auto_58759 ?auto_58763 ?auto_58761 )
      ( MAKE-ON ?auto_58759 ?auto_58760 )
      ( MAKE-ON-VERIFY ?auto_58759 ?auto_58760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58764 - SURFACE
      ?auto_58765 - SURFACE
    )
    :vars
    (
      ?auto_58768 - HOIST
      ?auto_58766 - PLACE
      ?auto_58767 - TRUCK
      ?auto_58769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58768 ?auto_58766 ) ( SURFACE-AT ?auto_58765 ?auto_58766 ) ( CLEAR ?auto_58765 ) ( IS-CRATE ?auto_58764 ) ( not ( = ?auto_58764 ?auto_58765 ) ) ( AVAILABLE ?auto_58768 ) ( IN ?auto_58764 ?auto_58767 ) ( TRUCK-AT ?auto_58767 ?auto_58769 ) ( not ( = ?auto_58769 ?auto_58766 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58767 ?auto_58769 ?auto_58766 )
      ( MAKE-ON ?auto_58764 ?auto_58765 )
      ( MAKE-ON-VERIFY ?auto_58764 ?auto_58765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58770 - SURFACE
      ?auto_58771 - SURFACE
    )
    :vars
    (
      ?auto_58772 - HOIST
      ?auto_58774 - PLACE
      ?auto_58773 - TRUCK
      ?auto_58775 - PLACE
      ?auto_58776 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58772 ?auto_58774 ) ( SURFACE-AT ?auto_58771 ?auto_58774 ) ( CLEAR ?auto_58771 ) ( IS-CRATE ?auto_58770 ) ( not ( = ?auto_58770 ?auto_58771 ) ) ( AVAILABLE ?auto_58772 ) ( TRUCK-AT ?auto_58773 ?auto_58775 ) ( not ( = ?auto_58775 ?auto_58774 ) ) ( HOIST-AT ?auto_58776 ?auto_58775 ) ( LIFTING ?auto_58776 ?auto_58770 ) ( not ( = ?auto_58772 ?auto_58776 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58776 ?auto_58770 ?auto_58773 ?auto_58775 )
      ( MAKE-ON ?auto_58770 ?auto_58771 )
      ( MAKE-ON-VERIFY ?auto_58770 ?auto_58771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58777 - SURFACE
      ?auto_58778 - SURFACE
    )
    :vars
    (
      ?auto_58779 - HOIST
      ?auto_58780 - PLACE
      ?auto_58782 - TRUCK
      ?auto_58783 - PLACE
      ?auto_58781 - HOIST
      ?auto_58784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58779 ?auto_58780 ) ( SURFACE-AT ?auto_58778 ?auto_58780 ) ( CLEAR ?auto_58778 ) ( IS-CRATE ?auto_58777 ) ( not ( = ?auto_58777 ?auto_58778 ) ) ( AVAILABLE ?auto_58779 ) ( TRUCK-AT ?auto_58782 ?auto_58783 ) ( not ( = ?auto_58783 ?auto_58780 ) ) ( HOIST-AT ?auto_58781 ?auto_58783 ) ( not ( = ?auto_58779 ?auto_58781 ) ) ( AVAILABLE ?auto_58781 ) ( SURFACE-AT ?auto_58777 ?auto_58783 ) ( ON ?auto_58777 ?auto_58784 ) ( CLEAR ?auto_58777 ) ( not ( = ?auto_58777 ?auto_58784 ) ) ( not ( = ?auto_58778 ?auto_58784 ) ) )
    :subtasks
    ( ( !LIFT ?auto_58781 ?auto_58777 ?auto_58784 ?auto_58783 )
      ( MAKE-ON ?auto_58777 ?auto_58778 )
      ( MAKE-ON-VERIFY ?auto_58777 ?auto_58778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58785 - SURFACE
      ?auto_58786 - SURFACE
    )
    :vars
    (
      ?auto_58791 - HOIST
      ?auto_58789 - PLACE
      ?auto_58790 - PLACE
      ?auto_58792 - HOIST
      ?auto_58788 - SURFACE
      ?auto_58787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58791 ?auto_58789 ) ( SURFACE-AT ?auto_58786 ?auto_58789 ) ( CLEAR ?auto_58786 ) ( IS-CRATE ?auto_58785 ) ( not ( = ?auto_58785 ?auto_58786 ) ) ( AVAILABLE ?auto_58791 ) ( not ( = ?auto_58790 ?auto_58789 ) ) ( HOIST-AT ?auto_58792 ?auto_58790 ) ( not ( = ?auto_58791 ?auto_58792 ) ) ( AVAILABLE ?auto_58792 ) ( SURFACE-AT ?auto_58785 ?auto_58790 ) ( ON ?auto_58785 ?auto_58788 ) ( CLEAR ?auto_58785 ) ( not ( = ?auto_58785 ?auto_58788 ) ) ( not ( = ?auto_58786 ?auto_58788 ) ) ( TRUCK-AT ?auto_58787 ?auto_58789 ) )
    :subtasks
    ( ( !DRIVE ?auto_58787 ?auto_58789 ?auto_58790 )
      ( MAKE-ON ?auto_58785 ?auto_58786 )
      ( MAKE-ON-VERIFY ?auto_58785 ?auto_58786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58833 - SURFACE
      ?auto_58834 - SURFACE
    )
    :vars
    (
      ?auto_58837 - HOIST
      ?auto_58840 - PLACE
      ?auto_58836 - PLACE
      ?auto_58835 - HOIST
      ?auto_58839 - SURFACE
      ?auto_58838 - TRUCK
      ?auto_58841 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58837 ?auto_58840 ) ( IS-CRATE ?auto_58833 ) ( not ( = ?auto_58833 ?auto_58834 ) ) ( not ( = ?auto_58836 ?auto_58840 ) ) ( HOIST-AT ?auto_58835 ?auto_58836 ) ( not ( = ?auto_58837 ?auto_58835 ) ) ( AVAILABLE ?auto_58835 ) ( SURFACE-AT ?auto_58833 ?auto_58836 ) ( ON ?auto_58833 ?auto_58839 ) ( CLEAR ?auto_58833 ) ( not ( = ?auto_58833 ?auto_58839 ) ) ( not ( = ?auto_58834 ?auto_58839 ) ) ( TRUCK-AT ?auto_58838 ?auto_58840 ) ( SURFACE-AT ?auto_58841 ?auto_58840 ) ( CLEAR ?auto_58841 ) ( LIFTING ?auto_58837 ?auto_58834 ) ( IS-CRATE ?auto_58834 ) ( not ( = ?auto_58833 ?auto_58841 ) ) ( not ( = ?auto_58834 ?auto_58841 ) ) ( not ( = ?auto_58839 ?auto_58841 ) ) )
    :subtasks
    ( ( !DROP ?auto_58837 ?auto_58834 ?auto_58841 ?auto_58840 )
      ( MAKE-ON ?auto_58833 ?auto_58834 )
      ( MAKE-ON-VERIFY ?auto_58833 ?auto_58834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58842 - SURFACE
      ?auto_58843 - SURFACE
    )
    :vars
    (
      ?auto_58848 - HOIST
      ?auto_58846 - PLACE
      ?auto_58844 - PLACE
      ?auto_58849 - HOIST
      ?auto_58850 - SURFACE
      ?auto_58847 - TRUCK
      ?auto_58845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58848 ?auto_58846 ) ( IS-CRATE ?auto_58842 ) ( not ( = ?auto_58842 ?auto_58843 ) ) ( not ( = ?auto_58844 ?auto_58846 ) ) ( HOIST-AT ?auto_58849 ?auto_58844 ) ( not ( = ?auto_58848 ?auto_58849 ) ) ( AVAILABLE ?auto_58849 ) ( SURFACE-AT ?auto_58842 ?auto_58844 ) ( ON ?auto_58842 ?auto_58850 ) ( CLEAR ?auto_58842 ) ( not ( = ?auto_58842 ?auto_58850 ) ) ( not ( = ?auto_58843 ?auto_58850 ) ) ( TRUCK-AT ?auto_58847 ?auto_58846 ) ( SURFACE-AT ?auto_58845 ?auto_58846 ) ( CLEAR ?auto_58845 ) ( IS-CRATE ?auto_58843 ) ( not ( = ?auto_58842 ?auto_58845 ) ) ( not ( = ?auto_58843 ?auto_58845 ) ) ( not ( = ?auto_58850 ?auto_58845 ) ) ( AVAILABLE ?auto_58848 ) ( IN ?auto_58843 ?auto_58847 ) )
    :subtasks
    ( ( !UNLOAD ?auto_58848 ?auto_58843 ?auto_58847 ?auto_58846 )
      ( MAKE-ON ?auto_58842 ?auto_58843 )
      ( MAKE-ON-VERIFY ?auto_58842 ?auto_58843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58857 - SURFACE
      ?auto_58858 - SURFACE
    )
    :vars
    (
      ?auto_58860 - HOIST
      ?auto_58864 - PLACE
      ?auto_58862 - PLACE
      ?auto_58861 - HOIST
      ?auto_58863 - SURFACE
      ?auto_58859 - TRUCK
      ?auto_58865 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58860 ?auto_58864 ) ( SURFACE-AT ?auto_58858 ?auto_58864 ) ( CLEAR ?auto_58858 ) ( IS-CRATE ?auto_58857 ) ( not ( = ?auto_58857 ?auto_58858 ) ) ( AVAILABLE ?auto_58860 ) ( not ( = ?auto_58862 ?auto_58864 ) ) ( HOIST-AT ?auto_58861 ?auto_58862 ) ( not ( = ?auto_58860 ?auto_58861 ) ) ( AVAILABLE ?auto_58861 ) ( SURFACE-AT ?auto_58857 ?auto_58862 ) ( ON ?auto_58857 ?auto_58863 ) ( CLEAR ?auto_58857 ) ( not ( = ?auto_58857 ?auto_58863 ) ) ( not ( = ?auto_58858 ?auto_58863 ) ) ( TRUCK-AT ?auto_58859 ?auto_58865 ) ( not ( = ?auto_58865 ?auto_58864 ) ) ( not ( = ?auto_58862 ?auto_58865 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_58859 ?auto_58865 ?auto_58864 )
      ( MAKE-ON ?auto_58857 ?auto_58858 )
      ( MAKE-ON-VERIFY ?auto_58857 ?auto_58858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59502 - SURFACE
      ?auto_59503 - SURFACE
    )
    :vars
    (
      ?auto_59508 - HOIST
      ?auto_59509 - PLACE
      ?auto_59505 - TRUCK
      ?auto_59504 - PLACE
      ?auto_59507 - HOIST
      ?auto_59506 - SURFACE
      ?auto_59510 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59508 ?auto_59509 ) ( SURFACE-AT ?auto_59503 ?auto_59509 ) ( CLEAR ?auto_59503 ) ( IS-CRATE ?auto_59502 ) ( not ( = ?auto_59502 ?auto_59503 ) ) ( AVAILABLE ?auto_59508 ) ( TRUCK-AT ?auto_59505 ?auto_59504 ) ( not ( = ?auto_59504 ?auto_59509 ) ) ( HOIST-AT ?auto_59507 ?auto_59504 ) ( not ( = ?auto_59508 ?auto_59507 ) ) ( SURFACE-AT ?auto_59502 ?auto_59504 ) ( ON ?auto_59502 ?auto_59506 ) ( CLEAR ?auto_59502 ) ( not ( = ?auto_59502 ?auto_59506 ) ) ( not ( = ?auto_59503 ?auto_59506 ) ) ( LIFTING ?auto_59507 ?auto_59510 ) ( IS-CRATE ?auto_59510 ) ( not ( = ?auto_59502 ?auto_59510 ) ) ( not ( = ?auto_59503 ?auto_59510 ) ) ( not ( = ?auto_59506 ?auto_59510 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59507 ?auto_59510 ?auto_59505 ?auto_59504 )
      ( MAKE-ON ?auto_59502 ?auto_59503 )
      ( MAKE-ON-VERIFY ?auto_59502 ?auto_59503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59666 - SURFACE
      ?auto_59667 - SURFACE
    )
    :vars
    (
      ?auto_59669 - HOIST
      ?auto_59673 - PLACE
      ?auto_59670 - PLACE
      ?auto_59672 - HOIST
      ?auto_59668 - SURFACE
      ?auto_59671 - TRUCK
      ?auto_59674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59669 ?auto_59673 ) ( SURFACE-AT ?auto_59667 ?auto_59673 ) ( CLEAR ?auto_59667 ) ( IS-CRATE ?auto_59666 ) ( not ( = ?auto_59666 ?auto_59667 ) ) ( not ( = ?auto_59670 ?auto_59673 ) ) ( HOIST-AT ?auto_59672 ?auto_59670 ) ( not ( = ?auto_59669 ?auto_59672 ) ) ( AVAILABLE ?auto_59672 ) ( SURFACE-AT ?auto_59666 ?auto_59670 ) ( ON ?auto_59666 ?auto_59668 ) ( CLEAR ?auto_59666 ) ( not ( = ?auto_59666 ?auto_59668 ) ) ( not ( = ?auto_59667 ?auto_59668 ) ) ( TRUCK-AT ?auto_59671 ?auto_59673 ) ( LIFTING ?auto_59669 ?auto_59674 ) ( IS-CRATE ?auto_59674 ) ( not ( = ?auto_59666 ?auto_59674 ) ) ( not ( = ?auto_59667 ?auto_59674 ) ) ( not ( = ?auto_59668 ?auto_59674 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59669 ?auto_59674 ?auto_59671 ?auto_59673 )
      ( MAKE-ON ?auto_59666 ?auto_59667 )
      ( MAKE-ON-VERIFY ?auto_59666 ?auto_59667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59954 - SURFACE
      ?auto_59955 - SURFACE
    )
    :vars
    (
      ?auto_59958 - HOIST
      ?auto_59957 - PLACE
      ?auto_59959 - PLACE
      ?auto_59961 - HOIST
      ?auto_59962 - SURFACE
      ?auto_59960 - SURFACE
      ?auto_59956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59958 ?auto_59957 ) ( IS-CRATE ?auto_59954 ) ( not ( = ?auto_59954 ?auto_59955 ) ) ( not ( = ?auto_59959 ?auto_59957 ) ) ( HOIST-AT ?auto_59961 ?auto_59959 ) ( not ( = ?auto_59958 ?auto_59961 ) ) ( AVAILABLE ?auto_59961 ) ( SURFACE-AT ?auto_59954 ?auto_59959 ) ( ON ?auto_59954 ?auto_59962 ) ( CLEAR ?auto_59954 ) ( not ( = ?auto_59954 ?auto_59962 ) ) ( not ( = ?auto_59955 ?auto_59962 ) ) ( SURFACE-AT ?auto_59960 ?auto_59957 ) ( CLEAR ?auto_59960 ) ( IS-CRATE ?auto_59955 ) ( not ( = ?auto_59954 ?auto_59960 ) ) ( not ( = ?auto_59955 ?auto_59960 ) ) ( not ( = ?auto_59962 ?auto_59960 ) ) ( AVAILABLE ?auto_59958 ) ( IN ?auto_59955 ?auto_59956 ) ( TRUCK-AT ?auto_59956 ?auto_59959 ) )
    :subtasks
    ( ( !DRIVE ?auto_59956 ?auto_59959 ?auto_59957 )
      ( MAKE-ON ?auto_59954 ?auto_59955 )
      ( MAKE-ON-VERIFY ?auto_59954 ?auto_59955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59963 - SURFACE
      ?auto_59964 - SURFACE
    )
    :vars
    (
      ?auto_59967 - HOIST
      ?auto_59966 - PLACE
      ?auto_59971 - PLACE
      ?auto_59965 - HOIST
      ?auto_59968 - SURFACE
      ?auto_59970 - SURFACE
      ?auto_59969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59967 ?auto_59966 ) ( IS-CRATE ?auto_59963 ) ( not ( = ?auto_59963 ?auto_59964 ) ) ( not ( = ?auto_59971 ?auto_59966 ) ) ( HOIST-AT ?auto_59965 ?auto_59971 ) ( not ( = ?auto_59967 ?auto_59965 ) ) ( SURFACE-AT ?auto_59963 ?auto_59971 ) ( ON ?auto_59963 ?auto_59968 ) ( CLEAR ?auto_59963 ) ( not ( = ?auto_59963 ?auto_59968 ) ) ( not ( = ?auto_59964 ?auto_59968 ) ) ( SURFACE-AT ?auto_59970 ?auto_59966 ) ( CLEAR ?auto_59970 ) ( IS-CRATE ?auto_59964 ) ( not ( = ?auto_59963 ?auto_59970 ) ) ( not ( = ?auto_59964 ?auto_59970 ) ) ( not ( = ?auto_59968 ?auto_59970 ) ) ( AVAILABLE ?auto_59967 ) ( TRUCK-AT ?auto_59969 ?auto_59971 ) ( LIFTING ?auto_59965 ?auto_59964 ) )
    :subtasks
    ( ( !LOAD ?auto_59965 ?auto_59964 ?auto_59969 ?auto_59971 )
      ( MAKE-ON ?auto_59963 ?auto_59964 )
      ( MAKE-ON-VERIFY ?auto_59963 ?auto_59964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59972 - SURFACE
      ?auto_59973 - SURFACE
    )
    :vars
    (
      ?auto_59978 - HOIST
      ?auto_59977 - PLACE
      ?auto_59980 - PLACE
      ?auto_59979 - HOIST
      ?auto_59976 - SURFACE
      ?auto_59975 - SURFACE
      ?auto_59974 - TRUCK
      ?auto_59981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59978 ?auto_59977 ) ( IS-CRATE ?auto_59972 ) ( not ( = ?auto_59972 ?auto_59973 ) ) ( not ( = ?auto_59980 ?auto_59977 ) ) ( HOIST-AT ?auto_59979 ?auto_59980 ) ( not ( = ?auto_59978 ?auto_59979 ) ) ( SURFACE-AT ?auto_59972 ?auto_59980 ) ( ON ?auto_59972 ?auto_59976 ) ( CLEAR ?auto_59972 ) ( not ( = ?auto_59972 ?auto_59976 ) ) ( not ( = ?auto_59973 ?auto_59976 ) ) ( SURFACE-AT ?auto_59975 ?auto_59977 ) ( CLEAR ?auto_59975 ) ( IS-CRATE ?auto_59973 ) ( not ( = ?auto_59972 ?auto_59975 ) ) ( not ( = ?auto_59973 ?auto_59975 ) ) ( not ( = ?auto_59976 ?auto_59975 ) ) ( AVAILABLE ?auto_59978 ) ( TRUCK-AT ?auto_59974 ?auto_59980 ) ( AVAILABLE ?auto_59979 ) ( SURFACE-AT ?auto_59973 ?auto_59980 ) ( ON ?auto_59973 ?auto_59981 ) ( CLEAR ?auto_59973 ) ( not ( = ?auto_59972 ?auto_59981 ) ) ( not ( = ?auto_59973 ?auto_59981 ) ) ( not ( = ?auto_59976 ?auto_59981 ) ) ( not ( = ?auto_59975 ?auto_59981 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59979 ?auto_59973 ?auto_59981 ?auto_59980 )
      ( MAKE-ON ?auto_59972 ?auto_59973 )
      ( MAKE-ON-VERIFY ?auto_59972 ?auto_59973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59982 - SURFACE
      ?auto_59983 - SURFACE
    )
    :vars
    (
      ?auto_59988 - HOIST
      ?auto_59989 - PLACE
      ?auto_59987 - PLACE
      ?auto_59990 - HOIST
      ?auto_59985 - SURFACE
      ?auto_59991 - SURFACE
      ?auto_59986 - SURFACE
      ?auto_59984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59988 ?auto_59989 ) ( IS-CRATE ?auto_59982 ) ( not ( = ?auto_59982 ?auto_59983 ) ) ( not ( = ?auto_59987 ?auto_59989 ) ) ( HOIST-AT ?auto_59990 ?auto_59987 ) ( not ( = ?auto_59988 ?auto_59990 ) ) ( SURFACE-AT ?auto_59982 ?auto_59987 ) ( ON ?auto_59982 ?auto_59985 ) ( CLEAR ?auto_59982 ) ( not ( = ?auto_59982 ?auto_59985 ) ) ( not ( = ?auto_59983 ?auto_59985 ) ) ( SURFACE-AT ?auto_59991 ?auto_59989 ) ( CLEAR ?auto_59991 ) ( IS-CRATE ?auto_59983 ) ( not ( = ?auto_59982 ?auto_59991 ) ) ( not ( = ?auto_59983 ?auto_59991 ) ) ( not ( = ?auto_59985 ?auto_59991 ) ) ( AVAILABLE ?auto_59988 ) ( AVAILABLE ?auto_59990 ) ( SURFACE-AT ?auto_59983 ?auto_59987 ) ( ON ?auto_59983 ?auto_59986 ) ( CLEAR ?auto_59983 ) ( not ( = ?auto_59982 ?auto_59986 ) ) ( not ( = ?auto_59983 ?auto_59986 ) ) ( not ( = ?auto_59985 ?auto_59986 ) ) ( not ( = ?auto_59991 ?auto_59986 ) ) ( TRUCK-AT ?auto_59984 ?auto_59989 ) )
    :subtasks
    ( ( !DRIVE ?auto_59984 ?auto_59989 ?auto_59987 )
      ( MAKE-ON ?auto_59982 ?auto_59983 )
      ( MAKE-ON-VERIFY ?auto_59982 ?auto_59983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59992 - SURFACE
      ?auto_59993 - SURFACE
    )
    :vars
    (
      ?auto_60001 - HOIST
      ?auto_59997 - PLACE
      ?auto_60000 - PLACE
      ?auto_59996 - HOIST
      ?auto_59994 - SURFACE
      ?auto_59995 - SURFACE
      ?auto_59998 - SURFACE
      ?auto_59999 - TRUCK
      ?auto_60002 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60001 ?auto_59997 ) ( IS-CRATE ?auto_59992 ) ( not ( = ?auto_59992 ?auto_59993 ) ) ( not ( = ?auto_60000 ?auto_59997 ) ) ( HOIST-AT ?auto_59996 ?auto_60000 ) ( not ( = ?auto_60001 ?auto_59996 ) ) ( SURFACE-AT ?auto_59992 ?auto_60000 ) ( ON ?auto_59992 ?auto_59994 ) ( CLEAR ?auto_59992 ) ( not ( = ?auto_59992 ?auto_59994 ) ) ( not ( = ?auto_59993 ?auto_59994 ) ) ( IS-CRATE ?auto_59993 ) ( not ( = ?auto_59992 ?auto_59995 ) ) ( not ( = ?auto_59993 ?auto_59995 ) ) ( not ( = ?auto_59994 ?auto_59995 ) ) ( AVAILABLE ?auto_59996 ) ( SURFACE-AT ?auto_59993 ?auto_60000 ) ( ON ?auto_59993 ?auto_59998 ) ( CLEAR ?auto_59993 ) ( not ( = ?auto_59992 ?auto_59998 ) ) ( not ( = ?auto_59993 ?auto_59998 ) ) ( not ( = ?auto_59994 ?auto_59998 ) ) ( not ( = ?auto_59995 ?auto_59998 ) ) ( TRUCK-AT ?auto_59999 ?auto_59997 ) ( SURFACE-AT ?auto_60002 ?auto_59997 ) ( CLEAR ?auto_60002 ) ( LIFTING ?auto_60001 ?auto_59995 ) ( IS-CRATE ?auto_59995 ) ( not ( = ?auto_59992 ?auto_60002 ) ) ( not ( = ?auto_59993 ?auto_60002 ) ) ( not ( = ?auto_59994 ?auto_60002 ) ) ( not ( = ?auto_59995 ?auto_60002 ) ) ( not ( = ?auto_59998 ?auto_60002 ) ) )
    :subtasks
    ( ( !DROP ?auto_60001 ?auto_59995 ?auto_60002 ?auto_59997 )
      ( MAKE-ON ?auto_59992 ?auto_59993 )
      ( MAKE-ON-VERIFY ?auto_59992 ?auto_59993 ) )
  )

)

