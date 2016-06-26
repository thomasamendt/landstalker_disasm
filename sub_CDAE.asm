; ---------------------------------------------------------------------------

RoomData	struc ;	(sizeof=0x8)											; XREF:	ROM:RoomData_0r
field_0:	dc.l ?													; offset (00000000)
field_4:	dc.b ?
field_5:	dc.b ?
field_6:	dc.b ?
field_7:	dc.b ?
RoomData	ends



; =============== S U B	R O U T	I N E =======================================


sub_CDAE:														; CODE XREF: GetTilemap+1Cp
		movem.l	d0-a5,-(sp)
		link	a6,#-$0018
		clr.w	d6
		clr.w	d4
		moveq	#$00000007,d7

loc_CDBC:														; CODE XREF: sub_CDAE+1Aj
		dbf	d6,loc_CDC4
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CDC4:														; CODE XREF: sub_CDAE:loc_CDBCj
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,loc_CDBC
		move.b	d4,(a1)+
		clr.w	d4
		moveq	#$00000007,d7

loc_CDD2:														; CODE XREF: sub_CDAE+30j
		dbf	d6,loc_CDDA
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CDDA:														; CODE XREF: sub_CDAE:loc_CDD2j
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,loc_CDD2
		move.b	d4,(a1)+
		clr.w	d4
		moveq	#$00000007,d7

loc_CDE8:														; CODE XREF: sub_CDAE+46j
		dbf	d6,loc_CDF0
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CDF0:														; CODE XREF: sub_CDAE:loc_CDE8j
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,loc_CDE8
		move.b	d4,(a1)+
		addq.w	#$01,d4
		add.w	d4,d4
		clr.w	d3
		moveq	#$00000007,d7

loc_CE02:														; CODE XREF: sub_CDAE+60j
		dbf	d6,loc_CE0A
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CE0A:														; CODE XREF: sub_CDAE:loc_CE02j
		add.b	d5,d5
		addx.w	d3,d3
		dbf	d7,loc_CE02
		addq.w	#$01,d3
		lsr.w	#$01,d3
		subq.w	#$01,d3
		move.b	d3,(a1)+
		addq.w	#$01,d3
		add.w	d3,d3
		mulu.w	d4,d3
		lea	(a1,d3.w),a3
		move.l	a1,-$00000004(a6)
		lsr.w	#$01,d3
		subq.w	#$01,d3
		movea.l	a3,a2
		moveq	#$00000000,d0

loc_CE30:														; CODE XREF: sub_CDAE+84j
		move.w	d0,-(a2)
		dbf	d3,loc_CE30
		clr.w	d0
		moveq	#$00000009,d7

loc_CE3A:														; CODE XREF: sub_CDAE+98j
		dbf	d6,loc_CE42
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CE42:														; CODE XREF: sub_CDAE:loc_CE3Aj
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d7,loc_CE3A
		move.w	d0,-$00000016(a6)
		clr.w	d0
		moveq	#$00000009,d7

loc_CE52:														; CODE XREF: sub_CDAE+B0j
		dbf	d6,loc_CE5A
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CE5A:														; CODE XREF: sub_CDAE:loc_CE52j
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d7,loc_CE52
		move.w	d0,-$00000018(a6)
		moveq	#$00000007,d3
		lea	-$00000014(a6),a2

loc_CE6C:														; CODE XREF: sub_CDAE+D4j
		clr.w	d0
		moveq	#$0000000B,d7

loc_CE70:														; CODE XREF: sub_CDAE+CEj
		dbf	d6,loc_CE78
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CE78:														; CODE XREF: sub_CDAE:loc_CE70j
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d7,loc_CE70
		move.w	d0,(a2)+
		dbf	d3,loc_CE6C
		movea.l	a1,a2
		subq.w	#$02,a2

loc_CE8A:														; CODE XREF: sub_CDAE+1A8j
															; sub_CDAE+1DCj
		moveq	#$FFFFFFFF,d1
		moveq	#$00000004,d0

loc_CE8E:														; CODE XREF: sub_CDAE+EAj
		dbf	d6,loc_CE96
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CE96:														; CODE XREF: sub_CDAE:loc_CE8Ej
		add.b	d5,d5
		dbcs	d1,loc_CE8E
		negx.w	d1
		dbf	d1,loc_CEA8
		addq.l	#$02,a2
		bra.w	loc_CEC4
; ---------------------------------------------------------------------------

loc_CEA8:														; CODE XREF: sub_CDAE+F0j
		lsl.w	d1,d0
		lea	(a2,d0.w),a2
		clr.w	d0

loc_CEB0:														; CODE XREF: sub_CDAE+10Ej
		dbf	d6,loc_CEB8
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CEB8:														; CODE XREF: sub_CDAE:loc_CEB0j
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d1,loc_CEB0
		add.w	d0,d0
		adda.w	d0,a2

