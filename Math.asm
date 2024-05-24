section .bss
    num1 resb 1        ; Reserve 1 byte for the first digit
    num2 resb 1        ; Reserve 1 byte for the second digit
    operator resb 1    ; Reserve 1 byte for the operator
    result resb 1      ; Reserve 1 byte for the result

section .data
    input_msg db 'Enter first digit: ', 0   ; Prompt for the first digit
    input_msg_len equ $-input_msg           ; Length of the input_msg
    input2_msg db 'Enter second digit: ', 0 ; Prompt for the second digit
    input2_msg_len equ $-input2_msg         ; Length of the input2_msg
    operator_msg db 'Enter operator (+ or -): ', 0 ; Prompt for the operator
    operator_msg_len equ $-operator_msg     ; Length of the operator_msg
    output_msg db 'The result is: ', 0      ; Output message
    output_msg_len equ $-output_msg         ; Length of the output_msg

section .text
    global _start

_start:
    ; Read first digit
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, input_msg           ; Pointer to the input message
    mov edx, input_msg_len       ; Length of the input message
    int 0x80                     ; Make the system call to print the message

    mov eax, 3                   ; sys_read system call number
    mov ebx, 0                   ; File descriptor 0 is stdin
    mov ecx, num1                ; Pointer to the buffer for the first digit
    mov edx, 1                   ; Read 1 byte
    int 0x80                     ; Make the system call to read the digit

    ; Read second digit
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, input2_msg          ; Pointer to the input message for the second digit
    mov edx, input2_msg_len      ; Length of the input2 message
    int 0x80                     ; Make the system call to print the message

    mov eax, 3                   ; sys_read system call number
    mov ebx, 0                   ; File descriptor 0 is stdin
    mov ecx, num2                ; Pointer to the buffer for the second digit
    mov edx, 1                   ; Read 1 byte
    int 0x80                     ; Make the system call to read the digit

    ; Read operator
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, operator_msg        ; Pointer to the input message for the operator
    mov edx, operator_msg_len    ; Length of the operator message
    int 0x80                     ; Make the system call to print the message

    mov eax, 3                   ; sys_read system call number
    mov ebx, 0                   ; File descriptor 0 is stdin
    mov ecx, operator            ; Pointer to the buffer for the operator
    mov edx, 1                   ; Read 1 byte
    int 0x80                     ; Make the system call to read the operator

    ; Convert ASCII digits to integers
    movzx eax, byte [num1]       ; Move the first digit from memory to eax, zero-extend it
    sub eax, '0'                 ; Convert ASCII to integer by subtracting '0'
    mov [num1], eax              ; Store the integer value back in num1

    movzx eax, byte [num2]       ; Move the second digit from memory to eax, zero-extend it
    sub eax, '0'                 ; Convert ASCII to integer by subtracting '0'
    mov [num2], eax              ; Store the integer value back in num2

    ; Perform the operation
    mov al, byte [operator]      ; Move the operator from memory to al
    cmp al, '+'                  ; Compare the operator with '+'
    je addition                  ; If equal, jump to addition
    cmp al, '-'                  ; Compare the operator with '-'
    je subtraction               ; If equal, jump to subtraction

addition:
    mov al, byte [num1]          ; Move the first integer to al
    add al, byte [num2]          ; Add the second integer to al
    jmp done                     ; Jump to done

subtraction:
    mov al, byte [num1]          ; Move the first integer to al
    sub al, byte [num2]          ; Subtract the second integer from al
    jmp done                     ; Jump to done

done:
    ; Convert result back to ASCII
    add al, '0'                  ; Convert integer result to ASCII by adding '0'
    mov [result], al             ; Store the ASCII result in result

    ; Print the result
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, output_msg          ; Pointer to the output message
    mov edx, output_msg_len      ; Length of the output message
    int 0x80                     ; Make the system call to print the message

    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, result              ; Pointer to the result
    mov edx, 1                   ; Length of the result (1 byte)
    int 0x80                     ; Make the system call to print the result

    ; Exit the program
    mov eax, 1                   ; sys_exit system call number
    xor ebx, ebx                 ; Exit code 0
    int 0x80                     ; Make the system call to exit
