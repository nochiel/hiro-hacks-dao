
;; title: bootstrap
;; version:
;; summary:
;; description:

;; traits
(impl-trait .proposal-trait.proposal-trait)
;;

;; token definitions
;;

;; constants
(define-constant ERR_INITIAL_ALLOCATION (err u3000))
;;

;; data vars
;; @todo Add voter contracts.
(define-data-var voters (list 1337 principal)
                        (list tx-sender
                            'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5
                            'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
                            'ST2JHG361ZXG51QTKY2NQCVBPPRRE2KZB1HR05NNC
                            'ST2NEB84ASENDXKYGJPQW86YXQCEFEX2ZQPG87ND
                        ))
;;

;; data maps
;;

;; public functions


(define-public (execute (sender principal))
    (let
        (
            (vs (var-get voters))
            (result (mint-to-voters vs))
            (errors (filter is-error result))
        )

        ;; Sanity check
        (print errors)
        (if (> (len errors) u0)
            (ok false)
            (ok true))
        )
)

(define-public (callback (sender principal) (memo (buff 34)))
  (ok true))
;;

;; read only functions
;;

;; private functions

(define-private (is-error (v (response bool uint)))
    (is-err v)
)

(define-private (mint-iter (voter principal))
    ;; @note I don't need to assert if (neq voter 0x0). This isn't Solidity!
    (ok (unwrap! (as-contract (contract-call? .membership-token mint u42 voter))
                 ERR_INITIAL_ALLOCATION) )
)

(define-private (mint-to-voters (recipients (list 1337 principal)))
      (map mint-iter recipients)
)

;;