loc_CEC4:														; CODE XREF: sub_CDAE+F6j
		cmpa.l	a3,a2
		bge.w	loc_CF94
		dbf	d6,loc_CED2
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CED2:														; CODE XREF: sub_CDAE+11Cj
		add.b	d5,d5
		bcs.s	loc_CF0A
		dbf	d6,loc_CEDE
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CEDE:														; CODE XREF: sub_CDAE+128j
		add.b	d5,d5
		bcs.s	loc_CEF6
		dbf	d6,loc_CEEA
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CEEA:														; CODE XREF: sub_CDAE+134j
		add.b	d5,d5
		bcs.s	loc_CEF2
		moveq	#$FFFFFFFF,d1
		bra.s	loc_CF4A
; ---------------------------------------------------------------------------

loc_CEF2:														; CODE XREF: sub_CDAE+13Ej
		moveq	#$00000002,d1
		bra.s	loc_CF4A
; ---------------------------------------------------------------------------

loc_CEF6:														; CODE XREF: sub_CDAE+132j
		dbf	d6,loc_CEFE
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CEFE:														; CODE XREF: sub_CDAE:loc_CEF6j
		add.b	d5,d5
		bcs.s	loc_CF06
		moveq	#$00000004,d1
		bra.s	loc_CF4A
; ---------------------------------------------------------------------------

loc_CF06:														; CODE XREF: sub_CDAE+152j
		move.w	d4,d1
		bra.s	loc_CF4A
; ---------------------------------------------------------------------------

loc_CF0A:														; CODE XREF: sub_CDAE+126j
		dbf	d6,loc_CF12
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CF12:														; CODE XREF: sub_CDAE:loc_CF0Aj
		add.b	d5,d5
		bcs.s	loc_CF2E
		dbf	d6,loc_CF1E
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CF1E:														; CODE XREF: sub_CDAE+168j
		add.b	d5,d5
		bcs.s	loc_CF28
		move.w	d4,d1
		add.w	d1,d1
		bra.s	loc_CF4A
; ---------------------------------------------------------------------------

loc_CF28:														; CODE XREF: sub_CDAE+172j
		move.w	d4,d1
		addq.w	#$02,d1
		bra.s	loc_CF4A
; ---------------------------------------------------------------------------

loc_CF2E:														; CODE XREF: sub_CDAE+166j
		clr.w	d1
		moveq	#$00000002,d7

loc_CF32:														; CODE XREF: sub_CDAE+190j
		dbf	d6,loc_CF3A
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CF3A:														; CODE XREF: sub_CDAE:loc_CF32j
		add.b	d5,d5
		addx.w	d1,d1
		dbf	d7,loc_CF32
		add.w	d1,d1
		move.w	-$00000014(a6,d1.w),d1
		add.w	d1,d1

loc_CF4A:														; CODE XREF: sub_CDAE+142j
															; sub_CDAE+146j ...
		move.w	d1,(a2)
		dbf	d6,loc_CF54
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CF54:														; CODE XREF: sub_CDAE+19Ej
		add.b	d5,d5
		bcc.w	loc_CE8A
		clr.w	d0
		dbf	d6,loc_CF64
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CF64:														; CODE XREF: sub_CDAE+1AEj
		add.b	d5,d5
		addx.w	d0,d0
		add.w	d0,d0
		movea.l	a2,a1

loc_CF6C:														; CODE XREF: sub_CDAE+1E4j
		move.w	d0,d3
		add.w	d4,d3

loc_CF70:														; CODE XREF: sub_CDAE+1D0j
		adda.w	d3,a1
		move.w	d1,(a1)
		dbf	d6,loc_CF7C
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CF7C:														; CODE XREF: sub_CDAE+1C6j
		add.b	d5,d5
		bcs.s	loc_CF70
		dbf	d6,loc_CF88
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CF88:														; CODE XREF: sub_CDAE+1D2j
		add.b	d5,d5
		bcc.w	loc_CE8A
		bchg	#$01,d0
		bra.s	loc_CF6C
; ---------------------------------------------------------------------------

loc_CF94:														; CODE XREF: sub_CDAE+118j
		movea.l	-$00000004(a6),a2
		movea.w	-$00000018(a6),a4
		movea.w	-$00000016(a6),a5
		move.w	#$FFFF,(a3)

loc_CFA4:														; CODE XREF: sub_CDAE+24Ej
															; sub_CDAE+254j ...
		move.w	(a2),d0
		bne.s	loc_CFAA
		jmp	(a1)
; ---------------------------------------------------------------------------

