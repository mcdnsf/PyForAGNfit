      module params
      implicit none

c     Input parameters
      integer :: iter_max
      character(len=12) :: Fe2t_data
      character(len=16) :: Fe2t_opt_data
      integer :: fe2t_size
      integer :: fe2t_opt_size
      real :: redshift
      real,dimension(91000) :: vlam
      real,dimension(91000) :: flux
      real,dimension(91000) :: err_flux
      real,dimension(91000) :: flux_FeIIt
      real,dimension(91000) :: flux_FeIIt_opt

      real :: smear_vel_fe2t
      character(len=22) :: spec_file

      character(len=11) :: balcont_data !Balmer continuum  template
      character(len=11) :: highbal_data !High order Balmer lines
      integer :: balcont_size
      integer :: highbal_size
      real,dimension(91000) :: flux_balcont
      real,dimension(91000) :: flux_highbal


      !Archivos de datos
      character(len=80) :: obj_name
      character(len=20) :: fe2_file
      character(len=21) :: output_err !fitting_err.dat
      character(len=22) :: output_data !fitting_data.dat
      character(len=30) :: output_file !fitting_results.dat
      character(len=22) :: output_err_csv !fitting_output_err.csv

      real :: s_powerlaw_file,s_fe2_size
  
      integer :: spec_size

      real :: anorm_pl_best,coef_anorm_pl !Powerlaw
      real :: slope1_best, coef_slope1
      real :: slope2_best, coef_slope2
      real :: wave_break_best, coef_wave_break

      real :: anorm_Fe2t_best,coef_anorm_Fe2t !FeII template UV
      real :: width_Fe2t_best,coef_width_Fe2t !FeII template UV
      real :: shift_Fe2t_best,coef_shift_Fe2t

      real :: anorm_Fe2t_opt_best,coef_anorm_Fe2t_opt !FeII template OPT

      real :: anorm_cii2326_best,coef_anorm_cii2326  !CII] 2326.44
      real :: width_cii2326_best, coef_width_cii2326
      real :: shift_cii2326_best,coef_shift_cii2326

      real :: anorm_neiv2423_best,coef_anorm_neiv2423  ![NIV] 2423.83
      real :: width_neiv2423_best, coef_width_neiv2423
      real :: shift_neiv2423_best,coef_shift_neiv2423

      real :: anorm_oii2471_best,coef_anorm_oii2471  ! [OII] 2471.03
      real :: width_oii2471_best, coef_width_oii2471
      real :: shift_oii2471_best,coef_shift_oii2471

      real :: anorm_alii2669_best,coef_anorm_alii2669  ! AlII] 2669.95
      real :: width_alii2669_best, coef_width_alii2669
      real :: shift_alii2669_best,coef_shift_alii2669

      real :: anorm_oiii2672_best,coef_anorm_oiii2672  ! OIII 2672.04
      real :: width_oiii2672_best, coef_width_oiii2672
      real :: shift_oiii2672_best,coef_shift_oiii2672

      real :: anorm_mg2a_best,coef_anorm_mg2a ! MgII A
      real :: width_mg2a_best, coef_width_mg2a
      real :: shift_mg2a_best,coef_shift_mg2a

      real :: anorm_mg2b_best,coef_anorm_mg2b ! MgII B
      real :: width_mg2b_best, coef_width_mg2b
      real :: shift_mg2b_best,coef_shift_mg2b

      real :: anorm_oiii3133_best,coef_anorm_oiii3133 !OIII 3133.70
      real :: width_oiii3133_best, coef_width_oiii3133
      real :: shift_oiii3133_best,coef_shift_oiii3133

      real :: anorm_hei3188_best,coef_anorm_hei3188 ! HeI 3188.67
      real :: width_hei3188_best, coef_width_hei3188
      real :: shift_hei3188_best,coef_shift_hei3188

      real :: anorm_nev3346_best,coef_anorm_nev3346 ! [N V] 3346.82
      real :: width_nev3346_best, coef_width_nev3346
      real :: shift_nev3346_best,coef_shift_nev3346

      real :: anorm_nev3426_best,coef_anorm_nev3426 ! [N V] 3426.84
      real :: width_nev3426_best, coef_width_nev3426
      real :: shift_nev3426_best,coef_shift_nev3426

      real :: anorm_fevii3587_best,coef_anorm_fevii3587 ! [FeII] 3587.34
      real :: width_fevii3587_best, coef_width_fevii3587
      real :: shift_fevii3587_best,coef_shift_fevii3587

      real :: anorm_hei3588_best,coef_anorm_hei3588 ! HeI 3588.30
      real :: width_hei3588_best, coef_width_hei3588
      real :: shift_hei3588_best,coef_shift_hei3588

      real :: anorm_oii3728_best,coef_anorm_oii3728 ![OII] 3728.48
      real :: width_oii3728_best, coef_width_oii3728
      real :: shift_oii3728_best,coef_shift_oii3728

      real :: anorm_fevii3759_best,coef_anorm_fevii3759 ! [FeVII] 3759.99
      real :: width_fevii3759_best, coef_width_fevii3759
      real :: shift_fevii3759_best,coef_shift_fevii3759

      real :: anorm_neiii3869_best,coef_anorm_neiii3869 !  [Ne III] 3869.85
      real :: width_neiii3869_best, coef_width_neiii3869
      real :: shift_neiii3869_best,coef_shift_neiii3869

      real :: anorm_hei3889_best,coef_anorm_hei3889 ! HeI 3889.74
      real :: width_hei3889_best, coef_width_hei3889
      real :: shift_hei3889_best,coef_shift_hei3889

      real :: anorm_h8_best,coef_anorm_h8 !H8
      real :: width_h8_best, coef_width_h8
      real :: shift_h8_best,coef_shift_h8

      real :: anorm_neiii3968_best,coef_anorm_neiii3968 ! [Ne III] 3968.58
      real :: width_neiii3968_best, coef_width_neiii3968
      real :: shift_neiii3968_best,coef_shift_neiii3968

      real :: anorm_hepsilon_best,coef_anorm_hepsilon ! H epsilon
      real :: width_hepsilon_best, coef_width_hepsilon
      real :: shift_hepsilon_best,coef_shift_hepsilon

      real :: anorm_fev4072_best,coef_anorm_fev4072 ![Fe V] 4072.39
      real :: width_fev4072_best, coef_width_fev4072
      real :: shift_fev4072_best,coef_shift_fev4072

      real :: anorm_sii4073_best,coef_anorm_sii4073 ! [SII] 4073.63
      real :: width_sii4073_best, coef_width_sii4073
      real :: shift_sii4073_best,coef_shift_sii4073

      real :: anorm_hdelta_best,coef_anorm_hdelta  !HdeltaBC
      real :: width_hdelta_best, coef_width_hdelta
      real :: shift_hdelta_best,coef_shift_hdelta
      real :: anorm_hdeltanc_best,coef_anorm_hdeltanc !HdeltaNC
      real :: width_hdeltanc_best, coef_width_hdeltanc
      real :: shift_hdeltanc_best,coef_shift_hdeltanc

      real :: anorm_hgamma_best,coef_anorm_hgamma !HgammaBC
      real :: width_hgamma_best, coef_width_hgamma
      real :: shift_hgamma_best,coef_shift_hgamma
      real :: anorm_hgammanc_best,coef_anorm_hgammanc !HgammaNC
      real :: width_hgammanc_best, coef_width_hgammanc
      real :: shift_hgammanc_best,coef_shift_hgammanc

      real :: anorm_oiii4363_best,coef_anorm_oiii4363 ![OIII]4363NC
      real :: width_oiii4363_best, coef_width_oiii4363
      real :: shift_oiii4363_best,coef_shift_oiii4363

      real :: anorm_hei4472_best,coef_anorm_hei4472 ! HeI 4472
      real :: width_hei4472_best, coef_width_hei4472
      real :: shift_hei4472_best,coef_shift_hei4472

      real :: anorm_heii4685_best,coef_anorm_heii4685 !HeII4685
      real :: width_heii4685_best, coef_width_heii4685
      real :: shift_heii4685_best,coef_shift_heii4685
      real :: anorm_heii4685nc_best,coef_anorm_heii4685nc !HeII4685NC
      real :: width_heii4685nc_best, coef_width_heii4685nc
      real :: shift_heii4685nc_best,coef_shift_heii4685nc

      real :: anorm_o3a_best,coef_anorm_o3a ! [OIII]5007 NC
      real :: width_o3a_best,coef_width_o3a
      real :: shift_o3a_best,coef_shift_o3a
      real :: anorm_o3b_best,coef_anorm_o3b ! [OIII]4959 NC
      real :: width_o3b_best,coef_width_o3b
      real :: shift_o3b_best,coef_shift_o3b

      real :: anorm_ni5200_best, coef_anorm_ni5200 ! [NI]5200 NC
      real :: width_ni5200_best,coef_width_ni5200
      real :: shift_ni5200_best,coef_shift_ni5200

      real :: anorm_hei5875_best,coef_anorm_hei5875 !HeI5875BC
      real :: width_hei5875_best, coef_width_hei5875
      real :: shift_hei5875_best,coef_shift_hei5875
      real :: anorm_hei5875nc_best,coef_anorm_hei5875nc !HeI5875NC
      real :: width_hei5875nc_best, coef_width_hei5875nc
      real :: shift_hei5875nc_best,coef_shift_hei5875nc

      real :: anorm_fevii6086_best,coef_anorm_fevii6086 ![FeVII]6086
      real :: width_fevii6086_best,coef_width_fevii6086
      real :: shift_fevii6086_best,coef_shift_fevii6086

      real :: anorm_o1a_best,coef_anorm_o1a ![OI]6302NC
      real :: width_o1a_best,coef_width_o1a
      real :: shift_o1a_best,coef_shift_o1a
      real :: anorm_o1b_best,coef_anorm_o1b ![OI]6365NC
      real :: width_o1b_best,coef_width_o1b
      real :: shift_o1b_best,coef_shift_o1b

      real :: anorm_n2a_best,coef_anorm_n2a ![NII6549]NC
      real :: width_n2a_best,coef_width_n2a
      real :: shift_n2a_best,coef_shift_n2a
      real :: anorm_n2b_best,coef_anorm_n2b ![NII6585]NC
      real :: width_n2b_best,coef_width_n2b
      real :: shift_n2b_best,coef_shift_n2b

      real :: anorm_fevii5160_best,coef_anorm_fevii5160 !FeVII 5160
      real :: width_fevii5160_best,coef_width_fevii5160
      real :: shift_fevii5160_best,coef_shift_fevii5160

      real :: anorm_fevi5177_best,coef_anorm_fevi5177 !FeVI 5177
      real :: width_fevi5177_best,coef_width_fevi5177
      real :: shift_fevi5177_best,coef_shift_fevi5177

      real :: anorm_ha_best,coef_anorm_ha  !HalphaBC
      real :: width_ha_best,coef_width_ha
      real :: shift_ha_best,coef_shift_ha
      
      real :: anorm_hanc_best,coef_anorm_hanc  !HalphaNC
      real :: width_hanc_best,coef_width_hanc
      real :: shift_hanc_best,coef_shift_hanc
      
      real :: anorm_ha2_best,coef_anorm_ha2  !Halpha extra component
      real :: width_ha2_best,coef_width_ha2
      real :: shift_ha2_best,coef_shift_ha2

      real :: anorm_s2a_best,coef_anorm_s2a ![SII]6718NC
      real :: width_s2a_best,coef_width_s2a
      real :: shift_s2a_best,coef_shift_s2a
      real :: anorm_s2b_best,coef_anorm_s2b ![SII]6732NC
      real :: width_s2b_best,coef_width_s2b
      real :: shift_s2b_best,coef_shift_s2b

      real :: anorm_mg2ae_best,coef_anorm_mg2ae ! MgII A extra
      real :: width_mg2ae_best, coef_width_mg2ae
      real :: shift_mg2ae_best,coef_shift_mg2ae

      real :: anorm_mg2be_best,coef_anorm_mg2be ! MgII B extra
      real :: width_mg2be_best, coef_width_mg2be
      real :: shift_mg2be_best,coef_shift_mg2be

      real :: anorm_hb_best,coef_anorm_hb  !Hbeta BC
      real :: width_hb_best,coef_width_hb
      real :: shift_hb_best,coef_shift_hb

      real :: anorm_hb2_best,coef_anorm_hb2  !Hbeta extra component
      real :: width_hb2_best,coef_width_hb2
      real :: shift_hb2_best,coef_shift_hb2

      real :: anorm_hbnc_best,coef_anorm_hbnc  !Hbeta NC
      real :: width_hbnc_best,coef_width_hbnc
      real :: shift_hbnc_best,coef_shift_hbnc

      real :: anorm_o3asb_best,coef_anorm_o3asb ! [OIII]5007SB
      real :: width_o3asb_best,coef_width_o3asb
      real :: shift_o3asb_best,coef_shift_o3asb
      real :: anorm_o3bsb_best,coef_anorm_o3bsb ! [OIII]4959SB
      real :: width_o3bsb_best,coef_width_o3bsb
      real :: shift_o3bsb_best,coef_shift_o3bsb

      real :: anorm_s2asb_best,coef_anorm_s2asb ![SII]6718 SB
      real :: width_s2asb_best,coef_width_s2asb
      real :: shift_s2asb_best,coef_shift_s2asb
      real :: anorm_s2bsb_best,coef_anorm_s2bsb ![SII]6732 SB
      real :: width_s2bsb_best,coef_width_s2bsb
      real :: shift_s2bsb_best,coef_shift_s2bsb

      real :: anorm_balcont_best,coef_anorm_balcont !Balmer cont
      real :: anorm_highbal_best,coef_anorm_highbal !high order Balmer 
      real :: smear_vel_highbal		    !width balmer

      real :: anorm_hei7067_best,coef_anorm_hei7067
      real :: width_hei7067_best,coef_width_hei7067
      real :: shift_hei7067_best,coef_shift_hei7067
      real :: anorm_ariii7138_best,coef_anorm_ariii7138
      real :: width_ariii7138_best,coef_width_ariii7138
      real :: shift_ariii7138_best,coef_shift_ariii7138
      real :: anorm_oii7321_best,coef_anorm_oii7321
      real :: width_oii7321_best,coef_width_oii7321
      real :: shift_oii7321_best,coef_shift_oii7321
      real :: anorm_niiii7892_best,coef_anorm_niiii7892
      real :: width_niiii7892_best,coef_width_niiii7892
      real :: shift_niiii7892_best,coef_shift_niiii7892
      real :: anorm_fexi7894_best,coef_anorm_fexi7894
      real :: width_fexi7894_best,coef_width_fexi7894
      real :: shift_fexi7894_best,coef_shift_fexi7894

      real :: iter_accuracy_loop_max
      real :: aa,bb,cc,i1,i2

      real :: start, finish

c     Constants
      real,parameter :: c=2.99792458e5
      real,parameter :: cen_hb = 4862.68       ! Hb
      real,parameter :: cen_o3a = 5008.24      ! [OIII] doublet
      real,parameter :: cen_o3b = 4960.3       ! [OIII] doublet
      real,parameter :: cen_fevii5160 = 5160.33      ! [FeVII]
      real,parameter :: cen_fevi5177 = 5177.48      ! [FeVI]
      real,parameter :: cen_heii4685 = 4687.02          ! HeII

      real,parameter :: cen_ha = 6564.61       ! Ha
      real,parameter :: cen_o1a = 6302.05      ! [OI] doublet
      real,parameter :: cen_o1b = 6365.54      ! [OI] doublet
      real,parameter :: cen_n2b = 6549.85      ! [NII] doublet
      real,parameter :: cen_n2a = 6585.28      ! [NII]
      real,parameter :: cen_s2a = 6718.29      ! [SII] doublet
      real,parameter :: cen_s2b = 6732.67      ! [SII]

      real,parameter :: cen_hdelta = 4102.89        ! Hdelta
      real,parameter :: cen_hgamma = 4341.68        ! Hgamma
      real,parameter :: cen_hei5875 = 5877.29       ! HeI5875
      real,parameter :: cen_hei7067 = 7067.20       ! HeI7067
      real,parameter :: cen_oiii4363 = 4364.44      ! [OII]4364.44
      real,parameter :: cen_fevii6086 = 6087.98     ! [FeVII]6086
      real,parameter :: cen_ni5200 = 5200.53        ! [NI]5200
      real,parameter :: cen_ni7889 = 7892.10        ! [NiIII]7889
      real,parameter :: cen_hei4472= 4472.76       ! HeI 4472.76

      real,parameter :: cen_cii2326 = 2326.44        ! CII] 2326.44
      real,parameter :: cen_neiv2423 = 2423.83       ! [NIV] 2423.83
      real,parameter :: cen_oii2471 = 2471.03        ! [OII] 2471.03
      real,parameter :: cen_alii2669 = 2669.95       ! [AlII] 2669.95
      real,parameter :: cen_oiii2672 = 2672.04       ! OIII 2672.04
      real,parameter :: cen_mg2a = 2796.35           ! MgII
      real,parameter :: cen_mg2b = 2803.53           ! MgII
      real,parameter :: cen_oiii3133 = 3133.70       ! OIII 3133.70
      real,parameter :: cen_hei3188 = 3188.67        ! HeI 3188.67
      real,parameter :: cen_nev3346 = 3346.82        ! [Ne V] 3346.82
      real,parameter :: cen_nev3426 = 3426.84        ! [Ne V] 3426.82
      real,parameter :: cen_fevii3587 = 3587.34      ! [FeVII] 3587.34
      real,parameter :: cen_hei3588 = 3588.30        ! HeI 3588.30
      real,parameter :: cen_oii3728 = 3728.48        ! [OI] 3728.48
      real,parameter :: cen_fevii3759 = 3759.99      ! [FeVII] 3759.99
      real,parameter :: cen_neiii3869 = 3869.85   ! [Neiii] 3869.85
      real,parameter :: cen_hei3889 = 3889.74         ! HeI 3889.74
      real,parameter :: cen_h8 = 3890.15             ! H8 3890.15
      real,parameter :: cen_neiii3968 = 3968.58      ! [Ne III] 3968.58
      real,parameter :: cen_hepsilon = 3971.20       ! Hepsilon 3971.20
      real,parameter :: cen_fev4072 = 4072.39        ! [FeV] 4072.39
      real,parameter :: cen_sii4073 = 4073.63        ! [SII] 4073.63

      real,parameter :: cen_ariii7138 = 7138.80        ! [ArIII] 7138.80 coronal
      real,parameter :: cen_oii7321 = 7321.48        ! [OII] 7321.80 delgada 
      real,parameter :: cen_niiii7892 = 7892.10        ! [Ni III] 7892.10 delgada
      real,parameter :: cen_fexi7894 = 7894.0        ! [FeXI] 7894.0 coronal

      real,parameter :: par_free = 90         !Free parameters

      real,parameter :: conf_sigma = 85.4381036895423

      real,parameter :: fwhm_max_bc = 8000.
      real,parameter :: fwhm_max_nc = 900.
      real,parameter :: fwhm_max_sbbc = 4500.
      real,parameter :: fwhm_ave_sbbc = 2000.
      real,parameter :: fwhm_ave_bc = 2500.
      real,parameter :: flux_ave = 6.0
      real,parameter :: nc_max = 900.
      real,parameter :: bc_max = 12000.
      real,parameter :: fwhm_ave_nc = 500.

      !Limites lineas
	real,parameter :: max_hb = 1500.
	real,parameter :: min_hb = 400.
        real,parameter :: min_o3=500.
        real,parameter :: max_o3=1200.
        real,parameter :: max_balcont=6.
        real,parameter :: max_highbal=6.
        real,parameter :: max_fe2=5.
        real,parameter :: min_fe2=10.

      real,parameter :: ratio_o3 = 3.
      real,parameter :: ratio_n2 = 3.
      real,parameter :: ratio_o1 = 3.
      real,parameter :: ratio_mg2 = 1.25


      real :: err_model

      integer :: idum   ! MCMC

      integer :: ile_matrix
      integer :: ile_sim
      integer,parameter :: ile_params=100
      real,allocatable,dimension(:,:) :: matrix_chi2 !  ERROR

      real :: norm_factor

      integer :: kmax

	! Botones de encendido y apagado
      integer :: on_pl
      integer :: on_highbal
      integer :: on_balcont
      integer :: on_fe2uv
      integer :: on_fe2opt
      integer :: on_hb
      integer :: on_hdelta
      integer :: on_hgamma
      integer :: on_h8
      integer :: on_hepsilon
      integer :: on_aliii2669
      integer :: on_cii2326
      integer :: on_mg2a
      integer :: on_oiii2672
      integer :: on_oiii3133
      integer :: on_heii4685
      integer :: on_hei3188
      integer :: on_hei3588
      integer :: on_hei3889
      integer :: on_hei5875
      integer :: on_hei4472
      integer :: on_hei7067
      integer :: on_o3a
      integer :: on_hbnc
      integer :: on_heii4685nc
      integer :: on_oiii4363
      integer :: on_ni5200
      integer :: on_neiv2423
      integer :: on_oii2471
      integer :: on_nev3346
      integer :: on_oii3728
      integer :: on_neiii3968
      integer :: on_neiii3869
      integer :: on_fev4072
      integer :: on_sii4073
      integer :: on_hgammanc
      integer :: on_hdeltanc
      integer :: on_nev3426
      integer :: on_fevii3587
      integer :: on_fevii3759
      integer :: on_fevii5160
      integer :: on_fevi5177
      integer :: on_fexi7894
      integer :: on_fevii6086
      integer :: on_ha
      integer :: on_hanc
      integer :: on_s2a
      integer :: on_s2b
      integer :: on_o1a
      integer :: on_n2a
      integer :: on_niiii7892
      integer :: on_ariii7138
      integer :: on_oii7321
      integer :: on_hb2
      integer :: on_mg2ae
      integer :: on_o3asb
      integer :: on_ha2
      integer :: on_s2asb
      integer :: on_s2bsb

      contains

      subroutine input_params()

       open(unit=12,file='input2.dat',status='old')

       read(12,'(A80)')obj_name           !0
       read(12,*)iter_max                 !1
       read(12,*)iter_accuracy_loop_max   !2
       read(12,'(A22)')spec_file          !3, dspec+err.txt
       read(12,*)spec_size                !4
       read(12,'(A30)')output_file        !5, fitting_results.dat
       read(12,'(A22)')output_data        !6, fitting_data.dat
       read(12,'(A21)')output_err         !7, fitting_err.dat 
       read(12,*)redshift 		  !8
       read(12,*)i1 			  !9
       read(12,*)i2 			  !10
       read(12,*)anorm_pl_best	          !11
       read(12,*)coef_anorm_pl    	  !12
       read(12,*)slope1_best		  !13
       read(12,*)coef_slope1		  !14
       read(12,*)slope2_best		  !15
       read(12,*)coef_slope2		  !16
       read(12,*)wave_break_best	  !17
       read(12,*)coef_wave_break	  !18
       read(12,'(A12)')fe2t_data		  !19
       read(12,*)fe2t_size		  !20
       read(12,*)anorm_Fe2t_best 	  !21
       read(12,*)coef_anorm_Fe2t 	  !22
       read(12,*)smear_vel_fe2t    	  !23
       read(12,*)coef_width_Fe2t          !24
       read(12,*)shift_Fe2t_best 	  !25
       read(12,*)coef_shift_Fe2t    	  !26
       read(12,*)anorm_cii2326_best       !27 CII] 2326.44
       read(12,*)coef_anorm_cii2326 	  !28
       read(12,*)width_cii2326_best    	  !29
       read(12,*)coef_width_cii2326	  !30
       read(12,*)shift_cii2326_best 	  !31
       read(12,*)coef_shift_cii2326    	  !32
       read(12,*)anorm_neiv2423_best      !33 [NIV] 2423.83
       read(12,*)coef_anorm_neiv2423 	  !34
       read(12,*)width_neiv2423_best      !35
       read(12,*)coef_width_neiv2423	  !36
       read(12,*)shift_neiv2423_best 	  !37
       read(12,*)coef_shift_neiv2423      !38
       read(12,*)anorm_ oii2471_best      !39 [OII] 2471.03
       read(12,*)coef_anorm_ oii2471 	  !40
       read(12,*)width_ oii2471_best      !41
       read(12,*)coef_width_ oii2471	  !42
       read(12,*)shift_ oii2471_best 	  !43
       read(12,*)coef_shift_ oii2471      !44
       read(12,*)anorm_alii2669_best      !45 AlII] 2669.95
       read(12,*)coef_anorm_alii2669 	  !46
       read(12,*)width_alii2669_best      !47
       read(12,*)coef_width_alii2669	  !48
       read(12,*)shift_alii2669_best 	  !49
       read(12,*)coef_shift_alii2669      !50
       read(12,*)anorm_oiii2672_best      !51 OIII 2672.04
       read(12,*)coef_anorm_oiii2672 	  !52
       read(12,*)width_oiii2672_best      !53
       read(12,*)coef_width_oiii2672	  !54
       read(12,*)shift_oiii2672_best 	  !55
       read(12,*)coef_shift_oiii2672      !56
       read(12,*)anorm_mg2a_best          !57 MgII A
       read(12,*)coef_anorm_mg2a 	  !58
       read(12,*)width_mg2a_best          !59
       read(12,*)coef_width_mg2a	  !60
       read(12,*)shift_mg2a_best 	  !61
       read(12,*)coef_shift_mg2a          !62
       read(12,*)anorm_mg2b_best          !63 MgII B
       read(12,*)coef_anorm_mg2b 	  !64
       read(12,*)width_mg2b_best          !65
       read(12,*)coef_width_mg2b	  !66
       read(12,*)shift_mg2b_best 	  !67
       read(12,*)coef_shift_mg2b          !68
       read(12,*)anorm_oiii3133_best      !69 OIII 3133.70
       read(12,*)coef_anorm_oiii3133 	  !70
       read(12,*)width_oiii3133_best      !71
       read(12,*)coef_width_oiii3133	  !72
       read(12,*)shift_oiii3133_best 	  !73
       read(12,*)coef_shift_oiii3133      !74
       read(12,*)anorm_hei3188_best       !75 HeI 3188.67
       read(12,*)coef_anorm_hei3188       !76
       read(12,*)width_hei3188_best       !77
       read(12,*)coef_width_hei3188	  !78
       read(12,*)shift_hei3188_best       !79
       read(12,*)coef_shift_hei3188       !80
       read(12,*)anorm_nev3346_best       !81 [N V] 3346.82 coronal
       read(12,*)coef_anorm_nev3346 	  !82
       read(12,*)width_nev3346_best       !83
       read(12,*)coef_width_nev3346	  !84
       read(12,*)shift_nev3346_best 	  !85
       read(12,*)coef_shift_nev3346       !86
       read(12,*)anorm_nev3426_best       !87 [N V] 3426.84 
       read(12,*)coef_anorm_nev3426 	  !88
       read(12,*)width_nev3426_best       !89
       read(12,*)coef_width_nev3426	  !90
       read(12,*)shift_nev3426_best 	  !91
       read(12,*)coef_shift_nev3426       !92
       read(12,*)anorm_fevii3587_best     !93 [FeII] 3587.34 
       read(12,*)coef_anorm_fevii3587 	  !94
       read(12,*)width_fevii3587_best     !95
       read(12,*)coef_width_fevii3587	  !96
       read(12,*)shift_fevii3587_best 	  !97
       read(12,*)coef_shift_fevii3587     !98
       read(12,*)anorm_hei3588_best       !99 HeI 3588.30
       read(12,*)coef_anorm_hei3588 	  !100
       read(12,*)width_hei3588_best       !101
       read(12,*)coef_width_hei3588	  !102
       read(12,*)shift_hei3588_best 	  !103
       read(12,*)coef_shift_hei3588       !104
       read(12,*)anorm_oii3728_best       !105  [OII] 3728.48
       read(12,*)coef_anorm_oii3728 	  !106
       read(12,*)width_oii3728_best       !107
       read(12,*)coef_width_oii3728	  !108
       read(12,*)shift_oii3728_best 	  !109
       read(12,*)coef_shift_oii3728       !110
       read(12,*)anorm_fevii3759_best     !111 [FeVII] 3759.99 coronal
       read(12,*)coef_anorm_fevii3759 	  !112
       read(12,*)width_fevii3759_best     !113
       read(12,*)coef_width_fevii3759	  !114
       read(12,*)shift_fevii3759_best 	  !115
       read(12,*)coef_shift_fevii3759     !116
       read(12,*)anorm_neiii3869_best     !117 [Ne III] 3869.85
       read(12,*)coef_anorm_neiii3869 	  !118
       read(12,*)width_neiii3869_best     !119
       read(12,*)coef_width_neiii3869	  !120
       read(12,*)shift_neiii3869_best 	  !121
       read(12,*)coef_shift_neiii3869     !122
       read(12,*)anorm_hei3889_best       !123 HeI 3889.74
       read(12,*)coef_anorm_hei3889 	  !124
       read(12,*)width_hei3889_best       !125
       read(12,*)coef_width_hei3889	  !126
       read(12,*)shift_hei3889_best 	  !127
       read(12,*)coef_shift_hei3889       !128
       read(12,*)anorm_h8_best            !129 H8 3890.15
       read(12,*)coef_anorm_h8 	          !130
       read(12,*)width_h8_best            !131
       read(12,*)coef_width_h8	          !132
       read(12,*)shift_h8_best 	          !133
       read(12,*)coef_shift_h8            !134
       read(12,*)anorm_neiii3968_best     !135 [Ne III] 3968.58
       read(12,*)coef_anorm_neiii3968 	  !136
       read(12,*)width_neiii3968_best     !137
       read(12,*)coef_width_neiii3968	  !138
       read(12,*)shift_neiii3968_best 	  !139
       read(12,*)coef_shift_neiii3968     !140
       read(12,*)anorm_hepsilon_best      !141 H epsilon 3971.20
       read(12,*)coef_anorm_hepsilon 	  !142
       read(12,*)width_hepsilon_best      !143
       read(12,*)coef_width_hepsilon	  !144
       read(12,*)shift_hepsilon_best 	  !145
       read(12,*)coef_shift_hepsilon      !146
       read(12,*)anorm_fev4072_best       !147 [Fe V] 4072.39
       read(12,*)coef_anorm_fev4072 	  !148
       read(12,*)width_fev4072_best       !149
       read(12,*)coef_width_fev4072	  !150
       read(12,*)shift_fev4072_best 	  !151
       read(12,*)coef_shift_fev4072       !152
       read(12,*)anorm_sii4073_best       !153 [SII] 4073.63
       read(12,*)coef_anorm_sii4073 	  !154
       read(12,*)width_sii4073_best       !155
       read(12,*)coef_width_sii4073	  !156
       read(12,*)shift_sii4073_best 	  !157
       read(12,*)coef_shift_sii4073       !158
       read(12,*)anorm_hdelta_best        !159 Hdelta 4102.89
       read(12,*)coef_anorm_hdelta 	  !160
       read(12,*)width_hdelta_best    	  !161
       read(12,*)coef_width_hdelta	  !162
       read(12,*)shift_hdelta_best 	  !163
       read(12,*)coef_shift_hdelta    	  !164
       read(12,*)anorm_hdeltanc_best      !165 Hdelta NC  4102.89
       read(12,*)coef_anorm_hdeltanc      !166
       read(12,*)width_hdeltanc_best      !167
       read(12,*)coef_width_hdeltanc      !168
       read(12,*)shift_hdeltanc_best      !169
       read(12,*)coef_shift_hdeltanc      !170
       read(12,*)anorm_hgamma_best        !171 Hgamma
       read(12,*)coef_anorm_hgamma 	  !172
       read(12,*)width_hgamma_best    	  !173
       read(12,*)coef_width_hgamma	  !174
       read(12,*)shift_hgamma_best    	  !175
       read(12,*)coef_shift_hgamma    	  !176
       read(12,*)anorm_hgammanc_best      !177 Hgamma NC 
       read(12,*)coef_anorm_hgammanc      !178
       read(12,*)width_hgammanc_best      !179
       read(12,*)coef_width_hgammanc      !180
       read(12,*)shift_hgammanc_best      !181
       read(12,*)coef_shift_hgammanc      !182
       read(12,*)anorm_oiii4363_best      !183 [OIII]4363NC
       read(12,*)coef_anorm_oiii4363      !184
       read(12,*)width_oiii4363_best      !185
       read(12,*)coef_width_oiii4363      !186
       read(12,*)shift_oiii4363_best      !187
       read(12,*)coef_shift_oiii4363      !188
       read(12,*)anorm_hei4472_best       !189 HeI 4472
       read(12,*)coef_anorm_hei4472 	  !190
       read(12,*)width_hei4472_best    	  !191
       read(12,*)coef_width_hei4472	  !192
       read(12,*)shift_hei4472_best    	  !193
       read(12,*)coef_shift_hei4472    	  !194
       read(12,*)anorm_heii4685_best      !195 HeII4685 
       read(12,*)coef_anorm_heii4685      !196
       read(12,*)width_heii4685_best      !197
       read(12,*)coef_width_heii4685      !198
       read(12,*)shift_heii4685_best      !199
       read(12,*)coef_shift_heii4685      !200
       read(12,*)anorm_heii4685nc_best    !201 HeII4685NC 
       read(12,*)coef_anorm_heii4685nc    !202
       read(12,*)width_heii4685nc_best    !203
       read(12,*)coef_width_heii4685nc    !204
       read(12,*)shift_heii4685nc_best    !205
       read(12,*)coef_shift_heii4685nc    !206
       read(12,*)anorm_hb_best    	  !207  Hbeta BC
       read(12,*)coef_anorm_hb    	  !208
       read(12,*)width_hb_best     	  !209
       read(12,*)coef_width_hb   	  !210
       read(12,*)shift_hb_best     	  !211
       read(12,*)coef_shift_hb     	  !212
       read(12,*)anorm_hbnc_best  	  !213 Hbeta NC 
       read(12,*)coef_anorm_hbnc          !214
       read(12,*)width_hbnc_best          !215
       read(12,*)coef_width_hbnc          !216
       read(12,*)shift_hbnc_best          !217
       read(12,*)coef_shift_hbnc          !218
       read(12,*)anorm_o3a_best           !219 OIII5007NC 
       read(12,*)coef_anorm_o3a           !220
       read(12,*)width_o3a_best           !221
       read(12,*)coef_width_o3a           !222
       read(12,*)shift_o3a_best           !223
       read(12,*)coef_shift_o3a           !224
       read(12,*)anorm_o3b_best	          !225 OIII4959NC 
       read(12,*)coef_anorm_o3b           !226
       read(12,*)width_o3b_best           !227
       read(12,*)coef_width_o3b           !228
       read(12,*)shift_o3b_best           !229
       read(12,*)coef_shift_o3b           !230
       read(12,*)anorm_fevii5160_best     !231 FeVII5160 coronal
       read(12,*)coef_anorm_fevii5160     !232
       read(12,*)width_fevii5160_best     !233
       read(12,*)coef_width_fevii5160     !234
       read(12,*)shift_fevii5160_best     !235
       read(12,*)coef_shift_fevii5160     !236
       read(12,*)anorm_fevi5177_best      !237 FeVI5177 coronal 
       read(12,*)coef_anorm_fevi5177      !238
       read(12,*)width_fevi5177_best      !239
       read(12,*)coef_width_fevi5177      !240
       read(12,*)shift_fevi5177_best      !241
       read(12,*)coef_shift_fevi5177      !242
       read(12,*)anorm_ni5200_best        !243 [NI]5200NC 
       read(12,*)coef_anorm_ni5200        !244
       read(12,*)width_ni5200_best        !245
       read(12,*)coef_width_ni5200        !246
       read(12,*)shift_ni5200_best        !247
       read(12,*)coef_shift_ni5200        !248
       read(12,*)anorm_hei5875_best            !249 HeII5875 
       read(12,*)coef_anorm_hei5875            !250
       read(12,*)width_hei5875_best            !251
       read(12,*)coef_width_hei5875            !252
       read(12,*)shift_hei5875_best            !253
       read(12,*)coef_shift_hei5875            !254
       read(12,*)anorm_hei5875nc_best          !255 HeII5875NC 
       read(12,*)coef_anorm_hei5875nc          !256
       read(12,*)width_hei5875nc_best          !257
       read(12,*)coef_width_hei5875nc          !258
       read(12,*)shift_hei5875nc_best          !259
       read(12,*)coef_shift_hei5875nc          !260
       read(12,*)anorm_fevii6086_best          !261 [FeVII]6086NC coronal 
       read(12,*)coef_anorm_fevii6086          !262
       read(12,*)width_fevii6086_best          !263
       read(12,*)coef_width_fevii6086          !264
       read(12,*)shift_fevii6086_best          !265
       read(12,*)coef_shift_fevii6086          !266
       read(12,*)anorm_o1a_best	               !267 [OI]6300NC 
       read(12,*)coef_anorm_o1a                !268
       read(12,*)width_o1a_best                !269
       read(12,*)coef_width_o1a                !270
       read(12,*)shift_o1a_best                !271
       read(12,*)coef_shift_o1a                !272
       read(12,*)anorm_o1b_best	               !273 [OI]6365NC 
       read(12,*)coef_anorm_o1b                !274
       read(12,*)width_o1b_best                !275
       read(12,*)coef_width_o1b                !276
       read(12,*)shift_o1b_best                !277
       read(12,*)coef_shift_o1b                !278
       read(12,*)anorm_n2b_best	               !279  [NII]6548NC 
       read(12,*)coef_anorm_n2b                !280
       read(12,*)width_n2b_best                !281
       read(12,*)coef_width_n2b                !282
       read(12,*)shift_n2b_best                !283
       read(12,*)coef_shift_n2b                !284
       read(12,*)anorm_n2a_best	               !285 [NII]6583NC 
       read(12,*)coef_anorm_n2a                !286
       read(12,*)width_n2a_best                !287
       read(12,*)coef_width_n2a                !288
       read(12,*)shift_n2a_best                !289
       read(12,*)coef_shift_n2a                !290
       read(12,*)anorm_ha_best	       	       !291 Halpha BC
       read(12,*)coef_anorm_ha                 !292
       read(12,*)width_ha_best                 !293
       read(12,*)coef_width_ha                 !294
       read(12,*)shift_ha_best                 !295
       read(12,*)coef_shift_ha                 !296
       read(12,*)anorm_hanc_best               !297 Halpha NC 
       read(12,*)coef_anorm_hanc               !298
       read(12,*)width_hanc_best               !299
       read(12,*)coef_width_hanc               !300
       read(12,*)shift_hanc_best               !301
       read(12,*)coef_shift_hanc               !302
       read(12,*)anorm_s2a_best	               !303 [SII]6717NC 
       read(12,*)coef_anorm_s2a                !304
       read(12,*)width_s2a_best                !305
       read(12,*)coef_width_s2a                !306
       read(12,*)shift_s2a_best                !307
       read(12,*)coef_shift_s2a                !308
       read(12,*)anorm_s2b_best	               !309 [SII]6731NC 
       read(12,*)coef_anorm_s2b                !310
       read(12,*)width_s2b_best                !311
       read(12,*)coef_width_s2b                !312
       read(12,*)shift_s2b_best                !313
       read(12,*)coef_shift_s2b                !314
       read(12,*)anorm_mg2ae_best              !315 MgII A extra
       read(12,*)coef_anorm_mg2ae 	       !316
       read(12,*)width_mg2ae_best              !317
       read(12,*)coef_width_mg2ae	       !318
       read(12,*)shift_mg2ae_best 	       !319
       read(12,*)coef_shift_mg2ae              !320
       read(12,*)anorm_mg2be_best              !321 MgII B extra
       read(12,*)coef_anorm_mg2be 	       !322
       read(12,*)width_mg2be_best              !323
       read(12,*)coef_width_mg2be	       !324
       read(12,*)shift_mg2be_best 	       !325
       read(12,*)coef_shift_mg2be              !326
       read(12,*)anorm_hb2_best                !327 Hbeta extra
       read(12,*)coef_anorm_hb2                !328
       read(12,*)width_hb2_best                !329
       read(12,*)coef_width_hb2                !330
       read(12,*)shift_hb2_best                !331
       read(12,*)coef_shift_hb2                !332
       read(12,*)anorm_ha2_best                !333 Halpha extra
       read(12,*)coef_anorm_ha2                !334
       read(12,*)width_ha2_best                !335
       read(12,*)coef_width_ha2                !336
       read(12,*)shift_ha2_best                !337
       read(12,*)coef_shift_ha2                !338
       read(12,*)anorm_o3asb_best               !339 [OIII]5007 SB
       read(12,*)coef_anorm_o3asb               !340
       read(12,*)width_o3asb_best               !341
       read(12,*)coef_width_o3asb               !342
       read(12,*)shift_o3asb_best               !343
       read(12,*)coef_shift_o3asb               !344
       read(12,*)anorm_o3bsb_best               !345 [OIII]4959 SB
       read(12,*)coef_anorm_o3bsb               !346
       read(12,*)width_o3bsb_best               !347
       read(12,*)coef_width_o3bsb               !348
       read(12,*)shift_o3bsb_best               !349
       read(12,*)coef_shift_o3bsb               !350
       read(12,*)anorm_s2asb_best               !351 [SII]6717 SB
       read(12,*)coef_anorm_s2asb               !352
       read(12,*)width_s2asb_best               !353
       read(12,*)coef_width_s2asb               !354
       read(12,*)shift_s2asb_best               !355
       read(12,*)coef_shift_s2asb               !356
       read(12,*)anorm_s2bsb_best               !357 [SII]6732 SB
       read(12,*)coef_anorm_s2bsb               !358
       read(12,*)width_s2bsb_best               !359
       read(12,*)coef_width_s2bsb               !360
       read(12,*)shift_s2bsb_best               !361
       read(12,*)coef_shift_s2bsb               !362
       read(12,'(A22)')output_err_csv           !363 fitting_output_err.csv
       read(12,'(A11)')balcont_data             !364, Balmer continuum file
       read(12,*)balcont_size			!365
       read(12,*)anorm_balcont_best             !366 flux balmer continuum 
       read(12,*)coef_anorm_balcont             !367 
       read(12,'(A11)')highbal_data             !368, dspec+err.txt
       read(12,*)highbal_size			!369
       read(12,*)anorm_highbal_best             !370 flux balmer continuum file
       read(12,*)coef_anorm_highbal             !371 
       read(12,*)smear_vel_highbal              !372 
       read(12,'(A16)')fe2t_opt_data		!373
       read(12,*)fe2t_opt_size		        !374
       read(12,*)anorm_Fe2t_opt_best 	        !375
       read(12,*)coef_anorm_Fe2t_opt 	        !376
       read(12,*)anorm_hei7067_best             !377 HeI7067.20
       read(12,*)coef_anorm_hei7067             !378
       read(12,*)width_hei7067_best             !379
       read(12,*)coef_width_hei7067             !380
       read(12,*)shift_hei7067_best             !381
       read(12,*)coef_shift_hei7067             !382
       read(12,*)anorm_ariii7138_best           !383 [ArIII] 7138
       read(12,*)coef_anorm_ariii7138           !384
       read(12,*)width_ariii7138_best           !385
       read(12,*)coef_width_ariii7138           !386
       read(12,*)shift_ariii7138_best           !387
       read(12,*)coef_shift_ariii7138           !388
       read(12,*)anorm_oii7321_best             !389 [OII] 7321
       read(12,*)coef_anorm_oii7321             !390
       read(12,*)width_oii7321_best             !391
       read(12,*)coef_width_oii7321             !392
       read(12,*)shift_oii7321_best             !393
       read(12,*)coef_shift_oii7321             !394
       read(12,*)anorm_niiii7892_best           !395 [NiIII] 7892
       read(12,*)coef_anorm_niiii7892           !396
       read(12,*)width_niiii7892_best           !397
       read(12,*)coef_width_niiii7892           !398
       read(12,*)shift_niiii7892_best           !399
       read(12,*)coef_shift_niiii7892           !400
       read(12,*)anorm_fexi7894_best            !401 [FeXI]7894 coronal 
       read(12,*)coef_anorm_fexi7894            !402
       read(12,*)width_fexi7894_best            !403
       read(12,*)coef_width_fexi7894            !404
       read(12,*)shift_fexi7894_best            !405
       read(12,*)coef_shift_fexi7894            !406
       read(12,*)on_pl    		 	! 407
       read(12,*)on_highbal 			! 408  
       read(12,*)on_balcont			! 409  
       read(12,*)on_fe2opt			! 410  
       read(12,*)on_fe2uv			! 411  
       read(12,*)on_hb  			! 412  
       read(12,*)on_hdelta 			! 413 
       read(12,*)on_hgamma 			! 414  
       read(12,*)on_h8				! 415  
       read(12,*)on_hepsilon 			! 416  
       read(12,*)on_aliii2669			! 417  
       read(12,*)on_cii2326			! 418  
       read(12,*)on_mg2a			! 419  
       read(12,*)on_oiii2672			! 420  
       read(12,*)on_oiii3133 			! 421  
       read(12,*)on_heii4685			! 422  
       read(12,*)on_hei3188			! 423  
       read(12,*)on_hei3588 			! 424  
       read(12,*)on_hei3889  			! 425  
       read(12,*)on_hei5875  			! 426  
       read(12,*)on_hei4472 			! 427 
       read(12,*)on_hei7067			! 428 
       read(12,*)on_o3a				! 429 
       read(12,*)on_hbnc			! 430  
       read(12,*)on_heii4685nc 			! 431  
       read(12,*)on_oiii4363 			! 432  
       read(12,*)on_ni5200 			! 433  
       read(12,*)on_neiv2423 			! 434  
       read(12,*)on_oii2471  			! 435  
       read(12,*)on_nev3346 			! 436 
       read(12,*)on_oii3728  			! 437  
       read(12,*)on_neiii3968			! 438 
       read(12,*)on_neiii3869 			! 439  
       read(12,*)on_fev4072 			! 440  
       read(12,*)on_sii4073 			! 441  
       read(12,*)on_hgammanc 			! 442  
       read(12,*)on_hdeltanc 			! 443 
       read(12,*)on_nev3426 			! 444  
       read(12,*)on_fevii3587 			! 445  
       read(12,*)on_fevii3759 			! 446  
       read(12,*)on_fevii5160 			! 447
       read(12,*)on_fevi5177			! 448  
       read(12,*)on_fexi7894  			! 449 
       read(12,*)on_fevii6086 			! 450  
       read(12,*)on_ha	 			! 451 
       read(12,*)on_hanc 			! 452 
       read(12,*)on_s2a		 		! 453  
       read(12,*)on_s2b 		 	! 454 
       read(12,*)on_o1a  			! 455  
       read(12,*)on_n2a 			! 456  
       read(12,*)on_niiii7892			! 457 
       read(12,*)on_ariii7138 			! 458  
       read(12,*)on_oii7321			! 459  
       read(12,*)on_hb2				! 460  
       read(12,*)on_mg2ae 			! 461  
       read(12,*)on_o3asb			! 462 
       read(12,*)on_ha2  			! 463  
       read(12,*)on_s2asb			! 464  
       read(12,*)on_s2bsb 			! 465  
       read(12,*)norm_factor	                ! 466 flux normalization factor 


       print *, '', obj_name	    !Name
       print *, 'z:', redshift	  

c       print *, 'mg_values',anorm_mg2a_best,width_mg2a_best,
c     *		shift_mg2a_best
c       print *, 'norm_factor: ',norm_factor
c       print *, 'spec_file: ',spec_file
c       print *, 'hdelta',anorm_hdelta_best
c       print *, 'hgamma',anorm_hgamma_best
c       print *, 'he4685_follow',anorm_heii4685nc_best
c       print *, 'fe2_temp',anorm_Fe2t_best
c       print *, 'flux_hbnc',anorm_hbnc_best
c       print *, 'flux_o3a',anorm_o3a_best


       ile_sim = iter_accuracy_loop_max*iter_max+iter_max
       !print *, 'ile_sim',ile_sim,iter_accuracy_loop_max,iter_max

       allocate(matrix_chi2(ile_sim,ile_params))

       return
       deallocate(matrix_chi2)

      end subroutine input_params

      end module params


      module one_spec
      use params
      implicit none

      real,dimension(91000) :: f
      real,dimension(91000) :: b

      integer :: k_os,jmax

      contains

      subroutine obs_file()

       open(unit=11,file=spec_file,status='old')
       do k_os=1,spec_size
          read(11,*,end=438) vlam(k_os),flux(k_os),
     *                      err_flux(k_os)
c	      !print *,'input file',k_os,vlam(k_os),flux(k_os),
c     *              err_flux(k_os)
       end do



 438   jmax = k_os - 1

       print *,'Reading done '
       print *,'jmax',jmax
       close(11)

       return
       end subroutine obs_file

      end module one_spec




      subroutine fit_auto_mcmc
       use params
       use one_spec
       implicit none

       real:: accuracy_factor
       integer:: ile_accuracy_loop
       real :: chi2_best
       integer :: ile_big_loop
       real :: chi2_best_old, chi2, shift
       real :: z

       real :: gasdev

       real :: step_Fe2t
       real :: step_Fe2t_opt
       real :: step_width_Fe2t  
       real :: step_shift_Fe2t  
       real :: step_pl
       real :: step_slope1
       real :: step_slope2
       real :: step_wave_break
       real :: step_anorm_cii2326
       real :: step_width_cii2326
       real :: step_shift_cii2326
       real :: step_anorm_neiv2423
       real :: step_width_neiv2423
       real :: step_shift_neiv2423
       real :: step_anorm_oii2471
       real :: step_width_oii2471
       real :: step_shift_oii2471
       real :: step_anorm_alii2669
       real :: step_width_alii2669
       real :: step_shift_alii2669
       real :: step_anorm_oiii2672
       real :: step_width_oiii2672
       real :: step_shift_oiii2672
       real :: step_anorm_mg2a
       real :: step_width_mg2a
       real :: step_shift_mg2a
       real :: step_anorm_mg2b
       real :: step_width_mg2b
       real :: step_shift_mg2b
       real :: step_anorm_oiii3133
       real :: step_anorm_hei3188
       real :: step_anorm_nev3346
       real :: step_width_nev3346
       real :: step_shift_nev3346
       real :: step_anorm_nev3426
       real :: step_width_nev3426
       real :: step_shift_nev3426
       real :: step_anorm_fevii3587
       real :: step_width_fevii3587
       real :: step_shift_fevii3587
       real :: step_anorm_hei3588
       real :: step_anorm_oii3728
       real :: step_width_oii3728
       real :: step_shift_oii3728
       real :: step_anorm_fevii3759
       real :: step_width_fevii3759
       real :: step_shift_fevii3759
       real :: step_anorm_neiii3869
       real :: step_width_neiii3869
       real :: step_shift_neiii3869
       real :: step_anorm_hei3889
       real :: step_anorm_h8
       real :: step_anorm_neiii3968
       real :: step_width_neiii3968
       real :: step_shift_neiii3968
       real :: step_anorm_hepsilon
       real :: step_anorm_fev4072
       real :: step_width_fev4072
       real :: step_shift_fev4072
       real :: step_anorm_sii4073
       real :: step_width_sii4073
       real :: step_shift_sii4073
       real :: step_anorm_hdelta
       real :: step_anorm_hgamma
       real :: step_anorm_hdeltanc
       !real :: step_anorm_hanc !anajis 
       real :: step_anorm_oiii4363
       real :: step_width_oiii4363
       real :: step_shift_oiii4363
       real :: step_anorm_hei4472
       real :: step_width_hei4472
       real :: step_shift_hei4472
       real :: step_anorm_heii4685
       real :: step_width_heii4685
       real :: step_shift_heii4685
       real :: step_anorm_heii4685nc
       real :: step_anorm_hb
       real :: step_width_hb
       real :: step_shift_hb
       real :: step_anorm_hbnc
       real :: step_anorm_o3a
       real :: step_width_o3a
       real :: step_shift_o3a
       real :: step_anorm_o3b
       real :: step_width_o3b
       real :: step_shift_o3b
       real :: step_anorm_fevii5160
       real :: step_width_fevii5160
       real :: step_shift_fevii5160
       real :: step_anorm_fevi5177
       real :: step_anorm_ni5200
       real :: step_anorm_hei5875
       real :: step_anorm_mg2ae
       real :: step_width_mg2ae
       real :: step_shift_mg2ae
       real :: step_anorm_mg2be
       real :: step_width_mg2be
       real :: step_shift_mg2be
       real :: step_anorm_hb2,step_width_hb2
       real :: step_shift_hb2
       real :: step_anorm_o3asb,step_width_o3asb
       real :: step_shift_o3asb
       real :: step_anorm_o3bsb,step_width_o3bsb
       real :: step_shift_o3bsb
       real :: step_anorm_hgammanc
       real :: step_anorm_balcont,step_anorm_highbal
       real :: step_shift_hei5875nc
       real :: step_anorm_hei7067,step_width_hei7067
       real :: step_shift_hei7067
       real :: step_anorm_ha,step_width_ha
       real :: step_shift_ha
       real :: step_anorm_o1a,step_width_o1a
       real :: step_shift_o1a
       real :: step_anorm_o1b,step_width_o1b
       real :: step_shift_o1b
       real :: step_anorm_n2a,step_width_n2a
       real :: step_anorm_n2b,step_width_n2b
       real :: step_shift_n2a
       real :: step_shift_n2b
       real :: step_anorm_s2a,step_width_s2a
       real :: step_shift_s2a
       real :: step_anorm_s2b,step_width_s2b
       real :: step_shift_s2b
       real :: step_anorm_s2asb,step_width_s2asb
       real :: step_shift_s2asb
       real :: step_anorm_s2bsb,step_width_s2bsb
       real :: step_shift_s2bsb
       real :: step_anorm_hanc,step_width_hanc
       real :: step_shift_hanc
       real :: step_anorm_hanc2,step_width_hanc2
       real :: step_shift_hanc2
       real :: step_anorm_ha2,step_width_ha2
       real :: step_shift_ha2
       real :: step_anorm_oii7321,step_width_oii7321
       real :: step_shift_oii7321
       real :: step_anorm_fevii6086,step_width_fevii6086
       real :: step_shift_fevii6086
       real :: step_width_ni5200
       real :: step_shift_ni5200
       real :: step_anorm_ni7889,step_width_ni7889
       real :: step_shift_ni7889
       real :: step_anorm_ariii7138,step_width_ariii7138
       real :: step_shift_ariii7138        
       real :: step_anorm_niiii7892,step_width_niiii7892
       real :: step_shift_niiii7892  
       real :: step_anorm_fexi7894,step_width_fexi7894
       real :: step_shift_fexi7894  


       real :: anorm_Fe2t
       real :: anorm_Fe2t_opt
       real :: anorm_pl
       real :: slope1,slope2,wave_break
       real :: anorm_cii2326,width_cii2326,shift_cii2326
       real :: anorm_neiv2423,width_neiv2423,shift_neiv2423
       real :: anorm_oii2471,width_oii2471,shift_oii2471
       real :: anorm_alii2669,width_alii2669,shift_alii2669
       real :: anorm_oiii2672,width_oiii2672,shift_oiii2672
       real :: anorm_mg2a,width_mg2a,shift_mg2a
       real :: anorm_mg2b,width_mg2b,shift_mg2b
       real :: anorm_oiii3133,width_oiii3133,shift_oiii3133
       real :: anorm_nev3346,width_nev3346,shift_nev3346
       real :: anorm_nev3426,width_nev3426,shift_nev3426
       real :: anorm_fevii3587,width_fevii3587,shift_fevii3587
       real :: anorm_hei3588,width_hei3588,shift_hei3588
       real :: anorm_hei3188
       real :: anorm_oii3728,width_oii3728,shift_oii3728
       real :: anorm_fevii3759,width_fevii3759,shift_fevii3759
       real :: anorm_neiii3869,width_neiii3869,shift_neiii3869
       real :: anorm_hei3889,width_hei3889,shift_hei3889
       real :: anorm_h8,width_h8,shift_h8
       real :: anorm_neiii3968,width_neiii3968,shift_neiii3968
       real :: anorm_hepsilon,width_hepsilon,shift_hepsilon
       real :: anorm_fev4072,width_fev4072,shift_fev4072
       real :: anorm_sii4073,width_sii4073,shift_sii4073
       real :: anorm_hdelta,width_hdelta,shift_hdelta
       real :: anorm_hdeltanc,width_hdeltanc,shift_hdeltanc
       real :: anorm_hgamma,width_hgamma,shift_hgamma
       real :: anorm_hgammanc,width_hgammanc,shift_hgammanc
       
       !real :: anorm_hanc,width_hanc,shift_hanc !halpha NC, anajis
       
       real :: anorm_oiii4363,width_oiii4363,shift_oiii4363
       real :: anorm_hei4472,width_hei4472,shift_hei4472
       real :: anorm_heii4685,width_heii4685,shift_heii4685
       real :: anorm_heii4685nc,width_heii4685nc,shift_heii4685nc
       real :: anorm_hb,width_hb,shift_hb
       real :: anorm_hbnc,width_hbnc,shift_hbnc
       real :: anorm_o3a,width_o3a,shift_o3a
       real :: anorm_o3b,width_o3b,shift_o3b
       real :: anorm_fevii5160,width_fevii5160,shift_fevii5160
       real :: anorm_fevi5177,width_fevi5177,shift_fevi5177 !5177
       real :: anorm_ni5200,width_ni5200,shift_ni5200
       real :: anorm_hei5875,width_hei5875,shift_hei5875
       real :: anorm_hei5875nc,width_hei5875nc,shift_hei5875nc
       real :: anorm_mg2ae,width_mg2ae,shift_mg2ae
       real :: anorm_mg2be,width_mg2be,shift_mg2be
       real :: anorm_hb2,width_hb2,shift_hb2
       real :: anorm_o3asb,width_o3asb,shift_o3asb
       real :: anorm_o3bsb,width_o3bsb,shift_o3bsb
       real :: anorm_balcont,anorm_highbal
       real :: anorm_hei7067,width_hei7067,shift_hei7067
       real :: anorm_ha,width_ha,shift_ha
       real :: anorm_o1a,width_o1a,shift_o1a
       real :: anorm_o1b,width_o1b,shift_o1b
       real :: anorm_n2a,width_n2a,shift_n2a
       real :: anorm_s2a,width_s2a,shift_s2a
       real :: anorm_s2b,width_s2b,shift_s2b
       real :: anorm_s2asb,width_s2asb,shift_s2asb
       real :: anorm_s2bsb,width_s2bsb,shift_s2bsb
       real :: anorm_oii7321,width_oii7321,shift_oii7321
       real :: anorm_fevii6086,width_fevii6086,shift_fevii6086
       real :: anorm_ni7889,width_ni7889,shift_ni78889
       real :: anorm_hanc,width_hanc,shift_hanc
       real :: anorm_ha2,width_ha2,shift_ha2
       real :: anorm_ariii7138,width_ariii7138,shift_ariii7138
       real :: anorm_niiii7892,width_niiii7892,shift_niiii7892
       real :: anorm_fexi7894,width_fexi7894,shift_fexi7894

       real :: gauss_width_limit, gauss_width_limit_low

       accuracy_factor = 1.0
       ile_accuracy_loop = 0
       ile_matrix = 0  ! ERROR

       chi2_best = 1.e20

       chi2_best_old = chi2_best


5511  continue


        !print *, 'chi2_best', chi2_best
        !print *, 'chi2_best_old', chi2_best_old
        print *, 'loop: ',ile_matrix+1, 'chi2_best', chi2_best


c       print *, 'step_fe2', step_Fe2t

       !!!!!POWERLAW
       !1 componente, 4 free-params
       step_pl = coef_anorm_pl*anorm_pl_best*accuracy_factor
       step_slope1 = coef_slope1*slope1_best*accuracy_factor
       step_slope2 = coef_slope2*slope2_best*accuracy_factor
       step_wave_break = coef_wave_break*accuracy_factor	 
       !print *, 'step_pl',step_pl
       !print *, 'step_slope1',step_slope1
       !print *, 'step_slope2',step_slope2
       !print *, 'step_wave',step_wave_break
       !step_pl = coef_pl*anorm_pl_best*accuracy_factor



      !!!!!!PSEUDOCONTINUMS
      !Normalizacion Balmercont
       step_anorm_balcont = coef_anorm_balcont*accuracy_factor

      !Normalizacion High Order Balmer
       step_anorm_highbal = coef_anorm_highbal*accuracy_factor

	!1 componente, 1 parametro libre, Fe2 UV
        step_Fe2t = coef_anorm_Fe2t*accuracy_factor


	!1 componente, 1 parametro libre, Fe2 OPT
        step_Fe2t_opt = coef_anorm_Fe2t_opt*accuracy_factor


	!!!! BC Optical, 7 componentes, 9 parametros libres
	!anchos y shift ligados a HB
       !4 componentes, 7 free-params
       step_anorm_hb = coef_anorm_hb*accuracy_factor
       step_width_hb = coef_width_hb*accuracy_factor
       step_shift_hb = coef_shift_hb*accuracy_factor
       !print *, 'hb',anorm_hb_best,width_hb_best,shift_hb_best
       !print *, 'step_hb',step_anorm_hb,step_width_hb,step_shift_hb

       step_anorm_hdelta = coef_anorm_hdelta*accuracy_factor
       !print *, 'step_hdelta',step_anorm_hdelta, coef_anorm_hdelta

       step_anorm_hgamma = coef_anorm_hgamma*accuracy_factor

       step_anorm_h8 = coef_anorm_h8*accuracy_factor

       step_anorm_hepsilon = coef_anorm_hepsilon*accuracy_factor

       step_anorm_alii2669 = coef_anorm_alii2669*accuracy_factor !Semi-BC

       step_anorm_cii2326 = coef_anorm_cii2326*accuracy_factor !Semi-BC



       !1 componente, 3 free-params
       step_anorm_mg2a = coef_anorm_mg2a*accuracy_factor
       step_width_mg2a = coef_width_mg2a*accuracy_factor
       step_shift_mg2a = coef_shift_mg2a*accuracy_factor
c       print *, 'step_mg2',step_anorm_mg2a ,step_width_mg2a,
c     *		step_shift_mg2a



       !2 componentes, 4 free-params
	!OIII UV
       step_anorm_oiii2672 = coef_anorm_oiii2672*accuracy_factor
       step_width_oiii2672 = coef_width_oiii2672*accuracy_factor
       step_shift_oiii2672 = coef_shift_oiii2672*accuracy_factor
c       print *, 'step_o3_2672',step_anorm_oiii2672 ,
c     *		step_width_oiii2672,step_shift_oiii2672

       step_anorm_oiii3133 = coef_anorm_oiii3133*accuracy_factor



       !7 componentes, 9 free-parama
	!HELIOS
       step_anorm_heii4685 = coef_anorm_heii4685*accuracy_factor
       step_width_heii4685= coef_width_heii4685*accuracy_factor
       step_shift_heii4685 = coef_shift_heii4685*shift
     *			_heii4685_best

       step_anorm_hei3188 = coef_anorm_hei3188*accuracy_factor

       step_anorm_hei3588 = coef_anorm_hei3588*accuracy_factor

       step_anorm_hei3889 = coef_anorm_hei3889*accuracy_factor

       step_anorm_hei5875 = coef_anorm_hei5875*accuracy_factor

       step_anorm_hei4472 = coef_anorm_hei4472*accuracy_factor

       step_anorm_hei7067 = coef_anorm_hei7067*accuracy_factor




       !15 componentes, 17 free-parama
	!NC alrededor de Hb todas ligadas al OIII
       step_anorm_o3a = coef_anorm_o3a*accuracy_factor
       step_width_o3a = coef_width_o3a*accuracy_factor
       step_shift_o3a = coef_shift_o3a*accuracy_factor

       step_anorm_hbnc = coef_anorm_hbnc*accuracy_factor

       step_anorm_heii4685nc = coef_anorm_heii4685nc*accuracy_factor

       step_anorm_oiii4363 = coef_anorm_oiii4363*accuracy_factor

       step_anorm_ni5200 = coef_anorm_ni5200*accuracy_factor

       step_anorm_neiv2423 = coef_anorm_neiv2423*accuracy_factor

       step_anorm_oii2471 = coef_anorm_oii2471*accuracy_factor

       step_anorm_nev3346 = coef_anorm_nev3346*accuracy_factor

       step_anorm_oii3728 = coef_anorm_oii3728*accuracy_factor

       step_anorm_neiii3869 = coef_anorm_neiii3869*accuracy_factor

       step_anorm_neiii3968 = coef_anorm_neiii3968*accuracy_factor

       step_anorm_fev4072 = coef_anorm_fev4072*accuracy_factor

       step_anorm_sii4073 = coef_anorm_sii4073*accuracy_factor

       step_anorm_hgammanc = coef_anorm_hgammanc*accuracy_factor

       step_anorm_hdeltanc = coef_anorm_hdeltanc*accuracy_factor


	

       !3 components, 5 free-params
	!  CORONAL LINES UV
       step_anorm_nev3426 = coef_anorm_nev3426*accuracy_factor
       step_width_nev3426 = coef_width_nev3426*accuracy_factor
       step_shift_nev3426 = coef_shift_nev3426*accuracy_factor

       step_anorm_fevii3587 = coef_anorm_fevii3587*accuracy_factor

       step_anorm_fevii3759 = coef_anorm_fevii3759*accuracy_factor




       !4 components, 6 free-params 
	!CORONAL LINES OPT
       step_anorm_fevii5160 = coef_anorm_fevii5160*accuracy_factor
       step_width_fevii5160 = coef_width_fevii5160*accuracy_factor
       step_shift_fevii5160 = coef_shift_fevii5160*accuracy_factor

       step_anorm_fevi5177 = coef_anorm_fevi5177*accuracy_factor

       step_anorm_fexi7894 = coef_anorm_fexi7894*accuracy_factor

       step_anorm_fevii6086 = coef_anorm_fevii6086*accuracy_factor



	!1 componente, 3 free-params 
	!Ha BC
       step_anorm_ha = coef_anorm_ha*accuracy_factor
       step_width_ha = coef_width_ha*accuracy_factor
       step_shift_ha = coef_shift_ha*accuracy_factor


	!8 componentes, 10 paramntros libres
	!NC alrededor de HaNC
       step_anorm_hanc = coef_anorm_hanc*accuracy_factor
       step_width_hanc = coef_width_hanc*accuracy_factor
       step_shift_hanc = coef_shift_hanc*accuracy_factor
c       print *, 'step ha fwhm', step_width_hanc,coef_width_hanc,
c     *    width_hanc_best,accuracy_factor

       step_anorm_s2a = coef_anorm_s2a*accuracy_factor

       step_anorm_s2b = coef_anorm_s2b*accuracy_factor

       step_anorm_o1a = coef_anorm_o1a*accuracy_factor !doblete

       step_anorm_n2a = coef_anorm_n2a*accuracy_factor !doblete

       step_anorm_niiii7892 = coef_anorm_niiii7892*accuracy_factor

       step_anorm_ariii7138 = coef_anorm_ariii7138*accuracy_factor

       step_anorm_oii7321 = coef_anorm_oii7321*accuracy_factor




	!COMPONENTES EXTRAS
       !1 componentes, 3 free-parama
       step_anorm_hb2 = coef_anorm_hb2*accuracy_factor
       step_width_hb2 = coef_width_hb2*accuracy_factor
       step_shift_hb2 = coef_shift_hb2*accuracy_factor


       !1 componentes, 3 free-parama
       step_anorm_mg2ae = coef_anorm_mg2ae*accuracy_factor
       step_width_mg2ae = coef_width_mg2ae*accuracy_factor
       step_shift_mg2ae = coef_shift_mg2ae*accuracy_factor


       !1 componentes, 3 free-params
       step_anorm_o3asb = coef_anorm_o3asb*accuracy_factor
       step_width_o3asb = coef_width_o3asb*accuracy_factor
       step_shift_o3asb = coef_shift_o3asb*accuracy_factor

       !1 componentes, 3 free-params
       step_anorm_ha2 = coef_anorm_ha2*accuracy_factor
       step_width_ha2 = coef_width_ha2*accuracy_factor
       step_shift_ha2 = coef_shift_ha2*accuracy_factor

       !2 componentes, 4 free-params
       step_anorm_s2asb = coef_anorm_s2asb*accuracy_factor
       step_width_s2asb = coef_width_s2asb*accuracy_factor
       step_shift_s2asb = coef_shift_s2asb*accuracy_factor

       step_anorm_s2bsb = coef_anorm_s2bsb*accuracy_factor



       ile_big_loop = 0


678   continue !de aca en adelante es donde debes ir como modificando

        ile_big_loop = ile_big_loop + 1
c       print*,'gasdev',gasdev(idum)

        ile_matrix = ile_matrix + 1  ! ERROR

	!POWERLAW
       anorm_pl = anorm_pl_best + step_pl*gasdev()
        if (anorm_pl.lt.0) anorm_pl = 3.
        !if (anorm_pl.ge.12) anorm_pl = 10.
       slope1 = slope1_best + step_slope1*gasdev()
       slope2 = slope2_best + step_slope2*gasdev()
        !if (slope1.lt.0.05) slope1 = slope1_best
        !if (slope1.gt.4.0) slope1 = slope1_best
       wave_break = wave_break_best + step_wave_break*gasdev()
        !if (wave_break.lt.2500.) wave_break = wave_break_best
        !if (wave_break.gt.5800.) wave_break = wave_break_best
        !print *, 'slopes', anorm_pl,slope1, slope2,wave_break



	!PSEUDOCONTINUUMS
       !Balmer continum
       anorm_balcont = anorm_balcont_best + step_anorm_balcont*gasdev()
       if (anorm_balcont.lt.0.) anorm_balcont = 0.01
c       if (anorm_balcont.gt.max_balcont) anorm_balcont = 1.

       !Balmer high order
       anorm_highbal = anorm_highbal_best + step_anorm_highbal*gasdev()
       if (anorm_highbal.lt.0) anorm_highbal = 1.
       !if (anorm_highbal.gt.max_highbal) anorm_highbal = 1.

	!Fe2 UV
       anorm_Fe2t = anorm_Fe2t_best + step_Fe2t*gasdev()
       if (anorm_Fe2t.lt.0) anorm_Fe2t = 0.001
       !if (anorm_Fe2t.gt.max_fe2) anorm_Fe2t = 18.
       !if (anorm_Fe2t.ge.45) anorm_Fe2t = 20.
       !print *, 'fe2_uv',anorm_Fe2t

	!Fe2 OPT
       anorm_Fe2t_opt = anorm_Fe2t_opt_best + step_Fe2t_opt*gasdev()
       if (anorm_Fe2t_opt.lt.0) anorm_Fe2t_opt = 0.01
       !if (anorm_Fe2t_opt.gt.max_fe2) anorm_Fe2t_opt = 2.
       !print *, 'fe2_opt',anorm_Fe2t_opt



	!Hb
       anorm_hb = anorm_hb_best + step_anorm_hb*gasdev()
       !if(anorm_hb.lt.0.0) anorm_hb = 15.0  !anajis
       !if(anorm_hb.gt.20.0) anorm_hb = 15.0 !anajis
       width_hb = width_hb_best + step_width_hb*gasdev()
       	  if(width_hb.lt.fwhm_max_nc) width_hb = width_hb_best
       	  if(width_hb.gt.fwhm_max_bc) width_hb = width_hb_best
       shift_hb = shift_hb_best + step_shift_hb*gasdev()
       !print *,'hb',anorm_hb,width_hb,shift_hb

	!Hdelta
       anorm_hdelta = anorm_hdelta_best + 
     *			      step_anorm_hdelta*gasdev()
       if(anorm_hdelta.lt.0) anorm_hdelta = anorm_hb/3.
       if(anorm_hdelta.gt.max_hb) anorm_hdelta = anorm_hb
       !print *,'hdelta',anorm_hdelta

	!Hgamma
       anorm_hgamma = anorm_hgamma_best + 
     *			      step_anorm_hgamma*gasdev()
       if(anorm_hgamma.lt.0) anorm_hgamma = anorm_hb/6
       if(anorm_hgamma.gt.max_hb) anorm_hgamma = anorm_hb

	!H8
       anorm_h8 = anorm_h8_best + 
     *			      step_anorm_h8*gasdev()
       if(anorm_h8.lt.0) anorm_h8 = anorm_hb/10.
       if(anorm_h8.gt.max_hb) anorm_h8 = anorm_hb


	!Hepsilon
       anorm_hepsilon = anorm_hepsilon_best + 
     *			      step_anorm_hepsilon*gasdev()
       if(anorm_hepsilon.lt.0) anorm_hepsilon = anorm_hb
       if(anorm_hepsilon.gt.max_hb) anorm_hepsilon = anorm_hb

	!alii2669 
       anorm_alii2669 = anorm_alii2669_best + 
     *			      step_anorm_alii2669*gasdev()
       if(anorm_alii2669.lt.0) anorm_alii2669 = 0.01
       if(anorm_alii2669.gt.max_hb) anorm_alii2669 = anorm_hb/5

	!cii2326 Semi-BC
       anorm_cii2326 = anorm_cii2326_best + 
     *			      step_anorm_cii2326*gasdev()
       if(anorm_cii2326.lt.0) anorm_cii2326 = 0.01
       if(anorm_cii2326.gt.max_hb) anorm_cii2326 = anorm_hb/5





	!MgII doublet
       anorm_mg2a = anorm_mg2a_best + step_anorm_mg2a*gasdev()
         if(anorm_mg2a.lt.0) anorm_mg2a = anorm_mg2a_best
         !if(anorm_mg2a.gt.max_hb) anorm_mg2a = anorm_mg2a_best
       width_mg2a = width_mg2a_best + step_width_mg2a*gasdev()
         if(width_mg2a.lt.fwhm_max_nc) width_mg2a = width_hb_best
         if(width_mg2a.gt.fwhm_max_bc) width_mg2a = width_hb_best
       shift_mg2a = shift_mg2a_best + step_shift_mg2a*gasdev()




	!OIII UV
	!oiii2672
       anorm_oiii2672 = anorm_oiii2672_best + 
     *			      step_anorm_oiii2672*gasdev()
       if(anorm_oiii2672.lt.0) anorm_oiii2672 = 0.
       if(anorm_oiii2672.gt.max_hb) anorm_oiii2672 = anorm_hb
       width_oiii2672 = width_oiii2672_best + 
     *			      step_width_oiii2672*gasdev()
       !if(width_oiii2672.lt.fwhm_max_nc) width_oiii2672 = width_hb_best
       !if(width_oiii2672.gt.fwhm_max_bc) width_oiii2672 = width_hb_best
       shift_oiii2672 = shift_oiii2672_best + 
     *			 step_shift_oiii2672*gasdev()


c      print *,'vals_o3_2672',anorm_oiii2672,width_oiii2672,
c     *		shift_oiii2672

	!oiii3133
       anorm_oiii3133 = anorm_oiii3133_best + 
     *			      step_anorm_oiii3133*gasdev()
       if(anorm_oiii3133.lt.0) anorm_oiii3133 = 0.
       if(anorm_oiii3133.gt.max_hb) anorm_oiii3133 = anorm_oiii2672




	!heii4685
       anorm_heii4685 = anorm_heii4685_best + step_anorm_
     *			heii4685*gasdev()
         if(anorm_heii4685.lt.0) anorm_heii4685 = 0.01
       !if(anorm_heii4685.gt.max_hb) anorm_heii4685 = anorm_hb
       width_heii4685 = width_heii4685_best + step_width_
     *			heii4685*gasdev()
         if(width_heii4685.lt.0.) width_heii4685 = width_heii4685_best
       shift_heii4685 = shift_heii4685_best + step_shift_
     *			heii4685*gasdev()

	!hei3188
       anorm_hei3188 = anorm_hei3188_best + step_anorm_
     *			hei3188*gasdev()
       if(anorm_hei3188.lt.0) anorm_hei3188 = 0.
       if(anorm_hei3188.gt.max_hb) anorm_hei3188 = anorm_heii4685


	!hei3588
       anorm_hei3588 = anorm_hei3588_best + 
     *			      step_anorm_hei3588*gasdev()
       if(anorm_hei3588.lt.0) anorm_hei3588 = 0.
       if(anorm_hei3588.gt.max_hb) anorm_hei3588 = anorm_heii4685
	

	!hei3889
       anorm_hei3889 = anorm_hei3889_best + 
     *			      step_anorm_hei3889*gasdev()
       if(anorm_hei3889.lt.0) anorm_hei3889 = 0.
       if(anorm_hei3889.gt.max_hb) anorm_hei3889 = anorm_heii4685

	!hei5875
       anorm_hei5875 = anorm_hei5875_best + 
     *			      step_anorm_hei5875*gasdev()
       if(anorm_hei5875.lt.0) anorm_hei5875 = 0.
       if(anorm_hei5875.gt.max_hb) anorm_hei5875 =anorm_heii4685

	!hei4472
       anorm_hei4472 = anorm_hei4472_best + 
     *			      step_anorm_hei4472*gasdev()
         if(anorm_hei4472.lt.0) anorm_hei4472 = 0.01
       !if(anorm_hei4472.gt.max_hb) anorm_hei4472 = anorm_heii4685

	!HeI 7067
       anorm_hei7067 = anorm_hei7067_best + 
     *			      step_anorm_hei7067*gasdev()
         if(anorm_hei7067.lt.0) anorm_hei7067 = 0.01





	!!! NARROW LINES
	!OIII 5007
       anorm_o3a = anorm_o3a_best + step_anorm_o3a*gasdev()
         if(anorm_o3a.lt.0.0) anorm_o3a = 0.01
       !if(anorm_o3a.gt.max_o3) anorm_o3a = anorm_o3a_best
       width_o3a = width_o3a_best + step_width_o3a*gasdev()
         if(width_o3a.gt.fwhm_max_nc) width_o3a = 500.
       shift_o3a = shift_o3a_best + step_shift_o3a*gasdev()
       !print *,'o3_flux',anorm_o3a,width_o3a,shift_o3a

	!Hbnc
       anorm_hbnc = anorm_hbnc_best + step_anorm_hbnc*gasdev()
         if(anorm_hbnc.lt.0) anorm_hbnc = 0.01
       !if(anorm_hbnc.gt.10.0) anorm_hbnc = 3.0
       !print *,'hbnc_flux',anorm_hbnc,anorm_hbnc_best

	!heii4685nc
       anorm_heii4685nc = anorm_heii4685nc_best + step_anorm_
     *			heii4685nc*gasdev()
       if(anorm_heii4685nc.lt.0.) anorm_heii4685nc = 0.01
       !if(anorm_heii4685nc.gt.max_o3) anorm_heii4685nc = anorm_o3a
c       print *,'va_henc',anorm_heii4685nc,anorm_heii4685nc_best,
c     *			step_anorm_heii4685nc

	!oiii4363
       anorm_oiii4363 = anorm_oiii4363_best + 
     *			      step_anorm_oiii4363*gasdev()
       if(anorm_oiii4363.lt.0) anorm_oiii4363 = 0.01

	!ni5200
       anorm_ni5200 = anorm_ni5200_best + 
     *			      step_anorm_ni5200*gasdev()
       if(anorm_ni5200.lt.0) anorm_ni5200 = 0.01
       if(anorm_ni5200.gt.max_o3) anorm_ni5200 = anorm_o3a

	!neiv2423
       anorm_neiv2423 = anorm_neiv2423_best + 
     *			      step_anorm_neiv2423*gasdev()
       if(anorm_neiv2423.lt.0) anorm_neiv2423 = 0.01

	!oii2471
       anorm_oii2471 = anorm_oii2471_best + 
     *			      step_anorm_oii2471*gasdev()
       if(anorm_oii2471.lt.0) anorm_oii2471 = 0.01
	
	!nev3346
       anorm_nev3346 = anorm_nev3346_best + 
     *			      step_anorm_nev3346*gasdev()
       if(anorm_nev3346.lt.0) anorm_nev3346 = 0.01

	!oii3728
       anorm_oii3728 = anorm_oii3728_best + 
     *			      step_anorm_oii3728*gasdev()
       if(anorm_oii3728.lt.0) anorm_oii3728 = 0.01

	!niii3869
       anorm_neiii3869 = anorm_neiii3869_best + 
     *			      step_anorm_neiii3869*gasdev()
       if(anorm_neiii3869.lt.0) anorm_neiii3869 = 0.01

	!neiii3968
       anorm_neiii3968 = anorm_neiii3968_best + 
     *			      step_anorm_neiii3968*gasdev()
       if(anorm_neiii3968.lt.0) anorm_neiii3968 = 0.01

	!fev4072
       anorm_fev4072 = anorm_fev4072_best + 
     *			      step_anorm_fev4072*gasdev()
       if(anorm_fev4072.lt.0) anorm_fev4072 = 0.01

	!sii4073
       anorm_sii4073 = anorm_sii4073_best + 
     *			      step_anorm_sii4073*gasdev()
       if(anorm_sii4073.lt.0) anorm_sii4073 = 0.01

	!Hdelta NC
       anorm_hdeltanc = anorm_hdeltanc_best + 
     *			      step_anorm_hdeltanc*gasdev()
       if(anorm_hdeltanc.lt.0) anorm_hdeltanc = 0.01
       !print *,'hdeltanc',anorm_hdeltanc

	!Hgamma NC
       anorm_hgammanc = anorm_hgammanc_best + 
     *			      step_anorm_hgammanc*gasdev()
       if(anorm_hgammanc.lt.0) anorm_hgammanc = 0.01
       !if(anorm_hgammanc.gt.max_o3) anorm_hgammanc = anorm_o3a
	





      !!!!!! CORONAL LINES UV
	!nev3426
       anorm_nev3426 = anorm_nev3426_best + 
     *			      step_anorm_nev3426*gasdev()
       if(anorm_nev3426.lt.0) anorm_nev3426 = 0.01
       !if(anorm_nev3426.gt.max_o3) anorm_nev3426 = anorm_o3a
       width_nev3426 = width_nev3426_best + 
     *			      step_width_nev3426*gasdev()
       if(width_nev3426.lt.0) width_nev3426 = min_o3
       shift_nev3426 = shift_nev3426_best + 
     *			      step_shift_nev3426*gasdev()

	!fevii3587
       anorm_fevii3587 = anorm_fevii3587_best + 
     *			      step_anorm_fevii3587*gasdev()
       if(anorm_fevii3587.lt.0) anorm_fevii3587 = 0.01


	!Fevii3759
       anorm_fevii3759 = anorm_fevii3759_best + 
     *			      step_anorm_fevii3759*gasdev()
       if(anorm_fevii3759.lt.0) anorm_fevii3759 = 0.01






      !!!!!! CORONAL LINES OPT

	!fevii5160
       anorm_fevii5160 = anorm_fevii5160_best + 
     *			      step_anorm_fevii5160*gasdev()
         if(anorm_fevii5160.lt.0) anorm_fevii5160 = 0.01
         !if(anorm_fevii5160.gt.max_o3) anorm_fevii5160 = anorm_o3a
       width_fevii5160 = width_fevii5160_best + 
     *			      step_width_fevii5160*gasdev()
         if(width_fevii5160.lt.0) width_fevii5160 = width_fevii5160_best
       shift_fevii5160 = shift_fevii5160_best + 
     *			      step_shift_fevii5160*gasdev()

	!fevi5177
       anorm_fevi5177 = anorm_fevi5177_best + 
     *			      step_anorm_fevi5177*gasdev()
       if(anorm_fevi5177.lt.0) anorm_fevi5177 = 0.01

	!fexi 7894
       anorm_fexi7894 = anorm_fexi7894_best + 
     *			      step_anorm_fexi7894*gasdev()
       if(anorm_fexi7894.lt.0) anorm_fexi7894 = 0.01

	!FeVII 6086
       anorm_fevii6086 = anorm_fevii6086_best + 
     *			      step_anorm_fevii6086*gasdev()
       if(anorm_fevii6086.lt.0) anorm_fevii6086 = 0.01





	!Ha region
       anorm_ha = anorm_ha_best + step_anorm_ha*gasdev()
         if(anorm_ha.le.0) anorm_ha = anorm_ha_best
       width_ha = width_ha_best + step_width_ha*gasdev()
         if(width_ha.le.900) width_ha = width_ha_best
       shift_ha = shift_ha_best + step_shift_ha*gasdev()



	!Ha NC
       anorm_hanc = anorm_hanc_best + step_anorm_hanc*gasdev()
         if(anorm_hanc.lt.0) anorm_hanc = anorm_hanc_best 
       width_hanc = width_hanc_best + step_width_hanc*gasdev()
         if(width_hanc.ge.1000) width_hanc = 500.
       shift_hanc = shift_hanc_best + step_shift_hanc*gasdev()

	!SII 6732
       anorm_s2a = anorm_s2a_best + step_anorm_s2a*gasdev()
       if(anorm_s2a.lt.0) anorm_s2a = anorm_s2a_best
       !shift_o1a = shift_o1a_best + step_shift_o1a*gasdev()

	!SII 6718
       anorm_s2b = anorm_s2b_best + step_anorm_s2b*gasdev()
       if(anorm_s2b.lt.0) anorm_s2b = anorm_s2b_best
       !shift_o1a = shift_o1a_best + step_shift_o1a*gasdev()

	!OI 6302
      anorm_o1a = anorm_o1a_best + step_anorm_o1a*gasdev()
       if(anorm_o1a.lt.0) anorm_o1a = anorm_o1a_best

       anorm_n2a = anorm_n2a_best + step_anorm_n2a*gasdev()
       if(anorm_n2a.lt.0) anorm_n2a = anorm_n2a_best

	![ni iii] 7892.10
       anorm_niiii7892 = anorm_niiii7892_best + 
     *			      step_anorm_niiii7892*gasdev()
       if(anorm_niiii7892.lt.0) anorm_niiii7892 = 0.01

	!ariii 7138
       anorm_ariii7138 = anorm_ariii7138_best + 
     *			      step_anorm_ariii7138*gasdev()
       if(anorm_ariii7138.lt.0) anorm_ariii7138 = 0.01

	![oii] 7321
       anorm_oii7321 = anorm_oii7321_best + 
     *			      step_anorm_oii7321*gasdev()
       if(anorm_oii7321.lt.0) anorm_oii7321 = 0.01




	!!!!!COMPONENTES EXTRAS
	!Hb extra
       anorm_hb2 = anorm_hb2_best + step_anorm_hb2*gasdev()
         if(anorm_hb2.lt.0) anorm_hb2 = 0.
c       print *,'flux_hb2', anorm_hb2,step_anorm_hb2,
c     *                    anorm_hb2_best,gasdev()
       width_hb2 = width_hb2_best + step_width_hb2*gasdev()
         if(width_hb2.lt.fwhm_max_nc) width_hb2 = fwhm_ave_sbbc
c       print *,'width_hb2', width_hb2,step_width_hb2,
c     *                     width_hb2_best,gasdev()
       shift_hb2 = shift_hb2_best + step_shift_hb2*gasdev()

	!MgII SB
       anorm_mg2ae = anorm_mg2ae_best + step_anorm_mg2ae*gasdev()
         if(anorm_mg2ae.lt.0) anorm_mg2ae = 0.01
         if(anorm_mg2ae.gt.max_hb) anorm_mg2ae = anorm_mg2ae_best/2.
c       print *,'flux_mg2ae', anorm_mg2ae,step_anorm_mg2ae,
c     *                    anorm_mg2ae_best,gasdev()
       width_mg2ae = width_mg2ae_best + step_width_mg2ae*gasdev()
         if(width_mg2ae.lt.fwhm_max_nc) width_mg2ae = fwhm_ave_sbbc
         if(width_mg2ae.gt.fwhm_max_sbbc) width_mg2ae = fwhm_ave_sbbc
c       print *,'width_mg2ae', width_mg2ae,step_width_mg2ae,
c     *                     width_mg2ae_best,gasdev()
       shift_mg2ae = shift_mg2ae_best + step_shift_mg2ae*gasdev()

	!OIII SB
       anorm_o3asb = anorm_o3asb_best + step_anorm_o3asb*gasdev()
         if(anorm_o3asb.lt.0) anorm_o3asb = 0.01
       width_o3asb = width_o3asb_best + step_width_o3asb*gasdev()
         if(width_o3asb.lt.fwhm_max_nc) width_o3asb= fwhm_ave_sbbc
         if(width_o3asb.gt.fwhm_max_sbbc) width_o3asb= fwhm_ave_sbbc
       !if(width_o3asb.ge.3500) width_o3asb= width_o3asb_best 
       shift_o3asb = shift_o3asb_best + step_shift_o3asb*gasdev()

	!Ha extra
       anorm_ha2 = anorm_ha2_best + step_anorm_ha2*gasdev()
         if(anorm_ha2.le.0) anorm_ha2 = anorm_ha2_best
       !if(anorm_ha2.ge.anorm_ha) anorm_ha2 = 10.
       width_ha2 = width_ha2_best + step_width_ha2*gasdev()
         if(width_ha2.le.500) width_ha2= width_ha2_best 
       shift_ha2 = shift_ha2_best + step_shift_ha2*gasdev()

	!SIIa EXTRA
      anorm_s2asb = anorm_s2asb_best + step_anorm_s2asb*gasdev()
        if(anorm_s2asb.le.0) anorm_s2asb = 0.01
      width_s2asb  = width_s2asb _best + step_width_s2asb *gasdev()
      shift_s2asb  = shift_s2asb _best + step_shift_s2asb *gasdev()

       anorm_s2bsb = anorm_s2bsb_best + step_anorm_s2bsb*gasdev()
          if(anorm_s2bsb.le.0) anorm_s2bsb = 0.01




      call fit_jed(anorm_pl,			!2
     *     slope1,slope2,wave_break,  		!3,4,5
     *     anorm_Fe2t,				!6
     *     anorm_hb,width_hb,shift_hb,		!7,8,9
     *     anorm_hdelta,width_hb,shift_hb,	!10
     *     anorm_hgamma,width_hb,shift_hb, 	!11
     *     anorm_h8,width_hb,shift_hb, 		!12
     *     anorm_hepsilon,width_hb,shift_hb, 	!13
     *     anorm_mg2a,width_mg2a,shift_mg2a,	!14,15,16
     *     anorm_oiii2672,width_oiii2672,shift_oiii2672,	!17,18,19
     *     anorm_oiii3133,width_oiii2672,shift_oiii2672,	!20
     *     anorm_heii4685,width_heii4685,shift_heii4685,	!21,22,23
     *     anorm_hei3188,width_heii4685,shift_heii4685, 	!24
     *     anorm_hei3588,width_heii4685,shift_heii4685, 	!25
     *     anorm_hei3889,width_heii4685,shift_heii4685, 	!26
     *     anorm_hei5875,width_heii4685,shift_heii4685, 	!27
     *     anorm_o3a,width_o3a,shift_o3a,			!28,29,30
     *     anorm_hbnc,width_o3a,shift_o3a,			!31
     *     anorm_heii4685nc,width_o3a,shift_o3a,		!32
     *     anorm_fevii5160,width_fevii5160,shift_fevii5160,	!33,90,91
     *     anorm_fevi5177,width_fevii5160,shift_fevii5160,	!34
     *     anorm_oiii4363,width_o3a,shift_o3a,			!35
     *     anorm_ni5200,width_o3a,shift_o3a, 			!36
     *     anorm_cii2326,width_hb,shift_hb, 			!37
     *     anorm_neiv2423,width_o3a,shift_o3a, 			!38
     *     anorm_oii2471,width_o3a,shift_o3a, 			!39
     *     anorm_alii2669,width_hb,shift_hb, 			!40
     *     anorm_nev3346,width_o3a,shift_o3a, 			!41
     *     anorm_nev3426,width_nev3426,shift_nev3426,		!42,43,44 CORONAL LINE UV
     *     anorm_fevii3587,width_nev3426,shift_nev3426,		!45 link coronal
     *     anorm_oii3728,width_o3a,shift_o3a, 			!46
     *     anorm_fevii3759,width_nev3426,shift_nev3426, 	!47 link coronal
     *     anorm_neiii3869,width_o3a,shift_o3a, 		!48
     *     anorm_neiii3968,width_o3a,shift_o3a, 		!49
     *     anorm_fev4072,width_o3a,shift_o3a, 			!50
     *     anorm_sii4073,width_o3a,shift_o3a, 			!51
     *     anorm_hb2,width_hb2,shift_hb2, 			!52,53,54
     *     anorm_mg2ae,width_mg2ae,shift_mg2ae, 		!55,56,57
     *     anorm_o3asb,width_o3asb,shift_o3asb,			!58,59,60
     *     anorm_hdeltanc,width_o3a,shift_o3a,			!61
     *     anorm_hgammanc,width_o3a,shift_o3a, 			!62
     *     anorm_hei4472,width_heii4685,shift_heii4685, 	!63
     *     anorm_balcont,					!64
     *     anorm_highbal,					!65
     *     anorm_Fe2t_opt,					!66
     *	   anorm_ha,width_ha,shift_ha,				!67,68,69
     *     anorm_hanc,width_hanc,shift_hanc, 			!70,71,72
     *     anorm_s2a,width_hanc,shift_hanc, 			!73
     *     anorm_s2b,width_hanc,shift_hanc, 			!74
     *     anorm_o1a,width_hanc,shift_hanc, 			!75
     *     anorm_n2a,width_hanc,shift_hanc, 			!76
     *     anorm_ha2,width_ha2,shift_ha2, 			!77,78,79
     *     anorm_s2asb,width_s2asb,shift_s2asb,			!80,81,82
     *     anorm_s2bsb,width_s2asb,shift_s2asb,			!83
     *	   anorm_hei7067,width_heii4685,shift_heii4685,		!84
     *	   anorm_ariii7138,width_hanc,shift_hanc,		!85 link coronal
     *	   anorm_fexi7894,width_fevii5160,shift_fevii5160,	!86 link coronal
     *	   anorm_oii7321,width_hanc,shift_hanc,		        !87 link nc
     *	   anorm_niiii7892,width_hanc,shift_hanc,	        !88 link nc
     *	   anorm_fevii6086,width_fevii5160,shift_fevii5160,	!89 link coronal
     *     chi2)						

          !print*,'ILE list',ile_matrix,ile_big_loop


	!ERROR
        matrix_chi2(ile_matrix,1)=chi2
        matrix_chi2(ile_matrix,2)=anorm_pl
        matrix_chi2(ile_matrix,3)=slope1
        matrix_chi2(ile_matrix,4)=slope2
        matrix_chi2(ile_matrix,5)=wave_break
        matrix_chi2(ile_matrix,6)=anorm_Fe2t
        matrix_chi2(ile_matrix,7)=anorm_hb
        matrix_chi2(ile_matrix,8)=width_hb
        matrix_chi2(ile_matrix,9)=shift_hb
        matrix_chi2(ile_matrix,10)=anorm_hdelta
        matrix_chi2(ile_matrix,11)=anorm_hgamma
        matrix_chi2(ile_matrix,12)=anorm_h8
        matrix_chi2(ile_matrix,13)=anorm_hepsilon
        matrix_chi2(ile_matrix,14)=anorm_mg2a
        matrix_chi2(ile_matrix,15)=width_mg2a
        matrix_chi2(ile_matrix,16)=shift_mg2a
        matrix_chi2(ile_matrix,17)=anorm_oiii2672
        matrix_chi2(ile_matrix,18)=width_oiii2672
        matrix_chi2(ile_matrix,19)=shift_oiii2672
        matrix_chi2(ile_matrix,20)=anorm_oiii3133
        matrix_chi2(ile_matrix,21)=anorm_heii4685
        matrix_chi2(ile_matrix,22)=width_heii4685
        matrix_chi2(ile_matrix,23)=shift_heii4685
        matrix_chi2(ile_matrix,24)=anorm_hei3188
        matrix_chi2(ile_matrix,25)=anorm_hei3588
        matrix_chi2(ile_matrix,26)=anorm_hei3889
        matrix_chi2(ile_matrix,27)=anorm_hei5875
        matrix_chi2(ile_matrix,28)=anorm_o3a
        matrix_chi2(ile_matrix,29)=width_o3a
        matrix_chi2(ile_matrix,30)=shift_o3a
        matrix_chi2(ile_matrix,31)=anorm_hbnc
        matrix_chi2(ile_matrix,32)=anorm_heii4685nc
        matrix_chi2(ile_matrix,33)=anorm_fevii5160
        matrix_chi2(ile_matrix,34)=anorm_fevi5177
        matrix_chi2(ile_matrix,35)=anorm_oiii4363
        matrix_chi2(ile_matrix,36)=anorm_ni5200
        matrix_chi2(ile_matrix,37)=anorm_cii2326
        matrix_chi2(ile_matrix,38)=anorm_neiv2423
        matrix_chi2(ile_matrix,39)=anorm_oii2471
        matrix_chi2(ile_matrix,40)=anorm_alii2669
        matrix_chi2(ile_matrix,41)=anorm_nev3346
        matrix_chi2(ile_matrix,42)=anorm_nev3426
        matrix_chi2(ile_matrix,43)=width_nev3426
        matrix_chi2(ile_matrix,44)=shift_nev3426
        matrix_chi2(ile_matrix,45)=anorm_fevii3587
        matrix_chi2(ile_matrix,46)=anorm_oii3728
        matrix_chi2(ile_matrix,47)=anorm_fevii3759
        matrix_chi2(ile_matrix,48)=anorm_neiii3869
        matrix_chi2(ile_matrix,49)=anorm_neiii3968
        matrix_chi2(ile_matrix,50)=anorm_fev4072
        matrix_chi2(ile_matrix,51)=anorm_sii4073
        matrix_chi2(ile_matrix,52)=anorm_hb2
        matrix_chi2(ile_matrix,53)=width_hb2
        matrix_chi2(ile_matrix,54)=shift_hb2
        matrix_chi2(ile_matrix,55)=anorm_mg2ae
        matrix_chi2(ile_matrix,56)=width_mg2ae
        matrix_chi2(ile_matrix,57)=shift_mg2ae
        matrix_chi2(ile_matrix,58)=anorm_o3asb
        matrix_chi2(ile_matrix,59)=width_o3asb
        matrix_chi2(ile_matrix,60)=shift_o3asb
        matrix_chi2(ile_matrix,61)=anorm_hdeltanc
        matrix_chi2(ile_matrix,62)=anorm_hgammanc
        matrix_chi2(ile_matrix,63)=anorm_hei4472
        matrix_chi2(ile_matrix,64)=anorm_balcont
        matrix_chi2(ile_matrix,65)=anorm_highbal
        matrix_chi2(ile_matrix,66)=anorm_Fe2t_opt
        matrix_chi2(ile_matrix,67)=anorm_ha
        matrix_chi2(ile_matrix,68)=width_ha
        matrix_chi2(ile_matrix,69)=shift_ha
        matrix_chi2(ile_matrix,70)=anorm_hanc
        matrix_chi2(ile_matrix,71)=width_hanc
        matrix_chi2(ile_matrix,72)=shift_hanc
        matrix_chi2(ile_matrix,73)=anorm_s2a
        matrix_chi2(ile_matrix,74)=anorm_s2b
        matrix_chi2(ile_matrix,75)=anorm_o1a
        matrix_chi2(ile_matrix,76)=anorm_n2a
        matrix_chi2(ile_matrix,77)=anorm_ha2
        matrix_chi2(ile_matrix,78)=width_ha2
        matrix_chi2(ile_matrix,79)=shift_ha2
        matrix_chi2(ile_matrix,80)=anorm_s2asb
        matrix_chi2(ile_matrix,81)=width_s2asb
        matrix_chi2(ile_matrix,82)=shift_s2asb
        matrix_chi2(ile_matrix,83)=anorm_s2bsb
        matrix_chi2(ile_matrix,84)=anorm_hei7067
        matrix_chi2(ile_matrix,85)=anorm_ariii7138
        matrix_chi2(ile_matrix,86)=anorm_fexi7894
        matrix_chi2(ile_matrix,87)=anorm_oii7321
        matrix_chi2(ile_matrix,88)=anorm_niiii7892
        matrix_chi2(ile_matrix,89)=anorm_fevii6086
        matrix_chi2(ile_matrix,90)=width_fevii5160
        matrix_chi2(ile_matrix,91)=shift_fevii5160
c        !matrix_chi2(ile_matrix,73)=chi2b
c        !matrix_chi2(ile_matrix,74)=chi2c


          !print *, 'jed_hb',anorm_hb_best,width_hb_best,shift_hb_best 
          !print *, 'jed_hdelta',anorm_hdelta_best
          !print *, 'jed_hgamma',anorm_hgamma_best
          !print *, 'jed_h8',anorm_h8_best
          !print *, 'jed_hepsilon',anorm_hepsilon_best


        !print *,'matrix wi        matrix_chi2(ile_matrix,26)=anorm_fevi5177dth hb',  ile_matrix,matrix_chi2(ile_matrix,3),chi2 !Print chi2 before sort

	!print *, 'CHI2 list', ile_matrix,matrix_chi2(ile_matrix,1),chi2 !Print chi2 before sort
	!print *, 'anorm hbnc', ile_matrix,matrix_chi2(ile_matrix,22),chi2 !Print chi2 before sort
c        print *, 'matrix_mg2', matrix_chi2(ile_matrix,17),
c     *		 matrix_chi2(ile_matrix,18), 
c     *		 matrix_chi2(ile_matrix,19)
c        print *, 'matrix_o3_2672', matrix_chi2(ile_matrix,20),
c     *		 matrix_chi2(ile_matrix,21), 
c     *		 matrix_chi2(ile_matrix,22)

c      print *, 'jed_chi', chi2,chi2_best
      if(chi2.le.chi2_best)  then!.and.chi2b<=chi2b_best.and.chi2c<=chi2c_best  

	!!!POWERLAW
         anorm_pl_best = anorm_pl
c 	 print *, 'anorm_pl', anorm_pl_best

         slope1_best = slope1

         slope2_best = slope2

         wave_break_best = wave_break
c         print *, 'pl_vals',slope1_best,slope2_best,
c     *		wave_break_best



	!!!PSEUCONTINUUMS
         anorm_Fe2t_best = anorm_Fe2t
         !print *, 'fe2',anorm_Fe2t_best

         anorm_Fe2t_opt_best = anorm_Fe2t_opt

         anorm_balcont_best = anorm_balcont

         anorm_highbal_best = anorm_highbal



	!!!! BC OPTICAL
         anorm_hb_best = anorm_hb
         !print *, 'flux_hb', anorm_hb_best
         width_hb_best = width_hb
         shift_hb_best = shift_hb
         !print *, 'if_hb',anorm_hb_best,width_hb_best,shift_hb_best 

         anorm_hdelta_best = anorm_hdelta
          !print *, 'if_hdelta',anorm_hdelta_best

         anorm_hgamma_best = anorm_hgamma
          !print *, 'if_hgamma',anorm_hgamma_best

         anorm_h8_best = anorm_h8 
         !print *, 'if_h8',anorm_h8_best

         anorm_hepsilon_best = anorm_hepsilon
         !print *, 'if_hepsilon',anorm_hepsilon_best

         anorm_alii2669_best = anorm_alii2669
         !print *, 'if_alii2669',anorm_alii2669_best

         anorm_cii2326_best = anorm_cii2326
         !print *, 'if_cii2326',anorm_cii2326_best



	!!!! MG2
         anorm_mg2a_best = anorm_mg2a
         width_mg2a_best = width_mg2a
         shift_mg2a_best = shift_mg2a
c         print *, 'if_mg2',anorm_mg2a_best,width_mg2a_best,
c     *		 shift_mg2a_best 




	!!! OIII UV
         anorm_oiii2672_best = anorm_oiii2672
         width_oiii2672_best = width_oiii2672
         shift_oiii2672_best = shift_oiii2672
c         print *, 'if_oiii_2672',anorm_oiii2672_best,width_oiii2672
c     *		  _best,shift_oiii2672_best 

         anorm_oiii3133_best = anorm_oiii3133
         !print *, 'if_oiii3133',anorm_oiii3133_best




	!!! HELIOS 
         anorm_heii4685_best = anorm_heii4685
         width_heii4685_best = width_heii4685
         shift_heii4685_best = shift_heii4685
c         print *, 'if_heii4685',anorm_heii4685_best,width_heii4685
c     *		  _best,shift_heii4685_best 

         anorm_hei3188_best = anorm_hei3188
         !print *, 'if_hei3188',anorm_hei3188_best

         anorm_hei3588_best = anorm_hei3588
         !print *, 'if_hei3588',anorm_hei3588_best

         anorm_hei3889_best = anorm_hei3889
         !print *, 'if_hei3889',anorm_hei3889_best

         anorm_hei5875_best = anorm_hei5875
         !print *, 'if_hei5875',anorm_hei5875_best

         anorm_hei4472_best = anorm_hei4472
         !print *, 'if_hei4472',anorm_hei4472_best

         anorm_hei7067_best = anorm_hei7067




	!!!! NC ALREDEDOR DE HB
         anorm_o3a_best = anorm_o3a
         width_o3a_best = width_o3a
         shift_o3a_best = shift_o3a
c         print *, 'if_o3a',anorm_o3a_best,width_o3a
c     *		  _best,shift_o3a_best 

         anorm_hbnc_best = anorm_hbnc
         !print *, 'if_hbnc',anorm_hbnc_best,anorm_o3a_best

         anorm_heii4685nc_best = anorm_heii4685nc
         !print *, 'if_heii4685nc',anorm_heii4685nc_best

         anorm_oiii4363_best = anorm_oiii4363
         !print *, 'if_oiii_4363',anorm_oiii_4363_best

         anorm_ni5200_best = anorm_ni5200
         !print *, 'if_ni5200',anorm_ni5200_best

         anorm_neiv2423_best = anorm_neiv2423
         !print *, 'if_neiv2423',anorm_neiv2423_best

         anorm_oii2471_best = anorm_oii2471
         !print *, 'if_oii2471',anorm_oii2471_best

         anorm_nev3346_best = anorm_nev3346
         !print *, 'if_nev3346',anorm_nev3346_best

         anorm_oii3728_best = anorm_oii3728
         !print *, 'if_oii3728',anorm_oii3728_best

         anorm_neiii3869_best = anorm_neiii3869
         !print *, 'if_neiii3869',anorm_neiii3869_best

         anorm_neiii3968_best = anorm_neiii3968
         !print *, 'if_neiii3968',anorm_neiii3968_best

         anorm_fev4072_best = anorm_fev4072
         !print *, 'if_fev4072',anorm_fev4072_best

         anorm_sii4073_best = anorm_sii4073
         !print *, 'if_sii4073',anorm_sii4073_best

         anorm_hdeltanc_best = anorm_hdeltanc
          !print *, 'if_hdeltanc',anorm_hdeltanc_best

         anorm_hgammanc_best = anorm_hgammanc
          !print *, 'if_hgammanc',anorm_hgammanc_best





	!!! CORONAL LINES UV
         anorm_nev3426_best = anorm_nev3426
         !print *, 'if_nev3426',anorm_nev3426_best
         width_nev3426_best = width_nev3426
         shift_nev3426_best = shift_nev3426

         anorm_fevii3587_best = anorm_fevii3587
         !print *, 'if_fevii3587',anorm_fevii3587_best

         anorm_fevii3759_best = anorm_fevii3759
         !print *, 'if_fevii3759',anorm_fevii3759_best




	!!! CORONAL LINES OPT
         anorm_fevii5160_best = anorm_fevii5160
         width_fevii5160_best = width_fevii5160
         shift_fevii5160_best = shift_fevii5160

         anorm_fevi5177_best = anorm_fevi5177
         !print *, 'if_fe7_5177',anorm_fevi5177_best

         anorm_fexi7894_best = anorm_fexi7894

         anorm_fevii6086_best = anorm_fevii6086




	!!! HA BC
         anorm_ha_best = anorm_ha
         width_ha_best = width_ha
         shift_ha_best = shift_ha




	!!! HANC AND LINEAS ALREDEDOR
         anorm_hanc_best = anorm_hanc
         width_hanc_best = width_hanc
         shift_hanc_best = shift_hanc

         anorm_s2a_best = anorm_s2a

         anorm_s2b_best = anorm_s2b

         anorm_o1a_best = anorm_o1a

         anorm_n2a_best = anorm_n2a

         anorm_niiii7892_best = anorm_niiii7892

         anorm_ariii7138_best = anorm_ariii7138

         anorm_oii7321_best = anorm_oii7321




	!!! COMPONENTES EXTRAS
         anorm_hb2_best = anorm_hb2
         width_hb2_best = width_hb2
         shift_hb2_best = shift_hb2
c         print *, 'if_hb_extra',anorm_hb2_best,width_hb2_best,
c     *		  shift_hb2_best 

         anorm_mg2ae_best = anorm_mg2ae
         width_mg2ae_best = width_mg2ae
         shift_mg2ae_best = shift_mg2ae
c         print *, 'if_mg2ae',anorm_mg2ae_best,width_mg2ae_best,
c     *		  shift_mg2ae_best 

         anorm_o3asb_best = anorm_o3asb
         width_o3asb_best = width_o3asb
         shift_o3asb_best = shift_o3asb
c         print *, 'if_o3asb_extra',anorm_o3asb_best,width_o3asb_best,
c     *		  shift_o3asb_best 

         anorm_ha2_best = anorm_ha2
         width_ha2_best = width_ha2
         shift_ha2_best = shift_ha2


         anorm_s2asb_best = anorm_s2asb
         width_s2asb_best = width_s2asb
         shift_s2asb_best = shift_s2asb

         anorm_s2bsb_best = anorm_s2bsb

         chi2_best = chi2

         !chi2b_best = chi2b

         !chi2c_best = chi2c



      !print *, ' chi2 best: ',chi2_best,' chi2/dof  = ',chi2_best/jmax
c      print *,' best fit param'
c      print *, 'slope', anorm_pl_best,beta_best
c      print *, 'Fe3 temp', anorm_FeIII_best
c      print *, 'Fe2 temp', anorm_Fe2t_best
      !print *, 'Hb after', anorm_hb_best, width_hb_best
c      print *, 'Si3', anorm_si_best!,width_best
c      print *, 'C3', anorm_c3_best,width_c3_best
c      print *, 'Fe3 1914', anorm_fe3_best,width_fe3_best,shift_fe3_best
c      print *, 'Si2', anorm_si2_best,width_si2_best
c      print *, 'N3', anorm_n3_best,width_n3_best
c      print *, 'Fe2 1715', anorm_fe2_1715_best,width_fe2_1715_best,
c     *          shift_fe2_1715_best
c      print *, 'Fe2 1785', anorm_fe2_1785_best,width_fe2_1785_best,
c     *          shift_fe2_1785_best
c      print *, 'Fe2 2020', anorm_fe2_2020_best,width_fe2_2020_best,
c     *          shift_fe2_2020_best
c      print *, 'Fe3 2080', anorm_fe3_2080_best,width_fe3_2080_best,
c     *          shift_fe3_2080_best

      end if


c      print *, '+++test++++',ile_big_loop,iter_max
      if (ile_big_loop.eq.iter_max) then

c      if(accuracy.lt.0.01) then

c         print *, 'ile accuracy loop accuracy ',ile_accuracy_loop,
c     *        iter_accuracy_loop_max
c         print *, 'accuracy',
c     *         chi2_best_old - chi2_best,chi2_best_old, chi2_best
         chi2_best_old = chi2_best
         
	 !chi2b_best_old = chi2b_best
         !chi2c_best_old = chi2c_best

          !print *, 'new chi old', chi2_best_old
          !print *,'BEFORE accuracy',accuracy_factor

         if(ile_accuracy_loop.lt.iter_accuracy_loop_max) then
            accuracy_factor = 0.5*accuracy_factor
            ile_accuracy_loop =ile_accuracy_loop + 1
            !print *,'IF accuracy',accuracy_factor,ile_accuracy_loop
            ile_big_loop = 0
            goto 5511
         else
            print *, ' model converged '
            !print *, 'spec',matrix_chi2(1,1),matrix_chi2(70,1)
            !print *, 'chi2 test',ile_matrix,chi2

        !print *, 'before rys chi2', chi2

       call fit_jed_rys(anorm_pl,		!2
     *     slope1,slope2,wave_break,  		!3,4,5
     *     anorm_Fe2t,				!6
     *     anorm_hb,width_hb,shift_hb,		!7,8,9
     *     anorm_hdelta,width_hb,shift_hb,	!10
     *     anorm_hgamma,width_hb,shift_hb, 	!11
     *     anorm_h8,width_hb,shift_hb, 		!12
     *     anorm_hepsilon,width_hb,shift_hb, 	!13
     *     anorm_mg2a,width_mg2a,shift_mg2a,	!14,15,16
     *     anorm_oiii2672,width_oiii2672,shift_oiii2672,	!17,18,19
     *     anorm_oiii3133,width_oiii2672,shift_oiii2672,	!20
     *     anorm_heii4685,width_heii4685,shift_heii4685,	!21,22,23
     *     anorm_hei3188,width_heii4685,shift_heii4685, 	!24
     *     anorm_hei3588,width_heii4685,shift_heii4685, 	!25
     *     anorm_hei3889,width_heii4685,shift_heii4685, 	!26
     *     anorm_hei5875,width_heii4685,shift_heii4685, 	!27
     *     anorm_o3a,width_o3a,shift_o3a,			!28,29,30
     *     anorm_hbnc,width_o3a,shift_o3a,			!31
     *     anorm_heii4685nc,width_o3a,shift_o3a,		!32
     *     anorm_fevii5160,width_fevii5160,shift_fevii5160,	!33,90,91
     *     anorm_fevi5177,width_fevii5160,shift_fevii5160,	!34
     *     anorm_oiii4363,width_o3a,shift_o3a,			!35
     *     anorm_ni5200,width_o3a,shift_o3a, 			!36
     *     anorm_cii2326,width_hb,shift_hb, 			!37
     *     anorm_neiv2423,width_o3a,shift_o3a, 			!38
     *     anorm_oii2471,width_o3a,shift_o3a, 			!39
     *     anorm_alii2669,width_hb,shift_hb, 			!40
     *     anorm_nev3346,width_o3a,shift_o3a, 			!41
     *     anorm_nev3426,width_nev3426,shift_nev3426,		!42,43,44 CORONAL LINE UV
     *     anorm_fevii3587,width_nev3426,shift_nev3426,		!45 link coronal
     *     anorm_oii3728,width_o3a,shift_o3a, 			!46
     *     anorm_fevii3759,width_nev3426,shift_nev3426, 	!47 link coronal
     *     anorm_neiii3869,width_o3a,shift_o3a, 		!48
     *     anorm_neiii3968,width_o3a,shift_o3a, 		!49
     *     anorm_fev4072,width_o3a,shift_o3a, 			!50
     *     anorm_sii4073,width_o3a,shift_o3a, 			!51
     *     anorm_hb2,width_hb2,shift_hb2, 			!52,53,54
     *     anorm_mg2ae,width_mg2ae,shift_mg2ae, 		!55,56,57
     *     anorm_o3asb,width_o3asb,shift_o3asb,			!58,59,60
     *     anorm_hdeltanc,width_o3a,shift_o3a,			!61
     *     anorm_hgammanc,width_o3a,shift_o3a, 			!62
     *     anorm_hei4472,width_heii4685,shift_heii4685, 	!63
     *     anorm_balcont,					!64
     *     anorm_highbal,					!65
     *     anorm_Fe2t_opt,					!66
     *	   anorm_ha,width_ha,shift_ha,				!67,68,69
     *     anorm_hanc,width_hanc,shift_hanc, 			!70,71,72
     *     anorm_s2a,width_hanc,shift_hanc, 			!73
     *     anorm_s2b,width_hanc,shift_hanc, 			!74
     *     anorm_o1a,width_hanc,shift_hanc, 			!75
     *     anorm_n2a,width_hanc,shift_hanc, 			!76
     *     anorm_ha2,width_ha2,shift_ha2, 			!77,78,79
     *     anorm_s2asb,width_s2asb,shift_s2asb,			!80,81,82
     *     anorm_s2bsb,width_s2asb,shift_s2asb,			!83
     *	   anorm_hei7067,width_heii4685,shift_heii4685,		!84
     *	   anorm_ariii7138,width_hanc,shift_hanc,		!85 link coronal
     *	   anorm_fexi7894,width_fevii5160,shift_fevii5160,	!86 link coronal
     *	   anorm_oii7321,width_hanc,shift_hanc,		        !87 link nc
     *	   anorm_niiii7892,width_hanc,shift_hanc,	        !88 link nc
     *	   anorm_fevii6086,width_fevii5160,shift_fevii5160,	!89 link coronal
     *     chi2)	

            return

         end if

      end if

      goto 678

      return
      end subroutine fit_auto_mcmc







      subroutine error_mcmc()
       use params
       use one_spec
      implicit none

      integer :: k1,k2
      integer :: k1max, k2max,k1best

      real :: chi2_best_err, chi2_min

      !real :: chi2b_best_err, chi2b_min

      real :: chi2c_best_err, chi2c_min

      integer :: i_csv, nrow, i_cols
c      real, dimension(1,1000) :: matrix_csv

      real :: anorm_pl_err                         
      real :: slope1_err, slope2_err                     
      real :: wave_break_err
      real :: anorm_Fe2t_err, width_Fe2t_err,shift_Fe2t_err 
      real :: anorm_Fe2t_opt_err, width_Fe2t_opt_err,shift_Fe2t_opt_err 
      real :: anorm_cii2326_err, width_cii2326_err,shift_cii2326_err
      real :: anorm_neiv2423_err,width_neiv2423_err,shift_neiv2423_err
      real :: anorm_oii2471_err,width_oii2471_err,shift_oii2471_err
      real :: anorm_alii2669_err,width_alii2669_err,shift_alii2669_err
      real :: anorm_oiii2672_err,width_oiii2672_err,shift_oiii2672_err
      real :: anorm_mg2a_err,width_mg2a_err,shift_mg2a_err
      real :: anorm_mg2b_err,width_mg2b_err,shift_mg2b_err
      real :: anorm_oiii3133_err,width_oiii3133_err,shift_oiii3133_err
      real :: anorm_nev3346_err,width_nev3346_err,shift_nev3346_err
      real :: anorm_nev3426_err,width_nev3426_err,shift_nev3426_err
      real :: anorm_fevii3587_err,width_fevii3587_err
      real :: shift_fevii3587_err
      real :: anorm_hei3588_err,width_hei3588_err,shift_hei3588_err
      real :: anorm_oii3728_err,width_oii3728_err,shift_oii3728_err
      real :: anorm_fevii3759_err,width_fevii3759_err
      real :: shift_fevii3759_err
      real :: anorm_neiii3869_err,width_neiii3869_err
      real :: shift_neiii3869_err, anorm_hei3188_err
      real :: anorm_hei3889_err,width_hei3889_err,shift_hei3889_err
      real :: anorm_h8_err,width_h8_err,shift_h8_err
      real :: anorm_neiii3968_err,width_neiii3968_err
      real :: shift_neiii3968_err
      real :: anorm_hepsilon_err,width_hepsilon_err,shift_hepsilon_err
      real :: anorm_fev4072_err,width_fev4072_err,shift_fev4072_err
      real :: anorm_sii4073_err,width_sii4073_err,shift_sii4073_err
      real :: anorm_hdelta_err,width_hdelta_err,shift_hdelta_err
      real :: anorm_hdeltanc_err,width_hdeltanc_err,shift_hdeltanc_err
      real :: anorm_hgamma_err,width_hgamma_err,shift_hgamma_err
      real :: anorm_hgammanc_err,width_hgammanc_err,shift_hgammanc_err
      real :: anorm_oiii4363_err,width_oiii4363_err,shift_oiii4363_err                  
      real :: anorm_hei4472_err,width_hei4472_err,shift_hei4472_err
      real :: anorm_heii4685_err,width_heii4685_err,shift_heii4685_err
      real :: anorm_heii4685nc_err,width_heii4685nc_err
      real :: shift_heii4685nc_err,shift_hei3188_err
      real :: anorm_hb_err,width_hb_err,shift_hb_err
      real :: anorm_hbnc_err,width_hbnc_err,shift_hbnc_err
      real :: anorm_o3a_err,width_o3a_err,shift_o3a_err
      real :: anorm_o3b_err,width_o3b_err,shift_o3b_err
      real :: anorm_fevii5160_err,width_fevii5160_err
      real :: shift_fevii5160_err   
      real :: anorm_fevi5177_err,width_fevi5177_err
      real :: shift_fevi5177_err 
      real :: anorm_ni5200_err,width_ni5200_err,shift_ni5200_err
      real :: anorm_hei5875_err,width_hei5875_err
      real :: shift_hei5875_err
      real :: anorm_hei5875nc_err,width_hei5875nc_err
      real :: shift_hei5875nc_err
      real :: anorm_mg2ae_err,width_mg2ae_err,shift_mg2ae_err
      real :: anorm_mg2be_err,width_mg2be_err,shift_mg2be_err
      real :: anorm_hb2_err,width_hb2_err,shift_hb2_err
      real :: anorm_o3asb_err,width_o3asb_err,shift_o3asb_err 
      real :: anorm_o3bsb_err,width_o3bsb_err,shift_o3bsb_err 
      real :: anorm_balcont_err, anorm_highbal_err
      real :: anorm_ha_err,width_ha_err,shift_ha_err
      real :: anorm_hanc_err, width_hanc_err,shift_hanc_err              
      real :: anorm_s2a_err
      real :: anorm_s2b_err
      real :: anorm_o1a_err
      real :: anorm_o1b_err
      real :: anorm_n2a_err
      real :: anorm_n2b_err                            !30
      real :: anorm_ha2_err,width_ha2_err,shift_ha2_err
      real :: anorm_s2asb_err,width_s2asb_err,shift_s2asb_err
      real :: anorm_s2bsb_err
      real :: anorm_hei7067_err, anorm_ariii7138_err
      real :: anorm_oii7321_err, anorm_niiii7892_err
      real :: anorm_fexi7894_err
      real :: anorm_fevii6086_err,width_fevii6086_err
      real :: shift_fevii6086_err



      real :: anorm_pl_max,anorm_pl_min                !2
      real :: slope1_max,slope1_min
      real :: slope2_max,slope2_min
      real :: wave_break_max,wave_break_min
      real :: anorm_Fe2t_max,anorm_Fe2t_min
      real :: width_Fe2t_max,width_Fe2t_min
      real :: shift_Fe2t_max,shift_Fe2t_min
      real :: anorm_Fe2t_opt_max,anorm_Fe2t_opt_min
      real :: anorm_cii2326_max,anorm_cii2326_min
      real :: width_cii2326_max,width_cii2326_min
      real :: shift_cii2326_max,shift_cii2326_min
      real :: anorm_neiv2423_max,anorm_neiv2423_min
      real :: width_neiv2423_max,width_neiv2423_min
      real :: shift_neiv2423_max,shift_neiv2423_min
      real :: anorm_oii2471_max,anorm_oii2471_min
      real :: width_oii2471_max,width_oii2471_min
      real :: shift_oii2471_max,shift_oii2471_min
      real :: anorm_oiii2672_max,anorm_oiii2672_min
      real :: shift_oiii2672_max,shift_oiii2672_min
      real :: width_oiii2672_max,width_oiii2672_min
      real :: anorm_mg2a_max,anorm_mg2a_min
      real :: width_mg2a_max,width_mg2a_min
      real :: shift_mg2a_max,shift_mg2a_min
      real :: anorm_mg2b_max,anorm_mg2b_min
      real :: width_mg2b_max,width_mg2b_min
      real :: shift_mg2b_max,shift_mg2b_min
      real :: anorm_alii2669_max,anorm_alii2669_min
      real :: anorm_oiii3133_max,anorm_oiii3133_min
      real :: width_oiii3133_max,width_oiii3133_min
      real :: shift_oiii3133_max,shift_oiii3133_min
      real :: anorm_hei3188_max,anorm_hei3188_min
      real :: width_hei3188_max,width_hei3188_min
      real :: anorm_nev3346_max,anorm_nev3346_min
      real :: anorm_nev3426_max,anorm_nev3426_min
      real :: width_nev3426_max,width_nev3426_min
      real :: shift_nev3426_max,shift_nev3426_min
      real :: anorm_fevii3587_max,anorm_fevii3587_min
      real :: width_fevii3587_max,width_fevii3587_min
      real :: shift_fevii3587_max,shift_fevii3587_min
      real :: anorm_hei3588_max,anorm_hei3588_min
      real :: width_hei3588_max,width_hei3588_min
      real :: shift_hei3588_max,shift_hei3588_min
      real :: anorm_oii3728_max,anorm_oii3728_min
      real :: width_oii3728_max,width_oii3728_min
      real :: shift_oii3728_max,shift_oii3728_min
      real :: anorm_fevii3759_max,anorm_fevii3759_min
      real :: width_fevii3759_max,width_fevii3759_min
      real :: shift_fevii3759_max,shift_fevii3759_min
      real :: anorm_neiii3869_max,anorm_neiii3869_min
      real :: width_neiii3869_max,width_neiii3869_min
      real :: shift_neiii3869_max,shift_neiii3869_min
      real :: anorm_hei3889_max,anorm_hei3889_min
      real :: width_hei3889_max,width_hei3889_min
      real :: shift_hei3889_max,shift_hei3889_min
      real :: anorm_h8_max,anorm_h8_min
      real :: width_h8_max,width_h8_min
      real :: shift_h8_max,shift_h8_min
      real :: anorm_neiii3968_max,anorm_neiii3968_min
      real :: width_neiii3968_max,width_neiii3968_min
      real :: shift_neiii3968_max,shift_neiii3968_min
      real :: anorm_hepsilon_max,anorm_hepsilon_min
      real :: width_hepsilon_max,width_hepsilon_min
      real :: shift_hepsilon_max,shift_hepsilon_min
      real :: anorm_fev4072_max,anorm_fev4072_min
      real :: width_fev4072_max,width_fev4072_min
      real :: shift_fev4072_max,shift_fev4072_min
      real :: anorm_sii4073_max,anorm_sii4073_min
      real :: width_sii4073_max,width_sii4073_min
      real :: shift_sii4073_max,shift_sii4073_min
      real :: anorm_hgamma_max,anorm_hgamma_min
      real :: width_hgamma_max,width_hgamma_min
      real :: shift_hgamma_max,shift_hgamma_min
      real :: anorm_hgammanc_max,anorm_hgammanc_min
      real :: width_hgammanc_max,width_hgammanc_min
      real :: shift_hgammanc_max,shift_hgammanc_min
      real :: anorm_hdelta_max,anorm_hdelta_min
      real :: width_hdelta_max,width_hdelta_min
      real :: shift_hdelta_max,shift_hdelta_min
      real :: anorm_hdeltanc_max,anorm_hdeltanc_min
      real :: width_hdeltanc_max,width_hdeltanc_min
      real :: shift_hdeltanc_max,shift_hdeltanc_min
      real :: anorm_oiii4363_max,anorm_oiii4363_min   
      real :: width_oiii4363_max,width_oiii4363_min   
      real :: shift_oiii4363_max,shift_oiii4363_min   
      real :: anorm_hei4472_max,anorm_hei4472_min
      real :: width_hei4472_max,width_hei4472_min
      real :: shift_hei4472_max,shift_hei4472_min
      real :: anorm_heii4685_max,anorm_heii4685_min       
      real :: width_heii4685_max,width_heii4685_min       
      real :: shift_heii4685_max,shift_heii4685_min      
      real :: anorm_heii4685nc_max,anorm_heii4685nc_min       
      real :: width_heii4685nc_max,width_heii4685nc_min        
      real :: shift_heii4685nc_max,shift_heii4685nc_min       
      real :: anorm_hb_max,width_hb_max,shift_hb_max  
      real :: anorm_hb_min,width_hb_min,shift_hb_min
      real :: anorm_hbnc_max,width_hbnc_max,shift_hbnc_max  
      real :: anorm_hbnc_min,width_hbnc_min,shift_hbnc_min 
      real :: anorm_o3a_max,anorm_o3a_min
      real :: width_o3a_max,width_o3a_min
      real :: shift_o3a_max,shift_o3a_min
      real :: anorm_o3b_max,anorm_o3b_min
      real :: width_o3b_max,width_o3b_min
      real :: shift_o3b_max,shift_o3b_min
      real :: anorm_fevii5160_max,anorm_fevii5160_min
      real :: width_fevii5160_max,width_fevii5160_min              !40
      real :: shift_fevii5160_max,shift_fevii5160_min
      real :: anorm_fevi5177_max,anorm_fevi5177_min
      real :: width_fevi5177_max,width_fevi5177_min
      real :: shift_fevi5177_max,shift_fevi5177_min
      real :: anorm_ni5200_max,anorm_ni5200_min
      real :: width_ni5200_max,width_ni5200_min
      real :: shift_ni5200_max,shift_ni5200_min
      real :: anorm_hei5875_max,anorm_hei5875_min
      real :: width_hei5875_max,width_hei5875_min
      real :: shift_hei5875_max,shift_hei5875_min
      real :: anorm_hei5875nc_max,anorm_hei5875nc_min
      real :: width_hei5875nc_max,width_hei5875nc_min
      real :: shift_hei5875nc_max,shift_hei5875nc_min
      real :: anorm_mg2ae_max,anorm_mg2ae_min
      real :: width_mg2ae_max,width_mg2ae_min
      real :: shift_mg2ae_max,shift_mg2ae_min
      real :: anorm_mg2be_max,anorm_mg2be_min
      real :: width_mg2be_max,width_mg2be_min
      real :: shift_mg2be_max,shift_mg2be_min
      real :: anorm_hb2_max,width_hb2_max,shift_hb2_max  
      real :: anorm_hb2_min,width_hb2_min,shift_hb2_min
      real :: anorm_o3asb_max,anorm_o3asb_min
      real :: width_o3asb_max,width_o3asb_min
      real :: shift_o3asb_max,shift_o3asb_min
      real :: anorm_balcont_max,anorm_balcont_min
      real :: anorm_highbal_max,anorm_highbal_min
      real :: anorm_ha_max,anorm_ha_min                
      real :: width_ha_max,width_ha_min
      real :: shift_ha_max,shift_ha_min
      real :: anorm_hanc_max,anorm_hanc_min            
      real :: width_hanc_max,width_hanc_min            
      real :: shift_hanc_max,shift_hanc_min            
      real :: anorm_s2a_max,anorm_s2a_min
      real :: anorm_s2b_max,anorm_s2b_min
      real :: anorm_o1a_max,anorm_o1a_min
      real :: anorm_ha2_max,anorm_ha2_min
      real :: width_ha2_max,width_ha2_min
      real :: shift_ha2_max,shift_ha2_min  
      real :: anorm_n2a_max,anorm_n2a_min
      real :: anorm_s2asb_max,anorm_s2asb_min
      real :: width_s2asb_max,width_s2asb_min
      real :: shift_s2asb_max,shift_s2asb_min
      real :: anorm_s2bsb_max,anorm_s2bsb_min
      real :: anorm_ariii7138_max,anorm_ariii7138_min
      real :: anorm_oii7321_max,anorm_oii7321_min
      real :: anorm_niiii7892_max,anorm_niiii7892_min
      real :: anorm_fexi7894_max,anorm_fexi7894_min
      real :: anorm_hei7067_max,anorm_hei7067_min
      real :: anorm_fevii6086_max,anorm_fevii6086_min


      real :: errm_anorm_pl,errp_anorm_pl              !2
      real :: errm_slope1,errp_slope1
      real :: errm_slope2,errp_slope2
      real :: errm_wave_break,errp_wave_break
      real :: errm_anorm_Fe2t,errp_anorm_Fe2t
      real :: errm_anorm_Fe2t_opt,errp_anorm_Fe2t_opt
      real :: errm_width_Fe2t,errp_width_Fe2t
      real :: errm_shift_Fe2t,errp_shift_Fe2t
      real :: errm_anorm_cii2326,errp_anorm_cii2326
      real :: errm_width_cii2326,errp_width_cii2326
      real :: errm_shift_cii2326,errp_shift_cii2326
      real :: errm_anorm_neiv2423,errp_anorm_neiv2423
      real :: errm_width_neiv2423,errp_width_neiv2423
      real :: errm_shift_neiv2423,errp_shift_neiv2423
      real :: errm_anorm_oii2471,errp_anorm_oii2471
      real :: errm_width_oii2471,errp_width_oii2471
      real :: errm_shift_oii2471,errp_shift_oii2471
      real :: errm_anorm_alii2669,errp_anorm_alii2669
      real :: errm_width_alii2669,errp_width_alii2669
      real :: errm_shift_alii2669,errp_shift_alii2669
      real :: errm_anorm_oiii2672,errp_anorm_oiii2672
      real :: errm_width_oiii2672,errp_width_oiii2672
      real :: errm_shift_oiii2672,errp_shift_oiii2672
      real :: errm_anorm_mg2a,errp_anorm_mg2a
      real :: errm_width_mg2a,errp_width_mg2a
      real :: errm_shift_mg2a,errp_shift_mg2a
      real :: errm_anorm_mg2b,errp_anorm_mg2b
      real :: errm_width_mg2b,errp_width_mg2b
      real :: errm_shift_mg2b,errp_shift_mg2b
      real :: errm_anorm_oiii3133,errp_anorm_oiii3133
      real :: errm_width_oiii3133,errp_width_oiii3133
      real :: errm_shift_oiii3133,errp_shift_oiii3133
      real :: errm_anorm_hei3188,errp_anorm_hei3188
      real :: errm_width_hei3188,errp_width_hei3188
      real :: errm_shift_hei3188,errp_shift_hei3188
      real :: errm_anorm_nev3346,errp_anorm_nev3346
      real :: errm_width_nev3346,errp_width_nev3346
      real :: errm_shift_nev3346,errp_shift_nev3346
      real :: errm_anorm_nev3426,errp_anorm_nev3426
      real :: errm_width_nev3426,errp_width_nev3426
      real :: errm_shift_nev3426,errp_shift_nev3426
      real :: errm_anorm_fevii3587,errp_anorm_fevii3587
      real :: errm_width_fevii3587,errp_width_fevii3587
      real :: errm_shift_fevii3587,errp_shift_fevii3587
      real :: errm_anorm_hei3588,errp_anorm_hei3588
      real :: errm_width_hei3588,errp_width_hei3588
      real :: errm_shift_hei3588,errp_shift_hei3588
      real :: errm_anorm_oii3728,errp_anorm_oii3728
      real :: errm_width_oii3728,errp_width_oii3728
      real :: errm_shift_oii3728,errp_shift_oii3728
      real :: errm_anorm_fevii3759,errp_anorm_fevii3759
      real :: errm_width_fevii3759,errp_width_fevii3759
      real :: errm_shift_fevii3759,errp_shift_fevii3759
      real :: errm_anorm_neiii3869,errp_anorm_neiii3869
      real :: errm_width_neiii3869,errp_width_neiii3869
      real :: errm_shift_neiii3869,errp_shift_neiii3869
      real :: errm_anorm_hei3889,errp_anorm_hei3889
      real :: errm_width_hei3889,errp_width_hei3889
      real :: errm_shift_hei3889,errp_shift_hei3889
      real :: errm_anorm_h8,errp_anorm_h8
      real :: errm_width_h8,errp_width_h8
      real :: errm_shift_h8,errp_shift_h8
      real :: errm_anorm_neiii3968,errp_anorm_neiii3968
      real :: errm_width_neiii3968,errp_width_neiii3968
      real :: errm_shift_neiii3968,errp_shift_neiii3968
      real :: errm_anorm_hepsilon,errp_anorm_hepsilon
      real :: errm_width_hepsilon,errp_width_hepsilon
      real :: errm_shift_hepsilon,errp_shift_hepsilon
      real :: errm_anorm_fev4072,errp_anorm_fev4072
      real :: errm_width_fev4072,errp_width_fev4072
      real :: errm_shift_fev4072,errp_shift_fev4072
      real :: errm_anorm_sii4073,errp_anorm_sii4073
      real :: errm_width_sii4073,errp_width_sii4073
      real :: errm_shift_sii4073,errp_shift_sii4073
      real :: errm_anorm_hdelta,errp_anorm_hdelta
      real :: errm_width_hdelta,errp_width_hdelta
      real :: errm_shift_hdelta,errp_shift_hdelta
      real :: errm_anorm_hdeltanc,errp_anorm_hdeltanc
      real :: errm_width_hdeltanc,errp_width_hdeltanc
      real :: errm_shift_hdeltanc,errp_shift_hdeltanc
      real :: errm_anorm_hgamma,errp_anorm_hgamma
      real :: errm_width_hgamma,errp_width_hgamma
      real :: errm_shift_hgamma,errp_shift_hgamma
      real :: errm_anorm_hgammanc,errp_anorm_hgammanc
      real :: errm_width_hgammanc,errp_width_hgammanc
      real :: errm_shift_hgammanc,errp_shift_hgammanc
      real :: errm_anorm_oiii4363,errp_anorm_oiii4363
      real :: errm_width_oiii4363,errp_width_oiii4363
      real :: errm_shift_oiii4363,errp_shift_oiii4363
      real :: errm_anorm_hei4472,errp_anorm_hei4472
      real :: errm_width_hei4472,errp_width_hei4472
      real :: errm_shift_hei4472,errp_shift_hei4472
      real :: errm_anorm_heii4685,errp_anorm_heii4685
      real :: errm_width_heii4685,errp_width_heii4685
      real :: errm_shift_heii4685,errp_shift_heii4685       
      real :: errm_anorm_heii4685nc,errp_anorm_heii4685nc
      real :: errm_width_heii4685nc,errp_width_heii4685nc
      real :: errm_shift_heii4685nc,errp_shift_heii4685nc     
      real :: errm_anorm_hb,errp_anorm_hb       
      real :: errm_width_hb,errp_width_hb
      real :: errm_shift_hb,errp_shift_hb
      real :: errm_anorm_hbnc,errp_anorm_hbnc       
      real :: errm_width_hbnc,errp_width_hbnc
      real :: errm_shift_hbnc,errp_shift_hbnc
      real :: errm_anorm_o3a,errp_anorm_o3a
      real :: errm_width_o3a,errp_width_o3a
      real :: errm_shift_o3a,errp_shift_o3a
      real :: errm_anorm_o3b,errp_anorm_o3b
      real :: errm_width_o3b,errp_width_o3b
      real :: errm_shift_o3b,errp_shift_o3b
      real :: errm_anorm_fevii5160,errp_anorm_fevii5160
      real :: errm_width_fevii5160,errp_width_fevii5160
      real :: errm_shift_fevii5160,errp_shift_fevii5160
      real :: errm_anorm_fevi5177,errp_anorm_fevi5177
      real :: errm_width_fevi5177,errp_width_fevi5177
      real :: errm_shift_fevi5177,errp_shift_fevi5177
      real :: errm_anorm_ni5200,errp_anorm_ni5200
      real :: errm_width_ni5200,errp_width_ni5200
      real :: errm_shift_ni5200,errp_shift_ni5200
      real :: errm_anorm_hei5875,errp_anorm_hei5875
      real :: errm_width_hei5875,errp_width_hei5875
      real :: errm_shift_hei5875,errp_shift_hei5875
      real :: errm_anorm_hei5875nc,errp_anorm_hei5875nc
      real :: errm_width_hei5875nc,errp_width_hei5875nc
      real :: errm_shift_hei5875nc,errp_shift_hei5875nc
      real :: errm_anorm_mg2ae,errp_anorm_mg2ae
      real :: errm_width_mg2ae,errp_width_mg2ae
      real :: errm_shift_mg2ae,errp_shift_mg2ae
      real :: errm_anorm_mg2be,errp_anorm_mg2be
      real :: errm_width_mg2be,errp_width_mg2be
      real :: errm_shift_mg2be,errp_shift_mg2be
      real :: errm_anorm_hb2,errp_anorm_hb2          
      real :: errm_width_hb2,errp_width_hb2
      real :: errm_shift_hb2,errp_shift_hb2
      real :: errm_anorm_o3asb,errp_anorm_o3asb
      real :: errm_width_o3asb,errp_width_o3asb
      real :: errm_shift_o3asb,errp_ shift_o3asb
      real :: errm_anorm_o3bsb,errp_anorm_o3bsb
      real :: errm_width_o3bsb,errp_width_o3bsb
      real :: errm_shift_o3bsb,errp_shift_o3bsb     
      real :: errm_anorm_balcont,errp_anorm_balcont
      real :: errm_anorm_highbal,errp_anorm_highbal
      real :: errm_anorm_ha,errp_anorm_ha              
      real :: errm_width_ha,errp_width_ha
      real :: errm_shift_ha,errp_shift_ha
      real :: errm_anorm_ha2,errp_anorm_ha2             
      real :: errm_width_ha2,errp_width_ha2
      real :: errm_shift_ha2,errp_shift_ha2
      real :: errm_anorm_hanc,errp_anorm_hanc           
      real :: errm_width_hanc,errp_width_hanc
      real :: errm_shift_hanc,errp_shift_hanc
      real :: errm_anorm_s2a,errp_anorm_s2a           
      real :: errm_anorm_s2b,errp_anorm_s2b   
      real :: errm_anorm_o1a,errp_anorm_o1a 
      real :: errm_anorm_n2a,errp_anorm_n2a 
      real :: errm_anorm_s2asb,errp_anorm_s2asb           
      real :: errm_width_s2asb,errp_width_s2asb           
      real :: errm_shift_s2asb,errp_shift_s2asb           
      real :: errm_anorm_s2bsb,errp_anorm_s2bsb    
      real :: errm_anorm_fevii6086,errp_anorm_fevii6086    
      real :: errm_anorm_oii7321,errp_anorm_oii7321
      real :: errm_anorm_niiii7892,errp_anorm_niiii7892
      real :: errm_anorm_fexi7894,errp_anorm_fexi7894
      real :: errm_anorm_hei7067,errp_anorm_hei7067
      real :: errm_anorm_ariii7138,errp_anorm_ariii7138


      real :: errs_anorm_pl,err_pr_anorm_pl	              
      real :: errs_slope1,err_pr_slope1
      real :: errs_slope2,err_pr_slope2
      real :: errs_wave_break,err_pr_wave_break
      real :: errs_anorm_Fe2t,err_pr_anorm_Fe2t
      real :: errs_anorm_Fe2t_opt,err_pr_anorm_Fe2t_opt
      real :: errs_anorm_cii2326,err_pr_anorm_cii2326
      real :: errs_width_cii2326,err_pr_width_cii2326
      real :: errs_shift_cii2326,err_pr_shift_cii2326
      real :: errs_anorm_neiv2423,err_pr_anorm_neiv2423
      real :: errs_width_neiv2423,err_pr_width_neiv2423
      real :: errs_shift_neiv2423,err_pr_shift_neiv2423
      real :: errs_anorm_oii2471,err_pr_anorm_oii2471
      real :: errs_width_oii2471,err_pr_width_oii2471
      real :: errs_shift_oii2471,err_pr_shift_oii2471
      real :: errs_anorm_alii2669,err_pr_anorm_alii2669
      real :: errs_width_alii2669,err_pr_width_alii2669
      real :: errs_shift_alii2669,err_pr_shift_alii2669
      real :: errs_anorm_oiii2672,err_pr_anorm_oiii2672
      real :: errs_width_oiii2672,err_pr_width_oiii2672
      real :: errs_shift_oiii2672,err_pr_shift_oiii2672
      real :: errs_anorm_mg2a,err_pr_anorm_mg2a
      real :: errs_width_mg2a,err_pr_width_mg2a
      real :: errs_shift_mg2a,err_pr_shift_mg2a
      real :: errs_anorm_mg2b,err_pr_anorm_mg2b
      real :: errs_width_mg2b,err_pr_width_mg2b
      real :: errs_shift_mg2b,err_pr_shift_mg2b
      real :: errs_anorm_oiii3133,err_pr_anorm_oiii3133
      real :: errs_width_oiii3133,err_pr_width_oiii3133
      real :: errs_shift_oiii3133,err_pr_shift_oiii3133
      real :: errs_anorm_hei3188,err_pr_anorm_hei3188
      real :: errs_width_hei3188,err_pr_width_hei3188
      real :: errs_shift_hei3188,err_pr_shift_hei3188
      real :: errs_anorm_nev3346,err_pr_anorm_nev3346
      real :: errs_width_nev3346,err_pr_width_nev3346
      real :: errs_shift_nev3346,err_pr_shift_nev3346
      real :: errs_anorm_nev3426,err_pr_anorm_nev3426
      real :: errs_width_nev3426,err_pr_width_nev3426
      real :: errs_shift_nev3426,err_pr_shift_nev3426
      real :: errs_anorm_fevii3587,err_pr_anorm_fevii3587
      real :: errs_width_fevii3587,err_pr_width_fevii3587
      real :: errs_shift_fevii3587,err_pr_shift_fevii3587
      real :: errs_anorm_hei3588,err_pr_anorm_hei3588
      real :: errs_width_hei3588,err_pr_width_hei3588
      real :: errs_shift_hei3588,err_pr_shift_hei3588
      real :: errs_anorm_oii3728,err_pr_anorm_oii3728
      real :: errs_width_oii3728,err_pr_width_oii3728
      real :: errs_shift_oii3728,err_pr_shift_oii3728
      real :: errs_anorm_fevii3759,err_pr_anorm_fevii3759
      real :: errs_width_fevii3759,err_pr_width_fevii3759
      real :: errs_shift_fevii3759,err_pr_shift_fevii3759
      real :: errs_anorm_neiii3869,err_pr_anorm_neiii3869
      real :: errs_width_neiii3869,err_pr_width_neiii3869
      real :: errs_shift_neiii3869,err_pr_shift_neiii3869
      real :: errs_anorm_hei3889,err_pr_anorm_hei3889
      real :: errs_width_hei3889,err_pr_width_hei3889
      real :: errs_shift_hei3889,err_pr_shift_hei3889
      real :: errs_anorm_h8,err_pr_anorm_h8
      real :: errs_width_h8,err_pr_width_h8
      real :: errs_shift_h8,err_pr_shift_h8
      real :: errs_anorm_neiii3968,err_pr_anorm_neiii3968
      real :: errs_width_neiii3968,err_pr_width_neiii3968
      real :: errs_shift_neiii3968,err_pr_shift_neiii3968
      real :: errs_anorm_hepsilon,err_pr_anorm_hepsilon
      real :: errs_width_hepsilon,err_pr_width_hepsilon
      real :: errs_shift_hepsilon,err_pr_shift_hepsilon
      real :: errs_anorm_fev4072,err_pr_anorm_fev4072
      real :: errs_width_fev4072,err_pr_width_fev4072
      real :: errs_shift_fev4072,err_pr_shift_fev4072
      real :: errs_anorm_sii4073,err_pr_anorm_sii4073
      real :: errs_width_sii4073,err_pr_width_sii4073
      real :: errs_shift_sii4073,err_pr_shift_sii4073
      real :: errs_anorm_hdelta,err_pr_anorm_hdelta
      real :: errs_width_hdelta,err_pr_width_hdelta
      real :: errs_shift_hdelta,err_pr_shift_hdelta
      real :: errs_anorm_hdeltanc,err_pr_anorm_hdeltanc
      real :: errs_width_hdeltanc,err_pr_width_hdeltanc
      real :: errs_shift_hdeltanc,err_pr_shift_hdeltanc
      real :: errs_anorm_hgamma,err_pr_anorm_hgamma
      real :: errs_width_hgamma,err_pr_width_hgamma
      real :: errs_shift_hgamma,err_pr_shift_hgamma
      real :: errs_anorm_hgammanc,err_pr_anorm_hgammanc
      real :: errs_width_hgammanc,err_pr_width_hgammanc
      real :: errs_shift_hgammanc,err_pr_shift_hgammanc
      real :: errs_anorm_oiii4363,err_pr_anorm_oiii4363 
      real :: errs_width_oiii4363,err_pr_width_oiii4363 
      real :: errs_shift_oiii4363,err_pr_shift_oiii4363 
      real :: errs_anorm_hei4472,err_pr_anorm_hei4472
      real :: errs_width_hei4472,err_pr_width_hei4472
      real :: errs_shift_hei4472,err_pr_shift_hei4472
      real :: errs_anorm_heii4685,err_pr_anorm_heii4685
      real :: errs_width_heii4685,err_pr_width_heii4685
      real :: errs_shift_heii4685,err_pr_shift_heii4685           
      real :: errs_anorm_heii4685nc,err_pr_anorm_heii4685nc
      real :: errs_width_heii4685nc,err_pr_width_heii4685nc
      real :: errs_shift_heii4685nc,err_pr_shift_heii4685nc
      real :: errs_anorm_hb,err_pr_anorm_hb		
      real :: errs_width_hb,errs_shift_hb
      real :: err_pr_width_hb,err_pr_shift_hb
      real :: errs_anorm_hbnc,err_pr_anorm_hbnc		
      real :: errs_width_hbnc,errs_shift_hbnc
      real :: err_pr_width_hbnc,err_pr_shift_hbnc
      real :: errs_anorm_o3a,err_pr_anorm_o3a
      real :: errs_width_o3a,err_pr_width_o3a
      real :: errs_shift_o3a,err_pr_shift_o3a
      real :: errs_anorm_o3b,err_pr_anorm_o3b
      real :: errs_width_o3b,err_pr_width_o3b
      real :: errs_shift_o3b,err_pr_shift_o3b
      real :: errs_anorm_fevii5160,err_pr_anorm_fevii5160
      real :: errs_width_fevii5160,err_pr_width_fevii5160         !40
      real :: errs_shift_fevii5160,err_pr_shift_fevii5160
      real :: errs_anorm_fevi5177,err_pr_anorm_fevi5177
      real :: errs_width_fevi5177,err_pr_width_fevi5177
      real :: errs_shift_fevi5177,err_pr_shift_fevi5177
      real :: errs_anorm_ni5200,err_pr_anorm_ni5200
      real :: errs_width_ni5200,err_pr_width_ni5200
      real :: errs_shift_ni5200,err_pr_shift_ni5200
      real :: errs_anorm_hei5875,err_pr_anorm_hei5875
      real :: errs_width_hei5875,err_pr_width_hei5875
      real :: errs_shift_hei5875,err_pr_shift_hei5875
      real :: errs_anorm_hei5875nc,err_pr_anorm_hei5875nc
      real :: errs_width_hei5875nc,err_pr_width_hei5875nc
      real :: errs_shift_hei5875nc,err_pr_shift_hei5875nc
      real :: errs_anorm_mg2ae,err_pr_anorm_mg2ae
      real :: errs_width_mg2ae,err_pr_width_mg2ae
      real :: errs_shift_mg2ae,err_pr_shift_mg2ae
      real :: errs_anorm_mg2be,err_pr_anorm_mg2be
      real :: errs_width_mg2be,err_pr_width_mg2be
      real :: errs_shift_mg2be,err_pr_shift_mg2be
      real :: errs_anorm_hb2,err_pr_anorm_hb2       !45
      real :: errs_width_hb2,err_pr_width_hb2
      real :: errs_shift_hb2,err_pr_shift_hb2   
      real :: errs_anorm_o3asb,err_pr_anorm_o3asb
      real :: errs_width_o3asb,err_pr_width_o3asb
      real :: errs_shift_o3asb,err_pr_shift_o3asb
      real :: errs_anorm_o3bsb,err_pr_anorm_o3bsb
      real :: errs_width_o3bsb,err_pr_width_o3bsb
      real :: errs_shift_o3bsb,err_pr_shift_o3bsb
      real :: errs_anorm_balcont,err_pr_anorm_balcont
      real :: errs_anorm_highbal,err_pr_anorm_highbal
      real :: errs_anorm_ha,err_pr_anorm_ha
      real :: errs_width_ha,err_pr_width_ha
      real :: errs_shift_ha,err_pr_shift_ha
      real :: errs_anorm_hanc,err_pr_anorm_hanc
      real :: errs_width_hanc,err_pr_width_hanc
      real :: errs_shift_hanc,err_pr_shift_hanc
      real :: errs_anorm_ariii7138,err_pr_anorm_ariii7138 
      real :: errs_anorm_oii7321,err_pr_anorm_oii7321 
      real :: errs_anorm_niiii7892,err_pr_anorm_niiii7892
      real :: errs_anorm_fexi7894,err_pr_anorm_fexi7894
      real :: errs_anorm_hei7067,err_pr_anorm_hei7067
      real :: errs_anorm_s2asb,err_pr_anorm_s2asb
      real :: errs_width_s2asb,err_pr_width_s2asb
      real :: errs_shift_s2asb,err_pr_shift_s2asb
      real :: errs_anorm_s2bsb,err_pr_anorm_s2bsb
      real :: errs_anorm_ha2,err_pr_anorm_ha2
      real :: errs_width_ha2,err_pr_width_ha2
      real :: errs_shift_ha2,err_pr_shift_ha2
      real :: errs_anorm_s2a,err_pr_anorm_s2a
      real :: errs_width_s2a,err_pr_width_s2a
      real :: errs_shift_s2a,err_pr_shift_s2a
      real :: errs_anorm_s2b,err_pr_anorm_s2b
      real :: errs_anorm_o1a,err_pr_anorm_o1a
      real :: errs_anorm_n2a,err_pr_anorm_n2a
      real :: errs_anorm_fevii6086,err_pr_anorm_fevii6086


      real :: shiftw_hb_err,shiftw_hdelta_err,shiftw_hgamma_err
      real :: shiftw_h8_err,shiftw_hepsilon_err
      real :: shiftw_mg2a_err,shiftw_mg2b_err
      real :: shiftw_oiii2672_err,shiftw_oiii3133_err
      real :: shiftw_heii4685_err,shiftw_hei3188_err
      real :: shiftw_hei3588_err,shiftw_hei3889_err,shiftw_hei5875_err
      real :: shiftw_o3a_err,shiftw_o3b_err,shiftw_hbnc_err
      real :: shiftw_heii4685nc_err
      real :: shiftw_fevii5160_err,shiftw_fevi5177_err
      real :: shiftw_oiii4363_err
      real :: shiftw_ni5200_err
      real :: shiftw_cii2326_err,shiftw_neiv2423_err
      real :: shiftw_oii2471_err,shiftw_alii2669_err
      real :: shiftw_nev3346_err,shiftw_nev3426_err
      real :: shiftw_fevii3587_err,shiftw_oii3728_err
      real :: shiftw_fevii3759_err,shiftw_neiii3869_err
      real :: shiftw_neiii3968_err,shiftw_fev4072_err
      real :: shiftw_sii4073_err,shiftw__err
      real :: shiftw_hb2_err
      real :: shiftw_mg2ae_err,shiftw_mg2be_err
      real :: shiftw_o3asb_err,shiftw_o3bsb_err
      real :: shiftw_hei4472_err
      real :: shiftw_ha_err
      real :: shiftw_hanc_err
      real :: shiftw_ha2_err
      real :: shiftw_ariii7138_err
      real :: shiftw_oii7321_err
      real :: shiftw_niiii7892_err
      real :: shiftw_fexi7894_err
      real :: shiftw_s2a_err
      real :: shiftw_s2b_err
      real :: shiftw_o1a_err
      real :: shiftw_n2a_err
      real :: shiftw_hei7067_err
      real :: shiftw_s2asb_err
      real :: shiftw_s2bsb_err
      real :: shiftw_fevii6086_err
      real :: shiftw_hgammanc_err
      real :: shiftw_hdeltanc_err


       k1best=0
       k1max=ile_sim
       k2max=ile_sim
       !print *, 'k1max',ile_sim,k1max,k2max

       chi2_best_err = 1e20
       !print *, 'chi before do', chi2_best_err

       do k1=1,k1max
       !print *, 'k1c', k1,matrix_chi2(k1,1)
c      PRINT ALL THE MODELS
c         open(unit=15,file=widmo_dat1,status='unknown')
c          write(15,*) k1, matrix_chi2(k1,1), matrix_chi2(k1,2),
c     *	  		  matrix_chi2(k1,3), matrix_chi2(k1,4),
c     *	  		  matrix_chi2(k1,5), matrix_chi2(k1,6),
c     *	  		  matrix_chi2(k1,7), matrix_chi2(k1,8),
c     *	  		  matrix_chi2(k1,9), matrix_chi2(k1,10),
c     *	  		  matrix_chi2(k1,11), matrix_chi2(k1,12),
c     *	  		  matrix_chi2(k1,13), matrix_chi2(k1,14),
c     *	  		  matrix_chi2(k1,15), matrix_chi2(k1,16),
c     *	  		  matrix_chi2(k1,17), matrix_chi2(k1,18),
c     *	  		  matrix_chi2(k1,19), matrix_chi2(k1,20),
c     *	  		  matrix_chi2(k1,21), matrix_chi2(k1,22),
c     *	  		  matrix_chi2(k1,23)
c
        if (matrix_chi2(k1,1).le.chi2_best_err) then
c          print *, 'matrix_err antes',k1, matrix_chi2(k1,1),
c     *             chi2_best_err
          chi2_best_err =  matrix_chi2(k1,1)
          anorm_pl_err =  matrix_chi2(k1,2)
  	  slope1_err = matrix_chi2(k1,3)
  	  slope2_err = matrix_chi2(k1,4)
 	  wave_break_err = matrix_chi2(k1,5)
          anorm_Fe2t_err = matrix_chi2(k1,6)
          anorm_hb_err = matrix_chi2(k1,7)
          width_hb_err = matrix_chi2(k1,8)
          shift_hb_err = matrix_chi2(k1,9)
          anorm_hdelta_err = matrix_chi2(k1,10)
          anorm_hgamma_err = matrix_chi2(k1,11)
          anorm_h8_err = matrix_chi2(k1,12)
          anorm_hepsilon_err = matrix_chi2(k1,13)
          anorm_mg2a_err = matrix_chi2(k1,14)
          width_mg2a_err = matrix_chi2(k1,15)
          shift_mg2a_err = matrix_chi2(k1,16)
          anorm_oiii2672_err = matrix_chi2(k1,17)
          width_oiii2672_err = matrix_chi2(k1,18)
          shift_oiii2672_err = matrix_chi2(k1,19)
          anorm_oiii3133_err = matrix_chi2(k1,20)
	  anorm_heii4685_err = matrix_chi2(k1,21)
	  width_heii4685_err = matrix_chi2(k1,22)
	  shift_heii4685_err = matrix_chi2(k1,23)
	  anorm_hei3188_err = matrix_chi2(k1,24)
	  anorm_hei3588_err = matrix_chi2(k1,25)
	  anorm_hei3889_err = matrix_chi2(k1,26)
	  anorm_hei5875_err = matrix_chi2(k1,27)
          anorm_o3a_err = matrix_chi2(k1,28)
          width_o3a_err = matrix_chi2(k1,29)
          shift_o3a_err = matrix_chi2(k1,30)
          anorm_hbnc_err = matrix_chi2(k1,31)
	  anorm_heii4685nc_err = matrix_chi2(k1,32)
          anorm_fevii5160_err = matrix_chi2(k1,33)
          anorm_fevi5177_err = matrix_chi2(k1,34)
          anorm_oiii4363_err = matrix_chi2(k1,35)
          anorm_ni5200_err = matrix_chi2(k1,36)
	  anorm_cii2326_err = matrix_chi2(k1,37)
	  anorm_neiv2423_err = matrix_chi2(k1,38)
	  anorm_oii2471_err = matrix_chi2(k1,39)
	  anorm_alii2669_err = matrix_chi2(k1,40)
	  anorm_nev3346_err = matrix_chi2(k1,41)
	  anorm_nev3426_err = matrix_chi2(k1,42)
	  width_nev3426_err = matrix_chi2(k1,43)
	  shift_nev3426_err = matrix_chi2(k1,44)
	  anorm_fevii3587_err = matrix_chi2(k1,45)
	  anorm_oii3728_err = matrix_chi2(k1,46)
	  anorm_fevii3759_err = matrix_chi2(k1,47)
	  anorm_neiii3869_err = matrix_chi2(k1,48)
	  anorm_neiii3968_err = matrix_chi2(k1,49)
	  anorm_fev4072_err = matrix_chi2(k1,50)
	  anorm_sii4073_err = matrix_chi2(k1,51)
          anorm_hb2_err = matrix_chi2(k1,52)
          width_hb2_err = matrix_chi2(k1,53)
          shift_hb2_err = matrix_chi2(k1,54)
          anorm_mg2ae_err = matrix_chi2(k1,55)
          width_mg2ae_err = matrix_chi2(k1,56)
          shift_mg2ae_err = matrix_chi2(k1,57)
          anorm_o3asb_err = matrix_chi2(k1,58)
          width_o3asb_err = matrix_chi2(k1,59)
          shift_o3asb_err = matrix_chi2(k1,60)
          anorm_hdeltanc_err = matrix_chi2(k1,61)
          anorm_hgammanc_err = matrix_chi2(k1,62)
	  anorm_hei4472_err = matrix_chi2(k1,63)
          anorm_balcont_err = matrix_chi2(k1,64)
          anorm_highbal_err = matrix_chi2(k1,65)
          anorm_Fe2t_opt_err = matrix_chi2(k1,66)
          anorm_ha_err = matrix_chi2(k1,67)
          width_ha_err = matrix_chi2(k1,68)
          shift_ha_err = matrix_chi2(k1,69)
          anorm_hanc_err = matrix_chi2(k1,70)
          width_hanc_err = matrix_chi2(k1,71)
          shift_hanc_err = matrix_chi2(k1,72)
          anorm_s2a_err = matrix_chi2(k1,73)
          anorm_s2b_err = matrix_chi2(k1,74)
          anorm_o1a_err = matrix_chi2(k1,75)
          anorm_n2a_err = matrix_chi2(k1,76)
          anorm_ha2_err = matrix_chi2(k1,77)
          width_ha2_err = matrix_chi2(k1,78)
          shift_ha2_err = matrix_chi2(k1,79)
          anorm_s2asb_err = matrix_chi2(k1,80)
          width_s2asb_err = matrix_chi2(k1,81)
          shift_s2asb_err = matrix_chi2(k1,82)
          anorm_s2bsb_err = matrix_chi2(k1,83)
          anorm_hei7067_err = matrix_chi2(k1,84)
          anorm_ariii7138_err = matrix_chi2(k1,85)
          anorm_fexi7894_err = matrix_chi2(k1,86)
          anorm_oii7321_err = matrix_chi2(k1,87)
          anorm_niiii7892_err = matrix_chi2(k1,88)
          anorm_fevii6086_err = matrix_chi2(k1,89)
          width_fevii5160_err = matrix_chi2(k1,90)
          shift_fevii5160_err = matrix_chi2(k1,91)

c          !chi2b_best_err =  matrix_chi2(k1,73)
c          !chi2c_best_err =  matrix_chi2(k1,74)

c          print *, 'chi2_ordered',k1, matrix_chi2(k1,1)/(jmax-par_free),!Lista de todos los valores
c     *		matrix_chi2(k1,56)/(jmax-par_free),
c     *	        matrix_chi2(k1,57)/(jmax-par_free)
c     *          matrix_chi2(k1,5),matrix_chi2(k1,6),matrix_chi2(k1,7) !ordenados por chi2
c     *         matrix_chi2(k1,6),matrix_chi2(k1,7),matrix_chi2(k1,8)
c     *         matrix_chi2(k1,9),matrix_chi2(k1,10),matrix_chi2(k1,11),
c     *         matrix_chi2(k1,12),matrix_chi2(k1,13),matrix_chi2(k1,14),
c     *         matrix_chi2(k1,15),matrix_chi2(k1,16),matrix_chi2(k1,17),
c     *         matrix_chi2(k1,18),matrix_chi2(k1,19),matrix_chi2(k1,20)
c          print *, 'values1',k1, chi2_best_err,
c     *              anorm_line_err,gauss_width_err

       end if
      end do

c      close(15)

c          print *, '****values_min',k1, chi2_best_err, !Lista solo los valores del mejor chi2
c     *              anorm_hb_err,width_hb_err,
c     *              shift_hb_err


      anorm_pl_min = 1.e20                           
      anorm_pl_max = 0.0

      slope1_min = 1.e20                           
      slope1_max = 0.0

      slope2_min = 1.e20                           
      slope2_max = 0.0

      wave_break_min = 1.e20                           
      wave_break_max = 0.0

      anorm_balcont_min = 1.e20
      anorm_balcont_max = 0.0

      anorm_highbal_min = 1.e20
      anorm_highbal_max = 0.0

      anorm_Fe2t_min = 1.e20
      anorm_Fe2t_max = 0.0

      anorm_Fe2t_opt_min = 1.e20
      anorm_Fe2t_opt_max = 0.0

      anorm_hb_min = 1.e20                             !5
      anorm_hb_max = 0.0
      width_hb_min = 1.e20
      width_hb_max = 0.0
      shift_hb_min = 1.e20
      shift_hb_max = 0.0

      anorm_hdelta_min = 1.e20
      anorm_hdelta_max = 0.0

      anorm_hgamma_min = 1.e20
      anorm_hgamma_max = 0.0

      anorm_h8_min = 1.e20
      anorm_h8_max = 0.0

      anorm_hepsilon_min = 1.e20
      anorm_hepsilon_max = 0.0

      anorm_alii2669_min = 1.e20
      anorm_alii2669_max = 0.0

      anorm_cii2326_min = 1.e20
      anorm_cii2326_max = 0.0

      anorm_mg2a_min = 1.e20  			       
      anorm_mg2a_max = 0.0
      width_mg2a_min = 1.e20
      width_mg2a_max = 0.0
      shift_mg2a_min = 1.e20
      shift_mg2a_max = 0.0

      anorm_oiii2672_min = 1.e20  			       
      anorm_oiii2672_max = 0.0
      width_oiii2672_min = 1.e20
      width_oiii2672_max = 0.0
      shift_oiii2672_min = 1.e20
      shift_oiii2672_max = 0.0

      anorm_oiii3133_min = 1.e20  			       
      anorm_oiii3133_max = 0.0

      anorm_heii4685_min = 1.e20  			       
      anorm_heii4685_max = 0.0
      width_heii4685_min = 1.e20
      width_heii4685_max = 0.0
      shift_heii4685_min = 1.e20
      shift_heii4685_max = 0.0

      anorm_hei3188_min = 1.e20  			       
      anorm_hei3188_max = 0.0

      anorm_hei3588_min = 1.e20  			       
      anorm_hei3588_max = 0.0

      anorm_hei3889_min = 1.e20  			       
      anorm_hei3889_max = 0.0

      anorm_hei5875_min = 1.e20  			       
      anorm_hei5875_max = 0.0

      anorm_hei4472_min = 1.e20  			       
      anorm_hei4472_max = 0.0

      anorm_hei7067_min = 1.e20 				
      anorm_hei7067_max = 0.0

      anorm_o3a_min = 1.e20  			      
      anorm_o3a_max = 0.0
      width_o3a_min = 1.e20
      width_o3a_max = 0.0
      shift_o3a_min = 1.e20
      shift_o3a_max = 0.0

      anorm_hbnc_min = 1.e20 				
      anorm_hbnc_max = 0.0

      anorm_heii4685nc_min = 1.e20  			       
      anorm_heii4685nc_max = 0.0

      anorm_oiii4363_min = 1.e20 			
      anorm_oiii4363_max = 0.0

      anorm_ni5200_min = 1.e20
      anorm_ni5200_max = 0.0

      anorm_neiv2423_min = 1.e20
      anorm_neiv2423_max = 0.0

      anorm_oii2471_min = 1.e20
      anorm_oii2471_max = 0.0

      anorm_nev3346_min = 1.e20
      anorm_nev3346_max = 0.0

      anorm_oii3728_min = 1.e20
      anorm_oii3728_max = 0.0

      anorm_neiii3869_min = 1.e20
      anorm_neiii3869_max = 0.0

      anorm_neiii3968_min = 1.e20
      anorm_neiii3968_max = 0.0

      anorm_fev4072_min = 1.e20
      anorm_fev4072_max = 0.0

      anorm_sii4073_min = 1.e20
      anorm_sii4073_max = 0.0

      anorm_hdeltanc_min = 1.e20
      anorm_hdeltanc_max = 0.0

      anorm_hgammanc_min = 1.e20
      anorm_hgammanc_max = 0.0

      anorm_nev3426_min = 1.e20
      anorm_nev3426_max = 0.0
      width_nev3426_min = 1.e20
      width_nev3426_max = 0.0
      shift_nev3426_min = 1.e20
      shift_nev3426_max = 0.0

      anorm_fevii3587_min = 1.e20
      anorm_fevii3587_max = 0.0

      anorm_fevii3759_min = 1.e20
      anorm_fevii3759_max = 0.0

      anorm_fevii5160_min = 1.e20
      anorm_fevii5160_max = 0.0

      anorm_fevi5177_min = 1.e20
      anorm_fevi5177_max = 0.0

      anorm_fexi7894_min = 1.e20 				
      anorm_fexi7894_max = 0.0

      anorm_fevii6086_min = 1.e20 				
      anorm_fevii6086_max = 0.0

      anorm_ha_min = 1.e20 				
      anorm_ha_max = 0.0
      width_ha_min = 1.e20 				
      width_ha_max = 0.0
      shift_ha_min = 1.e20 				
      shift_ha_max = 0.0

      anorm_hanc_min = 1.e20 				
      anorm_hanc_max = 0.0
      width_hanc_min = 1.e20 				
      width_hanc_max = 0.0
      shift_hanc_min = 1.e20 				
      shift_hanc_max = 0.0

      anorm_s2a_min = 1.e20 				
      anorm_s2a_max = 0.0

      anorm_s2b_min = 1.e20 				
      anorm_s2b_max = 0.0

      anorm_o1a_min = 1.e20 				
      anorm_o1a_max = 0.0

      anorm_n2a_min = 1.e20 				
      anorm_n2a_max = 0.0

      anorm_niiii7892_min = 1.e20 				
      anorm_niiii7892_max = 0.0

      anorm_ariii7138_min = 1.e20 				
      anorm_ariii7138_max = 0.0

      anorm_oii7321_min = 1.e20 				
      anorm_oii7321_max = 0.0

      anorm_hb2_min = 1.e20				
      anorm_hb2_max = 0.0
      width_hb2_min = 1.e20
      width_hb2_max = 0.0
      shift_hb2_min = 1.e20
      shift_hb2_max = 0.0

      anorm_mg2ae_min = 1.e20  			  
      anorm_mg2ae_max = 0.0
      width_mg2ae_min = 1.e20
      width_mg2ae_max = 0.0
      shift_mg2ae_min = 1.e20
      shift_mg2ae_max = 0.0

      anorm_o3asb_min = 1.e20
      anorm_o3asb_max = 0.0
      width_o3asb_min = 1.e20
      width_o3asb_max = 0.0
      shift_o3asb_min = 1.e20
      shift_o3asb_max = 0.0

      anorm_ha2_min = 1.e20 				
      anorm_ha2_max = 0.0
      width_ha2_min = 1.e20 				
      width_ha2_max = 0.0
      shift_ha2_min = 1.e20 				
      shift_ha2_max = 0.0

      anorm_s2asb_min = 1.e20 				
      anorm_s2asb_max = 0.0
      width_s2asb_min = 1.e20 				
      width_s2asb_max = 0.0
      shift_s2asb_min = 1.e20 				
      shift_s2asb_max = 0.0

      anorm_s2bsb_min = 1.e20 				
      anorm_s2bsb_max = 0.0



c      print *, 'chi2_best_err',chi2_best_err

      chi2_min = chi2_best_err +  conf_sigma ! confidence level
c      print *, 'chi2_min',chi2_min
c      print *, 'best_err',chi2_best_err




c     !!!! MAX  VALUES !!!!

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
c         print *,'val_max', k2, k2max, matrix_chi2(k2,1),
c     *           matrix_chi2(k2,3), gauss_width_max
          if(matrix_chi2(k2,2).gt.anorm_pl_max) then
            anorm_pl_max=matrix_chi2(k2,2)
	     !print *, 'anorm_line_max',k2,matrix_chi2(k2,2),anorm_line_max
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,3).gt.slope1_max) then
            slope1_max=matrix_chi2(k2,3)
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,4).gt.slope2_max) then
            slope2_max=matrix_chi2(k2,4)
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,5).gt.wave_break_max) then
            wave_break_max=matrix_chi2(k2,5)
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,6).gt.anorm_Fe2t_max) then
             anorm_Fe2t_max=matrix_chi2(k2,6)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
         if(matrix_chi2(k2,7).gt.anorm_hb_max) then
             anorm_hb_max=matrix_chi2(k2,7)
	     !print *, 'anorm_hb_max',k2,matrix_chi2(k2,5),anorm_hb_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,8).gt.width_hb_max) then
             width_hb_max=matrix_chi2(k2,8)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,9).gt.shift_hb_max) then
             shift_hb_max=matrix_chi2(k2,9)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,10).gt.anorm_hdelta_max) then
             anorm_hdelta_max=matrix_chi2(k2,10)
             !print *, 'anorm_fe3_max',k2,matrix_chi2(k2,1),anorm_fe3_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,11).gt.anorm_hgamma_max) then
             anorm_hgamma_max=matrix_chi2(k2,11)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,12).gt.anorm_h8_max) then
             anorm_h8_max=matrix_chi2(k2,12)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,13).gt.anorm_hepsilon_max) then
             anorm_hepsilon_max=matrix_chi2(k2,13)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,14).gt.anorm_mg2a_max) then
             anorm_mg2a_max=matrix_chi2(k2,14)
             !print *, 'anorm_si2_max',k2,matrix_chi2(k2,1),anorm_si2_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,15).gt.width_mg2a_max) then
             width_mg2a_max=matrix_chi2(k2,15)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,16).gt.shift_mg2a_max) then
             shift_mg2a_max=matrix_chi2(k2,16)
             !print *, 'anorm_n3_max',k2,matrix_chi2(k2,1),anorm_n3_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,17).gt.anorm_oiii2672_max) then
             anorm_oiii2672_max=matrix_chi2(k2,17)
             !print *, 'anorm_si2_max',k2,matrix_chi2(k2,1),anorm_si2_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,18).gt.width_oiii2672_max) then
             width_oiii2672_max=matrix_chi2(k2,18)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,19).gt.shift_oiii2672_max) then
             shift_oiii2672_max=matrix_chi2(k2,19)
             !print *, 'anorm_n3_max',k2,matrix_chi2(k2,1),anorm_n3_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,20).gt.anorm_oiii3133_max) then
             anorm_oiii3133_max=matrix_chi2(k2,20)
             !print *, 'anorm_si2_max',k2,matrix_chi2(k2,1),anorm_si2_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,21).gt.anorm_heii4685_max) then
             anorm_heii4685_max=matrix_chi2(k2,21)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,22).gt.width_heii4685_max) then
             width_heii4685_max=matrix_chi2(k2,22)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,23).gt.shift_heii4685_max) then
             shift_heii4685_max=matrix_chi2(k2,23)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,24).gt.anorm_hei3188_max) then
             anorm_hei3188_max=matrix_chi2(k2,24)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,25).gt.anorm_hei3588_max) then
             anorm_hei3588_max=matrix_chi2(k2,25)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,26).gt.anorm_hei3889_max) then
             anorm_hei3889_max=matrix_chi2(k2,26)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,27).gt.anorm_hei5875_max) then
             anorm_hei5875_max=matrix_chi2(k2,27)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,28).gt.anorm_o3a_max) then
             anorm_o3a_max=matrix_chi2(k2,28)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,29).gt.width_o3a_max) then
             width_o3a_max=matrix_chi2(k2,29)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,30).gt.shift_o3a_max) then
             shift_o3a_max=matrix_chi2(k2,30)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,31).gt.anorm_hbnc_max) then
             anorm_hbnc_max=matrix_chi2(k2,31)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,32).gt.anorm_heii4685nc_max) then
             anorm_heii4685nc_max=matrix_chi2(k2,32)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,33).gt.anorm_fevii5160_max) then
             anorm_fevii5160_max=matrix_chi2(k2,33)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,34).gt.anorm_fevi5177_max) then
             anorm_fevi5177_max=matrix_chi2(k2,34)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,35).gt.anorm_oiii4363_max) then
             anorm_oiii4363_max=matrix_chi2(k2,35)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,36).gt.anorm_ni5200_max) then
             anorm_ni5200_max=matrix_chi2(k2,36)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,37).gt.anorm_cii2326_max) then
             anorm_cii2326_max=matrix_chi2(k2,37)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,38).gt.anorm_neiv2423_max) then
             anorm_neiv2423_max=matrix_chi2(k2,38)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,39).gt.anorm_oii2471_max) then
             anorm_oii2471_max=matrix_chi2(k2,39)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,40).gt.anorm_alii2669_max) then
             anorm_alii2669_max=matrix_chi2(k2,40)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,41).gt.anorm_nev3346_max) then
             anorm_nev3346_max=matrix_chi2(k2,41)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,42).gt.anorm_nev3426_max) then
             anorm_nev3426_max=matrix_chi2(k2,42)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,43).gt.width_nev3426_max) then
             width_nev3426_max=matrix_chi2(k2,43)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,44).gt.shift_nev3426_max) then
             shift_nev3426_max=matrix_chi2(k2,44)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,45).gt.anorm_fevii3587_max) then
             anorm_fevii3587_max=matrix_chi2(k2,45)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,46).gt.anorm_oii3728_max) then
             anorm_oii3728_max=matrix_chi2(k2,46)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,47).gt.anorm_fevii3759_max) then
             anorm_fevii3759_max=matrix_chi2(k2,47)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,48).gt.anorm_neiii3869_max) then
             anorm_neiii3869_max=matrix_chi2(k2,48)
          end if
       end if
      end do

       do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,49).gt.anorm_neiii3968_max) then
             anorm_neiii3968_max=matrix_chi2(k2,49)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,50).gt.anorm_fev4072_max) then
             anorm_fev4072_max=matrix_chi2(k2,50)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,51).gt.anorm_sii4073_max) then
             anorm_sii4073_max=matrix_chi2(k2,51)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,52).gt.anorm_hb2_max) then
             anorm_hb2_max=matrix_chi2(k2,52)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,53).gt.width_hb2_max) then
             width_hb2_max=matrix_chi2(k2,53)
          end if
       end if
      end do


       do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,54).gt.shift_hb2_max) then
             shift_hb2_max=matrix_chi2(k2,54)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,55).gt.anorm_mg2ae_max) then
             anorm_mg2ae_max=matrix_chi2(k2,55)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,56).gt.width_mg2ae_max) then
             width_mg2ae_max=matrix_chi2(k2,56)
          end if
       end if
      end do

       do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,57).gt.shift_mg2ae_max) then
             shift_mg2ae_max=matrix_chi2(k2,57)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,58).gt.anorm_o3asb_max) then
             anorm_o3asb_max=matrix_chi2(k2,58)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,59).gt.width_o3asb_max) then
             width_o3asb_max=matrix_chi2(k2,59)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,60).gt.shift_o3asb_max) then
             shift_o3asb_max=matrix_chi2(k2,60)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,61).gt.anorm_hdeltanc_max) then
             anorm_hdeltanc_max=matrix_chi2(k2,61)
             !print *, 'anorm_fe3_max',k2,matrix_chi2(k2,1),anorm_fe3_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,62).gt.anorm_hgammanc_max) then
             anorm_hgammanc_max=matrix_chi2(k2,62)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,63).gt.anorm_hei4472_max) then
             anorm_hei4472_max=matrix_chi2(k2,63)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,64).gt.anorm_balcont_max) then
             anorm_balcont_max=matrix_chi2(k2,64)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,65).gt.anorm_highbal_max) then
             anorm_highbal_max=matrix_chi2(k2,65)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,66).gt.anorm_Fe2t_opt_max) then
             anorm_Fe2t_opt_max=matrix_chi2(k2,66)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,67).gt.anorm_ha_max) then
             anorm_ha_max=matrix_chi2(k2,67)
             !print *, 'anorm_si2_max',k2,matrix_chi2(k2,1),anorm_si2_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,68).gt.width_ha_max) then
             width_ha_max=matrix_chi2(k2,68)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,69).gt.shift_ha_max) then
             shift_ha_max=matrix_chi2(k2,69)
             !print *, 'anorm_n3_max',k2,matrix_chi2(k2,1),anorm_n3_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,70).gt.anorm_hanc_max) then
             anorm_hanc_max=matrix_chi2(k2,70)
             !print *, 'anorm_si2_max',k2,matrix_chi2(k2,1),anorm_si2_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,71).gt.width_hanc_max) then
             width_hanc_max=matrix_chi2(k2,71)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,72).gt.shift_hanc_max) then
             shift_hanc_max=matrix_chi2(k2,72)
             !print *, 'anorm_n3_max',k2,matrix_chi2(k2,1),anorm_n3_max
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,73).gt.anorm_s2a_max) then
             anorm_s2a_max=matrix_chi2(k2,73)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,74).gt.anorm_s2b_max) then
             anorm_s2b_max=matrix_chi2(k2,74)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,75).gt.anorm_o1a_max) then
             anorm_o1a_max=matrix_chi2(k2,75)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,76).gt.anorm_n2a_max) then
             anorm_n2a_max=matrix_chi2(k2,76)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,77).gt.anorm_ha2_max) then
             anorm_ha2_max=matrix_chi2(k2,77)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,78).gt.width_ha2_max) then
             width_ha2_max=matrix_chi2(k2,78)
          end if
       end if
      end do

       do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,79).gt.shift_ha2_max) then
             shift_ha2_max=matrix_chi2(k2,79)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,80).gt.anorm_s2asb_max) then
             anorm_s2asb_max=matrix_chi2(k2,80)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,81).gt.width_s2asb_max) then
             width_s2asb_max=matrix_chi2(k2,81)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,82).gt.shift_s2asb_max) then
             shift_s2asb_max=matrix_chi2(k2,82)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,83).gt.anorm_s2bsb_max) then
             anorm_s2bsb_max=matrix_chi2(k2,83)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,84).gt.anorm_hei7067_max) then
             anorm_hei7067_max=matrix_chi2(k2,84)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,85).gt.anorm_ariii7138_max) then
             anorm_ariii7138_max=matrix_chi2(k2,85)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,86).gt.anorm_fexi7894_max) then
             anorm_fexi7894_max=matrix_chi2(k2,86)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,87).gt.anorm_oii7321_max) then
             anorm_oii7321_max=matrix_chi2(k2,87)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,88).gt.anorm_niiii7892_max) then
             anorm_niiii7892_max=matrix_chi2(k2,88)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,89).gt.anorm_fevii6086_max) then
             anorm_fevii6086_max=matrix_chi2(k2,89)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,90).gt.width_fevii5160_max) then
             width_fevii5160_max=matrix_chi2(k2,90)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,91).gt.anorm_fevii5160_max) then
             anorm_fevii5160_max=matrix_chi2(k2,91)
          end if
       end if
      end do

c     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
c     !!!!!!!!!!!!!!!!!!!! MIN VALUES !!!!!!!!!!!!!!!!!!!!!!!!
c     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
c         print *,'val_min', k2, k2max, matrix_chi2(k2,1),
c     *           matrix_chi2(k2,3), gauss_width_min
          if(matrix_chi2(k2,2).le.anorm_pl_min) then
            anorm_pl_min=matrix_chi2(k2,2)
	     !print *, 'anorm_line_min',k2,matrix_chi2(k2,2),anorm_line_min
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,3).le.slope1_min) then
            slope1_min=matrix_chi2(k2,3)
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,4).le.slope2_min) then
            slope2_min=matrix_chi2(k2,4)
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,5).le.wave_break_min) then
            wave_break_min=matrix_chi2(k2,5)
        end if
        end if
       end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,6).le.anorm_Fe2t_min) then
             anorm_Fe2t_min=matrix_chi2(k2,6)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
         if(matrix_chi2(k2,7).le.anorm_hb_min) then
             anorm_hb_min=matrix_chi2(k2,7)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,8).le.width_hb_min) then
             width_hb_min=matrix_chi2(k2,8)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,9).le.shift_hb_min) then
             shift_hb_min=matrix_chi2(k2,9)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,10).le.anorm_hdelta_min) then
             anorm_hdelta_min=matrix_chi2(k2,10)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,11).le.anorm_hgamma_min) then
             anorm_hgamma_min=matrix_chi2(k2,11)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,12).le.anorm_h8_min) then
             anorm_h8_min=matrix_chi2(k2,12)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,13).le.anorm_hepsilon_min) then
             anorm_hepsilon_min=matrix_chi2(k2,13)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,14).le.anorm_mg2a_min) then
             anorm_mg2a_min=matrix_chi2(k2,14)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,15).le.width_mg2a_min) then
             width_mg2a_min=matrix_chi2(k2,15)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,16).le.shift_mg2a_min) then
             shift_mg2a_min=matrix_chi2(k2,16)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,17).le.anorm_oiii2672_min) then
             anorm_oiii2672_min=matrix_chi2(k2,17)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,18).le.width_oiii2672_min) then
             width_oiii2672_min=matrix_chi2(k2,18)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,19).le.shift_oiii2672_min) then
             shift_oiii2672_min=matrix_chi2(k2,19)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,20).le.anorm_oiii3133_min) then
             anorm_oiii3133_min=matrix_chi2(k2,20)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,21).le.anorm_heii4685_min) then
             anorm_heii4685_min=matrix_chi2(k2,21)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,22).le.width_heii4685_min) then
             width_heii4685_min=matrix_chi2(k2,22)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,23).le.shift_heii4685_min) then
             shift_heii4685_min=matrix_chi2(k2,23)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,24).le.anorm_hei3188_min) then
             anorm_hei3188_min=matrix_chi2(k2,24)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,25).le.anorm_hei3588_min) then
             anorm_hei3588_min=matrix_chi2(k2,25)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,26).le.anorm_hei3889_min) then
             anorm_hei3889_min=matrix_chi2(k2,26)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,27).le.anorm_hei5875_min) then
             anorm_hei5875_min=matrix_chi2(k2,27)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,28).le.anorm_o3a_min) then
             anorm_o3a_min=matrix_chi2(k2,28)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,29).le.width_o3a_min) then
             width_o3a_min=matrix_chi2(k2,29)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,30).le.shift_o3a_min) then
             shift_o3a_min=matrix_chi2(k2,30)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,31).le.anorm_hbnc_min) then
             anorm_hbnc_min=matrix_chi2(k2,31)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,32).le.anorm_heii4685nc_min) then
             anorm_heii4685nc_min=matrix_chi2(k2,32)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,33).le.anorm_fevii5160_min) then
             anorm_fevii5160_min=matrix_chi2(k2,33)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,34).le.anorm_fevi5177_min) then
             anorm_fevi5177_min=matrix_chi2(k2,34)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,35).le.anorm_oiii4363_min) then
             anorm_oiii4363_min=matrix_chi2(k2,35)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,36).le.anorm_ni5200_min) then
             anorm_ni5200_min=matrix_chi2(k2,36)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,37).le.anorm_cii2326_min) then
             anorm_cii2326_min=matrix_chi2(k2,37)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,38).le.anorm_neiv2423_min) then
             anorm_neiv2423_min=matrix_chi2(k2,38)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,39).le.anorm_oii2471_min) then
             anorm_oii2471_min=matrix_chi2(k2,39)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,40).le.anorm_alii2669_min) then
             anorm_alii2669_min=matrix_chi2(k2,40)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,41).le.anorm_nev3346_min) then
             anorm_nev3346_min=matrix_chi2(k2,41)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,42).le.anorm_nev3426_min) then
             anorm_nev3426_min=matrix_chi2(k2,42)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,43).le.width_nev3426_min) then
             width_nev3426_min=matrix_chi2(k2,43)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,44).le.shift_nev3426_min) then
             shift_nev3426_min=matrix_chi2(k2,44)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,45).le.anorm_fevii3587_min) then
             anorm_fevii3587_min=matrix_chi2(k2,45)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,46).le.anorm_oii3728_min) then
             anorm_oii3728_min=matrix_chi2(k2,46)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,47).le.anorm_fevii3759_min) then
             anorm_fevii3759_min=matrix_chi2(k2,47)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,48).le.anorm_neiii3869_min) then
             anorm_neiii3869_min=matrix_chi2(k2,48)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,49).le.anorm_neiii3968_min) then
             anorm_neiii3968_min=matrix_chi2(k2,49)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,50).le.anorm_fev4072_min) then
             anorm_fev4072_min=matrix_chi2(k2,50)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,51).le.anorm_sii4073_min) then
             anorm_sii4073_min=matrix_chi2(k2,51)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,52).le.anorm_hb2_min) then
             anorm_hb2_min=matrix_chi2(k2,52)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,53).le.width_hb2_min) then
             width_hb2_min=matrix_chi2(k2,53)
          end if
       end if
      end do


       do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,54).le.shift_hb2_min) then
             shift_hb2_min=matrix_chi2(k2,54)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,55).le.anorm_mg2ae_min) then
             anorm_mg2ae_min=matrix_chi2(k2,55)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,56).le.width_mg2ae_min) then
             width_mg2ae_min=matrix_chi2(k2,56)
          end if
       end if
      end do



       do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,57).le.shift_mg2ae_min) then
             shift_mg2ae_min=matrix_chi2(k2,57)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,58).le.anorm_o3asb_min) then
             anorm_o3asb_min=matrix_chi2(k2,58)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,59).le.width_o3asb_min) then
             width_o3asb_min=matrix_chi2(k2,59)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,60).le.shift_o3asb_min) then
             shift_o3asb_min=matrix_chi2(k2,60)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,61).le.anorm_hdeltanc_min) then
             anorm_hdeltanc_min=matrix_chi2(k2,61)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,62).le.anorm_hgammanc_min) then
             anorm_hgammanc_min=matrix_chi2(k2,62)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,63).le.anorm_hei4472_min) then
             anorm_hei4472_min=matrix_chi2(k2,63)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,64).le.anorm_balcont_min) then
             anorm_balcont_min=matrix_chi2(k2,64)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,65).le.anorm_highbal_min) then
             anorm_highbal_min=matrix_chi2(k2,65)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,66).le.anorm_Fe2t_opt_min) then
             anorm_Fe2t_opt_min=matrix_chi2(k2,66)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,67).le.anorm_ha_min) then
             anorm_ha_min=matrix_chi2(k2,67)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,68).le.width_ha_min) then
             width_ha_min=matrix_chi2(k2,68)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,69).le.shift_ha_min) then
             shift_ha_min=matrix_chi2(k2,69)
             !print *, 'anorm_n3_min',k2,matrix_chi2(k2,1),anorm_n3_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,70).le.anorm_hanc_min) then
             anorm_hanc_min=matrix_chi2(k2,70)
             !print *, 'anorm_si2_min',k2,matrix_chi2(k2,1),anorm_si2_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,71).le.width_hanc_min) then
             width_hanc_min=matrix_chi2(k2,71)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,72).le.shift_hanc_min) then
             shift_hanc_min=matrix_chi2(k2,72)
             !print *, 'anorm_n3_min',k2,matrix_chi2(k2,1),anorm_n3_min
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,73).le.anorm_s2a_min) then
             anorm_s2a_min=matrix_chi2(k2,73)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,74).le.anorm_s2b_min) then
             anorm_s2b_min=matrix_chi2(k2,74)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,75).le.anorm_o1a_min) then
             anorm_o1a_min=matrix_chi2(k2,75)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,76).le.anorm_n2a_min) then
             anorm_n2a_min=matrix_chi2(k2,76)
          end if
       end if
      end do


      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,77).le.anorm_ha2_min) then
             anorm_ha2_min=matrix_chi2(k2,77)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,78).le.width_ha2_min) then
             width_ha2_min=matrix_chi2(k2,78)
          end if
       end if
      end do

       do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,79).le.shift_ha2_min) then
             shift_ha2_min=matrix_chi2(k2,79)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,80).le.anorm_s2asb_min) then
             anorm_s2asb_min=matrix_chi2(k2,80)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,81).le.width_s2asb_min) then
             width_s2asb_min=matrix_chi2(k2,81)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,82).le.shift_s2asb_min) then
             shift_s2asb_min=matrix_chi2(k2,82)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,83).le.anorm_s2bsb_min) then
             anorm_s2bsb_min=matrix_chi2(k2,83)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,84).le.anorm_hei7067_min) then
             anorm_hei7067_min=matrix_chi2(k2,84)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,85).le.anorm_ariii7138_min) then
             anorm_ariii7138_min=matrix_chi2(k2,85)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,86).le.anorm_fexi7894_min) then
             anorm_fexi7894_min=matrix_chi2(k2,86)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,87).le.anorm_oii7321_min) then
             anorm_oii7321_min=matrix_chi2(k2,87)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,88).le.anorm_niiii7892_min) then
             anorm_niiii7892_min=matrix_chi2(k2,88)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,89).le.anorm_fevii6086_min) then
             anorm_fevii6086_min=matrix_chi2(k2,89)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,90).le.width_fevii5160_min) then
             width_fevii5160_min=matrix_chi2(k2,90)
          end if
       end if
      end do

      do k2=1,k2max
       if (matrix_chi2(k2,1).le.chi2_min) then
          if(matrix_chi2(k2,91).le.shift_fevii5160_min) then
             shift_fevii5160_min=matrix_chi2(k2,91)
          end if
       end if
      end do


c       print *, 'f_pl',anorm_pl_err,anorm_pl_min,anorm_pl_max
c       print *, 'f fe2',anorm_Fe2t_err,anorm_Fe2t_min,anorm_Fe2t_max
c       print *, 'f_st',anorm_st_err,anorm_st_min,anorm_st_max
c       print *, 'f_hb',anorm_hb_err,anorm_hb_min,anorm_hb_max
c       print *, 'w_hb',width_hb_err,width_hb_min,width_hb_max
c       print *, 's_hb',shift_hb_err,shift_hb_min,shift_hb_max
c       print *, 'f_hdelta',anorm_hdelta_err,anorm_hdelta_min,
c     *           anorm_hdelta_max
c       print *, 'f_hgamma',anorm_hgamma_err,anorm_hgamma_min,
c     *           anorm_hgamma_max
c       print *, 'f_ha',anorm_ha_err,anorm_ha_min,anorm_ha_max
c       print *, 'w_ha',width_ha_err,width_ha_min,width_ha_max
c       print *, 's_ha',shift_ha_err,shift_ha_min,shift_ha_max
c       print *, 'f_heii4685',anorm_heii4685_err,anorm_heii4685_min,anorm_heii4685_max
c       print *, 'w_heii4685',width_heii4685_err,width_heii4685_min,width_heii4685_max
c       print *, 's_heii4685',shift_heii4685_err,shift_heii4685_min,shift_heii4685_max
c       print *, 'f_hei5875',anorm_hei5875_err,anorm_hei5875_min,
c     *           anorm_hei5875_max
c       print *, 'w_hei5875',width_hei5875_err,width_hei5875_min,
c     *           width_hei5875_max
c       print *, 's_hei5875',shift_hei5875_err,shift_hei5875_min,
c     *           shift_hei5875_max
c       print *, 'f_hbnc',anorm_hbnc_err,anorm_hbnc_min,anorm_hbnc_max
c       print *, 'w_hbnc',width_hbnc_err,width_hbnc_min,width_hbnc_max
c       print *, 's_hbnc',shift_hbnc_err,shift_hbnc_min,shift_hbnc_max
c       print *, 'f_hdeltanc',anorm_hdeltanc_err,anorm_hdeltanc_min,
c     *           anorm_hdeltanc_max
c       print *, 'f_hgammanc',anorm_hgammanc_err,anorm_hgammanc_min,
c     *           anorm_hgammanc_max
c       print *, 'f_hanc',anorm_hanc_err,anorm_hanc_min,anorm_hanc_max




        ! CALCULO DE LOS ERRORES

	!! anorm_pl
        errp_anorm_pl = anorm_pl_max - anorm_pl_err 
        errm_anorm_pl = anorm_pl_err - anorm_pl_min 	
        if ( errp_anorm_pl>0.and.errm_anorm_pl>0) then
         errs_anorm_pl = 0.5*( ((2*errp_anorm_pl*errm_anorm_pl)/
     *                   (errp_anorm_pl+errm_anorm_pl)) 
     *                   + sqrt(errp_anorm_pl*errm_anorm_pl) ) 	
        else if (errp_anorm_pl>0) then 
              errs_anorm_pl = errp_anorm_pl
        else
              errs_anorm_pl = errm_anorm_pl
        end if
        !print*, 'err_pl',errp_anorm_pl,errm_anorm_pl,errs_anorm_pl
        err_pr_anorm_pl = errs_anorm_pl/anorm_pl_err
        !print *,'errp_pl', errp_anorm_pl 


	!! slope1
        errp_slope1 =  slope1_max -  slope1_err 	
        errm_slope1 =  slope1_err -  slope1_min 	
        if ( errp_slope1>0.and.errm_slope1>0) then
         errs_slope1 = 0.5*( ((2*errp_slope1*errm_slope1)/
     *                   (errp_slope1+errm_slope1)) 
     *                   + sqrt(errp_slope1*errm_slope1) ) 	
        else if (errp_slope1>0) then 
              errs_slope1 = errp_slope1
        else
              errs_slope1 = errm_slope1
        end if
        !print*, 'err_pl',errp_slope1,errm_slope1,errs_slope1
        err_pr_slope1 = errs_slope1/ slope1_err
        !print *,'errp_pl', errp_slope1 


	!! slope2
        errp_slope2 =  slope2_max -  slope2_err 	
        errm_slope2 =  slope2_err -  slope2_min 	
        if ( errp_slope2>0.and.errm_slope2>0) then
         errs_slope2 = 0.5*( ((2*errp_slope2*errm_slope2)/
     *                   (errp_slope2+errm_slope2)) 
     *                   + sqrt(errp_slope2*errm_slope2) ) 	
        else if (errp_slope2>0) then 
              errs_slope2 = errp_slope2
        else
              errs_slope2 = errm_slope2
        end if
        !print*, 'err_pl',errp_slope2,errm_slope2,errs_slope2
        err_pr_slope2 = errs_slope2/slope2_err
        !print *,'errp_pl', errp_slope2 


	!! wave_break
        errp_wave_break =  wave_break_max -  wave_break_err 	!2
        errm_wave_break =  wave_break_err -  wave_break_min 	
        if ( errp_wave_break>0.and.errm_wave_break>0) then
         errs_wave_break = 0.5*( ((2*errp_wave_break*errm_wave_break)/
     *                   (errp_wave_break+errm_wave_break)) 
     *                   + sqrt(errp_wave_break*errm_wave_break) ) 	
        else if (errp_wave_break>0) then 
              errs_wave_break = errp_wave_break
        else
              errs_wave_break = errm_wave_break
        end if
        !print*, 'err_pl',errp_wave_break,errm_wave_break,errs_wave_break
        err_pr_wave_break = errs_wave_break/ wave_break_err
        !print *,'errp_pl', errp_wave_break 


	!! anorm_fe2 UV
        errp_anorm_Fe2t =  anorm_Fe2t_max - anorm_Fe2t_err 	
        errm_anorm_Fe2t =  anorm_Fe2t_err - anorm_Fe2t_min 	
        if ( errp_anorm_Fe2t>0.and.errm_anorm_Fe2t>0) then
         errs_anorm_Fe2t = 0.5*( ((2*errp_anorm_Fe2t*errm_anorm_Fe2t)/
     *                   (errp_anorm_Fe2t+errm_anorm_Fe2t)) 
     *                   + sqrt(errp_anorm_Fe2t*errm_anorm_Fe2t) ) 	
        else if (errp_anorm_Fe2t>0) then 
              errs_anorm_Fe2t = errp_anorm_Fe2t
        else
              errs_anorm_Fe2t = errm_anorm_Fe2t
        end if
        err_pr_anorm_Fe2t = errs_anorm_Fe2t/anorm_Fe2t_err


	!! anorm_fe2_opt
        errp_anorm_Fe2t_opt =  anorm_Fe2t_opt_max - anorm_Fe2t_opt_err 	
        errm_anorm_Fe2t_opt =  anorm_Fe2t_opt_err - anorm_Fe2t_opt_min 	
        if ( errp_anorm_Fe2t_opt>0.and.errm_anorm_Fe2t_opt>0) then
         errs_anorm_Fe2t_opt = 0.5*( ((2*errp_anorm_Fe2t_opt*errm_
     *			  anorm_Fe2t_opt)/
     *                   (errp_anorm_Fe2t_opt+errm_anorm_Fe2t_opt)) 
     *                   + sqrt(errp_anorm_Fe2t_opt*errm_
     *			 anorm_Fe2t_opt)) 	
        else if (errp_anorm_Fe2t_opt>0) then 
              errs_anorm_Fe2t_opt = errp_anorm_Fe2t_opt
        else
              errs_anorm_Fe2t_opt = errm_anorm_Fe2t_opt
        end if
        err_pr_anorm_Fe2t_opt = errs_anorm_Fe2t_opt/anorm_Fe2t_opt_err


	!! anorm_highbal
        errp_anorm_highbal =  anorm_highbal_max - anorm_highbal_err 	
        errm_anorm_highbal =  anorm_highbal_err - anorm_highbal_min 	
        if ( errp_anorm_highbal>0.and.errm_anorm_highbal>0) then
         errs_anorm_highbal = 0.5*( ((2*errp_anorm_highbal*errm_
     *			  anorm_highbal)/
     *                    (errp_anorm_highbal+errm_anorm_highbal)) 
     *                    + sqrt(errp_anorm_highbal*errm_anorm_
     *			  highbal)) 	
        else if (errp_anorm_highbal>0) then 
              errs_anorm_highbal = errp_anorm_highbal
        else
              errs_anorm_highbal = errm_anorm_highbal
        end if
        err_pr_anorm_highbal = errs_anorm_highbal/anorm_highbal_err


	!! anorm_balcont
        errp_anorm_balcont =  anorm_balcont_max - anorm_balcont_err 	
        errm_anorm_balcont =  anorm_balcont_err - anorm_balcont_min 	
        if ( errp_anorm_balcont>0.and.errm_anorm_balcont>0) then
         errs_anorm_balcont = 0.5*( ((2*errp_anorm_balcont*errm_
     *			 anorm_balcont)/
     *                   (errp_anorm_balcont+errm_anorm_balcont)) 
     *                   + sqrt(errp_anorm_balcont*errm_
     *			anorm_balcont) ) 	
        else if (errp_anorm_balcont>0) then 
              errs_anorm_balcont = errp_anorm_balcont
        else
              errs_anorm_balcont = errm_anorm_balcont
        end if
        err_pr_anorm_balcont = errs_anorm_balcont/anorm_balcont_err


	!! anorm_hb
        errp_anorm_hb =  anorm_hb_max - anorm_hb_err 	!5
        errm_anorm_hb = anorm_hb_err - anorm_hb_min
        if ( errp_anorm_hb>0.and.errm_anorm_hb>0) then
         errs_anorm_hb = 0.5*( ((2*errp_anorm_hb*errm_anorm_hb)/
     *                   (errp_anorm_hb+errm_anorm_hb)) 
     *                   + sqrt(errp_anorm_hb*errm_anorm_hb) ) 	
        else if (errp_anorm_hb>0) then 
              errs_anorm_hb = errp_anorm_hb
        else
              errs_anorm_hb = errm_anorm_hb
        end if
        err_pr_anorm_hb = errs_anorm_hb/anorm_hb_err


	!! width_hb
        errp_width_hb =  width_hb_max - width_hb_err
        errm_width_hb = width_hb_err - width_hb_min
        if ( errp_width_hb>0.and.errm_width_hb>0) then
         errs_width_hb = 0.5*( ((2*errp_width_hb*errm_width_hb)/
     *                   (errp_width_hb+errm_width_hb)) 
     *                   + sqrt(errp_width_hb*errm_width_hb) ) 	
        else if (errp_width_hb>0) then 
              errs_width_hb = errp_width_hb
        else
              errs_width_hb = errm_width_hb
        end if
        err_pr_width_hb = errs_width_hb/width_hb_err


	!! shift_hb
        errp_shift_hb =  shift_hb_max - shift_hb_err
        errm_shift_hb = shift_hb_err - shift_hb_min
        if ( errp_shift_hb>0.and.errm_shift_hb>0) then
         errs_shift_hb = 0.5*( ((2*errp_shift_hb*errm_shift_hb)/
     *                   (errp_shift_hb+errm_shift_hb)) 
     *                   + sqrt(errp_shift_hb*errm_shift_hb) ) 	
        else if (errp_shift_hb>0) then 
              errs_shift_hb = errp_shift_hb
        else
              errs_shift_hb = errm_shift_hb
        end if
        err_pr_shift_hb = errs_shift_hb/shift_hb_err


	!! anorm_hdelta
        errp_anorm_hdelta =  anorm_hdelta_max - anorm_hdelta_err 	
        errm_anorm_hdelta = anorm_hdelta_err - anorm_hdelta_min
        if ( errp_anorm_hdelta>0.and.errm_anorm_hdelta>0) then
         errs_anorm_hdelta = 0.5*( ((2*errp_anorm_hdelta*
     *                   errm_anorm_hdelta)/(errp_anorm_hdelta
     *                   +errm_anorm_hdelta)) 
     *                   + sqrt(errp_anorm_hdelta*errm_anorm_hdelta)) 	
        else if (errp_anorm_hdelta>0) then 
              errs_anorm_hdelta = errp_anorm_hdelta
        else
              errs_anorm_hdelta = errm_anorm_hdelta
        end if
        err_pr_anorm_hdelta = errs_anorm_hdelta/anorm_hdelta_err


	!! anorm_hgamma
        errp_anorm_hgamma =  anorm_hgamma_max - anorm_hgamma_err 	
        errm_anorm_hgamma = anorm_hgamma_err - anorm_hgamma_min
        if ( errp_anorm_hgamma>0.and.errm_anorm_hgamma>0) then
         errs_anorm_hgamma = 0.5*( ((2*errp_anorm_hgamma*
     *			 errm_anorm_hgamma)/
     *                   (errp_anorm_hgamma+errm_anorm_hgamma)) 
     *                   + sqrt(errp_anorm_hgamma*errm_anorm_hgamma)) 	
        else if (errp_anorm_hgamma>0) then 
              errs_anorm_hgamma = errp_anorm_hgamma
        else
              errs_anorm_hgamma = errm_anorm_hgamma
        end if
        err_pr_anorm_hgamma = errs_anorm_hgamma/anorm_hgamma_err


	!! anorm_h8
        errp_anorm_h8 =  anorm_h8_max - anorm_h8_err 	!5
        errm_anorm_h8 = anorm_h8_err - anorm_h8_min
        if ( errp_anorm_h8>0.and.errm_anorm_h8>0) then
         errs_anorm_h8 = 0.5*( ((2*errp_anorm_h8*errm_anorm_h8)/
     *                   (errp_anorm_h8+errm_anorm_h8)) 
     *                   + sqrt(errp_anorm_h8*errm_anorm_h8) ) 	
        else if (errp_anorm_h8>0) then 
              errs_anorm_h8 = errp_anorm_h8
        else
              errs_anorm_h8 = errm_anorm_h8
        end if
        err_pr_anorm_h8 = errs_anorm_h8/anorm_h8_err


	!! anorm_hepsilon
        errp_anorm_hepsilon =  anorm_hepsilon_max - anorm_hepsilon_err 	!5
        errm_anorm_hepsilon = anorm_hepsilon_err - anorm_hepsilon_min
        if ( errp_anorm_hepsilon>0.and.errm_anorm_hepsilon>0) then
         errs_anorm_hepsilon = 0.5*( ((2*errp_anorm_hepsilon*errm_
     *                  anorm_hepsilon)/(errp_anorm_hepsilon+errm_
     *			anorm_hepsilon)) 
     *                 + sqrt(errp_anorm_hepsilon*errm_anorm_hepsilon)) 	
        else if (errp_anorm_hepsilon>0) then 
              errs_anorm_hepsilon = errp_anorm_hepsilon
        else
              errs_anorm_hepsilon = errm_anorm_hepsilon
        end if
        err_pr_anorm_hepsilon = errs_anorm_hepsilon/anorm_hepsilon_err


	!! anorm_alii2669
        errp_anorm_alii2669 =  anorm_alii2669_max - anorm_alii2669_err
        errm_anorm_alii2669 = anorm_alii2669_err - anorm_alii2669_min
        if ( errp_anorm_alii2669>0.and.errm_anorm_alii2669>0) then
         errs_anorm_alii2669 = 0.5*( ((2*errp_anorm_alii2669*errm_
     *			anorm_alii2669)/
     *                  (errp_anorm_alii2669+errm_anorm_alii2669)) 
     *                  +sqrt(errp_anorm_alii2669*errm_anorm_alii2669)) 	
        else if (errp_anorm_alii2669>0) then 
              errs_anorm_alii2669 = errp_anorm_alii2669
        else
              errs_anorm_alii2669 = errm_anorm_alii2669
        end if
        err_pr_anorm_alii2669 = errs_anorm_alii2669/anorm_alii2669_err


	!! anorm_cii2326
        errp_anorm_cii2326 =  anorm_cii2326_max - anorm_cii2326_err 	!5
        errm_anorm_cii2326 = anorm_cii2326_err - anorm_cii2326_min
        if ( errp_anorm_cii2326>0.and.errm_anorm_cii2326>0) then
         errs_anorm_cii2326 = 0.5*( ((2*errp_anorm_cii2326*errm_
     *			anorm_cii2326)/
     *                  (errp_anorm_cii2326+errm_anorm_cii2326)) 
     *                  + sqrt(errp_anorm_cii2326*errm_anorm_cii2326)) 	
        else if (errp_anorm_cii2326>0) then 
              errs_anorm_cii2326 = errp_anorm_cii2326
        else
              errs_anorm_cii2326 = errm_anorm_cii2326
        end if
        err_pr_anorm_cii2326 = errs_anorm_cii2326/anorm_cii2326_err


	!! anorm_mg2a
        errp_anorm_mg2a =  anorm_mg2a_max - anorm_mg2a_err 	!5
        errm_anorm_mg2a = anorm_mg2a_err - anorm_mg2a_min
        if ( errp_anorm_mg2a>0.and.errm_anorm_mg2a>0) then
         errs_anorm_mg2a = 0.5*( ((2*errp_anorm_mg2a*errm_anorm_mg2a)/
     *                   (errp_anorm_mg2a+errm_anorm_mg2a)) 
     *                   + sqrt(errp_anorm_mg2a*errm_anorm_mg2a) ) 	
        else if (errp_anorm_mg2a>0) then 
              errs_anorm_mg2a = errp_anorm_mg2a
        else
              errs_anorm_mg2a = errm_anorm_mg2a
        end if
        err_pr_anorm_mg2a = errs_anorm_mg2a/anorm_mg2a_err


	!! width_mg2a
        errp_width_mg2a =  width_mg2a_max - width_mg2a_err
        errm_width_mg2a = width_mg2a_err - width_mg2a_min
        if ( errp_width_mg2a>0.and.errm_width_mg2a>0) then
         errs_width_mg2a = 0.5*( ((2*errp_width_mg2a*errm_width_mg2a)/
     *                   (errp_width_mg2a+errm_width_mg2a)) 
     *                   + sqrt(errp_width_mg2a*errm_width_mg2a) ) 	
        else if (errp_width_mg2a>0) then 
              errs_width_mg2a = errp_width_mg2a
        else
              errs_width_mg2a = errm_width_mg2a
        end if
        err_pr_width_mg2a = errs_width_mg2a/width_mg2a_err


	!! shift_mg2a
        errp_shift_mg2a =  shift_mg2a_max - shift_mg2a_err
        errm_shift_mg2a = shift_mg2a_err - shift_mg2a_min
        if ( errp_shift_mg2a>0.and.errm_shift_mg2a>0) then
         errs_shift_mg2a = 0.5*( ((2*errp_shift_mg2a*errm_shift_mg2a)/
     *                   (errp_shift_mg2a+errm_shift_mg2a)) 
     *                   + sqrt(errp_shift_mg2a*errm_shift_mg2a) ) 	
        else if (errp_shift_mg2a>0) then 
              errs_shift_mg2a = errp_shift_mg2a
        else
              errs_shift_mg2a = errm_shift_mg2a
        end if
        err_pr_shift_mg2a = errs_shift_mg2a/shift_mg2a_err


	!! anorm_oiii2672
        errp_anorm_oiii2672 =  anorm_oiii2672_max - anorm_oiii2672_err 	!5
        errm_anorm_oiii2672 = anorm_oiii2672_err - anorm_oiii2672_min
        if ( errp_anorm_oiii2672>0.and.errm_anorm_oiii2672>0) then
         errs_anorm_oiii2672 = 0.5*( ((2*errp_anorm_oiii2672*errm_
     *			anorm_oiii2672)/
     *                 (errp_anorm_oiii2672+errm_anorm_oiii2672)) 
     *                 + sqrt(errp_anorm_oiii2672*errm_anorm_oiii2672)) 	
        else if (errp_anorm_oiii2672>0) then 
              errs_anorm_oiii2672 = errp_anorm_oiii2672
        else
              errs_anorm_oiii2672 = errm_anorm_oiii2672
        end if
        err_pr_anorm_oiii2672 = errs_anorm_oiii2672/anorm_oiii2672_err


	!! width_oiii2672
        errp_width_oiii2672 =  width_oiii2672_max - width_oiii2672_err
        errm_width_oiii2672 = width_oiii2672_err - width_oiii2672_min
        if ( errp_width_oiii2672>0.and.errm_width_oiii2672>0) then
         errs_width_oiii2672 = 0.5*( ((2*errp_width_oiii2672*errm_
     *			width_oiii2672)/
     *                 (errp_width_oiii2672+errm_width_oiii2672)) 
     *                 + sqrt(errp_width_oiii2672*errm_width_oiii2672)) 	
        else if (errp_width_oiii2672>0) then 
              errs_width_oiii2672 = errp_width_oiii2672
        else
              errs_width_oiii2672 = errm_width_oiii2672
        end if
        err_pr_width_oiii2672 = errs_width_oiii2672/width_oiii2672_err


	!! shift_oiii2672
        errp_shift_oiii2672 =  shift_oiii2672_max - shift_oiii2672_err
        errm_shift_oiii2672 = shift_oiii2672_err - shift_oiii2672_min
        if ( errp_shift_oiii2672>0.and.errm_shift_oiii2672>0) then
         errs_shift_oiii2672 = 0.5*( ((2*errp_shift_oiii2672*errm_
     *			shift_oiii2672)/
     *                  (errp_shift_oiii2672+errm_shift_oiii2672)) 
     *                  + sqrt(errp_shift_oiii2672*errm_shift_oiii2672)) 	
        else if (errp_shift_oiii2672>0) then 
              errs_shift_oiii2672 = errp_shift_oiii2672
        else
              errs_shift_oiii2672 = errm_shift_oiii2672
        end if
        err_pr_shift_oiii2672 = errs_shift_oiii2672/shift_oiii2672_err


	!! anorm_oiii3133
        errp_anorm_oiii3133 =  anorm_oiii3133_max - anorm_oiii3133_err 	
        errm_anorm_oiii3133 = anorm_oiii3133_err - anorm_oiii3133_min
        if ( errp_anorm_oiii3133>0.and.errm_anorm_oiii3133>0) then
         errs_anorm_oiii3133 = 0.5*( ((2*errp_anorm_oiii3133*errm_
     *			anorm_oiii3133)/
     *                  (errp_anorm_oiii3133+errm_anorm_oiii3133)) 
     *                  + sqrt(errp_anorm_oiii3133*errm_anorm_oiii3133)) 	
        else if (errp_anorm_oiii3133>0) then 
              errs_anorm_oiii3133 = errp_anorm_oiii3133
        else
              errs_anorm_oiii3133 = errm_anorm_oiii3133
        end if
        err_pr_anorm_oiii3133 = errs_anorm_oiii3133/anorm_oiii3133_err


	!! anorm_heii4685
        errp_anorm_heii4685 =  anorm_heii4685_max - anorm_heii4685_err 	
        errm_anorm_heii4685 = anorm_heii4685_err - anorm_heii4685_min
        if ( errp_anorm_heii4685>0.and.errm_anorm_heii4685>0) then
         errs_anorm_heii4685 = 0.5*( ((2*errp_anorm_heii4685*errm_
     *			anorm_heii4685)/
     *                  (errp_anorm_heii4685+errm_anorm_heii4685)) 
     *                  + sqrt(errp_anorm_heii4685*errm_anorm_heii4685)) 	
        else if (errp_anorm_heii4685>0) then 
              errs_anorm_heii4685 = errp_anorm_heii4685
        else
              errs_anorm_heii4685 = errm_anorm_heii4685
        end if
        err_pr_anorm_heii4685 = errs_anorm_heii4685/anorm_heii4685_err


	!! width_heii4685
        errp_width_heii4685 =  width_heii4685_max - width_heii4685_err
        errm_width_heii4685 = width_heii4685_err - width_heii4685_min
        if ( errp_width_heii4685>0.and.errm_width_heii4685>0) then
         errs_width_heii4685 = 0.5*( ((2*errp_width_heii4685*errm_
     *			width_heii4685)/
     *                  (errp_width_heii4685+errm_width_heii4685)) 
     *                  + sqrt(errp_width_heii4685*errm_width_heii4685)) 	
        else if (errp_width_heii4685>0) then 
              errs_width_heii4685 = errp_width_heii4685
        else
              errs_width_heii4685 = errm_width_heii4685
        end if
        err_pr_width_heii4685 = errs_width_heii4685/width_heii4685_err


	!! shift_heii4685
        errp_shift_heii4685 =  shift_heii4685_max - shift_heii4685_err
        errm_shift_heii4685 = shift_heii4685_err - shift_heii4685_min
        if ( errp_shift_heii4685>0.and.errm_shift_heii4685>0) then
         errs_shift_heii4685 = 0.5*( ((2*errp_shift_heii4685*errm_
     *			shift_heii4685)/
     *                  (errp_shift_heii4685+errm_shift_heii4685)) 
     *                  + sqrt(errp_shift_heii4685*errm_shift_heii4685)) 	
        else if (errp_shift_heii4685>0) then 
              errs_shift_heii4685 = errp_shift_heii4685
        else
              errs_shift_heii4685 = errm_shift_heii4685
        end if
        err_pr_shift_heii4685 = errs_shift_heii4685/shift_heii4685_err


	!! anorm_hei3188
        errp_anorm_hei3188 =  anorm_hei3188_max - anorm_hei3188_err 	!5
        errm_anorm_hei3188 = anorm_hei3188_err - anorm_hei3188_min
        if ( errp_anorm_hei3188>0.and.errm_anorm_hei3188>0) then
         errs_anorm_hei3188 = 0.5*( ((2*errp_anorm_hei3188*errm_
     *			anorm_hei3188)/
     *                  (errp_anorm_hei3188+errm_anorm_hei3188)) 
     *                  + sqrt(errp_anorm_hei3188*errm_anorm_hei3188)) 	
        else if (errp_anorm_hei3188>0) then 
              errs_anorm_hei3188 = errp_anorm_hei3188
        else
              errs_anorm_hei3188 = errm_anorm_hei3188
        end if
        err_pr_anorm_hei3188 = errs_anorm_hei3188/anorm_hei3188_err


	!! anorm_hei3588
        errp_anorm_hei3588 =  anorm_hei3588_max - anorm_hei3588_err 	!5
        errm_anorm_hei3588 = anorm_hei3588_err - anorm_hei3588_min
        if ( errp_anorm_hei3588>0.and.errm_anorm_hei3588>0) then
         errs_anorm_hei3588 = 0.5*( ((2*errp_anorm_hei3588*errm_
     *			anorm_hei3588)/
     *                  (errp_anorm_hei3588+errm_anorm_hei3588)) 
     *                  + sqrt(errp_anorm_hei3588*errm_anorm_hei3588)) 	
        else if (errp_anorm_hei3588>0) then 
              errs_anorm_hei3588 = errp_anorm_hei3588
        else
              errs_anorm_hei3588 = errm_anorm_hei3588
        end if
        err_pr_anorm_hei3588 = errs_anorm_hei3588/anorm_hei3588_err


	!! anorm_hei3889
        errp_anorm_hei3889 =  anorm_hei3889_max - anorm_hei3889_err 	!5
        errm_anorm_hei3889 = anorm_hei3889_err - anorm_hei3889_min
        if ( errp_anorm_hei3889>0.and.errm_anorm_hei3889>0) then
         errs_anorm_hei3889 = 0.5*( ((2*errp_anorm_hei3889*errm_
     *			anorm_hei3889)/
     *                  (errp_anorm_hei3889+errm_anorm_hei3889)) 
     *                  + sqrt(errp_anorm_hei3889*errm_anorm_hei3889)) 	
        else if (errp_anorm_hei3889>0) then 
              errs_anorm_hei3889 = errp_anorm_hei3889
        else
              errs_anorm_hei3889 = errm_anorm_hei3889
        end if
        err_pr_anorm_hei3889 = errs_anorm_hei3889/anorm_hei3889_err


	!! anorm_hei5875
        errp_anorm_hei5875 =  anorm_hei5875_max - anorm_hei5875_err 	
        errm_anorm_hei5875 = anorm_hei5875_err - anorm_hei5875_min
        if ( errp_anorm_hei5875>0.and.errm_anorm_hei5875>0) then
         errs_anorm_hei5875 = 0.5*( ((2*errp_anorm_hei5875*errm_
     *			anorm_hei5875)/
     *                  (errp_anorm_hei5875+errm_anorm_hei5875)) 
     *                  + sqrt(errp_anorm_hei5875*errm_anorm_hei5875)) 	
        else if (errp_anorm_hei5875>0) then 
              errs_anorm_hei5875 = errp_anorm_hei5875
        else
              errs_anorm_hei5875 = errm_anorm_hei5875
        end if
        err_pr_anorm_hei5875 = errs_anorm_hei5875/anorm_hei5875_err


	!! anorm_hei4472
        errp_anorm_hei4472 =  anorm_hei4472_max - anorm_hei4472_err 	
        errm_anorm_hei4472 = anorm_hei4472_err - anorm_hei4472_min
        if ( errp_anorm_hei4472>0.and.errm_anorm_hei4472>0) then
         errs_anorm_hei4472 = 0.5*( ((2*errp_anorm_hei4472*errm_
     *			anorm_hei4472)/
     *                  (errp_anorm_hei4472+errm_anorm_hei4472)) 
     *                  + sqrt(errp_anorm_hei4472*errm_anorm_hei4472)) 	
        else if (errp_anorm_hei4472>0) then 
              errs_anorm_hei4472 = errp_anorm_hei4472
        else
              errs_anorm_hei4472 = errm_anorm_hei4472
        end if
        err_pr_anorm_hei4472 = errs_anorm_hei4472/anorm_hei4472_err


	!! anorm_hei7067
        errp_anorm_hei7067 =  anorm_hei7067_max - anorm_hei7067_err	
        errm_anorm_hei7067 = anorm_hei7067_err - anorm_hei7067_min
        if ( errp_anorm_hei7067>0.and.errm_anorm_hei7067>0) then
         errs_anorm_hei7067 = 0.5*( ((2*errp_anorm_hei7067*
     *			  errm_anorm_hei7067)/
     *                   (errp_anorm_hei7067+errm_anorm_hei7067)) 
     *                   + sqrt(errp_anorm_hei7067*errm_anorm_hei7067)) 	
        else if (errp_anorm_hei7067>0.and.errm_anorm_hei7067<=0) then 
           errs_anorm_hei7067 = errp_anorm_hei7067
        else
           errs_anorm_hei7067 = errm_anorm_hei7067
        end if
        err_pr_anorm_hei7067 = errs_anorm_hei7067/anorm_hei7067_err


	!! anorm_o3a
        errp_anorm_o3a =  anorm_o3a_max - anorm_o3a_err 	
        errm_anorm_o3a = anorm_o3a_err - anorm_o3a_min
        if ( errp_anorm_o3a>0.and.errm_anorm_o3a>0) then
         errs_anorm_o3a = 0.5*( ((2*errp_anorm_o3a*errm_anorm_o3a)/
     *                   (errp_anorm_o3a+errm_anorm_o3a)) 
     *                   + sqrt(errp_anorm_o3a*errm_anorm_o3a) ) 	
        else if (errp_anorm_o3a>0) then 
              errs_anorm_o3a = errp_anorm_o3a
        else
              errs_anorm_o3a = errm_anorm_o3a
        end if
        err_pr_anorm_o3a = errs_anorm_o3a/anorm_o3a_err


	!! width_o3a
        errp_width_o3a =  width_o3a_max - width_o3a_err
        errm_width_o3a = width_o3a_err - width_o3a_min
        if ( errp_width_o3a>0.and.errm_width_o3a>0) then
         errs_width_o3a = 0.5*( ((2*errp_width_o3a*errm_width_o3a)/
     *                   (errp_width_o3a+errm_width_o3a)) 
     *                   + sqrt(errp_width_o3a*errm_width_o3a) ) 	
        else if (errp_width_o3a>0) then 
              errs_width_o3a = errp_width_o3a
        else
              errs_width_o3a = errm_width_o3a
        end if
        err_pr_width_o3a = errs_width_o3a/width_o3a_err


	!! shift_o3a
        errp_shift_o3a =  shift_o3a_max - shift_o3a_err
        errm_shift_o3a = shift_o3a_err - shift_o3a_min
        if ( errp_shift_o3a>0.and.errm_shift_o3a>0) then
         errs_shift_o3a = 0.5*( ((2*errp_shift_o3a*errm_shift_o3a)/
     *                   (errp_shift_o3a+errm_shift_o3a)) 
     *                   + sqrt(errp_shift_o3a*errm_shift_o3a) ) 	
        else if (errp_shift_o3a>0) then 
              errs_shift_o3a = errp_shift_o3a
        else
              errs_shift_o3a = errm_shift_o3a
        end if
        err_pr_shift_o3a = errs_shift_o3a/shift_o3a_err


	!! anorm_hbnc
        errp_anorm_hbnc =  anorm_hbnc_max - anorm_hbnc_err 		
        errm_anorm_hbnc = anorm_hbnc_err - anorm_hbnc_min
        if ( errp_anorm_hbnc>0.and.errm_anorm_hbnc>0) then
         errs_anorm_hbnc = 0.5*( ((2*errp_anorm_hbnc*errm_anorm_hbnc)/
     *                   (errp_anorm_hbnc+errm_anorm_hbnc)) 
     *                   + sqrt(errp_anorm_hbnc*errm_anorm_hbnc) ) 	
        else if (errp_anorm_hbnc>0) then 
              errs_anorm_hbnc = errp_anorm_hbnc
        else
              errs_anorm_hbnc = errm_anorm_hbnc
        end if
        err_pr_anorm_hbnc = errs_anorm_hbnc/anorm_hbnc_err


	!! anorm_heii4685nc
        errp_anorm_heii4685nc =  anorm_heii4685nc_max - anorm_
     *				heii4685nc_err 	!5
        errm_anorm_heii4685nc = anorm_heii4685nc_err - anorm_
     *				heii4685nc_min
        if ( errp_anorm_heii4685nc>0.and.errm_anorm_heii4685nc>0) then
         errs_anorm_heii4685nc = 0.5*( ((2*errp_anorm_heii4685nc*errm_
     *			anorm_heii4685nc)/
     *                   (errp_anorm_heii4685nc+errm_anorm_heii4685nc)) 
     *                   + sqrt(errp_anorm_heii4685nc*errm_
     *			anorm_heii4685nc)) 	
        else if (errp_anorm_heii4685nc>0) then 
              errs_anorm_heii4685nc = errp_anorm_heii4685nc
        else
              errs_anorm_heii4685nc = errm_anorm_heii4685nc
        end if
        err_pr_anorm_heii4685nc = errs_anorm_heii4685nc/anorm_
     *				heii4685nc_err


	!! anorm_oiii4363
        errp_anorm_oiii4363 =  anorm_oiii4363_max - 
     *				anorm_oiii4363_err	!35
        errm_anorm_oiii4363 = anorm_oiii4363_err - 
     *				anorm_oiii4363_min
        if ( errp_anorm_oiii4363>0.and.errm_anorm_oiii4363>0) then
         errs_anorm_oiii4363 = 0.5*( ((2*errp_anorm_oiii4363*
     *			 errm_anorm_oiii4363)/
     *                   (errp_anorm_oiii4363+errm_anorm_oiii4363)) 
     *                   + sqrt(errp_anorm_oiii4363*
     *			 errm_anorm_oiii4363) ) 	
        else if (errp_anorm_oiii4363>0) then 
              errs_anorm_oiii4363 = errp_anorm_oiii4363
        else
              errs_anorm_oiii4363 = errm_anorm_oiii4363
        end if
        err_pr_anorm_oiii4363 = errs_anorm_oiii4363/anorm_oiii4363_err


	!! anorm_nii5200
        errp_anorm_ni5200 =  anorm_ni5200_max - anorm_ni5200_err	
        errm_anorm_ni5200 = anorm_ni5200_err - anorm_ni5200_min
        if ( errp_anorm_ni5200>0.and.errm_anorm_ni5200>0) then
         errs_anorm_ni5200 = 0.5*( ((2*errp_anorm_ni5200*
     *			 errm_anorm_ni5200)/
     *                   (errp_anorm_ni5200+errm_anorm_ni5200)) 
     *                   + sqrt(errp_anorm_ni5200*errm_anorm_ni5200)) 	
        else if (errp_anorm_ni5200>0) then 
              errs_anorm_ni5200 = errp_anorm_ni5200
        else
              errs_anorm_ni5200 = errm_anorm_ni5200
        end if
        err_pr_anorm_ni5200 = errs_anorm_ni5200/anorm_ni5200_err


	!! anorm_neiv2423
        errp_anorm_neiv2423 =  anorm_neiv2423_max - anorm_neiv2423_err 	!5
        errm_anorm_neiv2423 = anorm_neiv2423_err - anorm_neiv2423_min
        if ( errp_anorm_neiv2423>0.and.errm_anorm_neiv2423>0) then
         errs_anorm_neiv2423 = 0.5*( ((2*errp_anorm_neiv2423*errm_
     *		       anorm_neiv2423)/
     *                 (errp_anorm_neiv2423+errm_anorm_neiv2423)) 
     *                 +sqrt(errp_anorm_neiv2423*errm_anorm_neiv2423)) 	
        else if (errp_anorm_neiv2423>0) then 
              errs_anorm_neiv2423 = errp_anorm_neiv2423
        else
              errs_anorm_neiv2423 = errm_anorm_neiv2423
        end if
        err_pr_anorm_neiv2423 = errs_anorm_neiv2423/anorm_neiv2423_err


	!! anorm_oii2471
        errp_anorm_oii2471 =  anorm_oii2471_max - anorm_oii2471_err 	!5
        errm_anorm_oii2471 = anorm_oii2471_err - anorm_oii2471_min
        if ( errp_anorm_oii2471>0.and.errm_anorm_oii2471>0) then
         errs_anorm_oii2471 = 0.5*( ((2*errp_anorm_oii2471*errm_
     *			anorm_oii2471)/
     *                  (errp_anorm_oii2471+errm_anorm_oii2471)) 
     *                  + sqrt(errp_anorm_oii2471*errm_anorm_oii2471)) 	
        else if (errp_anorm_oii2471>0) then 
              errs_anorm_oii2471 = errp_anorm_oii2471
        else
              errs_anorm_oii2471 = errm_anorm_oii2471
        end if
        err_pr_anorm_oii2471 = errs_anorm_oii2471/anorm_oii2471_err


	!! anorm_nev3346
        errp_anorm_nev3346 =  anorm_nev3346_max - anorm_nev3346_err 	
        errm_anorm_nev3346 = anorm_nev3346_err - anorm_nev3346_min
        if ( errp_anorm_nev3346>0.and.errm_anorm_nev3346>0) then
         errs_anorm_nev3346 = 0.5*( ((2*errp_anorm_nev3346*errm_
     *			anorm_nev3346)/
     *                  (errp_anorm_nev3346+errm_anorm_nev3346)) 
     *                  +sqrt(errp_anorm_nev3346*errm_anorm_nev3346)) 	
        else if (errp_anorm_nev3346>0) then 
              errs_anorm_nev3346 = errp_anorm_nev3346
        else
              errs_anorm_nev3346 = errm_anorm_nev3346
        end if
        err_pr_anorm_nev3346 = errs_anorm_nev3346/anorm_nev3346_err


	!! anorm_oii3728
        errp_anorm_oii3728 =  anorm_oii3728_max - anorm_oii3728_err 	
        errm_anorm_oii3728 = anorm_oii3728_err - anorm_oii3728_min
        if ( errp_anorm_oii3728>0.and.errm_anorm_oii3728>0) then
         errs_anorm_oii3728 = 0.5*( ((2*errp_anorm_oii3728*errm_
     *			anorm_oii3728)/
     *                  (errp_anorm_oii3728+errm_anorm_oii3728)) 
     *                  + sqrt(errp_anorm_oii3728*errm_anorm_oii3728)) 	
        else if (errp_anorm_oii3728>0) then 
              errs_anorm_oii3728 = errp_anorm_oii3728
        else
              errs_anorm_oii3728 = errm_anorm_oii3728
        end if
        err_pr_anorm_oii3728 = errs_anorm_oii3728/anorm_oii3728_err


	!! anorm_neiii3869
        errp_anorm_neiii3869 =  anorm_neiii3869_max - anorm_
     *				neiii3869_err 	
        errm_anorm_neiii3869 = anorm_neiii3869_err - anorm_
     /				neiii3869_min
        if ( errp_anorm_neiii3869>0.and.errm_anorm_neiii3869>0) then
         errs_anorm_neiii3869 = 0.5*( ((2*errp_anorm_neiii3869*errm_
     *				anorm_neiii3869)/
     *                   (errp_anorm_neiii3869+errm_anorm_neiii3869)) 
     *                   + sqrt(errp_anorm_neiii3869*errm_anorm_
     *			neiii3869) ) 	
        else if (errp_anorm_neiii3869>0) then 
              errs_anorm_neiii3869 = errp_anorm_neiii3869
        else
              errs_anorm_neiii3869 = errm_anorm_neiii3869
        end if
        err_pr_anorm_neiii3869 = errs_anorm_neiii3869/anorm_
     *				neiii3869_err


	!! anorm_neiii3968
        errp_anorm_neiii3968 =  anorm_neiii3968_max - anorm_
     *				neiii3968_err 	!5
        errm_anorm_neiii3968 = anorm_neiii3968_err - anorm_
     *				neiii3968_min
        if ( errp_anorm_neiii3968>0.and.errm_anorm_neiii3968>0) then
         errs_anorm_neiii3968 = 0.5*( ((2*errp_anorm_neiii3968*errm_
     *				anorm_neiii3968)/
     *                   (errp_anorm_neiii3968+errm_anorm_neiii3968)) 
     *                   + sqrt(errp_anorm_neiii3968*errm_anorm_
     *			neiii3968) ) 	
        else if (errp_anorm_neiii3968>0) then 
              errs_anorm_neiii3968 = errp_anorm_neiii3968
        else
              errs_anorm_neiii3968 = errm_anorm_neiii3968
        end if
        err_pr_anorm_neiii3968 = errs_anorm_neiii3968/anorm_
     *				neiii3968_err


	!! anorm_fev4072
        errp_anorm_fev4072 =  anorm_fev4072_max - anorm_fev4072_err 	
        errm_anorm_fev4072 = anorm_fev4072_err - anorm_fev4072_min
        if ( errp_anorm_fev4072>0.and.errm_anorm_fev4072>0) then
         errs_anorm_fev4072 = 0.5*( ((2*errp_anorm_fev4072*errm_
     *			anorm_fev4072)/
     *                  (errp_anorm_fev4072+errm_anorm_fev4072)) 
     *                  + sqrt(errp_anorm_fev4072*errm_anorm_fev4072)) 	
        else if (errp_anorm_fev4072>0) then 
              errs_anorm_fev4072 = errp_anorm_fev4072
        else
              errs_anorm_fev4072 = errm_anorm_fev4072
        end if
        err_pr_anorm_fev4072 = errs_anorm_fev4072/anorm_fev4072_err


	!! anorm_fev4073
        errp_anorm_sii4073 =  anorm_sii4073_max - anorm_sii4073_err 	
        errm_anorm_sii4073 = anorm_sii4073_err - anorm_sii4073_min
        if ( errp_anorm_sii4073>0.and.errm_anorm_sii4073>0) then
         errs_anorm_sii4073 = 0.5*( ((2*errp_anorm_sii4073*errm_
     *				anorm_sii4073)/
     *                   (errp_anorm_sii4073+errm_anorm_sii4073)) 
     *                   + sqrt(errp_anorm_sii4073*errm_anorm_sii4073)) 	
        else if (errp_anorm_sii4073>0) then 
              errs_anorm_sii4073 = errp_anorm_sii4073
        else
              errs_anorm_sii4073 = errm_anorm_sii4073
        end if
        err_pr_anorm_sii4073 = errs_anorm_sii4073/anorm_sii4073_err


	!! anorm_hdeltanc
        errp_anorm_hdeltanc =  anorm_hdeltanc_max - anorm_hdeltanc_err 	
        errm_anorm_hdeltanc = anorm_hdeltanc_err - anorm_hdeltanc_min
        if ( errp_anorm_hdeltanc>0.and.errm_anorm_hdeltanc>0) then
         errs_anorm_hdeltanc = 0.5*( ((2*errp_anorm_hdeltanc*
     *                   errm_anorm_hdeltanc)/(errp_anorm_hdeltanc
     *                   +errm_anorm_hdeltanc)) 
     *                  + sqrt(errp_anorm_hdeltanc*errm_anorm_hdeltanc)) 	
        else if (errp_anorm_hdeltanc>0) then 
              errs_anorm_hdeltanc = errp_anorm_hdeltanc
        else
              errs_anorm_hdeltanc = errm_anorm_hdeltanc
        end if
        err_pr_anorm_hdeltanc = errs_anorm_hdeltanc/anorm_hdeltanc_err


	!! anorm_hgammanc
        errp_anorm_hgammanc =  anorm_hgammanc_max - anorm_hgammanc_err 	
        errm_anorm_hgammanc = anorm_hgammanc_err - anorm_hgammanc_min
        if ( errp_anorm_hgammanc>0.and.errm_anorm_hgammanc>0) then
         errs_anorm_hgammanc = 0.5*( ((2*errp_anorm_hgammanc*
     *			 errm_anorm_hgammanc)/
     *                   (errp_anorm_hgammanc+errm_anorm_hgammanc)) 
     *                  + sqrt(errp_anorm_hgammanc*errm_anorm_hgammanc)) 	
        else if (errp_anorm_hgammanc>0) then 
              errs_anorm_hgammanc = errp_anorm_hgammanc
        else
              errs_anorm_hgammanc = errm_anorm_hgammanc
        end if
        err_pr_anorm_hgammanc = errs_anorm_hgammanc/anorm_hgammanc_err


	!! anorm_nev3426
        errp_anorm_nev3426 =  anorm_nev3426_max - anorm_nev3426_err 	
        errm_anorm_nev3426 = anorm_nev3426_err - anorm_nev3426_min
        if ( errp_anorm_nev3426>0.and.errm_anorm_nev3426>0) then
         errs_anorm_nev3426 = 0.5*( ((2*errp_anorm_nev3426*errm_
     *			anorm_nev3426)/
     *                  (errp_anorm_nev3426+errm_anorm_nev3426)) 
     *                  + sqrt(errp_anorm_nev3426*errm_anorm_nev3426)) 	
        else if (errp_anorm_nev3426>0) then 
              errs_anorm_nev3426 = errp_anorm_nev3426
        else
              errs_anorm_nev3426 = errm_anorm_nev3426
        end if
        err_pr_anorm_nev3426 = errs_anorm_nev3426/anorm_nev3426_err


	!! width_nev3426
        errp_width_nev3426 =  width_nev3426_max - width_nev3426_err 	
        errm_width_nev3426 = width_nev3426_err - width_nev3426_min
        if ( errp_width_nev3426>0.and.errm_width_nev3426>0) then
         errs_width_nev3426 = 0.5*( ((2*errp_width_nev3426*errm_
     *			width_nev3426)/
     *                  (errp_width_nev3426+errm_width_nev3426)) 
     *                  + sqrt(errp_width_nev3426*errm_width_nev3426)) 	
        else if (errp_width_nev3426>0) then 
              errs_width_nev3426 = errp_width_nev3426
        else
              errs_width_nev3426 = errm_width_nev3426
        end if
        err_pr_width_nev3426 = errs_width_nev3426/width_nev3426_err


	!! shift_nev3426
        errp_shift_nev3426 =  shift_nev3426_max - shift_nev3426_err 	
        errm_shift_nev3426 = shift_nev3426_err - shift_nev3426_min
        if ( errp_shift_nev3426>0.and.errm_shift_nev3426>0) then
         errs_shift_nev3426 = 0.5*( ((2*errp_shift_nev3426*errm_
     *			shift_nev3426)/
     *                  (errp_shift_nev3426+errm_shift_nev3426)) 
     *                  + sqrt(errp_shift_nev3426*errm_shift_nev3426)) 	
        else if (errp_shift_nev3426>0) then 
              errs_shift_nev3426 = errp_shift_nev3426
        else
              errs_shift_nev3426 = errm_shift_nev3426
        end if
        err_pr_shift_nev3426 = errs_shift_nev3426/shift_nev3426_err


	!! anorm_fevii3587
        errp_anorm_fevii3587 =  anorm_fevii3587_max - anorm_
     *				fevii3587_err 	!5
        errm_anorm_fevii3587 = anorm_fevii3587_err - anorm_
     *				fevii3587_min
        if ( errp_anorm_fevii3587>0.and.errm_anorm_fevii3587>0) then
         errs_anorm_fevii3587 = 0.5*( ((2*errp_anorm_fevii3587*errm_
     *			anorm_fevii3587)/
     *                  (errp_anorm_fevii3587+errm_anorm_fevii3587)) 
     *                  +sqrt(errp_anorm_fevii3587*errm_
     *			anorm_fevii3587)) 	
        else if (errp_anorm_fevii3587>0) then 
              errs_anorm_fevii3587 = errp_anorm_fevii3587
        else
              errs_anorm_fevii3587 = errm_anorm_fevii3587
        end if
        err_pr_anorm_fevii3587 = errs_anorm_fevii3587/anorm_
     *				fevii3587_err


	!! anorm_fevii3759
        errp_anorm_fevii3759 =  anorm_fevii3759_max - anorm_
     *				fevii3759_err 	!5
        errm_anorm_fevii3759 = anorm_fevii3759_err - anorm_
     *				fevii3759_min
        if ( errp_anorm_fevii3759>0.and.errm_anorm_fevii3759>0) then
         errs_anorm_fevii3759 = 0.5*( ((2*errp_anorm_fevii3759*errm_
     *			  anorm_fevii3759)/
     *                   (errp_anorm_fevii3759+errm_anorm_fevii3759)) 
     *                   + sqrt(errp_anorm_fevii3759*errm_anorm_
     *			  fevii3759)) 	
        else if (errp_anorm_fevii3759>0) then 
              errs_anorm_fevii3759 = errp_anorm_fevii3759
        else
              errs_anorm_fevii3759 = errm_anorm_fevii3759
        end if
        err_pr_anorm_fevii3759 = errs_anorm_fevii3759/anorm_
     *				  fevii3759_err


	!! anorm_fevii5160
        errp_anorm_fevii5160 =  anorm_fevii5160_max - anorm_
     *				fevii5160_err	
        errm_anorm_fevii5160 = anorm_fevii5160_err - anorm_fevii5160_min
        if ( errp_anorm_fevii5160>0.and.errm_anorm_fevii5160>0) then
         errs_anorm_fevii5160 = 0.5*( ((2*errp_anorm_fevii5160*errm_
     *			 anorm_fevii
     *			 5160)/
     *                   (errp_anorm_fevii5160+errm_anorm_fevii5160)) 
     *                   + sqrt(errp_anorm_fevii5160*errm_anorm_
     *			 fevii5160) ) 	
        else if (errp_anorm_fevii5160>0) then 
              errs_anorm_fevii5160 = errp_anorm_fevii5160
        else
              errs_anorm_fevii5160 = errm_anorm_fevii5160
        end if
        err_pr_anorm_fevii5160 = errs_anorm_fevii5160/anorm_fevii5160
     *				_err


	!! width_fevii5160
        errp_width_fevii5160 =  width_fevii5160_max - anorm_
     *				fevii5160_err	
        errm_width_fevii5160 = width_fevii5160_err - width_fevii5160_min
        if ( errp_width_fevii5160>0.and.errm_width_fevii5160>0) then
         errs_width_fevii5160 = 0.5*( ((2*errp_width_fevii5160*errm_
     *			 anorm_fevii
     *			 5160)/
     *                   (errp_width_fevii5160+errm_width_fevii5160)) 
     *                   + sqrt(errp_width_fevii5160*errm_anorm_
     *			 fevii5160) ) 	
        else if (errp_width_fevii5160>0) then 
              errs_width_fevii5160 = errp_width_fevii5160
        else
              errs_width_fevii5160 = errm_width_fevii5160
        end if
        err_pr_width_fevii5160 = errs_width_fevii5160/width_fevii5160
     *				_err


	!! shift_fevii5160
        errp_shift_fevii5160 =  shift_fevii5160_max - anorm_
     *				fevii5160_err	
        errm_shift_fevii5160 = shift_fevii5160_err - shift_fevii5160_min
        if ( errp_shift_fevii5160>0.and.errm_shift_fevii5160>0) then
         errs_shift_fevii5160 = 0.5*( ((2*errp_shift_fevii5160*errm_
     *			 anorm_fevii
     *			 5160)/
     *                   (errp_shift_fevii5160+errm_shift_fevii5160)) 
     *                   + sqrt(errp_shift_fevii5160*errm_anorm_
     *			 fevii5160) ) 	
        else if (errp_shift_fevii5160>0) then 
              errs_shift_fevii5160 = errp_shift_fevii5160
        else
              errs_shift_fevii5160 = errm_shift_fevii5160
        end if
        err_pr_shift_fevii5160 = errs_shift_fevii5160/shift_fevii5160
     *				_err


	!! anorm_fevi5177
        errp_anorm_fevi5177 =  anorm_fevi5177_max - anorm_fevi5177_err	
        errm_anorm_fevi5177 = anorm_fevi5177_err - anorm_fevi5177_min
        if ( errp_anorm_fevi5177>0.and.errm_anorm_fevi5177>0) then
         errs_anorm_fevi5177 = 0.5*( ((2*errp_anorm_fevi5177*errm_
     *			  anorm_fevi5177)/
     *                   (errp_anorm_fevi5177+errm_anorm_fevi5177)) 
     *                   + sqrt(errp_anorm_fevi5177*errm_anorm_
     *			 fevi5177)) 	
        else if (errp_anorm_fevi5177>0) then 
              errs_anorm_fevi5177 = errp_anorm_fevi5177
        else
              errs_anorm_fevi5177 = errm_anorm_fevi5177
        end if
        err_pr_anorm_fevi5177 = errs_anorm_fevi5177/anorm_fevi5177_err


	!! anorm_fexi7894
        errp_anorm_fexi7894 =  anorm_fexi7894_max - anorm_
     *				fevii5160_err	
        errm_anorm_fexi7894 = anorm_fexi7894_err - anorm_fexi7894_min
        if ( errp_anorm_fexi7894>0.and.errm_anorm_fexi7894>0) then
         errs_anorm_fexi7894 = 0.5*( ((2*errp_anorm_fexi7894*errm_
     *			 anorm_fevii
     *			 5160)/
     *                   (errp_anorm_fexi7894+errm_anorm_fexi7894)) 
     *                   + sqrt(errp_anorm_fexi7894*errm_anorm_
     *			 fevii5160) ) 	
        else if (errp_anorm_fexi7894>0) then 
              errs_anorm_fexi7894 = errp_anorm_fexi7894
        else
              errs_anorm_fexi7894 = errm_anorm_fexi7894
        end if
        err_pr_anorm_fexi7894 = errs_anorm_fexi7894/anorm_fexi7894
     *				_err


	!! anorm_fevii6086
        errp_anorm_fevii6086 =  anorm_fevii6086_max - anorm_
     *				fevii5160_err	
        errm_anorm_fevii6086 = anorm_fevii6086_err - anorm_fevii6086_min
        if ( errp_anorm_fevii6086>0.and.errm_anorm_fevii6086>0) then
         errs_anorm_fevii6086 = 0.5*( ((2*errp_anorm_fevii6086*errm_
     *			 anorm_fevii
     *			 5160)/
     *                   (errp_anorm_fevii6086+errm_anorm_fevii6086)) 
     *                   + sqrt(errp_anorm_fevii6086*errm_anorm_
     *			 fevii5160) ) 	
        else if (errp_anorm_fevii6086>0) then 
              errs_anorm_fevii6086 = errp_anorm_fevii6086
        else
              errs_anorm_fevii6086 = errm_anorm_fevii6086
        end if
        err_pr_anorm_fevii6086 = errs_anorm_fevii6086/anorm_fevii6086
     *				_err


	!! anorm_habc
        errp_anorm_ha =  anorm_ha_max - anorm_ha_err	!10 
        errm_anorm_ha = anorm_ha_err - anorm_ha_min
        if ( errp_anorm_ha>0.and.errm_anorm_ha>0) then
         errs_anorm_ha = 0.5*( ((2*errp_anorm_ha*errm_anorm_ha)/
     *                   (errp_anorm_ha+errm_anorm_ha)) 
     *                   + sqrt(errp_anorm_ha*errm_anorm_ha) ) 	
        else if (errp_anorm_ha>0.and.errm_anorm_ha<=0) then 
           errs_anorm_ha = errp_anorm_ha
        else
           errs_anorm_ha = errm_anorm_ha
        end if
        err_pr_anorm_ha = errs_anorm_ha/anorm_ha_err


	!! width_habc
        errp_width_ha =  width_ha_max - width_ha_err
        errm_width_ha = width_ha_err - width_ha_min
        if ( errp_width_ha>0.and.errm_width_ha>0) then
          errs_width_ha = 0.5*( ((2*errp_width_ha*errm_width_ha)/
     *                   (errp_width_ha+errm_width_ha)) 
     *                   + sqrt(errp_width_ha*errm_width_ha) ) 	
          !print *,'***** errs=sum'
        else if (errp_width_ha>0.and.errm_width_ha<=0) then 
           errs_width_ha = errp_width_ha
           !print *,'***** errs=errp'
        else 
           errs_width_ha = errm_width_ha
           !print *,'****** errs=errm'
        end if        
        err_pr_width_ha = errs_width_ha/width_ha_err


	!! shift_habc
        errp_shift_ha =  shift_ha_max - shift_ha_err
        errm_shift_ha = shift_ha_err - shift_ha_min
        if ( errp_shift_ha>0.and.errm_shift_ha>0) then
         errs_shift_ha = 0.5*( ((2*errp_shift_ha*errm_shift_ha)/
     *                   (errp_shift_ha+errm_shift_ha)) 
     *                   + sqrt(errp_shift_ha*errm_shift_ha) ) 	
        else if (errp_shift_ha>0) then 
              errs_shift_ha = errp_shift_ha
        else
              errs_shift_ha = errm_shift_ha
        end if
        err_pr_shift_ha = errs_shift_ha/shift_ha_err
        !print *,'test ha shift', errs_shift_ha/shift_ha_err


	!! anorm_hanc
        errp_anorm_hanc =  anorm_hanc_max - anorm_hanc_err	
        errm_anorm_hanc = anorm_hanc_err - anorm_hanc_min
        if ( errp_anorm_hanc>0.and.errm_anorm_hanc>0) then
         errs_anorm_hanc = 0.5*( ((2*errp_anorm_hanc*errm_anorm_hanc)/
     *                   (errp_anorm_hanc+errm_anorm_hanc)) 
     *                   + sqrt(errp_anorm_hanc*errm_anorm_hanc) ) 	
        else if (errp_anorm_hanc>0.and.errm_anorm_hanc<=0) then 
           errs_anorm_hanc = errp_anorm_hanc
        else
           errs_anorm_hanc = errm_anorm_hanc
        end if
        err_pr_anorm_hanc = errs_anorm_hanc/anorm_hanc_err


	!! width_hanc
        errp_width_hanc =  width_hanc_max - width_hanc_err
        errm_width_hanc = width_hanc_err - width_hanc_min
        if ( errp_width_hanc>0.and.errm_width_hanc>0) then
          errs_width_hanc = 0.5*( ((2*errp_width_hanc*errm_width_hanc)/
     *                   (errp_width_hanc+errm_width_hanc)) 
     *                   + sqrt(errp_width_hanc*errm_width_hanc) ) 	
          !print *,'***** errs=sum'
        else if (errp_width_hanc>0.and.errm_width_hanc<=0) then 
           errs_width_hanc = errp_width_hanc
           !print *,'***** errs=errp'
        else 
           errs_width_hanc = errm_width_hanc
           !print *,'****** errs=errm'
        end if        
        err_pr_width_hanc = errs_width_hanc/width_hanc_err


	!! shift_hanc
        errp_shift_hanc =  shift_hanc_max - shift_hanc_err
        errm_shift_hanc = shift_hanc_err - shift_hanc_min
        if ( errp_shift_hanc>0.and.errm_shift_hanc>0) then
         errs_shift_hanc = 0.5*( ((2*errp_shift_hanc*errm_shift_hanc)/
     *                   (errp_shift_hanc+errm_shift_hanc)) 
     *                   + sqrt(errp_shift_hanc*errm_shift_hanc) ) 	
        else if (errp_shift_hanc>0) then 
              errs_shift_hanc = errp_shift_hanc
        else
              errs_shift_hanc = errm_shift_hanc
        end if
        err_pr_shift_hanc = errs_shift_hanc/shift_hanc_err


	!! anorm_s2a
        errp_anorm_s2a =  anorm_s2a_max - anorm_s2a_err	
        errm_anorm_s2a = anorm_s2a_err - anorm_s2a_min
        if ( errp_anorm_s2a>0.and.errm_anorm_s2a>0) then
         errs_anorm_s2a = 0.5*( ((2*errp_anorm_s2a*errm_anorm_s2a)/
     *                   (errp_anorm_s2a+errm_anorm_s2a)) 
     *                   + sqrt(errp_anorm_s2a*errm_anorm_s2a) ) 	
        else if (errp_anorm_s2a>0.and.errm_anorm_s2a<=0) then 
           errs_anorm_s2a = errp_anorm_s2a
        else
           errs_anorm_s2a = errm_anorm_s2a
        end if
        err_pr_anorm_s2a = errs_anorm_s2a/anorm_s2a_err


	!! anorm_s2b
        errp_anorm_s2b =  anorm_s2b_max - anorm_s2b_err	
        errm_anorm_s2b = anorm_s2b_err - anorm_s2b_min
        if ( errp_anorm_s2b>0.and.errm_anorm_s2b>0) then
         errs_anorm_s2b = 0.5*( ((2*errp_anorm_s2b*errm_anorm_s2b)/
     *                   (errp_anorm_s2b+errm_anorm_s2b)) 
     *                   + sqrt(errp_anorm_s2b*errm_anorm_s2b) ) 	
        else if (errp_anorm_s2b>0.and.errm_anorm_s2b<=0) then 
           errs_anorm_s2b = errp_anorm_s2b
        else
           errs_anorm_s2b = errm_anorm_s2b
        end if
        err_pr_anorm_s2b = errs_anorm_s2b/anorm_s2b_err


	!! anorm_o1a
        errp_anorm_o1a =  anorm_o1a_max - anorm_o1a_err	!10 
        errm_anorm_o1a = anorm_o1a_err - anorm_o1a_min
        if ( errp_anorm_o1a>0.and.errm_anorm_o1a>0) then
         errs_anorm_o1a = 0.5*( ((2*errp_anorm_o1a*errm_anorm_o1a)/
     *                   (errp_anorm_o1a+errm_anorm_o1a)) 
     *                   + sqrt(errp_anorm_o1a*errm_anorm_o1a) ) 	
        else if (errp_anorm_o1a>0.and.errm_anorm_o1a<=0) then 
           errs_anorm_o1a = errp_anorm_o1a
        else
           errs_anorm_o1a = errm_anorm_o1a
        end if
        err_pr_anorm_o1a = errs_anorm_o1a/anorm_o1a_err


	!! anorm_n2a
        errp_anorm_n2a =  anorm_n2a_max - anorm_n2a_err	!10 
        errm_anorm_n2a = anorm_n2a_err - anorm_n2a_min
        if ( errp_anorm_n2a>0.and.errm_anorm_n2a>0) then
         errs_anorm_n2a = 0.5*( ((2*errp_anorm_n2a*errm_anorm_n2a)/
     *                   (errp_anorm_n2a+errm_anorm_n2a)) 
     *                   + sqrt(errp_anorm_n2a*errm_anorm_n2a) ) 	
        else if (errp_anorm_n2a>0.and.errm_anorm_n2a<=0) then 
           errs_anorm_n2a = errp_anorm_n2a
        else
           errs_anorm_n2a = errm_anorm_n2a
        end if
        err_pr_anorm_n2a = errs_anorm_n2a/anorm_n2a_err


	!! anorm_niiii7892
        errp_anorm_niiii7892 =  anorm_niiii7892_max - anorm_
     *				fevii5160_err	
        errm_anorm_niiii7892 = anorm_niiii7892_err - anorm_niiii7892_min
        if ( errp_anorm_niiii7892>0.and.errm_anorm_niiii7892>0) then
         errs_anorm_niiii7892 = 0.5*( ((2*errp_anorm_niiii7892*errm_
     *			 anorm_fevii
     *			 5160)/
     *                   (errp_anorm_niiii7892+errm_anorm_niiii7892)) 
     *                   + sqrt(errp_anorm_niiii7892*errm_anorm_
     *			 fevii5160) ) 	
        else if (errp_anorm_niiii7892>0) then 
              errs_anorm_niiii7892 = errp_anorm_niiii7892
        else
              errs_anorm_niiii7892 = errm_anorm_niiii7892
        end if
        err_pr_anorm_niiii7892 = errs_anorm_niiii7892/anorm_niiii7892
     *				_err


	!! anorm_ariii7138
        errp_anorm_ariii7138 =  anorm_ariii7138_max - 
     *			        anorm_ariii7138_err
        errm_anorm_ariii7138 = anorm_ariii7138_err - anorm_ariii7138_min
        if ( errp_anorm_ariii7138>0.and.errm_anorm_ariii7138>0) then
         errs_anorm_ariii7138 = 0.5*( ((2*errp_anorm_ariii7138*
     *			  errm_anorm_ariii7138)/
     *                   (errp_anorm_ariii7138+errm_anorm_ariii7138)) 
     *                   + sqrt(errp_anorm_ariii7138*errm_
     *			 anorm_ariii7138)) 	
        else if (errp_anorm_ariii7138>0.and.errm_anorm_ariii7138<=0) 
     *	  then 
             errs_anorm_ariii7138 = errp_anorm_ariii7138
         else
           errs_anorm_ariii7138 = errm_anorm_ariii7138
        end if
        err_pr_anorm_ariii7138 = errs_anorm_ariii7138/
     *				anorm_ariii7138_err


	!! anorm_oii7321
        errp_anorm_oii7321 =  anorm_oii7321_max - anorm_
     *				fevii5160_err	
        errm_anorm_oii7321 = anorm_oii7321_err - anorm_oii7321_min
        if ( errp_anorm_oii7321>0.and.errm_anorm_oii7321>0) then
         errs_anorm_oii7321 = 0.5*( ((2*errp_anorm_oii7321*errm_
     *			 anorm_fevii
     *			 5160)/
     *                   (errp_anorm_oii7321+errm_anorm_oii7321)) 
     *                   + sqrt(errp_anorm_oii7321*errm_anorm_
     *			 fevii5160) ) 	
        else if (errp_anorm_oii7321>0) then 
              errs_anorm_oii7321 = errp_anorm_oii7321
        else
              errs_anorm_oii7321 = errm_anorm_oii7321
        end if
        err_pr_anorm_oii7321 = errs_anorm_oii7321/anorm_oii7321
     *				_err

	!! anorm_hb2
        errp_anorm_hb2 =  anorm_hb2_max - anorm_hb2_err		!45
        errm_anorm_hb2 = anorm_hb2_err - anorm_hb2_min
        if ( errp_anorm_hb2>0.and.errm_anorm_hb2>0) then
         errs_anorm_hb2 = 0.5*( ((2*errp_anorm_hb2*errm_anorm_hb2)/
     *                   (errp_anorm_hb2+errm_anorm_hb2)) 
     *                   + sqrt(errp_anorm_hb2*errm_anorm_hb2) ) 	
        else if (errp_anorm_hb2>0) then 
              errs_anorm_hb2 = errp_anorm_hb2
        else
              errs_anorm_hb2 = errm_anorm_hb2
        end if
        err_pr_anorm_hb2 = errs_anorm_hb2/anorm_hb2_err


	!! width_hb2
        errp_width_hb2 =  width_hb2_max - width_hb2_err 	
        errm_width_hb2 = width_hb2_err - width_hb2_min
        if ( errp_width_hb2>0.and.errm_width_hb2>0) then
         errs_width_hb2 = 0.5*( ((2*errp_width_hb2*errm_width_hb2)/
     *                   (errp_width_hb2+errm_width_hb2)) 
     *                   + sqrt(errp_width_hb2*errm_width_hb2) ) 	
        else if (errp_width_hb2>0) then 
              errs_width_hb2 = errp_width_hb2
        else
              errs_width_hb2 = errm_width_hb2
        end if
        err_pr_width_hb2 = errs_width_hb2/width_hb2_err


	!! shift_hb2
        errp_shift_hb2 =  shift_hb2_max - shift_hb2_err
        errm_shift_hb2 = shift_hb2_err - shift_hb2_min
        if ( errp_shift_hb2>0.and.errm_shift_hb2>0) then
         errs_shift_hb2 = 0.5*( ((2*errp_shift_hb2*errm_shift_hb2)/
     *                   (errp_shift_hb2+errm_shift_hb2)) 
     *                   + sqrt(errp_shift_hb2*errm_shift_hb2) ) 	
        else if (errp_shift_hb2>0) then 
              errs_shift_hb2 = errp_shift_hb2
        else
              errs_shift_hb2 = errm_shift_hb2
        end if
        err_pr_shift_hb2 = errs_shift_hb2/shift_hb2_err


	!! anorm_mg2a extra
        errp_anorm_mg2ae =  anorm_mg2ae_max - anorm_mg2ae_err	
        errm_anorm_mg2ae = anorm_mg2ae_err - anorm_mg2ae_min
        if ( errp_anorm_mg2ae>0.and.errm_anorm_mg2ae>0) then
         errs_anorm_mg2ae = 0.5*( ((2*errp_anorm_mg2ae*errm_
     *                   anorm_mg2ae)/(errp_anorm_mg2ae+errm_anorm_
     *			 mg2ae)) 
     *                   + sqrt(errp_anorm_mg2ae*errm_anorm_mg2ae)) 	
        else if (errp_anorm_mg2ae>0) then 
              errs_anorm_mg2ae = errp_anorm_mg2ae
        else
              errs_anorm_mg2ae = errm_anorm_mg2ae
        end if
        err_pr_anorm_mg2ae = errs_anorm_mg2ae/anorm_mg2ae_err


	!! width_mg2a extra
        errp_width_mg2ae =  width_mg2ae_max - width_mg2ae_err 	
        errm_width_mg2ae = width_mg2ae_err - width_mg2ae_min
        if ( errp_width_mg2ae>0.and.errm_width_mg2ae>0) then
         errs_width_mg2ae = 0.5*( ((2*errp_width_mg2ae*errm_width_
     *                   mg2ae)/(errp_width_mg2ae+errm_width_mg2ae)) 
     *                   + sqrt(errp_width_mg2ae*errm_width_mg2ae)) 	
        else if (errp_width_mg2ae>0) then 
              errs_width_mg2ae = errp_width_mg2ae
        else
              errs_width_mg2ae = errm_width_mg2ae
        end if
        err_pr_width_mg2ae = errs_width_mg2ae/width_mg2ae_err


	!! shift_hb2 extra
        errp_shift_mg2ae =  shift_mg2ae_max - shift_mg2ae_err
        errm_shift_mg2ae = shift_mg2ae_err - shift_mg2ae_min
        if ( errp_shift_mg2ae>0.and.errm_shift_mg2ae>0) then
         errs_shift_mg2ae = 0.5*( ((2*errp_shift_mg2ae*errm_shift_
     *                   mg2ae)/(errp_shift_mg2ae+errm_shift_mg2ae)) 
     *                   + sqrt(errp_shift_mg2ae*errm_shift_mg2ae)) 	
        else if (errp_shift_mg2ae>0) then 
              errs_shift_mg2ae = errp_shift_mg2ae
        else
              errs_shift_mg2ae = errm_shift_mg2ae
        end if
        err_pr_shift_mg2ae = errs_shift_mg2ae/shift_mg2ae_err


	!! anorm_o3a SB
        errp_anorm_o3asb =  anorm_o3asb_max - anorm_o3asb_err	
        errm_anorm_o3asb = anorm_o3asb_err - anorm_o3asb_min
        if ( errp_anorm_o3asb>0.and.errm_anorm_o3asb>0) then
         errs_anorm_o3asb = 0.5*( ((2*errp_anorm_o3asb*
     *			  errm_anorm_o3asb)/
     *                   (errp_anorm_o3asb+errm_anorm_o3asb)) 
     *                   + sqrt(errp_anorm_o3asb*errm_anorm_o3asb)) 	
        else if (errp_anorm_o3asb>0) then 
              errs_anorm_o3asb = errp_anorm_o3asb
        else
              errs_anorm_o3asb = errm_anorm_o3asb
        end if
        err_pr_anorm_o3asb = errs_anorm_o3asb/anorm_o3asb_err
        anorm_o3bsb_err = (1./3.)*anorm_o3asb_err
        errs_anorm_o3bsb = (1./3.)*errs_anorm_o3asb
	err_pr_anorm_o3bsb = (1./3.)*err_pr_anorm_o3asb 


	!! width_o3a SB
        errp_width_o3asb =  width_o3asb_max - width_o3asb_err
        errm_width_o3asb = width_o3asb_err - width_o3asb_min
        if ( errp_width_o3asb>0.and.errm_width_o3asb>0) then
         errs_width_o3asb = 0.5*( ((2*errp_width_o3asb*
     *			  errm_width_o3asb)/
     *                   (errp_width_o3asb+errm_width_o3asb)) 
     *                   + sqrt(errp_width_o3asb*errm_width_o3asb)) 	
        else if (errp_width_o3asb>0) then 
              errs_width_o3asb = errp_width_o3asb
        else
              errs_width_o3asb = errm_width_o3asb
        end if
        err_pr_width_o3asb = errs_width_o3asb/width_o3asb_err


	!! shift_o3a SB
        errp_shift_o3asb =  shift_o3asb_max - shift_o3asb_err
        errm_shift_o3asb = shift_o3asb_err - shift_o3asb_min
        if ( errp_shift_o3asb>0.and.errm_shift_o3asb>0) then
         errs_shift_o3asb = 0.5*( ((2*errp_shift_o3asb*
     *                   errm_shift_o3asb)/
     *			 (errp_shift_o3asb+errm_shift_o3asb)) 
     *                   + sqrt(errp_shift_o3asb*errm_shift_o3asb)) 	
        else if (errp_shift_o3asb>0) then 
              errs_shift_o3asb = errp_shift_o3asb
         else
              errs_shift_o3asb = errm_shift_o3asb
        end if
        err_pr_shift_o3asb = errs_shift_o3asb/shift_o3asb_err


	!! anorm_ha2 extra
        errp_anorm_ha2 =  anorm_ha2_max - anorm_ha2_err	!10 
        errm_anorm_ha2 = anorm_ha2_err - anorm_ha2_min
        if ( errp_anorm_ha2>0.and.errm_anorm_ha2>0) then
         errs_anorm_ha2 = 0.5*( ((2*errp_anorm_ha2*errm_anorm_ha2)/
     *                   (errp_anorm_ha2+errm_anorm_ha2)) 
     *                   + sqrt(errp_anorm_ha2*errm_anorm_ha2) ) 	
        else if (errp_anorm_ha2>0.and.errm_anorm_ha2<=0) then 
           errs_anorm_ha2 = errp_anorm_ha2
        else
           errs_anorm_ha2 = errm_anorm_ha2
        end if
        err_pr_anorm_ha2 = errs_anorm_ha2/anorm_ha2_err


	!! width_ha2 extra
        errp_width_ha2 =  width_ha2_max - width_ha2_err
        errm_width_ha2 = width_ha2_err - width_ha2_min
        if ( errp_width_ha2>0.and.errm_width_ha2>0) then
          errs_width_ha2 = 0.5*( ((2*errp_width_ha2*errm_width_ha2)/
     *                   (errp_width_ha2+errm_width_ha2)) 
     *                   + sqrt(errp_width_ha2*errm_width_ha2) ) 	
          !print *,'***** errs=sum'
        else if (errp_width_ha2>0.and.errm_width_ha2<=0) then 
           errs_width_ha2 = errp_width_ha2
           !print *,'***** errs=errp'
        else 
           errs_width_ha2 = errm_width_ha2
           !print *,'****** errs=errm'
        end if        
        err_pr_width_ha2 = errs_width_ha2/width_ha2_err


	!! shift_ha2 extra
        errp_shift_ha2 =  shift_ha2_max - shift_ha2_err
        errm_shift_ha2 = shift_ha2_err - shift_ha2_min
        if ( errp_shift_ha2>0.and.errm_shift_ha2>0) then
         errs_shift_ha2 = 0.5*( ((2*errp_shift_ha2*errm_shift_ha2)/
     *                   (errp_shift_ha2+errm_shift_ha2)) 
     *                   + sqrt(errp_shift_ha2*errm_shift_ha2) ) 	
        else if (errp_shift_ha2>0) then 
              errs_shift_ha2 = errp_shift_ha2
        else
              errs_shift_ha2 = errm_shift_ha2
        end if
        err_pr_shift_ha2 = errs_shift_ha2/shift_ha2_err


	!! anorm_s2a SB
        errp_anorm_s2asb =  anorm_s2asb_max - anorm_s2asb_err	!10 
        errm_anorm_s2asb = anorm_s2asb_err - anorm_s2asb_min
        if ( errp_anorm_s2asb>0.and.errm_anorm_s2asb>0) then
         errs_anorm_s2asb = 0.5*( ((2*errp_anorm_s2asb*
     *			  errm_anorm_s2asb)/
     *                   (errp_anorm_s2asb+errm_anorm_s2asb)) 
     *                   + sqrt(errp_anorm_s2asb*errm_anorm_s2asb)) 	
        else if (errp_anorm_s2asb>0.and.errm_anorm_s2asb<=0) then 
           errs_anorm_s2asb = errp_anorm_s2asb
        else
           errs_anorm_s2asb = errm_anorm_s2asb
        end if
        err_pr_anorm_s2asb = errs_anorm_s2asb/anorm_s2asb_err


	!! width_s2a SB
        errp_width_s2asb =  width_s2asb_max - width_s2asb_err
        errm_width_s2asb = width_s2asb_err - width_s2asb_min
        if ( errp_width_s2asb>0.and.errm_width_s2asb>0) then
          errs_width_s2asb = 0.5*( ((2*errp_width_s2asb*
     *			 errm_width_s2asb)/
     *                   (errp_width_s2asb+errm_width_s2asb)) 
     *                   + sqrt(errp_width_s2asb*errm_width_s2asb)) 	
          !print *,'***** errs=sum'
        else if (errp_width_s2asb>0.and.errm_width_s2asb<=0) then 
           errs_width_s2asb = errp_width_s2asb
           !print *,'***** errs=errp'
        else 
           errs_width_s2asb = errm_width_s2asb
           !print *,'****** errs=errm'
        end if        
        err_pr_width_s2asb = errs_width_s2asb/width_s2asb_err


	!! shift_s2a SB
        errp_shift_s2asb =  shift_s2asb_max - shift_s2asb_err
        errm_shift_s2asb = shift_s2asb_err - shift_s2asb_min
        if ( errp_shift_s2asb>0.and.errm_shift_s2asb>0) then
         errs_shift_s2asb = 0.5*( ((2*errp_shift_s2asb*
     *			  errm_shift_s2asb)/
     *                   (errp_shift_s2asb+errm_shift_s2asb)) 
     *                   + sqrt(errp_shift_s2asb*errm_shift_s2asb)) 	
        else if (errp_shift_s2asb>0) then 
              errs_shift_s2asb = errp_shift_s2asb
        else
              errs_shift_s2asb = errm_shift_s2asb
        end if
        err_pr_shift_s2asb = errs_shift_s2asb/shift_s2asb_err


	!! anorm_s2b SB
        errp_anorm_s2bsb =  anorm_s2bsb_max - anorm_s2bsb_err	!10 
        errm_anorm_s2bsb = anorm_s2bsb_err - anorm_s2bsb_min
        if ( errp_anorm_s2bsb>0.and.errm_anorm_s2bsb>0) then
         errs_anorm_s2bsb = 0.5*( ((2*errp_anorm_s2bsb*
     *			  errm_anorm_s2bsb)/
     *                   (errp_anorm_s2bsb+errm_anorm_s2bsb)) 
     *                   + sqrt(errp_anorm_s2bsb*errm_anorm_s2bsb)) 	
        else if (errp_anorm_s2bsb>0.and.errm_anorm_s2bsb<=0) then 
           errs_anorm_s2bsb = errp_anorm_s2bsb
        else
           errs_anorm_s2bsb = errm_anorm_s2bsb
        end if
        err_pr_anorm_s2bsb = errs_anorm_s2bsb/anorm_s2bsb_err





        !!! DEFINICION DEL SHIFT EN TERMINOS DE LONGITUD DE ONDA
       shiftw_hb_err=cen_hb*(1+shift_hb_err)
       shiftw_hdelta_err=cen_hdelta*(1+shift_hb_err)
       shiftw_hgamma_err=cen_hgamma*(1+shift_hb_err)
       shiftw_h8_err=cen_h8*(1+shift_hb_err)
       shiftw_hepsilon_err=cen_hepsilon*(1+shift_hb_err)
       shiftw_alii2669_err=cen_alii2669*(1+shift_hb_err)
       shiftw_cii2326_err=cen_cii2326*(1+shift_hb_err)

       shiftw_mg2a_err=cen_mg2a*(1+shift_mg2a_err)

       shiftw_oiii2672_err=cen_oiii2672*(1+shift_oiii2672_err)
       shiftw_oiii3133_err=cen_oiii3133*(1+shift_oiii2672_err)

       shiftw_heii4685_err=cen_heii4685*(1+shift_heii4685_err)
       shiftw_hei3188_err=cen_hei3188*(1+shift_heii4685_err)
       shiftw_hei3588_err=cen_hei3588*(1+shift_heii4685_err)
       shiftw_hei3889_err=cen_hei3889*(1+shift_heii4685_err)
       shiftw_hei5875_err=cen_hei5875*(1+shift_heii4685_err)
       shiftw_hei4472_err=cen_hei4472*(1+shift_heii4685_err)
       shiftw_hei7067_err=cen_hei7067*(1+shift_heii4685_err)

       shiftw_o3a_err=cen_o3a*(1+shift_o3a_err)
       shiftw_hbnc_err=cen_hb*(1+shift_o3a_err)
       shiftw_heii4685nc_err=cen_heii4685*(1+shift_o3a_err)
       shiftw_oiii4363_err=cen_oiii4363*(1+shift_o3a_err)
       shiftw_ni5200_err=cen_ni5200*(1+shift_o3a_err)
       shiftw_neiv2423_err=cen_neiv2423*(1+shift_o3a_err)
       shiftw_oii2471_err=cen_oii2471*(1+shift_o3a_err)
       shiftw_nev3346_err=cen_nev3346*(1+shift_o3a_err)
       shiftw_oii3728_err=cen_oii3728*(1+shift_o3a_err)
       shiftw_neiii3869_err=cen_neiii3869*(1+shift_o3a_err)
       shiftw_neiii3968_err=cen_neiii3968*(1+shift_o3a_err)
       shiftw_fev4072_err=cen_fev4072*(1+shift_o3a_err)
       shiftw_sii4073_err=cen_sii4073*(1+shift_o3a_err)
       shiftw_hgammanc_err=cen_hgamma*(1+shift_o3a_err)
       shiftw_hdeltanc_err=cen_hdelta*(1+shift_o3a_err)

       shiftw_nev3426_err=cen_nev3426*(1+shift_nev3426_err)
       shiftw_fevii3587_err=cen_fevii3587*(1+shift_nev3426_err)
       shiftw_fevii3759_err=cen_fevii3759*(1+shift_nev3426_err)

       shiftw_fevii5160_err=cen_fevii5160*(1+shift_fevii5160_err)
       shiftw_fevi5177_err=cen_fevi5177*(1+shift_fevii5160_err)
       shiftw_fexi7894_err=cen_fexi7894*(1+shift_fevii5160_err)
       shiftw_fevii6086_err=cen_fevii6086*(1+shift_fevii5160_err)

       shiftw_ha_err=cen_ha*(1+shift_ha_err)

       shiftw_hanc_err=cen_ha*(1+shift_hanc_err)
       shiftw_s2a_err=cen_s2a*(1+shift_hanc_err)
       shiftw_s2b_err=cen_s2b*(1+shift_hanc_err)
       shiftw_o1a_err=cen_o1a*(1+shift_hanc_err)
       shiftw_n2a_err=cen_n2a*(1+shift_hanc_err)
       shiftw_niiii7892_err=cen_niiii7892*(1+shift_hanc_err)
       shiftw_ariii7138_err=cen_ariii7138*(1+shift_hanc_err)
       shiftw_oii7321_err=cen_oii7321*(1+shift_hanc_err)

       shiftw_hb2_err=cen_hb*(1+shift_hb2_err)

       shiftw_mg2ae_err=cen_mg2a*(1+shift_mg2ae_err)

       shiftw_o3asb_err=cen_o3a*(1+shift_o3asb_err)

       shiftw_ha2_err=cen_ha*(1+shift_ha2_err)

       shiftw_hei4472_err=cen_hei4472*(1+shift_hei4472_err)

       shiftw_s2asb_err=cen_s2a*(1+shift_s2asb_err)

       shiftw_s2bsb_err=cen_s2b*(1+shift_s2asb_err)




        ! IMPRIMO EN PANTALLA LOS VALORES CENTRALES Y EL ERROR
	print *, 'f_pl',anorm_pl_err,errp_anorm_pl,errm_anorm_pl,
     *		   errs_anorm_pl,err_pr_anorm_pl
	print *, 'slope1',slope1_err,errp_slope1,
     *		   errm_slope1,errs_slope1,
     *		   err_pr_slope1
	print *, 'slope2',slope2_err,errp_slope2,
     *		   errm_slope2,errs_slope2,
     *		   err_pr_slope2
	print *, 'wave_break',wave_break_err,
     *		   errp_wave_break,errm_wave_break,
     *		   errs_wave_break,err_pr_wave_break
	print *, 'f_fe2_uv',anorm_Fe2t_err,errp_anorm_Fe2t,
     *		  errm_anorm_Fe2t,errs_anorm_Fe2t,err_pr_anorm_Fe2t
	print *, 'f_fe2_opt',anorm_Fe2t_opt_err,errp_anorm_Fe2t_opt,
     *		  errm_anorm_Fe2t_opt,errs_anorm_Fe2t_opt,
     *		  err_pr_anorm_Fe2t_opt
	print *, 'flux_balcont',anorm_balcont_err,errp_anorm_balcont,
     *		  errm_anorm_balcont,errs_anorm_balcont,
     *	 	  err_pr_anorm_balcont
	print *, 'flux_highbal',anorm_highbal_err,errp_anorm_highbal,
     *		  errm_anorm_highbal,errs_anorm_highbal,
     *		  err_pr_anorm_highbal
	print *, 'f_hb',anorm_hb_err,errp_anorm_hb,errm_anorm_hb,
     *		  errs_anorm_hb,err_pr_anorm_hb
	print *, 'w_hb',width_hb_err,errp_width_hb,errm_width_hb,
     *		  errs_width_hb,err_pr_width_hb
	print *, 's_hb',shift_hb_err,errp_shift_hb,errm_shift_hb,
     *		  errs_shift_hb,err_pr_shift_hb
	print *, 'sw_hb',shiftw_hb_err
	print *, 'f_hdelta',anorm_hdelta_err,errp_anorm_hdelta,
     *            errm_anorm_hdelta,errs_anorm_hdelta,
     *		  err_pr_anorm_hdelta 
	print *, 'f_hgamma',anorm_hgamma_err,errp_anorm_hgamma,
     *            errm_anorm_hgamma,errs_anorm_hgamma,
     *		  err_pr_anorm_hgamma
	print *, 'f_h8',anorm_h8_err,errp_anorm_h8,
     *            errm_anorm_h8,errs_anorm_h8,
     *		  err_pr_anorm_h8
	print *, 'f_hepsilon',anorm_hepsilon_err,errp_anorm_hepsilon,
     *            errm_anorm_hepsilon,errs_anorm_hepsilon
	print *, 'f_cii2326',anorm_cii2326_err,errp_anorm_cii2326,
     *		  errm_anorm_cii2326,errs_anorm_cii2326,err_pr_anorm_
     *		  cii2326
	print *, 'f_alii2669',anorm_alii2669_err,errp_anorm_alii2669,
     *		  errm_anorm_alii2669,errs_anorm_alii2669,err_pr_anorm_
     *		  alii2669
	print *, 'f_mg2a',anorm_mg2a_err,errp_anorm_mg2a,errm_anorm_mg2a,
     *		  errs_anorm_mg2a	,err_pr_anorm_mg2a
	print *, 'w_mg2a',width_mg2a_err,errp_width_mg2a,errm_width_mg2a,
     *		  errs_width_mg2a, err_pr_width_mg2a
	print *, 's_mg2a',shift_mg2a_err,errp_shift_mg2a,errm_shift_mg2a,
     *		  errs_shift_mg2a,err_pr_shift_mg2a
	print *, 'sw_mg2a',shiftw_mg2a_err
	print *, 'f_oiii2672',anorm_oiii2672_err,errp_anorm_oiii2672,
     *		  errm_anorm_oiii2672,errs_anorm_oiii2672,
     *		  err_pr_anorm_oiii2672
	print *, 'w_oiii2672',width_oiii2672_err,errp_width_oiii2672,
     *		  errm_width_oiii2672,errs_width_oiii2672,
     *		   err_pr_width_oiii2672
	print *, 's_oiii2672',shift_oiii2672_err,errp_shift_oiii2672,
     *		  errm_shift_oiii2672,errs_shift_oiii2672,
     *		  err_pr_shift_oiii2672
	print *, 'sw_oiii2672',shiftw_oiii2672_err
	print *, 'f_oiii3133',anorm_oiii3133_err,errp_anorm_oiii3133,
     *		  errm_anorm_oiii3133,errs_anorm_oiii3133,
     *		  err_pr_anorm_oiii3133
	print *, 'f_heii4685',anorm_heii4685_err,errp_anorm_heii4685,
     *		  errm_anorm_heii4685,errs_anorm_heii4685,err_pr_anorm
     *		  _heii4685
	print *, 'w_heii4685',width_heii4685_err,errp_width_heii4685,
     *		  errm_width_heii4685,errs_width_heii4685,
     *		  err_pr_width_heii4685
	print *, 's_heii4685',shift_heii4685_err,errp_shift_heii4685,
     *		   errm_shift_heii4685,errs_shift_heii4685,
     *		   err_pr_shift_heii4685
	print *, 'f_hei3188',anorm_hei3188_err,errp_anorm_hei3188,
     *		  errm_anorm_hei3188,errs_anorm_hei3188,err_pr_anorm
     *		  _hei3188
	print *, 'f_hei3588',anorm_hei3588_err,errp_anorm_hei3588,
     *		  errm_anorm_hei3588,errs_anorm_hei3588,err_pr_anorm
     *		  _hei3588
	print *, 'f_hei3889',anorm_hei3889_err,errp_anorm_hei3889,
     *		  errm_anorm_hei3889,errs_anorm_hei3889,err_pr_anorm
     *		  _hei3889
	print *, 'f_hei5875',anorm_hei5875_err,errp_anorm_hei5875,
     *		  errm_anorm_hei5875,errs_anorm_hei5875,err_pr_anorm
     *		  _hei5875
	print *, 'f_hei4472',anorm_hei4472_err,errp_anorm_hei4472,
     *		  errm_anorm_hei4472,errs_anorm_hei4472,err_pr_anorm
     *		  _hei4472
        print *, 'f_hei7067',anorm_hei7067_err,errp_anorm_hei7067,		
     *		     errm_anorm_hei7067,errs_anorm_hei7067,
     *		     err_pr_anorm_hei7067
	print *, 'f_o3a',anorm_o3a_err,errp_anorm_o3a,errm_anorm_o3a,
     *		  errs_anorm_o3a,err_pr_anorm_o3a
	print *, 'f_o3b',(1./3.)*anorm_o3a_err,(1./3.)*errp_anorm_o3a,
     *		  (1./3.)*errm_anorm_o3a,errs_anorm_o3b,err_pr_anorm
     *		   _o3b
	print *, 'w_o3a',width_o3a_err,errp_width_o3a,
     *		  errm_width_o3a,errs_width_o3a,err_pr_width_o3a
	print *, 's_o3a',shift_o3a_err,errp_shift_o3a,
     *		  errm_shift_o3a,errs_shift_o3a,err_pr_shift_o3a
	print *, 'sw_o3a',shiftw_o3a_err
	print *, 'f_hbnc',anorm_hbnc_err,errp_anorm_hbnc,
     *		  errm_anorm_hbnc,errs_anorm_hbnc,err_pr_anorm_hbnc
	print *, 'f_heii4685nc',anorm_heii4685nc_err,errp_anorm_
     *		  heii4685nc,errm_anorm_heii4685nc,
     *		  errs_anorm_heii4685nc,err_pr_anorm_heii4685nc
	print *, 'f_oiii4363',anorm_oiii4363_err,errp_anorm_oiii4363,
     *		  errm_anorm_oiii4363,errs_anorm_oiii4363,
     *		  err_pr_anorm_oiii4363
	print *, 'f_ni5200',anorm_ni5200_err,errp_anorm_ni5200,
     *		  errm_anorm_ni5200,errs_anorm_ni5200,err_pr_anorm_
     *		  ni5200
	print *, 'f_neiv2423',anorm_neiv2423_err,errp_anorm_neiv2423,
     *		  errm_anorm_neiv2423,errs_anorm_neiv2423,err_pr_anorm_
     *		  neiv2423
	print *, 'f_oii2471',anorm_oii2471_err,errp_anorm_oii2471,
     *		  errm_anorm_oii2471,errs_anorm_oii2471,err_pr_anorm_
     *		  oii2471
	print *, 'f_nev3346',anorm_nev3346_err,errp_anorm_nev3346,
     *		  errm_anorm_nev3346,errs_anorm_nev3346,err_pr_anorm_
     *		  nev3346
	print *, 'f_oii3728',anorm_oii3728_err,errp_anorm_oii3728,
     *		  errm_anorm_oii3728,errs_anorm_oii3728,err_pr_anorm_
     *		  oii3728
	print *, 'f_neiii3869',anorm_neiii3869_err,errp_anorm_neiii3869,
     *		  errm_anorm_neiii3869,errs_anorm_neiii3869,err_pr_anorm_
     *		  neiii3869
	print *, 'f_neiii3968',anorm_neiii3968_err,errp_anorm_neiii3968,
     *		  errm_anorm_neiii3968,errs_anorm_neiii3968,err_pr_anorm_
     *		  neiii3968
	print *, 'f_fev4072',anorm_fev4072_err,errp_anorm_fev4072,
     *		  errm_anorm_fev4072,errs_anorm_fev4072,err_pr_anorm_
     *		  fev4072
	print *, 'f_sii4073',anorm_sii4073_err,errp_anorm_sii4073,
     *		  errm_anorm_sii4073,errs_anorm_sii4073,err_pr_anorm_
     *		  sii4073
	print *, 'f_hdeltanc',anorm_hdeltanc_err,errp_anorm_hdeltanc,
     *            errm_anorm_hdeltanc,errs_anorm_hdeltanc,
     *		  err_pr_anorm_hdeltanc 
	print *, 'f_hgammanc',anorm_hgammanc_err,errp_anorm_hgammanc,
     *            errm_anorm_hgammanc,errs_anorm_hgammanc,
     *		  err_pr_anorm_hgammanc
	print *, 'f_nev3426',anorm_nev3426_err,errp_anorm_nev3426,
     *		  errm_anorm_nev3426,errs_anorm_nev3426,err_pr_anorm_
     *		  nev3426
	print *, 'w_nev3426',width_nev3426_err,errp_width_nev3426,
     *		  errm_width_nev3426,errs_width_nev3426,err_pr_width_
     *		  nev3426
	print *, 's_nev3426',shift_nev3426_err,errp_shift_nev3426,
     *		  errm_shift_nev3426,errs_shift_nev3426,err_pr_shift_
     *		  nev3426
	print *, 'f_fevii3587',anorm_fevii3587_err,errp_anorm_fevii3587,
     *		  errm_anorm_fevii3587,errs_anorm_fevii3587,err_pr_anorm_
     *		  fevii3587
	print *, 'f_fevii3759',anorm_fevii3759_err,errp_anorm_fevii3759,
     *		  errm_anorm_fevii3759,errs_anorm_fevii3759,err_pr_anorm_
     *		  fevii3759
	print *, 'f_fevii5160',anorm_fevii5160_err,errp_anorm_fevii5160,
     *		  errm_anorm_fevii5160,
     *		  errs_anorm_fevii5160	,err_pr_anorm_fevii5160
	print *, 'f_fevi5177',anorm_fevi5177_err,errp_anorm_fevi5177,
     *		  errm_anorm_fevi5177,
     *		  errs_anorm_fevi5177,err_pr_anorm_fevi5177
        print *, 'f_fexi7894',anorm_fexi7894_err,errp_anorm_fexi7894,		
     *		     errm_anorm_fexi7894,errs_anorm_fexi7894,
     *		     err_pr_anorm_fexi7894
        print *, 'f_fexi7894',anorm_fevii6086_err,errp_anorm_fevii6086,		
     *		     errm_anorm_fevii6086,errs_anorm_fevii6086,
     *		     err_pr_anorm_fevii6086
        print *, 'f_ha',anorm_ha_err,errp_anorm_ha,		
     *		     errm_anorm_ha,errs_anorm_ha,err_pr_anorm_ha
        print *, 'w_ha',width_ha_err,errp_width_ha,
     *               errm_width_ha,errs_width_ha,err_pr_width_ha
        print *, 's_ha', shift_ha_err,errp_shift_ha,
     *               errm_shift_ha,errs_shift_ha,err_pr_shift_ha
        print *, 'f_hanc',anorm_hanc_err,errp_anorm_hanc,		
     *		     errm_anorm_hanc,errs_anorm_hanc,err_pr_anorm_hanc
        print *, 'w_hanc',width_hanc_err,errp_width_hanc,
     *               errm_width_hanc,errs_width_hanc,err_pr_width_hanc
        print *, 's_hanc', shift_hanc_err,errp_shift_hanc,
     *               errm_shift_hanc,errs_shift_hanc,err_pr_shift_hanc
        print *, 'f_s2a',anorm_s2a_err,errp_anorm_s2a,		
     *		     errm_anorm_s2a,errs_anorm_s2a,err_pr_anorm_s2a
        print *, 'f_s2b',anorm_s2b_err,errp_anorm_s2b,		
     *		     errm_anorm_s2b,errs_anorm_s2b,err_pr_anorm_s2b
        print *, 'f_o1a',anorm_o1a_err,errp_anorm_o1a,		
     *		     errm_anorm_o1a,errs_anorm_o1a,err_pr_anorm_o1a
        print *, 'f_n2a',anorm_n2a_err,errp_anorm_n2a,		
     *		     errm_anorm_n2a,errs_anorm_n2a,err_pr_anorm_n2a
        print *, 'f_niiii7892',anorm_niiii7892_err,errp_anorm_niiii7892,		
     *		     errm_anorm_niiii7892,errs_anorm_niiii7892,
     *		     err_pr_anorm_niiii7892
        print *, 'f_ariii7138',anorm_ariii7138_err,errp_anorm_ariii7138,		
     *		     errm_anorm_ariii7138,errs_anorm_ariii7138,
     *		     err_pr_anorm_ariii7138
        print *, 'f_oii7321',anorm_oii7321_err,errp_anorm_oii7321,		
     *		     errm_anorm_oii7321,errs_anorm_oii7321,
     *		     err_pr_anorm_oii7321
	print *, 'f_hb2',anorm_hb2_err,errp_anorm_hb2,errm_anorm_hb2,
     *		  errs_anorm_hb2,err_pr_anorm_hb2
	print *, 'w_hb2',width_hb2_err,errp_width_hb2,errm_width_hb2,
     *		  errs_width_hb2, err_pr_width_hb2
	print *, 's_hb2',shift_hb2_err,errp_shift_hb2,errm_shift_hb2,
     *		  errs_shift_hb2,err_pr_shift_hb2
	print *, 'sw_hb2',shiftw_hb2_err
	print *, 'f_mg2ae',anorm_mg2ae_err,errp_anorm_mg2ae,errm_
     *		  anorm_mg2ae,errs_anorm_mg2ae,err_pr_anorm_mg2ae
	print *, 'w_mg2ae',width_mg2ae_err,errp_width_mg2ae,errm_
     *		  width_mg2ae,errs_width_mg2ae,err_pr_width_mg2ae
	print *, 's_mg2ae',shift_mg2ae_err,errp_shift_mg2ae,errm_
     *		  shift_mg2ae,errs_shift_mg2ae,err_pr_shift_mg2ae
	print *, 'sw_mg2ae',shiftw_mg2ae_err
	print *, 'f_o3asb',anorm_o3asb_err,errp_anorm_o3asb,
     *		  errm_anorm_o3asb,errs_anorm_o3asb,err_pr_anorm_o3asb
	print *, 'w_o3asb',width_o3asb_err,errp_width_o3asb,
     *		  errm_width_o3asb,errs_width_o3asb,err_pr_width_o3asb
	print *, 's_o3asb',shift_o3asb_err,errp_shift_o3asb,
     *		  errm_shift_o3asb,errs_shift_o3asb,err_pr_shift_o3asb
	print *, 'sw_o3asb',shiftw_o3asb_err
        print *, 'f_ha2',anorm_ha2_err,errp_anorm_ha2,		
     *		     errm_anorm_ha2,errs_anorm_ha2,err_pr_anorm_ha2
        print *, 'w_ha2',width_ha2_err,errp_width_ha2,
     *               errm_width_ha2,errs_width_ha2,err_pr_width_ha2
        print *, 's_ha2', shift_ha2_err,errp_shift_ha2,
     *               errm_shift_ha2,errs_shift_ha2,err_pr_shift_ha2
        print *, 'f_s2asb',anorm_s2asb_err,errp_anorm_s2asb,		
     *		     errm_anorm_s2asb,errs_anorm_s2asb,
     *		     err_pr_anorm_s2asb
        print *, 'w_s2asb',width_s2asb_err,errp_width_s2asb,
     *               errm_width_s2asb,errs_width_s2asb,
     *		     err_pr_width_s2asb
        print *, 's_s2asb', shift_s2asb_err,errp_shift_s2asb,
     *               errm_shift_s2asb,errs_shift_s2asb,
     *		     err_pr_shift_s2asb
        print *, 'f_s2bsb',anorm_s2bsb_err,errp_anorm_s2bsb,		
     *		     errm_anorm_s2bsb,errs_anorm_s2bsb,
     *		     err_pr_anorm_s2bsb
	print *, 'chi2',chi2_best_err,'- - - -'
	print *, 'chi2+conf_level',chi2_min,'- - - -'



      !  GUARDO DATOS EN ARCHIVO !
      open(unit=15,file=output_err,status='unknown')
         write(15,*) '#', obj_name
         write(15,*) '#Parameter  Value  err+  err-  err_sim  err_prop'
	 write(15,*) 'f_pl: ',anorm_pl_err,errp_anorm_pl,			
     *	 	      errm_anorm_pl,errs_anorm_pl,err_pr_anorm_pl         
	write(15,*)  'slope1',slope1_err,errp_slope1,
     *		   errm_slope1,errs_slope1,
     *		   err_pr_slope1
         write(15,*)  'slope2',slope2_err,errp_slope2,
     *		   errm_slope2,errs_slope2,
     *		   err_pr_slope2
         write(15,*)  'wave_break',wave_break_err,
     *		   errp_wave_break,errm_wave_break,
     *		   errs_wave_break,err_pr_wave_break
         write(15,*)  'f_fe2_uv',anorm_Fe2t_err,errp_anorm_Fe2t,
     *		  errm_anorm_Fe2t,errs_anorm_Fe2t,err_pr_anorm_Fe2t
         write(15,*)  'f_fe2_opt',anorm_Fe2t_opt_err,errp_anorm_
     *		 Fe2t_opt,errm_anorm_Fe2t_opt,errs_anorm_Fe2t_opt,
     *		  err_pr_anorm_Fe2t_opt
         write(15,*)  'flux_balcont',anorm_balcont_err,errp_anorm_
     *		  balcont,errm_anorm_balcont,errs_anorm_balcont,
     *	 	  err_pr_anorm_balcont
         write(15,*)  'flux_highbal',anorm_highbal_err,errp_anorm_
     *		  highbal,errm_anorm_highbal,errs_anorm_highbal,
     *		  err_pr_anorm_highbal
         write(15,*)  'f_hb',anorm_hb_err,errp_anorm_hb,errm_anorm_hb,
     *		  errs_anorm_hb,err_pr_anorm_hb
         write(15,*)  'w_hb',width_hb_err,errp_width_hb,errm_width_hb,
     *		  errs_width_hb,err_pr_width_hb
         write(15,*)  's_hb',shift_hb_err,errp_shift_hb,errm_shift_hb,
     *		  errs_shift_hb,err_pr_shift_hb
         write(15,*)  'sw_hb',shiftw_hb_err
         write(15,*)  'f_hdelta',anorm_hdelta_err,errp_anorm_hdelta,
     *            errm_anorm_hdelta,errs_anorm_hdelta,
     *		  err_pr_anorm_hdelta 
         write(15,*)  'f_hgamma',anorm_hgamma_err,errp_anorm_hgamma,
     *            errm_anorm_hgamma,errs_anorm_hgamma,
     *		  err_pr_anorm_hgamma
         write(15,*)  'f_h8',anorm_h8_err,errp_anorm_h8,
     *            errm_anorm_h8,errs_anorm_h8,
     *		  err_pr_anorm_h8
         write(15,*)  'f_hepsilon',anorm_hepsilon_err,errp_
     *            anorm_hepsilon,errm_anorm_hepsilon,errs_anorm_hepsilon
         write(15,*)  'f_cii2326',anorm_cii2326_err,errp_anorm_cii2326,
     *		  errm_anorm_cii2326,errs_anorm_cii2326,err_pr_anorm_
     *		  cii2326
         write(15,*)  'f_alii2669',anorm_alii2669_err,errp_anorm_
     *		  alii2669,errm_anorm_alii2669,errs_anorm_alii2669,
     *		  err_pr_anorm_alii2669
         write(15,*)  'f_mg2a',anorm_mg2a_err,errp_anorm_mg2a,errm_
     *		  anorm_mg2a,errs_anorm_mg2a,err_pr_anorm_mg2a
         write(15,*)  'w_mg2a',width_mg2a_err,errp_width_mg2a,errm_width
     *		  _mg2a,errs_width_mg2a, err_pr_width_mg2a
         write(15,*)  's_mg2a',shift_mg2a_err,errp_shift_mg2a,errm_
     *		  shift_mg2a,errs_shift_mg2a,err_pr_shift_mg2a
         write(15,*)  'sw_mg2a',shiftw_mg2a_err
         write(15,*)  'f_oiii2672',anorm_oiii2672_err,errp_anorm_
     *		  oiii2672,errm_anorm_oiii2672,errs_anorm_oiii2672,
     *		  err_pr_anorm_oiii2672
         write(15,*)  'w_oiii2672',width_oiii2672_err,errp_width_
     *		  oiii2672,errm_width_oiii2672,errs_width_oiii2672,
     *		   err_pr_width_oiii2672
         write(15,*)  's_oiii2672',shift_oiii2672_err,errp_shift_
     *		  oiii2672,errm_shift_oiii2672,errs_shift_oiii2672,
     *		  err_pr_shift_oiii2672
         write(15,*)  'sw_oiii2672',shiftw_oiii2672_err
         write(15,*)  'f_oiii3133',anorm_oiii3133_err,errp_anorm_
     *		  oiii3133,errm_anorm_oiii3133,errs_anorm_oiii3133,
     *		  err_pr_anorm_oiii3133
         write(15,*)  'f_heii4685',anorm_heii4685_err,errp_anorm_
     *		  heii4685,errm_anorm_heii4685,errs_anorm_heii4685,
     *		  err_pr_anorm_heii4685
         write(15,*)  'w_heii4685',width_heii4685_err,errp_width_
     *		  heii4685,errm_width_heii4685,errs_width_heii4685,
     *		  err_pr_width_heii4685
         write(15,*)  's_heii4685',shift_heii4685_err,errp_shift_
     *		   heii4685,errm_shift_heii4685,errs_shift_heii4685,
     *		   err_pr_shift_heii4685
         write(15,*)  'f_hei3188',anorm_hei3188_err,errp_anorm_hei3188,
     *		  errm_anorm_hei3188,errs_anorm_hei3188,err_pr_anorm
     *		  _hei3188
         write(15,*)  'f_hei3588',anorm_hei3588_err,errp_anorm_hei3588,
     *		  errm_anorm_hei3588,errs_anorm_hei3588,err_pr_anorm
     *		  _hei3588
         write(15,*)  'f_hei3889',anorm_hei3889_err,errp_anorm_hei3889,
     *		  errm_anorm_hei3889,errs_anorm_hei3889,err_pr_anorm
     *		  _hei3889
         write(15,*)  'f_hei5875',anorm_hei5875_err,errp_anorm_hei5875,
     *		  errm_anorm_hei5875,errs_anorm_hei5875,err_pr_anorm
     *		  _hei5875
         write(15,*)  'f_hei4472',anorm_hei4472_err,errp_anorm_hei4472,
     *		  errm_anorm_hei4472,errs_anorm_hei4472,err_pr_anorm
     *		  _hei4472
         write(15,*)  'f_hei7067',anorm_hei7067_err,errp_anorm_hei7067,		
     *		     errm_anorm_hei7067,errs_anorm_hei7067,
     *		     err_pr_anorm_hei7067
         write(15,*)  'f_o3a',anorm_o3a_err,errp_anorm_o3a,
     *		  errm_anorm_o3a,errs_anorm_o3a,err_pr_anorm_o3a
         write(15,*)  'f_o3b',(1./3.)*anorm_o3a_err,(1./3.)*errp_
     *		  anorm_o3a,(1./3.)*errm_anorm_o3a,errs_anorm_o3b,
     *		   err_pr_anorm_o3b
         write(15,*)  'w_o3a',width_o3a_err,errp_width_o3a,
     *		  errm_width_o3a,errs_width_o3a,err_pr_width_o3a
         write(15,*)  's_o3a',shift_o3a_err,errp_shift_o3a,
     *		  errm_shift_o3a,errs_shift_o3a,err_pr_shift_o3a
         write(15,*)  'sw_o3a',shiftw_o3a_err
         write(15,*)  'f_hbnc',anorm_hbnc_err,errp_anorm_hbnc,
     *		  errm_anorm_hbnc,errs_anorm_hbnc,err_pr_anorm_hbnc
         write(15,*)  'f_heii4685nc',anorm_heii4685nc_err,errp_anorm_
     *		  heii4685nc,errm_anorm_heii4685nc,
     *		  errs_anorm_heii4685nc,err_pr_anorm_heii4685nc
         write(15,*)  'f_oiii4363',anorm_oiii4363_err,errp_anorm_
     *		  oiii4363,errm_anorm_oiii4363,errs_anorm_oiii4363,
     *		  err_pr_anorm_oiii4363
         write(15,*)  'f_ni5200',anorm_ni5200_err,errp_anorm_ni5200,
     *		  errm_anorm_ni5200,errs_anorm_ni5200,err_pr_anorm_
     *		  ni5200
         write(15,*)  'f_neiv2423',anorm_neiv2423_err,errp_anorm_
     *		  neiv2423,errm_anorm_neiv2423,errs_anorm_neiv2423,
     *		  err_pr_anorm_neiv2423
         write(15,*)  'f_oii2471',anorm_oii2471_err,errp_anorm_oii2471,
     *		  errm_anorm_oii2471,errs_anorm_oii2471,err_pr_anorm_
     *		  oii2471
         write(15,*)  'f_nev3346',anorm_nev3346_err,errp_anorm_nev3346,
     *		  errm_anorm_nev3346,errs_anorm_nev3346,err_pr_anorm_
     *		  nev3346
         write(15,*)  'f_oii3728',anorm_oii3728_err,errp_anorm_oii3728,
     *		  errm_anorm_oii3728,errs_anorm_oii3728,err_pr_anorm_
     *		  oii3728
         write(15,*)  'f_neiii3869',anorm_neiii3869_err,errp_anorm_
     *		  neiii3869,errm_anorm_neiii3869,errs_anorm_neiii3869,
     *		  err_pr_anorm_neiii3869
         write(15,*)  'f_neiii3968',anorm_neiii3968_err,errp_anorm_
     *		  neiii3968,errm_anorm_neiii3968,errs_anorm_neiii3968,
     *		  err_pr_anorm_neiii3968
         write(15,*)  'f_fev4072',anorm_fev4072_err,errp_anorm_fev4072,
     *		  errm_anorm_fev4072,errs_anorm_fev4072,err_pr_anorm_
     *		  fev4072
         write(15,*)  'f_sii4073',anorm_sii4073_err,errp_anorm_sii4073,
     *		  errm_anorm_sii4073,errs_anorm_sii4073,err_pr_anorm_
     *		  sii4073
         write(15,*)  'f_hdeltanc',anorm_hdeltanc_err,
     *            errp_anorm_hdeltanc,errm_anorm_hdeltanc,
     *		  errs_anorm_hdeltanc,err_pr_anorm_hdeltanc 
         write(15,*)  'f_hgammanc',anorm_hgammanc_err,errp_anorm_
     *            hgammanc,errm_anorm_hgammanc,errs_anorm_hgammanc,
     *		  err_pr_anorm_hgammanc
         write(15,*)  'f_nev3426',anorm_nev3426_err,errp_anorm_nev3426,
     *		  errm_anorm_nev3426,errs_anorm_nev3426,err_pr_anorm_
     *		  nev3426
         write(15,*)  'w_nev3426',width_nev3426_err,errp_width_nev3426,
     *		  errm_width_nev3426,errs_width_nev3426,err_pr_width_
     *		  nev3426
         write(15,*)  's_nev3426',shift_nev3426_err,errp_shift_nev3426,
     *		  errm_shift_nev3426,errs_shift_nev3426,err_pr_shift_
     *		  nev3426
         write(15,*)  'f_fevii3587',anorm_fevii3587_err,errp_anorm_
     *		  fevii3587,errm_anorm_fevii3587,errs_anorm_fevii3587,
     *		  err_pr_anorm_fevii3587
         write(15,*)  'f_fevii3759',anorm_fevii3759_err,errp_anorm_
     *		  fevii3759,errm_anorm_fevii3759,errs_anorm_fevii3759,
     *		  err_pr_anorm_fevii3759
         write(15,*)  'f_fevii5160',anorm_fevii5160_err,errp_anorm_
     *		  fevii5160,errm_anorm_fevii5160,
     *		  errs_anorm_fevii5160	,err_pr_anorm_fevii5160
         write(15,*)  'f_fevi5177',anorm_fevi5177_err,errp_anorm_
     *		  fevi5177,errm_anorm_fevi5177,
     *		  errs_anorm_fevi5177,err_pr_anorm_fevi5177
         write(15,*)  'f_fexi7894',anorm_fexi7894_err,
     *		     errp_anorm_fexi7894,		
     *		     errm_anorm_fexi7894,errs_anorm_fexi7894,
     *		     err_pr_anorm_fexi7894
         write(15,*)  'f_fexi7894',anorm_fevii6086_err,
     *			errp_anorm_fevii6086,		
     *		     errm_anorm_fevii6086,errs_anorm_fevii6086,
     *		     err_pr_anorm_fevii6086
         write(15,*)  'f_ha',anorm_ha_err,errp_anorm_ha,		
     *		     errm_anorm_ha,errs_anorm_ha,err_pr_anorm_ha
         write(15,*)  'w_ha',width_ha_err,errp_width_ha,
     *               errm_width_ha,errs_width_ha,err_pr_width_ha
         write(15,*)  's_ha', shift_ha_err,errp_shift_ha,
     *               errm_shift_ha,errs_shift_ha,err_pr_shift_ha
         write(15,*)  'f_hanc',anorm_hanc_err,errp_anorm_hanc,		
     *		     errm_anorm_hanc,errs_anorm_hanc,err_pr_anorm_hanc
         write(15,*)  'w_hanc',width_hanc_err,errp_width_hanc,
     *               errm_width_hanc,errs_width_hanc,err_pr_width_hanc
         write(15,*)  's_hanc', shift_hanc_err,errp_shift_hanc,
     *               errm_shift_hanc,errs_shift_hanc,err_pr_shift_hanc
         write(15,*)  'f_s2a',anorm_s2a_err,errp_anorm_s2a,		
     *		     errm_anorm_s2a,errs_anorm_s2a,err_pr_anorm_s2a
         write(15,*)  'f_s2b',anorm_s2b_err,errp_anorm_s2b,		
     *		     errm_anorm_s2b,errs_anorm_s2b,err_pr_anorm_s2b
         write(15,*)  'f_o1a',anorm_o1a_err,errp_anorm_o1a,		
     *		     errm_anorm_o1a,errs_anorm_o1a,err_pr_anorm_o1a
         write(15,*)  'f_n2a',anorm_n2a_err,errp_anorm_n2a,		
     *		     errm_anorm_n2a,errs_anorm_n2a,err_pr_anorm_n2a
          write(15,*)  'f_niiii7892',anorm_niiii7892_err,
     *		    errp_anorm_niiii7892,		
     *		     errm_anorm_niiii7892,errs_anorm_niiii7892,
     *		     err_pr_anorm_niiii7892
         write(15,*)  'f_ariii7138',anorm_ariii7138_err,
     *		     errp_anorm_ariii7138,		
     *		     errm_anorm_ariii7138,errs_anorm_ariii7138,
     *		     err_pr_anorm_ariii7138
         write(15,*)  'f_oii7321',anorm_oii7321_err,errp_anorm_oii7321,		
     *		     errm_anorm_oii7321,errs_anorm_oii7321,
     *		     err_pr_anorm_oii7321
         write(15,*)  'f_hb2',anorm_hb2_err,errp_anorm_hb2,
     *		  errm_anorm_hb2,errs_anorm_hb2,err_pr_anorm_hb2
         write(15,*)  'w_hb2',width_hb2_err,errp_width_hb2,
     *		  errm_width_hb2,errs_width_hb2, err_pr_width_hb2
         write(15,*)  's_hb2',shift_hb2_err,errp_shift_hb2,
     *		  errm_shift_hb2,errs_shift_hb2,err_pr_shift_hb2
         write(15,*)  'sw_hb2',shiftw_hb2_err
         write(15,*)  'f_mg2ae',anorm_mg2ae_err,errp_anorm_mg2ae,errm_
     *		  anorm_mg2ae,errs_anorm_mg2ae,err_pr_anorm_mg2ae
         write(15,*)  'w_mg2ae',width_mg2ae_err,errp_width_mg2ae,errm_
     *		  width_mg2ae,errs_width_mg2ae,err_pr_width_mg2ae
         write(15,*)  's_mg2ae',shift_mg2ae_err,errp_shift_mg2ae,errm_
     *		  shift_mg2ae,errs_shift_mg2ae,err_pr_shift_mg2ae
         write(15,*)  'sw_mg2ae',shiftw_mg2ae_err
         write(15,*)  'f_o3asb',anorm_o3asb_err,errp_anorm_o3asb,
     *		  errm_anorm_o3asb,errs_anorm_o3asb,err_pr_anorm_o3asb
         write(15,*)  'w_o3asb',width_o3asb_err,errp_width_o3asb,
     *		  errm_width_o3asb,errs_width_o3asb,err_pr_width_o3asb
         write(15,*)  's_o3asb',shift_o3asb_err,errp_shift_o3asb,
     *		  errm_shift_o3asb,errs_shift_o3asb,err_pr_shift_o3asb
         write(15,*)  'sw_o3asb',shiftw_o3asb_err
         write(15,*)  'f_ha2',anorm_ha2_err,errp_anorm_ha2,		
     *		     errm_anorm_ha2,errs_anorm_ha2,err_pr_anorm_ha2
         write(15,*)  'w_ha2',width_ha2_err,errp_width_ha2,
     *               errm_width_ha2,errs_width_ha2,err_pr_width_ha2
         write(15,*)  's_ha2', shift_ha2_err,errp_shift_ha2,
     *               errm_shift_ha2,errs_shift_ha2,err_pr_shift_ha2
         write(15,*)  'f_s2asb',anorm_s2asb_err,errp_anorm_s2asb,		
     *		     errm_anorm_s2asb,errs_anorm_s2asb,
     *		     err_pr_anorm_s2asb
         write(15,*)  'w_s2asb',width_s2asb_err,errp_width_s2asb,
     *               errm_width_s2asb,errs_width_s2asb,
     *		     err_pr_width_s2asb
         write(15,*)  's_s2asb', shift_s2asb_err,errp_shift_s2asb,
     *               errm_shift_s2asb,errs_shift_s2asb,
     *		     err_pr_shift_s2asb
         write(15,*)  'f_s2bsb',anorm_s2bsb_err,errp_anorm_s2bsb,		
     *		     errm_anorm_s2bsb,errs_anorm_s2bsb,
     *		     err_pr_anorm_s2bsb
         write(15,*)  'chi2',chi2_best_err,'- - - -'
         write(15,*)  'chi2+conf_level',chi2_min,'- - - -'



      !  GUARDO DATOS EN ARCHIVO CSV FORMAT!
      !https://stackoverflow.com/questions/7130384/how-to-write-fortran-output-as-csv-file
c        matrix_csv=reshape(source=(/redshift,anorm_pl_err,errs_anorm_pl,
c     *err_pr_anorm_pl,anorm_Fe2t_err,errs_anorm_Fe2t,err_pr_anorm_Fe2t,
c     *anorm_hb_err,errs_anorm_
c     *hb,err_pr_anorm_hb,width_hb_err,errs_width_hb,err_pr_width_hb,shif
c     *t_hb_err,errs_shift_hb,err_pr_shift_hb,anorm_hdelta_err,errs_anorm
c     *_hdelta,err_pr_anorm_hdelta,anorm_hgamma_err,errs_anorm_hgamma,err
c     *_pr_anorm_hgamma,anorm_ha_err,errs_anorm_ha,err_pr_anorm_ha,width
c     *_ha_err,errs_width_ha,err_pr_width_ha,shift_ha_err,errs_shift_ha,e
c     *rr_pr_shift_ha,anorm_heii4685_err,errs_anorm_heii4685,err_pr_anorm
c     *_heii4685,width
c     *_heii4685_err,errs_width_heii4685,err_pr_width_heii4685,shift_heii
c     *4685_err,errs_shift_
c     *heii4685,err_pr_shift_heii4685,anorm_hei5875_err,errs_anorm_hei587
c     *5,err_pr_a
c     *norm_hei5875,width_hei5875_err,errs_width_hei5875,err_pr_width_hei
c     *5875,shift_hei5875_err,errs_shift_hei5875,err_pr_shift_hei5875,
c     *anorm_hbnc_
c     *err,errs_anorm_hbnc,err_pr_anorm_hbnc,width_hbnc_err,errs_width_hb
c     *nc,err_pr_width_hbnc,shift_hbnc_err,errs_shift_hbnc,err_pr_shift_h
c     *bnc,anorm_hdeltanc_err,errs_anorm_hdeltanc,err_pr_anorm_hdelta
c     *nc,anorm_hgammanc_err,errs_anorm_hgammanc,err_pr_anorm_hgammanc
c     *,anorm_hanc_err,errs_anorm_hanc,err_pr_anorm_hanc,
c     *anorm_s2a_err,errs_anorm_s2a,err_pr_anorm_s2a,anorm_s2b_err,
c     *errs_anorm_s2b,err_pr_anorm_s2
c     *b,anorm_o3a_err,errs_anorm_o3a,err_pr_anorm_o3a,
c     *anorm_o3b_err,errs_anorm_o3b,err_pr_anorm_o3b,anorm_o1a_err,
c     *errs_anorm_o1a,err_pr_anorm_o1a,anorm_o1b_err,errs_anorm_o1b,err_ 
c     *pr_anorm_o1b,anorm_n2a_err,errs_anorm_n2a,err_pr_anorm_n2a,anorm
c     *_n2b_err,errs_anorm_n2b,err_pr_anorm_n2b,anorm_ni5200_err,errs_
c     *anorm_ni5200,err_pr_anorm_ni5200,an
c     *orm_fevii6086_err,errs_anorm_fevii6086,err_pr_anorm_fevii6086,
c     *anorm_oiii4363_err,errs_anorm_oiii4363,err_pr_anorm_oiii4363
c     *,anorm_heii4685nc_err,errs_anorm_heii4685nc,err_pr_anorm_heii4685
c     *nc,
c     *anorm_hei5875nc_err,errs_anorm_hei5875nc,err_pr_anorm_hei5875nc,
c     *anorm_fevii5160_err,errs_anorm_fevii5160,err_pr_anorm_fevii5160
c     *,width_fevii5160_err,errs_width_fevii5160,err_pr_width_fevii5160
c     *,shift_fevii5160_err,errs_shift_fevii5160,err_pr_shift_fevii5160,
c     *anorm_fevi5177_err,errs_anorm_fevi5177,err_pr_anorm_fevi5177,
c     *width_fevi5177_err,
c     *errs_width_fevi5177,err_pr_width_fevi5177,
c     *shift_fevi5177_err,errs_shift_fevi5177,err_pr_shift_fevi5177,
c     *anorm_hb2_err,
c     *errs_anorm_hb2,err_pr_anorm_hb2,width_hb
c     *2_err,errs_width_hb2,err_pr_width_hb2,shift_hb2_err,
c     *errs_shift_hb2,err_pr_shift_hb2,anorm_ha2_err,errs_anorm_ha2,
c     *err_pr_anorm_ha2,width_ha2_err,errs_width_ha2,
c     *err_pr_width_ha2,shift_ha2_err,errs_shift_ha2,
c     *err_pr_shift_ha2,anorm_o3asb_err,errs_anorm_o3asb,err_pr_anorm_o3a
c     *sb,anorm_o3bsb_err,errs_anorm_o3bsb,err_pr_anorm_o3bsb
c     *,width_o3asb_err,errs_width_o3asb,
c     *err_pr_width_o3asb,shift_o3asb_err,errs_shift_o3asb,
c     *err_pr_shift_o3asb,anorm_s2asb_err,errs_anorm_s2asb,
c     *err_pr_anorm_s2asb,anorm_s2bsb_err,errs_anorm_s2bsb,err_pr_anorm 
c     *_s2bsb/),shape=(/1,175/))

c       nrow = size(matrix_csv,1)
 
c101    format(x, *(g0,","))


c       open(unit=10,access="sequential",action ="write",
c     *		status ="replace",file=output_err_csv,
c     *		form="formatted")

       !Etiquetas
c       write(10,*) 'redshift,f_pl,err_f_pl,errpr_f_pl,f_fe2,err_f_fe2,er
c     *rpr_f_fe2,f_hb,err_f_hb,errpr_f_hb,w_hb,e
c     *rr_w_hb,errpr_w_hb,s_hb,err_s_hb,errpr_s_hb,f_hdelta,err_f_hdelta,
c     *errpr_f_hdelta,f_hgamma,err_f_hgamma,errpr_f_hgamma,f_ha,err_f_ha,
c     *errpr_f_ha,w_ha,err_w_ha,errpr_w_ha,s_ha,err_s_ha,errpr_s_ha,f_
c     *heii4685
c     *,err_f_heii4685,errpr_f_heii4685,w_heii4685,err_w_heii4685,errpr_
c     *w_heii4685,s_heii4685,err_s_heii4685
c     *,errpr_s_heii4685,f_hei5875,err_f_hei5875,errpr_f_hei5875,w_
c     *hei5875,err
c     *_w_hei5875,errpr_w_hei5875,s_hei5875,err_s_hei5875,errpr_s_hei5875
c     *,f_hbnc,err_f_hbnc,errpr_f
c     *_hbnc,w_hbnc,err_w_hbnc,errpr_w_hbnc,s_hbnc,err_s_hbnc,errpr_s_hbn
c     *c,f_hanc,err_f_hanc,errpr_f_hanc,f_s2a,err_f_s
c     *2a,errpr_f_s2a,f_s2b,err_f_s2b,errpr_f_s2b,f_o3a,err_f_o3a,errpr_f
c     *_o3a,f_o3b,err_f_o3b,errpr_f_o3b,f_o1a,err_f_o1a,errpr_f_o1a,f_o1b
c     *,err_f_o1b,errpr_f_o1b,f_n2a,err_f_n2a,errpr_f_n2a,f_n2b,err_f_n2b
c     *,errpr_f_n2b,f_ni5200,err_f_ni5200e,errpr_f_ni5200,f_fev
c     *ii6086,err_f_fevii6086,errpr_f_fevii6086,f_oiii4363,err_f_oiii4363
c     *,errpr_f_oiii4363,errpr_f_heii4685
c     *nc,
c     *f_fevii5160,err_f_fevii5160,errpr_f_fevii5160,w_
c     *fevii5160,err_w_fevii5160,errpr_w_fe
c     *7,s_fevii5160,err_s_fevii5160,errpr_s_fevii5160,f_fevi5177,err_f_
c     *fevi5177,errpr_f_fevi5177,w_fevi5177,er
c     *r_w_fevi5177,errpr_w_fevi5177,s_fevi5177,err_s_fevi5177,errpr_s_
c     *fevi5177,f_hb2,err_f_hb2,er
c     *rpr_f_hb2,w_hb2,err_w_hb2,errpr_w_hb2,s_hb2,err_s_hb2,errpr_s_hb2,
c     *f_ha2,err_f_ha2,errpr_f_ha2,w_ha2,err_w_ha2,errpr_w_ha2,s_ha2,err_
c     *s_ha2,errpr_s_ha2,f_o3asb,err_f_o3asb,errpr_f_o3asb,f_o3bsb,err_f_
c     *o3bsb,errpr_f_o3bsb,w_o3asb,err_w_o3asb,errpr_w_o3asb,s_o3asb,err_
c     *s_o3asb,errpr_s_o3asb,f_s2asb,err_f_s2asb,errpr_f_s2asb,f_s2bsb,er
c     *r_f_s2bsb,errpr_f_s2bsb,' 
	!*** Agrego una , al final para que python no tenga problemas en leer los headers 
	!y tome el espacio que se genera después de la coma como una etiqueta ficticia (vacia)
	!*** Tomar en cuenta que fortran escribe el archivo resultante con un espacio
        !entonces en las etiquetas hay que considerar ese espacio. En este caso 
        !afecta a la etiqueta 'redshift', la cual en python se debe escribir con 
        !un espacio al inicio ' redshift'

c       do i_csv=1,1
c           write(10,101) matrix_csv(i_csv,:)
c       end do
c      close(10)

      return
      end subroutine error_mcmc








      subroutine fit_jed(anorm_pl,			!2
     *     slope1,slope2,wave_break,			!3,4,5
     *     anorm_Fe2t,					!6
     *     anorm_hb,width_hb,shift_hb,			!7,8,9
     *     anorm_hdelta,width_hdelta,shift_hdelta,	!10
     *     anorm_hgamma,width_hgamma,shift_hgamma, 	!11
     *     anorm_h8,width_h8,shift_h8, 			!12
     *     anorm_hepsilon,width_hepsilon,shift_hepsilon,!13 
     *     anorm_mg2a,width_mg2a,shift_mg2a,		!14,15,16
     *     anorm_oiii2672,width_oiii2672,shift_oiii2672,	!17,18,19
     *     anorm_oiii3133,width_oiii3133,shift_oiii3133,	!20
     *     anorm_heii4685,width_heii4685,shift_heii4685, 	!21,22,23
     *     anorm_hei3188,width_hei3188,shift_hei3188, 		!24
     *     anorm_hei3588,width_hei3588,shift_hei3588, 		!25
     *     anorm_hei3889,width_hei3889,shift_hei3889, 		!26
     *     anorm_hei5875,width_hei5875,shift_hei5875, 		!27
     *     anorm_o3a,width_o3a,shift_o3a,			!28,29,30
     *     anorm_hbnc,width_hbnc,shift_hbnc,			!31
     *     anorm_heii4685nc,width_heii4685nc,shift_heii4685nc,	!32
     *     anorm_fevii5160,width_fevii5160,shift_fevii5160,	!33,90,91
     *     anorm_fevi5177,width_fevi5177,shift_fevi5177,	!34
     *     anorm_oiii4363,width_oiii4363,shift_oiii4363,	!35
     *     anorm_ni5200,width_ni5200,shift_ni5200, 		!36
     *     anorm_cii2326 ,width_cii2326,shift_cii2326,		!37
     *     anorm_neiv2423,width_neiv2423,shift_neiv2423,	!38
     *     anorm_oii2471,width_oii2471,shift_oii2471,		!39
     *     anorm_alii2669,width_alii2669,shift_alii2669,	!40
     *     anorm_nev3346,width_nev3346,shift_nev3346,		!41
     *     anorm_nev3426,width_nev3426,shift_nev3426,		!42,43,44 CORONAL LINE
     *     anorm_fevii3587,width_fevii3587,shift_fevii3587,	!45
     *     anorm_oii3728,width_oii3728,shift_oii3728,		!46
     *     anorm_fevii3759,width_fevii3759,shift_fevii3759,	!47
     *     anorm_neiii3869,width_neiii3869,shift_neiii3869,	!48
     *     anorm_neiii3968,width_neiii3968,shift_neiii3968,	!49
     *     anorm_fev4072,width_fev4072,shift_fev4072,		!50
     *     anorm_sii4073,width_sii4073,shift_sii4073,		!51
     *     anorm_hb2,width_hb2,shift_hb2,			!52,53,54
     *     anorm_mg2ae,width_mg2ae,shift_mg2ae, 		!55,56,57
     *     anorm_o3asb,width_o3asb,shift_o3asb,			!58,59,60
     *     anorm_hdeltanc,width_hdeltanc,shift_hdeltanc,	!61
     *     anorm_hgammanc,width_hgammanc,shift_hgammanc,	!62
     *     anorm_hei4472,width_hei4472,shift_hei4472,		!63
     *     anorm_balcont,					!64
     *     anorm_highbal,					!65
     *     anorm_Fe2t_opt,					!66
     *	   anorm_ha,width_ha,shift_ha,				!67,68,69
     *     anorm_hanc,width_hanc,shift_hanc, 			!70,71,72
     *     anorm_s2a,width_s2a,shift_s2a, 			!73
     *     anorm_s2b,width_s2b,shift_s2b, 			!74
     *     anorm_o1a,width_o1a,shift_o1a, 			!75
     *     anorm_n2a,width_n2a,shift_n2a, 			!76
     *     anorm_ha2,width_ha2,shift_ha2, 			!77
     *     anorm_s2asb,width_s2asb,shift_s2asb,			!80
     *     anorm_s2bsb,width_s2bsb,shift_s2bsb,			!83
     *	   anorm_hei7067,width_hei7067,shift_hei7067,		!84
     *	   anorm_ariii7138,width_ariii7138,shift_ariii7138,	!85 
     *	   anorm_fexi7894,width_fexi7894,shift_fexi7894,	!86 
     *	   anorm_oii7321,width_oii7321,shift_oii7321,		!87 
     *	   anorm_niiii7892,width_niiii7892,shift_niiii7892,	!88
     *	   anorm_fevii6086,width_fevii6086,shift_fevii6086,	!89 
     *     chi2)						


       use params
       use one_spec
       implicit none

      real,intent(out) :: chi2
      !real,intent(out) :: chi2b
      !real,intent(out) :: chi2c
      real,intent(in) :: anorm_pl,slope1,slope2,wave_break
      real,intent(in) :: anorm_Fe2t
      real,intent(in) :: anorm_Fe2t_opt
      real,intent(in) :: anorm_hb,width_hb,shift_hb	
      real,intent(in) :: anorm_hdelta,width_hdelta,shift_hdelta
      real,intent(in) :: anorm_hgamma,width_hgamma,shift_hgamma
      real,intent(in) :: anorm_h8,width_h8,shift_h8
      real,intent(in) :: anorm_hepsilon,width_hepsilon
      real,intent(in) :: shift_hepsilon
      real,intent(in) :: anorm_mg2a,width_mg2a,shift_mg2a
      real,intent(in) :: anorm_oiii2672,width_oiii2672
      real,intent(in) :: shift_oiii2672
      real,intent(in) :: anorm_oiii3133,width_oiii3133
      real,intent(in) :: shift_oiii3133
      real,intent(in) :: anorm_heii4685,width_heii4685
      real,intent(in) :: shift_heii4685
      real,intent(in) :: anorm_hei3188,width_hei3188
      real,intent(in) :: shift_hei3188
      real,intent(in) :: anorm_hei3588,width_hei3588
      real,intent(in) :: shift_hei3588
      real,intent(in) :: anorm_hei3889,width_hei3889
      real,intent(in) :: shift_hei3889
      real,intent(in) :: anorm_hei5875,width_hei5875
      real,intent(in) :: shift_hei5875
      real,intent(in) :: anorm_o3a,width_o3a,shift_o3a
      real,intent(in) :: anorm_hbnc,width_hbnc,shift_hbnc
      real,intent(in) :: anorm_heii4685nc,width_heii4685nc
      real,intent(in) :: shift_heii4685nc
      real,intent(in) :: anorm_fevii5160,width_fevii5160,shift_fevii5160
      real,intent(in) :: anorm_fevi5177,width_fevi5177,shift_fevi5177
      real,intent(in) :: anorm_oiii4363,width_oiii4363
      real,intent(in) :: shift_oiii4363	
      real,intent(in) :: anorm_ni5200,width_ni5200,shift_ni5200
      real,intent(in) :: anorm_cii2326,width_cii2326
      real,intent(in) :: shift_cii2326
      real,intent(in) :: anorm_neiv2423,width_neiv2423
      real,intent(in) :: shift_neiv2423
      real,intent(in) :: anorm_oii2471,width_oii2471
      real,intent(in) :: shift_oii2471
      real,intent(in) :: anorm_alii2669,width_alii2669
      real,intent(in) :: shift_alii2669
      real,intent(in) :: anorm_nev3346,width_nev3346
      real,intent(in) :: shift_nev3346
      real,intent(in) :: anorm_nev3426,width_nev3426
      real,intent(in) :: shift_nev3426
      real,intent(in) :: anorm_fevii3587,width_fevii3587
      real,intent(in) :: shift_fevii3587
      real,intent(in) :: anorm_oii3728,width_oii3728
      real,intent(in) :: shift_oii3728
      real,intent(in) :: anorm_fevii3759,width_fevii3759
      real,intent(in) :: shift_fevii3759
      real,intent(in) :: anorm_neiii3869,width_neiii3869
      real,intent(in) :: shift_neiii3869
      real,intent(in) :: anorm_neiii3968,width_neiii3968
      real,intent(in) :: shift_neiii3968
      real,intent(in) :: anorm_fev4072,width_fev4072
      real,intent(in) :: shift_fev4072
      real,intent(in) :: anorm_sii4073,width_sii4073
      real,intent(in) :: shift_sii4073
      real,intent(in) :: anorm_hb2,width_hb2,shift_hb2
      real,intent(in) :: anorm_mg2ae,width_mg2ae,shift_mg2ae
      real,intent(in) :: anorm_o3asb,width_o3asb
      real,intent(in) :: shift_o3asb
      real,intent(in) :: anorm_hdeltanc,width_hdeltanc,shift_hdeltanc
      real,intent(in) :: anorm_hgammanc,width_hgammanc,shift_hgammanc
      real,intent(in) :: anorm_hei4472,width_hei4472
      real,intent(in) :: shift_hei4472
      real,intent(in) :: anorm_balcont, anorm_highbal
      real,intent(in) :: anorm_ha			
      real,intent(in) :: width_ha,shift_ha
      real,intent(in) :: anorm_hanc			
      real,intent(in) :: width_hanc,shift_hanc
      real,intent(in) :: anorm_ha2			
      real,intent(in) :: width_ha2,shift_ha2
      real,intent(in) :: anorm_s2a			
      real,intent(in) :: width_s2a,shift_s2a
      real,intent(in) :: anorm_s2b			
      real,intent(in) :: width_s2b,shift_s2b
      real,intent(in) :: anorm_o1a			
      real,intent(in) :: width_o1a,shift_o1a
      real,intent(in) :: anorm_n2a	
      real,intent(in) :: width_n2a,shift_n2a
      real,intent(in) :: anorm_s2asb			
      real,intent(in) :: width_s2asb,shift_s2asb
      real,intent(in) :: anorm_s2bsb		
      real,intent(in) :: width_s2bsb,shift_s2bsb
      real,intent(in) :: anorm_hei7067			
      real,intent(in) :: width_hei7067,shift_hei7067
      real,intent(in) :: anorm_ariii7138			
      real,intent(in) :: width_ariii7138,shift_ariii7138
      real,intent(in) :: anorm_fexi7894			
      real,intent(in) :: width_fexi7894,shift_fexi7894
      real,intent(in) :: anorm_oii7321			
      real,intent(in) :: width_oii7321,shift_oii7321
      real,intent(in) :: anorm_niiii7892		
      real,intent(in) :: width_niiii7892,shift_niiii7892
      real,intent(in) :: anorm_fevii6086		
      real,intent(in) :: width_fevii6086,shift_fevii6086

      real,dimension(91000) :: flux_model
      real :: val_line1,val_line2
      real :: bpl

      real :: gw_hb,gw_hdelta,gw_hgamma,gw_h8,gw_hepsilon 
      real :: gw_mg2a,gw_mg2b
      real :: gw_oiii2672,gw_oiii3133,gw_hei5875 
      real :: gw_hei3588,gw_hei3889
      real :: gw_o3a,gw_o3b
      real :: gw_heii4685,gw_hbnc,gw_hei3188
      real :: gw_hdeltanc,gw_hgammanc
      real :: gw_fevii5160,gw_fevi5177,gw_heii4685nc
      real :: gw_oiii4363,gw_ni5200,gw_cii2326
      real :: gw_neiv2423,gw_oii2471,gw_alii2669,gw_nev3346
      real :: gw_nev3426,gw_fevii3587,gw_oii3728
      real :: gw_fevii3759,gw_neiii3869,gw_neiii3968,gw_fev4072
      real :: gw_sii407
      real :: gw_hb2,gw_mg2ae,gw_mg2be
      real :: gw_o3asb,gw_o3bsb
      real :: gw_hei4472
      real :: gw_ha,gw_hanc,gw_ha2
      real :: gw_s2a,gw_s2b,gw_o1a,gw_n2a
      real :: gw_s2asb,gw_s2bsb
      real :: gw_hei7067, gw_ariii7138,gw_fexi7894
      real :: gw_oii7321,gw_niiii7892
      real :: gw_o1b, gw_n2b, gw_fevii6086


      integer :: j, jb
      real :: chi2_dof,vl
      real :: sum
      real :: vlb
      real :: sumb
      real :: sumc

      real :: cen_hb_shift,cen_hdelta_shift,cen_hgamma_shift
      real :: cen_h8_shift,cen_hepsilon_shift
      real :: cen_mg2a_shift, cen_mg2b_shift 
      real :: cen_oiii2672_shift, cen_oiii3133_shift 
      real :: cen_heii4685_shift,cen_hei5875_shift
      real :: cen_hei3588_shift,cen_hei3889_shift,cen_hei3188_shift
      real :: cen_o3a_shift,cen_o3b_shift,cen_hbnc_shift
      real :: cen_fevii5160_shift,cen_fevi5177_shift
      real :: cen_heii4685nc_shift
      real :: cen_oiii4363_shift,cen_ni5200_shift
      real :: cen_cii2326_shift,cen_neiv2423_shift,cen_oii2471_shift
      real :: cen_alii2669_shift,cen_nev3346_shift,cen_nev3426_shift
      real :: cen_fevii3587_shift,cen_oii3728_shift,cen_fevii3759_shift
      real :: cen_neiii3869_shift,cen_neiii3968_shift,cen_fev4072_shift
      real :: cen_sii4073_shift, gw_sii4073
      real :: cen_hb2_shift
      real :: cen_mg2ae_shift,cen_mg2be_shift
      real :: cen_o3asb_shift,cen_o3bsb_shift
      real :: cen_hdeltanc_shift,cen_hgammanc_shift
      real :: cen_hei4472_shift
      real :: cen_ha_shift,cen_hanc_shift,cen_ha2_shift
      real :: cen_s2a_shift,cen_s2b_shift,cen_o1a_shift
      real :: cen_n2a_shift,cen_s2asb_shift,cen_s2bsb_shift
      real :: cen_hei7067_shift,cen_ariii7138_shift,cen_fexi7894_shift
      real :: cen_oii7321_shift,cen_niiii7892_shift,cen_fevii6086_shift
      real :: cen_o1b_shift,cen_n2b_shift


       !DEFINICION DEL CENTRO CON EL SHIFT
        cen_hb_shift=cen_hb*(1+shift_hb)
        cen_hdelta_shift=cen_hdelta*(1+shift_hb)
        cen_hgamma_shift=cen_hgamma*(1+shift_hb)
        cen_hepsilon_shift=cen_hepsilon*(1+shift_hb)
        cen_h8_shift=cen_h8*(1+shift_hb)
        cen_alii2669_shift=cen_alii2669*(1+shift_hb)
        cen_cii2326_shift=cen_cii2326*(1+shift_hb)

        cen_mg2a_shift=cen_mg2a*(1+shift_mg2a)
        cen_mg2b_shift=cen_mg2b*(1+shift_mg2a)

        cen_oiii2672_shift=cen_oiii2672*(1+shift_oiii2672)
        cen_oiii3133_shift=cen_oiii3133*(1+shift_oiii2672)

        cen_heii4685_shift=cen_heii4685*(1+shift_heii4685)
        cen_hei3188_shift=cen_hei3188*(1+shift_heii4685)
        cen_hei3588_shift=cen_hei3588*(1+shift_heii4685)
        cen_hei3889_shift=cen_hei3889*(1+shift_heii4685)
        cen_hei5875_shift=cen_hei5875*(1+shift_heii4685)
        cen_hei4472_shift=cen_hei4472*(1+shift_heii4685)
        cen_hei7067_shift=cen_hei7067*(1+shift_heii4685)

        cen_o3a_shift=cen_o3a*(1+shift_o3a)
        cen_o3b_shift=cen_o3b*(1+shift_o3a)
        cen_hbnc_shift=cen_hb*(1+shift_o3a)
        cen_heii4685nc_shift=cen_heii4685*(1+shift_o3a)
        cen_oiii4363_shift=cen_oiii4363*(1+shift_o3a)
        cen_ni5200_shift=cen_ni5200*(1+shift_o3a)
        cen_neiv2423_shift=cen_neiv2423*(1+shift_o3a)
        cen_oii2471_shift=cen_oii2471*(1+shift_o3a)
        cen_nev3346_shift=cen_nev3346*(1+shift_o3a)
        cen_oii3728_shift=cen_oii3728*(1+shift_o3a)
        cen_neiii3869_shift=cen_neiii3869*(1+shift_o3a)
        cen_neiii3968_shift=cen_neiii3968*(1+shift_o3a)
        cen_fev4072_shift=cen_fev4072*(1+shift_o3a)
        cen_sii4073_shift=cen_sii4073*(1+shift_o3a)
        cen_hdeltanc_shift=cen_hdelta*(1+shift_o3a)
        cen_hgammanc_shift=cen_hgamma*(1+shift_o3a)

        cen_nev3426_shift=cen_nev3426*(1+shift_nev3426)
        cen_fevii3587_shift=cen_fevii3587*(1+shift_nev3426)
        cen_fevii3759_shift=cen_fevii3759*(1+shift_nev3426)

        cen_fevii5160_shift=cen_fevii5160*(1+shift_fevii5160)
        cen_fevi5177_shift=cen_fevi5177*(1+shift_fevii5160)
        cen_fexi7894_shift=cen_fexi7894*(1+shift_fevii5160)
        cen_fevii6086_shift=cen_fevii6086*(1+shift_fevii5160)

        cen_ha_shift=cen_ha*(1+shift_ha)

        cen_hanc_shift=cen_ha*(1+shift_hanc)
        cen_s2a_shift=cen_s2a*(1+shift_hanc)
        cen_s2b_shift=cen_s2a*(1+shift_hanc)
        cen_o1a_shift=cen_o1a*(1+shift_hanc)
        cen_o1b_shift=cen_o1b*(1+shift_hanc)
        cen_n2a_shift=cen_n2a*(1+shift_hanc)
        cen_n2b_shift=cen_n2b*(1+shift_hanc)
        cen_niiii7892_shift=cen_niiii7892*(1+shift_hanc)
        cen_ariii7138_shift=cen_ariii7138*(1+shift_hanc)
        cen_oii7321_shift=cen_oii7321*(1+shift_hanc)

        cen_hb2_shift=cen_hb*(1+shift_hb2)

        cen_mg2ae_shift=cen_mg2a*(1+shift_mg2ae)
        cen_mg2be_shift=cen_mg2b*(1+shift_mg2ae)

        cen_o3asb_shift=cen_o3a*(1+shift_o3asb)
        cen_o3bsb_shift=cen_o3b*(1+shift_o3asb)

        cen_ha2_shift=cen_ha*(1+shift_ha2)

        cen_s2asb_shift=cen_s2a*(1+shift_s2asb)
        cen_s2bsb_shift=cen_s2b*(1+shift_s2asb)




	!print *, 'cen_hb',cen_hbnc_shift,cen_hb
	!print *, 'cen_o3a',cen_o3a_shift,cen_o3a



	!DEFINICION DE LOS ANCHOS
        gw_hb = width_hb/c*cen_hb_shift
        gw_hdelta = width_hb/c*cen_hdelta_shift
        gw_hgamma = width_hb/c*cen_hgamma_shift
        gw_h8 = width_hb/c*cen_h8_shift
        gw_hepsilon = width_hb/c*cen_hepsilon_shift
        gw_alii2669 = width_hb/c*cen_alii2669_shift
        gw_cii2326 = width_hb/c*cen_cii2326_shift

        gw_mg2a = width_mg2a/c*cen_mg2a_shift
        gw_mg2b = width_mg2a/c*cen_mg2b_shift

        gw_oiii2672 = width_oiii2672/c*cen_oiii2672_shift
        gw_oiii3133 = width_oiii2672/c*cen_oiii3133_shift

        gw_heii4685 = width_heii4685/c*cen_heii4685_shift
        gw_hei3188 = width_heii4685/c*cen_hei3188_shift
        gw_hei3588 = width_heii4685/c*cen_hei3588_shift
        gw_hei3889 = width_heii4685/c*cen_hei3889_shift
        gw_hei5875 = width_heii4685/c*cen_hei5875_shift
        gw_hei4472 = width_heii4685/c*cen_hei4472_shift
        gw_hei7067 = width_heii4685/c*cen_hei7067_shift

        gw_o3a = width_o3a/c*cen_o3a_shift
        gw_o3b = width_o3a/c*cen_o3b_shift
        gw_hbnc = width_o3a/c*cen_hbnc_shift
        gw_heii4685nc = width_o3a/c*cen_heii4685nc_shift
        gw_oiii4363 = width_o3a/c*cen_oiii4363_shift
        gw_ni5200 = width_o3a/c*cen_ni5200_shift
        gw_neiv2423 = width_o3a/c*cen_neiv2423_shift
        gw_oii2471 = width_o3a/c*cen_oii2471_shift
        gw_nev3346 = width_o3a/c*cen_nev3346_shift
        gw_oii3728 = width_o3a/c*cen_oii3728_shift
        gw_neiii3869 = width_o3a/c*cen_neiii3869_shift
        gw_neiii3968 = width_o3a/c*cen_neiii3968_shift
        gw_fev4072 = width_o3a/c*cen_fev4072_shift
        gw_sii4073 = width_o3a/c*cen_sii4073_shift
        gw_hdeltanc = width_o3a/c*cen_hdelta_shift
        gw_hgammanc = width_o3a/c*cen_hgamma_shift

        gw_nev3426 = width_nev3426/c*cen_nev3426_shift
        gw_fevii3587 = width_nev3426/c*cen_fevii3587_shift
        gw_fevii3759 = width_nev3426/c*cen_fevii3759_shift
 
        gw_fevii5160 = width_fevii5160/c*cen_fevii5160_shift
        gw_fevi5177 = width_fevii5160/c*cen_fevi5177_shift
        gw_fexi7894 = width_fevii5160/c*cen_fexi7894_shift
        gw_fevii6086 = width_fevii5160/c*cen_fevii6086_shift

        gw_ha = width_ha/c*cen_ha_shift

        gw_hanc = width_hanc/c*cen_hanc_shift
        gw_ha2 = width_ha2/c*cen_ha2_shift
        gw_s2a = width_hanc/c*cen_s2a_shift
        gw_s2b = width_hanc/c*cen_s2b_shift
        gw_o1a = width_hanc/c*cen_o1a_shift
        gw_o1b = width_hanc/c*cen_o1b_shift
        gw_n2a = width_hanc/c*cen_n2a_shift
        gw_n2b = width_hanc/c*cen_n2b_shift
        gw_niiii7892 = width_hanc/c*cen_niiii7892_shift
        gw_ariii7138 = width_hanc/c*cen_ariii7138_shift
        gw_oii7321 = width_hanc/c*cen_oii7321_shift

        gw_hb2 = width_hb2/c*cen_hb2_shift

        gw_mg2ae = width_mg2ae/c*cen_mg2ae_shift
        gw_mg2be = width_mg2ae/c*cen_mg2be_shift

        gw_ha2 = width_ha2/c*cen_ha2_shift

        gw_o3asb = width_o3asb/c*cen_o3asb_shift
        gw_o3bsb = width_o3asb/c*cen_o3bsb_shift

        gw_s2asb = width_s2asb/c*cen_s2asb_shift
        gw_s2bsb = width_s2asb/c*cen_s2bsb_shift


c      print *, 'n2a_fitjed', anorm_n2a,ratio_n2,cen_n2a_shift,gw_hanc
c      print *, 'fexi_fitjed', anorm_fexi7894,cen_fexi7894_shift,
c     *				gw_heii4685


      do j=1,jmax
         vl = vlam(j)
         flux_model(j) = anorm_pl*bpl(vl,wave_break,slope1,slope2)+  !2,3,4,5
     *     anorm_Fe2t*flux_FeIIt(j)+					!6
     *     anorm_hb*val_line1(vl,cen_hb_shift,gw_hb)+			!7,8,9
     *     anorm_hdelta*val_line1(vl,cen_hdelta_shift,gw_hdelta)+	!10
     *     anorm_hgamma*val_line1(vl,cen_hgamma_shift,gw_hgamma)+	!11
     *     anorm_h8*val_line1(vl,cen_h8_shift,gw_h8)+			!12
     *     anorm_hepsilon*val_line1(vl,cen_hepsilon_shift,gw_hepsilon)+	!13
     *     anorm_mg2a*(ratio_mg2/(ratio_mg2+1))*
     *               val_line1(vl,cen_mg2a_shift,gw_mg2a)+		!14,15,16
     *     anorm_mg2a*(1/(ratio_mg2+1))*	
     *                val_line1(vl,cen_mg2b_shift,gw_mg2b)+
     *     anorm_oiii2672*val_line1(vl,cen_oiii2672_shift,gw_oiii2672)+	!17,18,19
     *     anorm_oiii3133*val_line1(vl,cen_oiii3133_shift,gw_oiii3133)+	!20
     *     anorm_heii4685*val_line1(vl,cen_heii4685_shift,gw_heii4685)+	!21,22,23
     *     anorm_hei3188*val_line1(vl,cen_hei3188_shift,gw_hei3188)+	!24
     *     anorm_hei3588*val_line1(vl,cen_hei3588_shift,gw_hei3588)+	!25
     *     anorm_hei3889*val_line1(vl,cen_hei3889_shift,gw_hei3889)+	!26
     *     anorm_hei5875*val_line1(vl,cen_hei5875_shift,gw_hei5875)+	!27
     *     anorm_o3a*(ratio_o3/(ratio_o3+1))*				!28,29,30
     *               val_line1(vl,cen_o3a_shift,gw_o3a)+	
     *     anorm_o3a*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3b_shift,gw_o3b)+
     *     anorm_hbnc*val_line1(vl,cen_hbnc_shift,gw_hbnc)+		!31
     *     anorm_heii4685nc*val_line1(vl,cen_heii4685nc_shift,		!32
     *			gw_heii4685nc)+				
     *     anorm_fevii5160*val_line1(vl,cen_fevii5160_shift,		!33		
     *	   gw_fevii5160)+
     *     anorm_fevi5177*val_line1(vl,cen_fevi5177_shift,gw_fevi5177)+	!34
     *     anorm_oiii4363*val_line1(vl,cen_oiii4363_shift,gw_oiii4363)+	!35
     *     anorm_ni5200*val_line1(vl,cen_ni5200_shift,gw_ni5200)+	!36
     *     anorm_cii2326*val_line1(vl,cen_cii2326_shift,gw_cii2326)+	!37
     *     anorm_neiv2423*val_line1(vl,cen_neiv2423_shift,gw_neiv2423)+	!38
     *     anorm_oii2471*val_line1(vl,cen_oii2471_shift,gw_oii2471)+	!39
     *     anorm_alii2669*val_line1(vl,cen_alii2669_shift,gw_alii2669)+	!40
     *     anorm_nev3346*val_line1(vl,cen_nev3346_shift,gw_nev3346)+	!41
     *     anorm_nev3426*val_line1(vl,cen_nev3426_shift,gw_nev3426)+	!42,43,44
     *     anorm_fevii3587*val_line1(vl,cen_fevii3587_shift,		!45
     *				     gw_fevii3587)+
     *     anorm_oii3728*val_line1(vl,cen_oii3728_shift,gw_oii3728)+	!46
     *     anorm_fevii3759*val_line1(vl,cen_fevii3759_shift,		!47
     *				gw_fevii3759)+	
     *     anorm_neiii3869*val_line1(vl,cen_neiii3869_shift,		!48
     *				gw_neiii3869)+
     *     anorm_neiii3968*val_line1(vl,cen_neiii3968_shift,		!49
     *				gw_neiii3968)+
     *     anorm_fev4072*val_line1(vl,cen_fev4072_shift,gw_fev4072)+	!50
     *     anorm_sii4073*val_line1(vl,cen_sii4073_shift,gw_sii4073)+	!51
     *     anorm_hb2*val_line1(vl,cen_hb2_shift,gw_hb2)+		!52,53,54
     *     anorm_mg2ae*(ratio_mg2/(ratio_mg2+1))*			!55,56,57
     *               val_line1(vl,cen_mg2ae_shift,gw_mg2ae)+
     *     anorm_mg2ae*(1/(ratio_mg2+1))*
     *                val_line1(vl,cen_mg2be_shift,gw_mg2be)+	
     *     anorm_o3asb*(ratio_o3/(ratio_o3+1))*				!58,59,60
     *			val_line1(vl,cen_o3asb_shift,gw_o3asb)+
     *     anorm_o3asb*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3bsb_shift,gw_o3bsb)+	
     *     anorm_hdeltanc*val_line1(vl,cen_hdeltanc_shift,gw_hdeltanc)+	!61
     *     anorm_hgammanc*val_line1(vl,cen_hgammanc_shift,gw_hgammanc)+	!62
     *     anorm_hei4472*val_line1(vl,cen_hei4472_shift,gw_hei4472)+	!63		
     *     anorm_balcont*flux_balcont(j)+				!64
     *     anorm_highbal*flux_highbal(j)+				!65
     *     anorm_Fe2t_opt*flux_FeIIt_opt(j)+				!66
     *     anorm_ha*val_line1(vl,cen_ha_shift,gw_ha)+			!67,68,69
     *     anorm_hanc*val_line1(vl,cen_hanc_shift,gw_hanc)+		!70,71,72
     *     anorm_s2a*val_line1(vl,cen_s2a_shift,gw_s2a)+		!73
     *     anorm_s2b*val_line1(vl,cen_s2b_shift,gw_s2b)+		!74
     *     anorm_o1a*(ratio_o1/(ratio_o1+1))*				!75
     *               val_line1(vl,cen_o1a_shift,gw_o1a)+	
     *     anorm_o1a*(1/(ratio_o1+1))*
     *                val_line1(vl,cen_o1b_shift,gw_o1b)+
     *     anorm_n2a*(ratio_n2/(ratio_n2+1))*				!76
     *               val_line1(vl,cen_n2a_shift,gw_n2a)+	
     *     anorm_n2a*(1/(ratio_n2+1))*
     *                val_line1(vl,cen_n2b_shift,gw_n2b)+
     *     anorm_ha2*val_line1(vl,cen_ha2_shift,gw_ha2)+		!77,78,79
     *     anorm_s2asb*val_line1(vl,cen_s2asb_shift,gw_s2asb)+		!80,81,82
     *     anorm_s2bsb*val_line1(vl,cen_s2bsb_shift,gw_s2bsb)+		!83
     *     anorm_hei7067*val_line1(vl,cen_hei7067_shift,gw_hei7067)+	!84
     *     anorm_ariii7138*val_line1(vl,cen_ariii7138_shift,
     *					gw_ariii7138)+  		!85
     *     anorm_fexi7894*val_line1(vl,cen_fexi7894_shift,gw_fexi7894)+  !86
     *     anorm_oii7321*val_line1(vl,cen_oii7321_shift,gw_oii7321)+       !87
     *     anorm_niiii7892*val_line1(vl,cen_niiii7892_shift,
     *				    gw_niiii7892)+ 			!88
     *     anorm_fevii6086*val_line1(vl,cen_fevii6086_shift,
     *				     gw_fevii6086)  !89



        !print *, 'flux_model', j, jmax, vl, flux_model(j),flux(j)
	!print *, 'flux_balcont', vlam(j),flux_balcont(j)
	!print *, 'check_o3a',cen_o3a_shift,anorm_o3a
	!print *, 'check_hb',cen_hbnc_shift,anorm_hbnc
        !print *, 'fe2_opt', j, jmax, vl, flux_FeIIt_opt(j)
      end do
c      stop

      goto 632

      open(unit=15,file=output_data,status='unknown')
      do j=1,jmax-1
          vl = vlam(j)
         write(15,*)vlam(j),flux(j),err_flux(j),
     *     flux_model(j),
     *	   anorm_pl*bpl(vl,wave_break,slope1,slope2),			!2,3,4,5		
     *     anorm_Fe2t*flux_FeIIt(j),					!6
     *     anorm_hb*val_line1(vl,cen_hb_shift,gw_hb),			!7,8,9
     *     anorm_hdelta*val_line1(vl,cen_hdelta_shift,gw_hdelta),	!10
     *     anorm_hgamma*val_line1(vl,cen_hgamma_shift,gw_hgamma),	!11
     *     anorm_h8*val_line1(vl,cen_h8_shift,gw_h8),			!12
     *     anorm_hepsilon*val_line1(vl,cen_hepsilon_shift,gw_hepsilon),	!13
     *     anorm_mg2a*(ratio_mg2/(ratio_mg2+1))*
     *               val_line1(vl,cen_mg2a_shift,gw_mg2a),		!14,15,16
     *     anorm_mg2a*(1/(ratio_mg2+1))*	
     *                val_line1(vl,cen_mg2b_shift,gw_mg2b),
     *     anorm_oiii2672*val_line1(vl,cen_oiii2672_shift,gw_oiii2672),	!17,18,19
     *     anorm_oiii3133*val_line1(vl,cen_oiii3133_shift,gw_oiii3133),	!20
     *     anorm_heii4685*val_line1(vl,cen_heii4685_shift,gw_heii4685),	!21,22,23
     *     anorm_hei3188*val_line1(vl,cen_hei3188_shift,gw_hei3188),	!24
     *     anorm_hei3588*val_line1(vl,cen_hei3588_shift,gw_hei3588),	!25
     *     anorm_hei3889*val_line1(vl,cen_hei3889_shift,gw_hei3889),	!26
     *     anorm_hei5875*val_line1(vl,cen_hei5875_shift,gw_hei5875),	!27
     *     anorm_o3a*(ratio_o3/(ratio_o3+1))*				!28,29,30
     *               val_line1(vl,cen_o3a_shift,gw_o3a),	
     *     anorm_o3a*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3b_shift,gw_o3b)+
     *     anorm_hbnc*val_line1(vl,cen_hbnc_shift,gw_hbnc),		!31
     *     anorm_heii4685nc*val_line1(vl,cen_heii4685nc_shift,		!32
     *			gw_heii4685nc),				
     *     anorm_fevii5160*val_line1(vl,cen_fevii5160_shift,		!33		
     *	   gw_fevii5160),
     *     anorm_fevi5177*val_line1(vl,cen_fevi5177_shift,gw_fevi5177),	!34
     *     anorm_oiii4363*val_line1(vl,cen_oiii4363_shift,gw_oiii4363),	!35
     *     anorm_ni5200*val_line1(vl,cen_ni5200_shift,gw_ni5200),	!36
     *     anorm_cii2326*val_line1(vl,cen_cii2326_shift,gw_cii2326),	!37
     *     anorm_neiv2423*val_line1(vl,cen_neiv2423_shift,gw_neiv2423),	!38
     *     anorm_oii2471*val_line1(vl,cen_oii2471_shift,gw_oii2471),	!39
     *     anorm_alii2669*val_line1(vl,cen_alii2669_shift,gw_alii2669),	!40
     *     anorm_nev3346*val_line1(vl,cen_nev3346_shift,gw_nev3346),	!41
     *     anorm_nev3426*val_line1(vl,cen_nev3426_shift,gw_nev3426),	!42,43,44
     *     anorm_fevii3587*val_line1(vl,cen_fevii3587_shift,		!45
     *				     gw_fevii3587),
     *     anorm_oii3728*val_line1(vl,cen_oii3728_shift,gw_oii3728),	!46
     *     anorm_fevii3759*val_line1(vl,cen_fevii3759_shift,		!47
     *				gw_fevii3759),	
     *     anorm_neiii3869*val_line1(vl,cen_neiii3869_shift,		!48
     *				gw_neiii3869),
     *     anorm_neiii3968*val_line1(vl,cen_neiii3968_shift,		!49
     *				gw_neiii3968),
     *     anorm_fev4072*val_line1(vl,cen_fev4072_shift,gw_fev4072),	!50
     *     anorm_sii4073*val_line1(vl,cen_sii4073_shift,gw_sii4073),	!51
     *     anorm_hb2*val_line1(vl,cen_hb2_shift,gw_hb2),		!52,53,54
     *     anorm_mg2ae*(ratio_mg2/(ratio_mg2+1))*			!55,56,57
     *               val_line1(vl,cen_mg2ae_shift,gw_mg2ae),
     *     anorm_mg2ae*(1/(ratio_mg2+1))*
     *                val_line1(vl,cen_mg2be_shift,gw_mg2be),	
     *     anorm_o3asb*(ratio_o3/(ratio_o3+1))*				!58,59,60
     *			val_line1(vl,cen_o3asb_shift,gw_o3asb),
     *     anorm_o3asb*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3bsb_shift,gw_o3bsb),	
     *     anorm_hdeltanc*val_line1(vl,cen_hdeltanc_shift,gw_hdeltanc),	!61
     *     anorm_hgammanc*val_line1(vl,cen_hgammanc_shift,gw_hgammanc),	!62
     *     anorm_hei4472*val_line1(vl,cen_hei4472_shift,gw_hei4472),	!63		
     *     anorm_balcont*flux_balcont(j),				!64
     *     anorm_highbal*flux_highbal(j),				!65
     *     anorm_Fe2t_opt*flux_FeIIt_opt(j)+				!66
     *     anorm_ha*val_line1(vl,cen_ha_shift,gw_ha),			!67,68,69
     *     anorm_hanc*val_line1(vl,cen_hanc_shift,gw_hanc),		!70,71,72
     *     anorm_s2a*val_line1(vl,cen_s2a_shift,gw_s2a),		!73
     *     anorm_s2b*val_line1(vl,cen_s2b_shift,gw_s2b),		!74
     *     anorm_o1a*(ratio_o1/(ratio_o1+1))*				!75
     *               val_line1(vl,cen_o1a_shift,gw_o1a),	
     *     anorm_o1a*(1/(ratio_o1+1))*
     *                val_line1(vl,cen_o1b_shift,gw_o1b),
     *     anorm_n2a*(ratio_n2/(ratio_n2+1))*				!76
     *               val_line1(vl,cen_n2a_shift,gw_n2a),	
     *     anorm_n2a*(1/(ratio_n2+1))*
     *                val_line1(vl,cen_n2b_shift,gw_n2b),
     *     anorm_ha2*val_line1(vl,cen_ha2_shift,gw_ha2),		!77,78,79
     *     anorm_s2asb*val_line1(vl,cen_s2asb_shift,gw_s2asb),		!80,81,82
     *     anorm_s2bsb*val_line1(vl,cen_s2bsb_shift,gw_s2bsb),		!83
     *     anorm_hei7067*val_line1(vl,cen_hei7067_shift,gw_hei7067),	!84
     *     anorm_ariii7138*val_line1(vl,cen_ariii7138_shift,
     *					gw_ariii7138), 			!85
     *     anorm_fexi7894*val_line1(vl,cen_fexi7894_shift,gw_fexi7894),  !86
     *     anorm_oii7321*val_line1(vl,cen_oii7321_shift,gw_oii7321),       !87
     *     anorm_niiii7892*val_line1(vl,cen_niiii7892_shift,
     *				    gw_niiii7892),			!88
     *     anorm_fevii6086*val_line1(vl,cen_fevii6086_shift,
     *				     gw_fevii6086)  !89
       end do
       close(15)

 632   continue

      sum = 0

        do j=1,jmax
           vl = vlam(j)
c         sum = sum+(flux(j)-flux_model(j))**2/(flux(j) + background(j))
c     *    *gain
           sum = sum+(flux(j)-flux_model(j))**2/
     *           (err_flux(j))**2 !denominador es el error
                 !(err_flux(j)*flux(j))**2     anajis: este era el original, pero está malo por eso lo cambie al de arriba
      !print *,'flux_model2', j,vl,flux(j), flux_model(j),sum,jmax
      end do

      chi2 = sum
      chi2_dof = sum/(jmax-par_free)

c      print *, 'fit_jed_chi2 = ', chi2, 'fit_jed_chi2/dof = ', chi2_dof,
c     *		 '  dof = ', jmax-par_free
c      stop

c      sumb = 0
c	do j=1,jmax
c         vlb = vlam(j)
c          if (vlb.ge.4600.and.vlb.le.5100) then
c           !print *, 'vlb', vlb
c           sumb = sumb+(flux(j)-flux_model(j))**2/
c     *           (err_flux(j))**2 !denominador es el error
c      !print *,'flux_model2', j,vl,flux(j), flux_model(j),sum,jmax
c          end if
c      end do
c      chi2b = sumb
c      chi2b_dof = sumb/(jmax-par_free)

c      sumc = 0
c	do j=1,jmax
c         vlb = vlam(j)
c          if (vlb.ge.6250.and.vlb.le.6800) then
c           !print *, 'vlb', vlb
c           sumc = sumc+(flux(j)-flux_model(j))**2/
c     *           (err_flux(j))**2 !denominador es el error
c      !print *,'flux_model2', j,vl,flux(j), flux_model(j),sum,jmax
c          end if
c      end do

c      chi2c = sumc
c      chi2c_dof = sumc/(jmax-par_free)
      !print*,'chi2_blend', chi2b


      !!!!  VERIFICACION DE VALORES
c      print *, 'hb_fitjed:', anorm_hb,width_hb,shift_hb
c      print *, 'hgamma_fitjed:', anorm_hgamma,width_hgamma
c     *			,shift_hgamma

      return
      end subroutine fit_jed





      subroutine fit_jed_rys(anorm_pl,				!2     
     *     slope1,slope2,wave_break,  		!3,4,5
     *     anorm_Fe2t,				!6
     *     anorm_hb,width_hb,shift_hb,		!7,8,9
     *     anorm_hdelta,width_hdelta,shift_hdelta,	!10
     *     anorm_hgamma,width_hgamma,shift_hgamma, 	!11
     *     anorm_h8,width_h8,shift_h8, 			!12
     *     anorm_hepsilon,width_hepsilon,shift_hepsilon,!13 
     *     anorm_mg2a,width_mg2a,shift_mg2a,		!14,15,16
     *     anorm_oiii2672,width_oiii2672,shift_oiii2672,	!17,18,19
     *     anorm_oiii3133,width_oiii3133,shift_oiii3133,	!20
     *     anorm_heii4685,width_heii4685,shift_heii4685, 	!21,22,23
     *     anorm_hei3188,width_hei3188,shift_hei3188, 		!24
     *     anorm_hei3588,width_hei3588,shift_hei3588, 		!25
     *     anorm_hei3889,width_hei3889,shift_hei3889, 		!26
     *     anorm_hei5875,width_hei5875,shift_hei5875, 		!27
     *     anorm_o3a,width_o3a,shift_o3a,			!28,29,30
     *     anorm_hbnc,width_hbnc,shift_hbnc,			!31
     *     anorm_heii4685nc,width_heii4685nc,shift_heii4685nc,	!32
     *     anorm_fevii5160,width_fevii5160,shift_fevii5160,	!33,90,91
     *     anorm_fevi5177,width_fevi5177,shift_fevi5177,	!34
     *     anorm_oiii4363,width_oiii4363,shift_oiii4363,	!35
     *     anorm_ni5200,width_ni5200,shift_ni5200, 		!36
     *     anorm_cii2326 ,width_cii2326,shift_cii2326,		!37
     *     anorm_neiv2423,width_neiv2423,shift_neiv2423,	!38
     *     anorm_oii2471,width_oii2471,shift_oii2471,		!39
     *     anorm_alii2669,width_alii2669,shift_alii2669,	!40
     *     anorm_nev3346,width_nev3346,shift_nev3346,		!41
     *     anorm_nev3426,width_nev3426,shift_nev3426,		!42,43,44 CORONAL LINE
     *     anorm_fevii3587,width_fevii3587,shift_fevii3587,	!45
     *     anorm_oii3728,width_oii3728,shift_oii3728,		!46
     *     anorm_fevii3759,width_fevii3759,shift_fevii3759,	!47
     *     anorm_neiii3869,width_neiii3869,shift_neiii3869,	!48
     *     anorm_neiii3968,width_neiii3968,shift_neiii3968,	!49
     *     anorm_fev4072,width_fev4072,shift_fev4072,		!50
     *     anorm_sii4073,width_sii4073,shift_sii4073,		!51
     *     anorm_hb2,width_hb2,shift_hb2,			!52,53,54
     *     anorm_mg2ae,width_mg2ae,shift_mg2ae, 		!55,56,57
     *     anorm_o3asb,width_o3asb,shift_o3asb,			!58,59,60
     *     anorm_hdeltanc,width_hdeltanc,shift_hdeltanc,	!61
     *     anorm_hgammanc,width_hgammanc,shift_hgammanc,	!62
     *     anorm_hei4472,width_hei4472,shift_hei4472,		!63
     *     anorm_balcont,					!64
     *     anorm_highbal,					!65
     *     anorm_Fe2t_opt,					!66
     *	   anorm_ha,width_ha,shift_ha,				!67,68,69
     *     anorm_hanc,width_hanc,shift_hanc, 			!70,71,72
     *     anorm_s2a,width_s2a,shift_s2a, 			!73
     *     anorm_s2b,width_s2b,shift_s2b, 			!74
     *     anorm_o1a,width_o1a,shift_o1a, 			!75
     *     anorm_n2a,width_n2a,shift_n2a, 			!76
     *     anorm_ha2,width_ha2,shift_ha2, 			!77
     *     anorm_s2asb,width_s2asb,shift_s2asb,			!80
     *     anorm_s2bsb,width_s2bsb,shift_s2bsb,			!83
     *	   anorm_hei7067,width_hei7067,shift_hei7067,		!84
     *	   anorm_ariii7138,width_ariii7138,shift_ariii7138,	!85 
     *	   anorm_fexi7894,width_fexi7894,shift_fexi7894,	!86 
     *	   anorm_oii7321,width_oii7321,shift_oii7321,		!87 
     *	   anorm_niiii7892,width_niiii7892,shift_niiii7892,	!88
     *	   anorm_fevii6086,width_fevii6086,shift_fevii6086,	!89 
     *     chi2)	



c     model:  power law + FeII + line
       use params
       use one_spec
       implicit none

      real,intent(out) :: chi2
      !real,intent(out) :: chi2b
      !real,intent(out) :: chi2c
      real,intent(in) :: anorm_pl,slope1,slope2,wave_break
      real,intent(in) :: anorm_Fe2t
      real,intent(in) :: anorm_Fe2t_opt
      real,intent(in) :: anorm_hb,width_hb,shift_hb	
      real,intent(in) :: anorm_hdelta,width_hdelta,shift_hdelta	
      real,intent(in) :: anorm_hgamma,width_hgamma
      real,intent(in) :: shift_hgamma
      real,intent(in) :: anorm_h8,width_h8,shift_h8
      real,intent(in) :: anorm_hepsilon,width_hepsilon
      real,intent(in) :: shift_hepsilon
      real,intent(in) :: anorm_mg2a,width_mg2a,shift_mg2a
      real,intent(in) :: anorm_oiii2672,width_oiii2672
      real,intent(in) :: shift_oiii2672
      real,intent(in) :: anorm_oiii3133,width_oiii3133
      real,intent(in) :: shift_oiii3133
      real,intent(in) :: anorm_heii4685,width_heii4685
      real,intent(in) :: shift_heii4685
      real,intent(in) :: anorm_hei3188,width_hei3188
      real,intent(in) :: shift_hei3188
      real,intent(in) :: anorm_hei3588,width_hei3588
      real,intent(in) :: shift_hei3588
      real,intent(in) :: anorm_hei3889,width_hei3889
      real,intent(in) :: shift_hei3889
      real,intent(in) :: anorm_hei5875,width_hei5875
      real,intent(in) :: shift_hei5875
      real,intent(in) :: anorm_o3a,width_o3a,shift_o3a
      real,intent(in) :: anorm_hbnc,width_hbnc,shift_hbnc
      real,intent(in) :: anorm_heii4685nc,width_heii4685nc
      real,intent(in) :: shift_heii4685nc
      real,intent(in) :: anorm_fevii5160,width_fevii5160,shift_fevii5160
      real,intent(in) :: anorm_fevi5177,width_fevi5177,shift_fevi5177
      real,intent(in) :: anorm_oiii4363,width_oiii4363
      real,intent(in) :: shift_oiii4363		
      real,intent(in) :: anorm_ni5200,width_ni5200,shift_ni5200
      real,intent(in) :: anorm_cii2326,width_cii2326
      real,intent(in) :: shift_cii2326
      real,intent(in) :: anorm_neiv2423,width_neiv2423
      real,intent(in) :: shift_neiv2423
      real,intent(in) :: anorm_oii2471,width_oii2471
      real,intent(in) :: shift_oii2471
      real,intent(in) :: anorm_alii2669,width_alii2669
      real,intent(in) :: shift_alii2669
      real,intent(in) :: anorm_nev3346,width_nev3346
      real,intent(in) :: shift_nev3346
      real,intent(in) :: anorm_nev3426,width_nev3426
      real,intent(in) :: shift_nev3426
      real,intent(in) :: anorm_fevii3587,width_fevii3587
      real,intent(in) :: shift_fevii3587
      real,intent(in) :: anorm_oii3728,width_oii3728
      real,intent(in) :: shift_oii3728
      real,intent(in) :: anorm_fevii3759,width_fevii3759
      real,intent(in) :: shift_fevii3759
      real,intent(in) :: anorm_neiii3869,width_neiii3869
      real,intent(in) :: shift_neiii3869
      real,intent(in) :: anorm_neiii3968,width_neiii3968
      real,intent(in) :: shift_neiii3968
      real,intent(in) :: anorm_fev4072,width_fev4072
      real,intent(in) :: shift_fev4072
      real,intent(in) :: anorm_sii4073,width_sii4073
      real,intent(in) :: shift_sii4073
      real,intent(in) :: anorm_hb2,width_hb2,shift_hb2
      real,intent(in) :: anorm_mg2ae,width_mg2ae,shift_mg2ae
      real,intent(in) :: anorm_o3asb,width_o3asb
      real,intent(in) :: shift_o3asb
      real,intent(in) :: anorm_hdeltanc,width_hdeltanc,shift_hdeltanc	
      real,intent(in) :: anorm_hgammanc,width_hgammanc
      real,intent(in) :: shift_hgammanc
      real,intent(in) :: anorm_hei4472,width_hei4472
      real,intent(in) :: shift_hei4472
      real,intent(in) :: anorm_balcont,anorm_highbal
      real,intent(in) :: anorm_ha,width_ha,shift_ha
      real,intent(in) :: anorm_hanc			
      real,intent(in) :: width_hanc,shift_hanc
      real,intent(in) :: anorm_ha2			
      real,intent(in) :: width_ha2,shift_ha2
      real,intent(in) :: anorm_s2a			
      real,intent(in) :: width_s2a,shift_s2a
      real,intent(in) :: anorm_s2b			
      real,intent(in) :: width_s2b,shift_s2b
      real,intent(in) :: anorm_o1a			
      real,intent(in) :: width_o1a,shift_o1a
      real,intent(in) :: anorm_n2a	
      real,intent(in) :: width_n2a,shift_n2a
      real,intent(in) :: anorm_s2asb			
      real,intent(in) :: width_s2asb,shift_s2asb
      real,intent(in) :: anorm_s2bsb		
      real,intent(in) :: width_s2bsb,shift_s2bsb
      real,intent(in) :: anorm_hei7067			
      real,intent(in) :: width_hei7067,shift_hei7067
      real,intent(in) :: anorm_ariii7138			
      real,intent(in) :: width_ariii7138,shift_ariii7138
      real,intent(in) :: anorm_fexi7894			
      real,intent(in) :: width_fexi7894,shift_fexi7894
      real,intent(in) :: anorm_oii7321			
      real,intent(in) :: width_oii7321,shift_oii7321
      real,intent(in) :: anorm_niiii7892		
      real,intent(in) :: width_niiii7892,shift_niiii7892
      real,intent(in) :: anorm_fevii6086,width_fevii6086
      real,intent(in) :: shift_fevii6086




      real,dimension(91000) :: flux_model
      real :: val_line1,val_line2
      real :: bpl

      real :: gw_hb,gw_hdelta,gw_hgamma,gw_h8,gw_hepsilon 
      real :: gw_mg2a,gw_mg2b
      real :: gw_oiii2672,gw_oiii3133,gw_hei5875 
      real :: gw_hei3588,gw_hei3889
      real :: gw_o3a,gw_o3b,gw_o1b
      real :: gw_heii4685,gw_hbnc,gw_hei3188
      real :: gw_hdeltanc,gw_hgammanc
      real :: gw_fevii5160,gw_fevi5177,gw_heii4685nc
      real :: gw_oiii4363,gw_ni5200,gw_cii2326
      real :: gw_neiv2423,gw_oii2471,gw_alii2669,gw_nev3346
      real :: gw_nev3426,gw_fevii3587,gw_oii3728
      real :: gw_fevii3759,gw_neiii3869,gw_neiii3968,gw_fev4072
      real :: gw_sii407
      real :: gw_hb2,gw_mg2ae,gw_mg2be
      real :: gw_o3asb,gw_o3bsb
      real :: gw_hei4472
      real :: gw_ha,gw_hanc,gw_ha2
      real :: gw_s2a,gw_s2b,o1a,n2a
      real :: gw_s2asb, gw_s2bsb,hei7067
      real :: gw_ariii7138,gw_fexi7894,gw_oii7321,gw_niiii7892
      real :: gw_hei7067,gw_n2a,gw_o1a,ge_fevii6086,gw_n2b
      real :: gw_fevii6086


      integer :: j, jb
      real :: chi2_dof,vl
      real :: sum
      real :: vlb
      real :: sumb
      real :: sumc

      real :: cen_hb_shift,cen_hdelta_shift,cen_hgamma_shift
      real :: cen_h8_shift,cen_hepsilon_shift
      real :: cen_mg2a_shift, cen_mg2b_shift 
      real :: cen_oiii2672_shift, cen_oiii3133_shift 
      real :: cen_heii4685_shift,cen_hei5875_shift
      real :: cen_hei3588_shift,cen_hei3889_shift,cen_hei3188_shift
      real :: cen_o3a_shift,cen_o3b_shift,cen_hbnc_shift
      real :: cen_fevii5160_shift,cen_fevi5177_shift
      real :: cen_heii4685nc_shift
      real :: cen_oiii4363_shift,cen_ni5200_shift
      real :: cen_cii2326_shift,cen_neiv2423_shift,cen_oii2471_shift
      real :: cen_alii2669_shift,cen_nev3346_shift,cen_nev3426_shift
      real :: cen_fevii3587_shift,cen_oii3728_shift,cen_fevii3759_shift
      real :: cen_neiii3869_shift,cen_neiii3968_shift,cen_fev4072_shift
      real :: cen_sii4073_shift, gw_sii4073
      real :: cen_hb2_shift
      real :: cen_mg2ae_shift,cen_mg2be_shift
      real :: cen_o3asb_shift,cen_o3bsb_shift
      real :: cen_hdeltanc_shift,cen_hgammanc_shift
      real :: cen_hei4472_shift
      real :: cen_ha_shift,cen_hanc_shift,cen_ha2_shift
      real :: cen_s2a_shift,cen_s2b_shift,cen_o1a_shift
      real :: cen_n2a_shift,cen_s2asb_shift,cen_s2bsb_shift
      real :: cen_hei7067_shift, cen_ariii7138_shift
      real :: cen_fexi7894_shift,cen_oii7321_shift,cen_niiii7892_shift
      real :: cen_fevii6086_shift, cen_n2b_shift,cen_o1b_shift


        !DEFINICION DEL CENTRO CON EL SHIFT
       !DEFINICION DEL CENTRO CON EL SHIFT
        cen_hb_shift=cen_hb*(1+shift_hb)
        cen_hdelta_shift=cen_hdelta*(1+shift_hb)
        cen_hgamma_shift=cen_hgamma*(1+shift_hb)
        cen_hepsilon_shift=cen_hepsilon*(1+shift_hb)
        cen_h8_shift=cen_h8*(1+shift_hb)
        cen_alii2669_shift=cen_alii2669*(1+shift_hb)
        cen_cii2326_shift=cen_cii2326*(1+shift_hb)

        cen_mg2a_shift=cen_mg2a*(1+shift_mg2a)
        cen_mg2b_shift=cen_mg2b*(1+shift_mg2a)

        cen_oiii2672_shift=cen_oiii2672*(1+shift_oiii2672)
        cen_oiii3133_shift=cen_oiii3133*(1+shift_oiii2672)

        cen_heii4685_shift=cen_heii4685*(1+shift_heii4685)
        cen_hei3188_shift=cen_hei3188*(1+shift_heii4685)
        cen_hei3588_shift=cen_hei3588*(1+shift_heii4685)
        cen_hei3889_shift=cen_hei3889*(1+shift_heii4685)
        cen_hei5875_shift=cen_hei5875*(1+shift_heii4685)
        cen_hei4472_shift=cen_hei4472*(1+shift_heii4685)
        cen_hei7067_shift=cen_hei7067*(1+shift_heii4685)

        cen_o3a_shift=cen_o3a*(1+shift_o3a)
        cen_o3b_shift=cen_o3b*(1+shift_o3a)
        cen_hbnc_shift=cen_hb*(1+shift_o3a)
        cen_heii4685nc_shift=cen_heii4685*(1+shift_o3a)
        cen_oiii4363_shift=cen_oiii4363*(1+shift_o3a)
        cen_ni5200_shift=cen_ni5200*(1+shift_o3a)
        cen_neiv2423_shift=cen_neiv2423*(1+shift_o3a)
        cen_oii2471_shift=cen_oii2471*(1+shift_o3a)
        cen_nev3346_shift=cen_nev3346*(1+shift_o3a)
        cen_oii3728_shift=cen_oii3728*(1+shift_o3a)
        cen_neiii3869_shift=cen_neiii3869*(1+shift_o3a)
        cen_neiii3968_shift=cen_neiii3968*(1+shift_o3a)
        cen_fev4072_shift=cen_fev4072*(1+shift_o3a)
        cen_sii4073_shift=cen_sii4073*(1+shift_o3a)
        cen_hdeltanc_shift=cen_hdelta*(1+shift_o3a)
        cen_hgammanc_shift=cen_hgamma*(1+shift_o3a)

        cen_nev3426_shift=cen_nev3426*(1+shift_nev3426)
        cen_fevii3587_shift=cen_fevii3587*(1+shift_nev3426)
        cen_fevii3759_shift=cen_fevii3759*(1+shift_nev3426)

        cen_fevii5160_shift=cen_fevii5160*(1+shift_fevii5160)
        cen_fevi5177_shift=cen_fevi5177*(1+shift_fevii5160)
        cen_fexi7894_shift=cen_fexi7894*(1+shift_fevii5160)
        cen_fevii6086_shift=cen_fevii6086*(1+shift_fevii5160)

        cen_ha_shift=cen_ha*(1+shift_ha)

        cen_hanc_shift=cen_ha*(1+shift_hanc)
        cen_s2a_shift=cen_s2a*(1+shift_hanc)
        cen_s2b_shift=cen_s2a*(1+shift_hanc)
        cen_o1a_shift=cen_o1a*(1+shift_hanc)
        cen_o1b_shift=cen_o1b*(1+shift_hanc)
        cen_n2a_shift=cen_n2a*(1+shift_hanc)
        cen_n2b_shift=cen_n2b*(1+shift_hanc)
        cen_niiii7892_shift=cen_niiii7892*(1+shift_hanc)
        cen_ariii7138_shift=cen_ariii7138*(1+shift_hanc)
        cen_oii7321_shift=cen_oii7321*(1+shift_hanc)

        cen_hb2_shift=cen_hb*(1+shift_hb2)

        cen_mg2ae_shift=cen_mg2a*(1+shift_mg2ae)
        cen_mg2be_shift=cen_mg2b*(1+shift_mg2ae)

        cen_o3asb_shift=cen_o3a*(1+shift_o3asb)
        cen_o3bsb_shift=cen_o3b*(1+shift_o3asb)

        cen_ha2_shift=cen_ha*(1+shift_ha2)

        cen_s2asb_shift=cen_s2a*(1+shift_s2asb)
        cen_s2bsb_shift=cen_s2b*(1+shift_s2asb)


	!DEFINICION DE LOS ANCHOS
        gw_hb = width_hb/c*cen_hb_shift
        gw_hdelta = width_hb/c*cen_hdelta_shift
        gw_hgamma = width_hb/c*cen_hgamma_shift
        gw_h8 = width_hb/c*cen_h8_shift
        gw_hepsilon = width_hb/c*cen_hepsilon_shift
        gw_alii2669 = width_hb/c*cen_alii2669_shift
        gw_cii2326 = width_hb/c*cen_cii2326_shift

        gw_mg2a = width_mg2a/c*cen_mg2a_shift
        gw_mg2b = width_mg2a/c*cen_mg2b_shift

        gw_oiii2672 = width_oiii2672/c*cen_oiii2672_shift
        gw_oiii3133 = width_oiii2672/c*cen_oiii3133_shift

        gw_heii4685 = width_heii4685/c*cen_heii4685_shift
        gw_hei3188 = width_heii4685/c*cen_hei3188_shift
        gw_hei3588 = width_heii4685/c*cen_hei3588_shift
        gw_hei3889 = width_heii4685/c*cen_hei3889_shift
        gw_hei5875 = width_heii4685/c*cen_hei5875_shift
        gw_hei4472 = width_heii4685/c*cen_hei4472_shift
        gw_hei7067 = width_heii4685/c*cen_hei7067_shift

        gw_o3a = width_o3a/c*cen_o3a_shift
        gw_o3b = width_o3a/c*cen_o3b_shift
        gw_hbnc = width_o3a/c*cen_hbnc_shift
        gw_heii4685nc = width_o3a/c*cen_heii4685nc_shift
        gw_oiii4363 = width_o3a/c*cen_oiii4363_shift
        gw_ni5200 = width_o3a/c*cen_ni5200_shift
        gw_neiv2423 = width_o3a/c*cen_neiv2423_shift
        gw_oii2471 = width_o3a/c*cen_oii2471_shift
        gw_nev3346 = width_o3a/c*cen_nev3346_shift
        gw_oii3728 = width_o3a/c*cen_oii3728_shift
        gw_neiii3869 = width_o3a/c*cen_neiii3869_shift
        gw_neiii3968 = width_o3a/c*cen_neiii3968_shift
        gw_fev4072 = width_o3a/c*cen_fev4072_shift
        gw_sii4073 = width_o3a/c*cen_sii4073_shift
        gw_hdeltanc = width_o3a/c*cen_hdelta_shift
        gw_hgammanc = width_o3a/c*cen_hgamma_shift

        gw_nev3426 = width_nev3426/c*cen_nev3426_shift
        gw_fevii3587 = width_nev3426/c*cen_fevii3587_shift
        gw_fevii3759 = width_nev3426/c*cen_fevii3759_shift
 
        gw_fevii5160 = width_fevii5160/c*cen_fevii5160_shift
        gw_fevi5177 = width_fevii5160/c*cen_fevi5177_shift
        gw_fexi7894 = width_fevii5160/c*cen_fexi7894_shift
        gw_fevii6086 = width_fevii5160/c*cen_fevii6086_shift

        gw_ha = width_ha/c*cen_ha_shift

        gw_hanc = width_hanc/c*cen_hanc_shift
        gw_ha2 = width_ha2/c*cen_ha2_shift
        gw_s2a = width_hanc/c*cen_s2a_shift
        gw_s2b = width_hanc/c*cen_s2b_shift
        gw_o1a = width_hanc/c*cen_o1a_shift
        gw_o1b = width_hanc/c*cen_o1b_shift
        gw_n2a = width_hanc/c*cen_n2a_shift
        gw_n2b = width_hanc/c*cen_n2b_shift
        gw_niiii7892 = width_hanc/c*cen_niiii7892_shift
        gw_ariii7138 = width_hanc/c*cen_ariii7138_shift
        gw_oii7321 = width_hanc/c*cen_oii7321_shift

        gw_hb2 = width_hb2/c*cen_hb2_shift

        gw_mg2ae = width_mg2ae/c*cen_mg2ae_shift
        gw_mg2be = width_mg2ae/c*cen_mg2be_shift

        gw_ha2 = width_ha2/c*cen_ha2_shift

        gw_o3asb = width_o3asb/c*cen_o3asb_shift
        gw_o3bsb = width_o3asb/c*cen_o3bsb_shift

        gw_s2asb = width_s2asb/c*cen_s2asb_shift
        gw_s2bsb = width_s2asb/c*cen_s2bsb_shift




      do j=1,jmax
         vl = vlam(j)
         flux_model(j) = anorm_pl*bpl(vl,wave_break,slope1,slope2)+
     *     anorm_Fe2t*flux_FeIIt(j)+					!6
     *     anorm_hb*val_line1(vl,cen_hb_shift,gw_hb)+			!7,8,9
     *     anorm_hdelta*val_line1(vl,cen_hdelta_shift,gw_hdelta)+	!10
     *     anorm_hgamma*val_line1(vl,cen_hgamma_shift,gw_hgamma)+	!11
     *     anorm_h8*val_line1(vl,cen_h8_shift,gw_h8)+			!12
     *     anorm_hepsilon*val_line1(vl,cen_hepsilon_shift,gw_hepsilon)+	!13
     *     anorm_mg2a*(ratio_mg2/(ratio_mg2+1))*
     *               val_line1(vl,cen_mg2a_shift,gw_mg2a)+		!14,15,16
     *     anorm_mg2a*(1/(ratio_mg2+1))*	
     *                val_line1(vl,cen_mg2b_shift,gw_mg2b)+
     *     anorm_oiii2672*val_line1(vl,cen_oiii2672_shift,gw_oiii2672)+	!17,18,19
     *     anorm_oiii3133*val_line1(vl,cen_oiii3133_shift,gw_oiii3133)+	!20
     *     anorm_heii4685*val_line1(vl,cen_heii4685_shift,gw_heii4685)+	!21,22,23
     *     anorm_hei3188*val_line1(vl,cen_hei3188_shift,gw_hei3188)+	!24
     *     anorm_hei3588*val_line1(vl,cen_hei3588_shift,gw_hei3588)+	!25
     *     anorm_hei3889*val_line1(vl,cen_hei3889_shift,gw_hei3889)+	!26
     *     anorm_hei5875*val_line1(vl,cen_hei5875_shift,gw_hei5875)+	!27
     *     anorm_o3a*(ratio_o3/(ratio_o3+1))*				!28,29,30
     *               val_line1(vl,cen_o3a_shift,gw_o3a)+	
     *     anorm_o3a*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3b_shift,gw_o3b)+
     *     anorm_hbnc*val_line1(vl,cen_hbnc_shift,gw_hbnc)+		!31
     *     anorm_heii4685nc*val_line1(vl,cen_heii4685nc_shift,		!32
     *			gw_heii4685nc)+				
     *     anorm_fevii5160*val_line1(vl,cen_fevii5160_shift,		!33		
     *	   gw_fevii5160)+
     *     anorm_fevi5177*val_line1(vl,cen_fevi5177_shift,gw_fevi5177)+	!34
     *     anorm_oiii4363*val_line1(vl,cen_oiii4363_shift,gw_oiii4363)+	!35
     *     anorm_ni5200*val_line1(vl,cen_ni5200_shift,gw_ni5200)+	!36
     *     anorm_cii2326*val_line1(vl,cen_cii2326_shift,gw_cii2326)+	!37
     *     anorm_neiv2423*val_line1(vl,cen_neiv2423_shift,gw_neiv2423)+	!38
     *     anorm_oii2471*val_line1(vl,cen_oii2471_shift,gw_oii2471)+	!39
     *     anorm_alii2669*val_line1(vl,cen_alii2669_shift,gw_alii2669)+	!40
     *     anorm_nev3346*val_line1(vl,cen_nev3346_shift,gw_nev3346)+	!41
     *     anorm_nev3426*val_line1(vl,cen_nev3426_shift,gw_nev3426)+	!42,43,44
     *     anorm_fevii3587*val_line1(vl,cen_fevii3587_shift,		!45
     *				     gw_fevii3587)+
     *     anorm_oii3728*val_line1(vl,cen_oii3728_shift,gw_oii3728)+	!46
     *     anorm_fevii3759*val_line1(vl,cen_fevii3759_shift,		!47
     *				gw_fevii3759)+	
     *     anorm_neiii3869*val_line1(vl,cen_neiii3869_shift,		!48
     *				gw_neiii3869)+
     *     anorm_neiii3968*val_line1(vl,cen_neiii3968_shift,		!49
     *				gw_neiii3968)+
     *     anorm_fev4072*val_line1(vl,cen_fev4072_shift,gw_fev4072)+	!50
     *     anorm_sii4073*val_line1(vl,cen_sii4073_shift,gw_sii4073)+	!51
     *     anorm_hb2*val_line1(vl,cen_hb2_shift,gw_hb2)+		!52,53,54
     *     anorm_mg2ae*(ratio_mg2/(ratio_mg2+1))*			!55,56,57
     *               val_line1(vl,cen_mg2ae_shift,gw_mg2ae)+
     *     anorm_mg2ae*(1/(ratio_mg2+1))*
     *                val_line1(vl,cen_mg2be_shift,gw_mg2be)+	
     *     anorm_o3asb*(ratio_o3/(ratio_o3+1))*				!58,59,60
     *			val_line1(vl,cen_o3asb_shift,gw_o3asb)+
     *     anorm_o3asb*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3bsb_shift,gw_o3bsb)+	
     *     anorm_hdeltanc*val_line1(vl,cen_hdeltanc_shift,gw_hdeltanc)+	!61
     *     anorm_hgammanc*val_line1(vl,cen_hgammanc_shift,gw_hgammanc)+	!62
     *     anorm_hei4472*val_line1(vl,cen_hei4472_shift,gw_hei4472)+	!63		
     *     anorm_balcont*flux_balcont(j)+				!64
     *     anorm_highbal*flux_highbal(j)+				!65
     *     anorm_Fe2t_opt*flux_FeIIt_opt(j)+				!66
     *     anorm_ha*val_line1(vl,cen_ha_shift,gw_ha)+			!67,68,69
     *     anorm_hanc*val_line1(vl,cen_hanc_shift,gw_hanc)+		!70,71,72
     *     anorm_s2a*val_line1(vl,cen_s2a_shift,gw_s2a)+		!73
     *     anorm_s2b*val_line1(vl,cen_s2b_shift,gw_s2b)+		!74
     *     anorm_o1a*(ratio_o1/(ratio_o1+1))*				!75
     *               val_line1(vl,cen_o1a_shift,gw_o1a)+	
     *     anorm_o1a*(1/(ratio_o1+1))*
     *                val_line1(vl,cen_o1b_shift,gw_o1b)+
     *     anorm_n2a*(ratio_n2/(ratio_n2+1))*				!76
     *               val_line1(vl,cen_n2a_shift,gw_n2a)+	
     *     anorm_n2a*(1/(ratio_n2+1))*
     *                val_line1(vl,cen_n2b_shift,gw_n2b)+
     *     anorm_ha2*val_line1(vl,cen_ha2_shift,gw_ha2)+		!77,78,79
     *     anorm_s2asb*val_line1(vl,cen_s2asb_shift,gw_s2asb)+		!80,81,82
     *     anorm_s2bsb*val_line1(vl,cen_s2bsb_shift,gw_s2bsb)+		!83
     *     anorm_hei7067*val_line1(vl,cen_hei7067_shift,gw_hei7067)+	!84
     *     anorm_ariii7138*val_line1(vl,cen_ariii7138_shift,
     *					gw_ariii7138)+  		!85
     *     anorm_fexi7894*val_line1(vl,cen_fexi7894_shift,gw_fexi7894)+  !86
     *     anorm_oii7321*val_line1(vl,cen_oii7321_shift,gw_oii7321)+       !87
     *     anorm_niiii7892*val_line1(vl,cen_niiii7892_shift,
     *				    gw_niiii7892)+ 			!88
     *     anorm_fevii6086*val_line1(vl,cen_fevii6086_shift,
     *				     gw_fevii6086)  !89
      end do
c      goto 632

      open(unit=15,file=output_data,status='unknown')



      open(unit=15,file=output_data,status='unknown')
      do j=1,jmax-1
          vl = vlam(j)
         write(15,*)vlam(j),flux(j),err_flux(j),
     *     flux_model(j),
     *	   anorm_pl*bpl(vl,wave_break,slope1,slope2),
     *     anorm_Fe2t*flux_FeIIt(j),					!6
     *     anorm_hb*val_line1(vl,cen_hb_shift,gw_hb),			!7,8,9
     *     anorm_hdelta*val_line1(vl,cen_hdelta_shift,gw_hdelta),	!10
     *     anorm_hgamma*val_line1(vl,cen_hgamma_shift,gw_hgamma),	!11
     *     anorm_h8*val_line1(vl,cen_h8_shift,gw_h8),			!12
     *     anorm_hepsilon*val_line1(vl,cen_hepsilon_shift,gw_hepsilon),	!13
     *     anorm_mg2a*(ratio_mg2/(ratio_mg2+1))*
     *               val_line1(vl,cen_mg2a_shift,gw_mg2a),		!14,15,16
     *     anorm_mg2a*(1/(ratio_mg2+1))*	
     *                val_line1(vl,cen_mg2b_shift,gw_mg2b),
     *     anorm_oiii2672*val_line1(vl,cen_oiii2672_shift,gw_oiii2672),	!17,18,19
     *     anorm_oiii3133*val_line1(vl,cen_oiii3133_shift,gw_oiii3133),	!20
     *     anorm_heii4685*val_line1(vl,cen_heii4685_shift,gw_heii4685),	!21,22,23
     *     anorm_hei3188*val_line1(vl,cen_hei3188_shift,gw_hei3188),	!24
     *     anorm_hei3588*val_line1(vl,cen_hei3588_shift,gw_hei3588),	!25
     *     anorm_hei3889*val_line1(vl,cen_hei3889_shift,gw_hei3889),	!26
     *     anorm_hei5875*val_line1(vl,cen_hei5875_shift,gw_hei5875),	!27
     *     anorm_o3a*(ratio_o3/(ratio_o3+1))*				!28,29,30
     *               val_line1(vl,cen_o3a_shift,gw_o3a),	
     *     anorm_o3a*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3b_shift,gw_o3b)+
     *     anorm_hbnc*val_line1(vl,cen_hbnc_shift,gw_hbnc),		!31
     *     anorm_heii4685nc*val_line1(vl,cen_heii4685nc_shift,		!32
     *			gw_heii4685nc),				
     *     anorm_fevii5160*val_line1(vl,cen_fevii5160_shift,		!33		
     *	   gw_fevii5160),
     *     anorm_fevi5177*val_line1(vl,cen_fevi5177_shift,gw_fevi5177),	!34
     *     anorm_oiii4363*val_line1(vl,cen_oiii4363_shift,gw_oiii4363),	!35
     *     anorm_ni5200*val_line1(vl,cen_ni5200_shift,gw_ni5200),	!36
     *     anorm_cii2326*val_line1(vl,cen_cii2326_shift,gw_cii2326),	!37
     *     anorm_neiv2423*val_line1(vl,cen_neiv2423_shift,gw_neiv2423),	!38
     *     anorm_oii2471*val_line1(vl,cen_oii2471_shift,gw_oii2471),	!39
     *     anorm_alii2669*val_line1(vl,cen_alii2669_shift,gw_alii2669),	!40
     *     anorm_nev3346*val_line1(vl,cen_nev3346_shift,gw_nev3346),	!41
     *     anorm_nev3426*val_line1(vl,cen_nev3426_shift,gw_nev3426),	!42,43,44
     *     anorm_fevii3587*val_line1(vl,cen_fevii3587_shift,		!45
     *				     gw_fevii3587),
     *     anorm_oii3728*val_line1(vl,cen_oii3728_shift,gw_oii3728),	!46
     *     anorm_fevii3759*val_line1(vl,cen_fevii3759_shift,		!47
     *				gw_fevii3759),	
     *     anorm_neiii3869*val_line1(vl,cen_neiii3869_shift,		!48
     *				gw_neiii3869),
     *     anorm_neiii3968*val_line1(vl,cen_neiii3968_shift,		!49
     *				gw_neiii3968),
     *     anorm_fev4072*val_line1(vl,cen_fev4072_shift,gw_fev4072),	!50
     *     anorm_sii4073*val_line1(vl,cen_sii4073_shift,gw_sii4073),	!51
     *     anorm_hb2*val_line1(vl,cen_hb2_shift,gw_hb2),		!52,53,54
     *     anorm_mg2ae*(ratio_mg2/(ratio_mg2+1))*			!55,56,57
     *               val_line1(vl,cen_mg2ae_shift,gw_mg2ae),
     *     anorm_mg2ae*(1/(ratio_mg2+1))*
     *                val_line1(vl,cen_mg2be_shift,gw_mg2be),	
     *     anorm_o3asb*(ratio_o3/(ratio_o3+1))*				!58,59,60
     *			val_line1(vl,cen_o3asb_shift,gw_o3asb),
     *     anorm_o3asb*(1/(ratio_o3+1))*
     *                val_line1(vl,cen_o3bsb_shift,gw_o3bsb),	
     *     anorm_hdeltanc*val_line1(vl,cen_hdeltanc_shift,gw_hdeltanc),	!61
     *     anorm_hgammanc*val_line1(vl,cen_hgammanc_shift,gw_hgammanc),	!62
     *     anorm_hei4472*val_line1(vl,cen_hei4472_shift,gw_hei4472),	!63		
     *     anorm_balcont*flux_balcont(j),				!64
     *     anorm_highbal*flux_highbal(j),				!65
     *     anorm_Fe2t_opt*flux_FeIIt_opt(j)+				!66
     *     anorm_ha*val_line1(vl,cen_ha_shift,gw_ha),			!67,68,69
     *     anorm_hanc*val_line1(vl,cen_hanc_shift,gw_hanc),		!70,71,72
     *     anorm_s2a*val_line1(vl,cen_s2a_shift,gw_s2a),		!73
     *     anorm_s2b*val_line1(vl,cen_s2b_shift,gw_s2b),		!74
     *     anorm_o1a*(ratio_o1/(ratio_o1+1))*				!75
     *               val_line1(vl,cen_o1a_shift,gw_o1a),	
     *     anorm_o1a*(1/(ratio_o1+1))*
     *                val_line1(vl,cen_o1b_shift,gw_o1b),
     *     anorm_n2a*(ratio_n2/(ratio_n2+1))*				!76
     *               val_line1(vl,cen_n2a_shift,gw_n2a),	
     *     anorm_n2a*(1/(ratio_n2+1))*
     *                val_line1(vl,cen_n2b_shift,gw_n2b),
     *     anorm_ha2*val_line1(vl,cen_ha2_shift,gw_ha2),		!77,78,79
     *     anorm_s2asb*val_line1(vl,cen_s2asb_shift,gw_s2asb),		!80,81,82
     *     anorm_s2bsb*val_line1(vl,cen_s2bsb_shift,gw_s2bsb),		!83
     *     anorm_hei7067*val_line1(vl,cen_hei7067_shift,gw_hei7067),	!84
     *     anorm_ariii7138*val_line1(vl,cen_ariii7138_shift,
     *					gw_ariii7138), 			!85
     *     anorm_fexi7894*val_line1(vl,cen_fexi7894_shift,gw_fexi7894),  !86
     *     anorm_oii7321*val_line1(vl,cen_oii7321_shift,gw_oii7321),       !87
     *     anorm_niiii7892*val_line1(vl,cen_niiii7892_shift,
     *				    gw_niiii7892),			!88
     *     anorm_fevii6086*val_line1(vl,cen_fevii6086_shift,
     *				     gw_fevii6086)  !89

       end do
       close(15)
c 632   continue

      sum = 0

        do j=1,jmax
           vl = vlam(j)
c         sum = sum+(flux(j)-flux_model(j))**2/(flux(j) + background(j))
c     *    *gain
           sum = sum+(flux(j)-flux_model(j))**2/
     *           (err_flux(j))**2 !denominador es el error
      !print *,'flux_model2', j,vl,flux(j), flux_model(j),sum,jmax
      end do

      chi2 = sum
      chi2_dof = sum/(jmax-par_free)

      print *, 'fit_jed_rys_chi2 =', chi2, 'fit_jed_rys_chi2/dof = ',
     *          chi2_dof, '  dof = ', jmax-par_free

      !!!!  VERIFICACION DE VALORES
      print *, 'hb_fitjed_rys:', anorm_hb,width_hb,shift_hb
      print *, 'hgamma_fitjed_rys:', anorm_hgamma,width_hgamma
     *			,shift_hgamma



      return
      end subroutine fit_jed_rys




      function bpl(vl,l_break,alpha1,alpha2)    ! broken powerlaw
       use params
       use one_spec
       implicit none
        !save bpl1

       real :: bpl
       real,intent(in) :: vl,alpha1,alpha2
       real,intent(in) :: l_break
       real :: val,suma,alpha,bpl1
       integer :: j

         if (vl.le.l_break) then
           alpha = alpha1
           suma = (vl/l_break)**(alpha1)
           !print*,'suma_1slope', suma, vl,alpha
         else
           alpha = alpha2
           suma = (vl/l_break)**(alpha2)
           !print*,'suma_2slope', suma,vl,alpha
         endif
       !print*,'vl suma', suma, vl

        bpl1 = suma 

       !print *,'bpl !!! ',vl,l_break, alpha1, alpha2,bpl1

       return 
      end function bpl




      function val_line1(vl,center,gw)    ! gaussian
       implicit none
        save val_lineg

       real :: val_line1
       real,intent(in) :: vl,center,gw
       real :: gwm,wyk,val_lineg

       gwm = gw/2.3548200
       wyk = (vl-center)**2/2./gwm**2
       val_lineg = 1.0/sqrt(2*3.14159)/gwm*exp(-wyk)
c      print *,'val_line ',vl,wyk,gwm,center,val_line1

       return
      end function val_line1




      function val_line2(vl,center,gw)   !Lorentzian
       implicit none
       save val_linel

       real :: val_line2
       real :: vl,center,gw,gwm,wyk
       real :: val_linel

       gwm = gw/2
       val_linel=gwm/3.14159/((vl-center)**2+gwm**2)

       return
      end function val_line2


      function log2(x)
      implicit none
      real x,log2
      log2 = 1.442695*log(x)
      return
      end





      subroutine read_Fe2t()
       use params
       use one_spec
       implicit none

       real :: sv
       real,dimension(fe2t_size) :: tab_lam_fe2t
       real,dimension(fe2t_size) :: tab_val_fe2t
       real :: v,tl,dl,gg,wyk
       real :: val,sum
       integer :: j,n

      sv = (smear_vel_fe2t/c*3000)/2.35482    ! in kms*s-1, around 1785

      print *, ' sv = ',sv
      print *,'smear_vel',smear_vel_fe2t
      print *, 'fe2 size routine',fe2t_size

      open(unit=14,file=Fe2t_data,status='old')


      do n=1,fe2t_size
        read(14,*) tab_lam_fe2t(n),tab_val_fe2t(n)
        !print *,'fe2 ',n,tab_lam_fe2t(n),tab_val_fe2t(n)
      end do


      close(14)
      print *,'fe2 complete'

      do j=1,jmax
         v = vlam(j)
        sum = 0
       do n=2,fe2t_size-1
            tl = tab_lam_fe2t(n)
            dl = 0.5*(tab_lam_fe2t(n+1)-tab_lam_fe2t(n-1))
            gg = sv*tl/3000.
            wyk = (v - tab_lam_fe2t(n))**2/2.0/gg**2
            if (wyk.gt.20) then
               val = 0
            else
               val = 1.0/gg/sqrt(2*3.14159)*exp(-wyk)
            end if
            sum = sum + tab_val_fe2t(n)*val*dl
         end do
         flux_FeIIt(j) = sum
         !print *, 'fe2_flux',v,flux_FeIIt(j)
      end do

c      print *, ' fe smeared'

c       stop
      return
      end subroutine read_Fe2t




      subroutine read_Fe2t_opt()
       use params
       use one_spec
       implicit none

       real :: sv
       real,dimension(fe2t_opt_size) :: tab_lam_fe2t_opt
       real,dimension(fe2t_opt_size) :: tab_val_fe2t_opt
       real :: v,tl,dl,gg,wyk
       real :: val,sum
       integer :: j,n

      sv = (smear_vel_fe2t/c*4500)/2.35482    ! in kms*s-1, around 1785

      print *, ' sv = ',sv
      print *,'smear_vel',smear_vel_fe2t
      print *, 'fe2_opt size routine',fe2t_opt_size

      open(unit=14,file=Fe2t_opt_data,status='old')


      do n=1,fe2t_opt_size
        read(14,*) tab_lam_fe2t_opt(n),tab_val_fe2t_opt(n)
        !print *,'fe2_opt',n,tab_lam_fe2t_opt(n),tab_val_fe2t_opt(n)
      end do


      close(14)
      print *,'fe2_opt complete'

      do j=1,jmax
         v = vlam(j)
        sum = 0
       do n=2,fe2t_opt_size-1
            tl = tab_lam_fe2t_opt(n)
            dl = 0.5*(tab_lam_fe2t_opt(n+1)-tab_lam_fe2t_opt(n-1))
            gg = sv*tl/4500.
            wyk = (v - tab_lam_fe2t_opt(n))**2/2.0/gg**2
            if (wyk.gt.20) then
               val = 0
            else
               val = 1.0/gg/sqrt(2*3.14159)*exp(-wyk)
            end if
            sum = sum + tab_val_fe2t_opt(n)*val*dl
         end do
         flux_FeIIt_opt(j) = sum
         !print *, 'fe2_opt_flux',v,flux_FeIIt_opt(j)
      end do

c      print *, ' fe_opt smeared'

c       stop
      return
      end subroutine read_Fe2t_opt




      subroutine read_balcont()
       use params
       use one_spec
       implicit none

       real :: sv
       real,dimension(balcont_size) :: tab_lam_balcont
       real,dimension(balcont_size) :: tab_val_balcont
       real :: v,tl,dl,gg,wyk
       real :: val,sum
       integer :: j,n

      open(unit=14,file=balcont_data,status='old')

      do n=1,balcont_size
        read(14,*) tab_lam_balcont(n),tab_val_balcont(n)
	flux_balcont(n) = tab_val_balcont(n)
        !print *,'balcont ',n,tab_lam_balcont(n),flux_balcont(n)
      end do

      close(14)
      print *, 'balcont read'

      return
      end subroutine read_balcont





      subroutine read_highbal()
       use params
       use one_spec
       implicit none

       real :: sv
       real,dimension(highbal_size) :: tab_lam_highbal
       real,dimension(balcont_size) :: tab_val_highbal
       real :: v,tl,dl,gg,wyk
       real :: val,sum
       integer :: j,n

      sv = (smear_vel_highbal/c*3000)/2.35482    ! in kms*s-1, around 1785

      print *, ' sv = ',sv
      print *,'smear_vel',smear_vel_highbal
      print *, 'highbal size routine',highbal_size

      open(unit=14,file=highbal_data,status='old')


      do n=1,highbal_size
        read(14,*) tab_lam_highbal(n),tab_val_highbal(n)
        !print *,'highbal ',n,tab_lam_highbal(n),tab_val_highbal(n)
      end do


      close(14)
      print *,'highbal file complete'

      do j=1,jmax
         v = vlam(j)
        sum = 0
       do n=2,highbal_size-1
            tl = tab_lam_highbal(n)
            dl = 0.5*(tab_lam_highbal(n+1)-tab_lam_highbal(n-1))
            gg = sv*tl/4500.
            wyk = (v - tab_lam_highbal(n))**2/2.0/gg**2
            if (wyk.gt.20) then
               val = 0
            else
               val = 1.0/gg/sqrt(2*3.14159)*exp(-wyk)
            end if
            sum = sum + tab_val_highbal(n)*val*dl
         end do
         flux_highbal(j) = sum
         !print *, 'highbal_flux',v,flux_highbal(j)
      end do

      return
      end subroutine read_highbal



      FUNCTION gasdev()
      use params
      implicit none
c      INTEGER idum
      REAL gasdev
C     3000USES ran2
c     returns a normally distributed deviate with zero mean and unit variance
      INTEGER iset
      REAL fac,gset,rsq,v1,v2,ran2
      SAVE iset,gset
      DATA iset/0/
      if (iset.eq.0) then
1       v1=2.*ran2()-1.
        v2=2.*ran2()-1.
        rsq=v1**2+v2**2
        if(rsq.ge.1..or.rsq.eq.0.)goto 1
        fac=sqrt(-2.*log(rsq)/rsq)
        gset=v1*fac
        gasdev=v2*fac
        iset=1
      else
        gasdev=gset
        iset=0
      endif
      return
      END



      FUNCTION ran2()
      use params
      implicit none
      INTEGER IM1,IM2,IMM1,IA1,IA2,IQ1,IQ2,IR1,IR2,NTAB,NDIV
      REAL ran2,AM,EPS,RNMX
      PARAMETER (IM1=2147483563,IM2=2147483399,AM=1./IM1,IMM1=IM1-1,
     *IA1=40014,IA2=40692,IQ1=53668,IQ2=52774,IR1=12211,IR2=3791,
     *NTAB=32,NDIV=1+IMM1/NTAB,EPS=1.2e-7,RNMX=1.-EPS)
      INTEGER idum2,j,k,iv(NTAB),iy
      SAVE iv,iy,idum2
      DATA idum2/123456789/, iv/NTAB*0/, iy/0/
      if (idum.lt.0) then
        idum=max(-idum,1)
        idum2=idum
        do 11 j=NTAB+8,1,-1
          k=idum/IQ1
          idum=IA1*(idum-k*IQ1)-k*IR1
          if (idum.lt.0) idum=idum+IM1
          if (j.le.NTAB) iv(j)=idum
11      continue
        iy=iv(1)
      endif
      k=idum/IQ1
      idum=IA1*(idum-k*IQ1)-k*IR1
      if (idum.lt.0) idum=idum+IM1
      k=idum2/IQ2
      idum2=IA2*(idum2-k*IQ2)-k*IR2
      if (idum2.lt.0) idum2=idum2+IM2
      j=1+iy/NDIV
      iy=iv(j)-idum2
      iv(j)=idum
      if(iy.lt.1)iy=iy+IMM1
      ran2=min(AM*iy,RNMX)
      return
      END
C  (C) Copr. 1986-92 Numerical Recipes Software .




c     MAIN PROGRAM
      program mean_prof
      use params
      use one_spec
      implicit none

       integer :: n,nmax
       real :: tab_lam,tab_val
       dimension tab_lam(91000),tab_val(91000)
       real :: tab_lam_fe2t,tab_val_fe2t
       !dimension tab_lam_fe2t(91000),tab_val_fe2t(91000)
       real,parameter :: xx=1000.0,yy=1000.0,zz=300.0
       real :: val_line1,res
       real :: gasdev
       real :: ran2

        real :: a
        integer icont

       call cpu_time(start)

       !integer, dimension(3) :: time

       idum = -10
c       print *, 'idu', idum

       call input_params()

       call obs_file()

       call read_Fe2t()

       call read_Fe2t_opt()

       call read_balcont()

       call read_highbal()

       print *, 'running...'

       call fit_auto_mcmc()

       call error_mcmc()

       call cpu_time(finish)

c       print*, 'Time =',(finish-start)/60

         print *, 'Execution time (min):',(finish-start)/60
	 write(15,*) '#Number of simulations:', ile_sim  !Number of simulations
	 write(15,*) '#Execution time (min.):',  (finish-start)/60  !It was opened in the error subroutine,
						 ! but it is closed to include the time
       close(15)



c      print*, 'test',val_line1(1000.0,1000.0,300.0)
c
c       print*, 'ran2 func',ran2(-2600)

      stop
      end