section .bss
    num1 resb 1        ; Reserve 1 byte for the first digit
    num2 resb 1        ; Reserve 1 byte for the second digit
    operator resb 1    ; Reserve 1 byte for the operator
    result resb 1      ; Reserve 1 byte for the result

section .data
    input_msg db 'Enter first digit: ', 0   ; Prompt for the first digit
    input_msg_len equ $-input_msg           ; Length of the input_msg
    input2_msg db 'Enter second digit: ', 0 ; Prompt for the second digit
    input2_msg_len equ $-input2_msg         ; Length of the input2_msg
    operator_msg db 'Enter operator (+ or -): ', 0 ; Prompt for the operator
    operator_msg_len equ $-operator_msg     ; Length of the operator_msg
    output_msg db 'The result is: ', 0      ; Output message
    output_msg_len equ $-output_msg         ; Length of the output_msg

section .text
    global _start

_start:
    ; Read first digit
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, input_msg           ; Pointer to the input message
    mov edx, input_msg_len       ; Length of the input message
    int 0x80                     ; Make the system call to print the message

    mov eax, 3                   ; sys_read system call number
    mov ebx, 0                   ; File descriptor 0 is stdin
    mov ecx, num1                ; Pointer to the buffer for the first digit
    mov edx, 1                   ; Read 1 byte
    int 0x80                     ; Make the system call to read the digit

    ; Read second digit
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, input2_msg          ; Pointer to the input message for the second digit
    mov edx, input2_msg_len      ; Length of the input2 message
    int 0x80                     ; Make the system call to print the message

    mov eax, 3                   ; sys_read system call number
    mov ebx, 0                   ; File descriptor 0 is stdin
    mov ecx, num2                ; Pointer to the buffer for the second digit
    mov edx, 1                   ; Read 1 byte
    int 0x80                     ; Make the system call to read the digit

    ; Read operator
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, operator_msg        ; Pointer to the input message for the operator
    mov edx, operator_msg_len    ; Length of the operator message
    int 0x80                     ; Make the system call to print the message

    mov eax, 3                   ; sys_read system call number
    mov ebx, 0                   ; File descriptor 0 is stdin
    mov ecx, operator            ; Pointer to the buffer for the operator
    mov edx, 1                   ; Read 1 byte
    int 0x80                     ; Make the system call to read the operator

    ; Convert ASCII digits to integers
    movzx eax, byte [num1]       ; Move the first digit from memory to eax, zero-extend it
    sub eax, '0'                 ; Convert ASCII to integer by subtracting '0'
    mov [num1], eax              ; Store the integer value back in num1

    movzx eax, byte [num2]       ; Move the second digit from memory to eax, zero-extend it
    sub eax, '0'                 ; Convert ASCII to integer by subtracting '0'
    mov [num2], eax              ; Store the integer value back in num2

    ; Perform the operation
    mov al, byte [operator]      ; Move the operator from memory to al
    cmp al, '+'                  ; Compare the operator with '+'
    je addition                  ; If equal, jump to addition
    cmp al, '-'                  ; Compare the operator with '-'
    je subtraction               ; If equal, jump to subtraction

addition:
    mov al, byte [num1]          ; Move the first integer to al
    add al, byte [num2]          ; Add the second integer to al
    jmp done                     ; Jump to done

subtraction:
    mov al, byte [num1]          ; Move the first integer to al
    sub al, byte [num2]          ; Subtract the second integer from al
    jmp done                     ; Jump to done

done:
    ; Convert result back to ASCII
    add al, '0'                  ; Convert integer result to ASCII by adding '0'
    mov [result], al             ; Store the ASCII result in result

    ; Print the result
    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, output_msg          ; Pointer to the output message
    mov edx, output_msg_len      ; Length of the output message
    int 0x80                     ; Make the system call to print the message

    mov eax, 4                   ; sys_write system call number
    mov ebx, 1                   ; File descriptor 1 is stdout
    mov ecx, result              ; Pointer to the result
    mov edx, 1                   ; Length of the result (1 byte)
    int 0x80                     ; Make the system call to print the result

    ; Exit the program
    mov eax, 1                   ; sys_exit system call number
    xor ebx, ebx                 ; Exit code 0
    int 0x80                     ; Make the system call to exit