loc_CFAA:														; CODE XREF: sub_CDAE+1F8j
															; sub_CDAE+20Cj ...
		bmi.s	loc_CFD2
		neg.w	d0
		move.w	d0,d2
		lea	loc_CFB4,a1

loc_CFB4:														; DATA XREF: sub_CDAE+202o
		move.w	(a2,d2.w),(a2)+

loc_CFB8:														; CODE XREF: sub_CDAE+222j
		move.w	(a2),d0
		bne.s	loc_CFAA
		move.w	(a2,d2.w),(a2)+
		move.w	(a2),d0
		bne.s	loc_CFAA
		move.w	(a2,d2.w),(a2)+
		move.w	(a2),d0
		bne.s	loc_CFAA
		move.w	(a2,d2.w),(a2)+
		bra.s	loc_CFB8
; ---------------------------------------------------------------------------

loc_CFD2:														; CODE XREF: sub_CDAE:loc_CFAAj
		lea	loc_CFD8,a1
		nop

loc_CFD8:														; DATA XREF: sub_CDAE:loc_CFD2o
		cmpa.l	a2,a3
		bls.w	loc_D050
		dbf	d6,loc_CFE6
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CFE6:														; CODE XREF: sub_CDAE+230j
		add.b	d5,d5
		bcc.w	loc_D004
		dbf	d6,loc_CFF4
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_CFF4:														; CODE XREF: sub_CDAE+23Ej
		add.b	d5,d5
		bcs.s	loc_CFFE
		move.w	a4,(a2)+
		addq.w	#$01,a4
		bra.s	loc_CFA4
; ---------------------------------------------------------------------------

loc_CFFE:														; CODE XREF: sub_CDAE+248j
		move.w	a5,(a2)+
		addq.w	#$01,a5
		bra.s	loc_CFA4
; ---------------------------------------------------------------------------

loc_D004:														; CODE XREF: sub_CDAE+23Aj
		dbf	d6,loc_D00C
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D00C:														; CODE XREF: sub_CDAE:loc_D004j
		add.b	d5,d5
		bcs.s	loc_D02C
		clr.w	d0
		move.w	a4,d7
		beq.s	loc_D026

loc_D016:														; CODE XREF: sub_CDAE+276j
		dbf	d6,loc_D01E
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D01E:														; CODE XREF: sub_CDAE:loc_D016j
		add.b	d5,d5
		addx.w	d0,d0
		lsr.w	#$01,d7
		bne.s	loc_D016

loc_D026:														; CODE XREF: sub_CDAE+266j
		move.w	d0,(a2)+
		bra.w	loc_CFA4
; ---------------------------------------------------------------------------

loc_D02C:														; CODE XREF: sub_CDAE+260j
		clr.w	d0
		move.w	a5,d7
		sub.w	-$00000016(a6),d7
		beq.s	loc_D046

loc_D036:														; CODE XREF: sub_CDAE+296j
		dbf	d6,loc_D03E
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D03E:														; CODE XREF: sub_CDAE:loc_D036j
		add.b	d5,d5
		addx.w	d0,d0
		lsr.w	#$01,d7
		bne.s	loc_D036

loc_D046:														; CODE XREF: sub_CDAE+286j
		add.w	-$00000016(a6),d0
		move.w	d0,(a2)+
		bra.w	loc_CFA4
; ---------------------------------------------------------------------------

loc_D050:														; CODE XREF: sub_CDAE+22Cj
		movea.l	-$00000004(a6),a1
		lea	$00005C94(a1),a1
		movea.l	a1,a2
		clr.w	d3
		move.b	(a0)+,d3
		subq.w	#$01,d3
		move.w	d3,d4
		clr.w	d5
		move.b	(a0)+,d5
		subq.w	#$01,d5

loc_D068:														; CODE XREF: sub_CDAE+2E4j
		move.b	(a0)+,d0
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		clr.w	d1
		clr.w	d2

loc_D072:														; CODE XREF: sub_CDAE+2CAj
		move.b	(a0)+,d1
		add.w	d1,d2
		addq.b	#$01,d1
		beq.s	loc_D072

loc_D07A:														; CODE XREF: sub_CDAE:loc_D08Ej
		move.w	d0,(a2)+
		dbf	d4,loc_D08E
		lea	$00000094(a1),a1
		movea.l	a1,a2
		move.w	d3,d4
		dbf	d5,loc_D08E
		bra.s	loc_D094
; ---------------------------------------------------------------------------

loc_D08E:														; CODE XREF: sub_CDAE+2CEj
															; sub_CDAE+2DAj
		dbf	d2,loc_D07A
		bra.s	loc_D068
; ---------------------------------------------------------------------------

loc_D094:														; CODE XREF: sub_CDAE+2DEj
		unlk	a6
		movem.l	(sp)+,d0-a5
		rts
; End of function sub_CDAE

