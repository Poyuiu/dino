// the coordinate field the black_score should output 1 when print "SCORE"
`define LetterS ((450 <= h_cnt) && (h_cnt < 470) && (30 <= v_cnt) && (v_cnt < 34)) || ((450 <= h_cnt) && (h_cnt < 470) && (48 <= v_cnt) && (v_cnt < 52)) || ((450 <= h_cnt) && (h_cnt < 470) && (66 <= v_cnt) && (v_cnt < 70)) || ((450 <= h_cnt) && (h_cnt < 454) && (30 <= v_cnt) && (v_cnt < 52)) || ((466 <= h_cnt) && (h_cnt < 470) && (48 <= v_cnt) && (v_cnt < 70))
`define LetterC ((480 <= h_cnt) && (h_cnt < 500) && (30 <= v_cnt) && (v_cnt < 34)) || ((480 <= h_cnt) && (h_cnt < 500) && (66 <= v_cnt) && (v_cnt < 70)) || ((480 <= h_cnt) && (h_cnt < 484) && (30 <= v_cnt) && (v_cnt < 70))
`define LetterO ((510 <= h_cnt) && (h_cnt < 530) && (30 <= v_cnt) && (v_cnt < 34)) || ((510 <= h_cnt) && (h_cnt < 530) && (66 <= v_cnt) && (v_cnt < 70)) || ((510 <= h_cnt) && (h_cnt < 514) && (30 <= v_cnt) && (v_cnt < 70)) || ((526 <= h_cnt) && (h_cnt < 530) && (30 <= v_cnt) && (v_cnt < 70))
`define LetterR ((540 <= h_cnt) && (h_cnt < 560) && (30 <= v_cnt) && (v_cnt < 34)) || ((540 <= h_cnt) && (h_cnt < 560) && (46 <= v_cnt) && (v_cnt < 50)) || ((540 <= h_cnt) && (h_cnt < 544) && (30 <= v_cnt) && (v_cnt < 70)) || ((556 <= h_cnt) && (h_cnt < 560) && (30 <= v_cnt) && (v_cnt < 50)) || ((552 <= h_cnt) && (h_cnt < 556) && (50 <= v_cnt) && (v_cnt < 54)) || ((554 <= h_cnt) && (h_cnt < 558) && (54 <= v_cnt) && (v_cnt < 58)) || ((556 <= h_cnt) && (h_cnt < 560) && (58 <= v_cnt) && (v_cnt < 70))
`define LetterE ((570 <= h_cnt) && (h_cnt < 590) && (30 <= v_cnt) && (v_cnt < 34)) || ((570 <= h_cnt) && (h_cnt < 590) && (48 <= v_cnt) && (v_cnt < 52)) || ((570 <= h_cnt) && (h_cnt < 590) && (66 <= v_cnt) && (v_cnt < 70)) || ((570 <= h_cnt) && (h_cnt < 574) && (30 <= v_cnt) && (v_cnt < 70))

// the coordinate parameter used to control the position of the later number
`define x3 450
`define x2 480
`define x1 510
`define x0 540
`define y2 90

// decimal bit 0
`define Zero0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0 <= h_cnt) && (h_cnt < `x0+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define One0	(`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40)
`define Two0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0 <= h_cnt) && (h_cnt < `x0+4) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+22))
`define Three0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Four0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0 <= h_cnt) && (h_cnt < `x0+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Five0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0 <= h_cnt) && (h_cnt < `x0+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Six0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0 <= h_cnt) && (h_cnt < `x0+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Seven0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Eight0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0 <= h_cnt) && (h_cnt < `x0+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Nine0	((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0 <= h_cnt) && (h_cnt < `x0+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x0 <= h_cnt) && (h_cnt < `x0+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x0+16 <= h_cnt) && (h_cnt < `x0+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))

// decimal bit 1
`define Zero1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1 <= h_cnt) && (h_cnt < `x1+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define One1	(`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40)
`define Two1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1 <= h_cnt) && (h_cnt < `x1+4) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+22))
`define Three1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Four1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1 <= h_cnt) && (h_cnt < `x1+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Five1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1 <= h_cnt) && (h_cnt < `x1+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Six1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1 <= h_cnt) && (h_cnt < `x1+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Seven1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Eight1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1 <= h_cnt) && (h_cnt < `x1+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Nine1	((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1 <= h_cnt) && (h_cnt < `x1+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x1 <= h_cnt) && (h_cnt < `x1+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x1+16 <= h_cnt) && (h_cnt < `x1+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))

