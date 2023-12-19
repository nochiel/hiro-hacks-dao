
;; title: proposal-trait
;; version:
;; summary:
;; description:

;; traits
(define-trait proposal-trait
    (
        (execute (principal) (response bool uint)))
)

(define-trait milestone-trait
    (
        (is-milestone-complete ({proposal: principal, deadline: uint}) (response bool uint))
        (pay-for-milestone (uint) (response bool uint))
    )
)

;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;

