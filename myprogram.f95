program myprogram
implicit none
real, allocatable, dimension(:) :: date1, mjd1, hofday1, szwd1, tsc1, tmk1, iwv1
real, allocatable, dimension(:) :: date2, mjd2, hofday2, szwd2, tsc2, tmk2, iwv2
integer :: i, j, n1, n2
character(len=43) :: header !   BY          MJD      HofDAY  ZWD(mm)   sZWD   TsC TmK   IWV(mm)

!write(*,*) 'Enter n'
!read(*,*) n
n1=34202
n2=34187

 allocate(date1(1:n1))
 allocate(mjd1(1:n1))
 allocate(hofday1(1:n1))
 allocate(szwd1(1:n1))
 allocate(tsc1(1:n1))
 allocate(tmk1(1:n1))
 allocate(iwv1(1:n1)) 

 allocate(date2(1:n2))
 allocate(mjd2(1:n2))
 allocate(hofday2(1:n2))
 allocate(szwd2(1:n2))
 allocate(tsc2(1:n2))
 allocate(tmk2(1:n2))
 allocate(iwv2(1:n2)) 
 
 open(unit=1, file= 'svtl_3h.iwv_10el')
 read(1,*) header
 do i=1,n1
   read(1,*) date1(i), mjd1(i), hofday1(i), szwd1(i), tsc1(i), tmk1(i), iwv1(i)
 enddo
 close(unit=1)

 open(unit=2, file= 'svtl_3h.iwv_5el')
 read(2,*) header
 do i=1,n2
   read(2,*) date2(i), mjd2(i), hofday2(i), szwd2(i), tsc2(i), tmk2(i), iwv2(i)
 enddo
 close(unit=2)

 open(unit=3, file='svtl_3h_new.iwv_10el')
 open(unit=4, file= 'svtl_3h_new.iwv_5el')
 do i=1,n1
 do j=1,n2
    if (date1(i)==date2(j)) then
	write(3,'(f10.5,2x,f9.3,2x,f3.1,4x,f4.2,3x,f3.1,2x,f5.2,4x,f4.2)') date1(i), mjd1(i), hofday1(i), szwd1(i), tsc1(i), tmk1(i), iwv1(i)
	write(3,'(f10.5,2x,f9.3,2x,f3.1,4x,f4.2,3x,f3.1,2x,f5.2,4x,f4.2)') date2(j), mjd2(j), hofday2(j), szwd2(j), tsc2(j), tmk2(j), iwv2(j)
    endif
 enddo
 enddo
 close(unit=3)
 close(unit=4)
 
 deallocate (date1, mjd1, hofday1, szwd1, tsc1, tmk1, iwv1)
 deallocate (date2, mjd2, hofday2, szwd2, tsc2, tmk2, iwv2)

end

