program chapter_17
    ! This is a comment line; it is ignored by the compiler
    implicit none
    integer :: menu_option

    print *, 'Welcome to Chapter 17 program set'

    print *, 'List of programs to select from: '
    print *, '1. Flow between points'

    print *, 'Enter your menu selection: '
    read(*,*) menu_option

    print *, 'You selected option: ', menu_option

    call flow_a_to_b(5.0, 6.0, 18.0, 10.0, 7.0)

end program chapter_17

! First subroutine Conservation of energy calculations
! Assumes english system
! Schedule 40 pipe
subroutine flow_a_to_b(flow_A, dia_A, dia_B, p_A, p_B)
    implicit none
    real, intent(in) :: flow_A !ft/sec
    real, intent(in) :: dia_A ! inch
    real, intent(in) :: dia_B ! inch
    real, intent(in) :: p_A ! psia
    real, intent(in) :: p_B ! psia

    real :: area_A 
    real :: area_B

    print *, '-----------------------------'
    print *, 'Flow in point A', flow_A
    print *, 'Dia in A', dia_A
    print *, 'Dia in B', dia_B 
    print *, 'p_A', p_A
    print *, 'p_B', p_B
    print *, '-----------------------------'

    !Assume that ID is same as dia
    call areaInFt2(dia_A, area_A)
    print *, 'Area (ft2) at point A: ', area_A

    call areaInFt2(dia_B, area_B)
    print *, 'Area (ft2) at point B: ', area_B

end subroutine

! Returns area in ft^2 
subroutine areaInFt2(dia, area)
    implicit none
    real, intent(in) :: dia !inch
    real, intent(out) :: area !ft2

    real(8),  parameter :: PI_8  = 4 * atan (1.0_8)

    area = dia * dia / 4 * PI_8 / 144.0 
end subroutine
