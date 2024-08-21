program chapter_17
    ! This is a comment line; it is ignored by the compiler
    implicit none
    integer :: menu_option

    print *, 'Welcome to Chapter 17 program set'

    print *, 'List of programs to select from: '
    print *, '1. Flow between points'

    ! print *, 'Enter your menu selection: '
    ! read(*,*) menu_option
    menu_option = 1

    print *, 'You selected option: ', menu_option

    call flow_a_to_b(5.0, 6.0, 18.0, 10.0, 7.0)

end program chapter_17

! First subroutine Conservation of energy calculations
! Assumes english system
! Schedule 40 pipe
subroutine flow_a_to_b(flow_A, dia_A, dia_B, p_A, p_B)
    ! implicit none
    real, intent(in) :: flow_A !ft/sec
    real, intent(in) :: dia_A ! inch
    real, intent(in) :: dia_B ! inch
    real, intent(in) :: p_A ! psia
    real, intent(in) :: p_B ! psia

    ! calculated inside the subroutine
    real :: area_A 
    real :: area_B
    real :: vel_A
    real :: vel_B
    real :: energyT_A
    real :: energyT_B


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

    vel_A = volFlowToVelocity(flow_A, area_A)
    print *, 'Velocity of flow at A ft/sec: ', vel_A
    vel_B = volFlowToVelocity(flow_A, area_B)
    print *, 'Velocity of flow at B ft/sec: ', vel_B

    call totalEnergyBernu(10.0, vel_A, 0.0, energyT_A)
    print *, 'Total Energy at A: ', energyT_A 

    call totalEnergyBernu(7.0, vel_B, 15.0, energyT_B)
    print *, 'Total Energy at B: ', energyT_B 

    print *, '======================================'
    print *, 'Results'
    print *, 'Velocity of flow at A ft/sec: ', vel_A
    if (energyT_A > energyT_B) then
        print *, 'Flow is from A to B'
    else
        print *, 'Flow is from B to A'
    end if

end subroutine

! Returns area in ft^2 
subroutine areaInFt2(dia, area)
    implicit none
    real, intent(in) :: dia !inch
    real, intent(out) :: area !ft2

    real(8),  parameter :: PI_8  = 4 * atan (1.0_8)

    area = dia * dia / 4 * PI_8 / 144.0 
end subroutine

! Converts velocity in cubic ft/s to ft/s for a given area
real function volFlowToVelocity(vol_flow, flow_area)

    real, intent(in) :: vol_flow
    real, intent(in) :: flow_area

    volFlowToVelocity = vol_flow/flow_area

end function volFlowToVelocity


subroutine totalEnergyBernu(P_val, velocity, z_value, energy_total)
    implicit none
    real, intent(in) :: P_val !psi
    real, intent(in) :: velocity !ft/sec
    real, intent(in) :: z_value !ft
    real, intent(out) :: energy_total

    real, parameter :: water_density = 62.5
    real, parameter :: g_c = 32.2 !ft/s2

    energy_total = (P_val * 144) /water_density + velocity * velocity/ 2 / g_c + z_value

end subroutine