
;; title: hello-world-proposal
;; version:
;; summary:
;; description: A grant proposal that emits a hello world message.

;; traits
(impl-trait .proposal-trait.proposal-trait)
(impl-trait .proposal-trait.milestone-trait)
(impl-trait .extension-trait.extension-trait)
;;

;; token definitions
;;

;; constants
(define-constant ERR_PROPOSAL_FAILED (err 5000))
(define-constant grantee 'STNHKEPYEPJ8ET55ZZ0M5A34J0R3N5FM2CMMMAZ6)
;;

;; data vars
;;

;; data maps
;;

;; public functions
(define-public (execute (sender principal))
    (begin
        (print {event: "execute", message: "grant-proposal"})
        (ok (is-ok (mint-to-grantee)))
        ;; @todo The proposal should mark the milestone completed at block-height.
    )
)

(define-public (pay-for-milestone (deadline uint))
        (ok (is-ok (mint-to-grantee)))
)

(define-public (is-milestone-complete (milestone {proposal: principal, deadline: uint}))
    (ok true)
)

(define-public (callback (sender principal) (memo (buff 34)))
  (ok true)
)
;;

;; read only functions
;;

;; private functions

(define-private (mint-to-grantee)
        ;; @todo Make this a grant that sends trea
        (as-contract (contract-call? .membership-token mint u42 grantee))
)
;;