// decimal bit 2
`define Zero2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2 <= h_cnt) && (h_cnt < `x2+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define One2	(`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40)
`define Two2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2 <= h_cnt) && (h_cnt < `x2+4) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+22))
`define Three2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Four2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2 <= h_cnt) && (h_cnt < `x2+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Five2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2 <= h_cnt) && (h_cnt < `x2+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Six2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2 <= h_cnt) && (h_cnt < `x2+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Seven2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Eight2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2 <= h_cnt) && (h_cnt < `x2+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Nine2	((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2 <= h_cnt) && (h_cnt < `x2+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x2 <= h_cnt) && (h_cnt < `x2+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x2+16 <= h_cnt) && (h_cnt < `x2+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))

// decimal bit 3
`define Zero3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3 <= h_cnt) && (h_cnt < `x3+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define One3	(`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40)
`define Two3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3 <= h_cnt) && (h_cnt < `x3+4) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+22))
`define Three3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Four3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3 <= h_cnt) && (h_cnt < `x3+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Five3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3 <= h_cnt) && (h_cnt < `x3+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Six3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3 <= h_cnt) && (h_cnt < `x3+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+40))
`define Seven3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Eight3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3 <= h_cnt) && (h_cnt < `x3+4) && (`y2 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
`define Nine3	((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+4)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+18 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3 <= h_cnt) && (h_cnt < `x3+20) && (`y2+36 <= v_cnt) && (v_cnt < `y2+40)) || ((`x3 <= h_cnt) && (h_cnt < `x3+4) && (`y2 <= v_cnt) && (v_cnt < `y2+22)) || ((`x3+16 <= h_cnt) && (h_cnt < `x3+20) && (`y2 <= v_cnt) && (v_cnt < `y2+40))
module score (
        input clk, // clock signal
        input rst, // reset signal
        input [9:0] h_cnt, // like x coordinate
        input [9:0] v_cnt, // like y coordinate
        input [1:0] state, // the game state
        input jump_op, // jump signal
        output reg black_score // for pixel
    );

    // game state
    parameter INITIAL = 2'b00;
    parameter PLAY = 2'b01;
    parameter Q_LEARNING = 2'b10;
    parameter DEAD = 2'b11;

    reg [31:0] score; // record the score, note that now we use
    reg [31:0] score_cnt; // control the speed of the score adding
    reg [31:0] next_score;
    reg [31:0] next_score_cnt;

    // detect the input h_cnt, v_cnt to determine the pixel should be black or not
    always @(posedge clk) begin
        if(rst) begin
            black_score <= 1'b0;
        end
        else begin
            if(`LetterS || `LetterC || `LetterO || `LetterR || `LetterE) begin
                black_score <= 1'b1; // display 'score'
            end
            else if(((score[3:0] == 0) && (`Zero0)) ||
                    ((score[3:0] == 4'd1) && (`One0)) ||
                    ((score[3:0] == 4'd2) && (`Two0)) ||
                    ((score[3:0] == 4'd3) && (`Three0)) ||
                    ((score[3:0] == 4'd4) && (`Four0)) ||
                    ((score[3:0] == 4'd5) && (`Five0)) ||
                    ((score[3:0] == 4'd6) && (`Six0)) ||
                    ((score[3:0] == 4'd7) && (`Seven0)) ||
                    ((score[3:0] == 4'd8) && (`Eight0)) ||
                    ((score[3:0] == 4'd9) && (`Nine0)) ||
                    // the above show bit 0 (right most)
                    ((score[7:4] == 0) && (`Zero1)) ||
                    ((score[7:4] == 1) && (`One1)) ||
                    ((score[7:4] == 2) && (`Two1)) ||
                    ((score[7:4] == 3) && (`Three1)) ||
                    ((score[7:4] == 4) && (`Four1)) ||
                    ((score[7:4] == 5) && (`Five1)) ||
                    ((score[7:4] == 6) && (`Six1)) ||
                    ((score[7:4] == 7) && (`Seven1)) ||
                    ((score[7:4] == 8) && (`Eight1)) ||
                    ((score[7:4] == 9) && (`Nine1))||
                    // the above show bit 1
                    ((score[11:8] == 0) && (`Zero2)) ||
                    ((score[11:8] == 1) && (`One2)) ||
                    ((score[11:8] == 2) && (`Two2)) ||
                    ((score[11:8] == 3) && (`Three2)) ||
                    ((score[11:8] == 4) && (`Four2)) ||
                    ((score[11:8] == 5) && (`Five2)) ||
                    ((score[11:8] == 6) && (`Six2)) ||
                    ((score[11:8] == 7) && (`Seven2)) ||
                    ((score[11:8] == 8) && (`Eight2)) ||
                    ((score[11:8] == 9) && (`Nine2))||
                    // the above show bit 2
                    ((score[15:12] == 0) && (`Zero3)) ||
                    ((score[15:12] == 1) && (`One3)) ||
                    ((score[15:12] == 2) && (`Two3)) ||
                    ((score[15:12] == 3) && (`Three3)) ||
                    ((score[15:12] == 4) && (`Four3)) ||
                    ((score[15:12] == 5) && (`Five3)) ||
                    ((score[15:12] == 6) && (`Six3)) ||
                    ((score[15:12] == 7) && (`Seven3)) ||
                    ((score[15:12] == 8) && (`Eight3)) ||
                    ((score[15:12] == 9) && (`Nine3)))
                //the above show bit 3
            begin
                black_score <= 1'b1;
            end
            else begin
                black_score <= 1'b0; // nothing == white
            end
        end
    end
    // the sequential part of behave the score changing
    always @(posedge clk) begin
        if(rst) begin
            score <= 32'b0;
            score_cnt <= 32'b0;
        end
        else begin
            score <= next_score;
            score_cnt <= next_score_cnt;
        end
    end
    // the combinational part of ..
    always @(*) begin
        case (state)
            INITIAL: begin // reset to zero
                next_score = 32'b0;
                next_score_cnt = 32'b0;
            end
            PLAY: begin
                if(score_cnt < 32'd25_000_000) begin
                    //use score cnt to control the time we want score add 1
                    next_score_cnt = score_cnt + 32'b1;
                    next_score = score;
                end
                else begin
                    next_score[31:16] = 16'b0; // the bitset we didn't use
                    next_score_cnt = 32'b0; // reset cnt to zero

                    // below is that let next_score[15:0] add one
                    // note that we need to perform it with decimal
                    // so bit [3:0] respond to dec bit 0 ,[7:4] -> dec bit 1 ...
                    if(score[3:0] == 4'b1001) begin // if reach 9 ,carry a number.
                        next_score[3:0] = 0;
                        if(score[7:4] == 4'b1001) begin // every dec bit check ...
                            next_score[7:4] = 0;
                            if(score[11:8] == 4'b1001) begin
                                next_score[11:8] = 0;
                                if(score[15:12] == 4'b1001) begin
                                    next_score[15:12] = 0;
                                end
                                else begin
                                    next_score[15:12] = score[15:12] + 4'b1;
                                end
                            end
                            else begin
                                next_score[11:8] = score[11:8] + 4'b1;
                                next_score[15:12] = score[15:12];
                            end
                        end
                        else begin // the above 'else' have same means
                            next_score[7:4] = score[7:4] + 4'b1;
                            next_score[15:8] = score[15:8];
                        end
                    end
                    else begin // if don't need carry, just plus one
                        next_score[3:0] = score[3:0] + 4'b1;
                        next_score[15:4] = score[15:4];
                        next_score[31:16] = 16'b0;
                    end
                end
            end
            Q_LEARNING: begin // the same as PLAY state
                if(score_cnt < 32'd25_000_000) begin
                    next_score_cnt = score_cnt + 32'b1;
                    next_score = score;
                end
                else begin
                    next_score_cnt = 32'b0;
                    next_score[31:16] = 16'b0;
                    if(score[3:0] == 4'b1001) begin//if reach 9 ,carry a number.
                        next_score[3:0] = 0;
                        if(score[7:4] == 4'b1001) begin
                            next_score[7:4] = 0;
                            if(score[11:8] == 4'b1001) begin
                                next_score[11:8] = 0;
                                if(score[15:12] == 4'b1001) begin
                                    next_score[15:12] = 0;
                                end
                                else begin
                                    next_score[15:12] = score[15:12] + 4'b1;
                                end
                            end
                            else begin
                                next_score[11:8] = score[11:8] + 4'b1;
                                next_score[15:12] = score[15:12];
                            end
                        end
                        else begin
                            next_score[7:4] = score[7:4] + 4'b1;
                            next_score[15:8] = score[15:8];
                            next_score[31:16] = 16'b0;
                        end
                    end
                    else begin
                        next_score[3:0] = score[3:0] + 4'b1;
                        next_score[15:4] = score[15:4];
                        next_score[31:16] = 16'b0;
                    end
                end
            end
            DEAD: begin // keep the score
                next_score = score;
                next_score_cnt = score_cnt;
            end
        endcase
    end
endmodule
