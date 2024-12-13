;;! target = "aarch64"
;;! test = "winch"

(module
    (func (param i32) (param i32) (result i32)
	(local.get 0)
	(local.get 1)
	(i32.div_s)
    )
)

;; wasm[0]::function[0]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       mov     x28, sp
;;       mov     x9, x0
;;       sub     sp, sp, #0x18
;;       mov     x28, sp
;;       stur    x0, [x28, #0x10]
;;       stur    x1, [x28, #8]
;;       stur    w2, [x28, #4]
;;       stur    w3, [x28]
;;       ldur    w0, [x28]
;;       ldur    w1, [x28, #4]
;;       cbz     x0, #0x60
;;   34: cmn     w0, #1
;;       ccmp    w1, #1, #0, eq
;;       b.vs    #0x64
;;   40: sxtw    x0, w0
;;       sxtw    x1, w1
;;       sdiv    x1, x1, x0
;;       mov     w0, w1
;;       add     sp, sp, #0x18
;;       mov     x28, sp
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;   60: .byte   0x1f, 0xc1, 0x00, 0x00
;;   64: .byte   0x1f, 0xc1, 0x00, 0x00