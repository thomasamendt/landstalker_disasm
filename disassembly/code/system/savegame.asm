
; =============== S U B	R O U T	I N E =======================================


CheckSRAM:					  ; CODE XREF: ROM:0000050Cp

; FUNCTION CHUNK AT 00001520 SIZE 0000002C BYTES

		lea	(SRAM_MagicWord).l,a0
		lea	SRAM_ExpectedMagicWord(pc),a1 ;	"KAN&MAKIKO"
		moveq	#$00000009,d7

loc_14FE:					  ; CODE XREF: CheckSRAM+14j
		move.b	(a1)+,d0

loc_1500:					  ; DATA XREF: sub_D996+52o
		cmp.b	(a0),d0
		bne.s	SetSRAMMagicWord
		addq.w	#$02,a0
		dbf	d7,loc_14FE
		clr.b	d0
		bsr.s	CheckSaveCSums
		bsr.s	CheckSaveCSums
		bsr.s	CheckSaveCSums
		bsr.s	CheckSaveCSums
		rts
; End of function CheckSRAM


; =============== S U B	R O U T	I N E =======================================


CheckSaveCSums:					  ; CODE XREF: CheckSRAM+1Ap
						  ; CheckSRAM+1Cp ...
		bsr.s	VerifySaveslotCSum
		beq.s	loc_151C
		bsr.s	EraseSaveslot

loc_151C:					  ; CODE XREF: CheckSaveCSums+2j
		addq.b	#$01,d0
		rts
; End of function CheckSaveCSums

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckSRAM

SetSRAMMagicWord:				  ; CODE XREF: CheckSRAM+10j
		lea	(SRAM_MagicWord).l,a0
		lea	SRAM_ExpectedMagicWord(pc),a1 ;	"KAN&MAKIKO"
		moveq	#$00000009,d7

loc_152C:					  ; CODE XREF: CheckSRAM+3Ej
		move.b	(a1)+,(a0)
		addq.w	#$02,a0
		dbf	d7,loc_152C
		clr.b	d0
		bsr.s	EraseSaveslot
		move.b	#$01,d0
		bsr.s	EraseSaveslot
		move.b	#$02,d0
		bsr.s	EraseSaveslot
		move.b	#$03,d0
		bsr.s	EraseSaveslot
		rts
; END OF FUNCTION CHUNK	FOR CheckSRAM

; =============== S U B	R O U T	I N E =======================================


sub_154C:					  ; CODE XREF: ROM:0000EFD8p
		move.b	(g_SaveSlot).l,d0
; End of function sub_154C


; =============== S U B	R O U T	I N E =======================================


EraseSaveslot:					  ; CODE XREF: CheckSaveCSums+4p
						  ; CheckSRAM+44p ...
		bsr.s	GetSaveSlotAddress
		move.w	#$03FF,d7

loc_1558:					  ; CODE XREF: EraseSaveslot+Aj
		clr.b	(a0)
		addq.w	#$02,a0
		dbf	d7,loc_1558
		rts
; End of function EraseSaveslot

; ---------------------------------------------------------------------------
SRAM_ExpectedMagicWord:dc.b 'KAN&MAKIKO'          ; DATA XREF: CheckSRAM+6o
						  ; CheckSRAM+34o

; =============== S U B	R O U T	I N E =======================================


VerifySaveslotCSum:				  ; CODE XREF: CheckSaveCSumsp
						  ; SaveGame:loc_15B8p
		bsr.s	GetSaveSlotAddress
		clr.w	d1
		move.w	#$03FE,d7

loc_1574:					  ; CODE XREF: VerifySaveslotCSum+Cj
		add.b	(a0),d1
		addq.w	#$02,a0
		dbf	d7,loc_1574
		cmp.b	(a0),d1
		rts
; End of function VerifySaveslotCSum


; =============== S U B	R O U T	I N E =======================================


GetSaveSlotAddress:				  ; CODE XREF: EraseSaveslotp
						  ; VerifySaveslotCSump ...
		clr.w	d1
		move.b	d0,d1
		mulu.w	#$0800,d1
		lea	(SaveSlot1).l,a0
		adda.w	d1,a0
		rts
; End of function GetSaveSlotAddress


; =============== S U B	R O U T	I N E =======================================


SaveGame:					  ; CODE XREF: j_SaveGamej
						  ; CheckForDebugSaveGame+14p
		movem.l	d0-d1/d7-a2,-(sp)
		move.b	(g_SaveSlot).l,d0
		bsr.s	GetSaveSlotAddress
		lea	SaveGameRamPtrs(pc),a1

loc_15A2:					  ; CODE XREF: SaveGame+24j
		movea.l	(a1)+,a2
		cmpa.l	#$00000000,a2
		beq.s	loc_15B8
		move.w	(a1)+,d7

