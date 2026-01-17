section .text
  global _start


_start:

  mov ecx,10
  mov eax, '1'        ; initial number


l1:

  mov [num],eax       ; move number from eax to num
  mov eax,4
  mov ebx,1
  push ecx            ; push count var to stack

  mov ecx,num
  mov edx,1
  int 0x80            ; print current number

  mov eax,[num]
  sub eax, '0'
  inc eax             ; increment number
  add eax, '0'
  pop ecx             ; pop count from stack
  loop l1

  mov eax,1           ; exit
  int 0x80


section .bss

  num resb 1
