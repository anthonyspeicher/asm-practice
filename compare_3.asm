section .text
  global _start


_start:

  mov eax,4 ; prompt for first number
  mov ebx,1
  mov ecx, msg1
  mov edx, len1
  int 0x80

  mov eax,3 ; read first number
  mov ebx,0
  mov ecx,num1
  mov edx,2
  int 0x80

  mov eax,4 ; prompt for second number
  mov ebx,1
  mov ecx, msg2
  mov edx, len2
  int 0x80

  mov eax,3 ; read second number
  mov ebx,0
  mov ecx,num2
  mov edx,2
  int 0x80

  mov eax,4 ; prompt for third number
  mov ebx,1
  mov ecx, msg3
  mov edx, len3
  int 0x80

  mov eax,3 ; read third number
  mov ebx,0
  mov ecx,num3
  mov edx,2
  int 0x80

  mov al, [num3] ; change inputs to numbers
  sub al, '0'
  mov [num3],al

  mov al, [num2]
  sub al, '0'
  mov [num2],al

  mov al, [num1]
  sub al, '0'
  mov [num1],al

  ; compare first two numbers
  cmp al, [num2]
  jg third_num
  mov al, [num2]

   third_num:

  cmp al, [num3] ; compare greater of first two with third number
  jg _exit
  mov al, [num3]


   _exit:
  add al, '0'
  mov [largest],al

  mov eax,4 ; output results
  mov ebx,1
  mov ecx,msg
  mov edx,len
  int 0x80

  mov eax,4
  mov ebx,1
  mov ecx,largest
  mov edx,2
  int 0x80

  mov eax,1
  int 0x80


section .data

  msg1 db "Enter the first number ", 0xA,0xD
  len1 equ $- msg1

  msg2 db "Enter the second number ", 0xA,0xD
  len2 equ $- msg2

  msg3 db "Enter the third number ", 0xA,0xD
  len3 equ $- msg3

  msg db "The largest digit is: ", 0xA,0xD
  len equ $- msg


section .bss

  num1 resb 2
  num2 resb 2
  num3 resb 2
  largest resb 2