loc_15AE:					  ; CODE XREF: SaveGame+20j
		move.b	(a2)+,(a0)
		addq.w	#$02,a0
		dbf	d7,loc_15AE
		bra.s	loc_15A2
; ---------------------------------------------------------------------------

loc_15B8:					  ; CODE XREF: SaveGame+18j
		bsr.s	VerifySaveslotCSum
		move.b	d1,(a0)
		movem.l	(sp)+,d0-d1/d7-a2
		rts
; End of function SaveGame


; =============== S U B	R O U T	I N E =======================================


sub_15C2:					  ; CODE XREF: ROM:0000EF46p
						  ; sub_F78E+2p ...
		move.b	(g_SaveSlot).l,d0
		bsr.s	GetSaveSlotAddress
		lea	SaveGameRamPtrs(pc),a1

loc_15CE:					  ; CODE XREF: sub_15C2+20j
		movea.l	(a1)+,a2
		cmpa.l	#$00000000,a2
		beq.s	locret_15E4
		move.w	(a1)+,d7

loc_15DA:					  ; CODE XREF: sub_15C2+1Cj
		move.b	(a0),(a2)+
		addq.w	#$02,a0
		dbf	d7,loc_15DA
		bra.s	loc_15CE
; ---------------------------------------------------------------------------

locret_15E4:					  ; CODE XREF: sub_15C2+14j
		rts
; End of function sub_15C2


; =============== S U B	R O U T	I N E =======================================


sub_15E6:					  ; CODE XREF: ROM:0000EFA6p
		movem.w	d1,-(sp)
		bsr.s	GetSaveSlotAddress
		movea.l	a0,a1
		movem.w	(sp)+,d0
		bsr.s	GetSaveSlotAddress
		move.w	#$03FF,d7

loc_15F8:					  ; CODE XREF: sub_15E6+18j
		move.b	(a1),(a0)
		addq.w	#$02,a0
		addq.w	#$02,a1
		dbf	d7,loc_15F8
		rts
; End of function sub_15E6

; ---------------------------------------------------------------------------
		lea	SaveGameRamPtrs(pc),a1
		clr.w	d2

loc_160A:					  ; CODE XREF: ROM:00001616j
		cmpa.l	(a1),a0
		beq.s	loc_1618
		add.w	$00000004(a1),d2
		addq.w	#$01,d2
		addq.w	#$06,a1
		bra.s	loc_160A
; ---------------------------------------------------------------------------

loc_1618:					  ; CODE XREF: ROM:0000160Cj
		move.b	(g_SaveSlot).l,d0
		bsr.w	GetSaveSlotAddress
		add.w	d2,d2
		adda.w	d2,a0
		rts
; ---------------------------------------------------------------------------
SaveGameRamPtrs:dc.l g_Flags			  ; Address ; DATA XREF: SaveGame+Co
						  ; sub_15C2+8o ...
		dc.w $001F			  ; Length
		dc.l g_Inventory		  ; Address
		dc.w $003F			  ; Length
		dc.l g_ChestOpenFlags		  ; Address
		dc.w $003F			  ; Length
		dc.l Player_X			  ; Address
		dc.w $0001			  ; Length
		dc.l Player_RotationAndSize	  ; Address
		dc.w $0000			  ; Length
		dc.l g_RmNum1			  ; Address
		dc.w $0001			  ; Length
		dc.l g_Gold			  ; Address
		dc.w $0001			  ; Length
		dc.l Player_AttackStrength	  ; Address
		dc.w $0001			  ; Length
		dc.l Player_CurrentHealth	  ; Address
		dc.w $0001			  ; Length
		dc.l Player_Defence		  ; Address
		dc.w $0001			  ; Length
		dc.l Player_MaxHealth		  ; Address
		dc.w $0001			  ; Length
		dc.l g_RoomVisitedFlags		  ; Address
		dc.w $0063			  ; Length
		dc.l g_CurrentEquippedItems	  ; Address
		dc.w $0001			  ; Length
		dc.l g_EquippedSword		  ; Address
		dc.w $0000			  ; Length
		dc.l g_EquippedArmour		  ; Address
		dc.w $0000			  ; Length
		dc.l g_EquippedBoots		  ; Address
		dc.w $0000			  ; Length
		dc.l g_EquippedRing		  ; Address
		dc.w $0000			  ; Length
		dc.l g_FrameCount		  ; Address
		dc.w $0001			  ; Length
		dc.l g_MinuteCount		  ; Address
		dc.w $0001			  ; Length
		dc.l g_HourCount		  ; Address
		dc.w $0001			  ; Length
		dc.l g_Vars			  ; Address
		dc.w $001F			  ; Length
		dc.l g_PlayerStatus		  ; Address
		dc.w $0000			  ; Length
		dc.l RmNum2			  ; Address
		dc.w $0001			  ; Length
		dc.l $00000000