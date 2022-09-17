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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24725 - SURFACE
      ?auto_24726 - SURFACE
    )
    :vars
    (
      ?auto_24727 - HOIST
      ?auto_24728 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24727 ?auto_24728 ) ( SURFACE-AT ?auto_24725 ?auto_24728 ) ( CLEAR ?auto_24725 ) ( LIFTING ?auto_24727 ?auto_24726 ) ( IS-CRATE ?auto_24726 ) ( not ( = ?auto_24725 ?auto_24726 ) ) )
    :subtasks
    ( ( !DROP ?auto_24727 ?auto_24726 ?auto_24725 ?auto_24728 )
      ( MAKE-1CRATE-VERIFY ?auto_24725 ?auto_24726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24729 - SURFACE
      ?auto_24730 - SURFACE
    )
    :vars
    (
      ?auto_24731 - HOIST
      ?auto_24732 - PLACE
      ?auto_24733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24731 ?auto_24732 ) ( SURFACE-AT ?auto_24729 ?auto_24732 ) ( CLEAR ?auto_24729 ) ( IS-CRATE ?auto_24730 ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( TRUCK-AT ?auto_24733 ?auto_24732 ) ( AVAILABLE ?auto_24731 ) ( IN ?auto_24730 ?auto_24733 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24731 ?auto_24730 ?auto_24733 ?auto_24732 )
      ( MAKE-1CRATE ?auto_24729 ?auto_24730 )
      ( MAKE-1CRATE-VERIFY ?auto_24729 ?auto_24730 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24734 - SURFACE
      ?auto_24735 - SURFACE
    )
    :vars
    (
      ?auto_24736 - HOIST
      ?auto_24737 - PLACE
      ?auto_24738 - TRUCK
      ?auto_24739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24736 ?auto_24737 ) ( SURFACE-AT ?auto_24734 ?auto_24737 ) ( CLEAR ?auto_24734 ) ( IS-CRATE ?auto_24735 ) ( not ( = ?auto_24734 ?auto_24735 ) ) ( AVAILABLE ?auto_24736 ) ( IN ?auto_24735 ?auto_24738 ) ( TRUCK-AT ?auto_24738 ?auto_24739 ) ( not ( = ?auto_24739 ?auto_24737 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24738 ?auto_24739 ?auto_24737 )
      ( MAKE-1CRATE ?auto_24734 ?auto_24735 )
      ( MAKE-1CRATE-VERIFY ?auto_24734 ?auto_24735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24740 - SURFACE
      ?auto_24741 - SURFACE
    )
    :vars
    (
      ?auto_24744 - HOIST
      ?auto_24742 - PLACE
      ?auto_24745 - TRUCK
      ?auto_24743 - PLACE
      ?auto_24746 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24744 ?auto_24742 ) ( SURFACE-AT ?auto_24740 ?auto_24742 ) ( CLEAR ?auto_24740 ) ( IS-CRATE ?auto_24741 ) ( not ( = ?auto_24740 ?auto_24741 ) ) ( AVAILABLE ?auto_24744 ) ( TRUCK-AT ?auto_24745 ?auto_24743 ) ( not ( = ?auto_24743 ?auto_24742 ) ) ( HOIST-AT ?auto_24746 ?auto_24743 ) ( LIFTING ?auto_24746 ?auto_24741 ) ( not ( = ?auto_24744 ?auto_24746 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24746 ?auto_24741 ?auto_24745 ?auto_24743 )
      ( MAKE-1CRATE ?auto_24740 ?auto_24741 )
      ( MAKE-1CRATE-VERIFY ?auto_24740 ?auto_24741 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24747 - SURFACE
      ?auto_24748 - SURFACE
    )
    :vars
    (
      ?auto_24751 - HOIST
      ?auto_24749 - PLACE
      ?auto_24752 - TRUCK
      ?auto_24753 - PLACE
      ?auto_24750 - HOIST
      ?auto_24754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24751 ?auto_24749 ) ( SURFACE-AT ?auto_24747 ?auto_24749 ) ( CLEAR ?auto_24747 ) ( IS-CRATE ?auto_24748 ) ( not ( = ?auto_24747 ?auto_24748 ) ) ( AVAILABLE ?auto_24751 ) ( TRUCK-AT ?auto_24752 ?auto_24753 ) ( not ( = ?auto_24753 ?auto_24749 ) ) ( HOIST-AT ?auto_24750 ?auto_24753 ) ( not ( = ?auto_24751 ?auto_24750 ) ) ( AVAILABLE ?auto_24750 ) ( SURFACE-AT ?auto_24748 ?auto_24753 ) ( ON ?auto_24748 ?auto_24754 ) ( CLEAR ?auto_24748 ) ( not ( = ?auto_24747 ?auto_24754 ) ) ( not ( = ?auto_24748 ?auto_24754 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24750 ?auto_24748 ?auto_24754 ?auto_24753 )
      ( MAKE-1CRATE ?auto_24747 ?auto_24748 )
      ( MAKE-1CRATE-VERIFY ?auto_24747 ?auto_24748 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24755 - SURFACE
      ?auto_24756 - SURFACE
    )
    :vars
    (
      ?auto_24761 - HOIST
      ?auto_24760 - PLACE
      ?auto_24758 - PLACE
      ?auto_24757 - HOIST
      ?auto_24759 - SURFACE
      ?auto_24762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24761 ?auto_24760 ) ( SURFACE-AT ?auto_24755 ?auto_24760 ) ( CLEAR ?auto_24755 ) ( IS-CRATE ?auto_24756 ) ( not ( = ?auto_24755 ?auto_24756 ) ) ( AVAILABLE ?auto_24761 ) ( not ( = ?auto_24758 ?auto_24760 ) ) ( HOIST-AT ?auto_24757 ?auto_24758 ) ( not ( = ?auto_24761 ?auto_24757 ) ) ( AVAILABLE ?auto_24757 ) ( SURFACE-AT ?auto_24756 ?auto_24758 ) ( ON ?auto_24756 ?auto_24759 ) ( CLEAR ?auto_24756 ) ( not ( = ?auto_24755 ?auto_24759 ) ) ( not ( = ?auto_24756 ?auto_24759 ) ) ( TRUCK-AT ?auto_24762 ?auto_24760 ) )
    :subtasks
    ( ( !DRIVE ?auto_24762 ?auto_24760 ?auto_24758 )
      ( MAKE-1CRATE ?auto_24755 ?auto_24756 )
      ( MAKE-1CRATE-VERIFY ?auto_24755 ?auto_24756 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24772 - SURFACE
      ?auto_24773 - SURFACE
      ?auto_24774 - SURFACE
    )
    :vars
    (
      ?auto_24776 - HOIST
      ?auto_24775 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24776 ?auto_24775 ) ( SURFACE-AT ?auto_24773 ?auto_24775 ) ( CLEAR ?auto_24773 ) ( LIFTING ?auto_24776 ?auto_24774 ) ( IS-CRATE ?auto_24774 ) ( not ( = ?auto_24773 ?auto_24774 ) ) ( ON ?auto_24773 ?auto_24772 ) ( not ( = ?auto_24772 ?auto_24773 ) ) ( not ( = ?auto_24772 ?auto_24774 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24773 ?auto_24774 )
      ( MAKE-2CRATE-VERIFY ?auto_24772 ?auto_24773 ?auto_24774 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24782 - SURFACE
      ?auto_24783 - SURFACE
      ?auto_24784 - SURFACE
    )
    :vars
    (
      ?auto_24787 - HOIST
      ?auto_24785 - PLACE
      ?auto_24786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24787 ?auto_24785 ) ( SURFACE-AT ?auto_24783 ?auto_24785 ) ( CLEAR ?auto_24783 ) ( IS-CRATE ?auto_24784 ) ( not ( = ?auto_24783 ?auto_24784 ) ) ( TRUCK-AT ?auto_24786 ?auto_24785 ) ( AVAILABLE ?auto_24787 ) ( IN ?auto_24784 ?auto_24786 ) ( ON ?auto_24783 ?auto_24782 ) ( not ( = ?auto_24782 ?auto_24783 ) ) ( not ( = ?auto_24782 ?auto_24784 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24783 ?auto_24784 )
      ( MAKE-2CRATE-VERIFY ?auto_24782 ?auto_24783 ?auto_24784 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24788 - SURFACE
      ?auto_24789 - SURFACE
    )
    :vars
    (
      ?auto_24790 - HOIST
      ?auto_24793 - PLACE
      ?auto_24791 - TRUCK
      ?auto_24792 - SURFACE
      ?auto_24794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24790 ?auto_24793 ) ( SURFACE-AT ?auto_24788 ?auto_24793 ) ( CLEAR ?auto_24788 ) ( IS-CRATE ?auto_24789 ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( AVAILABLE ?auto_24790 ) ( IN ?auto_24789 ?auto_24791 ) ( ON ?auto_24788 ?auto_24792 ) ( not ( = ?auto_24792 ?auto_24788 ) ) ( not ( = ?auto_24792 ?auto_24789 ) ) ( TRUCK-AT ?auto_24791 ?auto_24794 ) ( not ( = ?auto_24794 ?auto_24793 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24791 ?auto_24794 ?auto_24793 )
      ( MAKE-2CRATE ?auto_24792 ?auto_24788 ?auto_24789 )
      ( MAKE-1CRATE-VERIFY ?auto_24788 ?auto_24789 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24795 - SURFACE
      ?auto_24796 - SURFACE
      ?auto_24797 - SURFACE
    )
    :vars
    (
      ?auto_24801 - HOIST
      ?auto_24798 - PLACE
      ?auto_24800 - TRUCK
      ?auto_24799 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24801 ?auto_24798 ) ( SURFACE-AT ?auto_24796 ?auto_24798 ) ( CLEAR ?auto_24796 ) ( IS-CRATE ?auto_24797 ) ( not ( = ?auto_24796 ?auto_24797 ) ) ( AVAILABLE ?auto_24801 ) ( IN ?auto_24797 ?auto_24800 ) ( ON ?auto_24796 ?auto_24795 ) ( not ( = ?auto_24795 ?auto_24796 ) ) ( not ( = ?auto_24795 ?auto_24797 ) ) ( TRUCK-AT ?auto_24800 ?auto_24799 ) ( not ( = ?auto_24799 ?auto_24798 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24796 ?auto_24797 )
      ( MAKE-2CRATE-VERIFY ?auto_24795 ?auto_24796 ?auto_24797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24802 - SURFACE
      ?auto_24803 - SURFACE
    )
    :vars
    (
      ?auto_24804 - HOIST
      ?auto_24805 - PLACE
      ?auto_24807 - SURFACE
      ?auto_24808 - TRUCK
      ?auto_24806 - PLACE
      ?auto_24809 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24804 ?auto_24805 ) ( SURFACE-AT ?auto_24802 ?auto_24805 ) ( CLEAR ?auto_24802 ) ( IS-CRATE ?auto_24803 ) ( not ( = ?auto_24802 ?auto_24803 ) ) ( AVAILABLE ?auto_24804 ) ( ON ?auto_24802 ?auto_24807 ) ( not ( = ?auto_24807 ?auto_24802 ) ) ( not ( = ?auto_24807 ?auto_24803 ) ) ( TRUCK-AT ?auto_24808 ?auto_24806 ) ( not ( = ?auto_24806 ?auto_24805 ) ) ( HOIST-AT ?auto_24809 ?auto_24806 ) ( LIFTING ?auto_24809 ?auto_24803 ) ( not ( = ?auto_24804 ?auto_24809 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24809 ?auto_24803 ?auto_24808 ?auto_24806 )
      ( MAKE-2CRATE ?auto_24807 ?auto_24802 ?auto_24803 )
      ( MAKE-1CRATE-VERIFY ?auto_24802 ?auto_24803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24810 - SURFACE
      ?auto_24811 - SURFACE
      ?auto_24812 - SURFACE
    )
    :vars
    (
      ?auto_24814 - HOIST
      ?auto_24816 - PLACE
      ?auto_24815 - TRUCK
      ?auto_24817 - PLACE
      ?auto_24813 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24814 ?auto_24816 ) ( SURFACE-AT ?auto_24811 ?auto_24816 ) ( CLEAR ?auto_24811 ) ( IS-CRATE ?auto_24812 ) ( not ( = ?auto_24811 ?auto_24812 ) ) ( AVAILABLE ?auto_24814 ) ( ON ?auto_24811 ?auto_24810 ) ( not ( = ?auto_24810 ?auto_24811 ) ) ( not ( = ?auto_24810 ?auto_24812 ) ) ( TRUCK-AT ?auto_24815 ?auto_24817 ) ( not ( = ?auto_24817 ?auto_24816 ) ) ( HOIST-AT ?auto_24813 ?auto_24817 ) ( LIFTING ?auto_24813 ?auto_24812 ) ( not ( = ?auto_24814 ?auto_24813 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24811 ?auto_24812 )
      ( MAKE-2CRATE-VERIFY ?auto_24810 ?auto_24811 ?auto_24812 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24818 - SURFACE
      ?auto_24819 - SURFACE
    )
    :vars
    (
      ?auto_24822 - HOIST
      ?auto_24823 - PLACE
      ?auto_24821 - SURFACE
      ?auto_24825 - TRUCK
      ?auto_24820 - PLACE
      ?auto_24824 - HOIST
      ?auto_24826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24822 ?auto_24823 ) ( SURFACE-AT ?auto_24818 ?auto_24823 ) ( CLEAR ?auto_24818 ) ( IS-CRATE ?auto_24819 ) ( not ( = ?auto_24818 ?auto_24819 ) ) ( AVAILABLE ?auto_24822 ) ( ON ?auto_24818 ?auto_24821 ) ( not ( = ?auto_24821 ?auto_24818 ) ) ( not ( = ?auto_24821 ?auto_24819 ) ) ( TRUCK-AT ?auto_24825 ?auto_24820 ) ( not ( = ?auto_24820 ?auto_24823 ) ) ( HOIST-AT ?auto_24824 ?auto_24820 ) ( not ( = ?auto_24822 ?auto_24824 ) ) ( AVAILABLE ?auto_24824 ) ( SURFACE-AT ?auto_24819 ?auto_24820 ) ( ON ?auto_24819 ?auto_24826 ) ( CLEAR ?auto_24819 ) ( not ( = ?auto_24818 ?auto_24826 ) ) ( not ( = ?auto_24819 ?auto_24826 ) ) ( not ( = ?auto_24821 ?auto_24826 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24824 ?auto_24819 ?auto_24826 ?auto_24820 )
      ( MAKE-2CRATE ?auto_24821 ?auto_24818 ?auto_24819 )
      ( MAKE-1CRATE-VERIFY ?auto_24818 ?auto_24819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24827 - SURFACE
      ?auto_24828 - SURFACE
      ?auto_24829 - SURFACE
    )
    :vars
    (
      ?auto_24834 - HOIST
      ?auto_24833 - PLACE
      ?auto_24830 - TRUCK
      ?auto_24832 - PLACE
      ?auto_24835 - HOIST
      ?auto_24831 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24834 ?auto_24833 ) ( SURFACE-AT ?auto_24828 ?auto_24833 ) ( CLEAR ?auto_24828 ) ( IS-CRATE ?auto_24829 ) ( not ( = ?auto_24828 ?auto_24829 ) ) ( AVAILABLE ?auto_24834 ) ( ON ?auto_24828 ?auto_24827 ) ( not ( = ?auto_24827 ?auto_24828 ) ) ( not ( = ?auto_24827 ?auto_24829 ) ) ( TRUCK-AT ?auto_24830 ?auto_24832 ) ( not ( = ?auto_24832 ?auto_24833 ) ) ( HOIST-AT ?auto_24835 ?auto_24832 ) ( not ( = ?auto_24834 ?auto_24835 ) ) ( AVAILABLE ?auto_24835 ) ( SURFACE-AT ?auto_24829 ?auto_24832 ) ( ON ?auto_24829 ?auto_24831 ) ( CLEAR ?auto_24829 ) ( not ( = ?auto_24828 ?auto_24831 ) ) ( not ( = ?auto_24829 ?auto_24831 ) ) ( not ( = ?auto_24827 ?auto_24831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24828 ?auto_24829 )
      ( MAKE-2CRATE-VERIFY ?auto_24827 ?auto_24828 ?auto_24829 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24836 - SURFACE
      ?auto_24837 - SURFACE
    )
    :vars
    (
      ?auto_24840 - HOIST
      ?auto_24844 - PLACE
      ?auto_24843 - SURFACE
      ?auto_24841 - PLACE
      ?auto_24839 - HOIST
      ?auto_24838 - SURFACE
      ?auto_24842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24840 ?auto_24844 ) ( SURFACE-AT ?auto_24836 ?auto_24844 ) ( CLEAR ?auto_24836 ) ( IS-CRATE ?auto_24837 ) ( not ( = ?auto_24836 ?auto_24837 ) ) ( AVAILABLE ?auto_24840 ) ( ON ?auto_24836 ?auto_24843 ) ( not ( = ?auto_24843 ?auto_24836 ) ) ( not ( = ?auto_24843 ?auto_24837 ) ) ( not ( = ?auto_24841 ?auto_24844 ) ) ( HOIST-AT ?auto_24839 ?auto_24841 ) ( not ( = ?auto_24840 ?auto_24839 ) ) ( AVAILABLE ?auto_24839 ) ( SURFACE-AT ?auto_24837 ?auto_24841 ) ( ON ?auto_24837 ?auto_24838 ) ( CLEAR ?auto_24837 ) ( not ( = ?auto_24836 ?auto_24838 ) ) ( not ( = ?auto_24837 ?auto_24838 ) ) ( not ( = ?auto_24843 ?auto_24838 ) ) ( TRUCK-AT ?auto_24842 ?auto_24844 ) )
    :subtasks
    ( ( !DRIVE ?auto_24842 ?auto_24844 ?auto_24841 )
      ( MAKE-2CRATE ?auto_24843 ?auto_24836 ?auto_24837 )
      ( MAKE-1CRATE-VERIFY ?auto_24836 ?auto_24837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24845 - SURFACE
      ?auto_24846 - SURFACE
      ?auto_24847 - SURFACE
    )
    :vars
    (
      ?auto_24853 - HOIST
      ?auto_24848 - PLACE
      ?auto_24852 - PLACE
      ?auto_24849 - HOIST
      ?auto_24851 - SURFACE
      ?auto_24850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24853 ?auto_24848 ) ( SURFACE-AT ?auto_24846 ?auto_24848 ) ( CLEAR ?auto_24846 ) ( IS-CRATE ?auto_24847 ) ( not ( = ?auto_24846 ?auto_24847 ) ) ( AVAILABLE ?auto_24853 ) ( ON ?auto_24846 ?auto_24845 ) ( not ( = ?auto_24845 ?auto_24846 ) ) ( not ( = ?auto_24845 ?auto_24847 ) ) ( not ( = ?auto_24852 ?auto_24848 ) ) ( HOIST-AT ?auto_24849 ?auto_24852 ) ( not ( = ?auto_24853 ?auto_24849 ) ) ( AVAILABLE ?auto_24849 ) ( SURFACE-AT ?auto_24847 ?auto_24852 ) ( ON ?auto_24847 ?auto_24851 ) ( CLEAR ?auto_24847 ) ( not ( = ?auto_24846 ?auto_24851 ) ) ( not ( = ?auto_24847 ?auto_24851 ) ) ( not ( = ?auto_24845 ?auto_24851 ) ) ( TRUCK-AT ?auto_24850 ?auto_24848 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24846 ?auto_24847 )
      ( MAKE-2CRATE-VERIFY ?auto_24845 ?auto_24846 ?auto_24847 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24854 - SURFACE
      ?auto_24855 - SURFACE
    )
    :vars
    (
      ?auto_24857 - HOIST
      ?auto_24861 - PLACE
      ?auto_24862 - SURFACE
      ?auto_24859 - PLACE
      ?auto_24858 - HOIST
      ?auto_24860 - SURFACE
      ?auto_24856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24857 ?auto_24861 ) ( IS-CRATE ?auto_24855 ) ( not ( = ?auto_24854 ?auto_24855 ) ) ( not ( = ?auto_24862 ?auto_24854 ) ) ( not ( = ?auto_24862 ?auto_24855 ) ) ( not ( = ?auto_24859 ?auto_24861 ) ) ( HOIST-AT ?auto_24858 ?auto_24859 ) ( not ( = ?auto_24857 ?auto_24858 ) ) ( AVAILABLE ?auto_24858 ) ( SURFACE-AT ?auto_24855 ?auto_24859 ) ( ON ?auto_24855 ?auto_24860 ) ( CLEAR ?auto_24855 ) ( not ( = ?auto_24854 ?auto_24860 ) ) ( not ( = ?auto_24855 ?auto_24860 ) ) ( not ( = ?auto_24862 ?auto_24860 ) ) ( TRUCK-AT ?auto_24856 ?auto_24861 ) ( SURFACE-AT ?auto_24862 ?auto_24861 ) ( CLEAR ?auto_24862 ) ( LIFTING ?auto_24857 ?auto_24854 ) ( IS-CRATE ?auto_24854 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24862 ?auto_24854 )
      ( MAKE-2CRATE ?auto_24862 ?auto_24854 ?auto_24855 )
      ( MAKE-1CRATE-VERIFY ?auto_24854 ?auto_24855 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24863 - SURFACE
      ?auto_24864 - SURFACE
      ?auto_24865 - SURFACE
    )
    :vars
    (
      ?auto_24868 - HOIST
      ?auto_24867 - PLACE
      ?auto_24869 - PLACE
      ?auto_24870 - HOIST
      ?auto_24866 - SURFACE
      ?auto_24871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24868 ?auto_24867 ) ( IS-CRATE ?auto_24865 ) ( not ( = ?auto_24864 ?auto_24865 ) ) ( not ( = ?auto_24863 ?auto_24864 ) ) ( not ( = ?auto_24863 ?auto_24865 ) ) ( not ( = ?auto_24869 ?auto_24867 ) ) ( HOIST-AT ?auto_24870 ?auto_24869 ) ( not ( = ?auto_24868 ?auto_24870 ) ) ( AVAILABLE ?auto_24870 ) ( SURFACE-AT ?auto_24865 ?auto_24869 ) ( ON ?auto_24865 ?auto_24866 ) ( CLEAR ?auto_24865 ) ( not ( = ?auto_24864 ?auto_24866 ) ) ( not ( = ?auto_24865 ?auto_24866 ) ) ( not ( = ?auto_24863 ?auto_24866 ) ) ( TRUCK-AT ?auto_24871 ?auto_24867 ) ( SURFACE-AT ?auto_24863 ?auto_24867 ) ( CLEAR ?auto_24863 ) ( LIFTING ?auto_24868 ?auto_24864 ) ( IS-CRATE ?auto_24864 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24864 ?auto_24865 )
      ( MAKE-2CRATE-VERIFY ?auto_24863 ?auto_24864 ?auto_24865 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24872 - SURFACE
      ?auto_24873 - SURFACE
    )
    :vars
    (
      ?auto_24879 - HOIST
      ?auto_24876 - PLACE
      ?auto_24878 - SURFACE
      ?auto_24874 - PLACE
      ?auto_24875 - HOIST
      ?auto_24877 - SURFACE
      ?auto_24880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24879 ?auto_24876 ) ( IS-CRATE ?auto_24873 ) ( not ( = ?auto_24872 ?auto_24873 ) ) ( not ( = ?auto_24878 ?auto_24872 ) ) ( not ( = ?auto_24878 ?auto_24873 ) ) ( not ( = ?auto_24874 ?auto_24876 ) ) ( HOIST-AT ?auto_24875 ?auto_24874 ) ( not ( = ?auto_24879 ?auto_24875 ) ) ( AVAILABLE ?auto_24875 ) ( SURFACE-AT ?auto_24873 ?auto_24874 ) ( ON ?auto_24873 ?auto_24877 ) ( CLEAR ?auto_24873 ) ( not ( = ?auto_24872 ?auto_24877 ) ) ( not ( = ?auto_24873 ?auto_24877 ) ) ( not ( = ?auto_24878 ?auto_24877 ) ) ( TRUCK-AT ?auto_24880 ?auto_24876 ) ( SURFACE-AT ?auto_24878 ?auto_24876 ) ( CLEAR ?auto_24878 ) ( IS-CRATE ?auto_24872 ) ( AVAILABLE ?auto_24879 ) ( IN ?auto_24872 ?auto_24880 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24879 ?auto_24872 ?auto_24880 ?auto_24876 )
      ( MAKE-2CRATE ?auto_24878 ?auto_24872 ?auto_24873 )
      ( MAKE-1CRATE-VERIFY ?auto_24872 ?auto_24873 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24881 - SURFACE
      ?auto_24882 - SURFACE
      ?auto_24883 - SURFACE
    )
    :vars
    (
      ?auto_24884 - HOIST
      ?auto_24885 - PLACE
      ?auto_24889 - PLACE
      ?auto_24886 - HOIST
      ?auto_24887 - SURFACE
      ?auto_24888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24884 ?auto_24885 ) ( IS-CRATE ?auto_24883 ) ( not ( = ?auto_24882 ?auto_24883 ) ) ( not ( = ?auto_24881 ?auto_24882 ) ) ( not ( = ?auto_24881 ?auto_24883 ) ) ( not ( = ?auto_24889 ?auto_24885 ) ) ( HOIST-AT ?auto_24886 ?auto_24889 ) ( not ( = ?auto_24884 ?auto_24886 ) ) ( AVAILABLE ?auto_24886 ) ( SURFACE-AT ?auto_24883 ?auto_24889 ) ( ON ?auto_24883 ?auto_24887 ) ( CLEAR ?auto_24883 ) ( not ( = ?auto_24882 ?auto_24887 ) ) ( not ( = ?auto_24883 ?auto_24887 ) ) ( not ( = ?auto_24881 ?auto_24887 ) ) ( TRUCK-AT ?auto_24888 ?auto_24885 ) ( SURFACE-AT ?auto_24881 ?auto_24885 ) ( CLEAR ?auto_24881 ) ( IS-CRATE ?auto_24882 ) ( AVAILABLE ?auto_24884 ) ( IN ?auto_24882 ?auto_24888 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24882 ?auto_24883 )
      ( MAKE-2CRATE-VERIFY ?auto_24881 ?auto_24882 ?auto_24883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24890 - SURFACE
      ?auto_24891 - SURFACE
    )
    :vars
    (
      ?auto_24894 - HOIST
      ?auto_24896 - PLACE
      ?auto_24897 - SURFACE
      ?auto_24895 - PLACE
      ?auto_24893 - HOIST
      ?auto_24898 - SURFACE
      ?auto_24892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24894 ?auto_24896 ) ( IS-CRATE ?auto_24891 ) ( not ( = ?auto_24890 ?auto_24891 ) ) ( not ( = ?auto_24897 ?auto_24890 ) ) ( not ( = ?auto_24897 ?auto_24891 ) ) ( not ( = ?auto_24895 ?auto_24896 ) ) ( HOIST-AT ?auto_24893 ?auto_24895 ) ( not ( = ?auto_24894 ?auto_24893 ) ) ( AVAILABLE ?auto_24893 ) ( SURFACE-AT ?auto_24891 ?auto_24895 ) ( ON ?auto_24891 ?auto_24898 ) ( CLEAR ?auto_24891 ) ( not ( = ?auto_24890 ?auto_24898 ) ) ( not ( = ?auto_24891 ?auto_24898 ) ) ( not ( = ?auto_24897 ?auto_24898 ) ) ( SURFACE-AT ?auto_24897 ?auto_24896 ) ( CLEAR ?auto_24897 ) ( IS-CRATE ?auto_24890 ) ( AVAILABLE ?auto_24894 ) ( IN ?auto_24890 ?auto_24892 ) ( TRUCK-AT ?auto_24892 ?auto_24895 ) )
    :subtasks
    ( ( !DRIVE ?auto_24892 ?auto_24895 ?auto_24896 )
      ( MAKE-2CRATE ?auto_24897 ?auto_24890 ?auto_24891 )
      ( MAKE-1CRATE-VERIFY ?auto_24890 ?auto_24891 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24899 - SURFACE
      ?auto_24900 - SURFACE
      ?auto_24901 - SURFACE
    )
    :vars
    (
      ?auto_24903 - HOIST
      ?auto_24905 - PLACE
      ?auto_24902 - PLACE
      ?auto_24907 - HOIST
      ?auto_24904 - SURFACE
      ?auto_24906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24903 ?auto_24905 ) ( IS-CRATE ?auto_24901 ) ( not ( = ?auto_24900 ?auto_24901 ) ) ( not ( = ?auto_24899 ?auto_24900 ) ) ( not ( = ?auto_24899 ?auto_24901 ) ) ( not ( = ?auto_24902 ?auto_24905 ) ) ( HOIST-AT ?auto_24907 ?auto_24902 ) ( not ( = ?auto_24903 ?auto_24907 ) ) ( AVAILABLE ?auto_24907 ) ( SURFACE-AT ?auto_24901 ?auto_24902 ) ( ON ?auto_24901 ?auto_24904 ) ( CLEAR ?auto_24901 ) ( not ( = ?auto_24900 ?auto_24904 ) ) ( not ( = ?auto_24901 ?auto_24904 ) ) ( not ( = ?auto_24899 ?auto_24904 ) ) ( SURFACE-AT ?auto_24899 ?auto_24905 ) ( CLEAR ?auto_24899 ) ( IS-CRATE ?auto_24900 ) ( AVAILABLE ?auto_24903 ) ( IN ?auto_24900 ?auto_24906 ) ( TRUCK-AT ?auto_24906 ?auto_24902 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24900 ?auto_24901 )
      ( MAKE-2CRATE-VERIFY ?auto_24899 ?auto_24900 ?auto_24901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24908 - SURFACE
      ?auto_24909 - SURFACE
    )
    :vars
    (
      ?auto_24913 - HOIST
      ?auto_24914 - PLACE
      ?auto_24912 - SURFACE
      ?auto_24916 - PLACE
      ?auto_24910 - HOIST
      ?auto_24915 - SURFACE
      ?auto_24911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24913 ?auto_24914 ) ( IS-CRATE ?auto_24909 ) ( not ( = ?auto_24908 ?auto_24909 ) ) ( not ( = ?auto_24912 ?auto_24908 ) ) ( not ( = ?auto_24912 ?auto_24909 ) ) ( not ( = ?auto_24916 ?auto_24914 ) ) ( HOIST-AT ?auto_24910 ?auto_24916 ) ( not ( = ?auto_24913 ?auto_24910 ) ) ( SURFACE-AT ?auto_24909 ?auto_24916 ) ( ON ?auto_24909 ?auto_24915 ) ( CLEAR ?auto_24909 ) ( not ( = ?auto_24908 ?auto_24915 ) ) ( not ( = ?auto_24909 ?auto_24915 ) ) ( not ( = ?auto_24912 ?auto_24915 ) ) ( SURFACE-AT ?auto_24912 ?auto_24914 ) ( CLEAR ?auto_24912 ) ( IS-CRATE ?auto_24908 ) ( AVAILABLE ?auto_24913 ) ( TRUCK-AT ?auto_24911 ?auto_24916 ) ( LIFTING ?auto_24910 ?auto_24908 ) )
    :subtasks
    ( ( !LOAD ?auto_24910 ?auto_24908 ?auto_24911 ?auto_24916 )
      ( MAKE-2CRATE ?auto_24912 ?auto_24908 ?auto_24909 )
      ( MAKE-1CRATE-VERIFY ?auto_24908 ?auto_24909 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24917 - SURFACE
      ?auto_24918 - SURFACE
      ?auto_24919 - SURFACE
    )
    :vars
    (
      ?auto_24920 - HOIST
      ?auto_24922 - PLACE
      ?auto_24925 - PLACE
      ?auto_24921 - HOIST
      ?auto_24924 - SURFACE
      ?auto_24923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24920 ?auto_24922 ) ( IS-CRATE ?auto_24919 ) ( not ( = ?auto_24918 ?auto_24919 ) ) ( not ( = ?auto_24917 ?auto_24918 ) ) ( not ( = ?auto_24917 ?auto_24919 ) ) ( not ( = ?auto_24925 ?auto_24922 ) ) ( HOIST-AT ?auto_24921 ?auto_24925 ) ( not ( = ?auto_24920 ?auto_24921 ) ) ( SURFACE-AT ?auto_24919 ?auto_24925 ) ( ON ?auto_24919 ?auto_24924 ) ( CLEAR ?auto_24919 ) ( not ( = ?auto_24918 ?auto_24924 ) ) ( not ( = ?auto_24919 ?auto_24924 ) ) ( not ( = ?auto_24917 ?auto_24924 ) ) ( SURFACE-AT ?auto_24917 ?auto_24922 ) ( CLEAR ?auto_24917 ) ( IS-CRATE ?auto_24918 ) ( AVAILABLE ?auto_24920 ) ( TRUCK-AT ?auto_24923 ?auto_24925 ) ( LIFTING ?auto_24921 ?auto_24918 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24918 ?auto_24919 )
      ( MAKE-2CRATE-VERIFY ?auto_24917 ?auto_24918 ?auto_24919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24926 - SURFACE
      ?auto_24927 - SURFACE
    )
    :vars
    (
      ?auto_24930 - HOIST
      ?auto_24928 - PLACE
      ?auto_24934 - SURFACE
      ?auto_24933 - PLACE
      ?auto_24932 - HOIST
      ?auto_24929 - SURFACE
      ?auto_24931 - TRUCK
      ?auto_24935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24930 ?auto_24928 ) ( IS-CRATE ?auto_24927 ) ( not ( = ?auto_24926 ?auto_24927 ) ) ( not ( = ?auto_24934 ?auto_24926 ) ) ( not ( = ?auto_24934 ?auto_24927 ) ) ( not ( = ?auto_24933 ?auto_24928 ) ) ( HOIST-AT ?auto_24932 ?auto_24933 ) ( not ( = ?auto_24930 ?auto_24932 ) ) ( SURFACE-AT ?auto_24927 ?auto_24933 ) ( ON ?auto_24927 ?auto_24929 ) ( CLEAR ?auto_24927 ) ( not ( = ?auto_24926 ?auto_24929 ) ) ( not ( = ?auto_24927 ?auto_24929 ) ) ( not ( = ?auto_24934 ?auto_24929 ) ) ( SURFACE-AT ?auto_24934 ?auto_24928 ) ( CLEAR ?auto_24934 ) ( IS-CRATE ?auto_24926 ) ( AVAILABLE ?auto_24930 ) ( TRUCK-AT ?auto_24931 ?auto_24933 ) ( AVAILABLE ?auto_24932 ) ( SURFACE-AT ?auto_24926 ?auto_24933 ) ( ON ?auto_24926 ?auto_24935 ) ( CLEAR ?auto_24926 ) ( not ( = ?auto_24926 ?auto_24935 ) ) ( not ( = ?auto_24927 ?auto_24935 ) ) ( not ( = ?auto_24934 ?auto_24935 ) ) ( not ( = ?auto_24929 ?auto_24935 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24932 ?auto_24926 ?auto_24935 ?auto_24933 )
      ( MAKE-2CRATE ?auto_24934 ?auto_24926 ?auto_24927 )
      ( MAKE-1CRATE-VERIFY ?auto_24926 ?auto_24927 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24936 - SURFACE
      ?auto_24937 - SURFACE
      ?auto_24938 - SURFACE
    )
    :vars
    (
      ?auto_24939 - HOIST
      ?auto_24942 - PLACE
      ?auto_24941 - PLACE
      ?auto_24944 - HOIST
      ?auto_24940 - SURFACE
      ?auto_24945 - TRUCK
      ?auto_24943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24939 ?auto_24942 ) ( IS-CRATE ?auto_24938 ) ( not ( = ?auto_24937 ?auto_24938 ) ) ( not ( = ?auto_24936 ?auto_24937 ) ) ( not ( = ?auto_24936 ?auto_24938 ) ) ( not ( = ?auto_24941 ?auto_24942 ) ) ( HOIST-AT ?auto_24944 ?auto_24941 ) ( not ( = ?auto_24939 ?auto_24944 ) ) ( SURFACE-AT ?auto_24938 ?auto_24941 ) ( ON ?auto_24938 ?auto_24940 ) ( CLEAR ?auto_24938 ) ( not ( = ?auto_24937 ?auto_24940 ) ) ( not ( = ?auto_24938 ?auto_24940 ) ) ( not ( = ?auto_24936 ?auto_24940 ) ) ( SURFACE-AT ?auto_24936 ?auto_24942 ) ( CLEAR ?auto_24936 ) ( IS-CRATE ?auto_24937 ) ( AVAILABLE ?auto_24939 ) ( TRUCK-AT ?auto_24945 ?auto_24941 ) ( AVAILABLE ?auto_24944 ) ( SURFACE-AT ?auto_24937 ?auto_24941 ) ( ON ?auto_24937 ?auto_24943 ) ( CLEAR ?auto_24937 ) ( not ( = ?auto_24937 ?auto_24943 ) ) ( not ( = ?auto_24938 ?auto_24943 ) ) ( not ( = ?auto_24936 ?auto_24943 ) ) ( not ( = ?auto_24940 ?auto_24943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24937 ?auto_24938 )
      ( MAKE-2CRATE-VERIFY ?auto_24936 ?auto_24937 ?auto_24938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24946 - SURFACE
      ?auto_24947 - SURFACE
    )
    :vars
    (
      ?auto_24949 - HOIST
      ?auto_24954 - PLACE
      ?auto_24952 - SURFACE
      ?auto_24948 - PLACE
      ?auto_24953 - HOIST
      ?auto_24955 - SURFACE
      ?auto_24950 - SURFACE
      ?auto_24951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24949 ?auto_24954 ) ( IS-CRATE ?auto_24947 ) ( not ( = ?auto_24946 ?auto_24947 ) ) ( not ( = ?auto_24952 ?auto_24946 ) ) ( not ( = ?auto_24952 ?auto_24947 ) ) ( not ( = ?auto_24948 ?auto_24954 ) ) ( HOIST-AT ?auto_24953 ?auto_24948 ) ( not ( = ?auto_24949 ?auto_24953 ) ) ( SURFACE-AT ?auto_24947 ?auto_24948 ) ( ON ?auto_24947 ?auto_24955 ) ( CLEAR ?auto_24947 ) ( not ( = ?auto_24946 ?auto_24955 ) ) ( not ( = ?auto_24947 ?auto_24955 ) ) ( not ( = ?auto_24952 ?auto_24955 ) ) ( SURFACE-AT ?auto_24952 ?auto_24954 ) ( CLEAR ?auto_24952 ) ( IS-CRATE ?auto_24946 ) ( AVAILABLE ?auto_24949 ) ( AVAILABLE ?auto_24953 ) ( SURFACE-AT ?auto_24946 ?auto_24948 ) ( ON ?auto_24946 ?auto_24950 ) ( CLEAR ?auto_24946 ) ( not ( = ?auto_24946 ?auto_24950 ) ) ( not ( = ?auto_24947 ?auto_24950 ) ) ( not ( = ?auto_24952 ?auto_24950 ) ) ( not ( = ?auto_24955 ?auto_24950 ) ) ( TRUCK-AT ?auto_24951 ?auto_24954 ) )
    :subtasks
    ( ( !DRIVE ?auto_24951 ?auto_24954 ?auto_24948 )
      ( MAKE-2CRATE ?auto_24952 ?auto_24946 ?auto_24947 )
      ( MAKE-1CRATE-VERIFY ?auto_24946 ?auto_24947 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24956 - SURFACE
      ?auto_24957 - SURFACE
      ?auto_24958 - SURFACE
    )
    :vars
    (
      ?auto_24961 - HOIST
      ?auto_24960 - PLACE
      ?auto_24962 - PLACE
      ?auto_24959 - HOIST
      ?auto_24965 - SURFACE
      ?auto_24964 - SURFACE
      ?auto_24963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24961 ?auto_24960 ) ( IS-CRATE ?auto_24958 ) ( not ( = ?auto_24957 ?auto_24958 ) ) ( not ( = ?auto_24956 ?auto_24957 ) ) ( not ( = ?auto_24956 ?auto_24958 ) ) ( not ( = ?auto_24962 ?auto_24960 ) ) ( HOIST-AT ?auto_24959 ?auto_24962 ) ( not ( = ?auto_24961 ?auto_24959 ) ) ( SURFACE-AT ?auto_24958 ?auto_24962 ) ( ON ?auto_24958 ?auto_24965 ) ( CLEAR ?auto_24958 ) ( not ( = ?auto_24957 ?auto_24965 ) ) ( not ( = ?auto_24958 ?auto_24965 ) ) ( not ( = ?auto_24956 ?auto_24965 ) ) ( SURFACE-AT ?auto_24956 ?auto_24960 ) ( CLEAR ?auto_24956 ) ( IS-CRATE ?auto_24957 ) ( AVAILABLE ?auto_24961 ) ( AVAILABLE ?auto_24959 ) ( SURFACE-AT ?auto_24957 ?auto_24962 ) ( ON ?auto_24957 ?auto_24964 ) ( CLEAR ?auto_24957 ) ( not ( = ?auto_24957 ?auto_24964 ) ) ( not ( = ?auto_24958 ?auto_24964 ) ) ( not ( = ?auto_24956 ?auto_24964 ) ) ( not ( = ?auto_24965 ?auto_24964 ) ) ( TRUCK-AT ?auto_24963 ?auto_24960 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24957 ?auto_24958 )
      ( MAKE-2CRATE-VERIFY ?auto_24956 ?auto_24957 ?auto_24958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24985 - SURFACE
      ?auto_24986 - SURFACE
      ?auto_24987 - SURFACE
      ?auto_24984 - SURFACE
    )
    :vars
    (
      ?auto_24988 - HOIST
      ?auto_24989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24988 ?auto_24989 ) ( SURFACE-AT ?auto_24987 ?auto_24989 ) ( CLEAR ?auto_24987 ) ( LIFTING ?auto_24988 ?auto_24984 ) ( IS-CRATE ?auto_24984 ) ( not ( = ?auto_24987 ?auto_24984 ) ) ( ON ?auto_24986 ?auto_24985 ) ( ON ?auto_24987 ?auto_24986 ) ( not ( = ?auto_24985 ?auto_24986 ) ) ( not ( = ?auto_24985 ?auto_24987 ) ) ( not ( = ?auto_24985 ?auto_24984 ) ) ( not ( = ?auto_24986 ?auto_24987 ) ) ( not ( = ?auto_24986 ?auto_24984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24987 ?auto_24984 )
      ( MAKE-3CRATE-VERIFY ?auto_24985 ?auto_24986 ?auto_24987 ?auto_24984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25002 - SURFACE
      ?auto_25003 - SURFACE
      ?auto_25004 - SURFACE
      ?auto_25001 - SURFACE
    )
    :vars
    (
      ?auto_25006 - HOIST
      ?auto_25007 - PLACE
      ?auto_25005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25006 ?auto_25007 ) ( SURFACE-AT ?auto_25004 ?auto_25007 ) ( CLEAR ?auto_25004 ) ( IS-CRATE ?auto_25001 ) ( not ( = ?auto_25004 ?auto_25001 ) ) ( TRUCK-AT ?auto_25005 ?auto_25007 ) ( AVAILABLE ?auto_25006 ) ( IN ?auto_25001 ?auto_25005 ) ( ON ?auto_25004 ?auto_25003 ) ( not ( = ?auto_25003 ?auto_25004 ) ) ( not ( = ?auto_25003 ?auto_25001 ) ) ( ON ?auto_25003 ?auto_25002 ) ( not ( = ?auto_25002 ?auto_25003 ) ) ( not ( = ?auto_25002 ?auto_25004 ) ) ( not ( = ?auto_25002 ?auto_25001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25003 ?auto_25004 ?auto_25001 )
      ( MAKE-3CRATE-VERIFY ?auto_25002 ?auto_25003 ?auto_25004 ?auto_25001 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25023 - SURFACE
      ?auto_25024 - SURFACE
      ?auto_25025 - SURFACE
      ?auto_25022 - SURFACE
    )
    :vars
    (
      ?auto_25029 - HOIST
      ?auto_25026 - PLACE
      ?auto_25028 - TRUCK
      ?auto_25027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25029 ?auto_25026 ) ( SURFACE-AT ?auto_25025 ?auto_25026 ) ( CLEAR ?auto_25025 ) ( IS-CRATE ?auto_25022 ) ( not ( = ?auto_25025 ?auto_25022 ) ) ( AVAILABLE ?auto_25029 ) ( IN ?auto_25022 ?auto_25028 ) ( ON ?auto_25025 ?auto_25024 ) ( not ( = ?auto_25024 ?auto_25025 ) ) ( not ( = ?auto_25024 ?auto_25022 ) ) ( TRUCK-AT ?auto_25028 ?auto_25027 ) ( not ( = ?auto_25027 ?auto_25026 ) ) ( ON ?auto_25024 ?auto_25023 ) ( not ( = ?auto_25023 ?auto_25024 ) ) ( not ( = ?auto_25023 ?auto_25025 ) ) ( not ( = ?auto_25023 ?auto_25022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25024 ?auto_25025 ?auto_25022 )
      ( MAKE-3CRATE-VERIFY ?auto_25023 ?auto_25024 ?auto_25025 ?auto_25022 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25047 - SURFACE
      ?auto_25048 - SURFACE
      ?auto_25049 - SURFACE
      ?auto_25046 - SURFACE
    )
    :vars
    (
      ?auto_25051 - HOIST
      ?auto_25052 - PLACE
      ?auto_25050 - TRUCK
      ?auto_25053 - PLACE
      ?auto_25054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25051 ?auto_25052 ) ( SURFACE-AT ?auto_25049 ?auto_25052 ) ( CLEAR ?auto_25049 ) ( IS-CRATE ?auto_25046 ) ( not ( = ?auto_25049 ?auto_25046 ) ) ( AVAILABLE ?auto_25051 ) ( ON ?auto_25049 ?auto_25048 ) ( not ( = ?auto_25048 ?auto_25049 ) ) ( not ( = ?auto_25048 ?auto_25046 ) ) ( TRUCK-AT ?auto_25050 ?auto_25053 ) ( not ( = ?auto_25053 ?auto_25052 ) ) ( HOIST-AT ?auto_25054 ?auto_25053 ) ( LIFTING ?auto_25054 ?auto_25046 ) ( not ( = ?auto_25051 ?auto_25054 ) ) ( ON ?auto_25048 ?auto_25047 ) ( not ( = ?auto_25047 ?auto_25048 ) ) ( not ( = ?auto_25047 ?auto_25049 ) ) ( not ( = ?auto_25047 ?auto_25046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25048 ?auto_25049 ?auto_25046 )
      ( MAKE-3CRATE-VERIFY ?auto_25047 ?auto_25048 ?auto_25049 ?auto_25046 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25074 - SURFACE
      ?auto_25075 - SURFACE
      ?auto_25076 - SURFACE
      ?auto_25073 - SURFACE
    )
    :vars
    (
      ?auto_25078 - HOIST
      ?auto_25082 - PLACE
      ?auto_25081 - TRUCK
      ?auto_25080 - PLACE
      ?auto_25079 - HOIST
      ?auto_25077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25078 ?auto_25082 ) ( SURFACE-AT ?auto_25076 ?auto_25082 ) ( CLEAR ?auto_25076 ) ( IS-CRATE ?auto_25073 ) ( not ( = ?auto_25076 ?auto_25073 ) ) ( AVAILABLE ?auto_25078 ) ( ON ?auto_25076 ?auto_25075 ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25073 ) ) ( TRUCK-AT ?auto_25081 ?auto_25080 ) ( not ( = ?auto_25080 ?auto_25082 ) ) ( HOIST-AT ?auto_25079 ?auto_25080 ) ( not ( = ?auto_25078 ?auto_25079 ) ) ( AVAILABLE ?auto_25079 ) ( SURFACE-AT ?auto_25073 ?auto_25080 ) ( ON ?auto_25073 ?auto_25077 ) ( CLEAR ?auto_25073 ) ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25073 ?auto_25077 ) ) ( not ( = ?auto_25075 ?auto_25077 ) ) ( ON ?auto_25075 ?auto_25074 ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25073 ) ) ( not ( = ?auto_25074 ?auto_25077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25075 ?auto_25076 ?auto_25073 )
      ( MAKE-3CRATE-VERIFY ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25102 - SURFACE
      ?auto_25103 - SURFACE
      ?auto_25104 - SURFACE
      ?auto_25101 - SURFACE
    )
    :vars
    (
      ?auto_25108 - HOIST
      ?auto_25106 - PLACE
      ?auto_25110 - PLACE
      ?auto_25109 - HOIST
      ?auto_25105 - SURFACE
      ?auto_25107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25108 ?auto_25106 ) ( SURFACE-AT ?auto_25104 ?auto_25106 ) ( CLEAR ?auto_25104 ) ( IS-CRATE ?auto_25101 ) ( not ( = ?auto_25104 ?auto_25101 ) ) ( AVAILABLE ?auto_25108 ) ( ON ?auto_25104 ?auto_25103 ) ( not ( = ?auto_25103 ?auto_25104 ) ) ( not ( = ?auto_25103 ?auto_25101 ) ) ( not ( = ?auto_25110 ?auto_25106 ) ) ( HOIST-AT ?auto_25109 ?auto_25110 ) ( not ( = ?auto_25108 ?auto_25109 ) ) ( AVAILABLE ?auto_25109 ) ( SURFACE-AT ?auto_25101 ?auto_25110 ) ( ON ?auto_25101 ?auto_25105 ) ( CLEAR ?auto_25101 ) ( not ( = ?auto_25104 ?auto_25105 ) ) ( not ( = ?auto_25101 ?auto_25105 ) ) ( not ( = ?auto_25103 ?auto_25105 ) ) ( TRUCK-AT ?auto_25107 ?auto_25106 ) ( ON ?auto_25103 ?auto_25102 ) ( not ( = ?auto_25102 ?auto_25103 ) ) ( not ( = ?auto_25102 ?auto_25104 ) ) ( not ( = ?auto_25102 ?auto_25101 ) ) ( not ( = ?auto_25102 ?auto_25105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25103 ?auto_25104 ?auto_25101 )
      ( MAKE-3CRATE-VERIFY ?auto_25102 ?auto_25103 ?auto_25104 ?auto_25101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25130 - SURFACE
      ?auto_25131 - SURFACE
      ?auto_25132 - SURFACE
      ?auto_25129 - SURFACE
    )
    :vars
    (
      ?auto_25138 - HOIST
      ?auto_25134 - PLACE
      ?auto_25136 - PLACE
      ?auto_25135 - HOIST
      ?auto_25137 - SURFACE
      ?auto_25133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25138 ?auto_25134 ) ( IS-CRATE ?auto_25129 ) ( not ( = ?auto_25132 ?auto_25129 ) ) ( not ( = ?auto_25131 ?auto_25132 ) ) ( not ( = ?auto_25131 ?auto_25129 ) ) ( not ( = ?auto_25136 ?auto_25134 ) ) ( HOIST-AT ?auto_25135 ?auto_25136 ) ( not ( = ?auto_25138 ?auto_25135 ) ) ( AVAILABLE ?auto_25135 ) ( SURFACE-AT ?auto_25129 ?auto_25136 ) ( ON ?auto_25129 ?auto_25137 ) ( CLEAR ?auto_25129 ) ( not ( = ?auto_25132 ?auto_25137 ) ) ( not ( = ?auto_25129 ?auto_25137 ) ) ( not ( = ?auto_25131 ?auto_25137 ) ) ( TRUCK-AT ?auto_25133 ?auto_25134 ) ( SURFACE-AT ?auto_25131 ?auto_25134 ) ( CLEAR ?auto_25131 ) ( LIFTING ?auto_25138 ?auto_25132 ) ( IS-CRATE ?auto_25132 ) ( ON ?auto_25131 ?auto_25130 ) ( not ( = ?auto_25130 ?auto_25131 ) ) ( not ( = ?auto_25130 ?auto_25132 ) ) ( not ( = ?auto_25130 ?auto_25129 ) ) ( not ( = ?auto_25130 ?auto_25137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25131 ?auto_25132 ?auto_25129 )
      ( MAKE-3CRATE-VERIFY ?auto_25130 ?auto_25131 ?auto_25132 ?auto_25129 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25158 - SURFACE
      ?auto_25159 - SURFACE
      ?auto_25160 - SURFACE
      ?auto_25157 - SURFACE
    )
    :vars
    (
      ?auto_25166 - HOIST
      ?auto_25164 - PLACE
      ?auto_25162 - PLACE
      ?auto_25165 - HOIST
      ?auto_25161 - SURFACE
      ?auto_25163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25166 ?auto_25164 ) ( IS-CRATE ?auto_25157 ) ( not ( = ?auto_25160 ?auto_25157 ) ) ( not ( = ?auto_25159 ?auto_25160 ) ) ( not ( = ?auto_25159 ?auto_25157 ) ) ( not ( = ?auto_25162 ?auto_25164 ) ) ( HOIST-AT ?auto_25165 ?auto_25162 ) ( not ( = ?auto_25166 ?auto_25165 ) ) ( AVAILABLE ?auto_25165 ) ( SURFACE-AT ?auto_25157 ?auto_25162 ) ( ON ?auto_25157 ?auto_25161 ) ( CLEAR ?auto_25157 ) ( not ( = ?auto_25160 ?auto_25161 ) ) ( not ( = ?auto_25157 ?auto_25161 ) ) ( not ( = ?auto_25159 ?auto_25161 ) ) ( TRUCK-AT ?auto_25163 ?auto_25164 ) ( SURFACE-AT ?auto_25159 ?auto_25164 ) ( CLEAR ?auto_25159 ) ( IS-CRATE ?auto_25160 ) ( AVAILABLE ?auto_25166 ) ( IN ?auto_25160 ?auto_25163 ) ( ON ?auto_25159 ?auto_25158 ) ( not ( = ?auto_25158 ?auto_25159 ) ) ( not ( = ?auto_25158 ?auto_25160 ) ) ( not ( = ?auto_25158 ?auto_25157 ) ) ( not ( = ?auto_25158 ?auto_25161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25159 ?auto_25160 ?auto_25157 )
      ( MAKE-3CRATE-VERIFY ?auto_25158 ?auto_25159 ?auto_25160 ?auto_25157 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25236 - SURFACE
      ?auto_25237 - SURFACE
    )
    :vars
    (
      ?auto_25239 - HOIST
      ?auto_25244 - PLACE
      ?auto_25240 - SURFACE
      ?auto_25243 - PLACE
      ?auto_25242 - HOIST
      ?auto_25241 - SURFACE
      ?auto_25238 - TRUCK
      ?auto_25245 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25239 ?auto_25244 ) ( SURFACE-AT ?auto_25236 ?auto_25244 ) ( CLEAR ?auto_25236 ) ( IS-CRATE ?auto_25237 ) ( not ( = ?auto_25236 ?auto_25237 ) ) ( AVAILABLE ?auto_25239 ) ( ON ?auto_25236 ?auto_25240 ) ( not ( = ?auto_25240 ?auto_25236 ) ) ( not ( = ?auto_25240 ?auto_25237 ) ) ( not ( = ?auto_25243 ?auto_25244 ) ) ( HOIST-AT ?auto_25242 ?auto_25243 ) ( not ( = ?auto_25239 ?auto_25242 ) ) ( AVAILABLE ?auto_25242 ) ( SURFACE-AT ?auto_25237 ?auto_25243 ) ( ON ?auto_25237 ?auto_25241 ) ( CLEAR ?auto_25237 ) ( not ( = ?auto_25236 ?auto_25241 ) ) ( not ( = ?auto_25237 ?auto_25241 ) ) ( not ( = ?auto_25240 ?auto_25241 ) ) ( TRUCK-AT ?auto_25238 ?auto_25245 ) ( not ( = ?auto_25245 ?auto_25244 ) ) ( not ( = ?auto_25243 ?auto_25245 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25238 ?auto_25245 ?auto_25244 )
      ( MAKE-1CRATE ?auto_25236 ?auto_25237 )
      ( MAKE-1CRATE-VERIFY ?auto_25236 ?auto_25237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25342 - SURFACE
      ?auto_25343 - SURFACE
    )
    :vars
    (
      ?auto_25348 - HOIST
      ?auto_25350 - PLACE
      ?auto_25344 - SURFACE
      ?auto_25349 - PLACE
      ?auto_25346 - HOIST
      ?auto_25347 - SURFACE
      ?auto_25345 - TRUCK
      ?auto_25351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25348 ?auto_25350 ) ( SURFACE-AT ?auto_25342 ?auto_25350 ) ( CLEAR ?auto_25342 ) ( IS-CRATE ?auto_25343 ) ( not ( = ?auto_25342 ?auto_25343 ) ) ( ON ?auto_25342 ?auto_25344 ) ( not ( = ?auto_25344 ?auto_25342 ) ) ( not ( = ?auto_25344 ?auto_25343 ) ) ( not ( = ?auto_25349 ?auto_25350 ) ) ( HOIST-AT ?auto_25346 ?auto_25349 ) ( not ( = ?auto_25348 ?auto_25346 ) ) ( AVAILABLE ?auto_25346 ) ( SURFACE-AT ?auto_25343 ?auto_25349 ) ( ON ?auto_25343 ?auto_25347 ) ( CLEAR ?auto_25343 ) ( not ( = ?auto_25342 ?auto_25347 ) ) ( not ( = ?auto_25343 ?auto_25347 ) ) ( not ( = ?auto_25344 ?auto_25347 ) ) ( TRUCK-AT ?auto_25345 ?auto_25350 ) ( LIFTING ?auto_25348 ?auto_25351 ) ( IS-CRATE ?auto_25351 ) ( not ( = ?auto_25342 ?auto_25351 ) ) ( not ( = ?auto_25343 ?auto_25351 ) ) ( not ( = ?auto_25344 ?auto_25351 ) ) ( not ( = ?auto_25347 ?auto_25351 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25348 ?auto_25351 ?auto_25345 ?auto_25350 )
      ( MAKE-1CRATE ?auto_25342 ?auto_25343 )
      ( MAKE-1CRATE-VERIFY ?auto_25342 ?auto_25343 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25451 - SURFACE
      ?auto_25452 - SURFACE
      ?auto_25453 - SURFACE
      ?auto_25450 - SURFACE
      ?auto_25454 - SURFACE
    )
    :vars
    (
      ?auto_25455 - HOIST
      ?auto_25456 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25455 ?auto_25456 ) ( SURFACE-AT ?auto_25450 ?auto_25456 ) ( CLEAR ?auto_25450 ) ( LIFTING ?auto_25455 ?auto_25454 ) ( IS-CRATE ?auto_25454 ) ( not ( = ?auto_25450 ?auto_25454 ) ) ( ON ?auto_25452 ?auto_25451 ) ( ON ?auto_25453 ?auto_25452 ) ( ON ?auto_25450 ?auto_25453 ) ( not ( = ?auto_25451 ?auto_25452 ) ) ( not ( = ?auto_25451 ?auto_25453 ) ) ( not ( = ?auto_25451 ?auto_25450 ) ) ( not ( = ?auto_25451 ?auto_25454 ) ) ( not ( = ?auto_25452 ?auto_25453 ) ) ( not ( = ?auto_25452 ?auto_25450 ) ) ( not ( = ?auto_25452 ?auto_25454 ) ) ( not ( = ?auto_25453 ?auto_25450 ) ) ( not ( = ?auto_25453 ?auto_25454 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25450 ?auto_25454 )
      ( MAKE-4CRATE-VERIFY ?auto_25451 ?auto_25452 ?auto_25453 ?auto_25450 ?auto_25454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25476 - SURFACE
      ?auto_25477 - SURFACE
      ?auto_25478 - SURFACE
      ?auto_25475 - SURFACE
      ?auto_25479 - SURFACE
    )
    :vars
    (
      ?auto_25482 - HOIST
      ?auto_25481 - PLACE
      ?auto_25480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25482 ?auto_25481 ) ( SURFACE-AT ?auto_25475 ?auto_25481 ) ( CLEAR ?auto_25475 ) ( IS-CRATE ?auto_25479 ) ( not ( = ?auto_25475 ?auto_25479 ) ) ( TRUCK-AT ?auto_25480 ?auto_25481 ) ( AVAILABLE ?auto_25482 ) ( IN ?auto_25479 ?auto_25480 ) ( ON ?auto_25475 ?auto_25478 ) ( not ( = ?auto_25478 ?auto_25475 ) ) ( not ( = ?auto_25478 ?auto_25479 ) ) ( ON ?auto_25477 ?auto_25476 ) ( ON ?auto_25478 ?auto_25477 ) ( not ( = ?auto_25476 ?auto_25477 ) ) ( not ( = ?auto_25476 ?auto_25478 ) ) ( not ( = ?auto_25476 ?auto_25475 ) ) ( not ( = ?auto_25476 ?auto_25479 ) ) ( not ( = ?auto_25477 ?auto_25478 ) ) ( not ( = ?auto_25477 ?auto_25475 ) ) ( not ( = ?auto_25477 ?auto_25479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25478 ?auto_25475 ?auto_25479 )
      ( MAKE-4CRATE-VERIFY ?auto_25476 ?auto_25477 ?auto_25478 ?auto_25475 ?auto_25479 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25506 - SURFACE
      ?auto_25507 - SURFACE
      ?auto_25508 - SURFACE
      ?auto_25505 - SURFACE
      ?auto_25509 - SURFACE
    )
    :vars
    (
      ?auto_25512 - HOIST
      ?auto_25513 - PLACE
      ?auto_25511 - TRUCK
      ?auto_25510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25512 ?auto_25513 ) ( SURFACE-AT ?auto_25505 ?auto_25513 ) ( CLEAR ?auto_25505 ) ( IS-CRATE ?auto_25509 ) ( not ( = ?auto_25505 ?auto_25509 ) ) ( AVAILABLE ?auto_25512 ) ( IN ?auto_25509 ?auto_25511 ) ( ON ?auto_25505 ?auto_25508 ) ( not ( = ?auto_25508 ?auto_25505 ) ) ( not ( = ?auto_25508 ?auto_25509 ) ) ( TRUCK-AT ?auto_25511 ?auto_25510 ) ( not ( = ?auto_25510 ?auto_25513 ) ) ( ON ?auto_25507 ?auto_25506 ) ( ON ?auto_25508 ?auto_25507 ) ( not ( = ?auto_25506 ?auto_25507 ) ) ( not ( = ?auto_25506 ?auto_25508 ) ) ( not ( = ?auto_25506 ?auto_25505 ) ) ( not ( = ?auto_25506 ?auto_25509 ) ) ( not ( = ?auto_25507 ?auto_25508 ) ) ( not ( = ?auto_25507 ?auto_25505 ) ) ( not ( = ?auto_25507 ?auto_25509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25508 ?auto_25505 ?auto_25509 )
      ( MAKE-4CRATE-VERIFY ?auto_25506 ?auto_25507 ?auto_25508 ?auto_25505 ?auto_25509 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25540 - SURFACE
      ?auto_25541 - SURFACE
      ?auto_25542 - SURFACE
      ?auto_25539 - SURFACE
      ?auto_25543 - SURFACE
    )
    :vars
    (
      ?auto_25546 - HOIST
      ?auto_25544 - PLACE
      ?auto_25548 - TRUCK
      ?auto_25547 - PLACE
      ?auto_25545 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25546 ?auto_25544 ) ( SURFACE-AT ?auto_25539 ?auto_25544 ) ( CLEAR ?auto_25539 ) ( IS-CRATE ?auto_25543 ) ( not ( = ?auto_25539 ?auto_25543 ) ) ( AVAILABLE ?auto_25546 ) ( ON ?auto_25539 ?auto_25542 ) ( not ( = ?auto_25542 ?auto_25539 ) ) ( not ( = ?auto_25542 ?auto_25543 ) ) ( TRUCK-AT ?auto_25548 ?auto_25547 ) ( not ( = ?auto_25547 ?auto_25544 ) ) ( HOIST-AT ?auto_25545 ?auto_25547 ) ( LIFTING ?auto_25545 ?auto_25543 ) ( not ( = ?auto_25546 ?auto_25545 ) ) ( ON ?auto_25541 ?auto_25540 ) ( ON ?auto_25542 ?auto_25541 ) ( not ( = ?auto_25540 ?auto_25541 ) ) ( not ( = ?auto_25540 ?auto_25542 ) ) ( not ( = ?auto_25540 ?auto_25539 ) ) ( not ( = ?auto_25540 ?auto_25543 ) ) ( not ( = ?auto_25541 ?auto_25542 ) ) ( not ( = ?auto_25541 ?auto_25539 ) ) ( not ( = ?auto_25541 ?auto_25543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25542 ?auto_25539 ?auto_25543 )
      ( MAKE-4CRATE-VERIFY ?auto_25540 ?auto_25541 ?auto_25542 ?auto_25539 ?auto_25543 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25578 - SURFACE
      ?auto_25579 - SURFACE
      ?auto_25580 - SURFACE
      ?auto_25577 - SURFACE
      ?auto_25581 - SURFACE
    )
    :vars
    (
      ?auto_25583 - HOIST
      ?auto_25582 - PLACE
      ?auto_25586 - TRUCK
      ?auto_25584 - PLACE
      ?auto_25585 - HOIST
      ?auto_25587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25583 ?auto_25582 ) ( SURFACE-AT ?auto_25577 ?auto_25582 ) ( CLEAR ?auto_25577 ) ( IS-CRATE ?auto_25581 ) ( not ( = ?auto_25577 ?auto_25581 ) ) ( AVAILABLE ?auto_25583 ) ( ON ?auto_25577 ?auto_25580 ) ( not ( = ?auto_25580 ?auto_25577 ) ) ( not ( = ?auto_25580 ?auto_25581 ) ) ( TRUCK-AT ?auto_25586 ?auto_25584 ) ( not ( = ?auto_25584 ?auto_25582 ) ) ( HOIST-AT ?auto_25585 ?auto_25584 ) ( not ( = ?auto_25583 ?auto_25585 ) ) ( AVAILABLE ?auto_25585 ) ( SURFACE-AT ?auto_25581 ?auto_25584 ) ( ON ?auto_25581 ?auto_25587 ) ( CLEAR ?auto_25581 ) ( not ( = ?auto_25577 ?auto_25587 ) ) ( not ( = ?auto_25581 ?auto_25587 ) ) ( not ( = ?auto_25580 ?auto_25587 ) ) ( ON ?auto_25579 ?auto_25578 ) ( ON ?auto_25580 ?auto_25579 ) ( not ( = ?auto_25578 ?auto_25579 ) ) ( not ( = ?auto_25578 ?auto_25580 ) ) ( not ( = ?auto_25578 ?auto_25577 ) ) ( not ( = ?auto_25578 ?auto_25581 ) ) ( not ( = ?auto_25578 ?auto_25587 ) ) ( not ( = ?auto_25579 ?auto_25580 ) ) ( not ( = ?auto_25579 ?auto_25577 ) ) ( not ( = ?auto_25579 ?auto_25581 ) ) ( not ( = ?auto_25579 ?auto_25587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25580 ?auto_25577 ?auto_25581 )
      ( MAKE-4CRATE-VERIFY ?auto_25578 ?auto_25579 ?auto_25580 ?auto_25577 ?auto_25581 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25617 - SURFACE
      ?auto_25618 - SURFACE
      ?auto_25619 - SURFACE
      ?auto_25616 - SURFACE
      ?auto_25620 - SURFACE
    )
    :vars
    (
      ?auto_25622 - HOIST
      ?auto_25623 - PLACE
      ?auto_25625 - PLACE
      ?auto_25626 - HOIST
      ?auto_25621 - SURFACE
      ?auto_25624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25622 ?auto_25623 ) ( SURFACE-AT ?auto_25616 ?auto_25623 ) ( CLEAR ?auto_25616 ) ( IS-CRATE ?auto_25620 ) ( not ( = ?auto_25616 ?auto_25620 ) ) ( AVAILABLE ?auto_25622 ) ( ON ?auto_25616 ?auto_25619 ) ( not ( = ?auto_25619 ?auto_25616 ) ) ( not ( = ?auto_25619 ?auto_25620 ) ) ( not ( = ?auto_25625 ?auto_25623 ) ) ( HOIST-AT ?auto_25626 ?auto_25625 ) ( not ( = ?auto_25622 ?auto_25626 ) ) ( AVAILABLE ?auto_25626 ) ( SURFACE-AT ?auto_25620 ?auto_25625 ) ( ON ?auto_25620 ?auto_25621 ) ( CLEAR ?auto_25620 ) ( not ( = ?auto_25616 ?auto_25621 ) ) ( not ( = ?auto_25620 ?auto_25621 ) ) ( not ( = ?auto_25619 ?auto_25621 ) ) ( TRUCK-AT ?auto_25624 ?auto_25623 ) ( ON ?auto_25618 ?auto_25617 ) ( ON ?auto_25619 ?auto_25618 ) ( not ( = ?auto_25617 ?auto_25618 ) ) ( not ( = ?auto_25617 ?auto_25619 ) ) ( not ( = ?auto_25617 ?auto_25616 ) ) ( not ( = ?auto_25617 ?auto_25620 ) ) ( not ( = ?auto_25617 ?auto_25621 ) ) ( not ( = ?auto_25618 ?auto_25619 ) ) ( not ( = ?auto_25618 ?auto_25616 ) ) ( not ( = ?auto_25618 ?auto_25620 ) ) ( not ( = ?auto_25618 ?auto_25621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25619 ?auto_25616 ?auto_25620 )
      ( MAKE-4CRATE-VERIFY ?auto_25617 ?auto_25618 ?auto_25619 ?auto_25616 ?auto_25620 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25656 - SURFACE
      ?auto_25657 - SURFACE
      ?auto_25658 - SURFACE
      ?auto_25655 - SURFACE
      ?auto_25659 - SURFACE
    )
    :vars
    (
      ?auto_25664 - HOIST
      ?auto_25660 - PLACE
      ?auto_25662 - PLACE
      ?auto_25663 - HOIST
      ?auto_25661 - SURFACE
      ?auto_25665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25664 ?auto_25660 ) ( IS-CRATE ?auto_25659 ) ( not ( = ?auto_25655 ?auto_25659 ) ) ( not ( = ?auto_25658 ?auto_25655 ) ) ( not ( = ?auto_25658 ?auto_25659 ) ) ( not ( = ?auto_25662 ?auto_25660 ) ) ( HOIST-AT ?auto_25663 ?auto_25662 ) ( not ( = ?auto_25664 ?auto_25663 ) ) ( AVAILABLE ?auto_25663 ) ( SURFACE-AT ?auto_25659 ?auto_25662 ) ( ON ?auto_25659 ?auto_25661 ) ( CLEAR ?auto_25659 ) ( not ( = ?auto_25655 ?auto_25661 ) ) ( not ( = ?auto_25659 ?auto_25661 ) ) ( not ( = ?auto_25658 ?auto_25661 ) ) ( TRUCK-AT ?auto_25665 ?auto_25660 ) ( SURFACE-AT ?auto_25658 ?auto_25660 ) ( CLEAR ?auto_25658 ) ( LIFTING ?auto_25664 ?auto_25655 ) ( IS-CRATE ?auto_25655 ) ( ON ?auto_25657 ?auto_25656 ) ( ON ?auto_25658 ?auto_25657 ) ( not ( = ?auto_25656 ?auto_25657 ) ) ( not ( = ?auto_25656 ?auto_25658 ) ) ( not ( = ?auto_25656 ?auto_25655 ) ) ( not ( = ?auto_25656 ?auto_25659 ) ) ( not ( = ?auto_25656 ?auto_25661 ) ) ( not ( = ?auto_25657 ?auto_25658 ) ) ( not ( = ?auto_25657 ?auto_25655 ) ) ( not ( = ?auto_25657 ?auto_25659 ) ) ( not ( = ?auto_25657 ?auto_25661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25658 ?auto_25655 ?auto_25659 )
      ( MAKE-4CRATE-VERIFY ?auto_25656 ?auto_25657 ?auto_25658 ?auto_25655 ?auto_25659 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25695 - SURFACE
      ?auto_25696 - SURFACE
      ?auto_25697 - SURFACE
      ?auto_25694 - SURFACE
      ?auto_25698 - SURFACE
    )
    :vars
    (
      ?auto_25702 - HOIST
      ?auto_25701 - PLACE
      ?auto_25704 - PLACE
      ?auto_25703 - HOIST
      ?auto_25700 - SURFACE
      ?auto_25699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25702 ?auto_25701 ) ( IS-CRATE ?auto_25698 ) ( not ( = ?auto_25694 ?auto_25698 ) ) ( not ( = ?auto_25697 ?auto_25694 ) ) ( not ( = ?auto_25697 ?auto_25698 ) ) ( not ( = ?auto_25704 ?auto_25701 ) ) ( HOIST-AT ?auto_25703 ?auto_25704 ) ( not ( = ?auto_25702 ?auto_25703 ) ) ( AVAILABLE ?auto_25703 ) ( SURFACE-AT ?auto_25698 ?auto_25704 ) ( ON ?auto_25698 ?auto_25700 ) ( CLEAR ?auto_25698 ) ( not ( = ?auto_25694 ?auto_25700 ) ) ( not ( = ?auto_25698 ?auto_25700 ) ) ( not ( = ?auto_25697 ?auto_25700 ) ) ( TRUCK-AT ?auto_25699 ?auto_25701 ) ( SURFACE-AT ?auto_25697 ?auto_25701 ) ( CLEAR ?auto_25697 ) ( IS-CRATE ?auto_25694 ) ( AVAILABLE ?auto_25702 ) ( IN ?auto_25694 ?auto_25699 ) ( ON ?auto_25696 ?auto_25695 ) ( ON ?auto_25697 ?auto_25696 ) ( not ( = ?auto_25695 ?auto_25696 ) ) ( not ( = ?auto_25695 ?auto_25697 ) ) ( not ( = ?auto_25695 ?auto_25694 ) ) ( not ( = ?auto_25695 ?auto_25698 ) ) ( not ( = ?auto_25695 ?auto_25700 ) ) ( not ( = ?auto_25696 ?auto_25697 ) ) ( not ( = ?auto_25696 ?auto_25694 ) ) ( not ( = ?auto_25696 ?auto_25698 ) ) ( not ( = ?auto_25696 ?auto_25700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25697 ?auto_25694 ?auto_25698 )
      ( MAKE-4CRATE-VERIFY ?auto_25695 ?auto_25696 ?auto_25697 ?auto_25694 ?auto_25698 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26355 - SURFACE
      ?auto_26356 - SURFACE
      ?auto_26357 - SURFACE
      ?auto_26354 - SURFACE
      ?auto_26358 - SURFACE
      ?auto_26359 - SURFACE
    )
    :vars
    (
      ?auto_26361 - HOIST
      ?auto_26360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26361 ?auto_26360 ) ( SURFACE-AT ?auto_26358 ?auto_26360 ) ( CLEAR ?auto_26358 ) ( LIFTING ?auto_26361 ?auto_26359 ) ( IS-CRATE ?auto_26359 ) ( not ( = ?auto_26358 ?auto_26359 ) ) ( ON ?auto_26356 ?auto_26355 ) ( ON ?auto_26357 ?auto_26356 ) ( ON ?auto_26354 ?auto_26357 ) ( ON ?auto_26358 ?auto_26354 ) ( not ( = ?auto_26355 ?auto_26356 ) ) ( not ( = ?auto_26355 ?auto_26357 ) ) ( not ( = ?auto_26355 ?auto_26354 ) ) ( not ( = ?auto_26355 ?auto_26358 ) ) ( not ( = ?auto_26355 ?auto_26359 ) ) ( not ( = ?auto_26356 ?auto_26357 ) ) ( not ( = ?auto_26356 ?auto_26354 ) ) ( not ( = ?auto_26356 ?auto_26358 ) ) ( not ( = ?auto_26356 ?auto_26359 ) ) ( not ( = ?auto_26357 ?auto_26354 ) ) ( not ( = ?auto_26357 ?auto_26358 ) ) ( not ( = ?auto_26357 ?auto_26359 ) ) ( not ( = ?auto_26354 ?auto_26358 ) ) ( not ( = ?auto_26354 ?auto_26359 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26358 ?auto_26359 )
      ( MAKE-5CRATE-VERIFY ?auto_26355 ?auto_26356 ?auto_26357 ?auto_26354 ?auto_26358 ?auto_26359 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26389 - SURFACE
      ?auto_26390 - SURFACE
      ?auto_26391 - SURFACE
      ?auto_26388 - SURFACE
      ?auto_26392 - SURFACE
      ?auto_26393 - SURFACE
    )
    :vars
    (
      ?auto_26395 - HOIST
      ?auto_26396 - PLACE
      ?auto_26394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26395 ?auto_26396 ) ( SURFACE-AT ?auto_26392 ?auto_26396 ) ( CLEAR ?auto_26392 ) ( IS-CRATE ?auto_26393 ) ( not ( = ?auto_26392 ?auto_26393 ) ) ( TRUCK-AT ?auto_26394 ?auto_26396 ) ( AVAILABLE ?auto_26395 ) ( IN ?auto_26393 ?auto_26394 ) ( ON ?auto_26392 ?auto_26388 ) ( not ( = ?auto_26388 ?auto_26392 ) ) ( not ( = ?auto_26388 ?auto_26393 ) ) ( ON ?auto_26390 ?auto_26389 ) ( ON ?auto_26391 ?auto_26390 ) ( ON ?auto_26388 ?auto_26391 ) ( not ( = ?auto_26389 ?auto_26390 ) ) ( not ( = ?auto_26389 ?auto_26391 ) ) ( not ( = ?auto_26389 ?auto_26388 ) ) ( not ( = ?auto_26389 ?auto_26392 ) ) ( not ( = ?auto_26389 ?auto_26393 ) ) ( not ( = ?auto_26390 ?auto_26391 ) ) ( not ( = ?auto_26390 ?auto_26388 ) ) ( not ( = ?auto_26390 ?auto_26392 ) ) ( not ( = ?auto_26390 ?auto_26393 ) ) ( not ( = ?auto_26391 ?auto_26388 ) ) ( not ( = ?auto_26391 ?auto_26392 ) ) ( not ( = ?auto_26391 ?auto_26393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26388 ?auto_26392 ?auto_26393 )
      ( MAKE-5CRATE-VERIFY ?auto_26389 ?auto_26390 ?auto_26391 ?auto_26388 ?auto_26392 ?auto_26393 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26429 - SURFACE
      ?auto_26430 - SURFACE
      ?auto_26431 - SURFACE
      ?auto_26428 - SURFACE
      ?auto_26432 - SURFACE
      ?auto_26433 - SURFACE
    )
    :vars
    (
      ?auto_26437 - HOIST
      ?auto_26436 - PLACE
      ?auto_26435 - TRUCK
      ?auto_26434 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26437 ?auto_26436 ) ( SURFACE-AT ?auto_26432 ?auto_26436 ) ( CLEAR ?auto_26432 ) ( IS-CRATE ?auto_26433 ) ( not ( = ?auto_26432 ?auto_26433 ) ) ( AVAILABLE ?auto_26437 ) ( IN ?auto_26433 ?auto_26435 ) ( ON ?auto_26432 ?auto_26428 ) ( not ( = ?auto_26428 ?auto_26432 ) ) ( not ( = ?auto_26428 ?auto_26433 ) ) ( TRUCK-AT ?auto_26435 ?auto_26434 ) ( not ( = ?auto_26434 ?auto_26436 ) ) ( ON ?auto_26430 ?auto_26429 ) ( ON ?auto_26431 ?auto_26430 ) ( ON ?auto_26428 ?auto_26431 ) ( not ( = ?auto_26429 ?auto_26430 ) ) ( not ( = ?auto_26429 ?auto_26431 ) ) ( not ( = ?auto_26429 ?auto_26428 ) ) ( not ( = ?auto_26429 ?auto_26432 ) ) ( not ( = ?auto_26429 ?auto_26433 ) ) ( not ( = ?auto_26430 ?auto_26431 ) ) ( not ( = ?auto_26430 ?auto_26428 ) ) ( not ( = ?auto_26430 ?auto_26432 ) ) ( not ( = ?auto_26430 ?auto_26433 ) ) ( not ( = ?auto_26431 ?auto_26428 ) ) ( not ( = ?auto_26431 ?auto_26432 ) ) ( not ( = ?auto_26431 ?auto_26433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26428 ?auto_26432 ?auto_26433 )
      ( MAKE-5CRATE-VERIFY ?auto_26429 ?auto_26430 ?auto_26431 ?auto_26428 ?auto_26432 ?auto_26433 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26474 - SURFACE
      ?auto_26475 - SURFACE
      ?auto_26476 - SURFACE
      ?auto_26473 - SURFACE
      ?auto_26477 - SURFACE
      ?auto_26478 - SURFACE
    )
    :vars
    (
      ?auto_26479 - HOIST
      ?auto_26483 - PLACE
      ?auto_26481 - TRUCK
      ?auto_26482 - PLACE
      ?auto_26480 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26479 ?auto_26483 ) ( SURFACE-AT ?auto_26477 ?auto_26483 ) ( CLEAR ?auto_26477 ) ( IS-CRATE ?auto_26478 ) ( not ( = ?auto_26477 ?auto_26478 ) ) ( AVAILABLE ?auto_26479 ) ( ON ?auto_26477 ?auto_26473 ) ( not ( = ?auto_26473 ?auto_26477 ) ) ( not ( = ?auto_26473 ?auto_26478 ) ) ( TRUCK-AT ?auto_26481 ?auto_26482 ) ( not ( = ?auto_26482 ?auto_26483 ) ) ( HOIST-AT ?auto_26480 ?auto_26482 ) ( LIFTING ?auto_26480 ?auto_26478 ) ( not ( = ?auto_26479 ?auto_26480 ) ) ( ON ?auto_26475 ?auto_26474 ) ( ON ?auto_26476 ?auto_26475 ) ( ON ?auto_26473 ?auto_26476 ) ( not ( = ?auto_26474 ?auto_26475 ) ) ( not ( = ?auto_26474 ?auto_26476 ) ) ( not ( = ?auto_26474 ?auto_26473 ) ) ( not ( = ?auto_26474 ?auto_26477 ) ) ( not ( = ?auto_26474 ?auto_26478 ) ) ( not ( = ?auto_26475 ?auto_26476 ) ) ( not ( = ?auto_26475 ?auto_26473 ) ) ( not ( = ?auto_26475 ?auto_26477 ) ) ( not ( = ?auto_26475 ?auto_26478 ) ) ( not ( = ?auto_26476 ?auto_26473 ) ) ( not ( = ?auto_26476 ?auto_26477 ) ) ( not ( = ?auto_26476 ?auto_26478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26473 ?auto_26477 ?auto_26478 )
      ( MAKE-5CRATE-VERIFY ?auto_26474 ?auto_26475 ?auto_26476 ?auto_26473 ?auto_26477 ?auto_26478 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26524 - SURFACE
      ?auto_26525 - SURFACE
      ?auto_26526 - SURFACE
      ?auto_26523 - SURFACE
      ?auto_26527 - SURFACE
      ?auto_26528 - SURFACE
    )
    :vars
    (
      ?auto_26529 - HOIST
      ?auto_26533 - PLACE
      ?auto_26531 - TRUCK
      ?auto_26534 - PLACE
      ?auto_26530 - HOIST
      ?auto_26532 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26529 ?auto_26533 ) ( SURFACE-AT ?auto_26527 ?auto_26533 ) ( CLEAR ?auto_26527 ) ( IS-CRATE ?auto_26528 ) ( not ( = ?auto_26527 ?auto_26528 ) ) ( AVAILABLE ?auto_26529 ) ( ON ?auto_26527 ?auto_26523 ) ( not ( = ?auto_26523 ?auto_26527 ) ) ( not ( = ?auto_26523 ?auto_26528 ) ) ( TRUCK-AT ?auto_26531 ?auto_26534 ) ( not ( = ?auto_26534 ?auto_26533 ) ) ( HOIST-AT ?auto_26530 ?auto_26534 ) ( not ( = ?auto_26529 ?auto_26530 ) ) ( AVAILABLE ?auto_26530 ) ( SURFACE-AT ?auto_26528 ?auto_26534 ) ( ON ?auto_26528 ?auto_26532 ) ( CLEAR ?auto_26528 ) ( not ( = ?auto_26527 ?auto_26532 ) ) ( not ( = ?auto_26528 ?auto_26532 ) ) ( not ( = ?auto_26523 ?auto_26532 ) ) ( ON ?auto_26525 ?auto_26524 ) ( ON ?auto_26526 ?auto_26525 ) ( ON ?auto_26523 ?auto_26526 ) ( not ( = ?auto_26524 ?auto_26525 ) ) ( not ( = ?auto_26524 ?auto_26526 ) ) ( not ( = ?auto_26524 ?auto_26523 ) ) ( not ( = ?auto_26524 ?auto_26527 ) ) ( not ( = ?auto_26524 ?auto_26528 ) ) ( not ( = ?auto_26524 ?auto_26532 ) ) ( not ( = ?auto_26525 ?auto_26526 ) ) ( not ( = ?auto_26525 ?auto_26523 ) ) ( not ( = ?auto_26525 ?auto_26527 ) ) ( not ( = ?auto_26525 ?auto_26528 ) ) ( not ( = ?auto_26525 ?auto_26532 ) ) ( not ( = ?auto_26526 ?auto_26523 ) ) ( not ( = ?auto_26526 ?auto_26527 ) ) ( not ( = ?auto_26526 ?auto_26528 ) ) ( not ( = ?auto_26526 ?auto_26532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26523 ?auto_26527 ?auto_26528 )
      ( MAKE-5CRATE-VERIFY ?auto_26524 ?auto_26525 ?auto_26526 ?auto_26523 ?auto_26527 ?auto_26528 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26575 - SURFACE
      ?auto_26576 - SURFACE
      ?auto_26577 - SURFACE
      ?auto_26574 - SURFACE
      ?auto_26578 - SURFACE
      ?auto_26579 - SURFACE
    )
    :vars
    (
      ?auto_26582 - HOIST
      ?auto_26583 - PLACE
      ?auto_26580 - PLACE
      ?auto_26584 - HOIST
      ?auto_26581 - SURFACE
      ?auto_26585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26582 ?auto_26583 ) ( SURFACE-AT ?auto_26578 ?auto_26583 ) ( CLEAR ?auto_26578 ) ( IS-CRATE ?auto_26579 ) ( not ( = ?auto_26578 ?auto_26579 ) ) ( AVAILABLE ?auto_26582 ) ( ON ?auto_26578 ?auto_26574 ) ( not ( = ?auto_26574 ?auto_26578 ) ) ( not ( = ?auto_26574 ?auto_26579 ) ) ( not ( = ?auto_26580 ?auto_26583 ) ) ( HOIST-AT ?auto_26584 ?auto_26580 ) ( not ( = ?auto_26582 ?auto_26584 ) ) ( AVAILABLE ?auto_26584 ) ( SURFACE-AT ?auto_26579 ?auto_26580 ) ( ON ?auto_26579 ?auto_26581 ) ( CLEAR ?auto_26579 ) ( not ( = ?auto_26578 ?auto_26581 ) ) ( not ( = ?auto_26579 ?auto_26581 ) ) ( not ( = ?auto_26574 ?auto_26581 ) ) ( TRUCK-AT ?auto_26585 ?auto_26583 ) ( ON ?auto_26576 ?auto_26575 ) ( ON ?auto_26577 ?auto_26576 ) ( ON ?auto_26574 ?auto_26577 ) ( not ( = ?auto_26575 ?auto_26576 ) ) ( not ( = ?auto_26575 ?auto_26577 ) ) ( not ( = ?auto_26575 ?auto_26574 ) ) ( not ( = ?auto_26575 ?auto_26578 ) ) ( not ( = ?auto_26575 ?auto_26579 ) ) ( not ( = ?auto_26575 ?auto_26581 ) ) ( not ( = ?auto_26576 ?auto_26577 ) ) ( not ( = ?auto_26576 ?auto_26574 ) ) ( not ( = ?auto_26576 ?auto_26578 ) ) ( not ( = ?auto_26576 ?auto_26579 ) ) ( not ( = ?auto_26576 ?auto_26581 ) ) ( not ( = ?auto_26577 ?auto_26574 ) ) ( not ( = ?auto_26577 ?auto_26578 ) ) ( not ( = ?auto_26577 ?auto_26579 ) ) ( not ( = ?auto_26577 ?auto_26581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26574 ?auto_26578 ?auto_26579 )
      ( MAKE-5CRATE-VERIFY ?auto_26575 ?auto_26576 ?auto_26577 ?auto_26574 ?auto_26578 ?auto_26579 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26626 - SURFACE
      ?auto_26627 - SURFACE
      ?auto_26628 - SURFACE
      ?auto_26625 - SURFACE
      ?auto_26629 - SURFACE
      ?auto_26630 - SURFACE
    )
    :vars
    (
      ?auto_26632 - HOIST
      ?auto_26634 - PLACE
      ?auto_26636 - PLACE
      ?auto_26635 - HOIST
      ?auto_26631 - SURFACE
      ?auto_26633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26632 ?auto_26634 ) ( IS-CRATE ?auto_26630 ) ( not ( = ?auto_26629 ?auto_26630 ) ) ( not ( = ?auto_26625 ?auto_26629 ) ) ( not ( = ?auto_26625 ?auto_26630 ) ) ( not ( = ?auto_26636 ?auto_26634 ) ) ( HOIST-AT ?auto_26635 ?auto_26636 ) ( not ( = ?auto_26632 ?auto_26635 ) ) ( AVAILABLE ?auto_26635 ) ( SURFACE-AT ?auto_26630 ?auto_26636 ) ( ON ?auto_26630 ?auto_26631 ) ( CLEAR ?auto_26630 ) ( not ( = ?auto_26629 ?auto_26631 ) ) ( not ( = ?auto_26630 ?auto_26631 ) ) ( not ( = ?auto_26625 ?auto_26631 ) ) ( TRUCK-AT ?auto_26633 ?auto_26634 ) ( SURFACE-AT ?auto_26625 ?auto_26634 ) ( CLEAR ?auto_26625 ) ( LIFTING ?auto_26632 ?auto_26629 ) ( IS-CRATE ?auto_26629 ) ( ON ?auto_26627 ?auto_26626 ) ( ON ?auto_26628 ?auto_26627 ) ( ON ?auto_26625 ?auto_26628 ) ( not ( = ?auto_26626 ?auto_26627 ) ) ( not ( = ?auto_26626 ?auto_26628 ) ) ( not ( = ?auto_26626 ?auto_26625 ) ) ( not ( = ?auto_26626 ?auto_26629 ) ) ( not ( = ?auto_26626 ?auto_26630 ) ) ( not ( = ?auto_26626 ?auto_26631 ) ) ( not ( = ?auto_26627 ?auto_26628 ) ) ( not ( = ?auto_26627 ?auto_26625 ) ) ( not ( = ?auto_26627 ?auto_26629 ) ) ( not ( = ?auto_26627 ?auto_26630 ) ) ( not ( = ?auto_26627 ?auto_26631 ) ) ( not ( = ?auto_26628 ?auto_26625 ) ) ( not ( = ?auto_26628 ?auto_26629 ) ) ( not ( = ?auto_26628 ?auto_26630 ) ) ( not ( = ?auto_26628 ?auto_26631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26625 ?auto_26629 ?auto_26630 )
      ( MAKE-5CRATE-VERIFY ?auto_26626 ?auto_26627 ?auto_26628 ?auto_26625 ?auto_26629 ?auto_26630 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26677 - SURFACE
      ?auto_26678 - SURFACE
      ?auto_26679 - SURFACE
      ?auto_26676 - SURFACE
      ?auto_26680 - SURFACE
      ?auto_26681 - SURFACE
    )
    :vars
    (
      ?auto_26685 - HOIST
      ?auto_26683 - PLACE
      ?auto_26682 - PLACE
      ?auto_26687 - HOIST
      ?auto_26684 - SURFACE
      ?auto_26686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26685 ?auto_26683 ) ( IS-CRATE ?auto_26681 ) ( not ( = ?auto_26680 ?auto_26681 ) ) ( not ( = ?auto_26676 ?auto_26680 ) ) ( not ( = ?auto_26676 ?auto_26681 ) ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( HOIST-AT ?auto_26687 ?auto_26682 ) ( not ( = ?auto_26685 ?auto_26687 ) ) ( AVAILABLE ?auto_26687 ) ( SURFACE-AT ?auto_26681 ?auto_26682 ) ( ON ?auto_26681 ?auto_26684 ) ( CLEAR ?auto_26681 ) ( not ( = ?auto_26680 ?auto_26684 ) ) ( not ( = ?auto_26681 ?auto_26684 ) ) ( not ( = ?auto_26676 ?auto_26684 ) ) ( TRUCK-AT ?auto_26686 ?auto_26683 ) ( SURFACE-AT ?auto_26676 ?auto_26683 ) ( CLEAR ?auto_26676 ) ( IS-CRATE ?auto_26680 ) ( AVAILABLE ?auto_26685 ) ( IN ?auto_26680 ?auto_26686 ) ( ON ?auto_26678 ?auto_26677 ) ( ON ?auto_26679 ?auto_26678 ) ( ON ?auto_26676 ?auto_26679 ) ( not ( = ?auto_26677 ?auto_26678 ) ) ( not ( = ?auto_26677 ?auto_26679 ) ) ( not ( = ?auto_26677 ?auto_26676 ) ) ( not ( = ?auto_26677 ?auto_26680 ) ) ( not ( = ?auto_26677 ?auto_26681 ) ) ( not ( = ?auto_26677 ?auto_26684 ) ) ( not ( = ?auto_26678 ?auto_26679 ) ) ( not ( = ?auto_26678 ?auto_26676 ) ) ( not ( = ?auto_26678 ?auto_26680 ) ) ( not ( = ?auto_26678 ?auto_26681 ) ) ( not ( = ?auto_26678 ?auto_26684 ) ) ( not ( = ?auto_26679 ?auto_26676 ) ) ( not ( = ?auto_26679 ?auto_26680 ) ) ( not ( = ?auto_26679 ?auto_26681 ) ) ( not ( = ?auto_26679 ?auto_26684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26676 ?auto_26680 ?auto_26681 )
      ( MAKE-5CRATE-VERIFY ?auto_26677 ?auto_26678 ?auto_26679 ?auto_26676 ?auto_26680 ?auto_26681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26707 - SURFACE
      ?auto_26708 - SURFACE
      ?auto_26709 - SURFACE
      ?auto_26706 - SURFACE
    )
    :vars
    (
      ?auto_26713 - HOIST
      ?auto_26714 - PLACE
      ?auto_26712 - PLACE
      ?auto_26710 - HOIST
      ?auto_26711 - SURFACE
      ?auto_26715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26713 ?auto_26714 ) ( IS-CRATE ?auto_26706 ) ( not ( = ?auto_26709 ?auto_26706 ) ) ( not ( = ?auto_26708 ?auto_26709 ) ) ( not ( = ?auto_26708 ?auto_26706 ) ) ( not ( = ?auto_26712 ?auto_26714 ) ) ( HOIST-AT ?auto_26710 ?auto_26712 ) ( not ( = ?auto_26713 ?auto_26710 ) ) ( AVAILABLE ?auto_26710 ) ( SURFACE-AT ?auto_26706 ?auto_26712 ) ( ON ?auto_26706 ?auto_26711 ) ( CLEAR ?auto_26706 ) ( not ( = ?auto_26709 ?auto_26711 ) ) ( not ( = ?auto_26706 ?auto_26711 ) ) ( not ( = ?auto_26708 ?auto_26711 ) ) ( SURFACE-AT ?auto_26708 ?auto_26714 ) ( CLEAR ?auto_26708 ) ( IS-CRATE ?auto_26709 ) ( AVAILABLE ?auto_26713 ) ( IN ?auto_26709 ?auto_26715 ) ( TRUCK-AT ?auto_26715 ?auto_26712 ) ( ON ?auto_26708 ?auto_26707 ) ( not ( = ?auto_26707 ?auto_26708 ) ) ( not ( = ?auto_26707 ?auto_26709 ) ) ( not ( = ?auto_26707 ?auto_26706 ) ) ( not ( = ?auto_26707 ?auto_26711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26708 ?auto_26709 ?auto_26706 )
      ( MAKE-3CRATE-VERIFY ?auto_26707 ?auto_26708 ?auto_26709 ?auto_26706 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26717 - SURFACE
      ?auto_26718 - SURFACE
      ?auto_26719 - SURFACE
      ?auto_26716 - SURFACE
      ?auto_26720 - SURFACE
    )
    :vars
    (
      ?auto_26724 - HOIST
      ?auto_26725 - PLACE
      ?auto_26723 - PLACE
      ?auto_26721 - HOIST
      ?auto_26722 - SURFACE
      ?auto_26726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26724 ?auto_26725 ) ( IS-CRATE ?auto_26720 ) ( not ( = ?auto_26716 ?auto_26720 ) ) ( not ( = ?auto_26719 ?auto_26716 ) ) ( not ( = ?auto_26719 ?auto_26720 ) ) ( not ( = ?auto_26723 ?auto_26725 ) ) ( HOIST-AT ?auto_26721 ?auto_26723 ) ( not ( = ?auto_26724 ?auto_26721 ) ) ( AVAILABLE ?auto_26721 ) ( SURFACE-AT ?auto_26720 ?auto_26723 ) ( ON ?auto_26720 ?auto_26722 ) ( CLEAR ?auto_26720 ) ( not ( = ?auto_26716 ?auto_26722 ) ) ( not ( = ?auto_26720 ?auto_26722 ) ) ( not ( = ?auto_26719 ?auto_26722 ) ) ( SURFACE-AT ?auto_26719 ?auto_26725 ) ( CLEAR ?auto_26719 ) ( IS-CRATE ?auto_26716 ) ( AVAILABLE ?auto_26724 ) ( IN ?auto_26716 ?auto_26726 ) ( TRUCK-AT ?auto_26726 ?auto_26723 ) ( ON ?auto_26718 ?auto_26717 ) ( ON ?auto_26719 ?auto_26718 ) ( not ( = ?auto_26717 ?auto_26718 ) ) ( not ( = ?auto_26717 ?auto_26719 ) ) ( not ( = ?auto_26717 ?auto_26716 ) ) ( not ( = ?auto_26717 ?auto_26720 ) ) ( not ( = ?auto_26717 ?auto_26722 ) ) ( not ( = ?auto_26718 ?auto_26719 ) ) ( not ( = ?auto_26718 ?auto_26716 ) ) ( not ( = ?auto_26718 ?auto_26720 ) ) ( not ( = ?auto_26718 ?auto_26722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26719 ?auto_26716 ?auto_26720 )
      ( MAKE-4CRATE-VERIFY ?auto_26717 ?auto_26718 ?auto_26719 ?auto_26716 ?auto_26720 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26728 - SURFACE
      ?auto_26729 - SURFACE
      ?auto_26730 - SURFACE
      ?auto_26727 - SURFACE
      ?auto_26731 - SURFACE
      ?auto_26732 - SURFACE
    )
    :vars
    (
      ?auto_26736 - HOIST
      ?auto_26737 - PLACE
      ?auto_26735 - PLACE
      ?auto_26733 - HOIST
      ?auto_26734 - SURFACE
      ?auto_26738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26736 ?auto_26737 ) ( IS-CRATE ?auto_26732 ) ( not ( = ?auto_26731 ?auto_26732 ) ) ( not ( = ?auto_26727 ?auto_26731 ) ) ( not ( = ?auto_26727 ?auto_26732 ) ) ( not ( = ?auto_26735 ?auto_26737 ) ) ( HOIST-AT ?auto_26733 ?auto_26735 ) ( not ( = ?auto_26736 ?auto_26733 ) ) ( AVAILABLE ?auto_26733 ) ( SURFACE-AT ?auto_26732 ?auto_26735 ) ( ON ?auto_26732 ?auto_26734 ) ( CLEAR ?auto_26732 ) ( not ( = ?auto_26731 ?auto_26734 ) ) ( not ( = ?auto_26732 ?auto_26734 ) ) ( not ( = ?auto_26727 ?auto_26734 ) ) ( SURFACE-AT ?auto_26727 ?auto_26737 ) ( CLEAR ?auto_26727 ) ( IS-CRATE ?auto_26731 ) ( AVAILABLE ?auto_26736 ) ( IN ?auto_26731 ?auto_26738 ) ( TRUCK-AT ?auto_26738 ?auto_26735 ) ( ON ?auto_26729 ?auto_26728 ) ( ON ?auto_26730 ?auto_26729 ) ( ON ?auto_26727 ?auto_26730 ) ( not ( = ?auto_26728 ?auto_26729 ) ) ( not ( = ?auto_26728 ?auto_26730 ) ) ( not ( = ?auto_26728 ?auto_26727 ) ) ( not ( = ?auto_26728 ?auto_26731 ) ) ( not ( = ?auto_26728 ?auto_26732 ) ) ( not ( = ?auto_26728 ?auto_26734 ) ) ( not ( = ?auto_26729 ?auto_26730 ) ) ( not ( = ?auto_26729 ?auto_26727 ) ) ( not ( = ?auto_26729 ?auto_26731 ) ) ( not ( = ?auto_26729 ?auto_26732 ) ) ( not ( = ?auto_26729 ?auto_26734 ) ) ( not ( = ?auto_26730 ?auto_26727 ) ) ( not ( = ?auto_26730 ?auto_26731 ) ) ( not ( = ?auto_26730 ?auto_26732 ) ) ( not ( = ?auto_26730 ?auto_26734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26727 ?auto_26731 ?auto_26732 )
      ( MAKE-5CRATE-VERIFY ?auto_26728 ?auto_26729 ?auto_26730 ?auto_26727 ?auto_26731 ?auto_26732 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26758 - SURFACE
      ?auto_26759 - SURFACE
      ?auto_26760 - SURFACE
      ?auto_26757 - SURFACE
    )
    :vars
    (
      ?auto_26766 - HOIST
      ?auto_26764 - PLACE
      ?auto_26763 - PLACE
      ?auto_26761 - HOIST
      ?auto_26762 - SURFACE
      ?auto_26765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26766 ?auto_26764 ) ( IS-CRATE ?auto_26757 ) ( not ( = ?auto_26760 ?auto_26757 ) ) ( not ( = ?auto_26759 ?auto_26760 ) ) ( not ( = ?auto_26759 ?auto_26757 ) ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( HOIST-AT ?auto_26761 ?auto_26763 ) ( not ( = ?auto_26766 ?auto_26761 ) ) ( SURFACE-AT ?auto_26757 ?auto_26763 ) ( ON ?auto_26757 ?auto_26762 ) ( CLEAR ?auto_26757 ) ( not ( = ?auto_26760 ?auto_26762 ) ) ( not ( = ?auto_26757 ?auto_26762 ) ) ( not ( = ?auto_26759 ?auto_26762 ) ) ( SURFACE-AT ?auto_26759 ?auto_26764 ) ( CLEAR ?auto_26759 ) ( IS-CRATE ?auto_26760 ) ( AVAILABLE ?auto_26766 ) ( TRUCK-AT ?auto_26765 ?auto_26763 ) ( LIFTING ?auto_26761 ?auto_26760 ) ( ON ?auto_26759 ?auto_26758 ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( not ( = ?auto_26758 ?auto_26760 ) ) ( not ( = ?auto_26758 ?auto_26757 ) ) ( not ( = ?auto_26758 ?auto_26762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26759 ?auto_26760 ?auto_26757 )
      ( MAKE-3CRATE-VERIFY ?auto_26758 ?auto_26759 ?auto_26760 ?auto_26757 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26768 - SURFACE
      ?auto_26769 - SURFACE
      ?auto_26770 - SURFACE
      ?auto_26767 - SURFACE
      ?auto_26771 - SURFACE
    )
    :vars
    (
      ?auto_26777 - HOIST
      ?auto_26775 - PLACE
      ?auto_26774 - PLACE
      ?auto_26772 - HOIST
      ?auto_26773 - SURFACE
      ?auto_26776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26777 ?auto_26775 ) ( IS-CRATE ?auto_26771 ) ( not ( = ?auto_26767 ?auto_26771 ) ) ( not ( = ?auto_26770 ?auto_26767 ) ) ( not ( = ?auto_26770 ?auto_26771 ) ) ( not ( = ?auto_26774 ?auto_26775 ) ) ( HOIST-AT ?auto_26772 ?auto_26774 ) ( not ( = ?auto_26777 ?auto_26772 ) ) ( SURFACE-AT ?auto_26771 ?auto_26774 ) ( ON ?auto_26771 ?auto_26773 ) ( CLEAR ?auto_26771 ) ( not ( = ?auto_26767 ?auto_26773 ) ) ( not ( = ?auto_26771 ?auto_26773 ) ) ( not ( = ?auto_26770 ?auto_26773 ) ) ( SURFACE-AT ?auto_26770 ?auto_26775 ) ( CLEAR ?auto_26770 ) ( IS-CRATE ?auto_26767 ) ( AVAILABLE ?auto_26777 ) ( TRUCK-AT ?auto_26776 ?auto_26774 ) ( LIFTING ?auto_26772 ?auto_26767 ) ( ON ?auto_26769 ?auto_26768 ) ( ON ?auto_26770 ?auto_26769 ) ( not ( = ?auto_26768 ?auto_26769 ) ) ( not ( = ?auto_26768 ?auto_26770 ) ) ( not ( = ?auto_26768 ?auto_26767 ) ) ( not ( = ?auto_26768 ?auto_26771 ) ) ( not ( = ?auto_26768 ?auto_26773 ) ) ( not ( = ?auto_26769 ?auto_26770 ) ) ( not ( = ?auto_26769 ?auto_26767 ) ) ( not ( = ?auto_26769 ?auto_26771 ) ) ( not ( = ?auto_26769 ?auto_26773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26770 ?auto_26767 ?auto_26771 )
      ( MAKE-4CRATE-VERIFY ?auto_26768 ?auto_26769 ?auto_26770 ?auto_26767 ?auto_26771 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26779 - SURFACE
      ?auto_26780 - SURFACE
      ?auto_26781 - SURFACE
      ?auto_26778 - SURFACE
      ?auto_26782 - SURFACE
      ?auto_26783 - SURFACE
    )
    :vars
    (
      ?auto_26789 - HOIST
      ?auto_26787 - PLACE
      ?auto_26786 - PLACE
      ?auto_26784 - HOIST
      ?auto_26785 - SURFACE
      ?auto_26788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26789 ?auto_26787 ) ( IS-CRATE ?auto_26783 ) ( not ( = ?auto_26782 ?auto_26783 ) ) ( not ( = ?auto_26778 ?auto_26782 ) ) ( not ( = ?auto_26778 ?auto_26783 ) ) ( not ( = ?auto_26786 ?auto_26787 ) ) ( HOIST-AT ?auto_26784 ?auto_26786 ) ( not ( = ?auto_26789 ?auto_26784 ) ) ( SURFACE-AT ?auto_26783 ?auto_26786 ) ( ON ?auto_26783 ?auto_26785 ) ( CLEAR ?auto_26783 ) ( not ( = ?auto_26782 ?auto_26785 ) ) ( not ( = ?auto_26783 ?auto_26785 ) ) ( not ( = ?auto_26778 ?auto_26785 ) ) ( SURFACE-AT ?auto_26778 ?auto_26787 ) ( CLEAR ?auto_26778 ) ( IS-CRATE ?auto_26782 ) ( AVAILABLE ?auto_26789 ) ( TRUCK-AT ?auto_26788 ?auto_26786 ) ( LIFTING ?auto_26784 ?auto_26782 ) ( ON ?auto_26780 ?auto_26779 ) ( ON ?auto_26781 ?auto_26780 ) ( ON ?auto_26778 ?auto_26781 ) ( not ( = ?auto_26779 ?auto_26780 ) ) ( not ( = ?auto_26779 ?auto_26781 ) ) ( not ( = ?auto_26779 ?auto_26778 ) ) ( not ( = ?auto_26779 ?auto_26782 ) ) ( not ( = ?auto_26779 ?auto_26783 ) ) ( not ( = ?auto_26779 ?auto_26785 ) ) ( not ( = ?auto_26780 ?auto_26781 ) ) ( not ( = ?auto_26780 ?auto_26778 ) ) ( not ( = ?auto_26780 ?auto_26782 ) ) ( not ( = ?auto_26780 ?auto_26783 ) ) ( not ( = ?auto_26780 ?auto_26785 ) ) ( not ( = ?auto_26781 ?auto_26778 ) ) ( not ( = ?auto_26781 ?auto_26782 ) ) ( not ( = ?auto_26781 ?auto_26783 ) ) ( not ( = ?auto_26781 ?auto_26785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26778 ?auto_26782 ?auto_26783 )
      ( MAKE-5CRATE-VERIFY ?auto_26779 ?auto_26780 ?auto_26781 ?auto_26778 ?auto_26782 ?auto_26783 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26811 - SURFACE
      ?auto_26812 - SURFACE
      ?auto_26813 - SURFACE
      ?auto_26810 - SURFACE
    )
    :vars
    (
      ?auto_26819 - HOIST
      ?auto_26820 - PLACE
      ?auto_26815 - PLACE
      ?auto_26814 - HOIST
      ?auto_26818 - SURFACE
      ?auto_26816 - TRUCK
      ?auto_26817 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26819 ?auto_26820 ) ( IS-CRATE ?auto_26810 ) ( not ( = ?auto_26813 ?auto_26810 ) ) ( not ( = ?auto_26812 ?auto_26813 ) ) ( not ( = ?auto_26812 ?auto_26810 ) ) ( not ( = ?auto_26815 ?auto_26820 ) ) ( HOIST-AT ?auto_26814 ?auto_26815 ) ( not ( = ?auto_26819 ?auto_26814 ) ) ( SURFACE-AT ?auto_26810 ?auto_26815 ) ( ON ?auto_26810 ?auto_26818 ) ( CLEAR ?auto_26810 ) ( not ( = ?auto_26813 ?auto_26818 ) ) ( not ( = ?auto_26810 ?auto_26818 ) ) ( not ( = ?auto_26812 ?auto_26818 ) ) ( SURFACE-AT ?auto_26812 ?auto_26820 ) ( CLEAR ?auto_26812 ) ( IS-CRATE ?auto_26813 ) ( AVAILABLE ?auto_26819 ) ( TRUCK-AT ?auto_26816 ?auto_26815 ) ( AVAILABLE ?auto_26814 ) ( SURFACE-AT ?auto_26813 ?auto_26815 ) ( ON ?auto_26813 ?auto_26817 ) ( CLEAR ?auto_26813 ) ( not ( = ?auto_26813 ?auto_26817 ) ) ( not ( = ?auto_26810 ?auto_26817 ) ) ( not ( = ?auto_26812 ?auto_26817 ) ) ( not ( = ?auto_26818 ?auto_26817 ) ) ( ON ?auto_26812 ?auto_26811 ) ( not ( = ?auto_26811 ?auto_26812 ) ) ( not ( = ?auto_26811 ?auto_26813 ) ) ( not ( = ?auto_26811 ?auto_26810 ) ) ( not ( = ?auto_26811 ?auto_26818 ) ) ( not ( = ?auto_26811 ?auto_26817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26812 ?auto_26813 ?auto_26810 )
      ( MAKE-3CRATE-VERIFY ?auto_26811 ?auto_26812 ?auto_26813 ?auto_26810 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26822 - SURFACE
      ?auto_26823 - SURFACE
      ?auto_26824 - SURFACE
      ?auto_26821 - SURFACE
      ?auto_26825 - SURFACE
    )
    :vars
    (
      ?auto_26831 - HOIST
      ?auto_26832 - PLACE
      ?auto_26827 - PLACE
      ?auto_26826 - HOIST
      ?auto_26830 - SURFACE
      ?auto_26828 - TRUCK
      ?auto_26829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26831 ?auto_26832 ) ( IS-CRATE ?auto_26825 ) ( not ( = ?auto_26821 ?auto_26825 ) ) ( not ( = ?auto_26824 ?auto_26821 ) ) ( not ( = ?auto_26824 ?auto_26825 ) ) ( not ( = ?auto_26827 ?auto_26832 ) ) ( HOIST-AT ?auto_26826 ?auto_26827 ) ( not ( = ?auto_26831 ?auto_26826 ) ) ( SURFACE-AT ?auto_26825 ?auto_26827 ) ( ON ?auto_26825 ?auto_26830 ) ( CLEAR ?auto_26825 ) ( not ( = ?auto_26821 ?auto_26830 ) ) ( not ( = ?auto_26825 ?auto_26830 ) ) ( not ( = ?auto_26824 ?auto_26830 ) ) ( SURFACE-AT ?auto_26824 ?auto_26832 ) ( CLEAR ?auto_26824 ) ( IS-CRATE ?auto_26821 ) ( AVAILABLE ?auto_26831 ) ( TRUCK-AT ?auto_26828 ?auto_26827 ) ( AVAILABLE ?auto_26826 ) ( SURFACE-AT ?auto_26821 ?auto_26827 ) ( ON ?auto_26821 ?auto_26829 ) ( CLEAR ?auto_26821 ) ( not ( = ?auto_26821 ?auto_26829 ) ) ( not ( = ?auto_26825 ?auto_26829 ) ) ( not ( = ?auto_26824 ?auto_26829 ) ) ( not ( = ?auto_26830 ?auto_26829 ) ) ( ON ?auto_26823 ?auto_26822 ) ( ON ?auto_26824 ?auto_26823 ) ( not ( = ?auto_26822 ?auto_26823 ) ) ( not ( = ?auto_26822 ?auto_26824 ) ) ( not ( = ?auto_26822 ?auto_26821 ) ) ( not ( = ?auto_26822 ?auto_26825 ) ) ( not ( = ?auto_26822 ?auto_26830 ) ) ( not ( = ?auto_26822 ?auto_26829 ) ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( not ( = ?auto_26823 ?auto_26821 ) ) ( not ( = ?auto_26823 ?auto_26825 ) ) ( not ( = ?auto_26823 ?auto_26830 ) ) ( not ( = ?auto_26823 ?auto_26829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26824 ?auto_26821 ?auto_26825 )
      ( MAKE-4CRATE-VERIFY ?auto_26822 ?auto_26823 ?auto_26824 ?auto_26821 ?auto_26825 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26834 - SURFACE
      ?auto_26835 - SURFACE
      ?auto_26836 - SURFACE
      ?auto_26833 - SURFACE
      ?auto_26837 - SURFACE
      ?auto_26838 - SURFACE
    )
    :vars
    (
      ?auto_26844 - HOIST
      ?auto_26845 - PLACE
      ?auto_26840 - PLACE
      ?auto_26839 - HOIST
      ?auto_26843 - SURFACE
      ?auto_26841 - TRUCK
      ?auto_26842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26844 ?auto_26845 ) ( IS-CRATE ?auto_26838 ) ( not ( = ?auto_26837 ?auto_26838 ) ) ( not ( = ?auto_26833 ?auto_26837 ) ) ( not ( = ?auto_26833 ?auto_26838 ) ) ( not ( = ?auto_26840 ?auto_26845 ) ) ( HOIST-AT ?auto_26839 ?auto_26840 ) ( not ( = ?auto_26844 ?auto_26839 ) ) ( SURFACE-AT ?auto_26838 ?auto_26840 ) ( ON ?auto_26838 ?auto_26843 ) ( CLEAR ?auto_26838 ) ( not ( = ?auto_26837 ?auto_26843 ) ) ( not ( = ?auto_26838 ?auto_26843 ) ) ( not ( = ?auto_26833 ?auto_26843 ) ) ( SURFACE-AT ?auto_26833 ?auto_26845 ) ( CLEAR ?auto_26833 ) ( IS-CRATE ?auto_26837 ) ( AVAILABLE ?auto_26844 ) ( TRUCK-AT ?auto_26841 ?auto_26840 ) ( AVAILABLE ?auto_26839 ) ( SURFACE-AT ?auto_26837 ?auto_26840 ) ( ON ?auto_26837 ?auto_26842 ) ( CLEAR ?auto_26837 ) ( not ( = ?auto_26837 ?auto_26842 ) ) ( not ( = ?auto_26838 ?auto_26842 ) ) ( not ( = ?auto_26833 ?auto_26842 ) ) ( not ( = ?auto_26843 ?auto_26842 ) ) ( ON ?auto_26835 ?auto_26834 ) ( ON ?auto_26836 ?auto_26835 ) ( ON ?auto_26833 ?auto_26836 ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( not ( = ?auto_26834 ?auto_26836 ) ) ( not ( = ?auto_26834 ?auto_26833 ) ) ( not ( = ?auto_26834 ?auto_26837 ) ) ( not ( = ?auto_26834 ?auto_26838 ) ) ( not ( = ?auto_26834 ?auto_26843 ) ) ( not ( = ?auto_26834 ?auto_26842 ) ) ( not ( = ?auto_26835 ?auto_26836 ) ) ( not ( = ?auto_26835 ?auto_26833 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26838 ) ) ( not ( = ?auto_26835 ?auto_26843 ) ) ( not ( = ?auto_26835 ?auto_26842 ) ) ( not ( = ?auto_26836 ?auto_26833 ) ) ( not ( = ?auto_26836 ?auto_26837 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26843 ) ) ( not ( = ?auto_26836 ?auto_26842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26833 ?auto_26837 ?auto_26838 )
      ( MAKE-5CRATE-VERIFY ?auto_26834 ?auto_26835 ?auto_26836 ?auto_26833 ?auto_26837 ?auto_26838 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26867 - SURFACE
      ?auto_26868 - SURFACE
      ?auto_26869 - SURFACE
      ?auto_26866 - SURFACE
    )
    :vars
    (
      ?auto_26875 - HOIST
      ?auto_26871 - PLACE
      ?auto_26873 - PLACE
      ?auto_26876 - HOIST
      ?auto_26874 - SURFACE
      ?auto_26870 - SURFACE
      ?auto_26872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26875 ?auto_26871 ) ( IS-CRATE ?auto_26866 ) ( not ( = ?auto_26869 ?auto_26866 ) ) ( not ( = ?auto_26868 ?auto_26869 ) ) ( not ( = ?auto_26868 ?auto_26866 ) ) ( not ( = ?auto_26873 ?auto_26871 ) ) ( HOIST-AT ?auto_26876 ?auto_26873 ) ( not ( = ?auto_26875 ?auto_26876 ) ) ( SURFACE-AT ?auto_26866 ?auto_26873 ) ( ON ?auto_26866 ?auto_26874 ) ( CLEAR ?auto_26866 ) ( not ( = ?auto_26869 ?auto_26874 ) ) ( not ( = ?auto_26866 ?auto_26874 ) ) ( not ( = ?auto_26868 ?auto_26874 ) ) ( SURFACE-AT ?auto_26868 ?auto_26871 ) ( CLEAR ?auto_26868 ) ( IS-CRATE ?auto_26869 ) ( AVAILABLE ?auto_26875 ) ( AVAILABLE ?auto_26876 ) ( SURFACE-AT ?auto_26869 ?auto_26873 ) ( ON ?auto_26869 ?auto_26870 ) ( CLEAR ?auto_26869 ) ( not ( = ?auto_26869 ?auto_26870 ) ) ( not ( = ?auto_26866 ?auto_26870 ) ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26874 ?auto_26870 ) ) ( TRUCK-AT ?auto_26872 ?auto_26871 ) ( ON ?auto_26868 ?auto_26867 ) ( not ( = ?auto_26867 ?auto_26868 ) ) ( not ( = ?auto_26867 ?auto_26869 ) ) ( not ( = ?auto_26867 ?auto_26866 ) ) ( not ( = ?auto_26867 ?auto_26874 ) ) ( not ( = ?auto_26867 ?auto_26870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26868 ?auto_26869 ?auto_26866 )
      ( MAKE-3CRATE-VERIFY ?auto_26867 ?auto_26868 ?auto_26869 ?auto_26866 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26878 - SURFACE
      ?auto_26879 - SURFACE
      ?auto_26880 - SURFACE
      ?auto_26877 - SURFACE
      ?auto_26881 - SURFACE
    )
    :vars
    (
      ?auto_26887 - HOIST
      ?auto_26883 - PLACE
      ?auto_26885 - PLACE
      ?auto_26888 - HOIST
      ?auto_26886 - SURFACE
      ?auto_26882 - SURFACE
      ?auto_26884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26887 ?auto_26883 ) ( IS-CRATE ?auto_26881 ) ( not ( = ?auto_26877 ?auto_26881 ) ) ( not ( = ?auto_26880 ?auto_26877 ) ) ( not ( = ?auto_26880 ?auto_26881 ) ) ( not ( = ?auto_26885 ?auto_26883 ) ) ( HOIST-AT ?auto_26888 ?auto_26885 ) ( not ( = ?auto_26887 ?auto_26888 ) ) ( SURFACE-AT ?auto_26881 ?auto_26885 ) ( ON ?auto_26881 ?auto_26886 ) ( CLEAR ?auto_26881 ) ( not ( = ?auto_26877 ?auto_26886 ) ) ( not ( = ?auto_26881 ?auto_26886 ) ) ( not ( = ?auto_26880 ?auto_26886 ) ) ( SURFACE-AT ?auto_26880 ?auto_26883 ) ( CLEAR ?auto_26880 ) ( IS-CRATE ?auto_26877 ) ( AVAILABLE ?auto_26887 ) ( AVAILABLE ?auto_26888 ) ( SURFACE-AT ?auto_26877 ?auto_26885 ) ( ON ?auto_26877 ?auto_26882 ) ( CLEAR ?auto_26877 ) ( not ( = ?auto_26877 ?auto_26882 ) ) ( not ( = ?auto_26881 ?auto_26882 ) ) ( not ( = ?auto_26880 ?auto_26882 ) ) ( not ( = ?auto_26886 ?auto_26882 ) ) ( TRUCK-AT ?auto_26884 ?auto_26883 ) ( ON ?auto_26879 ?auto_26878 ) ( ON ?auto_26880 ?auto_26879 ) ( not ( = ?auto_26878 ?auto_26879 ) ) ( not ( = ?auto_26878 ?auto_26880 ) ) ( not ( = ?auto_26878 ?auto_26877 ) ) ( not ( = ?auto_26878 ?auto_26881 ) ) ( not ( = ?auto_26878 ?auto_26886 ) ) ( not ( = ?auto_26878 ?auto_26882 ) ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( not ( = ?auto_26879 ?auto_26877 ) ) ( not ( = ?auto_26879 ?auto_26881 ) ) ( not ( = ?auto_26879 ?auto_26886 ) ) ( not ( = ?auto_26879 ?auto_26882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26880 ?auto_26877 ?auto_26881 )
      ( MAKE-4CRATE-VERIFY ?auto_26878 ?auto_26879 ?auto_26880 ?auto_26877 ?auto_26881 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26890 - SURFACE
      ?auto_26891 - SURFACE
      ?auto_26892 - SURFACE
      ?auto_26889 - SURFACE
      ?auto_26893 - SURFACE
      ?auto_26894 - SURFACE
    )
    :vars
    (
      ?auto_26900 - HOIST
      ?auto_26896 - PLACE
      ?auto_26898 - PLACE
      ?auto_26901 - HOIST
      ?auto_26899 - SURFACE
      ?auto_26895 - SURFACE
      ?auto_26897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26900 ?auto_26896 ) ( IS-CRATE ?auto_26894 ) ( not ( = ?auto_26893 ?auto_26894 ) ) ( not ( = ?auto_26889 ?auto_26893 ) ) ( not ( = ?auto_26889 ?auto_26894 ) ) ( not ( = ?auto_26898 ?auto_26896 ) ) ( HOIST-AT ?auto_26901 ?auto_26898 ) ( not ( = ?auto_26900 ?auto_26901 ) ) ( SURFACE-AT ?auto_26894 ?auto_26898 ) ( ON ?auto_26894 ?auto_26899 ) ( CLEAR ?auto_26894 ) ( not ( = ?auto_26893 ?auto_26899 ) ) ( not ( = ?auto_26894 ?auto_26899 ) ) ( not ( = ?auto_26889 ?auto_26899 ) ) ( SURFACE-AT ?auto_26889 ?auto_26896 ) ( CLEAR ?auto_26889 ) ( IS-CRATE ?auto_26893 ) ( AVAILABLE ?auto_26900 ) ( AVAILABLE ?auto_26901 ) ( SURFACE-AT ?auto_26893 ?auto_26898 ) ( ON ?auto_26893 ?auto_26895 ) ( CLEAR ?auto_26893 ) ( not ( = ?auto_26893 ?auto_26895 ) ) ( not ( = ?auto_26894 ?auto_26895 ) ) ( not ( = ?auto_26889 ?auto_26895 ) ) ( not ( = ?auto_26899 ?auto_26895 ) ) ( TRUCK-AT ?auto_26897 ?auto_26896 ) ( ON ?auto_26891 ?auto_26890 ) ( ON ?auto_26892 ?auto_26891 ) ( ON ?auto_26889 ?auto_26892 ) ( not ( = ?auto_26890 ?auto_26891 ) ) ( not ( = ?auto_26890 ?auto_26892 ) ) ( not ( = ?auto_26890 ?auto_26889 ) ) ( not ( = ?auto_26890 ?auto_26893 ) ) ( not ( = ?auto_26890 ?auto_26894 ) ) ( not ( = ?auto_26890 ?auto_26899 ) ) ( not ( = ?auto_26890 ?auto_26895 ) ) ( not ( = ?auto_26891 ?auto_26892 ) ) ( not ( = ?auto_26891 ?auto_26889 ) ) ( not ( = ?auto_26891 ?auto_26893 ) ) ( not ( = ?auto_26891 ?auto_26894 ) ) ( not ( = ?auto_26891 ?auto_26899 ) ) ( not ( = ?auto_26891 ?auto_26895 ) ) ( not ( = ?auto_26892 ?auto_26889 ) ) ( not ( = ?auto_26892 ?auto_26893 ) ) ( not ( = ?auto_26892 ?auto_26894 ) ) ( not ( = ?auto_26892 ?auto_26899 ) ) ( not ( = ?auto_26892 ?auto_26895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26889 ?auto_26893 ?auto_26894 )
      ( MAKE-5CRATE-VERIFY ?auto_26890 ?auto_26891 ?auto_26892 ?auto_26889 ?auto_26893 ?auto_26894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26902 - SURFACE
      ?auto_26903 - SURFACE
    )
    :vars
    (
      ?auto_26910 - HOIST
      ?auto_26905 - PLACE
      ?auto_26908 - SURFACE
      ?auto_26907 - PLACE
      ?auto_26911 - HOIST
      ?auto_26909 - SURFACE
      ?auto_26904 - SURFACE
      ?auto_26906 - TRUCK
      ?auto_26912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26910 ?auto_26905 ) ( IS-CRATE ?auto_26903 ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26908 ?auto_26902 ) ) ( not ( = ?auto_26908 ?auto_26903 ) ) ( not ( = ?auto_26907 ?auto_26905 ) ) ( HOIST-AT ?auto_26911 ?auto_26907 ) ( not ( = ?auto_26910 ?auto_26911 ) ) ( SURFACE-AT ?auto_26903 ?auto_26907 ) ( ON ?auto_26903 ?auto_26909 ) ( CLEAR ?auto_26903 ) ( not ( = ?auto_26902 ?auto_26909 ) ) ( not ( = ?auto_26903 ?auto_26909 ) ) ( not ( = ?auto_26908 ?auto_26909 ) ) ( IS-CRATE ?auto_26902 ) ( AVAILABLE ?auto_26911 ) ( SURFACE-AT ?auto_26902 ?auto_26907 ) ( ON ?auto_26902 ?auto_26904 ) ( CLEAR ?auto_26902 ) ( not ( = ?auto_26902 ?auto_26904 ) ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( not ( = ?auto_26908 ?auto_26904 ) ) ( not ( = ?auto_26909 ?auto_26904 ) ) ( TRUCK-AT ?auto_26906 ?auto_26905 ) ( SURFACE-AT ?auto_26912 ?auto_26905 ) ( CLEAR ?auto_26912 ) ( LIFTING ?auto_26910 ?auto_26908 ) ( IS-CRATE ?auto_26908 ) ( not ( = ?auto_26912 ?auto_26908 ) ) ( not ( = ?auto_26902 ?auto_26912 ) ) ( not ( = ?auto_26903 ?auto_26912 ) ) ( not ( = ?auto_26909 ?auto_26912 ) ) ( not ( = ?auto_26904 ?auto_26912 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26912 ?auto_26908 )
      ( MAKE-2CRATE ?auto_26908 ?auto_26902 ?auto_26903 )
      ( MAKE-1CRATE-VERIFY ?auto_26902 ?auto_26903 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26913 - SURFACE
      ?auto_26914 - SURFACE
      ?auto_26915 - SURFACE
    )
    :vars
    (
      ?auto_26918 - HOIST
      ?auto_26916 - PLACE
      ?auto_26920 - PLACE
      ?auto_26917 - HOIST
      ?auto_26922 - SURFACE
      ?auto_26921 - SURFACE
      ?auto_26919 - TRUCK
      ?auto_26923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26918 ?auto_26916 ) ( IS-CRATE ?auto_26915 ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26914 ) ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26920 ?auto_26916 ) ) ( HOIST-AT ?auto_26917 ?auto_26920 ) ( not ( = ?auto_26918 ?auto_26917 ) ) ( SURFACE-AT ?auto_26915 ?auto_26920 ) ( ON ?auto_26915 ?auto_26922 ) ( CLEAR ?auto_26915 ) ( not ( = ?auto_26914 ?auto_26922 ) ) ( not ( = ?auto_26915 ?auto_26922 ) ) ( not ( = ?auto_26913 ?auto_26922 ) ) ( IS-CRATE ?auto_26914 ) ( AVAILABLE ?auto_26917 ) ( SURFACE-AT ?auto_26914 ?auto_26920 ) ( ON ?auto_26914 ?auto_26921 ) ( CLEAR ?auto_26914 ) ( not ( = ?auto_26914 ?auto_26921 ) ) ( not ( = ?auto_26915 ?auto_26921 ) ) ( not ( = ?auto_26913 ?auto_26921 ) ) ( not ( = ?auto_26922 ?auto_26921 ) ) ( TRUCK-AT ?auto_26919 ?auto_26916 ) ( SURFACE-AT ?auto_26923 ?auto_26916 ) ( CLEAR ?auto_26923 ) ( LIFTING ?auto_26918 ?auto_26913 ) ( IS-CRATE ?auto_26913 ) ( not ( = ?auto_26923 ?auto_26913 ) ) ( not ( = ?auto_26914 ?auto_26923 ) ) ( not ( = ?auto_26915 ?auto_26923 ) ) ( not ( = ?auto_26922 ?auto_26923 ) ) ( not ( = ?auto_26921 ?auto_26923 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26914 ?auto_26915 )
      ( MAKE-2CRATE-VERIFY ?auto_26913 ?auto_26914 ?auto_26915 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26925 - SURFACE
      ?auto_26926 - SURFACE
      ?auto_26927 - SURFACE
      ?auto_26924 - SURFACE
    )
    :vars
    (
      ?auto_26928 - HOIST
      ?auto_26933 - PLACE
      ?auto_26929 - PLACE
      ?auto_26930 - HOIST
      ?auto_26932 - SURFACE
      ?auto_26934 - SURFACE
      ?auto_26931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26928 ?auto_26933 ) ( IS-CRATE ?auto_26924 ) ( not ( = ?auto_26927 ?auto_26924 ) ) ( not ( = ?auto_26926 ?auto_26927 ) ) ( not ( = ?auto_26926 ?auto_26924 ) ) ( not ( = ?auto_26929 ?auto_26933 ) ) ( HOIST-AT ?auto_26930 ?auto_26929 ) ( not ( = ?auto_26928 ?auto_26930 ) ) ( SURFACE-AT ?auto_26924 ?auto_26929 ) ( ON ?auto_26924 ?auto_26932 ) ( CLEAR ?auto_26924 ) ( not ( = ?auto_26927 ?auto_26932 ) ) ( not ( = ?auto_26924 ?auto_26932 ) ) ( not ( = ?auto_26926 ?auto_26932 ) ) ( IS-CRATE ?auto_26927 ) ( AVAILABLE ?auto_26930 ) ( SURFACE-AT ?auto_26927 ?auto_26929 ) ( ON ?auto_26927 ?auto_26934 ) ( CLEAR ?auto_26927 ) ( not ( = ?auto_26927 ?auto_26934 ) ) ( not ( = ?auto_26924 ?auto_26934 ) ) ( not ( = ?auto_26926 ?auto_26934 ) ) ( not ( = ?auto_26932 ?auto_26934 ) ) ( TRUCK-AT ?auto_26931 ?auto_26933 ) ( SURFACE-AT ?auto_26925 ?auto_26933 ) ( CLEAR ?auto_26925 ) ( LIFTING ?auto_26928 ?auto_26926 ) ( IS-CRATE ?auto_26926 ) ( not ( = ?auto_26925 ?auto_26926 ) ) ( not ( = ?auto_26927 ?auto_26925 ) ) ( not ( = ?auto_26924 ?auto_26925 ) ) ( not ( = ?auto_26932 ?auto_26925 ) ) ( not ( = ?auto_26934 ?auto_26925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26926 ?auto_26927 ?auto_26924 )
      ( MAKE-3CRATE-VERIFY ?auto_26925 ?auto_26926 ?auto_26927 ?auto_26924 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26936 - SURFACE
      ?auto_26937 - SURFACE
      ?auto_26938 - SURFACE
      ?auto_26935 - SURFACE
      ?auto_26939 - SURFACE
    )
    :vars
    (
      ?auto_26940 - HOIST
      ?auto_26945 - PLACE
      ?auto_26941 - PLACE
      ?auto_26942 - HOIST
      ?auto_26944 - SURFACE
      ?auto_26946 - SURFACE
      ?auto_26943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26940 ?auto_26945 ) ( IS-CRATE ?auto_26939 ) ( not ( = ?auto_26935 ?auto_26939 ) ) ( not ( = ?auto_26938 ?auto_26935 ) ) ( not ( = ?auto_26938 ?auto_26939 ) ) ( not ( = ?auto_26941 ?auto_26945 ) ) ( HOIST-AT ?auto_26942 ?auto_26941 ) ( not ( = ?auto_26940 ?auto_26942 ) ) ( SURFACE-AT ?auto_26939 ?auto_26941 ) ( ON ?auto_26939 ?auto_26944 ) ( CLEAR ?auto_26939 ) ( not ( = ?auto_26935 ?auto_26944 ) ) ( not ( = ?auto_26939 ?auto_26944 ) ) ( not ( = ?auto_26938 ?auto_26944 ) ) ( IS-CRATE ?auto_26935 ) ( AVAILABLE ?auto_26942 ) ( SURFACE-AT ?auto_26935 ?auto_26941 ) ( ON ?auto_26935 ?auto_26946 ) ( CLEAR ?auto_26935 ) ( not ( = ?auto_26935 ?auto_26946 ) ) ( not ( = ?auto_26939 ?auto_26946 ) ) ( not ( = ?auto_26938 ?auto_26946 ) ) ( not ( = ?auto_26944 ?auto_26946 ) ) ( TRUCK-AT ?auto_26943 ?auto_26945 ) ( SURFACE-AT ?auto_26937 ?auto_26945 ) ( CLEAR ?auto_26937 ) ( LIFTING ?auto_26940 ?auto_26938 ) ( IS-CRATE ?auto_26938 ) ( not ( = ?auto_26937 ?auto_26938 ) ) ( not ( = ?auto_26935 ?auto_26937 ) ) ( not ( = ?auto_26939 ?auto_26937 ) ) ( not ( = ?auto_26944 ?auto_26937 ) ) ( not ( = ?auto_26946 ?auto_26937 ) ) ( ON ?auto_26937 ?auto_26936 ) ( not ( = ?auto_26936 ?auto_26937 ) ) ( not ( = ?auto_26936 ?auto_26938 ) ) ( not ( = ?auto_26936 ?auto_26935 ) ) ( not ( = ?auto_26936 ?auto_26939 ) ) ( not ( = ?auto_26936 ?auto_26944 ) ) ( not ( = ?auto_26936 ?auto_26946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26938 ?auto_26935 ?auto_26939 )
      ( MAKE-4CRATE-VERIFY ?auto_26936 ?auto_26937 ?auto_26938 ?auto_26935 ?auto_26939 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26948 - SURFACE
      ?auto_26949 - SURFACE
      ?auto_26950 - SURFACE
      ?auto_26947 - SURFACE
      ?auto_26951 - SURFACE
      ?auto_26952 - SURFACE
    )
    :vars
    (
      ?auto_26953 - HOIST
      ?auto_26958 - PLACE
      ?auto_26954 - PLACE
      ?auto_26955 - HOIST
      ?auto_26957 - SURFACE
      ?auto_26959 - SURFACE
      ?auto_26956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26953 ?auto_26958 ) ( IS-CRATE ?auto_26952 ) ( not ( = ?auto_26951 ?auto_26952 ) ) ( not ( = ?auto_26947 ?auto_26951 ) ) ( not ( = ?auto_26947 ?auto_26952 ) ) ( not ( = ?auto_26954 ?auto_26958 ) ) ( HOIST-AT ?auto_26955 ?auto_26954 ) ( not ( = ?auto_26953 ?auto_26955 ) ) ( SURFACE-AT ?auto_26952 ?auto_26954 ) ( ON ?auto_26952 ?auto_26957 ) ( CLEAR ?auto_26952 ) ( not ( = ?auto_26951 ?auto_26957 ) ) ( not ( = ?auto_26952 ?auto_26957 ) ) ( not ( = ?auto_26947 ?auto_26957 ) ) ( IS-CRATE ?auto_26951 ) ( AVAILABLE ?auto_26955 ) ( SURFACE-AT ?auto_26951 ?auto_26954 ) ( ON ?auto_26951 ?auto_26959 ) ( CLEAR ?auto_26951 ) ( not ( = ?auto_26951 ?auto_26959 ) ) ( not ( = ?auto_26952 ?auto_26959 ) ) ( not ( = ?auto_26947 ?auto_26959 ) ) ( not ( = ?auto_26957 ?auto_26959 ) ) ( TRUCK-AT ?auto_26956 ?auto_26958 ) ( SURFACE-AT ?auto_26950 ?auto_26958 ) ( CLEAR ?auto_26950 ) ( LIFTING ?auto_26953 ?auto_26947 ) ( IS-CRATE ?auto_26947 ) ( not ( = ?auto_26950 ?auto_26947 ) ) ( not ( = ?auto_26951 ?auto_26950 ) ) ( not ( = ?auto_26952 ?auto_26950 ) ) ( not ( = ?auto_26957 ?auto_26950 ) ) ( not ( = ?auto_26959 ?auto_26950 ) ) ( ON ?auto_26949 ?auto_26948 ) ( ON ?auto_26950 ?auto_26949 ) ( not ( = ?auto_26948 ?auto_26949 ) ) ( not ( = ?auto_26948 ?auto_26950 ) ) ( not ( = ?auto_26948 ?auto_26947 ) ) ( not ( = ?auto_26948 ?auto_26951 ) ) ( not ( = ?auto_26948 ?auto_26952 ) ) ( not ( = ?auto_26948 ?auto_26957 ) ) ( not ( = ?auto_26948 ?auto_26959 ) ) ( not ( = ?auto_26949 ?auto_26950 ) ) ( not ( = ?auto_26949 ?auto_26947 ) ) ( not ( = ?auto_26949 ?auto_26951 ) ) ( not ( = ?auto_26949 ?auto_26952 ) ) ( not ( = ?auto_26949 ?auto_26957 ) ) ( not ( = ?auto_26949 ?auto_26959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26947 ?auto_26951 ?auto_26952 )
      ( MAKE-5CRATE-VERIFY ?auto_26948 ?auto_26949 ?auto_26950 ?auto_26947 ?auto_26951 ?auto_26952 ) )
  )

)

