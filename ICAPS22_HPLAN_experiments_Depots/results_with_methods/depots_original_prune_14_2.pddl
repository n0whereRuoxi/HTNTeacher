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
      ?auto_54656 - SURFACE
      ?auto_54657 - SURFACE
    )
    :vars
    (
      ?auto_54658 - HOIST
      ?auto_54659 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54658 ?auto_54659 ) ( SURFACE-AT ?auto_54657 ?auto_54659 ) ( CLEAR ?auto_54657 ) ( LIFTING ?auto_54658 ?auto_54656 ) ( IS-CRATE ?auto_54656 ) ( not ( = ?auto_54656 ?auto_54657 ) ) )
    :subtasks
    ( ( !DROP ?auto_54658 ?auto_54656 ?auto_54657 ?auto_54659 )
      ( MAKE-ON-VERIFY ?auto_54656 ?auto_54657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54660 - SURFACE
      ?auto_54661 - SURFACE
    )
    :vars
    (
      ?auto_54663 - HOIST
      ?auto_54662 - PLACE
      ?auto_54664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54663 ?auto_54662 ) ( SURFACE-AT ?auto_54661 ?auto_54662 ) ( CLEAR ?auto_54661 ) ( IS-CRATE ?auto_54660 ) ( not ( = ?auto_54660 ?auto_54661 ) ) ( TRUCK-AT ?auto_54664 ?auto_54662 ) ( AVAILABLE ?auto_54663 ) ( IN ?auto_54660 ?auto_54664 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54663 ?auto_54660 ?auto_54664 ?auto_54662 )
      ( MAKE-ON ?auto_54660 ?auto_54661 )
      ( MAKE-ON-VERIFY ?auto_54660 ?auto_54661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54665 - SURFACE
      ?auto_54666 - SURFACE
    )
    :vars
    (
      ?auto_54669 - HOIST
      ?auto_54667 - PLACE
      ?auto_54668 - TRUCK
      ?auto_54670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54669 ?auto_54667 ) ( SURFACE-AT ?auto_54666 ?auto_54667 ) ( CLEAR ?auto_54666 ) ( IS-CRATE ?auto_54665 ) ( not ( = ?auto_54665 ?auto_54666 ) ) ( AVAILABLE ?auto_54669 ) ( IN ?auto_54665 ?auto_54668 ) ( TRUCK-AT ?auto_54668 ?auto_54670 ) ( not ( = ?auto_54670 ?auto_54667 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54668 ?auto_54670 ?auto_54667 )
      ( MAKE-ON ?auto_54665 ?auto_54666 )
      ( MAKE-ON-VERIFY ?auto_54665 ?auto_54666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54671 - SURFACE
      ?auto_54672 - SURFACE
    )
    :vars
    (
      ?auto_54675 - HOIST
      ?auto_54673 - PLACE
      ?auto_54674 - TRUCK
      ?auto_54676 - PLACE
      ?auto_54677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54675 ?auto_54673 ) ( SURFACE-AT ?auto_54672 ?auto_54673 ) ( CLEAR ?auto_54672 ) ( IS-CRATE ?auto_54671 ) ( not ( = ?auto_54671 ?auto_54672 ) ) ( AVAILABLE ?auto_54675 ) ( TRUCK-AT ?auto_54674 ?auto_54676 ) ( not ( = ?auto_54676 ?auto_54673 ) ) ( HOIST-AT ?auto_54677 ?auto_54676 ) ( LIFTING ?auto_54677 ?auto_54671 ) ( not ( = ?auto_54675 ?auto_54677 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54677 ?auto_54671 ?auto_54674 ?auto_54676 )
      ( MAKE-ON ?auto_54671 ?auto_54672 )
      ( MAKE-ON-VERIFY ?auto_54671 ?auto_54672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54678 - SURFACE
      ?auto_54679 - SURFACE
    )
    :vars
    (
      ?auto_54682 - HOIST
      ?auto_54680 - PLACE
      ?auto_54683 - TRUCK
      ?auto_54681 - PLACE
      ?auto_54684 - HOIST
      ?auto_54685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54682 ?auto_54680 ) ( SURFACE-AT ?auto_54679 ?auto_54680 ) ( CLEAR ?auto_54679 ) ( IS-CRATE ?auto_54678 ) ( not ( = ?auto_54678 ?auto_54679 ) ) ( AVAILABLE ?auto_54682 ) ( TRUCK-AT ?auto_54683 ?auto_54681 ) ( not ( = ?auto_54681 ?auto_54680 ) ) ( HOIST-AT ?auto_54684 ?auto_54681 ) ( not ( = ?auto_54682 ?auto_54684 ) ) ( AVAILABLE ?auto_54684 ) ( SURFACE-AT ?auto_54678 ?auto_54681 ) ( ON ?auto_54678 ?auto_54685 ) ( CLEAR ?auto_54678 ) ( not ( = ?auto_54678 ?auto_54685 ) ) ( not ( = ?auto_54679 ?auto_54685 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54684 ?auto_54678 ?auto_54685 ?auto_54681 )
      ( MAKE-ON ?auto_54678 ?auto_54679 )
      ( MAKE-ON-VERIFY ?auto_54678 ?auto_54679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54686 - SURFACE
      ?auto_54687 - SURFACE
    )
    :vars
    (
      ?auto_54692 - HOIST
      ?auto_54691 - PLACE
      ?auto_54693 - PLACE
      ?auto_54690 - HOIST
      ?auto_54688 - SURFACE
      ?auto_54689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54692 ?auto_54691 ) ( SURFACE-AT ?auto_54687 ?auto_54691 ) ( CLEAR ?auto_54687 ) ( IS-CRATE ?auto_54686 ) ( not ( = ?auto_54686 ?auto_54687 ) ) ( AVAILABLE ?auto_54692 ) ( not ( = ?auto_54693 ?auto_54691 ) ) ( HOIST-AT ?auto_54690 ?auto_54693 ) ( not ( = ?auto_54692 ?auto_54690 ) ) ( AVAILABLE ?auto_54690 ) ( SURFACE-AT ?auto_54686 ?auto_54693 ) ( ON ?auto_54686 ?auto_54688 ) ( CLEAR ?auto_54686 ) ( not ( = ?auto_54686 ?auto_54688 ) ) ( not ( = ?auto_54687 ?auto_54688 ) ) ( TRUCK-AT ?auto_54689 ?auto_54691 ) )
    :subtasks
    ( ( !DRIVE ?auto_54689 ?auto_54691 ?auto_54693 )
      ( MAKE-ON ?auto_54686 ?auto_54687 )
      ( MAKE-ON-VERIFY ?auto_54686 ?auto_54687 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54734 - SURFACE
      ?auto_54735 - SURFACE
    )
    :vars
    (
      ?auto_54737 - HOIST
      ?auto_54739 - PLACE
      ?auto_54741 - PLACE
      ?auto_54736 - HOIST
      ?auto_54738 - SURFACE
      ?auto_54740 - TRUCK
      ?auto_54742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54737 ?auto_54739 ) ( IS-CRATE ?auto_54734 ) ( not ( = ?auto_54734 ?auto_54735 ) ) ( not ( = ?auto_54741 ?auto_54739 ) ) ( HOIST-AT ?auto_54736 ?auto_54741 ) ( not ( = ?auto_54737 ?auto_54736 ) ) ( AVAILABLE ?auto_54736 ) ( SURFACE-AT ?auto_54734 ?auto_54741 ) ( ON ?auto_54734 ?auto_54738 ) ( CLEAR ?auto_54734 ) ( not ( = ?auto_54734 ?auto_54738 ) ) ( not ( = ?auto_54735 ?auto_54738 ) ) ( TRUCK-AT ?auto_54740 ?auto_54739 ) ( SURFACE-AT ?auto_54742 ?auto_54739 ) ( CLEAR ?auto_54742 ) ( LIFTING ?auto_54737 ?auto_54735 ) ( IS-CRATE ?auto_54735 ) ( not ( = ?auto_54734 ?auto_54742 ) ) ( not ( = ?auto_54735 ?auto_54742 ) ) ( not ( = ?auto_54738 ?auto_54742 ) ) )
    :subtasks
    ( ( !DROP ?auto_54737 ?auto_54735 ?auto_54742 ?auto_54739 )
      ( MAKE-ON ?auto_54734 ?auto_54735 )
      ( MAKE-ON-VERIFY ?auto_54734 ?auto_54735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54743 - SURFACE
      ?auto_54744 - SURFACE
    )
    :vars
    (
      ?auto_54751 - HOIST
      ?auto_54746 - PLACE
      ?auto_54747 - PLACE
      ?auto_54748 - HOIST
      ?auto_54750 - SURFACE
      ?auto_54749 - TRUCK
      ?auto_54745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54751 ?auto_54746 ) ( IS-CRATE ?auto_54743 ) ( not ( = ?auto_54743 ?auto_54744 ) ) ( not ( = ?auto_54747 ?auto_54746 ) ) ( HOIST-AT ?auto_54748 ?auto_54747 ) ( not ( = ?auto_54751 ?auto_54748 ) ) ( AVAILABLE ?auto_54748 ) ( SURFACE-AT ?auto_54743 ?auto_54747 ) ( ON ?auto_54743 ?auto_54750 ) ( CLEAR ?auto_54743 ) ( not ( = ?auto_54743 ?auto_54750 ) ) ( not ( = ?auto_54744 ?auto_54750 ) ) ( TRUCK-AT ?auto_54749 ?auto_54746 ) ( SURFACE-AT ?auto_54745 ?auto_54746 ) ( CLEAR ?auto_54745 ) ( IS-CRATE ?auto_54744 ) ( not ( = ?auto_54743 ?auto_54745 ) ) ( not ( = ?auto_54744 ?auto_54745 ) ) ( not ( = ?auto_54750 ?auto_54745 ) ) ( AVAILABLE ?auto_54751 ) ( IN ?auto_54744 ?auto_54749 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54751 ?auto_54744 ?auto_54749 ?auto_54746 )
      ( MAKE-ON ?auto_54743 ?auto_54744 )
      ( MAKE-ON-VERIFY ?auto_54743 ?auto_54744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54758 - SURFACE
      ?auto_54759 - SURFACE
    )
    :vars
    (
      ?auto_54765 - HOIST
      ?auto_54760 - PLACE
      ?auto_54762 - PLACE
      ?auto_54761 - HOIST
      ?auto_54763 - SURFACE
      ?auto_54764 - TRUCK
      ?auto_54766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54765 ?auto_54760 ) ( SURFACE-AT ?auto_54759 ?auto_54760 ) ( CLEAR ?auto_54759 ) ( IS-CRATE ?auto_54758 ) ( not ( = ?auto_54758 ?auto_54759 ) ) ( AVAILABLE ?auto_54765 ) ( not ( = ?auto_54762 ?auto_54760 ) ) ( HOIST-AT ?auto_54761 ?auto_54762 ) ( not ( = ?auto_54765 ?auto_54761 ) ) ( AVAILABLE ?auto_54761 ) ( SURFACE-AT ?auto_54758 ?auto_54762 ) ( ON ?auto_54758 ?auto_54763 ) ( CLEAR ?auto_54758 ) ( not ( = ?auto_54758 ?auto_54763 ) ) ( not ( = ?auto_54759 ?auto_54763 ) ) ( TRUCK-AT ?auto_54764 ?auto_54766 ) ( not ( = ?auto_54766 ?auto_54760 ) ) ( not ( = ?auto_54762 ?auto_54766 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54764 ?auto_54766 ?auto_54760 )
      ( MAKE-ON ?auto_54758 ?auto_54759 )
      ( MAKE-ON-VERIFY ?auto_54758 ?auto_54759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54910 - SURFACE
      ?auto_54911 - SURFACE
    )
    :vars
    (
      ?auto_54916 - HOIST
      ?auto_54915 - PLACE
      ?auto_54912 - PLACE
      ?auto_54917 - HOIST
      ?auto_54913 - SURFACE
      ?auto_54914 - SURFACE
      ?auto_54918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54916 ?auto_54915 ) ( IS-CRATE ?auto_54910 ) ( not ( = ?auto_54910 ?auto_54911 ) ) ( not ( = ?auto_54912 ?auto_54915 ) ) ( HOIST-AT ?auto_54917 ?auto_54912 ) ( not ( = ?auto_54916 ?auto_54917 ) ) ( AVAILABLE ?auto_54917 ) ( SURFACE-AT ?auto_54910 ?auto_54912 ) ( ON ?auto_54910 ?auto_54913 ) ( CLEAR ?auto_54910 ) ( not ( = ?auto_54910 ?auto_54913 ) ) ( not ( = ?auto_54911 ?auto_54913 ) ) ( SURFACE-AT ?auto_54914 ?auto_54915 ) ( CLEAR ?auto_54914 ) ( IS-CRATE ?auto_54911 ) ( not ( = ?auto_54910 ?auto_54914 ) ) ( not ( = ?auto_54911 ?auto_54914 ) ) ( not ( = ?auto_54913 ?auto_54914 ) ) ( AVAILABLE ?auto_54916 ) ( IN ?auto_54911 ?auto_54918 ) ( TRUCK-AT ?auto_54918 ?auto_54912 ) )
    :subtasks
    ( ( !DRIVE ?auto_54918 ?auto_54912 ?auto_54915 )
      ( MAKE-ON ?auto_54910 ?auto_54911 )
      ( MAKE-ON-VERIFY ?auto_54910 ?auto_54911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54919 - SURFACE
      ?auto_54920 - SURFACE
    )
    :vars
    (
      ?auto_54927 - HOIST
      ?auto_54924 - PLACE
      ?auto_54926 - PLACE
      ?auto_54925 - HOIST
      ?auto_54921 - SURFACE
      ?auto_54923 - SURFACE
      ?auto_54922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54927 ?auto_54924 ) ( IS-CRATE ?auto_54919 ) ( not ( = ?auto_54919 ?auto_54920 ) ) ( not ( = ?auto_54926 ?auto_54924 ) ) ( HOIST-AT ?auto_54925 ?auto_54926 ) ( not ( = ?auto_54927 ?auto_54925 ) ) ( SURFACE-AT ?auto_54919 ?auto_54926 ) ( ON ?auto_54919 ?auto_54921 ) ( CLEAR ?auto_54919 ) ( not ( = ?auto_54919 ?auto_54921 ) ) ( not ( = ?auto_54920 ?auto_54921 ) ) ( SURFACE-AT ?auto_54923 ?auto_54924 ) ( CLEAR ?auto_54923 ) ( IS-CRATE ?auto_54920 ) ( not ( = ?auto_54919 ?auto_54923 ) ) ( not ( = ?auto_54920 ?auto_54923 ) ) ( not ( = ?auto_54921 ?auto_54923 ) ) ( AVAILABLE ?auto_54927 ) ( TRUCK-AT ?auto_54922 ?auto_54926 ) ( LIFTING ?auto_54925 ?auto_54920 ) )
    :subtasks
    ( ( !LOAD ?auto_54925 ?auto_54920 ?auto_54922 ?auto_54926 )
      ( MAKE-ON ?auto_54919 ?auto_54920 )
      ( MAKE-ON-VERIFY ?auto_54919 ?auto_54920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54928 - SURFACE
      ?auto_54929 - SURFACE
    )
    :vars
    (
      ?auto_54930 - HOIST
      ?auto_54932 - PLACE
      ?auto_54933 - PLACE
      ?auto_54931 - HOIST
      ?auto_54934 - SURFACE
      ?auto_54936 - SURFACE
      ?auto_54935 - TRUCK
      ?auto_54937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54930 ?auto_54932 ) ( IS-CRATE ?auto_54928 ) ( not ( = ?auto_54928 ?auto_54929 ) ) ( not ( = ?auto_54933 ?auto_54932 ) ) ( HOIST-AT ?auto_54931 ?auto_54933 ) ( not ( = ?auto_54930 ?auto_54931 ) ) ( SURFACE-AT ?auto_54928 ?auto_54933 ) ( ON ?auto_54928 ?auto_54934 ) ( CLEAR ?auto_54928 ) ( not ( = ?auto_54928 ?auto_54934 ) ) ( not ( = ?auto_54929 ?auto_54934 ) ) ( SURFACE-AT ?auto_54936 ?auto_54932 ) ( CLEAR ?auto_54936 ) ( IS-CRATE ?auto_54929 ) ( not ( = ?auto_54928 ?auto_54936 ) ) ( not ( = ?auto_54929 ?auto_54936 ) ) ( not ( = ?auto_54934 ?auto_54936 ) ) ( AVAILABLE ?auto_54930 ) ( TRUCK-AT ?auto_54935 ?auto_54933 ) ( AVAILABLE ?auto_54931 ) ( SURFACE-AT ?auto_54929 ?auto_54933 ) ( ON ?auto_54929 ?auto_54937 ) ( CLEAR ?auto_54929 ) ( not ( = ?auto_54928 ?auto_54937 ) ) ( not ( = ?auto_54929 ?auto_54937 ) ) ( not ( = ?auto_54934 ?auto_54937 ) ) ( not ( = ?auto_54936 ?auto_54937 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54931 ?auto_54929 ?auto_54937 ?auto_54933 )
      ( MAKE-ON ?auto_54928 ?auto_54929 )
      ( MAKE-ON-VERIFY ?auto_54928 ?auto_54929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54938 - SURFACE
      ?auto_54939 - SURFACE
    )
    :vars
    (
      ?auto_54942 - HOIST
      ?auto_54943 - PLACE
      ?auto_54941 - PLACE
      ?auto_54940 - HOIST
      ?auto_54944 - SURFACE
      ?auto_54947 - SURFACE
      ?auto_54945 - SURFACE
      ?auto_54946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54942 ?auto_54943 ) ( IS-CRATE ?auto_54938 ) ( not ( = ?auto_54938 ?auto_54939 ) ) ( not ( = ?auto_54941 ?auto_54943 ) ) ( HOIST-AT ?auto_54940 ?auto_54941 ) ( not ( = ?auto_54942 ?auto_54940 ) ) ( SURFACE-AT ?auto_54938 ?auto_54941 ) ( ON ?auto_54938 ?auto_54944 ) ( CLEAR ?auto_54938 ) ( not ( = ?auto_54938 ?auto_54944 ) ) ( not ( = ?auto_54939 ?auto_54944 ) ) ( SURFACE-AT ?auto_54947 ?auto_54943 ) ( CLEAR ?auto_54947 ) ( IS-CRATE ?auto_54939 ) ( not ( = ?auto_54938 ?auto_54947 ) ) ( not ( = ?auto_54939 ?auto_54947 ) ) ( not ( = ?auto_54944 ?auto_54947 ) ) ( AVAILABLE ?auto_54942 ) ( AVAILABLE ?auto_54940 ) ( SURFACE-AT ?auto_54939 ?auto_54941 ) ( ON ?auto_54939 ?auto_54945 ) ( CLEAR ?auto_54939 ) ( not ( = ?auto_54938 ?auto_54945 ) ) ( not ( = ?auto_54939 ?auto_54945 ) ) ( not ( = ?auto_54944 ?auto_54945 ) ) ( not ( = ?auto_54947 ?auto_54945 ) ) ( TRUCK-AT ?auto_54946 ?auto_54943 ) )
    :subtasks
    ( ( !DRIVE ?auto_54946 ?auto_54943 ?auto_54941 )
      ( MAKE-ON ?auto_54938 ?auto_54939 )
      ( MAKE-ON-VERIFY ?auto_54938 ?auto_54939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54948 - SURFACE
      ?auto_54949 - SURFACE
    )
    :vars
    (
      ?auto_54957 - HOIST
      ?auto_54953 - PLACE
      ?auto_54954 - PLACE
      ?auto_54955 - HOIST
      ?auto_54951 - SURFACE
      ?auto_54956 - SURFACE
      ?auto_54952 - SURFACE
      ?auto_54950 - TRUCK
      ?auto_54958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54957 ?auto_54953 ) ( IS-CRATE ?auto_54948 ) ( not ( = ?auto_54948 ?auto_54949 ) ) ( not ( = ?auto_54954 ?auto_54953 ) ) ( HOIST-AT ?auto_54955 ?auto_54954 ) ( not ( = ?auto_54957 ?auto_54955 ) ) ( SURFACE-AT ?auto_54948 ?auto_54954 ) ( ON ?auto_54948 ?auto_54951 ) ( CLEAR ?auto_54948 ) ( not ( = ?auto_54948 ?auto_54951 ) ) ( not ( = ?auto_54949 ?auto_54951 ) ) ( IS-CRATE ?auto_54949 ) ( not ( = ?auto_54948 ?auto_54956 ) ) ( not ( = ?auto_54949 ?auto_54956 ) ) ( not ( = ?auto_54951 ?auto_54956 ) ) ( AVAILABLE ?auto_54955 ) ( SURFACE-AT ?auto_54949 ?auto_54954 ) ( ON ?auto_54949 ?auto_54952 ) ( CLEAR ?auto_54949 ) ( not ( = ?auto_54948 ?auto_54952 ) ) ( not ( = ?auto_54949 ?auto_54952 ) ) ( not ( = ?auto_54951 ?auto_54952 ) ) ( not ( = ?auto_54956 ?auto_54952 ) ) ( TRUCK-AT ?auto_54950 ?auto_54953 ) ( SURFACE-AT ?auto_54958 ?auto_54953 ) ( CLEAR ?auto_54958 ) ( LIFTING ?auto_54957 ?auto_54956 ) ( IS-CRATE ?auto_54956 ) ( not ( = ?auto_54948 ?auto_54958 ) ) ( not ( = ?auto_54949 ?auto_54958 ) ) ( not ( = ?auto_54951 ?auto_54958 ) ) ( not ( = ?auto_54956 ?auto_54958 ) ) ( not ( = ?auto_54952 ?auto_54958 ) ) )
    :subtasks
    ( ( !DROP ?auto_54957 ?auto_54956 ?auto_54958 ?auto_54953 )
      ( MAKE-ON ?auto_54948 ?auto_54949 )
      ( MAKE-ON-VERIFY ?auto_54948 ?auto_54949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55060 - SURFACE
      ?auto_55061 - SURFACE
    )
    :vars
    (
      ?auto_55065 - HOIST
      ?auto_55063 - PLACE
      ?auto_55062 - PLACE
      ?auto_55064 - HOIST
      ?auto_55067 - SURFACE
      ?auto_55066 - TRUCK
      ?auto_55068 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55065 ?auto_55063 ) ( SURFACE-AT ?auto_55061 ?auto_55063 ) ( CLEAR ?auto_55061 ) ( IS-CRATE ?auto_55060 ) ( not ( = ?auto_55060 ?auto_55061 ) ) ( not ( = ?auto_55062 ?auto_55063 ) ) ( HOIST-AT ?auto_55064 ?auto_55062 ) ( not ( = ?auto_55065 ?auto_55064 ) ) ( AVAILABLE ?auto_55064 ) ( SURFACE-AT ?auto_55060 ?auto_55062 ) ( ON ?auto_55060 ?auto_55067 ) ( CLEAR ?auto_55060 ) ( not ( = ?auto_55060 ?auto_55067 ) ) ( not ( = ?auto_55061 ?auto_55067 ) ) ( TRUCK-AT ?auto_55066 ?auto_55063 ) ( LIFTING ?auto_55065 ?auto_55068 ) ( IS-CRATE ?auto_55068 ) ( not ( = ?auto_55060 ?auto_55068 ) ) ( not ( = ?auto_55061 ?auto_55068 ) ) ( not ( = ?auto_55067 ?auto_55068 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55065 ?auto_55068 ?auto_55066 ?auto_55063 )
      ( MAKE-ON ?auto_55060 ?auto_55061 )
      ( MAKE-ON-VERIFY ?auto_55060 ?auto_55061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_55079 - SURFACE
      ?auto_55080 - SURFACE
    )
    :vars
    (
      ?auto_55085 - HOIST
      ?auto_55084 - PLACE
      ?auto_55086 - TRUCK
      ?auto_55082 - PLACE
      ?auto_55083 - HOIST
      ?auto_55081 - SURFACE
      ?auto_55087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55085 ?auto_55084 ) ( SURFACE-AT ?auto_55080 ?auto_55084 ) ( CLEAR ?auto_55080 ) ( IS-CRATE ?auto_55079 ) ( not ( = ?auto_55079 ?auto_55080 ) ) ( AVAILABLE ?auto_55085 ) ( TRUCK-AT ?auto_55086 ?auto_55082 ) ( not ( = ?auto_55082 ?auto_55084 ) ) ( HOIST-AT ?auto_55083 ?auto_55082 ) ( not ( = ?auto_55085 ?auto_55083 ) ) ( SURFACE-AT ?auto_55079 ?auto_55082 ) ( ON ?auto_55079 ?auto_55081 ) ( CLEAR ?auto_55079 ) ( not ( = ?auto_55079 ?auto_55081 ) ) ( not ( = ?auto_55080 ?auto_55081 ) ) ( LIFTING ?auto_55083 ?auto_55087 ) ( IS-CRATE ?auto_55087 ) ( not ( = ?auto_55079 ?auto_55087 ) ) ( not ( = ?auto_55080 ?auto_55087 ) ) ( not ( = ?auto_55081 ?auto_55087 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55083 ?auto_55087 ?auto_55086 ?auto_55082 )
      ( MAKE-ON ?auto_55079 ?auto_55080 )
      ( MAKE-ON-VERIFY ?auto_55079 ?auto_55080 ) )
  )

)

