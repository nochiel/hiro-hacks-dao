
;; title: hello-world-proposal
;; version:
;; summary:
;; description: A grant proposal that emits a hello world message.

;; traits
(impl-trait .proposal-trait.proposal-trait)
;;

;; token definitions
;;

;; constants
(define-constant ERR_PROPOSAL_FAILED (err 5000))
;;

;; data vars
;;

;; data maps
;;

;; public functions
(define-private (mint-to-grantee (grantee principal))
        ;; @todo Make this a grant that sends trea
        (as-contract (contract-call? .membership-token mint u42 grantee))
)

(define-public (execute (sender principal))
    (let
        (
            (grantee 'STNHKEPYEPJ8ET55ZZ0M5A34J0R3N5FM2CMMMAZ6)
        )
        (print {event: "execute", message: "grant-proposal"})
        (ok (is-ok (mint-to-grantee grantee)))
    )
)
;;

;; read only functions
;;

;; private functions
;;

