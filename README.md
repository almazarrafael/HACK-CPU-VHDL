# HACK-CPU-VHDL

## description
A VHDL implementation of the HACK computer architecture.

## function

1. A fully working programmable 16-bit microprocessor based on the HACK computer architecture.
2. Features a whopping 64Kx16-bit RAM and 64Kx16-bit ROM for programming. Wow!

## installation
1. Clone the repo and use the VHDL files in whichever simulator you use. You may have to rearrange the files in order to get it to work for yours.
2. Edit the ROM VHDL file with the machine code that you would like to run. The currently loaded program is a simple up-counter.
3. Simulate.

## what I learned

1. Further solidifying the fundamentals of VHDL that I know.
2. A deeper understanding of computer architecture.
3. The overall VHDL design process.

## notes

I've always been interested in the intricacies that goes within a computer architecture. I've done nand2tetris before but I never got to finish it because I wasn't a fan of the 'fake' HDL that they had and that the tests were all done for you. I've also played a game aimed to recreated nand2tetris in a friendlier format but I found that too quick because all of the testing is done for you. So, in spirit of that, I implemented the same computer architecture on VHDL. There were a lot of blanks left as an exercise to the reader presented in the source book which leads to a lot of room for creativity to make it work.

## images
Microprocessor RTL Diagram
![Microprocessor RTL Diagram](https://raw.githubusercontent.com/almazarrafael/HACK-CPU-VHDL/main/RTL.png?token=ALHDSCRY6Y2UGEPKZR4RCGTALZMZW)

![Expanded](https://cdn.discordapp.com/attachments/805262594578448434/822590107533574174/unknown.png)

## resources

[The Elements of Computing Systems: Building a Modern Computer from First Principles](https://www.amazon.com/Elements-Computing-Systems-Building-Principles/dp/0262640686/ref=ed_oe_p)

[nand2tetris](https://www.nand2tetris.org/)

[nandgame](https://nandgame.com/)
